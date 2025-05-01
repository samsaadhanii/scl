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
        "(word"; w = IDENT; ")"; 
        "(rt"; r = IDENT; ")"; 
        "(pUrvapaxa"; cp = IDENT; ")"; 
        "(uwwarapaxa"; cu = IDENT; ")"; 
        "(lifgam"; ling = IDENT; ")"; 
        "(viBakwiH"; vib = INT; ")"; 
        "(vacanam"; vac = IDENT; ")"; 
        "(rel"; rel = IDENT; ")"; 
        "(toid"; toid = INT; ")"; 
        "(tocid"; tocid = INT; ")"; 
    ")" -> 
    (int_of_string s, int_of_string i, int_of_string c, w,r,cp,cu,ling,int_of_string vib,vac,rel, int_of_string toid, int_of_string tocid)
    ] ] ;

  wif:
    [ [ "(wif"; "(sid"; s = INT; ")"; 
        "(id"; i = INT; ")"; 
        "(cid"; c = INT; ")"; 
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
        "(tocid"; tocid = INT; ")"; 
    ")" -> 
    (int_of_string s, int_of_string i, int_of_string c,w,r,cp,cu,upa,san,voice,la,per,vac,padi,gana,rel, int_of_string toid, int_of_string tocid)
    ] ] ;

  kqw:
    [ [ "(kqw"; "(sid"; s = INT; ")"; 
        "(id"; i = INT; ")"; 
        "(cid"; c = INT; ")"; 
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
        "(tocid"; tocid = INT; ")"; 
    ")" -> 
    (int_of_string s, int_of_string i, int_of_string c,w,kqwrt,cp,cu,upa,san,kp,p,gana,r,cp,cu,ling,int_of_string vib,vac,rel, int_of_string toid, int_of_string tocid)
    ] ] ;

  avy:
    [ [ "(avy"; "(sid"; s = INT; ")"; 
        "(id"; i = INT; ")"; 
        "(cid"; c = INT; ")"; 
        "(word"; w = IDENT; ")"; 
        "(rt"; r = IDENT; ")"; 
        "(pUrvapaxa"; cp = IDENT; ")"; 
        "(uwwarapaxa"; cu = IDENT; ")"; 
        "(rel"; rel = IDENT; ")"; 
        "(toid"; toid = INT; ")"; 
        "(tocid"; tocid = INT; ")"; 
        ")" -> 
    (int_of_string s, int_of_string i, int_of_string c,w,r,cp,cu,rel,int_of_string toid,int_of_string tocid)
    ] ] ;

  avywaxXiwa:
    [ [ "(avywaxXiwa"; "(sid"; s = INT; ")"; 
               "(id"; i = INT; ")"; 
               "(cid"; c = INT; ")"; 
               "(word"; w = IDENT; ")"; 
               "(rt"; r = IDENT; ")"; 
               "(pUrvapaxa"; cp = IDENT; ")"; 
               "(uwwarapaxa"; cu = IDENT; ")"; 
               "(waxXiwa_prawyayaH"; taddhita = IDENT; ")"; 
               "(rel"; rel = IDENT; ")"; 
               "(toid"; toid = INT; ")"; 
               "(tocid"; tocid = INT; ")"; 
    ")" -> 
    (int_of_string s, int_of_string i, int_of_string c,w,r,cp,cu,taddhita,rel,int_of_string toid,int_of_string tocid)
    ] ] ;

  avykqw:
    [ [ "(avykqw"; "(sid"; s = INT; ")"; 
           "(id"; i = INT; ")"; 
           "(cid"; c = INT; ")"; 
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
           "(tocid"; tocid = INT; ")"; 
     ")" -> 
    (int_of_string s, int_of_string i, int_of_string c,w,r,cp,cu,upa,san,kqw,gana,rel,int_of_string toid,int_of_string tocid)
    ] ] ;
  waxXiwa:
    [ [ "(waxXiwa"; "(sid"; s = INT; ")"; 
            "(id"; i = INT; ")"; 
            "(cid"; c = INT; ")"; 
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
            "(tocid"; tocid = INT; ")"; 
    ")" -> 
    (int_of_string s, int_of_string i, int_of_string c,w,r,cp,cu,taddhita,ling,int_of_string vib,vac,rel,int_of_string toid,int_of_string tocid)
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
      { print_string  "\n\n"
      ; flush stdout 
      ; Format.eprintf "Lexical error: %a in line %a in example \n%!" 
               Error.print msg Loc.print loc 
      ; failwith "Parsing aborted\n"
      }
       | Loc.Exc_located loc (Stream.Error msg) -> do
      { print_string "\n\n"
      ; flush stdout 
      ; Format.eprintf "Syntax error: %s in example \n%!" msg 
      ; failwith "Parsing aborted\n"
      }
       | Loc.Exc_located loc ex -> do
      { print_string "\n"
      ; flush stdout 
      ; Format.eprintf "Fatal error in example \n%!" 
      ; raise ex
      }
       | ex -> raise ex
       ]  in morphs
;


value print_relation  = fun
  [ Relation (i1 , i2 , i3 , i4 , i5, i6, i7, i8, i9)  -> do
         { print_string  (string_of_int i1); print_string  " "
         ; print_string  (string_of_int i2); print_string  " "
         ; print_string  (string_of_int i3); print_string  " "
         ; print_string  i4; print_string  " "
         ; print_string  (string_of_int i5); print_string  " "
         ; print_string  (string_of_int i6); print_string  " "
         ; print_string  (string_of_int i7); print_string  " "
         ; print_string  i8; print_string  " "
         ; print_string  (string_of_int i9); print_string  "\n"
         } 
  ]
;

value print_rels = fun
  [ Wif (sid1,id1,cid1,word1,rt1,pUrvapaxa1,uwwarapaxa1,upasargaH1, samAxiH,prayogaH1,lakAra1,puruRaH1,vacanam1,paxI1,gaNa1,rel1,toid1,tocid1) -> do { print_int sid1; print_string " "; print_int id1; print_string " "; print_string word1; print_string "\n"}
  | _ -> ()
  ]
;

value rec print_relations = fun
[ [] -> ()
| [r :: s ] ->  let (a,b,c,d,e) = r in do {print_int a; print_string " "; print_int b; print_string " "; print_int c; print_string " "; print_string d; print_string " "; print_string e; print_string "\n"; print_relations s}
]
;

value rec gather_verb_positions acc = fun
[ [] -> acc (*do { print_relations acc; acc} *)
| [r :: s] -> match r with
              [ Wif (sid1,id1,cid1,word1,rt1,pUrvapaxa1,uwwarapaxa1,upasargaH1, samAxiH,prayogaH1,lakAra1,puruRaH1,vacanam1,paxI1,gaNa1,rel1,toid1,tocid1) ->
                      let acc1 = List.append acc [(sid1,id1,cid1,word1,rt1)]
                      in  gather_verb_positions acc1 s
	      | _ -> gather_verb_positions acc s
              ]
]
;

value rec get_wif_samucciwa_markers acc = fun
[ [] -> acc (*do { print_relations acc; acc}*)
| [r :: s] -> match r with
              [ Avy (sid1,id1,cid1,word1,rt1,pUrvapaxa1,uwwarapaxa1,rel1,toid1,tocid1) ->
             	   if (id1 = 2 || id1 = 3 ) && (word1 = "ca") then
                      let acc1 = List.append acc [(sid1,id1,cid1,word1,rt1)]
                      in get_wif_samucciwa_markers acc1 s
		   else get_wif_samucciwa_markers acc s
	      | _ -> get_wif_samucciwa_markers acc s
              ]
]
;

value rec get_wif_anyawara_markers acc = fun
[ [] -> acc (*do { print_relations acc; acc}*)
| [r :: s] -> match r with
              [ Avy (sid1,id1,cid1,word1,rt1,pUrvapaxa1,uwwarapaxa1,rel1,toid1,tocid1) ->
             	   if (id1 = 2 || id1 = 3 ) && (word1 = "vA") then
                      let acc1 = List.append acc [(sid1,id1,cid1,word1,rt1)]
                      in get_wif_anyawara_markers acc1 s
		   else get_wif_anyawara_markers acc s
	      | _ -> get_wif_anyawara_markers acc s
              ]
]
;

value rec get_aps_markers acc = fun
[ [] -> acc (*do { print_relations acc; acc}*)
| [r :: s] -> match r with
              [ Avy (sid1,id1,cid1,word1,rt1,pUrvapaxa1,uwwarapaxa1,rel1,toid1,tocid1) ->
             	   if ((word1 = "yaxi")|| (word1 = "warhi")) then
                      let acc1 = List.append acc [(sid1,id1,cid1,word1,rt1)]
                      in get_aps_markers acc1 s
		   else get_aps_markers acc s
	      | _ -> get_aps_markers acc s
              ]
]
;

value rec get_vyaBicAra_markers acc = fun
[ [] -> acc (*do { print_relations acc; acc}*)
| [r :: s] -> match r with
              [ Avy (sid1,id1,cid1,word1,rt1,pUrvapaxa1,uwwarapaxa1,rel1,toid1,tocid1) ->
             	   if ((word1 = "yaxyapi")|| (word1 = "waWApi")|| (word1="aWapi") || (word1="sannapi")||(word1="cexapi")) then
                      let acc1 = List.append acc [(sid1,id1,cid1,word1,rt1)]
                      in get_vyaBicAra_markers acc1 s
		   else get_vyaBicAra_markers acc s
	      | _ -> get_vyaBicAra_markers acc s
              ]
]
;

value rec get_kkb_markers acc = fun
[ [] -> acc (*do { print_relations acc; acc}*)
| [r :: s] -> match r with
              [ Avy (sid1,id1,cid1,word1,rt1,pUrvapaxa1,uwwarapaxa1,rel1,toid1,tocid1) ->
             	   if ((word1 = "yawaH")|| (word1 = "wawaH")|| (word1="wasmAw") || (word1="yasmAw") || (word1="awaH")) then
                      let acc1 = List.append acc [(sid1,id1,cid1,word1,rt1)]
                      in get_kkb_markers acc1 s
		   else get_kkb_markers acc s
	      | _ -> get_kkb_markers acc s
              ]
]
;

value rec get_niwya_sambanXa_markers acc = fun
[ [] -> acc (*do { print_relations acc; acc}*)
| [r :: s] -> match r with
              [ Avy (sid1,id1,cid1,word1,rt1,pUrvapaxa1,uwwarapaxa1,rel1,toid1,tocid1) ->
             	   if ((word1 = "yaxA")|| (word1 = "yaWA")|| (word1="yaxvaw") || (word1="yawra")
             	     || (word1 = "waxA")|| (word1 = "waWA")|| (word1="waxvaw") || (word1="wawra")) then
                      let acc1 = List.append acc [(sid1,id1,cid1,word1,rt1)]
                      in get_niwya_sambanXa_markers acc1 s
		   else get_niwya_sambanXa_markers acc s
	      | _ -> get_niwya_sambanXa_markers acc s
              ]
]
;

value rec get_aps_markers acc = fun
[ [] -> acc (*do { print_relations acc; acc}*)
| [r :: s] -> match r with
              [ Avy (sid1,id1,cid1,word1,rt1,pUrvapaxa1,uwwarapaxa1,rel1,toid1,tocid1) ->
             	   if ((word1 = "yaxi")|| (word1 = "warhi")) then
                      let acc1 = List.append acc [(sid1,id1,cid1,word1,rt1)]
                      in get_aps_markers acc1 s
		   else get_aps_markers acc s
	      | _ -> get_aps_markers acc s
              ]
]
;

value rec get_verb_pos pos index = fun 
[ [] -> (0,0,0,"a","a")
| [(sid,id,cid,w,r)::s] -> if ((pos = "prev" && sid = index-1) || (pos = "next" && sid = index+1) || (pos = "curr" && sid = index))
			      then (sid,id,cid,w,r)
			      else get_verb_pos pos index s
]
;


value get_two_root_pos word_marker = match word_marker with
                                     [
				     "yaxi" | "yaxyapi" | "yawaH" | "yasmAw" -> ("curr","next")
                                     | "warhi" | "waWApi" | "aWApi" | "sannapi" | "cexapi" | "wawaH" | "wasmAw" | "awaH" | "ca" | "vA" -> ("prev","curr")
				     | _ -> ("","")
                                     ] 
;

value get_rel_marker word_marker = match word_marker with
                                   [ "yaxi" -> "AvaSyakawA_xyowakaH"
				   | "warhi" -> "pariNAma_xyowakaH"
				   |"yawaH"| "yasmAw" -> "kArya_xyowakaH"
				   |"wawaH" | "wasmAw" | "awaH"  -> "kAraNa_xyowakaH"
				   |"yaxA" | "yaWA" | "yaxvaw" | "yawra" | "waxA" | "waWA" | "waxvaw" | "wawra" -> "niwya_sambanXaH"
				   | _ -> "WRONG"
				   ] 
;

value rec mark_relations acc rel rel_marker finite_verbs =  fun
[ [] -> acc
| [(sid_marker,id_marker,cid_marker,word_marker,rt_marker) :: s] -> 
				let (verb1_pos, verb2_pos) = get_two_root_pos word_marker in
				let (sid_v1, id_v1, cid_v1, word_v1, rt_v1) =  get_verb_pos verb1_pos sid_marker finite_verbs in
                                let (sid_v2, id_v2, cid_v2, word_v2, rt_v2) = get_verb_pos verb2_pos sid_marker finite_verbs in
			        let dist = if sid_v2> sid_v1 then sid_v2-sid_v1 else sid_v1-sid_v2 in
			        let acc1 = List2.union acc [Relation (sid_v2,id_v2,cid_v2,rel,sid_v1,id_v1,cid_v1,"rule1",dist)] in
				let new_rel_marker = if (rel_marker = "-") then get_rel_marker word_marker else rel_marker in
			        let acc2 = if (verb1_pos = "curr") then
					      List2.union acc1 [Relation (sid_marker,id_marker,cid_marker,new_rel_marker,sid_v1,id_v1,cid_v1,"rule2",dist)]
					   else 
					      List2.union acc1 [Relation (sid_marker,id_marker,cid_marker,new_rel_marker,sid_v2,id_v2,cid_v2,"rule3",dist)] in
			        mark_relations acc2 rel rel_marker finite_verbs s
]
;

value discourse_engine relations = 
	let finite_verbs = gather_verb_positions [] relations 
	and  samucciwa = get_wif_samucciwa_markers [] relations 
	and  anyawara = get_wif_anyawara_markers [] relations 
	and  aps_marker = get_aps_markers [] relations 
	and  vyaBicAra_marker = get_vyaBicAra_markers [] relations 
	and  kkb_marker = get_kkb_markers [] relations 
	and  niwya_marker = get_niwya_sambanXa_markers [] relations in
        let acc = mark_relations [] "samucciwa" "samucciwa_xyowakaH" finite_verbs samucciwa in
        let acc1 = mark_relations acc "anyawara" "anyawara_xyowakaH" finite_verbs anyawara in
        let acc2 = mark_relations acc1 "AvaSyakawA_pariNAma_sambanXaH" "-" finite_verbs aps_marker in
        let acc3 = mark_relations acc2 "vyaBicAra_xyowakaH" "vyaBicAraH" finite_verbs vyaBicAra_marker in
        let acc4 = mark_relations acc3 "kArya_kAraNa_BavaH" "-" finite_verbs kkb_marker in
        let acc5 = mark_relations acc4 "niwya_sambanXaH" "-" finite_verbs niwya_marker in
        acc5
;
      
value process relations = 
      (*do {
      List.iter print_rels relations  (* we print the input for verification *)
      ; *)
      let rel_lst = List.sort_uniq compare (discourse_engine relations) in
        let sorted_lst = List.rev (List.sort_uniq compare rel_lst) in do {
           List.iter (print_relation ) sorted_lst;
       }
      (*}*)
;


value main () = 
             let relations = analyse (Stream.of_channel stdin) in
              process relations
;
main()
;
