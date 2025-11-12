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

value yaWA_found = ref 0;


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
        "(rt"; kqwrt = IDENT; ")"; 
        "(pUrvapaxa"; cp = IDENT; ")"; 
        "(uwwarapaxa"; cu = IDENT; ")"; 
        "(upasarga"; upa = IDENT; ")"; 
        "(sanAxi_prawyayaH"; san = IDENT; ")"; 
        "(kqw_prawyayaH"; kp = IDENT; ")"; 
        "(prayogaH"; p = IDENT; ")"; 
        (*"(XAwuH"; rtwithiw = IDENT; ")"; *)
        "(gaNaH"; gana = IDENT; ")"; 
        "(kqw_pratipadika"; r = IDENT; ")"; 
        "(lifgam"; ling = IDENT; ")"; 
        "(viBakwiH"; vib = INT; ")"; 
        "(vacanam"; vac = IDENT; ")"; 
        "(rel"; rel = IDENT; ")"; 
        "(toid"; toid = INT; ")"; 
        "(tocid"; tocid = INT; ")"; 
    ")" -> 
    (int_of_string s, int_of_string i, int_of_string c,w,kqwrt,cp,cu,upa,san,kp,p,gana,r,ling,int_of_string vib,vac,rel, int_of_string toid, int_of_string tocid)
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
[ [] ->  acc  (* do {  print_string "acc = \n"; print_relations acc; acc} *)
| [r :: s] -> match r with
              [ Wif (sid1,id1,cid1,word1,rt1,pUrvapaxa1,uwwarapaxa1,upasargaH1,sanAxiH,prayogaH1,lakAra1,puruRaH1,vacanam1,paxI1,gaNa1,rel1,toid1,tocid1) ->
                      let acc1 = List.append acc [(sid1,id1,cid1,word1,rt1)]
                      in  gather_verb_positions acc1 s
              | Kqw (sid1,id1,cid1,word1,rt1,pUrvapaxa1,uwwarapaxa1,upasargaH1,sanAxiH1,kqw_pratya1,prayogaH1,gaNa1,kqw_pr1,lifgam1,viBakwiH1,vacanam1,rel1,toid1,tocid1) ->
			(*do { print_string "Kqw mapped"
		    ; *)if (toid1 = 0 && tocid1 = 0)
                    then  let acc1 = List.append acc [(sid1,id1,cid1,word1,rt1)] in
                          gather_verb_positions acc1 s
		    else gather_verb_positions acc s
			(*}*)
	      | _ -> gather_verb_positions acc s
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

value discourse_marker word = match word with
				[ "yaxi" | "yaxyapi" | "yawaH" | "yasmAw" | "yaxA" | "yawra" | "yaWA" | "yena" 
                                | "warhi" | "waWApi" | "aWApi" | "sannapi" | "cexapi" | "wawaH" | "wasmAw" 
                                | "awaH" | "ca" | "vA" | "waxA" | "wawra" | "waWA" | "wena" | "warhyapi" 
                                | "paranwu" | "kinwu" | "aWa" | "hi" | "cew" | "aWavA" | "yaxvA" | "uwa"
                                | "uwApi" | "uwasviw" | "aWaca" | "cApi" | "evaFca" | "api" | "ananwaram"  -> True
                                | _ -> False
                                ]
;

value get_two_root_pos word_marker = match word_marker with
                                     [
				     "yaxi" | "cew"| "yaxyapi" | "cexapi" | "sannapi" | "yawaH" | "yasmAw" | "yaxA" | "yawra" | "yaWA" | "yena" -> ("curr","next")
                                     | "warhi" | "waWApi" | "aWApi" | "wawaH" | "wasmAw" | "awaH" | "ca" | "vA" | "waxA" | "wawra" | "waWA" | "wena" | "warhyapi" | "paranwu" | "kinwu" | "aWa" | "hi" | "aWavA" | "yaxvA" | "uwa" | "uwApi" | "uwasviw" | "aWaca" | "cApi" | "evaFca" | "ananwaram" -> ("prev","curr")
				     | _ -> ("","")
                                     ] 
;

				     (*Unambiguous: "yaxi" | "cew"| "yaxyapi" | "cexapi" | "sannapi" | "yaxA" | "yawra"
                                     Unambiguous: "warhi" | "waWApi" | "aWApi" | "warhyapi" | "paranwu" | "kinwu" | "ananwaram" | "aWa"

                                     Ammbiguous: "yawaH" | "yasmAw" | "yena" (kArya-kAraNa, apAxAna)
                                     Ambiguous: "wawaH" | "wasmAw" | "wena" | "awaH" 
					Not a discourse marker if alone: waxA, wawra

					Structural Ambiguity: "ca" | "vA" | "waWA" |  "hi" | "aWavA" | "yaxvA" | "uwa" | "uwApi" | "uwasviw" | "aWaca" | "cApi" | "evaFca"  *)

value rec mark_niwya word sid id cid = fun
   [ [] -> []
   | [r :: s] -> match r with
              [Avy (sid1,id1,cid1,word1,rt1,_,_,rel1,toid1,tocid1)
              | Sup (sid1,id1,cid1,word1,rt1,_,_,_,_,_,rel1,toid1,tocid1)
              | Wif (sid1,id1,cid1,word1,rt1,_,_,_,_,_,_,_,_,_,_,rel1,toid1,tocid1)
              | Kqw (sid1,id1,cid1,word1,rt1,_,_,_,_,_,_,_,_,_,_,_,rel1,toid1,tocid1)
              | Avykqw (sid1,id1,cid1,word1,rt1,_,_,_,_,_,_,rel1,toid1,tocid1)
              | AvywaxXiwa (sid1,id1,cid1,word1,rt1,_,_,_,rel1,toid1,tocid1)
              | WaxXiwa (sid1,id1,cid1,word1,rt1,_,_,_,_,_,_,rel1,toid1,tocid1) ->
		  if sid1 = sid+1 then
                     let dist = if sid> sid1 then sid-sid1 else sid1-sid in
		     match word with
                     [ "yaxA" -> if word1="waxA"  then [Relation (sid1,id1,cid1,"niwya_sambanXaH",sid,id,cid,"rule20",dist)]
				 else mark_niwya word sid id cid s
                     | "waxA" -> if word1 = "yaxA" then [Relation (sid1,id1,cid1,"niwya_sambanXaH",sid,id,cid,"rule21",dist)]
				 else mark_niwya word sid id cid s
                     | "yawra" -> if word1 = "wawra" then [Relation (sid1,id1,cid1,"niwya_sambanXaH",sid,id,cid,"rule22",dist)]
				 else mark_niwya word sid id cid s
                     | "wawra" -> if word1 = "yawra" then [Relation (sid1,id1,cid1,"niwya_sambanXaH",sid,id,cid,"rule23",dist)]
				 else mark_niwya word sid id cid s
                     | "yaWA" -> if word1 = "waWA" then [Relation (sid1,id1,cid1,"niwya_sambanXaH",sid,id,cid,"rule24",dist)]
				 else mark_niwya word sid id cid s
                     | "waWA" -> if word1 = "yaWA" then [Relation (sid1,id1,cid1,"niwya_sambanXaH",sid,id,cid,"rule25",dist)]
				 else mark_niwya word sid id cid s
                     | "yaxvaw" -> if word1 = "waxvaw" then [Relation (sid1,id1,cid1,"niwya_sambanXaH",sid,id,cid,"rule26",dist)]
				 else mark_niwya word sid id cid s
                     | "waxvaw" -> if word1 = "yaxvaw" then [Relation (sid1,id1,cid1,"niwya_sambanXaH",sid,id,cid,"rule27",dist)] 
				 else mark_niwya word sid id cid s
		     | _ -> mark_niwya word sid id cid s
		     ]
		   else mark_niwya word sid id cid s 
	     ]
   ]

;

value rec mark_niwya_sambanXaH acc = fun
   [ [] -> acc
   | [r :: s] -> match r with
              [Avy (sid1,id1,cid1,word1,rt1,_,_,rel1,toid1,tocid1)
              | Sup (sid1,id1,cid1,word1,rt1,_,_,_,_,_,rel1,toid1,tocid1)
              | Wif (sid1,id1,cid1,word1,rt1,_,_,_,_,_,_,_,_,_,_,rel1,toid1,tocid1)
              | Kqw (sid1,id1,cid1,word1,rt1,_,_,_,_,_,_,_,_,_,_,_,rel1,toid1,tocid1)
              | Avykqw (sid1,id1,cid1,word1,rt1,_,_,_,_,_,_,rel1,toid1,tocid1)
              | AvywaxXiwa (sid1,id1,cid1,word1,rt1,_,_,_,rel1,toid1,tocid1)
              | WaxXiwa (sid1,id1,cid1,word1,rt1,_,_,_,_,_,_,rel1,toid1,tocid1) ->
			match word1 with
                        [ "yaxA" | "waxA" | "yawra" | "wawra" | "yaWA" | "waWA" | "yaxvaw" | "waxvaw" ->
                                 let acc1 = List2.union acc (mark_niwya word1 sid1 id1 cid1 s) in
                                 mark_niwya_sambanXaH acc1 s
                        | _ -> mark_niwya_sambanXaH acc s
			]
	      ]
]
;

value rec mark_relations acc finite_verbs = fun
[ [] -> acc
| [r :: s] -> match r with
              [Avy (sid1,id1,cid1,word1,rt1,_,_,rel1,toid1,tocid1)
              | Sup (sid1,id1,cid1,word1,rt1,_,_,_,_,_,rel1,toid1,tocid1)
              | Wif (sid1,id1,cid1,word1,rt1,_,_,_,_,_,_,_,_,_,_,rel1,toid1,tocid1)
              | Kqw (sid1,id1,cid1,word1,rt1,_,_,_,_,_,_,_,_,_,_,_,rel1,toid1,tocid1)
              | Avykqw (sid1,id1,cid1,word1,rt1,_,_,_,_,_,_,rel1,toid1,tocid1)
              | AvywaxXiwa (sid1,id1,cid1,word1,rt1,_,_,_,rel1,toid1,tocid1)
              | WaxXiwa (sid1,id1,cid1,word1,rt1,_,_,_,_,_,_,rel1,toid1,tocid1) ->
				if not (discourse_marker word1) then mark_relations acc finite_verbs s
                                else 
				    let (verb1_pos, verb2_pos) = get_two_root_pos word1 in
                                    let (sid_v1, id_v1, cid_v1, word_v1, rt_v1) =  get_verb_pos verb1_pos sid1 finite_verbs in
                                    let (sid_v2, id_v2, cid_v2, word_v2, rt_v2) = get_verb_pos verb2_pos sid1 finite_verbs in
                                    let dist = if sid_v2> sid_v1 then sid_v2-sid_v1 else sid_v1-sid_v2 in
                                if (sid_v1 = 0 || sid_v2 = 0) then mark_relations acc finite_verbs s
                                else match word1 with
                                ["aWa" ->  (*wawaH  is ambiguous and hence not included *)
                                    let acc1 = List2.union acc [Relation (sid_v2,id_v2,cid_v2,"ananwarakAlaH",sid_v1,id_v1,cid_v1,"rule1",dist)] in
				    let acc2 = List2.union acc1 [Relation (sid1,id1,cid1,"ananwara_xyowakaH",sid_v2,id_v2,cid_v2,"rule2",dist)] in
			            mark_relations acc2 finite_verbs s
                                | "ananwaram" -> 
                                    let acc1 = List2.union acc [Relation (sid_v2,id_v2,cid_v2,"ananwarakAlaH",sid_v1,id_v1,cid_v1,"rule1",dist)] in
			            mark_relations acc1 finite_verbs s
				| "yaxi" | "cew" ->
                                    let acc1 = List2.union acc [Relation (sid_v2,id_v2,cid_v2,"AvaSyakawA_pariNAma_sambanXaH",sid_v1,id_v1,cid_v1,"rule3",dist)] in
				    let acc2 = List2.union acc1 [Relation (sid1,id1,cid1,"AvaSyakawA_xyowakaH",sid_v1,id_v1,cid_v1,"rule4",dist)] in
			            mark_relations acc2 finite_verbs s
				| "warhi"  ->
                                    let acc1 = List2.union acc [Relation (sid_v2,id_v2,cid_v2,"AvaSyakawA_pariNAma_sambanXaH",sid_v1,id_v1,cid_v1,"rule5",dist)] in
				    let acc2 = List2.union acc1 [Relation (sid1,id1,cid1,"pariNAma_xyowakaH",sid_v2,id_v2,cid_v2,"rule6",dist)] in
			            mark_relations acc2 finite_verbs s
			(* Needs information of yogyawA
				 yawaH saH gacCawi, wawaH aham api gacCAmi -- ambiguous between apAxAna & hewu, hence discourse analysis postponed 
				 | "yawaH" |"yasmAw" | "yena"  -> 
                                    let acc1 = List2.union acc [Relation (sid_v1,id_v1,cid_v1,"kArya_kAraNa_BAvaH",sid_v2,id_v2,cid_v2,"rule7",dist)] in
				    let acc2 = List2.union acc1 [Relation (sid1,id1,cid1,"kAraNa_xyowakaH",sid_v1,id_v1,cid_v1,"rule8",dist)] in
			            mark_relations acc2 finite_verbs s
				| "wawaH" |"wasmAw" | "awaH" ->
                                    let acc1 = List2.union acc [Relation (sid_v1,id_v1,cid_v1,"kArya_kAraNa_BAvaH",sid_v2,id_v2,cid_v2,"rule9",dist)] in
				    let acc2 = List2.union acc1 [Relation (sid1,id1,cid1,"kArya_xyowakaH",sid_v2,id_v2,cid_v2,"rule10",dist)] in
			            mark_relations acc2 finite_verbs s  
                         *)
				| "wena"  ->
				    if(rel1 = "sambanXaH") || (rel1 = "hewuH")
                                    then let acc1 = List2.union acc [Relation (sid_v1,id_v1,cid_v1,"kArya_kAraNa_BAvaH",sid_v2,id_v2,cid_v2,"rule9",dist)] in
				         let acc2 = List2.union acc1 [Relation (sid1,id1,cid1,"kArya_xyowakaH",sid_v2,id_v2,cid_v2,"rule10",dist)] in
			                 mark_relations acc2 finite_verbs s
				    else mark_relations acc finite_verbs s
				| "hi" -> if (id1 = 2) then
                                    let acc1 = List2.union acc [Relation (sid_v2,id_v2,cid_v2,"kArya_kAraNa_BAvaH",sid_v1,id_v1,cid_v1,"rule9a",dist)] in
			            mark_relations acc1 finite_verbs s
				    else []
				| "yaxyapi" | "cexapi"  ->  (*aWApi *)
                                    let acc1 = List2.union acc [Relation (sid_v2,id_v2,cid_v2,"vyaBicAraH",sid_v1,id_v1,cid_v1,"rule11",dist)] in
				    let acc2 = List2.union acc1 [Relation (sid1,id1,cid1,"kAraNa_xyowakaH",sid_v1,id_v1,cid_v1,"rule12",dist)] in
			            mark_relations acc2 finite_verbs s
				| "waWApi" | "sannapi" | "warhyapi"  ->  (*aWApi *)
                                    let acc1 = List2.union acc [Relation (sid_v2,id_v2,cid_v2,"vyaBicAraH",sid_v1,id_v1,cid_v1,"rule11a",dist)] in
				    let acc2 = List2.union acc1 [Relation (sid1,id1,cid1,"kArya_xyowakaH",sid_v2,id_v2,cid_v2,"rule12a",dist)] in
			            mark_relations acc2 finite_verbs s
				| "paranwu" |"kinwu"  ->
                                    let acc1 = List2.union acc [Relation (sid_v2,id_v2,cid_v2,"viroXaH",sid_v1,id_v1,cid_v1,"rule13",dist)] in
				    let acc2 = List2.union acc1 [Relation (sid1,id1,cid1,"viroXa_xyowakaH",sid_v2,id_v2,cid_v2,"rule14",dist)] in
			            mark_relations acc2 finite_verbs s
				| "yaxA" (* |"waxA" only with yaxA -- to implement *) ->
                                    let acc1 = List2.union acc [Relation (sid_v2,id_v2,cid_v2,"samAnakAlaH",sid_v1,id_v1,cid_v1,"rule15",dist)] in
			            mark_relations acc1 finite_verbs s
				| "yawra" (* |"wawra" only with yawra -- to implement *) ->
                                    let acc1 = List2.union acc [Relation (sid_v2,id_v2,cid_v2,"samAnAXikaraNaH",sid_v1,id_v1,cid_v1,"rule16",dist)] in
			            mark_relations acc1 finite_verbs s
				(* | "waWA" ->
                                    let acc1 = List2.union acc [Relation (sid_v2,id_v2,cid_v2,"sAxqSyam",sid_v1,id_v1,cid_v1,"rule17",dist)] in
                                    let acc2 = List2.union acc1 [Relation (sid1,id1,cid1,"sAxqSya_xyowakaH",sid_v2,id_v2,cid_v2,"rule17a",dist)] in
			            mark_relations acc2 finite_verbs s
				  To stop False +ves धर्मं पालय. तथा सुखं लभसे 	-- This is not sAxqSyam *)
				| "waWA"  ->
				    if(rel1 = "sambanXaH") && (yaWA_found.val = 0)
                                    then let acc1 = List2.union acc [Relation (sid_v2,id_v2,cid_v2,"ananwarakAlaH",sid_v1,id_v1,cid_v1,"rule17b",dist)] in
                                         let acc2 = List2.union acc1 [Relation (sid1,id1,cid1,"ananwarakAla_xyowakaH",sid_v2,id_v2,cid_v2,"rule18a",dist)] in
			                 mark_relations acc2 finite_verbs s
				    else mark_relations acc finite_verbs s
				| "yaWA"  ->
				    do { yaWA_found.val := 1;
                                    let acc1 = List2.union acc [Relation (sid_v2,id_v2,cid_v2,"sAxqSyam",sid_v1,id_v1,cid_v1,"rule17b",dist)] in
                                    let acc2 = List2.union acc1 [Relation (sid1,id1,cid1,"sAxqSya_xyowakaH",sid_v1,id_v1,cid_v1,"rule17c",dist)] in
			            mark_relations acc2 finite_verbs s
				    }
				| "ca" | "api" | "cApi" | "aWaca" | "evaFca"  ->  (*aWApi *)
				    if(rel1 = "sambanXaH") 
                                    then let acc1 = List2.union acc [Relation (sid_v2,id_v2,cid_v2,"samuccayaH",sid_v1,id_v1,cid_v1,"rule18",dist)] in
                                         let acc2 = List2.union acc1 [Relation (sid1,id1,cid1,"samuccaya_xyowakaH",sid_v2,id_v2,cid_v2,"rule18a",dist)] in
			                 mark_relations acc2 finite_verbs s
				    else mark_relations acc finite_verbs s
				| "vA" | "uwa" | "yaxvA" | "aWavA" | "uwApi" | "uwasviw" ->
				    if(rel1 = "sambanXaH") 
                                    then let acc1 = List2.union acc [Relation (sid_v2,id_v2,cid_v2,"anyawaraH",sid_v1,id_v1,cid_v1,"rule19",dist)] in
			                 mark_relations acc1 finite_verbs s
				    else mark_relations acc finite_verbs s
				| _ -> mark_relations acc finite_verbs s

				]
              ]
]
;


value discourse_engine relations = 
	let finite_verbs = gather_verb_positions [] relations in
        let acc = mark_relations [] finite_verbs relations in 
        let acc1 = mark_niwya_sambanXaH acc relations in acc1
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
