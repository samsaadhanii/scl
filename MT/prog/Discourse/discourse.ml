(* Copyright: Amba Kulkarni (2024-2024) *)


(* open Paths; *)
open Scanf;

open Relations;
open Pada_structure; 

open Bank_lexer; 
module Gram = Camlp4.PreCast.MakeGram Bank_lexer 
;
open Bank_lexer.Token;

value morphs = Gram.Entry.mk "morphs"
;

value total_wrds = ref 0; 

value samucciwa = [];


(* Grammar of morph_analyses coming from sentence *)

EXTEND Gram
  GLOBAL: morphs;
  morphs:
    [ [ l = morph_rec; `EOI -> l
      | l = morph_rec -> failwith "Wrong morph data"
    ] ] ;
  morph_rec:
    [ [ -> []
      | l = morph_rec; t = morph ->  (* left (terminal) recursion essential *)
    l @ [ t ]
    ] ] ;
  morph:
    [ [ s = sup -> Sup s 
      | w = wif -> Wif w 
      | k = kqw -> Kqw k
      | a = avy -> Avy a
      | aw = avywaxXiwa -> AvywaxXiwa aw
      | ak = avykqw -> Avykqw ak
      | w = waxXiwa -> WaxXiwa w
    ] ] ;

  sup:
    [ [ "(sup"; "(sid"; s = INT; ")"; 
        "(id"; i = INT; ")"; 
        "(cid"; c = INT; ")"; 
        "(mid"; m = INT; ")"; 
        "(word"; w = IDENT; ")"; 
        "(rt"; r = IDENT; ")"; 
        "(pUrvapaxa"; cp = IDENT; ")"; 
        "(uwwarapaxa"; cu = IDENT; ")"; 
        "(lifgam"; ling = IDENT; ")"; 
        "(viBakwiH"; vib = INT; ")"; 
        "(vacanam"; vac = IDENT; ")"; 
        "(rel"; rel = IDENT; ")"; 
        "(toid"; toid = INT; ")"; 
        "(level"; lev = INT; ")";
    ")" -> 
    (int_of_string s, int_of_string i, int_of_string c, int_of_string m,w,r,cp,cu,ling,int_of_string vib,vac,rel, int_of_string toid, int_of_string lev)
    ] ] ;

  wif:
    [ [ "(wif"; "(sid"; s = INT; ")"; 
        "(id"; i = INT; ")"; 
        "(cid"; c = INT; ")"; 
        "(mid"; m = INT; ")"; 
        "(word"; w = IDENT; ")"; 
        "(rt"; r = IDENT; ")"; 
        "(pUrvapaxa"; cp = IDENT; ")"; 
        "(uwwarapaxa"; cu = IDENT; ")"; 
        "(upasarga"; upa = IDENT; ")"; 
        "(sanAxi_prawyayaH"; san = IDENT; ")"; 
        "(prayogaH"; voice = IDENT; ")"; 
        "(lakAraH"; la = IDENT; ")"; 
        "(puruRaH"; per = IDENT; ")"; 
        "(vacanam"; vac = IDENT; ")"; 
        "(paxI"; padi = IDENT; ")"; 
         (*"(XAwuH"; rtwithiw = IDENT; ")"; *)
        "(gaNaH"; gana = IDENT; ")"; 
        "(rel"; rel = IDENT; ")"; 
        "(toid"; toid = INT; ")"; 
        "(level"; lev = INT; ")";
    ")" -> 
    (int_of_string s, int_of_string i, int_of_string c,int_of_string m,w,r,cp,cu,upa,san,voice,la,per,vac,padi,gana,rel, int_of_string toid, int_of_string lev)
    ] ] ;

  kqw:
    [ [ "(kqw"; "(sid"; s = INT; ")"; 
        "(id"; i = INT; ")"; 
        "(cid"; c = INT; ")"; 
        "(mid"; m = INT; ")"; 
        "(word"; w = IDENT; ")"; 
        "(kqw_XAwu"; kqwrt = IDENT; ")"; 
        "(upasarga"; upa = IDENT; ")"; 
        "(sanAxi_prawyayaH"; san = IDENT; ")"; 
        "(kqw_prawyayaH"; kp = IDENT; ")"; 
        "(prayogaH"; p = IDENT; ")"; 
        (*"(XAwuH"; rtwithiw = IDENT; ")"; *)
        "(gaNaH"; gana = IDENT; ")"; 
        "(rt"; r = IDENT; ")"; 
        "(pUrvapaxa"; cp = IDENT; ")"; 
        "(uwwarapaxa"; cu = IDENT; ")"; 
        "(lifgam"; ling = IDENT; ")"; 
        "(viBakwiH"; vib = INT; ")"; 
        "(vacanam"; vac = IDENT; ")"; 
        "(rel"; rel = IDENT; ")"; 
        "(toid"; toid = INT; ")"; 
        "(level"; lev = INT; ")";
    ")" -> 
    (int_of_string s, int_of_string i, int_of_string c,int_of_string m,w,kqwrt,upa,san,kp,p,gana,r,cp,cu,ling,int_of_string vib,vac,rel, int_of_string toid, int_of_string lev)
    ] ] ;

  avy:
    [ [ "(avy"; "(sid"; s = INT; ")"; 
        "(id"; i = INT; ")"; 
        "(cid"; c = INT; ")"; 
        "(mid"; m = INT; ")"; 
        "(word"; w = IDENT; ")"; 
        "(rt"; r = IDENT; ")"; 
        "(pUrvapaxa"; cp = IDENT; ")"; 
        "(uwwarapaxa"; cu = IDENT; ")"; 
        "(rel"; rel = IDENT; ")"; 
        "(toid"; toid = INT; ")"; 
        "(level"; lev = INT; ")";")" -> 
    (int_of_string s, int_of_string i, int_of_string c,int_of_string m,w,r,cp,cu,rel,int_of_string toid,int_of_string lev)
    ] ] ;

  avywaxXiwa:
    [ [ "(avywaxXiwa"; "(sid"; s = INT; ")"; 
               "(id"; i = INT; ")"; 
               "(cid"; c = INT; ")"; 
               "(mid"; m = INT; ")"; 
               "(word"; w = IDENT; ")"; 
               "(rt"; r = IDENT; ")"; 
               "(pUrvapaxa"; cp = IDENT; ")"; 
               "(uwwarapaxa"; cu = IDENT; ")"; 
               "(waxXiwa_prawyayaH"; taddhita = IDENT; ")"; 
               "(rel"; rel = IDENT; ")"; 
               "(toid"; toid = INT; ")"; 
               "(level"; lev = INT; ")";
    ")" -> 
    (int_of_string s, int_of_string i, int_of_string c,int_of_string m,w,r,cp,cu,taddhita,rel,int_of_string toid,int_of_string lev)
    ] ] ;

  avykqw:
    [ [ "(avykqw"; "(sid"; s = INT; ")"; 
           "(id"; i = INT; ")"; 
           "(cid"; c = INT; ")"; 
           "(mid"; m = INT; ")"; 
           "(word"; w = IDENT; ")"; 
           "(rt"; r = IDENT; ")"; 
           "(pUrvapaxa"; cp = IDENT; ")"; 
           "(uwwarapaxa"; cu = IDENT; ")"; 
           "(upasarga"; upa = IDENT; ")";
           "(sanAxi_prawyayaH"; san = IDENT; ")";
           "(kqw_prawyayaH"; kqw = IDENT; ")"; 
           (*"(XAwuH"; rtwithiw = IDENT; ")"; *)
           "(gaNaH"; gana = IDENT; ")"; 
           "(rel"; rel = IDENT; ")"; 
           "(toid"; toid = INT; ")"; 
           "(level"; lev = INT; ")";
     ")" -> 
    (int_of_string s, int_of_string i, int_of_string c,int_of_string m,w,r,cp,cu,upa,san,kqw,gana,rel,int_of_string toid,int_of_string lev)
    ] ] ;
  waxXiwa:
    [ [ "(waxXiwa"; "(sid"; s = INT; ")"; 
            "(id"; i = INT; ")"; 
            "(cid"; c = INT; ")"; 
            "(mid"; m = INT; ")"; 
            "(word"; w = IDENT; ")"; 
            "(rt"; r = IDENT; ")"; 
            "(pUrvapaxa"; cp = IDENT; ")"; 
            "(uwwarapaxa"; cu = IDENT; ")"; 
            (*"(waxXiwa_rt"; taddhitart = IDENT; ")"; *)
            "(waxXiwa_prawyayaH"; taddhita = IDENT; ")"; 
            "(lifgam"; ling = IDENT; ")"; 
            "(viBakwiH"; vib = INT; ")"; 
            "(vacanam"; vac = IDENT; ")";
            "(rel"; rel = IDENT; ")"; 
            "(toid"; toid = INT; ")"; 
            "(level"; lev = INT; ")";
    ")" -> 
    (int_of_string s, int_of_string i, int_of_string c,int_of_string m,w,r,cp,cu,taddhita,ling,int_of_string vib,vac,rel,int_of_string toid,int_of_string lev)
    ] ] ;
END
;

value relation_array = Array.make 6001 "";

value split2 str fmt =  Scanf.sscanf str fmt (fun x y -> (x,y))
;

value rec read_file chin acc fmt =
      try let line = input_line chin in
      let (a,b) = split2 line fmt in 
      let acc = List.append acc [(a,b)] in
            read_file chin acc fmt
    with 
    [ End_of_file -> do { close_in chin; acc}
    ]
;

value read_list file fmt =
let chin = open_in file in
 read_file chin [] fmt
;

value encode rel = try List.assoc rel relations_encodings
           with [ Not_found -> 0 ]
;

value get_assoc key assoc_array =
     try 
	List.assoc key assoc_array
     with [ Not_found -> ""]
;

value analyse strm = let morphs = 
  try Gram.parse morphs Loc.ghost strm with
       [ Loc.Exc_located loc (Error.E msg) -> do
      { output_string stdout "\n\n"
      ; flush stdout 
      ; Format.eprintf "Lexical error: %a in line %a in example \n%!" 
               Error.print msg Loc.print loc 
      ; failwith "Parsing aborted\n"
      }
       | Loc.Exc_located loc (Stream.Error msg) -> do
      { output_string stdout "\n\n"
      ; flush stdout 
      ; Format.eprintf "Syntax error: %s in example \n%!" msg 
      ; failwith "Parsing aborted\n"
      }
       | Loc.Exc_located loc ex -> do
      { output_string stdout "\n"
      ; flush stdout 
      ; Format.eprintf "Fatal error in example \n%!" 
      ; raise ex
      }
       | ex -> raise ex
       ]  in morphs
;


value print_relation cho = fun
  [ Relation (i1 , i2 , i3 , i4 , i5 , i6, i7, i8, i9, i10, i11)  -> do
         { output_string cho (string_of_int i1); output_string cho " "
         ; output_string cho (string_of_int i2); output_string cho " "
         ; output_string cho (string_of_int i3); output_string cho " "
         ; output_string cho (string_of_int i4); output_string cho " "
         ; output_string cho i5; output_string cho " "
         ; output_string cho (string_of_int i6); output_string cho " "
         ; output_string cho (string_of_int i7); output_string cho " "
         ; output_string cho (string_of_int i8); output_string cho " "
         ; output_string cho (string_of_int i9); output_string cho "\n"
         ; output_string cho i10; output_string cho " "
         ; output_string cho (string_of_int i11); output_string cho "\n"
         } (* else ()*)
  ]
;

value rec gather_verb_positions acc = fun
[ [] -> acc
| [r :: s] -> match r with
              [ Wif (sid1,id1,cid1,mid1,word1,rt1,pUrvapaxa1,uwwarapaxa1,upasargaH1, samAxiH,prayogaH1,lakAra1,puruRaH1,vacanam1,paxI1,gaNa1,rel1,toid1,_) ->
                      let acc1 = List.append acc [(sid1,id1,cid1,mid1,word1,rt1)]
                      in  gather_verb_positions acc1 s
	      | _ -> gather_verb_positions acc s
              ]
]
;

value rec handle_wif_samucciwa acc = fun

[ [] -> acc
| [r :: s] -> match r with
              [ Avy (sid1,id1,cid1,mid1,word1,rt1,pUrvapaxa1,uwwarapaxa1,rel1,toid1,_) ->
             	   if (id1 = 2 || id1 = 3 ) && (rt1 = "ca") then
                      let acc1 = List.append acc [(sid1,id1,cid1,mid1,word1,rt1)]
                      in handle_wif_samucciwa acc1 s
		   else handle_wif_samucciwa acc s
	      | _ -> handle_wif_samucciwa acc s
              ]
]
;

value rec get_verb_pos pos index = fun 
[ [] -> (0,0,0,0,"a","a")
| [(sid,id,cid,mid,w,r)::s] -> if ((pos = "prev" && sid = index-1) || (pos = "next" && sid = index+1))
			      then (sid,id,cid,mid,w,r)
			      else get_verb_pos pos index s
]
;


value rec mark_relations acc finite_verbs =  fun
[ [] -> acc
| [(sid1,id1,cid1,mid1,word1,rt1) :: s] -> let (sid_i, id_i, cid_i, mid_i, word_i, rt_i) =  get_verb_pos "prev" sid1 finite_verbs in
                                           let (sid_j, id_j, cid_j, mid_j, word_j, rt_j) = get_verb_pos "next" sid1 finite_verbs in
					   let acc1 = List.append acc [(sid_i,id_i,cid_i,mid_i,"samucciwam",sid_j,id_j,cid_j,mid_j)] in
					   mark_relations acc1 finite_verbs s
]
;

value discourse_engine relations = 
	let finite_verbs = gather_verb_positions [] relations 
	and  samucciwa = handle_wif_samucciwa [] relations in
	(*let acc3 = handle_wif_anyawara acc2 relations in
	let acc4 = handle_niwya_sambanXa1 acc3 relations in
	let acc5 = handle_niwya_sambanXa2 acc4 relations in
	let acc6 = handle_discourse_connectives1 acc5 relations in
	let acc7 = handle_discourse_connectives2 acc6 relations in *)
        let acc = mark_relations [] finite_verbs samucciwa in
        acc
;
      
value process relations tfpath = 
  let offline_file = tfpath^"discourse.txt"  in
  let cho = open_out offline_file in
      (* List.iter print_morph_id relations  (* we print the input for verification *)
      ;*) 
      let rel_lst = List.sort_uniq compare (discourse_engine relations) in
        let sorted_lst = List.rev (List.sort_uniq compare rel_lst) in do {
           List.iter (print_relation cho) sorted_lst;
           flush cho;
           close_out cho;
       }
;


value main () = if (Array.length Sys.argv < 2 ) then do
           { print_string "\n\n"
           ; print_string "Usage: ./build_graph tmp_file_path Prose|Sloka\n\n"
           ; failwith "Parsing aborted\n"
           } 
        else 
            let tfpath = Sys.argv.(1)
             and relations = analyse (Stream.of_channel stdin) in
              process relations tfpath
;
main()
;
