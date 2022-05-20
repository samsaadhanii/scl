(* Copyright: Amba Kulkarni (2014-2022) 
 * Sanjeev Panchal (2015-2020) *)


open Paths;
open Scanf;

open Pada_structure; (* corresponds to clips_head.txt *)

open Bank_lexer; 
module Gram = Camlp4.PreCast.MakeGram Bank_lexer 
;
open Bank_lexer.Token;

open Constraint;

value morphs = Gram.Entry.mk "morphs"
;

(* Global Variables *)
value finite_verb_in_sentence = ref 1000; 
value iwi_pos = ref 1000;  (* Assumption: A sentence has less than 1000 words *)
(*value evam_pos = ref 1000;*)  (* Assumption: A sentence has less than 1000 words *)
value yaxA_pos = ref 1000; 
value yaWA_pos = ref 1000; 
value waWA_pos = ref 1000; 
value waxA_pos = ref 1000; 
value yawra_pos = ref 1000; 
value wawra_pos = ref 1000; 
value yaxi_pos = ref 1000; 
value warhi_pos = ref 1000; 
value waw_pos = ref 1000; 
value cew_pos = ref 1000;
value yawaH_pos = ref 1000; 
value awaH_pos = ref 1000; 
value wawaH_pos = ref 1000; 
value yaxyapi_pos = ref 1000;
value waWApi_pos = ref 1000; 
value aWApi_pos = ref 1000; 
value yAvaw_pos = ref 1000;
value wAvaw_pos = ref 1000; 
value kinwu_pos = ref 1000; 
value apiwu_pos = ref 1000; 
value paranwu_pos = ref 1000; 
value aWa_pos = ref 1000; 
value yaw_pos = ref 1000; 
value yasmAw_pos = ref 1000; 
value wasmAw_pos = ref 1000; 
value hi_pos = ref 1000; 
value yax_pos = ref 1000; 
value wvam_pos = ref 1000; 
value karwqsamverbs = ref 1000; 
value total_wrds = ref 0; 

value datapath = sclinstalldir ^ "/MT/prog/kAraka/Prepare_Graph/DATA/";

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
    [ [ "(sup"; "(id"; i = INT; ")"; 
        "(mid"; m = INT; ")"; 
        "(word"; w = IDENT; ")"; 
        "(rt"; r = IDENT; ")"; 
        "(pUrvapaxa"; cp = IDENT; ")"; 
        "(uwwarapaxa"; cu = IDENT; ")"; 
        "(lifgam"; ling = IDENT; ")"; 
        "(viBakwiH"; vib = INT; ")"; 
        "(vacanam"; vac = IDENT; ")"; 
        "(level"; lev = INT; ")";
    ")" -> 
    (int_of_string i,int_of_string m,w,r,cp,cu,ling,int_of_string vib,vac,int_of_string lev)
    ] ] ;

  wif:
    [ [ "(wif"; "(id"; i = INT; ")"; 
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
        "(XAwuH"; rtwithiw = IDENT; ")"; 
        "(gaNaH"; gana = IDENT; ")"; 
        "(level"; lev = INT; ")";
    ")" -> 
    (int_of_string i,int_of_string m,w,r,cp,cu,upa,san,voice,la,per,vac,padi,rtwithiw,gana,int_of_string lev)
    ] ] ;

  kqw:
    [ [ "(kqw"; "(id"; i = INT; ")"; 
        "(mid"; m = INT; ")"; 
        "(word"; w = IDENT; ")"; 
        "(kqw_XAwu"; kqwrt = IDENT; ")"; 
        "(upasarga"; upa = IDENT; ")"; 
        "(sanAxi_prawyayaH"; san = IDENT; ")"; 
        "(kqw_prawyayaH"; kp = IDENT; ")"; 
        "(prayogaH"; p = IDENT; ")"; 
        "(XAwuH"; rtwithiw = IDENT; ")"; 
        "(gaNaH"; gana = IDENT; ")"; 
        "(rt"; r = IDENT; ")"; 
        "(pUrvapaxa"; cp = IDENT; ")"; 
        "(uwwarapaxa"; cu = IDENT; ")"; 
        "(lifgam"; ling = IDENT; ")"; 
        "(viBakwiH"; vib = INT; ")"; 
        "(vacanam"; vac = IDENT; ")"; 
        "(level"; lev = INT; ")";
    ")" -> 
    (int_of_string i,int_of_string m,w,kqwrt,upa,san,kp,p,rtwithiw,gana,r,cp,cu,ling,int_of_string vib,vac,int_of_string lev)
    ] ] ;

  avy:
    [ [ "(avy"; "(id"; i = INT; ")"; 
        "(mid"; m = INT; ")"; 
        "(word"; w = IDENT; ")"; 
        "(rt"; r = IDENT; ")"; 
        "(pUrvapaxa"; cp = IDENT; ")"; 
        "(uwwarapaxa"; cu = IDENT; ")"; 
        "(level"; lev = INT; ")";")" -> 
    (int_of_string i,int_of_string m,w,r,cp,cu,int_of_string lev)
    ] ] ;

  avywaxXiwa:
    [ [ "(avywaxXiwa"; "(id"; i = INT; ")"; 
               "(mid"; m = INT; ")"; 
               "(word"; w = IDENT; ")"; 
               "(rt"; r = IDENT; ")"; 
               "(pUrvapaxa"; cp = IDENT; ")"; 
               "(uwwarapaxa"; cu = IDENT; ")"; 
               "(waxXiwa_prawyayaH"; taddhita = IDENT; ")"; 
               "(level"; lev = INT; ")";
    ")" -> 
    (int_of_string i,int_of_string m,w,r,cp,cu,taddhita,int_of_string lev)
    ] ] ;

  avykqw:
    [ [ "(avykqw"; "(id"; i = INT; ")"; 
           "(mid"; m = INT; ")"; 
           "(word"; w = IDENT; ")"; 
           "(rt"; r = IDENT; ")"; 
           "(pUrvapaxa"; cp = IDENT; ")"; 
           "(uwwarapaxa"; cu = IDENT; ")"; 
           "(upasarga"; upa = IDENT; ")";
           "(sanAxi_prawyayaH"; san = IDENT; ")";
           "(kqw_prawyayaH"; kqw = IDENT; ")"; 
           "(XAwuH"; rtwithiw = IDENT; ")"; 
           "(gaNaH"; gana = IDENT; ")"; 
           "(level"; lev = INT; ")";
     ")" -> 
    (int_of_string i,int_of_string m,w,r,cp,cu,upa,san,kqw,rtwithiw,gana,int_of_string lev)
    ] ] ;

  waxXiwa:
    [ [ "(waxXiwa"; "(id"; i = INT; ")"; 
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
            "(level"; lev = INT; ")";
    ")" -> 
    (int_of_string i,int_of_string m,w,r,cp,cu,taddhita,ling,int_of_string vib,vac,int_of_string lev)
    ] ] ;
END
;

value relation_array = Array.make 5001 "";

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

value relations_encodings = 
        read_list (datapath ^"AkAfkRA/relations.txt") "%s %d"
;

value encode rel = try List.assoc rel relations_encodings
           with [ Not_found -> 0 ]
;

value get_assoc key assoc_array =
     try 
	List.assoc key assoc_array
     with [ Not_found -> ""]
;
     
value afgavikaara_list = 
        read_list (datapath ^"AkAfkRA/afgavikAra.txt") "%s %s"
;

value parAjAwi_list = 
        read_list (datapath ^"yogyawA/parAjAwi.txt") "%s %s"
;

value nirXAraNa_list = 
        read_list (datapath ^"AkAfkRA/nirXAraNa.txt") "%s %s"
;

value amarakosha_jAwi = 
        read_list (datapath ^"AkAfkRA/amarakosha_jAwi.txt") "%s %s"
;

(* value wAxarWya_list = [ ("yUpa","xAru"); ]
; *)

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

value distinct_2 m1 m2 = match m1 with
  [ Wif (id1,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_)
  | Kqw (id1,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_)
  | Avykqw (id1,_,_,_,_,_,_,_,_,_,_,_)
  | AvywaxXiwa (id1,_,_,_,_,_,_,_)
  | Sup (id1,_,_,_,_,_,_,_,_,_)
  | Avy (id1,_,_,_,_,_,_)
  | WaxXiwa (id1,_,_,_,_,_,_,_,_,_,_) -> match m2 with
  	[ Wif (id2,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_)
  	| Kqw (id2,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_)
 	| Avykqw (id2,_,_,_,_,_,_,_,_,_,_,_)
 	| AvywaxXiwa (id2,_,_,_,_,_,_,_)
 	| Sup (id2,_,_,_,_,_,_,_,_,_)
 	| Avy (id2,_,_,_,_,_,_)
 	| WaxXiwa (id2,_,_,_,_,_,_,_,_,_,_) -> 
                if not (id1 = id2)
                then True
                else False
        ]
   ]
;

value distinct_3 m1 m2 m3 =   distinct_2 m1 m2 
                           && distinct_2 m1 m3 
                           && distinct_2 m2 m3
;

value compound word uwwarapaxa = not(word=uwwarapaxa)
;

value not_compound word uwwarapaxa = not (compound word uwwarapaxa)
;

value no_boundary_crossing1 id1 id2 =
      if id1 < kinwu_pos.val && id2 > kinwu_pos.val then False
      else if id2 < kinwu_pos.val && id1 > kinwu_pos.val then False
      else if id1 < apiwu_pos.val && id2 > apiwu_pos.val then False
      else if id2 < apiwu_pos.val && id1 > apiwu_pos.val then False
      else if id1 < paranwu_pos.val && id2 > paranwu_pos.val then False
      else if id2 < paranwu_pos.val && id1 > paranwu_pos.val then False
      else if id1 < aWa_pos.val && id2 > aWa_pos.val then False
      else if id2 < aWa_pos.val && id1 > aWa_pos.val then False
     (* else if id1 < yaw_pos.val && id2 > yaw_pos.val then False
yaw ia ambiguous. It can be a pronoun as wwell. *)
      (* else if id1 < iwi_pos.val && id2 > iwi_pos.val then False 
 mawwaH eva iwi vixXi; mawwaH is connected to vixXi, intervenned by iwi. *)
      (*else if id1 < evam_pos.val && id2 > evam_pos.val then False*)
      else if id1 < wasmAw_pos.val && id2 > wasmAw_pos.val then False
      else if id2 < wasmAw_pos.val && id1 > wasmAw_pos.val then False
      else if id1 < (hi_pos.val-1) && id2 > hi_pos.val then False
     (* else if id1 < wawra_pos.val && id2 > wawra_pos.val then False 
yaH buxXiwvAw wawra kevalam AwmAnam paSyawi ...*)
      else if id1 < waWApi_pos.val && id2 > waWApi_pos.val then False
      else if id1 < warhi_pos.val && id2 > warhi_pos.val then False
      else if id2 < warhi_pos.val && id1 > warhi_pos.val then False
      else if ((id1 < waw_pos.val && id2 > waw_pos.val)
              || (id2 < waw_pos.val && id1 > waw_pos.val))
           && (yaw_pos.val < 1000 || cew_pos.val < 1000 || yaxi_pos.val < 1000) then False
      else if ((id1 < yaw_pos.val && id2 > yaw_pos.val)
              || (id2 < yaw_pos.val && id1 > yaw_pos.val))
           && (waw_pos.val < 1000) then False
(* If there is waw, then there should be either yaw or cew or yaxi, else it is not a boundary marker *)
(* For yaxi ... waw refer to BhG 1.46 *)
      else if ((id1 < waxA_pos.val && id2 > waxA_pos.val ) ||
               (id2 < waxA_pos.val && id1 > waxA_pos.val))
           && yaxA_pos.val < 1000 then False 
 (* This condition is added to account for the boundary crossing with only waxA as in
    xqRtvA wu pANdavAnIkam vyUDam xuryoXanaswaxA AcAryam upasafgamya vacanam abravIw BhG1.2 *)
      else if (( id1 < waWA_pos.val && id2 > waWA_pos.val )
              || (id1 < waWA_pos.val && id2 > waWA_pos.val ))
      && yaWA_pos.val < 1000 then False
      else True
;

value no_boundary_crossing id1 id2 text_type =
  if text_type="Prose" then
  no_boundary_crossing1 id1 id2
  (* else if text_type="Sloka" then
      no_boundary_crossing1 id1 id2
   && no_boundary_crossing1 id2 id1 
   In the case of Sloka, we may have a verse starting with yaw and ending with waw, or some words after waw without any verb; as in
yaw SreyaH syAw niSciwaM brUhi waw me
  else False *)
  else True
;

value print_relation cho = fun
  [ Relation (i1 , i2 , i3 , i4 , i5 , i6)  -> do
         { output_string cho (string_of_int i1); output_string cho " "
         ; output_string cho (string_of_int i2); output_string cho " "
         ; output_string cho (string_of_int (encode i3))
         ; output_string cho " "
         ; output_string cho (string_of_int i4); output_string cho " "
         ; output_string cho (string_of_int i5); output_string cho " #"
         ; output_string cho i3; output_string cho " "
         ; output_string cho i6; output_string cho " \n"
         } (* else ()*)
  ]
;
(* value rec print_relation_list = fun 
  [ [] -> ()
  | [ r :: l ] -> do { print_relation r
             ; print_relation_list l
             }
  ]
;
*)
value mk_tuple r = match r with
   [ Relation (a,b,c,d,e,f) -> let ec = encode c in
          if ec >= 4000 then [Relationc (a,b,(ec + a),d,e)]
          else if ec >= 2000 then [Relationc (a,b,(ec + d),d,e)]
          else [Relationc (a,b,ec,d,e)]
   ]
 ;
 
value rec mk_tuple_lst acc = fun
   [ [] -> List.sort_uniq compare acc
   | [r :: l ] -> let tpl = mk_tuple r in
                  let acc1 = tpl@acc in
                  mk_tuple_lst acc1 l
   ]
;

value pronoun3 rt = (rt="yax" || rt="wax" || rt="ewax" || rt="ixam" || rt="sarva" || rt="sarvA" || rt="svIya" || rt="svIyA" || rt="kim" || rt="Bavaw" || rt="uBa"|| rt="uBA" || rt="yAvaw" || rt = "wAvaw" || rt = "axas" || rt="kiFciw" || rt="kiFcana" || rt="Awman" || rt="sva" || rt="svA" || rt="anya" || rt="IxqS" || rt="kIxqS" || rt="kIxqSa" || rt = "IxqSa") 
;
value pronominal12 rt = (rt="yuRmax" || rt="asmax")
;
value pronominal123 rt = pronominal12 rt || pronoun3 rt
;
value safKyA rt = (rt="wri" || rt = "eka" || rt = "ekA" || rt = "xvi" || rt="paFcan")  (* all safKyA to be added *)
;

value aBihiwa rt vac1 vac2 per =    (vac1=vac2)  
                 && (  (per="ma" && rt = "yuRmax") 
                    || (per="u" && rt = "asmax") 
                    || (per="pra"  
                    && not (rt = "asmax")
                    && not (rt = "yuRmax")
                   )
                )
;
value noun_agreement vac1 vac2 gen1 gen2 =     
                             (vac1=vac2)
                          && (gen1=gen2 || gen1="a" || gen2 = "a")
;
value noun_agreement_vibh vac1 vac2 gen1 gen2 vib1 vib2 =    
                                    (vac1=vac2)
                                 && (vib1=vib2)
                                 && (gen1=gen2 || gen1="a" || gen2="a")
                                     (* (gen1="a" && not (gen2="napuM"))|| 
                                      (not (gen1="napuM") && gen2="a"))  Why this exception for napuM??*)

(* How to handle a-vinASin wvam, where a-vinASin is in neuter gender ?  -- Amba 10Jun18*)
;

value niyawalifgam kqw = kqw="lyut" || kqw="GaF"
;

(* TODO: Modify the Grammar for ignoring comments in the files *)
value populate_from file trie =
  let ic = open_in file in
  try while True do 
            { let word = Transduction.code_raw_WX (input_line ic) 
            ; trie.val := Trie.enter trie.val word
            }
  with [ End_of_file -> close_in ic 
       | Trie.Redundancy -> output_string stderr ("Fatal error: duplicated word in" ^ file ^"\n")
       ]
  ; 

value build_trie file = 
  let trie = ref Trie.empty in
      do { populate_from file trie
     ; (trie.val)
     }
;

value member_of word trie =
       Trie.mem (Transduction.code_raw_WX word) trie
;
    
value members_of rt upasarga trie =
       if upasarga = "X" 
       then member_of rt trie
       else member_of (upasarga^"_"^rt) trie
;
    
value kriyAviSeRaNas = build_trie (datapath ^ "yogyawA/kriyAviSeRaNa_list")
;

value karaNa_verbs = build_trie (datapath ^ "AkAfkRA/karaNa_XAwu_list")
;

value sampraxAna_verbs = build_trie (datapath ^ "AkAfkRA/sampraxAna_XAwu_list")
;

value animate_nouns = build_trie (datapath ^ "yogyawA/animate_list")
;

value apAxAna_verbs = build_trie (datapath ^ "AkAfkRA/apAxAna_XAwu_list")
;

value kAlAXikaraNas = build_trie (datapath ^ "yogyawA/kAlAXikaraNa_list")
;

value xeSAXikaraNas = build_trie (datapath ^ "yogyawA/xeSAXikaraNa_list")
;

value kAlAXvas = build_trie (datapath ^ "yogyawA/kAlAXva_list")
;

(* value shashthii_kqw_verbs = build_trie (datapath ^ "RaRTI_kqw_list")
;
*)
value sakarmaka_verbs =  build_trie (datapath ^ "AkAfkRA/sakarmaka_XAwu_list")
;

value xvikarmaka1 = build_trie (datapath ^ "AkAfkRA/xvikarmaka_XAwu_list1")
;

value xvikarmaka2 = build_trie (datapath ^ "AkAfkRA/xvikarmaka_XAwu_list2")
;

value aaxikarma_verbs =  build_trie (datapath ^ "AkAfkRA/Axikarma_XAwu_list")
;

 (* In gawyarWaka, buxXi, prawyavasAnArWa and shabxakarma, only sakarmaka dhaatus are considered: see extract.sh programme for details *)
value gawyarWa_verbs = build_trie (datapath ^ "AkAfkRA/gawyarWa_XAwu_list")
;

value buxXyarWa_verbs = build_trie (datapath ^ "AkAfkRA/buxXyarWa_XAwu_list")
;

value shabxakarma_verbs = build_trie (datapath ^ "AkAfkRA/Sabxakarma_XAwu_list")
;

value prawyavasAnArWa_verbs = build_trie (datapath ^ "AkAfkRA/prawyavasAnArWa_XAwu_list")
;

value shliR_Axi_verbs = build_trie (datapath ^ "AkAfkRA/SliR_Axi_list")
;

value akarmaka_verbs = build_trie (datapath ^ "AkAfkRA/akarmaka_XAwu_list")
;

value vAkyakarma_verbs = build_trie (datapath ^ "AkAfkRA/vAkyakarma_XAwu_list")
;

value shakAxi = build_trie (datapath ^ "AkAfkRA/SakAxi_list")

(* Ocaml does not allow variables starting with Caps. Hence SakAxi -> shakAxi *)
;

value karwqsamAnAXikaraNa_verbs = build_trie (datapath ^ "AkAfkRA/karwqsamAnAXikaraNa_XAwu_list")
;

value karmasamAnAXikaraNa_verbs = build_trie (datapath ^ "AkAfkRA/karmasamAnAXikaraNa_XAwu_list")
;

value buxXivAci_nouns = build_trie (datapath ^ "yogyawA/buxXivAci_list")
;

value shabxavAci_nouns = build_trie (datapath ^ "yogyawA/SabxavAci_list")
;

(* value karmakqw_verbs = build_trie (datapath ^ "karma_kqw_list")
;
*)
value bhaavavaaci_kqw = build_trie (datapath ^ "AkAfkRA/BAva_kqw_list")
;

(* value avy_verb_list = build_trie (datapath ^ "avy_verb_list")
;
*)
value samboXana_sUcaka = build_trie (datapath ^ "AkAfkRA/samboXana_sUcaka_list")
;

value avy_viSeRaNam_list = build_trie (datapath ^ "yogyawA/avy_viSeRaNam_list")
;

value intensifiers_list = build_trie (datapath ^ "yogyawA/intensifiers_list")
;

value viRayAXikaraNa_nouns = build_trie (datapath ^ "AkAfkRA/viRayAXikaraNa_list")
;

value saMKyeya = build_trie (datapath ^ "yogyawA/saMKyeya_list")
;

value pUraNa = build_trie (datapath ^ "yogyawA/pUraNa_list")
;

(* value guNa = build_trie (datapath ^ "yogyawA/guNa_list")
; *)

value guNavacana = build_trie (datapath ^ "yogyawA/guNavacana_list")
;

value guNa_not_guNavacana = build_trie (datapath ^ "yogyawA/guNa_not_guNavacana_list")
;

(*value xravyavAci_nouns = build_trie (datapath ^ "yogyawA/xravyavAcI_list")
; *)

 (* kqxanwa list is introduced, since we still do not have an exhastive kqxanwa analyser ; we need it for viSeRaNas and RaRTI sambanXa*)

value kqxanwas = build_trie (datapath ^ "AkAfkRA/kqxanwa_list")
;

 (* waxXiwAnwa_list is introduced, since we still do not have an exhastive waxXXiwa analyser ; we need it for viSeRaNas *)
value taddhitaantas = build_trie (datapath ^ "yogyawA/waxXiwAnwa_list")
;

(* value uwwara_guNavAcI = build_trie (datapath ^ "yogyawA/uwwarapaxa_guNavAcI_list")
; *)

value sambanXavAcI = build_trie (datapath ^ "yogyawA/sambanXavAcI_list")
;
value manuRyaparyAya = build_trie (datapath ^ "yogyawA/manuRyaparyAya")
;

value manuRyasaMjFAvAcI = build_trie (datapath ^ "yogyawA/manuRyasaMjFAvAcI")
;

value upAXi = build_trie (datapath ^ "yogyawA/upAXi_list")
;

value viRayi_list = build_trie (datapath ^ "AkAfkRA/viRayi_list")
;

value non_RaRTI_list = build_trie (datapath ^ "yogyawA/non_RaRTI_list")
;

value named_entity = build_trie (datapath ^ "yogyawA/named_entity_list")
;

value upapada6_list = build_trie (datapath ^ "yogyawA/upapada6_list")
;

value aXikaraNa_type word rt = 
          if member_of word kAlAXikaraNas then "kAlAXikaraNam"
          else if member_of rt kAlAXikaraNas then "kAlAXikaraNam"
          else if member_of word xeSAXikaraNas then "xeSAXikaraNam"
          else "aXikaraNam"
;
(* Sanjeev: write a note on why do you need all these classification.
   Give justification with Panini's suutra for each of them
   Draw a Venn diagram showing the overlaps among these sets
*)
value verb_type rt upasarga =  
          if members_of rt upasarga akarmaka_verbs then "akarmaka"
          else if members_of rt upasarga xvikarmaka2 then "xvikarmaka2"
          else if members_of rt upasarga xvikarmaka1 then "xvikarmaka1"
          else if members_of rt upasarga gawyarWa_verbs then "gawi"
          else if members_of rt upasarga buxXyarWa_verbs  then "buxXi"
          else if members_of rt upasarga prawyavasAnArWa_verbs then "prawyavasAnArWa"
          else if members_of rt upasarga shabxakarma_verbs then "Sabxakarma"
          else if members_of rt upasarga sakarmaka_verbs then "sakarmaka" else ""
;

(* yogyawA *)
value kv_or_spl_aXi id1 mid1 id2 mid2 word = 
          if member_of (word^" avy") kriyAviSeRaNas
          then [ Relation (id1,mid1,"kriyAviSeRaNam",id2,mid2,"100.1")] 
          else if member_of word kAlAXikaraNas 
          then [ Relation (id1,mid1,"kAlAXikaraNam",id2,mid2,"100.2") ]
          else if member_of word xeSAXikaraNas 
          then [ Relation (id1,mid1,"xeSAXikaraNam",id2,mid2,"100.3") ]
          else []
;

value previous id = id-1
;

value next id = id+1
;

value prose_order id1 id2 text_type = 
          if text_type="Prose" then id1 < id2 else True
(*not (id1=id2)*)
;

value bh_kqw fn id1 id2 id3 mid1 mid2 mid3 kqw word rl =  
           if member_of kqw bhaavavaaci_kqw
           then fn id1 id2 id3 mid1 mid2 mid3 word rl 
           else []
;

(* vqkRAw vqkRam kUxawi  -- apAxAnam_vIpsA *)
(* vanena vanam gacCawi -- karaNam_vIpsA *)
value supAxi_vIpsa id1 id2 mid1 mid2 word1 word2 rt1 rt2 vac1 vac2 gen1 gen2 vib1 vib2 rlid =
   if    id1=previous id2 
   then if  word1=word2
          && noun_agreement_vibh vac1 vac2 gen1 gen2 vib1 vib2
        then [ Relation (id1,mid1,"vIpsA",id2,mid2,rlid)]
         else if  rt1 = rt2
              then if  vib1 = 5 && vib2 = 2
                   then [ Relation (id1,mid1,"apAxAnam_vIpsA",id2,mid2,rlid)]
                   else if vib1 = 3 && vib2 = 2
                        then [ Relation (id1,mid1,"karaNam_vIpsA",id2,mid2,rlid)]
                        else []
              else []
   else []
;

value handle_sp_compounds id1 mid1 id2 mid2 rt1 word1 pUrvapaxa1 uwwarapaxa1 lifgam1 = 
   if rt1="pUrvaka" && compound word1 uwwarapaxa1 && lifgam1="napuM"
   then [ Relation (id1,mid1,"kriyAviSeRaNam",id2,mid2,"1.1")]
   else if (rt1="pramuKa") 
   then [ Relation (id1,mid1,"kriyAviSeRaNam",id2,mid2,"1.2")]
   else if (rt1="pUrveNa") 
   then [ Relation (id1,mid1,"kriyAviSeRaNam",id2,mid2,"1.3")]
   (*else if (pUrvapaxa1="sa") && lifgam1="napuM"
   then [ Relation (id1,mid1,"kriyAviSeRaNam",id2,mid2,"1.30c")]
Need example for sa- as a kriyAviSeRaNam (e.g. sa-Axaram)
sa-Saram cApam - is not a kriyAviSeRaNam *)
   else if (pUrvapaxa1="yaWA") && lifgam1="napuM"
   then [ Relation (id1,mid1,"kriyAviSeRaNam",id2,mid2,"1.4")]
   else if rt1="arWa" && compound word1 uwwarapaxa1
   then [ Relation (id1,mid1,"prayojanam",id2,mid2,"1.5")]
 (*  else if word1="kqwe" && compound word1 uwwarapaxa1
   then [ Relation (id1,mid1,"prayojanam",id2,mid2,"1.33c")] *)
   else if uwwarapaxa1="ananwaram" && compound word1 uwwarapaxa1
   then [ Relation (id1,mid1,"kAlAXikaraNam",id2,mid2,"1.6")]
   else []
;

value is_human rt = member_of rt upAXi
                   || member_of rt sambanXavAcI
                   || member_of rt manuRyaparyAya
                   || member_of rt manuRyasaMjFAvAcI
;

(* Section on kAraka relations *)

(* Notes on karta and karma vibhkati
Verb classes: A akarmaka
          S sakarmaka
        S.1 gawibuxXi_etc (gawi, buxXi, prawyavasAnArWa, Sabxa-karma)
            S.1.1 gawyarWaka
          D xvikarmaka
        D.1 xvikaramaka1
        D.2 xvikaramaka2

sUwra:
      anaBihiwe karmaNi xviwIyA
      anaBihiwe karwq-karaNayoH wqwIyA

wif karwari:       (aBihiwa karwA)
Case	Vb_Class	karwA   karma   karma2
Ia       A		1       -             
Ib       S		1       2       	(karmaNi xviwIyA)          
Ic       D		1       2 	2       (karmaNi xviwIyA)

wif karmaNi:       (aBihiwa karma)
Case	Vb_Class	karwA	karma   karma2       
IIa       A		3       -    			(BAve prayogaH)
IIb       S		3	1       		(karwq-karaNayoH wqwIyA)             
##IIc       D.1		3	2        1(muKya)	(anaBihiwe gONa-karmaNi xviwIyA)
##IId       D.2		3	2	 1(gONa)	(anaBihiwe muKya-karmaNi xviwIyA)
IIc       D.1		3	2        1(gONa)	(anaBihiwe muKya-karmaNi xviwIyA)
IId       D.2		3	2	 1(muKya)	(anaBihiwe gONa-karmaNi xviwIyA)

Nic+wif karwari: (aBihiwa karwA)
Case	Vb_Class prayojaka_karwA prayojya_karwA       karma       
IIIa	A		1           2          		-       (gawibuxXi.. elevates prayojya_karwA to karma, hence xviwIyA)
IIIb	S.1		1           2          		2       (gawibuxXi.. elevates prayojya_karwA to karma, hence xviwIyA)
IIIc	S-S.1		1           3          		2       (prayojya karwA is anaBihiwa; hence wqwIyA)
IIId	D		1           3          		2 2     (prayojya karwA is anaBihiwa; hence wqwIyA)

Nic+wif karmaNi: (aBihiwa karma; gawibuxXi.. karma;)
Case       Vb_Class prayojaka_karwA prayojya_karwA	karma       
IVa	A      		3           1          		-       (gawibuxXi.. elevates prayojya_karwA to karma, hence praWamA)
IVb	S.1.1      	3           1          		2       ()  gawyarWaka
IVc	S.1-S.1.1  	3           1          		2       ()  gawibuxXi - gawyarWaka
IVd	S.1-S.1.1  	3           2          		1       ()  gawibuxXi - gawyarWaka
IVe	S-S.1        	3           3          		1       (prayojya karwA is anaBihiwa; hence wqwIyA); sakarmaka - gawibuxXi
IVf	D.1      	3           3          		1 2       (prayojya karwA is anaBihiwa; hence wqwIyA)
IVg	D.2      	3           3          		2 1       (prayojya karwA is anaBihiwa; hence wqwIyA)

*) 
value rlwifkarwA_karma m1 m2 text_type = match m2 with
  [ Wif (id2,mid2,_,rt2,_,_,upasarga2,sanAxiH2,prayogaH2,_,puruRaH2,vacanam2,_,_,_,_) ->
     match m1 with
     [ WaxXiwa (id1,mid1,word1,rt1,pUrvapaxa1,uwwarapaxa1,_,lifgam1,viBakwiH1,vacanam1,_)
     | Kqw (id1,mid1,word1,_,_,_,_,_,_,_,rt1,pUrvapaxa1,uwwarapaxa1,lifgam1,viBakwiH1,vacanam1,_)
     | Sup (id1,mid1,word1,rt1,pUrvapaxa1,uwwarapaxa1,lifgam1,viBakwiH1,vacanam1,_) -> 
       if prose_order id1 id2 text_type
       && no_boundary_crossing id1 id2 text_type
       then match viBakwiH1 with
       [ 1 ->  if aBihiwa rt1 vacanam1 vacanam2 puruRaH2
           then match prayogaH2 with
           [ "karwari" -> let rel = handle_sp_compounds id1 mid1 id2 mid2 rt1 word1 pUrvapaxa1 uwwarapaxa1 lifgam1 in
                          if not (rel = []) then rel 
			  else match sanAxiH2 with
                 [ "Nic" ->  [ Relation (id1,mid1,"prayojakakarwA",id2,mid2,"2.1")]  
                      (* aBihiwe praWamA  - xevaxawwaH:prayojakakarwA pATayawi*)
                 | _     ->  if not (member_of rt1 intensifiers_list) 
                              (* && not (member_of word1 upapada6_list) 
                               * Why is this condition needed? It creates problem with sentences such as suKam prINayawi *)
                             && not (member_of (word1^" "^string_of_int(viBakwiH1)) kriyAviSeRaNas)
                             then if members_of rt2 upasarga2 karwqsamAnAXikaraNa_verbs
                             then [ Relation (id1,mid1,"karwA_be_verbs",id2,mid2,"2.2")]  
                             else [ Relation (id1,mid1,"karwA",id2,mid2,"2.2a")]  
                             else []
                      (* aBihiwe praWamA -xevaxawwaH:karwA paTawi*)
                 ]
           |"karmaNi" -> let rel = handle_sp_compounds id1 mid1 id2 mid2 rt1 word1 pUrvapaxa1 uwwarapaxa1 lifgam1 in
                          if not (rel = []) then rel 
                          else match verb_type rt2 upasarga2 with
                 [ "xvikarmaka2" -> [ Relation (id1,mid1,"muKyakarma",id2,mid2,"2.3")]  
                         (*praXAne nIhqkqRvah  - ajA:muKyakarma grAmaM nIyawe *)
                 | "xvikarmaka1" -> [ Relation (id1,mid1,"gONakarma",id2,mid2,"2.4")]  
                         (*apraXAne xuhAxinAm.. - gOH xugXaM:gONakarma xuhyawe *)
                 | _ -> match sanAxiH2 with
                    ["Nic" ->  match verb_type rt2 upasarga2 with
                           [ "gawi" -> [ Relation (id1,mid1,"prayojyakarwA",id2,mid2,"2.5")]  
                           (*gawibuxXi.. -> karma; aBihiwa   yajFaxawwena xevaxawwaH:prayojyakarwA  grAmaM  gamyawe *)
                           | "buxXi"
                           | "prawyavasAnArWa" 
                           | "Sabxakarma" ->
                                   [ Relation (id1,mid1,"prayojyakarwA",id2,mid2,"2.6")  
                                       (*yajFaxawwena  xevaxawwaH PalaM KAxyawe *)
                                   ; Relation (id1,mid1,"karma",id2,mid2,"2.7") 
                                   ]
                           (*| "sakarmaka"  -> [ Relation (id1,mid1,"prayojyakarwA",id2,mid2,"1.8")]  *)
                           | "sakarmaka"  -> [ Relation (id1,mid1,"karma",id2,mid2,"2.8")]
                                 (* aBihiwe praWamA  -yajFaxawwena  xevaxawwena  oxanam  pAcyawe *)
                           | "akarmaka" -> [ Relation (id1,mid1,"prayojyakarwA",id2,mid2,"2.9")]  
                           | _ -> []
                           ]
                   | _ -> if members_of rt2 upasarga2 sakarmaka_verbs
                       then [ Relation (id1,mid1,"karma",id2,mid2,"2.10")]  
                        (* aBihiwe praWamA  - xevaxawwena grAmaH gamyawe*)
                     else []
                    ]
                 ]
           | _ -> []
           ]
           else []
    | 2 -> match prayogaH2 with
           ["karwari" ->  match sanAxiH2 with
                  [ "Nic" -> match verb_type rt2 upasarga2 with
                     [ "xvikarmaka2" 
                     | "xvikarmaka1" -> [ Relation (id1,mid1,"karma",id2,mid2,"2.11")]  
                                 (* karmaNi xviwIyA - yajFaxawwaH xevaxawwena rAjAnaM vasuXAM yAcayawi  *)
                     | "akarmaka" -> let rel = handle_sp_compounds id1 mid1 id2 mid2 rt1 word1 pUrvapaxa1 uwwarapaxa1 lifgam1 in
				     if (not (rel=[])) then rel 
                                     (* else if (uwwarapaxa1=pUrvapaxa1 ) || (pUrvapaxa1="a")
		                     then [ Relation (id1,mid1,"karma",id2,mid2,"2.4")]  *)
                                     else [ Relation (id1,mid1,"prayojyakarwA",id2,mid2,"2.12")]  
                             (*gawibuxXi.. elevates prayojya_karwA to karma, hence xviwIyA *)
                     | "buxXi"
                     | "Sabxakarma"
                     | "gawi"
                     | "prawyavasAnArWa" -> let rel = handle_sp_compounds id1 mid1 id2 mid2 rt1 word1 pUrvapaxa1 uwwarapaxa1 lifgam1 in
			     if (not (rel=[])) then rel 
                             else [ Relation (id1,mid1,"prayojyakarwA",id2,mid2,"2.13") (* '' *) 
                                  ; Relation (id1,mid1,"karma",id2,mid2,"2.14") (* karmaNi xviwIyA *) 
                                  ]
                     | "sakarmaka" (* not gawibuxXi && not prawyavasAnArWa_verbs *) ->
                             let rel = handle_sp_compounds id1 mid1 id2 mid2 rt1 word1 pUrvapaxa1 uwwarapaxa1 lifgam1 in
			     if (not (rel=[])) then rel 
                             (*else if (uwwarapaxa1=pUrvapaxa1 ) || (pUrvapaxa1="a")
		             then [ Relation (id1,mid1,"prayojyakarwA",id2,mid2,"1.24")]  *)
                             else [Relation (id1,mid1,"prayojyakarwA",id2,mid2,"2.15" )] (* This is Nic, so it can only be a prayojyakarwA e.g. gqhiNI puwrAya moxakam paryaveRayaw  *) 
                     | _ -> []
                     ]
                | _ -> if    not (member_of (word1 ^ " " ^ string_of_int viBakwiH1) kriyAviSeRaNas) 
                          && not (member_of word1 kAlAXvas)
                       then match verb_type rt2 upasarga2 with
                      [ "xvikarmaka1" 
                      | "xvikarmaka2" -> 
                             let rel = handle_sp_compounds id1 mid1 id2 mid2 rt1 word1 pUrvapaxa1 uwwarapaxa1 lifgam1 in
			     if (not (rel=[])) then rel 
                             else [ Relation (id1,mid1,"gONakarma",id2,mid2,"2.16" )
                              (* karmaNi xviwIyA  - rAjAnaM vasuXAM yAcawe*)
                                  ; Relation (id1,mid1,"muKyakarma",id2,mid2,"2.17" ) 
                              (* karmaNi xviwIyA - gAM xogXi payaH *)
                                  ]
                      | "gawi"
                      | "buxXi" 
                      | "Sabxakarma" 
                      | "prawyavasAnArWa"
                      | "sakarmaka" -> if rt2="yaj1"  && text_type = "Vedic"
                                       then [ Relation (id1,mid1,"sampraxAnam",id2,mid2,"2.18")] (* yajeH sampraxAnasya karma sajFA *)
				       else let rel = handle_sp_compounds id1 mid1 id2 mid2 rt1 word1 pUrvapaxa1 uwwarapaxa1 lifgam1 in
			               if (not (rel=[])) then rel 
                                       else if (verb_type rt2 upasarga2 = "gawi") && (word1="kim")
				       then [] (* kim rAmaH gacCawi; here kim is not a karma of gacCawi*)
				       else if not (member_of word1 kAlAXikaraNas) && not (member_of word1 xeSAXikaraNas)
                                       then [ Relation (id1,mid1,"karma",id2,mid2,"2.19" )] (* karmaNi xviwIyA *) 
                                       else []
                      | "akarmaka" ->  handle_sp_compounds id1 mid1 id2 mid2 rt1 word1 pUrvapaxa1 uwwarapaxa1 lifgam1
                                       (* else if (uwwarapaxa1=pUrvapaxa1 ) || (pUrvapaxa1="a")
		                       then [ Relation (id1,mid1,"karma",id2,mid2,"2.4")] *)
                      | _ -> []
                      ]
                     else []
                  ]
           | "karmaNi" -> match verb_type rt2 upasarga2 with 
                  [ "xvikarmaka1" -> [ Relation (id1,mid1,"muKyakarma",id2,mid2,"2.20")] 
                          (* aprAXAne xuhAxi - gOH  xuhyawe xugXaM  *)
                  | "xvikarmaka2" -> [ Relation (id1,mid1,"gONakarma",id2,mid2,"2.21")] 
                          (* praXAne nI..  ajA nIyawe grAmaM *)
                  | _ -> match sanAxiH2 with
                     ["Nic" -> match verb_type rt2 upasarga2 with
                          [ "gawi" -> [ Relation (id1,mid1,"karma",id2,mid2,"2.22" )] (* karmaNi xviwIyA *)
                          | "buxXi"
                          | "Sabxakarma"
                          | "prawyavasAnArWa" -> 
                                  [ Relation (id1,mid1,"prayojyakarwA",id2,mid2,"2.23" ) 
                                  ; Relation (id1,mid1,"karma",id2,mid2,"2.24") (* anukwakarmaNi xviwIyA *) 
                                  ]
                          (* | "sakarmaka" -> [ Relation (id1,mid1,"karma",id2,mid2,"1.37a" )] (* karmaNi xviwIyA *) *)
                          | _ -> []
                          ]
                     | _ -> []
                     ]
                  ]
           | _ -> []
           ]
    | 3 ->  match sanAxiH2 with 
        [ "Nic" ->  match verb_type rt2 upasarga2 with
                [ "xvikarmaka2"
                | "xvikarmaka1"
                | "sakarmaka" (* not gawibuxXi && not prawyavasAnArWa *)
                     ->  match prayogaH2 with
                      [ "karwari" -> [ Relation (id1,mid1,"prayojyakarwA",id2,mid2,"2.25" )]
                             (* karwq_karaNayoH wqwIyA - yajFaxawwaH xevaxawwena annaM pAcayawi *)
                      | "karmaNi" -> 
                             [ Relation (id1,mid1,"prayojakakarwA",id2,mid2,"2.26" ) 
                             ; Relation (id1,mid1,"prayojyakarwA",id2,mid2,"2.27" )  
                             (* karwqkaraNayoH wqwIyA - yajFaxawwena  xevaxawwena annaM pAcyawe *)
                             ]
                      (*| _ -> if prayogaH2 = "karmaNi" 
                         then [ Relation (id1,mid1,"prayojakakarwA",id2,mid2,"1.43" )] (* karwqkaraNayoH wqwIyA *) 
                         else [] *)
                      | _ -> []
                      ]
                | "akarmaka" ->  match prayogaH2 with
                      [ "karwari" -> []
                      | _ ->  [ Relation (id1,mid1,"prayojakakarwA",id2,mid2,"2.28" )]
                      ]
                | _ ->  [ Relation (id1,mid1,"karwA",id2,mid2,"2.29" )] (* karwq_karaNayoH_wqwIyA *) 
                ]
        | _ ->  if (prayogaH2 = "karmaNi" || prayogaH2 = "BAve")
                  && not (member_of word1 kAlAXvas)
            then [ Relation (id1,mid1,"karwA",id2,mid2,"2.30" )] (* karwqkaraNayoH wqwIyA *) 
            else [] (* karaNam is marked below *)
        ]
    | _ -> []
    ]
    else []
     | _ -> []
     ]
  | _ -> []
  ]
  ;

(* To add

number: 1,2,3 => if 1+1 then 2 else 3
person: u > m > a
choose max among the given persons.

gender: neuter > masc > fem
choose max among the given genders 
Ref: Kale's Higher Sanskrit grammar; 789
*)
value rl_ca_wif_aBihiwa_karwA_karma m1 m2 m3 text_type = match m2 with
 [ Avy (id2,mid2,word2,_,_,_,_) -> 
   if word2="ca" then match m3 with
   [ Wif (id3,mid3,_,rt3,_,_,upasarga3,sanAxiH3,prayogaH3,_,puruRaH3,vacanam3,_,_,_,_) ->
     match m1 with
     [ WaxXiwa (id1,mid1,word1,rt1,pUrvapaxa1,uwwarapaxa1,_,_,viBakwiH1,_,_)
     | Kqw (id1,mid1,word1,_,_,_,_,_,_,_,rt1,pUrvapaxa1,uwwarapaxa1,_,viBakwiH1,_,_)
     | Sup (id1,mid1,word1,rt1,pUrvapaxa1,uwwarapaxa1,_,viBakwiH1,_,_) -> 
       if prose_order id1 id3 text_type && id2 = next id1
       then match viBakwiH1 with
       [ 1 -> match prayogaH3 with
           [ "karwari" -> match sanAxiH3 with
                 [ "Nic" -> if (aBihiwa rt1 "bahu" vacanam3 puruRaH3)
                             || (aBihiwa rt1 "xvi" vacanam3 puruRaH3)
                            then  [ Relation (id1,mid1,"prayojakakarwA",id3,mid3,"2.31")]  
                            else []
                      (* aBihiwe praWamA  - xevaxawwaH:prayojakakarwA pATayawi*)
                 | _     -> if (aBihiwa rt1 "bahu" vacanam3 puruRaH3)
                             || (aBihiwa rt1 "xvi" vacanam3 puruRaH3)
                            then [ Relation (id1,mid1,"karwA",id3,mid3,"2.32")]
			    else []
                      (* rAmaH sIwA ca gacCawaH; rAmaH sIwA ramA ca gacCanwi *)
                 ]
           |"karmaNi" -> match verb_type rt3 upasarga3 with
                 [ "xvikarmaka2" -> 
                      if (aBihiwa rt1 "bahu" vacanam3 puruRaH3)
                        || (aBihiwa rt1 "xvi" vacanam3 puruRaH3)
                      then [ Relation (id1,mid1,"muKyakarma",id3,mid3,"2.33")]  
                         (*praXAne nIhqkqRvah  - ajA:muKyakarma grAmaM nIyawe *)
                      else []
                 | "xvikarmaka1" -> 
                      if (aBihiwa rt1 "bahu" vacanam3 puruRaH3)
                        || (aBihiwa rt1 "xvi" vacanam3 puruRaH3)
                      then [ Relation (id1,mid1,"gONakarma",id3,mid3,"2.34")]  
                      else []
                         (*apraXAne xuhAxinAm.. - gOH xugXaM:gONakarma xuhyawe *)
                 | _ -> match sanAxiH3 with
                    ["Nic" ->  match verb_type rt3 upasarga3 with
                           [ "gawi" -> 
                               if (aBihiwa rt1 "bahu" vacanam3 puruRaH3)
                                 || (aBihiwa rt1 "xvi" vacanam3 puruRaH3)
                               then [ Relation (id1,mid1,"prayojyakarwA",id3,mid3,"2.35")]  
                               else []
                           (*gawibuxXi.. -> karma; aBihiwa   yajFaxawwena xevaxawwaH:prayojyakarwA  grAmaM  gamyawe *)
                           | "buxXi"
                           | "Sabxakarma"
                           | "prawyavasAnArWa"  -> 
                               if (aBihiwa rt1 "bahu" vacanam3 puruRaH3)
                                 || (aBihiwa rt1 "xvi" vacanam3 puruRaH3)
                               then [ Relation (id1,mid1,"prayojyakarwA",id3,mid3,"2.36")  
                                       (*yajFaxawwena  xevaxawwaH PalaM KAxyawe *)
                                   ; Relation (id1,mid1,"karma",id3,mid3,"2.37") 
                                   ]
                               else []
                           | "sakarmaka"  -> 
                               if (aBihiwa rt1 "bahu" vacanam3 puruRaH3)
                                 || (aBihiwa rt1 "xvi" vacanam3 puruRaH3)
                               then [ Relation (id1,mid1,"karma",id3,mid3,"2.38")]  
                                 (* aBihiwe praWamA  -yajFaxawwena  xevaxawwaM  PalaM  KAxyawe *)
                               else []
                           | _ -> []
                           ]
                   | _ -> if members_of rt3 upasarga3 sakarmaka_verbs
                          && ((aBihiwa rt1 "bahu" vacanam3 puruRaH3)
                                 || (aBihiwa rt1 "xvi" vacanam3 puruRaH3))
                       then [ Relation (id1,mid1,"karma",id3,mid3,"2.39")]  
                        (* aBihiwe praWamA  - xevaxawwena grAmaH gamyawe*)
                     else []
                    ]
                 ]
           | _ -> []
           ]
     | _ -> []
     ]
     else []
     | _ -> []
     ]
  | _ -> []
  ] 
  else []
 | _ -> []
 ]
  ;

value rlkqwkarwA_karma m1 m2 text_type = match m2 with
(* One more condition that the verb in wif does not exist in this sent needs to be added.
e.g. xevaxawwaH grAmaM gawaH: here xevaxawwa is the karwA of gawaH, since there is no verb in wif
But in grAmam gawaH xevaxawwaH puswakaM paTawi, here xevaxawwa should not be marked as karwA of gawaH but gawaH is the viSeRaNa for xevaxawwaH *)
  [ Kqw (id2,mid2,_,rt2,upasarga2,sanAxiH2,kqw2,_,_,_,_,pUrvapaxa2,uwwarapaxa2,lifgam2,viBakwiH2,vacanam2,_) ->
     match m1 with
     [ WaxXiwa (id1,mid1,word1,rt1,pUrvapaxa1,uwwarapaxa1,_,lifgam1,viBakwiH1,vacanam1,_) 
     | Kqw (id1,mid1,word1,_,_,_,_,_,_,_,rt1,pUrvapaxa1,uwwarapaxa1,lifgam1,viBakwiH1,vacanam1,_)
     | Sup (id1,mid1,word1,rt1,pUrvapaxa1,uwwarapaxa1,lifgam1,viBakwiH1,vacanam1,_) -> 
       if no_boundary_crossing id1 id2 text_type
        &&  prose_order id1 id2 text_type
       then if not (sanAxiH2="Nic")
       then match kqw2 with
         [ "kwa" -> if not (viBakwiH2 = 7) 
                    then match viBakwiH1 with
                [ 1 -> let rel = handle_sp_compounds id1 mid1 id2 mid2 rt1 word1 pUrvapaxa1 uwwarapaxa1 lifgam1 in
	               if (not (rel=[])) then rel 
                      (*&&  (finite_verb_in_sentence.val=1000 ||
                           finite_verb_in_sentence.val=id2  ||
                           finite_verb_in_sentence.val=id1) 
                      This condition creates a problem when a word has both sup and wif analysis and wif analysis is not the desired output. Ex: wena mama ayam mohaH vigawaH , here mohaH is not marked*)
                       else if    noun_agreement vacanam1 vacanam2 lifgam1 lifgam2
                      && viBakwiH2=1
                      && id1 < id2  (* This condition is added, to rule out the possibility of karwA in Sloka form when kqw precedes the noun as in gawaH rAmaH, or samavewAH pANdavAH, where gawaH and samavewAH should be marked as viSeRaNas and not rAmaH or pANdavAH as karwA *)
                   then if (members_of rt2 upasarga2 shliR_Axi_verbs
                       || members_of rt2 upasarga2 aaxikarma_verbs
                       || members_of rt2 upasarga2 gawyarWa_verbs
                       || rt2="ciw2")
                      (* || members_of rt2 upasarga2 akarmaka_verbs 
                       * in the case of akarmaka, karwa is abhihiwa in kwa *)
                      (* For ciw2, there is no rule by Panini.
                       * But we come across sentences such as 'rAjA cinwiwaH/ viRayaH ciwiwaH' *)
                       && not (member_of rt1 intensifiers_list)
                   then [ Relation (id1,mid1,"karwA",id2,mid2,"3.1" )
                        ; Relation (id1,mid1,"karma",id2,mid2,"3.2") ]
                   else if members_of rt2 upasarga2 akarmaka_verbs
                   then [ Relation (id1,mid1,"karwA",id2,mid2,"3.3" ) ]
                    (*3-4-71 AxikarmaNi kwaH karwari ca . 3-4-72 gawyarWAkarmakaSliRaSIfsWAZZsavasajanaruhajIryawiByaSca.
                      AxikarmaNi--rAmaH kataM prakqwaH,gawyarWa- rAmaH gqhaM gawaH... *)
                   (* ; Relation (id1,mid1,"karma",id2,mid2,"2.2") 
                        samavewAH yuyuwsvaH; here in shloka order, yuyuwsavaH is marked as a karma of samavewAH, which is wrong. *) 
                       (* kwayoreva.. *)  (* ?? DO Not mark karma; this is just samAnAXikaraNam *)
                   else if members_of rt2 upasarga2 sakarmaka_verbs   
                          (* && (pUrvapaxa2=uwwarapaxa2 || pUrvapaxa2="a") *)
                   then [ Relation (id1,mid1,"karma",id2,mid2,"3.4")]  
                      (*3-4-71 wayoreva kqwykwaKalarWAH rAmeNa granWaH paTiwaH *)
                   else if    members_of rt2 upasarga2 xvikarmaka1   
                           || members_of rt2 upasarga2 xvikarmaka2   
                   then [ Relation (id1,mid1,"muKyakarma",id2,mid2,"3.5")]  
                   else []
                   else []
                   (* Do not mark karma, this is samAnAXikarNa
                    match verb_type rt2 with
                     ["xvikarmakas2"
                     |"xvikarmakas1" 
                     |"gawyarWaka"
                     |"gawibuxXi"
                     |"prawyavasAnArWa"
                     |"sakarmaka"->
                      [ Relation (id1,mid1,"viSeRaNam",id2,mid2,"2.4")] (*rlkqwaBihiwa3*)
                     | _ -> [] 
                     ]  *)
             | 2 -> let rel = handle_sp_compounds id1 mid1 id2 mid2 rt1 word1 pUrvapaxa1 uwwarapaxa1 lifgam1 in
	             if (not (rel=[])) then rel 
                     else if (not (viBakwiH1 = viBakwiH2)
                           || members_of rt2 upasarga2 gawyarWa_verbs)
                     (* In case of gawyarWaka, e can have vanam gawaM raWam PaSya, where vanam is the karma of gawa, but if it is not a gawyarWaka verb then the karma will always be ukwa, and hence will have the same viBakwi as that of kwa, and in such cases we mark them as viSeRaNas, and do not mark the kaaraka relation *)
                     then if not (member_of word1 kAlAXvas)
   			&& (  members_of rt2 upasarga2 shliR_Axi_verbs
                           || members_of rt2 upasarga2 aaxikarma_verbs
                           )
                        (* This last condition is added to avoid the karma marking between vyUDam camUm paSya; here there should not be a karma rel between vyUDam and camUm; rather it should be a viSeRaNa *)
                     then [ Relation (id1,mid1,"karma",id2,mid2,"3.6")] 
                     (*else if members_of rt2 upasarga2 gawyarWa_verbs
                     then [ Relation (id1,mid1,"gawikarma",id2,mid2,"2.7a")] *)
                     (*else [ Relation (id1,mid1,"karma",id2,mid2,"2.7a")]
                       else if (uwwarapaxa1=pUrvapaxa1 ) || (pUrvapaxa1="a") 
		     then [ Relation (id1,mid1,"karma",id2,mid2,"2.4")] 
Why this condition? 
Counter example: sarva-BUwa-hiwe rawAH *)
                     else if members_of rt2 upasarga2 sakarmaka_verbs
                     then [ Relation (id1,mid1,"karma",id2,mid2,"3.7")] 
                     else if members_of rt2 upasarga2 xvikarmaka1
                           ||  members_of rt2 upasarga2 xvikarmaka2
                     then [ Relation (id1,mid1,"gONakarma",id2,mid2,"3.8")] 
                     else []
                     else [] (*  Why 2.8 is needed? wawkAlam pravqwwAH -> wawkAlam is marked as a karma for pra_vqw, which is asakarmaka [ Relation (id1,mid1,"karma",id2,mid2,"2.8")] *)
                    (* anaBihiwe karmaNi xviwIyA gurum upaSliRtaH , grAmaM gawaH, kataM prakqwaH*)
                     (* else [ Relation (id1,mid1,"viSeRaNam",id2,mid2,"2.5")]  Any example for this rule? *)
               | 3 ->  (* if viBakwiH2=1; why this condition? puwreNa vyUDAm camUm paSya *)
                    if    not (member_of word1 kAlAXvas)
                       && not (members_of rt2 upasarga2 shliR_Axi_verbs
                             || members_of rt2 upasarga2 gawyarWa_verbs
                             || members_of rt2 upasarga2 aaxikarma_verbs
                             || members_of rt2 upasarga2 akarmaka_verbs)
                       (* syanxane sWiwO; no karwA relation between the words *)
                       (* && not (member_of rt1 guNavacana)
                        * why this condition? counter example: bAlena XavalI-kqwam *)
                    then
                      [ Relation (id1,mid1,"karwA",id2,mid2,"3.9")] (* karwq_karaNayoH_wqwIyA rAmeNa granWaH paTiwaH*) 
                    else []
               | _ -> []
               ]
               else []
        | "ac" -> match viBakwiH1 with
                   [ 1 -> if noun_agreement vacanam1 vacanam2 lifgam1 lifgam2
                          && not (member_of rt1 intensifiers_list)
                      then [ Relation (id1,mid1,"karwA",id2,mid2,"3.10")] (* aBihiwe karwari praWamA , rAmaH gawavAn *) 
                      else []
                   | 2 -> if (  members_of rt2 upasarga2 sakarmaka_verbs
                             || members_of rt2 upasarga2 xvikarmaka2
                             || members_of rt2 upasarga2 xvikarmaka1)
                          && not (member_of word1 kAlAXvas)
            then let rel = handle_sp_compounds id1 mid1 id2 mid2 rt1 word1 pUrvapaxa1 uwwarapaxa1 lifgam1 in
	    if (not (rel=[])) then rel 
			  else (*if pUrvapaxa1=uwwarapaxa1 || pUrvapaxa1="a"
			  then *)[ Relation (id1,mid1,"karma",id2,mid2,"3.11")] (*rAmaH gqhaM gawavAn*) 
			  (*else []*)
                          else []
                   | _ -> []
                   ]
        | "kwavawu" 
        | "u" -> if not (viBakwiH2=7)
                       then match viBakwiH1 with
                   [ 1 -> if noun_agreement vacanam1 vacanam2 lifgam1 lifgam2
                          && not (member_of rt1 intensifiers_list)
                      then [ Relation (id1,mid1,"karwA",id2,mid2,"3.12")] (* aBihiwe karwari praWamA , rAmaH gawavAn *) 
                      else []
                   | 2 -> let rel = handle_sp_compounds id1 mid1 id2 mid2 rt1 word1 pUrvapaxa1 uwwarapaxa1 lifgam1 in
	    if (not (rel=[])) then rel 
                          else if  members_of rt2 upasarga2 sakarmaka_verbs
                          && not (member_of word1 kAlAXvas)
                          then (*if pUrvapaxa1=uwwarapaxa1 || pUrvapaxa1="a"
			  then *)
                          [ Relation (id1,mid1,"karma",id2,mid2,"3.13")] (*rAmaH gqhaM gawavAn*) 
                          else if members_of rt2 upasarga2 xvikarmaka2
                               || members_of rt2 upasarga2 xvikarmaka1
                          then [ Relation (id1,mid1,"muKyakarma",id2,mid2,"3.14")
                               ; Relation (id1,mid1,"gONakarma",id2,mid2,"3.15")]
			  else []
                   | _ -> []
                   ]
                   else []
        | "wavya"  
        | "wavyaw"  
        | "anIyar"  
        | "yaw"  
        | "kyap"  
        | "Nyaw"
        | "Kal"
        | "yuc"   -> match viBakwiH1 with
                 [ 1 -> if members_of rt2 upasarga2 sakarmaka_verbs && pUrvapaxa2=uwwarapaxa2|| pUrvapaxa2="a"
                   then [ Relation (id1,mid1,"karma",id2,mid2,"3.16")]  
                    (* rlkqwaBihiwa10  wayoreva kqwyakwaKalarWAH  rAmeNaH granWaH paTiwavyaH/paTanIyaH *)
                 else []
                 | 3 -> [ Relation (id1,mid1,"karwA",id2,mid2,"3.17")]  
                    (* karwq_karaNayoH_wqwIyA rAmeNaH granWaH paTiwavyaH/paTanIyaH*)
                 | _ -> []
                 ]
        | "SAnac_lat" 
        | "SAnac_lqt" 
        | "Sawq_lat" 
        | "Sawq_lqt" ->  if not (viBakwiH2=7) then 
                         let rel = handle_sp_compounds id1 mid1 id2 mid2 rt1 word1 pUrvapaxa1 uwwarapaxa1 lifgam1 in
	                 if (not (rel=[])) then rel 
                         else if viBakwiH1=2 && (members_of rt2 upasarga2 sakarmaka_verbs || members_of rt2 upasarga2 xvikarmaka1 || members_of rt2 upasarga2 xvikarmaka2) 
                         then [ Relation (id1,mid1,"karma",id2,mid2,"3.18")] 
                         (*else if not (viBakwiH2 = 7)  should viBhakiH2 not be = 4 ? *)
                         else if (viBakwiH1 = 4) (* kqpayA AviRtam viRixanwam waM --- BhG 2.1 *)
                         then [ Relation (id1,mid1,"prayojanam",id2,mid2,"3.19")]
			 else []
                         else if 
                              ((kqw2="Sawq_lat" || kqw2= "Sawq_lqt") && viBakwiH1=2)
                           || ((kqw2="SAnac_lat" || kqw2= "SAnac_lqt") && viBakwiH1=7)
                         then if (members_of rt2 upasarga2 sakarmaka_verbs || members_of rt2 upasarga2 xvikarmaka1 || members_of rt2 upasarga2 xvikarmaka2) 
                         then [ Relation (id1,mid1,"karma",id2,mid2,"3.20")] 
			 else []
			 else []
        | "wqc" 
        | "Nvul"  -> let rel = handle_sp_compounds id1 mid1 id2 mid2 rt1 word1 pUrvapaxa1 uwwarapaxa1 lifgam1 in
	             if (not (rel=[])) then rel 
                     else if viBakwiH1=2 && (members_of rt2 upasarga2 sakarmaka_verbs || members_of rt2 upasarga2 xvikarmaka1 || members_of rt2 upasarga2 xvikarmaka2)
                     then [ Relation (id1,mid1,"karma",id2,mid2,"3.21")] 
		     else []
	| "lyut" -> if viBakwiH1=3
                    then [ Relation (id1,mid1,"karwA",id2,mid2,"3.22")
                         ; Relation (id1,mid1,"karaNam",id2,mid2,"3.23")
                         ]
                    else if viBakwiH1=6 
                    then let rel = handle_sp_compounds id1 mid1 id2 mid2 rt1 word1 pUrvapaxa1 uwwarapaxa1 lifgam1 in
	            if (not (rel=[])) then rel 
                    else if (members_of rt2 upasarga2 sakarmaka_verbs) && (pUrvapaxa2=uwwarapaxa1 || pUrvapaxa1="a") 
                    then [ Relation (id1,mid1,"karma",id2,mid2,"3.24")] 
                    else []
                    else []
        | _ ->  let rel = handle_sp_compounds id1 mid1 id2 mid2 rt1 word1 pUrvapaxa1 uwwarapaxa1 lifgam1 in
	        if (not (rel=[])) then rel 
                else if viBakwiH1=6 && (members_of rt2 upasarga2 sakarmaka_verbs) && (pUrvapaxa2=uwwarapaxa1 || pUrvapaxa1="a") 
                then [ Relation (id1,mid1,"karma",id2,mid2,"3.25")] 
                else []
        ]
      else match kqw2 with (* Nic *)
        [ "kwa" -> match viBakwiH1 with
                [ 1 -> if noun_agreement vacanam1 vacanam2 lifgam1 lifgam2
                   then match verb_type rt2 upasarga2 with
                   [ "akarmaka" -> [ Relation (id1,mid1,"prayojyakarwA",id2,mid2,"3.26")] 
                   | "xvikarmaka1" -> [ Relation (id1,mid1,"gONakarma",id2,mid2,"3.27")] 
                   | "xvikarmaka2" -> [ Relation (id1,mid1,"muKyakarma",id2,mid2,"3.28")] 
                   | "gawi" -> [ Relation (id1,mid1,"prayojakakarwA",id2,mid2,"3.29")  
                          (* yajFaxawwaH xevaxawwaM grAmaM gamiwaH  gawibuxXi.. elevates prayojya_karwA to karma, hence xviwIyA *)
                           ; Relation (id1,mid1,"prayojyakarwA",id2,mid2,"3.30") (*yajFaxawwena xevaxawwaH pATaM kAriwaH *) 
                           ]
                   | _ ->  if  members_of rt2 upasarga2 shliR_Axi_verbs
                           then [ Relation (id1,mid1,"prayojakakarwA",id2,mid2,"3.31")  
                         (* yajFaxawwaH xevaxawwaM grAmaM gamiwaH  gawibuxXi.. elevates prayojya_karwA to karma, hence xviwIyA *)
                                ; Relation (id1,mid1,"prayojyakarwA",id2,mid2,"3.32") (*yajFaxawwena xevaxawwaH pATaM kAriwaH *) 
                                ]
                            else if members_of rt2 upasarga2 aaxikarma_verbs
                            then [ Relation (id1,mid1,"prayojakakarwA",id2,mid2,"3.33") (* AxikarmaNi,gawyarWAkarmaka... *) 
                                 ; Relation (id1,mid1,"prayojyakarwA",id2,mid2,"3.34") 
                                 ; Relation (id1,mid1,"karma",id2,mid2,"3.35") 
                                 ]
                            else [ Relation (id1,mid1,"karma",id2,mid2,"3.36") ]
                   ]
                   else []
             | 2 ->  if not (member_of word1 kAlAXvas) && not (rt1 = "kevala")
                     then match verb_type rt2 upasarga2 with
                   ["akarmaka" -> [ Relation (id1,mid1,"prayojyakarwA",id2,mid2,"3.37")] 
                   | "xvikarmaka1" ->  [ Relation (id1,mid1,"muKyakarma",id2,mid2,"3.38")] 
                   | "xvikarmaka2" ->  [ Relation (id1,mid1,"gONakarma",id2,mid2,"3.39")] 
                   | _ -> let rel = handle_sp_compounds id1 mid1 id2 mid2 rt1 word1 pUrvapaxa1 uwwarapaxa1 lifgam1 in
	                  if (not (rel=[])) then rel 
                          else if (uwwarapaxa1=pUrvapaxa1 ) || (pUrvapaxa1="a")
		          then [ Relation (id1,mid1,"karma",id2,mid2,"3.40")] 
                          else [ Relation (id1,mid1,"prayojyakarwA",id2,mid2,"3.41") 
                               ; Relation (id1,mid1,"karma",id2,mid2,"3.42") 
                               ]
                   ]
                   else []
             | 3 ->  if not (member_of word1 kAlAXvas)
		     then match verb_type rt2 upasarga2 with
                  ["gawi" -> [ Relation (id1,mid1,"prayojakakarwA",id2,mid2,"3.43")] 
                  | "xvikarmaka1"
                  | "xvikarmaka2" -> [ Relation (id1,mid1,"prayojakakarwA",id2,mid2,"3.44") 
                                     ; Relation (id1,mid1,"prayojyakarwA",id2,mid2,"3.45") 
                                     ]
                  | "sakarmaka"  ->
                         [ Relation (id1,mid1,"prayojakakarwA",id2,mid2,"3.46") ]
                  |_ -> if members_of rt2 upasarga2 shliR_Axi_verbs 
                    then [ Relation (id1,mid1,"prayojakakarwA",id2,mid2,"3.47")] 
                    else if members_of rt2 upasarga2 aaxikarma_verbs
                    then [ Relation (id1,mid1,"prayojakakarwA",id2,mid2,"3.48") 
                         ; Relation (id1,mid1,"prayojyakarwA",id2,mid2,"3.49") 
                         ]
                    else [ Relation (id1,mid1,"prayojakakarwA",id2,mid2,"3.50")] 
                 ]
                   else []
              | _ -> []
              ]
        | "kwavawu" -> match viBakwiH1 with
                   [ 1 -> if noun_agreement vacanam1 vacanam2 lifgam1 lifgam2
                      then [ Relation (id1,mid1,"prayojakakarwA",id2,mid2,"3.51")]   
                      else []
                   | 2 -> if not (member_of word1 kAlAXvas)
                             && members_of rt2 upasarga2 sakarmaka_verbs
                      then [ Relation (id1,mid1,"prayojyakarwA",id2,mid2,"3.52")] (* To write and check *) 
                    else []
                   | _ -> []
                   ]
          | "wavya"  
          | "wavyaw"  
          | "anIyar"  
          | "yaw"  
          | "kyap"  
          | "Nyaw"
          | "Kal"
          | "yuc"   -> if members_of rt2 upasarga2 sakarmaka_verbs && (pUrvapaxa2=uwwarapaxa2 || pUrvapaxa2="a")
              then [ Relation (id1,mid1,"karma",id2,mid2,"3.53")] 
            else []
          | "SAnac_lat" 
          | "SAnac_lqt" 
          | "Sawq_lat" 
          | "Sawq_lqt" ->  let rel = handle_sp_compounds id1 mid1 id2 mid2 rt1 word1 pUrvapaxa1 uwwarapaxa1 lifgam1 in
	    if (not (rel=[])) then rel 
            else if viBakwiH1=2 && (members_of rt2 upasarga2 sakarmaka_verbs) 
            then [ Relation (id1,mid1,"karma",id2,mid2,"3.54")]
            else []
          | _ ->  []
          ]
     else []
     | _-> []
     ]
  | _ -> []
  ]
;
(* Verb - Noun relations:

   Examples: vqkRAw parNam pawawi
   ;grAmAw gawam rAmam SyAmaH paSyawi 
   ;grAmawaH SyAmaH AgacCawi
   Paninian sutra: apAxAne paFcamI

   Examples: piwA rAmAya puswakam xaxAwi
        ;piwA rAmAya xAwum puswakam krINAwi
        ;piwA rAmAya xawwam Palam KAxawi 
   Paninian sutra: sampraxAne cawurWI 

   Example: rAmaH xAwreNa pAxapam lunAwi
        rAmaH SyAmena xAwreNa lunam pAxapam paSyawi 
   Paninian sutra: (karwq)karaNayoH wqwIyA

   Examples: rAmaH aXyayanena grAme vasawi
         jIviwasya hewoH api Xarmam na wyajew.
   Paninian sutra: 

  Examples: vqkRe sWiwam rAmam SyAmaH kaWAm kaWayawi
        ;kapiH vqkRe vasawi
        ;grAme vasiwum rAmaH icCawi
  Paninian sutra: AXAro aXikaraNam

  Examples:rAmaH yuxXAya wvarayA/vegena gacCawi.
       rAmaH brAhmaNAya paTanAya puswakam xaxAwi.
  Paninian sutra:  (prayojana) 
 
  rAmaH SyAmasya gqham gacCawi
  Paninian sutra: ReRe RaRTI
*)

value anaBihiwe m1 m2 id1 mid1 rt1 word1 uwwarapaxa1 lifgam1 viBakwiH1 id2 mid2 rt2 upasarga2 kqw1 kqw2 text_type =
   match viBakwiH1 with
       [ 3 -> if (rt2="yaj1")
                   then [ Relation (id1,mid1,"karma",id2,mid2,"4.1")] (* yajeH karmaNaH karaNa saFjFA  vArwika*)
	           else if (member_of rt1 kAlAXvas)
                        then [ Relation (id1,mid1,"apavarga_sambanXaH",id2,mid2,"4.2")] (* xevaxawwena mAsena pATaH aXIwaH apavarge wqwIyA A 2.3.6 *)  (* yogyawA *)
                        
                        else 
                            if members_of rt2 upasarga2 karaNa_verbs
                             then if member_of rt1 shabxavAci_nouns
                                  then [ Relation (id1,mid1,"karaNam",id2,mid2,"4.3") ]  (*karwq karaNayoswqwIyA - yAnena gacCawi*) 
                                   else if member_of rt1 buxXivAci_nouns
                                       then [ Relation (id1,mid1,"karaNam",id2,mid2,"4.4") ]  (*karwq karaNayoswqwIyA - yAnena gacCawi*) 
                                       else if not (member_of rt1 guNa_not_guNavacana) && not (is_human rt1)
                                       then [ Relation (id1,mid1,"karaNam",id2,mid2,"4.5")   (*karwq karaNayoswqwIyA - yAnena gacCawi*) 
                                            ; Relation (id1,mid1,"hewuH",id2,mid2,"4.6") ]
                                       else [ Relation (id1,mid1,"hewuH",id2,mid2,"4.7") ]
                              else if (rt2="jFA2" && upasarga2 = "sam")
                     (* samjFonyawarasyAm karmaNi A. 2.3.22 -mAwrA saFjAnIwe *) 
                    || (rt2="hu1" && text_type="Vedic")
                     (* wqwIyA ca hoSCanxasi A 2.3.3 - yavAgvA juhowi *)
                                   then if not (member_of rt1 guNa_not_guNavacana) (*|| pronominal123 rt1*)
                                            then [ Relation (id1,mid1,"karma",id2,mid2,"4.8") ]
                                            else [ Relation (id1,mid1,"hewuH",id2,mid2,"4.9") ]
                                   else (* if not (member_of rt1 guNa_not_guNavacana) *)
                                           [ Relation (id1,mid1,"hewuH",id2,mid2,"4.10") ] (* annena vasawi *) 
           (* anaBihiwa karwA -> rlanaBihiwakarwA *)
       | 4 ->  if members_of rt2 upasarga2 sampraxAna_verbs
               (*then if member_of rt1 animate_nouns
                * This has problems. saH pATaSAlAyE Xanam xaxAwi will fail to assign sampraxAna to pATaSAlA *)
               then if not (member_of rt1 guNa_not_guNavacana) && not (lifgam1="napuM") 
               (* && kqw1=0 The first word can be a kqw as in xuRteByaH kruXyawu ; Hence this condition is commented. *)
                    then [ Relation (id1,mid1,"sampraxAnam",id2,mid2,"4.11")  (* rajakAya xaxAwi *)
                         ; Relation (id1,mid1,"prayojanam",id2,mid2,"4.12")]  (* rajakAya xaxAwi *)
                    else [ Relation (id1,mid1,"prayojanam",id2,mid2,"4.13")] (* prakRAlanAya xaxAwi *)
                         (*cawurWI sampraxAne 2-3-13  viprAya xaxAwi *) 
            (*    else if  members_of rt2 upasarga2 gawyarWa_verbs 
                    then [ Relation (id1,mid1,"karma",id2,mid2,"3.8b") ] दास्योः वचनेषु महिष्याः निर्-अतिशया श्रद्धा भवति
             (* gawyarWakarmaNi xviwIyAcawurWyO ceRtAyAmanaXvani 2-3-12 rAmaH grAmAya gacCawi 
              * Malay -- whether sampraxAna or karma ? *) 
             -- overgeneration
e.g. saH prAwaH BramaNAya gacCawi -- Amruta   14 July 2020
             *)
                    else if rt2="man1" 
                         then [ Relation (id1,mid1,"karmasamAnAXikaraNam",id2,mid2,"4.14") ]
                (* manyakarmaNyanAxare viBARAZprANiRu 2-3-17 ahaM wvAM wqNAya manye / aham wvA wqNAya manye *)
                         else [ Relation (id1,mid1,"prayojanam",id2,mid2,"4.15")] (* puwrAya puswakaM krINAwi *) 
       | 5 -> if members_of rt2 upasarga2 apAxAna_verbs
                    then if pronominal123 rt1
                        then [ Relation (id1,mid1,"apAxAnam",id2,mid2,"4.16")
                             ; Relation (id1,mid1,"hewuH5",id2,mid2,"4.17") ]
                    else if not(member_of rt1 guNa_not_guNavacana) || (kqw1=1)  (* allow kqxanwas also  -- xAwqByaH Xanam laBanwe *)
                         then [ Relation (id1,mid1,"apAxAnam",id2,mid2,"4.18")  (* apAxAne paFcamI  - rAmaH grAmAw AgacCawi / raveH lokaH prakASam aXigacCawi *) 
                              ;  Relation (id1,mid1,"hewuH5",id2,mid2,"4.19")] (* raveH lokaH suKam aXigacCawi *) 
                             else [ Relation (id1,mid1,"hewuH5",id2,mid2,"4.20") ]   (* BayAw nirgacCawi *)
                   else if   rt1="swoka" 
                           || rt1="alpa" 
                           || rt1="kqcCra"
                           || rt1="kawipaya"
                        then [ Relation (id1,mid1,"karaNam",id2,mid2,"4.21")] 
             (* karaNe ca swokAlpakqcCrakawipayasyAsawwvavacanasya 2-3-33 - swokAw mukwaH *)
                        else if (member_of rt1 guNavacana) (* yogyawA *)
                             then [ Relation (id1,mid1,"hewuH5",id2,mid2,"4.22")] (* viBARA guNe aswriyAm 2-3-25 - jAdyAw baxXaH*)  
                             else if (member_of word1 kAlAXvas)
                                  then [ Relation (id1,mid1,"aXikaraNam",id2,mid2,"4.23") ] (* sapwamIpaFcamyO kArakamaXye A 2.3.7 
                                                                                                -- kroSAw lakRyam viXyawi *)
                                  else if (rt2="xqS1" || (rt2="IkR1" && upasarga2="pra")) (* prAsAxAw prekRyawe and AsanAw prekRyawe *)
                                       then [ Relation (id1,mid1,"lyapkarmAXikaraNam",id2,mid2,"4.24") 
                                            ; Relation (id1,mid1,"hewuH5",id2,mid2,"4.25") ]
                                       else [ Relation (id1,mid1,"hewuH5",id2,mid2,"4.26") ] (* हेतौ पञ्चमी वा स्यादिस्यर्थः।A bAlamanorama tIkA *)
            (* else if word1="wasmAw" || word1="yasmAw"
                 then [ Relation (id1,mid1,"hewuH",id2,mid2,"3.19")]  
	         else [] *)
       | 6 -> if (  rt2="vi_ava_hq1" || rt2="paNa1" || rt2="xiv1")
          then [ Relation (id1,mid1,"karma",id2,mid2,"4.27") ]  
           (* vyavahqpaNoH samarWayoH 2-3-57 -- Sawasya vyavaharawi,
              xivaswaxarWasya 2-3-58 xiv1 if it is in vyavahAra arWa-- Sawasya xIvyawi*)
            else []
       | 7  -> if (upasarga2="aXi" && (rt2="SIf1" || rt2="sWA1"))
               then if member_of word1 kAlAXikaraNas (* praBAwe vEkuNTam wiRTawi *)
               then [ Relation (id1, mid1, "kAlAXikaraNam", id2, mid2,"4.28") ]
               else [] 
               else if (rt2="gam1" || rt2="SAs1" || rt2="syanx1")
               then if member_of word1 kAlAXikaraNas (* praBAwe vEkuNTam wiRTawi *)
               then [ Relation (id1, mid1, "kAlAXikaraNam", id2, mid2,"4.29") ]
               else [ Relation (id1, mid1, "aXikaraNam", id2, mid2,"4.30") ]
               else match m1 with
               [  Kqw (id1,mid1,word1,_,_,_,kqw_prawyayaH1,_,_,_,rt1,_,_,_,viBakwiH1,_,_) ->
                   if not (kqw_prawyayaH1="Sawq_lat" 
                        || kqw_prawyayaH1="SAnac" 
                        || kqw_prawyayaH1="kwa" 
                        || kqw_prawyayaH1="kwavawu") 
                      (* covered in BAvalakRaNa sapwamI 
                         praBAwe -- Sawq_lat; is aXikaraNa  Hence above condition is commented 14 April 2017 
 ... gacCawi ... paTawi; here gacCawi is marked as aXikaraNa. To stop this, again this is uncommented. 26th May 2018 *)
                  then  [ Relation (id1, mid1, (aXikaraNa_type word1 rt1), id2, mid2,"4.31")] 
                  else [] 
               | _ -> [ Relation (id1, mid1, (aXikaraNa_type word1 rt1), id2, mid2,"4.32") ]
               ]
       | 8 ->  match m2 with
           [ Wif (id2,mid2,_,rt2,_,_,upasarga2,sanAxiH2,_,lakAraH2,puruRaH2,_,_,_,_,_) -> 
           if (compound word1 uwwarapaxa1  || rt1="brahma" || rt1 = "miwra" || not (lifgam1 = "napuM")) 
            && ((id1 <= 2 && text_type = "Prose") || text_type = "Sloka")
             (* if ((lakAraH2="lot") && (puruRaH2="ma"))
              then [ Relation (id1,mid1,"samboXyaH",id2,mid2,"3.14")]
              else [] *)
              then [ Relation (id1,mid1,"samboXyaH",id2,mid2,"4.33")]
              else [ ]
           | Kqw (id2,mid2,_,_,_,_,kqw_prawyayaH2,_,_,_,_,_,_,_,viBakwiH2,_,_) -> 
               if (kqw_prawyayaH2="kwa" || kqw_prawyayaH2="kwavawu" || kqw_prawyayaH2="ac" || kqw_prawyayaH2="yaw") 
                 && (viBakwiH2=1) 
                 && (id2 = total_wrds.val)
          (* Need an example where the kwAnwa is not at the end, and has a relation with kamboXya, in Sloka form. This was overgenerating solutions. Only when an example is provided, we can uncomment this condition 
           * || text_type="Sloka")  *)
                 && ((id1 < 2 && text_type = "Prose") || text_type = "Sloka")
               (* To establish a relation between rAma and gawaH in 'rAma saH gawaH', but to stop such a relation in 'rAma gawaH saH mama puwraH aswi. *)
    (*           
Counter ex for napum: anawa-rUpa wvayA viSvam wawam
if (not (lifgam1="napuM") && kqw_prawyayaH2="kwa" || kqw_prawyayaH2="kwavawu" || kqw_prawyayaH2="ac" || kqw_prawyayaH2="yaw") && (viBakwiH2=1) && id2 = total_wrds.val  *)
               then [ Relation (id1,mid1,"samboXyaH",id2,mid2,"4.34")]
              else []
           |  _ -> []
           ]
       | 2  -> (* covered in rlwifkarwA_karma and rlkqwkarwA_karma *)
           if (member_of rt1 kAlAXvas)
           then [ Relation (id1,mid1,"awyanwasaMyoga_sambanXaH",id2,mid2,"4.35")] (* xevaxawwaH mAsam pATam aXIwe kAlAXvanorawyanwasaMyoge A 2.3.5 *)  (* yogyawA *)
           else if member_of (uwwarapaxa1^" "^string_of_int viBakwiH1) kriyAviSeRaNas (* yogyawA *) && lifgam1="napuM"
           then [ Relation (id1,mid1,"kriyAviSeRaNam",id2,mid2,"4.36")] 
           else [] (* rlwifanaBihiwakarma rlkqwanaBihiwakarma *)
       | _ -> [] (* raise an exception *)
       ]
;

value rlanaBihiwe m1 m2 text_type = match m2 with
  [ Wif (id2,mid2,_,rt2,_,_,upasarga2,_,_,_,_,_,_,_,_,_)
  | Avykqw (id2,mid2,_,rt2,_,_,upasarga2,_,_,_,_,_) -> 
     match m1 with
     [ Sup (id1,mid1,word1,rt1,_,uwwarapaxa1,lifgam1,viBakwiH1,_,_) ->
       if prose_order id1 id2 text_type
         &&  no_boundary_crossing id1 id2 text_type
       then let kqw1=0 in let kqw2=0 in anaBihiwe m1 m2 id1 mid1 rt1 word1 uwwarapaxa1 lifgam1 viBakwiH1 id2 mid2 rt2 upasarga2 kqw1 kqw2 text_type
       else []
     | Kqw (id1,mid1,word1,_,_,_,kqw1,_,_,_,rt1,_,uwwarapaxa1,lifgam1,viBakwiH1,_,_) ->
       if prose_order id1 id2 text_type (* check for leKani etc. *)
         &&  no_boundary_crossing id1 id2 text_type
       (*then if (* kqw1="wqc" && *) (viBakwiH1=3 || viBakwiH1 = 5)
Why this condition of 3 & 5 and hewu? We should write this in anaBihiwe itself!
       then [ Relation (id1,mid1,"hewuH",id2,mid2,"3.25")] 
       else *) 
       then let kqw1=1 in let kqw2=0 in anaBihiwe m1 m2 id1 mid1 rt1 word1 uwwarapaxa1 lifgam1 viBakwiH1 id2 mid2 rt2 upasarga2 kqw1 kqw2 text_type
       else []
     | WaxXiwa (id1,mid1,word1,rt1,_,uwwarapaxa1,waxXiwa_prawyayaH1,lifgam1,viBakwiH1,_,_) -> 
       if prose_order id1 id2 text_type
         &&  no_boundary_crossing id1 id2 text_type
       then if  waxXiwa_prawyayaH1="wva" && viBakwiH1=5
       then [ Relation (id1,mid1,"hewuH5",id2,mid2,"4.37")] 
       else let kqw1=0 in let  kqw2=0 in anaBihiwe m1 m2 id1 mid1 rt1 word1 uwwarapaxa1 lifgam1 viBakwiH1 id2 mid2 rt2 upasarga2 kqw1 kqw2 text_type
       else []
     | _ -> []
     ]
  | Kqw (id2,mid2,_,rt2,upasarga2,_,_,_,_,_,_,_,_,_,viBakwiH2,_,_) ->
       match m1 with
       [ Sup (id1,mid1,word1,rt1,_,uwwarapaxa1,lifgam1,viBakwiH1,_,_)
       | WaxXiwa (id1,mid1,word1,rt1,_,uwwarapaxa1,_,lifgam1,viBakwiH1,_,_) -> 
            if prose_order id1 id2 text_type && not (viBakwiH2 = 8)
            &&  no_boundary_crossing id1 id2 text_type
            then let kqw1=0 in let kqw2=1 in anaBihiwe m1 m2 id1 mid1 rt1 word1 uwwarapaxa1 lifgam1 viBakwiH1 id2 mid2 rt2 upasarga2 kqw1 kqw2 text_type
            else []
       | Kqw (id1,mid1,word1,_,_,_,_,_,_,_,rt1,_,uwwarapaxa1,lifgam1,viBakwiH1,_,_) ->
            if prose_order id1 id2 text_type && not (viBakwiH2 = 8)
            &&  no_boundary_crossing id1 id2 text_type
            then let kqw1=1 in let kqw2=1 in anaBihiwe m1 m2 id1 mid1 rt1 word1 uwwarapaxa1 lifgam1 viBakwiH1 id2 mid2 rt2 upasarga2 kqw1 kqw2 text_type
            else []
       | _ -> []
       ]
  | _ -> []
  ]
  ;


value rlAvykqw_karma m1 m2 text_type = match m2 with
  [ Avykqw (id2,mid2,_,rt2,_,_,upasarga2,sanAxiH2,_,_,_,_) -> match m1 with
     [ WaxXiwa (id1,mid1,word1,rt1,pUrvapaxa1,uwwarapaxa1,_,lifgam1,viBakwiH1,_,_) 
     | Kqw (id1,mid1,word1,_,_,_,_,_,_,_,rt1,pUrvapaxa1,uwwarapaxa1,lifgam1,viBakwiH1,_,_)
     | Sup (id1,mid1,word1,rt1,pUrvapaxa1,uwwarapaxa1,lifgam1,viBakwiH1,_,_) -> 
       if  prose_order id1 id2 text_type && no_boundary_crossing id1 id2 text_type
       then match viBakwiH1 with
        [ 2 -> if not (member_of word1 kAlAXvas)
        then match verb_type rt2 upasarga2 with
              [ "xvikarmaka1" 
              | "xvikarmaka2" -> [ Relation (id1,mid1,"gONakarma",id2,mid2,"5.1" )  
                                (* karmaNi xviwIyA  - rAjAnaM vasuXAM yAcawe*)
                               ; Relation (id1,mid1,"muKyakarma",id2,mid2,"5.2" )  
                                (* karmaNi xviwIyA - gAM xogXi payaH *)
                                  ]
              | "gawi"
              | "buxXi" 
              | "Sabxakarma" 
              | "prawyavasAnArWa"
              | "sakarmaka" -> if not (sanAxiH2="Nic")
                               then let rel = handle_sp_compounds id1 mid1 id2 mid2 rt1 word1 pUrvapaxa1 uwwarapaxa1 lifgam1 in
	                       if (not (rel=[])) then rel 
                               else [ Relation (id1,mid1,"karma",id2,mid2,"5.3" )] (* karmaNi xviwIyA *) 
                               else [ Relation (id1,mid1,"prayojyakarwA",id2,mid2,"5.4") 
                                    ; Relation (id1,mid1,"karma",id2,mid2,"5.5") 
                               ]
              | "akarmaka" -> if (sanAxiH2="Nic")
                              then let rel = handle_sp_compounds id1 mid1 id2 mid2 rt1 word1 pUrvapaxa1 uwwarapaxa1 lifgam1 in
	                      if (not (rel=[])) then rel 
                              else [ Relation (id1,mid1,"karma",id2,mid2,"5.6")] 
                              else []
              | _ -> []
              ] 
              else []
        | _ -> []
        ]
        else []
    | _ -> []
     ]
  | _ -> []
  ]
;

(* Examples: grAmawaH ganwum icCanwam rAmam SyAmaH kaWAm kaWayawi *)
value rlapAxAna_wasil m1 m2 text_type = match m2 with
  [ Wif (id2,mid2,_,rt2,_,_,upasarga2,_,_,_,_,_,_,_,_,_)
  | Kqw (id2,mid2,_,rt2,upasarga2,_,_,_,_,_,_,_,_,_,_,_,_) 
  | Avykqw (id2,mid2,_,rt2,_,_,upasarga2,_,_,_,_,_) ->
     match m1 with
     [ AvywaxXiwa (id1,mid1,word1,rt1,_,_,taddhita1,_)->
       if prose_order id1 id2 text_type  && taddhita1="wasil" && no_boundary_crossing id1 id2 text_type
       then if members_of rt2 upasarga2 apAxAna_verbs && (not(member_of rt1 guNavacana) || pronominal123 rt1)
       then [ Relation (id1,mid1,"apAxAnam",id2,mid2,"6.1")] 
     (*  This leads to over generalisation, since only few waH ending words are kriyAviSeRaNas. We list them in the kriyAviSeRaNa list
 else if not (member_of rt1 xravyavAcI) 
       then [ Relation (id1,mid1,"kriyAviSeRaNam",id2,mid2,"5.2")]  *)
       else if member_of (word1^" avy") kriyAviSeRaNas
       then [ Relation (id1,mid1,"kriyAviSeRaNam",id2,mid2,"6.2")] 
       else [ Relation (id1,mid1,"hewuH5",id2,mid2,"6.3")] 
       else []
     | Avy (id1,mid1,word1,_,_,uwwarapaxa1,_) -> 
       if prose_order id1 id2 text_type && no_boundary_crossing id1 id2 text_type && (word1="wawaH" || word1="kuwaH")
       then if members_of rt2 upasarga2 apAxAna_verbs
       then [ Relation (id1,mid1,"apAxAnam",id2,mid2,"6.4")] 
       else []
       else []
     |_ -> []
     ]
  | _ -> []
  ]
  ;
(* aSvaH vegena XAvawi.*)
(* ;rAmaH brAhmaNavaw aXIwe *)
value rlAvy_kriyAviSeRaNam_or_aXikaraNam m1 m2 text_type = match m2 with
  [ Wif (id2,mid2,word2,_,_,uwwarapaxa2,_,_,_,_,_,_,_,_,_,_) 
  | Avykqw (id2,mid2,word2,_,_,uwwarapaxa2,_,_,_,_,_,_) -> 
    (* kaWam waw jFeyam ? *)
     if not (word2=uwwarapaxa2) then []
     else match m1 with
     [ Avykqw (id1,mid1,word1,_,_,uwwarapaxa1,_,_,_,_,_,_)
     | Avy (id1,mid1,word1,_,_,uwwarapaxa1,_) -> 
       if prose_order id1 id2 text_type 
       then if word1="yaxA" 
            then if id2 < waxA_pos.val 
                 then kv_or_spl_aXi id1 mid1 id2 mid2 uwwarapaxa1 
                 else []
            else kv_or_spl_aXi id1 mid1 id2 mid2 uwwarapaxa1
       else []
     | AvywaxXiwa (id1,mid1,word1,_,_,uwwarapaxa1,taddhita1,_) -> 
       if prose_order id1 id2 text_type && taddhita1="vaw" 
       then [ Relation (id1,mid1,"kriyAviSeRaNam",id2,mid2,"7.1")]
       else kv_or_spl_aXi id1 mid1 id2 mid2 uwwarapaxa1 
     (* | Sup (id1,mid1,word1,_,_,uwwarapaxa1,_,_,_,_)->
       if  prose_order id1 id2 text_type 
       then kv_or_spl_aXi id1 mid1 id2 mid2 uwwarapaxa1
       else [] 
    This is covered under anaBihiwe 3.20 *)
     |_ -> []
     ]
  | Kqw (id2,mid2,word2,_,_,_,kqw_prawyaya2,_,_,_,_,uwwarapaxa2,_,_,_,_,_)   ->
     if not (word2=uwwarapaxa2) then []
     else if kqw_prawyaya2 ="kwa" || kqw_prawyaya2 ="kwavawu"
     then match m1 with
     [ Avykqw (id1,mid1,word1,_,_,uwwarapaxa1,_,_,_,_,_,_)
     | Avy (id1,mid1,word1,_,_,uwwarapaxa1,_) -> 
       if prose_order id1 id2 text_type 
       then if word1="yaxA" 
            then if id2 < waxA_pos.val 
                 then kv_or_spl_aXi id1 mid1 id2 mid2 uwwarapaxa1 
                 else []
            else kv_or_spl_aXi id1 mid1 id2 mid2 uwwarapaxa1
       else []
     | AvywaxXiwa (id1,mid1,word1,_,_,uwwarapaxa1,taddhita1,_) -> 
       if prose_order id1 id2 text_type && taddhita1="vaw" 
       then [ Relation (id1,mid1,"kriyAviSeRaNam",id2,mid2,"7.2")]
       else kv_or_spl_aXi id1 mid1 id2 mid2 uwwarapaxa1 
     (* | Sup (id1,mid1,word1,_,_,uwwarapaxa1,_,_,_,_)->
       if  prose_order id1 id2 text_type 
       then kv_or_spl_aXi id1 mid1 id2 mid2 uwwarapaxa1
       else [] 
    This is covered under anaBihiwe 3.20 *)
     |_ -> []
     ]
     else []
  | _ -> []
  ]
  ;

value rlkriyAviSeRaNam_wqwIyA m1 m2 text_type = match m2 with
  [ Wif (id2,mid2,_,_,_,_,_,_,_,_,_,_,_,_,_,_) 
  | Kqw (id2,mid2,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_)  
  | Avykqw (id2,mid2,_,_,_,_,_,_,_,_,_,_) -> 
     match m1 with
     [ WaxXiwa (id1,mid1,_,_,_,uwwarapaxa1,_,_,viBakwiH1,_,_) 
     | Kqw (id1,mid1,_,_,_,_,_,_,_,_,_,_,uwwarapaxa1,_,viBakwiH1,_,_)
     | Sup (id1,mid1,_,_,_,uwwarapaxa1,_,viBakwiH1,_,_) -> 
            if (member_of (uwwarapaxa1^" "^string_of_int viBakwiH1) kriyAviSeRaNas) (* yogyawA *) (*&& lifgam1="napuM"*)
            then [ Relation (id1,mid1,"kriyAviSeRaNam",id2,mid2,"8.1")] (* vegena XAvawi *)  (* yogyawA *)
            else []
     | _ -> []
     ]
  | _ -> []
  ]
;

value rl_spl_aXikaraNam m1 m2 text_type = match m2 with
  [ Wif (id2,mid2,_,_,_,_,_,_,_,_,_,_,_,_,_,_) ->
     match m1 with
     [ Avy (id1,mid1,word1,_,_,uwwarapaxa1,_) -> 
       if prose_order id1 id2 text_type 
       then if (word1="yaxA" && id2 < waxA_pos.val ) 
              || word1="waxA"
            then [ Relation (id1,mid1,"kAlAXikaraNam",id2,mid2,"60.1") ]
            else if (word1="yawra" && id2 < wawra_pos.val )
                 || word1="wawra"
            then [ Relation (id1,mid1,"xeSAXikaraNam",id2,mid2,"60.2") ]
            else []
       else if (word1="yaxA"  || word1="waxA") && text_type="Sloka"
            then [ Relation (id1,mid1,"kAlAXikaraNam",id2,mid2,"60.3") ]
            else if (word1="yawra" || word1="wawra") && text_type="Sloka"
            then [ Relation (id1,mid1,"xeSAXikaraNam",id2,mid2,"60.4") ]
            else []
     |_ -> []
     ]
  | Kqw (id2,mid2,_,_,_,_,kqw2,_,_,_,_,_,_,_,_,_,_) ->
     if kqw2 = "anIyar" || kqw2 = "yaw" || kqw2 = "kwa" || kqw2 = "kwavawu"|| kqw2 = "wavyaw"
     then match m1 with
     [ Avy (id1,mid1,word1,_,_,uwwarapaxa1,_) -> 
       if prose_order id1 id2 text_type 
       then if (word1="yaxA" && id2 < waxA_pos.val ) || word1="waxA"
            then [ Relation (id1,mid1,"kAlAXikaraNam",id2,mid2,"60.5") ]
            else if (word1="yawra" && id2 < wawra_pos.val ) || word1="wawra"
            then [ Relation (id1,mid1,"xeSAXikaraNam",id2,mid2,"60.6") ]
            else []
       else if (word1="yaxA"  || word1="waxA") && text_type="Sloka"
            then [ Relation (id1,mid1,"kAlAXikaraNam",id2,mid2,"60.7") ]
            else if (word1="yawra" || word1="wawra") && text_type="Sloka"
            then [ Relation (id1,mid1,"xeSAXikaraNam",id2,mid2,"60.8") ]
            else []
     |_ -> []
     ]
     else []
  | _ -> []
  ]
  ;

value rlviRayAXikaraNam m1 m2 text_type = match m2 with
   [ Sup (id2,mid2,_,rt2,_,_,_,_,_,_)
   | Kqw (id2,mid2,_,_,_,_,_,_,_,_,rt2,_,_,_,_,_,_)
   | WaxXiwa (id2,mid2,_,rt2,_,_,_,_,_,_,_) -> 
      match m1 with
      [ Sup (id1,mid1,_,_,_,_,_,viBakwiH1,_,_)
      | Kqw (id1,mid1,_,_,_,_,_,_,_,_,_,_,_,_,viBakwiH1,_,_)
      | WaxXiwa (id1,mid1,_,_,_,_,_,_,viBakwiH1,_,_) ->
       if prose_order id1 id2 text_type && no_boundary_crossing id1 id2 text_type
       then match viBakwiH1 with
       [ 7 -> if member_of rt2 viRayAXikaraNa_nouns
          then [ Relation (id1,mid1,"viRayAXikaraNam",id2,mid2,"9.1")] 
          else []
       | _ -> []
       ]
       else []
      | _ -> []
      ]
   | _ -> []
   ]
;

value rlaXikaraNam m1 m2 text_type = match m2 with
   [ Wif (id2,mid2,_,_,_,_,_,_,_,_,_,_,_,_,_,_) 
   | Kqw (id2,mid2,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_)
   | Avykqw (id2,mid2,_,_,_,_,_,_,_,_,_,_) -> 
      match m1 with
      [ Sup (id1,mid1,word1,_,_,_,_,viBakwiH1,_,_)
      | WaxXiwa (id1,mid1,word1,_,_,_,_,_,viBakwiH1,_,_) ->
       if prose_order id1 id2 text_type && no_boundary_crossing id1 id2 text_type
       then if member_of word1 kAlAXikaraNas
            then  [ Relation (id1,mid1, "kAlAXikaraNam",id2,mid2,"10.1")] 
            else if member_of word1 xeSAXikaraNas
                 then  [ Relation (id1,mid1, "xeSAXikaraNam",id2,mid2,"10.2")] 
                 else []
       else []
      | Kqw (id1,mid1,word1,_,_,_,kqw_prawyayaH1,_,_,_,rt1,_,_,_,viBakwiH1,_,_) ->
             if not (kqw_prawyayaH1="Sawq_lat"
                  || kqw_prawyayaH1="SAnac"
                  || kqw_prawyayaH1="kwa"
                  || kqw_prawyayaH1="kwavawu")
             &&  prose_order id1 id2 text_type && no_boundary_crossing id1 id2 text_type
       then if member_of word1 kAlAXikaraNas
            then  [ Relation (id1,mid1, "kAlAXikaraNam",id2,mid2,"10.3")] 
            else if member_of word1 xeSAXikaraNas
                 then  [ Relation (id1,mid1, "xeSAXikaraNam",id2,mid2,"10.4")] 
                 else []
       else []
                      (* covered in BAvalakRaNa sapwamI
                         praBAwe -- Sawq_lat; is aXikaraNa  Hence above condition is commented 14 April 2017
 ... gacCawi ... paTawi; here gacCawi is marked as aXikaraNa. To stop this, again this is uncommented. 26th May 2018 *)

      | _ -> []
      ]
   | _ -> []
   ]
;
value rlafgavikAra m1 m2 text_type = match m2 with
   [ Sup (id2,mid2,_,rt2,_,_,_,_,_,_)
   | Kqw (id2,mid2,_,_,_,_,_,_,_,_,rt2,_,_,_,_,_,_)
   | WaxXiwa (id2,mid2,_,rt2,_,_,_,_,_,_,_) -> 
      match m1 with
      [ Sup (id1,mid1,_,rt1,_,_,_,viBakwiH1,_,_)
      | Kqw (id1,mid1,_,_,_,_,_,_,_,_,rt1,_,_,_,viBakwiH1,_,_)
      | WaxXiwa (id1,mid1,_,rt1,_,_,_,_,viBakwiH1,_,_) ->
       if rt2 = get_assoc rt1 afgavikaara_list 
         && (id1 = previous id2 || id1 = next id2)
       then match viBakwiH1 with
       [ 3 -> [ Relation (id1,mid1,"afgavikAraH",id2,mid2,"11.1")] 
       | _ -> []
       ] 
       else []
      | _ -> []
      ]
   | _ -> []
   ]
;
(* ;saH prasannaH BUwvA mAwaram avaxaw. 
 ;saH api paramAwmA iva pUrNaH Baviwum icCawi
;   saH prasannaH aBavaw.
;saH(S2) SvewaH(S1) aswi(W).
;vexAH pramANam sanwi.
;vAsaH a-niyawam Bavawi
;neharO asya prawikriyA kA AsIw. *)

(* value rlwAxarWya m1 m2 m3 text_type = match m3 with
   [ Wif (id3,mid3,_,rt3,_,_,upasarga3,_,_,_,_,_,_,_,_,_) ->
      match m2 with
       [ Sup (id2,mid2,_,rt2,_,_,_,_,_,_)
       | Kqw (id2,mid2,_,_,_,_,_,_,_,_,_,rt2,_,_,_,_,_)
       | Avy (id2,mid2,_,rt2,_,_,_)
       | Avykqw (id2,mid2,_,rt2,_,_,_,_,_,_,_,_)
       | AvywaxXiwa (id2,mid2,_,rt2,_,_,_,_)
       | WaxXiwa (id2,mid2,_,rt2,_,_,_,_,_,_,_) -> 
      match m1 with
      [ Sup (id1,mid1,_,rt1,_,_,_,viBakwiH1,_,_)
      | Kqw (id1,mid1,_,_,_,_,_,_,_,_,rt1,_,_,_,viBakwiH1,_,_)
      | WaxXiwa (id1,mid1,_,rt1,_,_,_,_,viBakwiH1,_,_) ->
         if (id1=previous id2) (*|| id1=next id2 *)
         then match viBakwiH1 with
          [ 4  -> if   members_of rt3 upasarga3 karwqsamAnAXikaraNa_verbs 
                    && rt2 = get_assoc rt1 wAxarWya_list
                  then [ Relation (id1,mid1,"wAxarWyam",id2,mid2,"8.1") ] 
                  else []
          | _ -> []
          ]
          else [] 
      | _ -> []
      ]
    | _ -> []
    ]
      | _ -> []
      ]
; *)

(* Verb-verb relations *)
(* rAmaH xugXam pIwvA vanam gacCawi *)
(* assign_assign_prayojana_avykqw *)
value rlpUrvakAla m1 m2 text_type = match m2 with
  [ Wif (id2,mid2,_,_,_,_,_,_,_,_,_,_,_,_,_,_) ->
     match m1 with
     [ Avykqw (id1,mid1,_,_,_,_,_,_,kqw1,_,_,_) ->
       if prose_order id1 id2 text_type 
       && no_boundary_crossing id1 id2 text_type
       then if (kqw1="kwvA" || kqw1="lyap")
        then [ Relation (id1,mid1,"pUrvakAlaH",id2,mid2,"12.1")] 
             (* samAna karwqkayoH pUrvakAle  rAmaH xugXam pIwvA vanam gacCawi*)  
        else []
        else []
     | _ -> []
     ]
  | Avykqw (id2,mid2,_,_,_,_,_,_,kqw2,_,_,_) ->
     match m1 with
     [ Avykqw (id1,mid1,_,_,_,_,_,_,kqw1,_,_,_) ->
       if prose_order id1 id2 text_type 
       && no_boundary_crossing id1 id2 text_type
       then if (kqw1="kwvA" || kqw1="lyap") 
            && not (kqw2="kwvA" || kqw2="lyap")
            (* Korada Subrahmanyam *)
        then [ Relation (id1,mid1,"pUrvakAlaH",id2,mid2,"12.2")] 
             (* samAna karwqkayoH pUrvakAle  rAmaH xugXam pIwvA vanam gacCawi*)  
        else []
        else []
     | _ -> []
     ]
   | Kqw (id2,mid2,_,_,_,_,kqw_prawyayaH1,_,_,_,_,_,_,_,viBakwiH2,_,_) ->
     if not (viBakwiH2=7) 
     && not(kqw_prawyayaH1="GaF") (* to avoid relation of jFAwvA with niScaya in niScayaM jFAwvA *)
     then (* to avoid relating xqRtvA with pravqwwe in
     aWa vyavasWiwAn xqRtvA XArwarARtrAn kapi-XvajaH.
     pravqwwe Saswra-sampAwe XanuH uxyamya pANdavaH..1.20
     hqRIkeSam waxA vAkyam ixam Aha mahI-pawe. 
         better explanation needed  -- Amba 4th Dec 2018*)
     match m1 with
     [ Avykqw (id1,mid1,_,_,_,_,_,_,kqw1,_,_,_) ->
       if prose_order id1 id2 text_type 
       && no_boundary_crossing id1 id2 text_type
       then if (kqw1="kwvA" || kqw1="lyap")
        then [ Relation (id1,mid1,"pUrvakAlaH",id2,mid2,"12.3")] 
             (* samAna karwqkayoH pUrvakAle  rAmaH xugXam pIwvA vanam gacCawi*)  
        else []
        else []
     | _ -> []
     ]
     else []
   | _ -> []
   ]
;

(* rAmaH puswakam paTiwum gqham gacCawi 
 rAmaH puswakam paTiwum gacCanwam bAlakam paSyawi. *)
(* rAmaH puswakam paTiwum Saknowi *)
(* SakxqSglA ... 3.4.65 *)
value rlwumun1 m1 m2 text_type = match m2 with
  [ Wif (id2,mid2,_,rt2,_,_,upasarga2,_,_,_,_,_,_,_,_,_)
  | Avykqw (id2,mid2,_,rt2,_,_,upasarga2,_,_,_,_,_) ->
     match m1 with
     [ Avykqw (id1,mid1,_,_,_,_,_,_,kqw1,_,_,_) ->
      if prose_order id1 id2 text_type && kqw1="wumun" 
      && no_boundary_crossing id1 id2 text_type
      then if (rt2="iR2" || rt2="icCuka") 
           then [ Relation (id1,mid1,"iRkarma",id2,mid2,"13.1")] 
           else if (members_of rt2 upasarga2 shakAxi)
            then [ Relation (id1,mid1,"sahAyakakriyA",id2,mid2,"13.2")]
            else [ Relation (id1,mid1,"prayojanam",id2,mid2,"13.3")]
      else []
     | _ -> []
     ]
  | Kqw (id2,mid2,_,rt2,upasarga2,_,_,_,_,_,_,_,_,_,viBakwiH2,_,_) ->
     match m1 with
     [ Avykqw (id1,mid1,_,_,_,_,_,_,kqw1,_,_,_) ->
      if prose_order id1 id2 text_type && kqw1="wumun" && not (viBakwiH2 = 8) 
         && no_boundary_crossing id1 id2 text_type
      then if (rt2="iR2" || rt2="icCuka") 
           then [ Relation (id1,mid1,"iRkarma",id2,mid2,"13.4")] 
           else if (members_of rt2 upasarga2 shakAxi)
            then [ Relation (id1,mid1,"sahAyakakriyA",id2,mid2,"13.5")]
            else [ Relation (id1,mid1,"prayojanam",id2,mid2,"13.6")]
      else []
     | _ -> []
     ]
  | _ -> []
  ]
;

(* paryApwivacaneRu alamarWeRu  3.4.66*)
(* rAmaH jFAwum samarWaH aswi *)
(* Only rts: samarWa, Sakwa, paryApwa  in all the linfga, viBakwi and vacana*)
(* also with the avy alam *)
value rlwumun2 m1 m2 text_type = match m2 with
  [ Kqw (id2,mid2,word2,_,_,_,_,_,_,_,_,rt2,pUrvapaxa2,uwwarapaxa2,_,_,_) 
  | Sup (id2,mid2,word2,rt2,pUrvapaxa2,uwwarapaxa2,_,_,_,_) 
  | Avy (id2,mid2,word2,rt2,pUrvapaxa2,uwwarapaxa2,_) ->
     match m1 with
     [ Avykqw (id1,mid1,_,_,_,_,_,_,kqw1,_,_,_) ->
      if prose_order id1 id2 text_type && kqw1="wumun" 
      && no_boundary_crossing id1 id2 text_type
      then match word2 with
           [ "SakwaH" | "SakwA" | "samarWaH" | "samarWA" | "paryApwaH" | "paryApwA" | "alam" | "a-samarWaH"->
                 [ Relation (id1,mid1,"prayojanam",id2,mid2,"14.1")]
           | _ -> []
           ]
      else []
     | _ -> []
     ]
  | _ -> []
  ]
;

value rlkwa_as m1 m2 text_type = match m2 with
  [ Wif (id2,mid2,_,rt2,_,_,_,_,_,_,_,_,_,_,_,_) ->
     match m1 with
     [ Kqw (id1,mid1,_,_,_,_,kqw1,_,_,_,_,_,_,_,_,_,_) ->
       if prose_order id1 id2 text_type && rt2="as1" && (kqw1="kwa"|| kqw1="kwavawu") && no_boundary_crossing id1 id2 text_type
       then [ Relation (id1,mid1,"sahAyakakriyA",id2,mid2,"15.1")]
       else []
     | _ -> []
     ]
  | _ -> []
  ]
;
(* assign_samAnakAlikawvam *)
(* rAmaH grAmam gacCan wqNam spqSawi. *)
value rlsamAnakAla m1 m2 text_type = match m1 with
  [ Kqw (id1,mid1,_,_,_,_,kqw1,_,_,_,_,_,_,_,viBakwiH1,vacanam1,_) -> match m2 with
       [ Wif (id2,mid2,_,_,_,_,_,_,_,_,_,vacanam2,_,_,_,_) ->
          if     prose_order id1 id2 text_type 
            && no_boundary_crossing id1 id2 text_type
            && viBakwiH1=1 && vacanam1 = vacanam2
          then if (kqw1="Sawq_lat" || kqw1="SAnac_lat") 
          then [ Relation (id1,mid1,"varwamAnasamAnakAlaH",id2,mid2,"16.1")]
          else if (kqw1="Sawq_lqt" || kqw1="SAnac_lqt") 
          then [ Relation (id1,mid1,"ananwarakAlaH",id2,mid2,"16.2")]
          else []
          else []
       | Kqw (id2,mid2,_,_,_,_,kqw2,_,_,_,_,_,_,_,viBakwiH2,vacanam2,_) ->
          if     prose_order id1 id2 text_type 
            && no_boundary_crossing id1 id2 text_type
            && viBakwiH1=1 && not (viBakwiH2 = 8) && vacanam1 = vacanam2
            && (kqw2 = "kwa" || kqw2 = "kwavawu" || kqw2 = "aNiyar" || kqw2 = "wavyaw")
            then if (kqw1="Sawq_lat" || kqw1="SAnac_lat") 
            then [ Relation (id1,mid1,"varwamAnasamAnakAlaH",id2,mid2,"16.3")]
            else if (kqw1="Sawq_lqt" || kqw1="SAnac_lqt") 
            then [ Relation (id1,mid1,"ananwarakAlaH",id2,mid2,"16.4")]
          else []
          else []
       |_ -> []
       ]
  | _ -> []
  ]
;
(* Noun Noun relation *)
(* assign_noun_viSeRaNa *)
(* grAmam gacCanwam rAmam SyAmaH paSyawi. *)
(* yogyawA *)
value rlviSeRaNam m1 m2 text_type = match m2 with
  [ Sup (id2,mid2,word2,rt2,_,uwwarapaxa2,lifgam2,viBakwiH2,vacanam2,_) 
   | Kqw (id2,mid2,word2,_,_,_,_,_,_,_,rt2,_,uwwarapaxa2,lifgam2,viBakwiH2,vacanam2,_) ->
  (*| WaxXiwa (id2,mid2,word2,rt2,_,uwwarapaxa2,_,lifgam2,viBakwiH2,vacanam2,_) ->   *)
(*  There is a problem with sentences such as 
aham Bavanwam anviRyan upAgamam
I think Head can not be kqw or waxxXiwa 
Not clear about this. So uncommented kqw and waxXiwa -- Amba 26th Sep 2019

Uncommented Kqw to handle
kaH aByupAyaH aswi.
*)
   match m1 with
      [ Sup (id1,mid1,word1,rt1,pUrvapaxa1,uwwarapaxa1,lifgam1,viBakwiH1,vacanam1,_) ->
       if (*not (finite_verb_in_sentence.val = 1000 && karwqsamverbs.val = 1000)
       &&  there can be just kqxanwa such as kwa/kwavawu as well *) 
       (* (id2 > id1 ) *) (* Even in Shlokas, the upAXi should come before the name || text_type = "Sloka"  I think id2 > id1  needs to be modified, look at vayam sarve below *)
       (*&&*) no_boundary_crossing id1 id2 text_type
       && (noun_agreement_vibh vacanam1 vacanam2 lifgam1 lifgam2 viBakwiH1 viBakwiH2) 
       && (id1 < id2 || text_type="Sloka")
       (*&& not (member_of (word2^" "^string_of_int viBakwiH2) kriyAviSeRaNas) (* why is this cond? *)*)
(* pronoun3 -> pronominal123: mayA avyakwa-mUrwinA from SBG *)
       then if ((( member_of rt1 saMKyeya || member_of rt1 pUraNa || member_of rt1 kqxanwas || member_of rt1 taddhitaantas || member_of rt1 guNavacana ||
(* To account for both words to be compounds *)
(* (member_of rt1 uwwara_guNavAcI && not (compound_hd1=word1)) *)
(compound word1 uwwarapaxa1 && not (rt1="arWa") && not (rt1="pUrvaka"))
|| pronoun3 rt1 ) && (id1 < id2 || text_type="Sloka")) 
       (* Even in Sloka, we can not have a pronoun after the viSeRya e.g. vArwA kA AsIw, here kA can not be viSeRaNa, it should be karwqsamAnAXikaraNam; manaH-sWiwiH kA aBavaw, kA is not a viSeRanam but karwqsamAnAXikaraNam *)
(* && not (viBakwiH1 = 6) *) (* && (id2 = next id1) *)
|| ((rt1 = "sarva" || rt1 = "sarvA") &&  (id1 = next id2 || (id1 > id2 && text_type = "Sloka") ))) (* vayam sarve  ayaneRu ca sarveRu*)
       (* Example for viSeRaNa after the viSeRya ? 
        * Hence removed this -- || id2 > id1 *)
       (* && not (finite_verb_in_sentence.val = 1000 && karwqsamverbs.val = 1000)  -- removed since with kqxanwas, this does not work; e.g. bahUni kAvyAni paTiwAni hariNA ; bahUni is not marked as a viSeRaNam *)
       (*pronominal123 -> pronoun3; need good examples in support of asmax and yuRmax to be adjectives. mayA purA (BhG 3.2), was wrongly parsed as mayA as an adj of purA. To stop this, pronominal123 is changed to pronoun3; Malay  16th Aug 2019*)
       (* pronouns are immediately after the viSeRya e.g. vAkyam ixam *)
       (* && not (rt2="yax") && not (rt2="wax") *) 
(* Whether to allow yax/wax or not: 
What are the pros and cons of allowing Vs not allowing?
We can have vyAkulaH saH, and also ye janAH ...*)
       && (not(rt1=rt2) || (compound word1 uwwarapaxa1) || (compound word2 uwwarapaxa2)) 
       && (not (member_of rt1 sambanXavAcI || member_of rt1 upAXi))
       && not (rt1="arWa" && compound word1 uwwarapaxa1)
       && not (rt1="pUrvaka" && compound word1 uwwarapaxa1)
       && not (rt2="yukwa")
       && not (rt2="yukwA")
       (* && not (pUrvapaxa1="sa") if the word agrees in g,n,v then mark it as a possible viseRaNam *)
       (* && not (rt1 = "yax" && rt2 = "wax")
        This was removed, see the comment a few lines up ;
        Now why is it added ? *)
       then [ Relation (id1,mid1,"viSeRaNam",id2,mid2,"17.1")]
       else if rt2 = get_assoc rt1 parAjAwi_list 
       && not (finite_verb_in_sentence.val = 1000 && karwqsamverbs.val = 1000)
       then [ Relation (id1,mid1,"viSeRaNam",id2,mid2,"17.2")]
       else if (((member_of rt1 sambanXavAcI) || (member_of rt1 upAXi)) && not (member_of rt2 saMKyeya || member_of rt2 pUraNa))
       (* && not (member_of rt2 guNavacana) ; this condition is not needed. If it is a viSeRaNa, then automatically, the constraint solver will reject this solution. 
       if this condition exists, xaSaraWasya puwraH rAmaH will not be parsed, since is in guNavacana list *)
 (* && not (member_of rt2 sambanXavAcI) Why this condition? counter ex: wava XImawA SiRyeNa xrupaxa-puwreNa *)
       then [ Relation (id1,mid1,"aBexaH",id2,mid2,"17.3")]
       else []
       else if rt1="miwra" && viBakwiH1=viBakwiH2 && vacanam1=vacanam2 
        && not ( member_of rt2 saMKyeya || member_of rt2 pUraNa )
       then [ Relation (id1,mid1,"aBexaH",id2,mid2,"17.4")]
       else []
     (*| AvywaxXiwa (id1,mid1,word1,_,_,uwwarapaxa1,_,_) ->
       if prose_order id1 id2 text_type
       && no_boundary_crossing id1 id2 text_type
       && (compound word1 uwwarapaxa1)
       then [ Relation (id1,mid1,"viSeRaNam",id2,mid2,"12.3")]
       else [] 
      This introduced a link with every other word in case of wasil prawyaya
      *)
     | WaxXiwa (id1,mid1,_,rt1,_,_,_,lifgam1,viBakwiH1,vacanam1,_) ->
       if prose_order id1 id2 text_type
       && not (finite_verb_in_sentence.val = 1000 && karwqsamverbs.val = 1000)
            && no_boundary_crossing id1 id2 text_type
        && noun_agreement_vibh vacanam1 vacanam2 lifgam1 lifgam2 viBakwiH1 viBakwiH2
        && not (member_of (word2^" "^string_of_int viBakwiH2) kriyAviSeRaNas) (* Why is this cond? *)
        && not(rt1=rt2) && no_boundary_crossing id1 id2 text_type
       then [ Relation (id1,mid1,"viSeRaNam",id2,mid2,"17.5")]
       else []
     | Kqw (id1,mid1,_,_,_,_,kqw_prawyayaH1,_,_,_,rt1,_,_,lifgam1,viBakwiH1,vacanam1,_) ->
       if not (finite_verb_in_sentence.val = 1000 && karwqsamverbs.val = 1000)
       && no_boundary_crossing id1 id2 text_type
       && ((viBakwiH1=viBakwiH2 && vacanam1=vacanam2 && niyawalifgam kqw_prawyayaH1)
          || noun_agreement_vibh vacanam1 vacanam2 lifgam1 lifgam2 viBakwiH1 viBakwiH2 )
(* When it is Sawq_lat with viB = 1, then it is more likely that it is a kriyAviSeRaNa, linking directly with the wifganwa.
gacCan bAlakaH wqNam spqSawi / bAlakaH gacCan wqNam spqSawi *)
       && not (member_of (word2^" "^string_of_int viBakwiH2) kriyAviSeRaNas) (* Why is this cond? *)
       && not(rt1=rt2) && not(rt2="kim")
       then if (kqw_prawyayaH1="Sawq_lat") && viBakwiH1 > 1
       then [ Relation (id1,mid1,"viSeRaNam",id2,mid2,"17.6")]
       else if prose_order id1 id2 text_type
         && not (kqw_prawyayaH1="Sawq_lat")
         && not (kqw_prawyayaH1="lyut")
       then [ Relation (id1,mid1,"viSeRaNam",id2,mid2,"17.7")]
       else []
       else []
     | _ -> []
     ]
  | _ -> []
  ]
  ;

(*

Why do we need parimANa viSeRaNa seperately? 
value rlparimANa_viSeRaNam m1 m2 text_type = match m1 with
  [ Sup (id1,mid1,word1,rt1,_,uwwarapaxa1,lifgam1,viBakwiH1,vacanam1,_)
  | Kqw (id1,mid1,word1,_,_,_,_,_,_,_,rt1,_,uwwarapaxa1,lifgam1,viBakwiH1,vacanam1,_)
  | WaxXiwa (id1,mid1,word1,rt1,_,uwwarapaxa1,_,lifgam1,viBakwiH1,vacanam1,_) -> 
   match m2 with
      [ Sup (id2,mid2,word2,rt2,_,uwwarapaxa2,lifgam2,viBakwiH2,vacanam2,_) ->
       if id2=next id1
       && (noun_agreement_vibh vacanam1 vacanam2 lifgam1 lifgam2 viBakwiH1 viBakwiH2) 
       && ( rt2="sarva" || member_of rt2 saMKyeya )
       then [ Relation (id2,mid2,"parimANa_viSeRaNam",id1,mid1,"12.6")]
       else []
      | _ -> []
      ]
  | _ -> []
  ]
  ;
*)
(* yogyawA *)
value rlavy_viSeRaNam m1 m2 text_type = match m2 with
  [ Sup (id2,mid2,_,rt2,_,_,lifgam2,viBakwiH2,vacanam2,_)
  | Kqw (id2,mid2,_,_,_,_,_,_,_,_,rt2,_,_,lifgam2,viBakwiH2,vacanam2,_)
  | WaxXiwa (id2,mid2,_,rt2,_,_,_,lifgam2,viBakwiH2,vacanam2,_) -> 
     match m1 with
     [ Avy (id1,mid1,word1,_,_,uwwarapaxa1,_) ->
       (*if id1=previous id2 && member_of word1 avy_viSeRaNam_list*)
             (*  changed to id1 < id2 for handling kimapi safkRipwam SAswram *)
       if uwwarapaxa1="iva" && id1 = id2-1
       then [ Relation (id1,mid1,"upamAnam_rahiwa_upamAna_xyowakaH",id2,mid2,"18.1")]
       else
       if id1 < id2 && member_of word1 avy_viSeRaNam_list
       then [ Relation (id1,mid1,"viSeRaNam",id2,mid2,"18.2")]
       else if id1=previous id2 && member_of word1 intensifiers_list && not (pronominal123 rt2)
       && member_of rt2 guNavacana (* Once it is intensifier, we need not check if it is a guNavacana or not 
       This is not true. We may have param simhaH ... samarWaH na aswi, where paraM is not wIvrawAxarSI *)
       then [ Relation (id1,mid1,"wIvrawAxarSI",id2,mid2,"18.3")]
(* This relation is added since it is an exception to the constraint that a kriyAviSeRaNa or a viSeRaNa can not have a viSeRaNa.
E.g. saH awIva vegena XAvawI / saH awIva sunxaram bAlakam paSyawi *)
       else []
     | Sup (id1,mid1,_,rt1,_,_,lifgam1,viBakwiH1,vacanam1,_) ->
        if id1=previous id2 && member_of rt1 intensifiers_list && not (pronominal123 rt2)
       && (noun_agreement_vibh vacanam1 vacanam2 lifgam1 lifgam2 viBakwiH1 viBakwiH2) 
       (* && member_of rt2 guNavacana  Once it is intensifier, we need not check if it is a guNavacana or not *)
       then [ Relation (id1,mid1,"wIvrawAxarSI",id2,mid2,"18.4")]
       else []
(* kevala is not an avy *)
     | _ -> []
     ]
  | _ -> []
  ]
  ;

value rlsamboXana_xyowakaH m1 m2 text_type = match m2 with
  [ Sup (id2,mid2,_,_,_,_,_,viBakwiH2,_,_)
  | Kqw (id2,mid2,_,_,_,_,_,_,_,_,_,_,_,_,viBakwiH2,_,_)
  | WaxXiwa (id2,mid2,_,_,_,_,_,_,viBakwiH2,_,_) -> 
   match m1 with
     [ Avy (id1,mid1,word1,_,_,_,_) ->
    if  id1=previous id2 
      && member_of word1 samboXana_sUcaka
      && viBakwiH2=8
       then [ Relation (id1,mid1,"samboXana_xyowakaH",id2,mid2,"19.1")]
       else []
     | _ -> []
     ]
  (*| Wif (id2,mid2,_,rt2,_,_,_,_,_,_,_,_,_,_,_,_) ->
    match m1 with
     [ Avy (id1,mid1,word1,_,_,_,_) ->
        if  member_of word1 samboXana_sUcaka
       then [ Relation (id1,mid1,"sambanXaH",id2,mid2,"14.2")]
       else []
     | _ -> []
     ] *)
  | _ -> []
  ]
  ;

value rlnirXAraNam m1 m2 text_type = match m2 with
  [ Sup (id2,mid2,_,rt2,_,_,_,_,vacanam2,_)
  | Kqw (id2,mid2,_,_,_,_,_,_,_,_,rt2,_,_,_,_,vacanam2,_) ->
   match m1 with
      [ Sup (id1,mid1,_,rt1,_,_,_,viBakwiH1,vacanam1,_)
      | Kqw (id1,mid1,_,_,_,_,_,_,_,_,rt1,_,_,_,viBakwiH1,vacanam1,_)
      | WaxXiwa (id1,mid1,_,rt1,_,_,_,_,viBakwiH1,vacanam1,_) ->
        if  ((id1=previous id2 && text_type = "Prose") || text_type = "Sloka")
        (* nqRu xvijaH SreRTaH Bavawi *)
           && (viBakwiH1=6 || viBakwiH1=7)  
           && (vacanam1="xvi" || vacanam1="bahu")
           && vacanam2="eka" (* && not(viBakwiH2=8) -- xehaBUwAm vara *)
           && ((rt2 = (get_assoc rt1 nirXAraNa_list)) || rt2 = "kiFciw" || rt2="vara" || rt2="SreRTa" || rt2="maXya"
              || (rt1 = (get_assoc rt2 amarakosha_jAwi)))
       (* && (member_of rt2 guNavAcI || member_of rt2 sambanXavAcI) *)  (* yogyawA *)
       (* It is necessary to check  ((is_jAwi rt1) || (is_guNa rt1) || (is_kriyA rt1)); 
          jAwi-guNa-kriyABiH samuxAyAw ekasya pqWak-karaNam nirXAraNam  Under A 2.2.10 in kASikA *)
        then [ Relation (id1,mid1,"nirXAraNam",id2,mid2,"20.1")] (* 2.3.41;*)
       else []
      | _ -> []
      ]
  | WaxXiwa (id2,mid2,_,rt2,_,_,waxXiwa_prawyayaH2,_,viBakwiH2,vacanam2,_) -> 
   match m1 with
      [ Sup (id1,mid1,_,rt1,_,_,_,viBakwiH1,vacanam1,_)
      | Kqw (id1,mid1,_,_,_,_,_,_,_,_,rt1,_,_,_,viBakwiH1,vacanam1,_)
      | WaxXiwa (id1,mid1,_,rt1,_,_,_,_,viBakwiH1,vacanam1,_) ->
        if    (id1=previous id2) 
           && (viBakwiH1=6 || viBakwiH1=7)  
           && (vacanam1="xvi" || vacanam1="bahu")
           && vacanam2="eka" && not(viBakwiH2=8)
           && ((rt2 = (get_assoc rt1 nirXAraNa_list)) || waxXiwa_prawyayaH2="warap")
       (* && (member_of rt2 guNavAcI || member_of rt2 sambanXavAcI) *)  (* yogyawA *)
       (* It is necessary to check  ((is_jAwi rt1) || (is_guNa rt1) || (is_kriyA rt1)); 
          jAwi-guNa-kriyABiH samuxAyAw ekasya pqWak-karaNam nirXAraNam  Under A 2.2.10 in kASikA *)
       then [ Relation (id1,mid1,"nirXAraNam",id2,mid2,"20.2")] (* 2.3.41;*)
       else []
      | _ -> []
      ]
  | _ -> []
  ]
  ;

(* A sort of phrase formation: upapaxa and vIpsA *)

value rlvIpsA m1 m2 text_type = match m2 with
  [ Sup (id2,mid2,word2,rt2,_,_,lifgam2,viBakwiH2,vacanam2,_) -> match m1 with
     [ Sup (id1,mid1,word1,rt1,_,_,lifgam1,viBakwiH1,vacanam1,_) -> 
      supAxi_vIpsa id1 id2 mid1 mid2 word1 word2 rt1 rt2 vacanam1 vacanam2 lifgam1 lifgam2 viBakwiH1 viBakwiH2 "21.1"
     | _ -> []
     ]
  | Kqw (id2,mid2,word2,_,_,_,_,_,_,_,rt2,_,_,lifgam2,viBakwiH2,vacanam2,_) -> match m1 with
     [ Kqw (id1,mid1,word1,_,_,_,_,_,_,_,rt1,_,_,lifgam1,viBakwiH1,vacanam1,_) ->
      supAxi_vIpsa id1 id2 mid1 mid2 word1 word2 rt1 rt2 vacanam1 vacanam2 lifgam1 lifgam2 viBakwiH1 viBakwiH2 "22.2"
     | _ -> []
     ]
  | WaxXiwa (id2,mid2,word2,rt2,_,_,_,lifgam2,viBakwiH2,vacanam2,_) -> match m1 with
     [ WaxXiwa (id1,mid1,word1,rt1,_,_,_,lifgam1,viBakwiH1,vacanam1,_) ->
      supAxi_vIpsa id1 id2 mid1 mid2 word1 word2 rt1 rt2 vacanam1 vacanam2 lifgam1 lifgam2 viBakwiH1 viBakwiH2 "23.3"
     | _ -> []
     ]
  | Avy (id2,mid2,word2,_,_,_,_) -> match m1 with
     [ Avy (id1,mid1,word1,_,_,_,_) ->
       if   id1=previous id2 
     && word1=word2
       then [ Relation (id1,mid1,"vIpsA",id2,mid2,"24.4")]
       else []
     | _ -> []
     ]
  | _ -> []
  ]
  ;
value rlupapaxa m1 m2 text_type = match m2 with
   [ Avy (id2,mid2,word2,rt2,_,_,_)
   | AvywaxXiwa (id2,mid2,word2,rt2,_,_,_,_)
   | Sup (id2,mid2,word2,rt2,_,_,_,_,_,_)
   | Kqw (id2,mid2,word2,_,_,_,_,_,_,_,rt2,_,_,_,_,_,_)
   | Avykqw (id2,mid2,word2,rt2,_,_,_,_,_,_,_,_)
   | WaxXiwa (id2,mid2,word2,rt2,_,_,_,_,_,_,_) ->
      match m1 with
      [ Sup (id1,mid1,_,rt1,_,_,_,viBakwiH1,_,_)
      | Kqw (id1,mid1,_,_,_,_,_,_,_,_,rt1,_,_,_,viBakwiH1,_,_)
      | WaxXiwa (id1,mid1,_,rt1,_,_,_,_,viBakwiH1,_,_) ->
         if   (id1=previous id2 || id1 = id2-2 (* to handle 'rAmeNa ca saha *)
               || (id1=next id2  && text_type = "Sloka") || ((word2="hA" || word2 = "Xik") && id1=next id2) || ((word2="alam") && id1=next id2))
         then match viBakwiH1 with
         [ 2  -> match word2 with
                 [ "aBiwaH" | "pariwaH" | "nikaRA" | "samayA" 
                   | "uparyupari" | "aXoXaH" | "aXoZXaH" | "aXyaXi" | "uBayawaH" 
                   | "sarvawaH" -> 
                    [Relation (id1,mid1,"upa_apekRA",id2,mid2,"25.1")]
                 | "hA" | "Xik" ->
                    [Relation (id2,mid2,"uxgAravAcakaH",id1,mid1,"25.2")]
                 | "prawi" ->
                    [ Relation (id1,mid1,"upa_ABimuKyam",id2,mid2,"25.3")
                    ; Relation (id1,mid1,"upa_karmapravacanIyaH",id2,mid2,"25.4")
                    ]
                 | "aBi" | "anu" (* |"api"   Discuss with Sanjeev *) ->
                    [Relation (id1,mid1,"upa_karmapravacanIyaH",id2,mid2,"25.5")]
		 | "anwarA" | "uwwareNa" | "xakRiNena" | "aXareNa" -> 
                    [Relation (id1,mid1,"upa_apekRA",id2,mid2,"25.6")]
                 | _ -> []
                 ]
         | 3  -> match rt2 with
                 [ "samAna" | "samAnA" | "saxqkRa" | 
                   "saxqkRA" | "saxqkRI" | "saxqSA" | "saxqSa" | "saxqS" | 
                   "wulya" | "wulyA" | "yukwa" | "samA" ->
                    [Relation (id1,mid1,"wulanA_binxuH",id2,mid2,"25.7")]
                 | "uwsuka" | "prasiwa" | "uwsukA" | "prasiwA" ->
                    [Relation (id1,mid1,"viRayAXikaraNam",id2,mid2,"25.8")]
                 | _ -> match word2 with
                    [ "alam" ->
                      [Relation (id2,mid2,"prawiReXaH",id1,mid1,"25.9")]
                    | _ -> []
                    ]
                 ]
        | 4 -> match word2 with
		 [ "alam" | "praBuH" | "SakwaH"  ->
                    [Relation (id1,mid1,"upa_apekRA",id2,mid2,"25.10")]
                 | "AyuRyam" |"Baxram" | "ciraFjIviwam" |
                   "hiwam" | "kuSalam" | "maxram" | "nirAmayam" | "Sam" |
                   "suKam" | "svAhA" | "svaswi" | "svaXA" | "vaRat"  ->
                    [Relation (id1,mid1,"prayojanam",id2,mid2,"25.11")]
                 | "namaH" ->
                    [Relation (id1,mid1,"prayojanam",id2,mid2,"25.12")]
                    (*Sanjeev proposed karma relation; Pavan proposed prayojanam; karma is changed to prayojanam; 21 Mar 2021 *)
                 | _ -> []
                 ]
        | 5 -> match word2 with
                 [ "aByASam" | "aByASAw" | "aByASena" | "aByASe" | "aByASA" | "aByASaH" |"anwikAn"|
                   "anwikena" | "anwike" | "anwikAw" | "anwikam" |"ArAw" | "avAcI" | "avAc" |
                   "bahiH" | "nikatam" | "nikatAw" | "nikatena" | "nikate" |
                    "prAFca" | "prawyaFca" | "prawyak" |"paScimA" | "paScimam" | "paScimAn" |
                   "samIpam" | "samIpAw" | "samIpena" | "samIpe" | "uwwarA" |
                   "uwwarAhi"  | "prawIcI" | "uxac" | "uxak" | "uxIcI" |"prAcI" | "prAk" | "pUrvA" | "pUrvaH" |
                  "pUrvam" | "pUrvAn" | "uwwaram" | "viprakqRtam" | "paScAw" |
                   "viprakqRtAw" | "viprakqRtena" | "viprakqRte" |"viprakqRtA" |
                   "xakRiNAhi" | "xakRiNA" | "xakRiNam"|"xakRiNAn" |"uwwarAn" | "xUram" | "xUreNa" |
                   "xUrAw" | "xUrA" | "xUre" ->
                    [Relation (id1,mid1,"upa_apekRA",id2,mid2,"25.13")]
                 | "apa" | "pari" | "prawi" ->
                    [Relation (id1,mid1,"upa_karmapravacanIyaH",id2,mid2,"25.14")]
                 | "A" ->
                    [Relation (id1,mid1,"upa_karmapravacanIyaH",id2,mid2,"25.15")]
                 | "AraBya" | "praBqwiH" ->
                       [Relation (id1,mid1,"upa_AramBa_binxuH",id2,mid2,"25.16")]
                 | _ -> match rt2 with
                     [  "Binna" | "BinnA" | "iwara" | "iwarA" | "pUrvA" | "pUrva" | "vilakRaNa" | 
                       "vilakRaNA"| "anya" | "anyA" ->
                       [Relation (id1,mid1,"wulanA_binxuH",id2,mid2,"25.17")]
                     | _ -> []
                     ]
                 ]
        | 6 -> match word2 with
                 [ "aByASaH" | "aByASam" | "aByASena" | "aByASAw" | "aByASA" | "aByASe" |
                   "agrawaH" | "anwaH" | "anwikam" | "anwikAw" | "anwikAn" | "anwikena" |
                   "anwike" | "nikatam" | "nikatena" | "nikatAw" | "nikatAn" | 
                   "nikate" | "purawaH" | "pqRTawaH" | "xUram" | "xUrA" | "xUrAw" | "xUreNa" | 
                   "xUre" | "viprakqRtAw" | "viprakqRtena" |  "viprakqRtA" |
                   "viprakqRte" |"viprakqRtam" | 
                   "samIpam" | "samIpAw" | "samIpena" | "samIpe" | "xakRiNAn" | "uwwarAn" |
                   "uwwarawaH" | "xakRiNawaH" | "aXaswAw" | "puraswAw" | 
                   "paraswAw" | "avaraswAw" | "parawaH" | "avarawaH" | 
                   "upari" | "upariRtAw" | "paScAw" | "uwwarAw" | "aXarAw" | 
                   "xakRiNAw" | "uwwareNa" | "aXareNa" | "xakRiNena" | 
                   "puraH" | "aXaH" | "avaH" | "avaswAw" | "samakRam" |
                    "xakRiNAhi" -> (* added by amba *)
                       [Relation (id1,mid1,"upa_apekRA",id2,mid2,"25.18")]
 
		 | "AyuRyam" |"Baxram" | "ciraFjIviwam" |
                   "hiwam" | "kuSalam" | "maxram" | "nirAmayam" | "Sam" |
                   "suKam" |"arWe" 
        (* | "kqwe" *) ->
                    [Relation (id1,mid1,"prayojanam",id2,mid2,"25.19")]
                 | "xakRiNe" | "uwware" ->
                         [Relation (id1,mid1,"aXikaraNam",id2,mid2,"25.20")]
                 | _ -> match rt2 with
                   [ "samAna" | "samAnA" | "saxqkRa" | "saxqkRI" |
                     "saxqS" |  "saxqkRA" |  "saxqSA" | "saxqSa" |
                     "wulya" | "wulyA" | "yukwa" | "samA"| "sama"  ->
                       [Relation (id1,mid1,"wulanA_binxuH",id2,mid2,"25.21")]
                   | "prasUwA" | "prasUwa" ->
                       [Relation (id1,mid1,"nirXAraNam",id2,mid2,"25.22")]
                   | "aXipawi" | "ISvara"  | "prawiBU" | "sAkRin" | "sAkRiNI" |
                     "xAyAxa" | "svAmin" | "svAminI" ->
                       [Relation (id1,mid1,"aBexaH",id2,mid2,"25.23")]
                   | _ -> []
                   ] 
                 ]
        | 7 -> match rt2 with
               ["anurakwa" | "anurakwA" | "Asakwa" | "AsakwA" |
                "Ayukwa" | "AyukwA" | (*"yukwa" | *) "kuSala" |"kuSAlA" | "lagna"|
                "lagnA" | "nipuNA" | "nipuNa" | "prasiwa" | "prasiwA" | "kOSala" |
                "uwsuka" | "uwsukA" | "sAXu" | "sAXvI" | "asAXvI" | "asAXu" ->
                       [Relation (id1,mid1,"viRayAXikaraNam",id2,mid2,"25.24")]
                       (* why should yukwa have viRayAXikaraNa ? any example? *)
               | "prawiBU" |"sAkRiNI" | "sAkRin" | "svAmin" | "svAminI" | 
                  "ISvara" | "xAyAxa" | "aXipawi" ->
                       [Relation (id1,mid1,"aBexaH",id2,mid2,"25.25")]
               | "prasUwA" | "prasUwa"  ->
                       [Relation (id1,mid1,"nirXAraNam",id2,mid2,"25.26")]
               | _ -> match word2 with
                     [ "aXi" | "upa" ->
                         [Relation (id1,mid1,"upa_karmapravacanIyaH",id2,mid2,"25.27")]
                      | _ -> [] 
                      ]
               ]
        | 8 -> if rt2="namaH" 
               then [Relation (id1,mid1,"samboXyaH",id2,mid2,"25.28")]
               else []
        | _ -> []
        ]
        else []
     | AvywaxXiwa (id1,mid1,word1,rt1,_,_,waxXiwaprawyayaH1,_) ->
            if waxXiwaprawyayaH1 = "wasil" && rt2 = "prawi" 
            then  [Relation (id1,mid1,"upa_karmapravacanIyaH",id2,mid2,"25.29")]
            else []
     | Avy (id1,mid1,word1,rt1,_,_,_) -> 
                if word1="axya"
                then match word2 with
                 ["AraBya" | "praBqwiH" ->
                     [Relation (id1,mid1,"upa_AramBa_binxuH",id2,mid2,"25.30")]
                 | _ -> []
                 ]
                 else []
     | _ -> []
     ]
  |_ -> []
  ]
;

(* yogyawA *)
(* WHY do you need this function?
Are these not aXikaraNas, otherwise?
*)
value rlupapaxa_other_rel m1 m2 text_type = match m1 with
  [ Sup (id1,mid1,word1,rt1,_,_,_,viB1,_,_)
  | Kqw (id1,mid1,word1,_,_,_,_,_,_,_,rt1,_,_,_,viB1,_,_)
  | WaxXiwa (id1,mid1,word1,rt1,_,_,_,_,viB1,_,_) ->
   if not (viB1=8) then
    match word1 with
       [ "aByASam" | "aByASaH" | "aByASAw" | "aByASe" | "aByASA" | "aByASena" | "pUrvam" | "pUrvAn"|
         "anwikam" | "anwikAw" | "anwike" | "anwikena" | "anwikAn" | "prAcI" | "prAk" | "pUrvA" | "pUrvaH" | 
         "prAFca" | "prawyaFca" | "prawyak" | "avAcI" | "avAc" |"prawIcI" | "uxac" | "uxak" | "uxIcI"|
         "samIpam" | "samIpAw" | "samIpe" | "samIpena" | "uwwaram" | "paScimA" | "paScimam" | "paScimAn" | 
	 "uwware" | "viprakqRtam" | "viprakqRtAw" | "viprakqRtA" | 
         "viprakqRte" | "viprakqRtena" | "xakRiNam" |"xakRiNAn" | "uwwarAn" | "xakRiNe" | "samakRam" | 
         "xUram" | "xUrAw" | "xUre" | "xUrA" | "xUreNa" | "nikatam" | "nikatAw" | "nikatena" | "nikate" | "sahiwaH" ->
        match m2 with 
         [ Wif (id2,mid2,_,_,_,_,_,_,_,_,_,_,_,_,_,_)
         | Kqw (id2,mid2,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_)
         | Avykqw (id2,mid2,_,_,_,_,_,_,_,_,_,_) ->
           if (id1 < id2)  && no_boundary_crossing id1 id2 text_type
           then if word1 = "sahiwaH"
           then [ Relation (id1,mid1,"sambanXa_upa",id2,mid2,"26.1")] 
           else [ Relation (id1,mid1,"xeSAXikaraNam_upa",id2,mid2,"26.2")] 
           else []
         |_ -> []
         ]
       | _ -> 
           match m2 with
           [ Wif (id2,mid2,_,_,_,_,_,_,_,_,_,_,_,_,_,_)
           | Kqw (id2,mid2,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_)
           | Avykqw (id2,mid2,_,_,_,_,_,_,_,_,_,_) ->
               match rt1 with
               [ "prAk" | "yukwa " ->
                 if  (id1 < id2) && no_boundary_crossing id1 id2 text_type
                 then  [ Relation (id1,mid1,"sambanXa_upa",id2,mid2,"26.3")] 
                 else []
               |_ -> []
               ]
          (*| "aByASa" | "aByASA" | "anurakwa" | "anurakwA" | "anya" |
            "anyA" | "Asakwa" | "AsakwA" | "avAcI" | "avAc" | "aXipawi" |
            "Ayukwa" | "AyukwA" | "Binna" | "BinnA" | "ISvara" | "iwara" |
            "iwarA" | "kuSala" | "kuSalA" | "lagna" | "lagnA" | "nipuNa" |
            "paScima" | "paScimA" | "prAcI" | "prasiwa" | "prasUwa" |
            "prasUwA" | "prawiBU" | "pUrva" | "sAkRiNI" | "sAkRin" |
            "sama" | "samA" | "saxqkRI" | "svAminI" | "svAmin" |
            "uwsuka" | "uwsukA" | "vilakRaNa" | "vilakRaNA" | "viprakqRta" |
            "viprakqRtA" | "xAyAxa" | "xUra" | "xUrA" | "sAXu" | "asAXu"|
            "samAna" | "samAnA" | "saxqkRA" | "saxqSa" | "saxqSA" | 
            "saxqkRa" | "wulya" | "wulyA" ->
           match m2 with
           [ Wif (id2,mid2,_,rt2,_,_,upasarga2,_,_,_,_,_,_,_,_,_)
           | Kqw (id2,mid2,_,rt2,upasarga2,_,_,_,_,_,_,_,_,_,_,_,_)
           | Avykqw (id2,mid2,_,rt2,_,_,upasarga2,_,_,_,_,_) ->
             if  id1 < id2  && (no_boundary_crossing id1 id2) 
             && members_of rt2 upasarga2 karwqsamAnAXikaraNa_verbs
             then [ Relation (id1,mid1,"karwqsamAnAXikaraNam_upa",id2,mid2,"18.9")]
             else []
           |_ -> []
           ] *)
         | _ -> []
         ]
       ] else []
   | Avy (id1,mid1,word1,rt1,_,_,_) 
   | AvywaxXiwa (id1,mid1,word1,rt1,_,_,_,_)
   | Avykqw (id1,mid1,word1,rt1,_,_,_,_,_,_,_,_) ->
           match word1 with
          [ "praBqwiH"|
           "aBi" | "anu" | "apa" | "api" |
            "AraBya" | "A" | "aXi" | "vaRat" |
            "namaH" | "nAnA" | "pari" | "prawi" |
            "upa"  ->
              match m2 with
             [ Wif (id2,mid2,_,_,_,_,_,_,_,_,_,_,_,_,_,_)
             | Kqw (id2,mid2,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_)
             | Avykqw (id2,mid2,_,_,_,_,_,_,_,_,_,_) ->
               if (id1 < id2) && no_boundary_crossing id1 id2 text_type
               then [ Relation (id1,mid1,"sambanXa_upa",id2,mid2,"26.4")] 
               else []
             |_ -> []
             ]
       
          | "alam" ->
             match m2 with
             [ Wif (id2,mid2,_,rt2,_,_,upasarga2,_,_,_,_,_,_,_,_,_)
             | Kqw (id2,mid2,_,rt2,upasarga2,_,_,_,_,_,_,_,_,_,_,_,_)
             | Avykqw (id2,mid2,_,rt2,_,_,upasarga2,_,_,_,_,_) ->
               if (id1 < id2) && no_boundary_crossing id1 id2 text_type
                 && members_of rt2 upasarga2 karwqsamAnAXikaraNa_verbs
               then  [ Relation (id1,mid1,"karwqsamAnAXikaraNam_upa",id2,mid2,"26.5")
                     ; Relation (id1,mid1,"sambanXa_upa",id2,mid2,"26.6")
                     ]
               else []
             |_ -> []
             ]  (* What is the example? *)
	   | "aXaswAw" | "puraswAw" | "paraswAw" | "avaraswAw" | "aXaH" |
             "uwwarawaH" | "xakRiNawaH" | "avaH" | "parawaH" | 
             "avarawaH" | "puraH" | "purawaH" | "pqRTawaH" | "upari" | "upariRtAw" | "paScAw" | 
             "uwwarAw" | "aXarAw" | "xakRiNAw"   ->
             match m2 with 
             [ Wif (id2,mid2,_,rt2,_,_,upasarga2,_,_,_,_,_,_,_,_,_)
             | Kqw (id2,mid2,_,rt2,upasarga2,_,_,_,_,_,_,_,_,_,_,_,_)
             | Avykqw (id2,mid2,_,rt2,_,_,upasarga2,_,_,_,_,_) ->
               if (id1 < id2) && no_boundary_crossing id1 id2 text_type
               then if rt1="paScAw" then
                    if members_of rt2 upasarga2 apAxAna_verbs
               then [ Relation (id1,mid1,"apAxAnam_upa",id2,mid2,"26.7") 
                    ; Relation (id1,mid1,"aXikaraNam_upa",id2,mid2,"26.8")] 
               else if members_of rt2 upasarga2 karwqsamAnAXikaraNa_verbs 
               then [ Relation (id1,mid1,"karwA_upa",id2,mid2,"26.9")
                    ; Relation (id1,mid1,"aXikaraNam_upa",id2,mid2,"26.10")] 
               else [ Relation (id1,mid1,"aXikaraNam_upa",id2,mid2,"26.11")] 
               else if members_of rt2 upasarga2 apAxAna_verbs
               then [ Relation (id1,mid1,"apAxAnam_upa",id2,mid2,"26.12") 
                    ; Relation (id1,mid1,"xeSAXikaraNam_upa",id2,mid2,"26.13")] 
               else if members_of rt2 upasarga2 karwqsamAnAXikaraNa_verbs 
               then [ Relation (id1,mid1,"karwA_upa",id2,mid2,"26.14")
                    ; Relation (id1,mid1,"xeSAXikaraNam_upa",id2,mid2,"26.15")] 
               else [ Relation (id1,mid1,"xeSAXikaraNam_upa",id2,mid2,"26.16")] 
               else []
             |_ -> []
             ]
	| "uwwareNa" | "aXareNa" | "xakRiNena" | "xakRiNA" | "xakRiNAhi" | "uwwarA" | "uwwarAhi" | "avaswAw" ->
	match m2 with
         [ Wif (id2,mid2,_,rt2,_,_,upasarga2,_,_,_,_,_,_,_,_,_)
         | Kqw (id2,mid2,_,rt2,upasarga2,_,_,_,_,_,_,_,_,_,_,_,_)
         | Avykqw (id2,mid2,_,rt2,_,_,upasarga2,_,_,_,_,_) ->
            if (id1 < id2) && no_boundary_crossing id1 id2 text_type
           (*  && members_of rt2 upasarga2 apAxAna_verbs
            then [ Relation (id1,mid1,"apAxAnam_upa",id2,mid2,"18.2")] *)
             && members_of rt2 upasarga2 karwqsamAnAXikaraNa_verbs
            then [ Relation (id1,mid1,"karwA_upa",id2,mid2,"27.1")]
            else [ Relation (id1,mid1,"xeSAXikaraNam_upa",id2,mid2,"27.2")]
          |_ -> []
          ]

          | "agrawaH" | "aBiwaH" | "anwaH" | "aXoXaH" | "aXoZXaH" | "aXyaXi" | "anwarA"|
             "bahiH" | "nikaRA" | "samayA" | "uBayawaH" | "uparyupari" |
             "pariwaH" | "sarvawaH"  | "ArAw" ->
             match m2 with
              [ Wif (id2,mid2,_,_,_,_,_,_,_,_,_,_,_,_,_,_)
              | Kqw (id2,mid2,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_)
              | Avykqw (id2,mid2,_,_,_,_,_,_,_,_,_,_) ->
                if (id1 < id2)  && no_boundary_crossing id1 id2 text_type
                then [ Relation (id1,mid1,"xeSAXikaraNam_upa",id2,mid2,"27.3")]
                else []
              |_ -> []
              ]
          |_ -> []
          ]
       (* Chk if all the words in upapaxa_aXikaraNa_list are xeSAXikaraNas, else we have to prepare two upapaxa axikaraNa lists: for xeSa and kAla aXikaraNas separately *)
  | _ -> [] 
  ]
;

(*
value rlupapaxa_viSeRaNa m1 m2 text_type = match m1 with
  [ Sup (id1,mid1,word1,rt1,_,_,lifgam1,viBakwiH1,vacanam1,_)
  | Kqw (id1,mid1,word1,_,_,_,_,_,_,_,rt1,_,_,lifgam1,viBakwiH1,vacanam1,_)
  | WaxXiwa (id1,mid1,word1,rt1,_,_,_,lifgam1,viBakwiH1,vacanam1,_) ->
    match word1 with
       [ "sAXu" | "prawIcI" | "hiwam" | "asAXu" |
         "kuSalam" | "Sam" | "uxac" | "uxIcI" ->
         match m2 with
         [ Sup (id2,mid2,word2,rt2,_,_,lifgam2,viBakwiH2,vacanam2,_)
         | Kqw (id2,mid2,word2,_,_,_,_,_,_,_,rt2,_,_,lifgam2,viBakwiH2,vacanam2,_)
         | WaxXiwa (id2,mid2,word2,rt2,_,_,_,lifgam2,viBakwiH2,vacanam2,_) ->
           if  id1 < id2  && (no_boundary_crossing id1 id2) 
           &&  noun_agreement_vibh vacanam1 vacanam2 lifgam1 lifgam2 viBakwiH1 viBakwiH2
           then [ Relation (id1,mid1,"viSeRaNam_upa",id2,mid2,"19.1")] 
           else []
         | _ -> []
         ]
       | _ -> match rt1 with
          [ "aByASa" | "aByASA" | "anurakwa" | "anurakwA" | "anya" |
            "anyA" | "Asakwa" | "AsakwA" | "avAcI" | "avAc" | "aXipawi" |
            "Ayukwa" | "AyukwA" | "Binna" | "BinnA" | "ISvara" | "iwara" |
            "iwarA" | "kuSala" | "kuSalA" | "lagna" | "lagnA" | "nipuNa" |
            "paScima" | "paScimA" | "prAcI" | "prasiwa" | "prasUwa" |
            "prasUwA" | "prawiBU" | "pUrva" | "sAkRiNI" | "sAkRin" |
            "sama" | "samA" | "saxqkRI" | "svAminI" | "svAmin" |
            "uwsuka" | "uwsukA" | "vilakRaNa" | "vilakRaNA" | "viprakqRta" |
            "viprakqRtA" | "xAyAxa" | "xUra" | "xUrA" | 
            "samAna" | "samAnA" | "saxqkRA" | "saxqSa" | "saxqSA" | 
            "saxqkRa" | "wulya" | "wulyA" ->
            match m2 with
           [ Sup (id2,mid2,word2,rt2,_,_,lifgam2,viBakwiH2,vacanam2,_)
           | Kqw (id2,mid2,word2,_,_,_,_,_,_,_,rt2,_,_,lifgam2,viBakwiH2,vacanam2,_)
           | WaxXiwa (id2,mid2,word2,rt2,_,_,_,lifgam2,viBakwiH2,vacanam2,_) ->
             if  id1 < id2  && (no_boundary_crossing id1 id2) 
              &&  noun_agreement_vibh vacanam1 vacanam2 lifgam1 lifgam2 viBakwiH1 viBakwiH2
              then [ Relation (id1,mid1,"viSeRaNam_upa",id2,mid2,"19.2")] 
              else []
           | _ -> []
           ]
          | _ -> []
          ]
       (* Chk if all the words in upapaxa_aXikaraNa_list are xeSAXikaraNas, else we have to prepare two upapaxa axikaraNa lists: for xeSa and kAla aXikaraNas separately *)
    ]
  | _ -> [] 
  ]
;
*)

value rlRaRTIsambanXaH m1 m2 text_type = match m1 with
      [ Sup (id1,mid1,_,rt1,_,_,_,viBakwiH1,vacana1,_)
      | Kqw (id1,mid1,_,rt1,_,_,_,_,_,_,_,_,_,_,viBakwiH1,vacana1,_)
      | WaxXiwa (id1,mid1,_,rt1,_,_,_,_,viBakwiH1,vacana1,_) ->
           if (viBakwiH1=6) 
           then match m2 with 
                 [ Kqw (id2,mid2,_,rt2,_,_,kqw2,_,_,_,_,pUrvapaxa2,uwwarapaxa2,_,viBakwiH2,_,_) -> 
		   if   prose_order id1 id2 text_type
                   then if no_boundary_crossing id1 id2 text_type
                       && (kqw2="GaF" || kqw2="wavyaw" || kqw2="wqc" || kqw2 = "kwin" || kqw2 = "ac" || kqw2="Nvul"|| kqw2= "kwa")
                       (* Rules for kAraka RaRTI are given below.
                        * Here we are dealing with only SeRe RaRTI *)
(* pawriNAm viruwena 
Removed Sawq_l?t, SAnac_l?t, kwa and kwavawu *)
                       && not (viBakwiH2 = 8)
                   then [ Relation (id1,mid1,"RaRTIsambanXaH",id2,mid2,"28.1")]
                   else if   not (pUrvapaxa2=uwwarapaxa2) 
                   then if   member_of pUrvapaxa2 sambanXavAcI 
                            || pUrvapaxa2="hiwa" 
                            || pUrvapaxa2="vacana"  (* We should add all rUDa kqxanwas here *) (*rAmasya hiwakAmyayA, rAmasya vacanAnusAreNa *)
                             (* asamarWa compound *)
                   then [ Relation (id1,mid1,"RaRTIsambanXaH",id2,mid2,"28.2")]
 (* We need to mark this relation with the puurvapaxa and not the uwwarapaxa *)
                   else [ Relation (id1,mid1,"RaRTIsambanXaH",id2,mid2,"28.3")]
                   else if member_of rt2 viRayi_list
                   then [ Relation (id1,mid1,"RaRTIsambanXaH",id2,mid2,"28.4")]
                   else []
                   else []
                 | Sup (id2,mid2,word2,rt2,pUrvapaxa2,uwwarapaxa2,_,viBakwiH2,_,_)
                 | WaxXiwa (id2,mid2,word2,rt2,pUrvapaxa2,uwwarapaxa2,_,_,viBakwiH2,_,_) -> 
                   if     prose_order id1 id2 text_type
                   then if member_of rt2 viRayi_list
                   then [ Relation (id1,mid1,"RaRTIsambanXaH",id2,mid2,"28.5")]
                   else if rt2 = "maXya" &&  vacana1 = "xvi"
                   then [ Relation (id1,mid1,"RaRTIsambanXaH",id2,mid2,"28.6")]
                   else  if no_boundary_crossing id1 id2 text_type
                           && not (viBakwiH2 = 8) 
                           && not (member_of rt2 non_RaRTI_list) (* These are the words which can not be related to a word in RaRTI. e.g. paryApwa  We can not have X{6} paryApwa *)
                           && not (member_of rt2 named_entity) (* These are the names, and hence we can not have X{6} rt2 *)
                           && not (member_of rt2 upapada6_list) (* This is needed, since in these cases the relation is sanxarBa_binxuH *)
                           && not (pronominal123 rt2) (* sEnyasya mama; mama should be related to sEnya and not the other way *)
                           && not (rt2 = "maXya")
                           && (not ((member_of rt1 guNavacana) && viBakwiH2=6))
                           && (not ((rt1="uBa" || rt1="uBA") && viBakwiH1=6))
                   then  [ Relation (id1,mid1,"RaRTIsambanXaH",id2,mid2,"28.7")]
                   (* else if   not (pUrvapaxa2=uwwarapaxa2) 
                   then  [ Relation (id1,mid1,"RaRTIsambanXaH",id2,mid2,"20.6")] *)
                   else []
                   else []
                 (*| Avykqw (id2,mid2,word2,_,_,_,_,_,_,_,_,_)
                 | AvywaxXiwa (id2,mid2,word2,_,_,_,_,_) ->
                   if    prose_order id1 id2 text_type
                      && (no_boundary_crossing id1 id2)
                   then [ Relation (id1,mid1,"RaRTIsambanXaH",id2,mid2,"20.6")]
                   else []
                  There can not be RaRTI sambanXa with kwvA, mawup etc.*)
                 | _ -> []
 (* if not ( pronoun3 rt1 || member_of rt1 saMKyeya || member_of rt1 pUraNa || member_of rt1 guNavAcI || member_of rt1 uwwara_guNavAcI) then 
   mama wqwIyam wasya cawurWam,  mama kqRNam wasya pIwam, ...
member_of rt1 sambanXavAcI *)
                ]
        else []
   | _ -> []
   ]
;

(* kAraka_RaRTI *)

(* rAmeNa prajAyAH SAsanam kriyawe *)
(* rAmasya vanagamanam xaSaraWAya na rocawe *)
(* na lokAvyayaniRTAKalarWawqNAm 2.3.69 *)
value rl_kAraka_RaRTI1 m1 m2 text_type = match m2 with
  [ Kqw (id2,mid2,_,kqw_rt2,upasarga2,_,kqw2,_,_,_,rt2,_,_,_,_,_,_) ->
     match m1 with
     [ Sup (id1,mid1,_,_,_,_,_,viBakwiH1,_,_)
     | Kqw (id1,mid1,_,_,_,_,_,_,_,_,_,_,_,_,viBakwiH1,_,_)
     | WaxXiwa (id1,mid1,_,_,_,_,_,_,viBakwiH1,_,_) -> 
                     if id2 > id1 (* id2 = next id1; we may have some kriyAviSeRaNa etc in between; e.g. BavawAm ekawra avasWAnam *)
       && viBakwiH1=6
       && no_boundary_crossing id1 id2 text_type
      && not (
             (kqw2="Sawq_lat" && not (rt2="xviR1")) 
          || (kqw2="ukaF" && not (kqw_rt2="kAmuka")) 
          || kqw2="SAnac_lat" || kqw2="Kal" || kqw2="yuc" || kqw2="u" || kqw2="wqN" || kqw2="SAnan" 
          || kqw2="cAnaS" || kqw2="wqc" || kqw2="kAnac" || kqw2="kvasu" || kqw2="ki" 
          || kqw2="kin" || kqw2="kwvA" || kqw2="Namul" || kqw2="kvasun" || kqw2="wosun" || kqw2="lyap" 
          (* || kqw2 = "Nyaw" *)
          || kqw2="wumun" || kqw2="se" || kqw2="ase" || kqw2="ken"
          || (kqw2="kwa" && not(rt2="man1" || rt2="buX1" || rt2="buX2" || rt2="buX3" || rt2="pUj1"))
         )
       then  
           match verb_type rt2 upasarga2 with
           [ "xvikarmaka1" 
           | "xvikarmaka2" -> [ Relation (id1,mid1,"muKyakarma",id2,mid2,"29.1")
                              ; Relation (id1,mid1,"gONakarma",id2,mid2,"29.2")]
           | "akarmaka" ->    [ Relation (id1,mid1,"karwA",id2,mid2,"29.3")]
           | _ ->             [ Relation (id1,mid1,"karwA",id2,mid2,"29.4")
                               ; Relation (id1,mid1,"karma",id2,mid2,"29.5")]
           ]
       else []
     |_ -> []
     ]
   |_ -> []
 ]
;

(* ixam eRAm Sayiwam / gawam / Bukwam *)
(* kwaH aXikaraNe ca XrOvya-gawi-prawyavasAnArWeByaH 3.4.76 *)
value rl_kAraka_RaRTI2 m1 m2 text_type = match m2 with
  [ Kqw (id2,mid2,rt2,upasarga2,_,_,kqw2,_,_,_,_,_,_,_,_,_,_) ->
     match m1 with
     [ Sup (id1,mid1,_,_,_,_,_,viBakwiH1,_,_)
     | Kqw (id1,mid1,_,_,_,_,_,_,_,_,_,_,_,_,viBakwiH1,_,_)
     | WaxXiwa (id1,mid1,_,_,_,_,_,_,viBakwiH1,_,_) -> 
       if    id2=next id1 
      && viBakwiH1=6 
       && no_boundary_crossing id1 id2 text_type
      && kqw2="kwa" 
      && (   members_of rt2 upasarga2 akarmaka_verbs 
          || members_of rt2 upasarga2 gawyarWa_verbs 
          || members_of rt2 upasarga2 prawyavasAnArWa_verbs)
       then  [ Relation (id1,mid1,"karwA",id2,mid2,"30.1")]  (*aXikaraNa vAcanaH ca 2.3.68 *)
       (* karwq_karmaNoH_kqwi *) 
       else []
     |_ -> []
     ]
   |_ -> []
 ]
;

value rl_kAraka_RaRTI3 m1 m2 text_type = match m2 with
  [ Avykqw (id2,mid2,_,_,_,_,_,_,kqw2,_,_,_) ->
     match m1 with
     [ Sup (id1,mid1,_,_,_,_,_,viBakwiH1,_,_)
     | Kqw (id1,mid1,_,_,_,_,_,_,_,_,_,_,_,_,viBakwiH1,_,_)
     | WaxXiwa (id1,mid1,_,_,_,_,_,_,viBakwiH1,_,_) -> 
       if    prose_order id1 id2 text_type 
      && viBakwiH1=6 
       && no_boundary_crossing id1 id2 text_type
      && kqw2="wumun"
(* I do not understand how can there be karwA ?
       then  [ Relation (id1,mid1,"karwA",id2,mid2,"23.1") 
             ; Relation (id1,mid1,"karma",id2,mid2,"23.2") 
             ] (* karwq_karmaNoH_kqwi *) *)
       then  [ Relation (id1,mid1,"karma",id2,mid2,"31.2") 
             ]
       else []
     |_ -> []
     ]
   |_ -> []
 ]
;
value rlhewuprayoge m1 m2 text_type = match m2 with
     [ Sup(id2,mid2,_,rt2,_,_,_,viBakwiH2,_,_) ->
     if rt2="hewu"
     then match m1 with
          [ Sup(id1,mid1,_,rt1,_,_,_,viBakwiH1,_,_) ->
        if viBakwiH1=6
       && no_boundary_crossing id1 id2 text_type
        then [ Relation (id1,mid1,"hewuH",id2,mid2,"32.1")]
        else if    pronoun3 rt1 (* sarvanAmnaswqwIyA ca 2.3.37; nimiwwakAraNahewuRu sarvAsAM prAyaxarSanaM  kasya hewoH, kene hewunA, kam hewum, kasmina hewO *)
            && viBakwiH1=viBakwiH2
             then [ Relation (id1,mid1,"viSeRaNam",id2,mid2,"32.2")]
             else []
          | _ -> []
          ]
     else []
     | _ -> []
     ]
; 

value rlkarwqrahiwakarwqsamAnAXikaraNam m1 m2 text_type = match m1 with
    [ Kqw (id1,mid1,_,_,_,_,_,_,_,_,_,_,_,_,viBakwiH1,_,_)
    | WaxXiwa (id1,mid1,_,_,_,_,_,_,viBakwiH1,_,_) ->
        match m2 with
        [ Wif (id2,mid2,_,rt2,_,_,upasarga2,_,_,lakAraH2,puruRaH2,_,_,_,_,_) ->
              if members_of rt2 upasarga2 karwqsamAnAXikaraNa_verbs
              && viBakwiH1=1 && puruRaH2="ma" && (lakAraH2="lot" || lakAraH2 = "ASIrlif"|| lakAraH2 = "viXilif" || lakAraH2 = "lat")
              && wvam_pos.val = 1000
              then [ Relation (id1,mid1,"karwqrahiwakarwqsamAnAXikaraNam",id2,mid2,"33.1") ] 
              else []
        (*| Kqw (id2,mid2,_,rt2,upasarga2,_,_,_,_,_,_,_,_,_,_,_,_) *)
        | Avykqw (id2,mid2,_,rt2,_,_,upasarga2,_,kqw2,_,_,_) ->
              if members_of rt2 upasarga2 karwqsamAnAXikaraNa_verbs
              && viBakwiH1=1 && kqw2 = "kwvA"
              then [ Relation (id1,mid1,"karwqrahiwakarwqsamAnAXikaraNam",id2,mid2,"33.2") ] 
              else []
        | _ -> []
        ]
    | Sup (id1,mid1,word1,rt1,_,uwwarapaxa1,_,viBakwiH1,_,_) ->
        if compound word1 uwwarapaxa1 || member_of rt1 guNavacana || member_of rt1 upAXi
        then
        match m2 with
        [ Wif (id2,mid2,_,rt2,_,_,upasarga2,_,_,lakAraH2,puruRaH2,_,_,_,_,_) ->
              if members_of rt2 upasarga2 karwqsamAnAXikaraNa_verbs
              && viBakwiH1=1 && puruRaH2="ma" && (lakAraH2="lot" || lakAraH2 = "ASIrlif"|| lakAraH2 = "viXilif")
              && wvam_pos.val = 1000
              then [ Relation (id1,mid1,"karwqrahiwakarwqsamAnAXikaraNam",id2,mid2,"33.3") ] 
              else []
        (*| Kqw (id2,mid2,_,rt2,upasarga2,_,_,_,_,_,_,_,_,_,_,_,_) *)
        | Avykqw (id2,mid2,_,rt2,_,_,upasarga2,_,kqw2,_,_,_) ->
              if members_of rt2 upasarga2 karwqsamAnAXikaraNa_verbs
              && viBakwiH1=1 && kqw2 = "kwvA"
              then [ Relation (id1,mid1,"karwqrahiwakarwqsamAnAXikaraNam",id2,mid2,"33.4") ] 
              else []
        | _ -> []
        ]
        else []
    | _ -> []
    ]
;

value rlkarwqsamAnAXikaraNam m1 m2 m3 text_type = match m2 with
    [ Sup (id2,mid2,word2,rt2,_,uwwarapaxa2,lifgam2,viBakwiH2,vacanam2,_) ->
      (* if compound word2 uwwarapaxa2  || member_of rt2 guNavacana 
      guNavacana removed to accound for kAkaH kokilaH na Bavawi
      then*)
      match m1 with
      [ Sup (id1,mid1,_,rt1,_,_,lifgam1,viBakwiH1,vacanam1,_)
      | Kqw (id1,mid1,_,_,_,_,_,_,_,_,rt1,_,_,lifgam1,viBakwiH1,vacanam1,_)
      | WaxXiwa (id1,mid1,_,rt1,_,_,_,lifgam1,viBakwiH1,vacanam1,_) ->
        match m3 with
        [ Wif (id3,mid3,_,rt3,_,_,upasarga3,_,_,_,puruRaH3,vacanam3,_,_,_,_) ->
          if    aBihiwa rt1 vacanam1 vacanam3 puruRaH3
             &&  members_of rt3 upasarga3 karwqsamAnAXikaraNa_verbs
             && viBakwiH1=1
             && viBakwiH2=1 (* || viBakwiH2=6 *)
             (*  viBakwiH2=6 is added to account for ixam mama aswi  5.10.2019*)
(* xevasya ixam sarvam aswi  24th July 2020 
 * viBakwiH2 = 6 is removed, since it overgenerates. E.g in the sentence,
 * wasyAH ABAraNam sarovarasya wate aswi, it analyses sarovarasya as karwqsamAnAXikaraNam *)
              (* &&  viBakwiH1=viBakwiH2 *)
           && ((noun_agreement_vibh vacanam1 vacanam2 lifgam1 lifgam2 viBakwiH1 viBakwiH2) || pronominal12 rt1 || pronominal12 rt2 || (rt3="BU1" && upasarga3="X" && vacanam1 = vacanam2 && viBakwiH1 = viBakwiH2) (* to account for jyowiH agniH Bavawi *)
(* || pronominal12 rt1 *)
           || (vacanam1=vacanam2 || (rt1="mAsa" && (rt2="xakRiNAyana" || rt2="uwwarAyaNa"))|| (rt2="xArA") || (rt1 = "vexa" && rt2="pramANa"))
           || (lifgam1=lifgam2 || rt1="miwra"))
           && not (member_of rt1 saMKyeya) (* yogyawA *)
           && (not (pronominal123 rt2 && viBakwiH2=1 && rt2="kim") || (rt2="kim" && viBakwiH1=viBakwiH2 && vacanam1=vacanam2 && lifgam1=lifgam2))
           && (not (pronominal123 rt1 && viBakwiH1=1 && rt1="kim") || (rt1="kim" && viBakwiH1=viBakwiH2 && vacanam1=vacanam2 && lifgam1=lifgam2))
           (* parIkRA-arWinaH mArge kim aBavaw -- parIkRA-arWinaH should not be karwqsamAnAXikaraNam *)
           && not (rt2 = get_assoc rt1 parAjAwi_list)
           (*&& not (member_of rt1 guNavacana)*) (* yogyawA *)
           (* && not (pUrva2=uwwara2) || (member_of rt2 guNavacana)) *)
           && not (rt1="kiFciw" || rt1="kiFcana"|| rt1="yAvaw" || rt1="wAvaw" ) (* yogyawA  To stop: kA hAniH Bavawi hAniH is karwqsamAnAXikaraNa of kA
           Earlier kim was also included in the above list. But hAniH as karwqsam is OK. This is similar to sunxara-kANde kim na sunxaram bhavawi *)
           (* && prose_order id1 id2 text_type *)
            && id1 < id2 
            (* To handle "samarWaH aswi janaH / janaH samarWaH aswi", we need to have better condition than removing id1 < id2  -- 25 Jul 2020/ 3rd Nov 2020 *)
           && prose_order id2 id3 text_type 
           (* && id2-id1 <= 3   Found an example where this diff is > 3 *)
(* Bhatti kAavya 1.1 shloka *)
         && no_boundary_crossing id2 id3 text_type
          then [ Relation (id2,mid2,"viXeya_viSeRaNam",id1,mid1,"34.1") ]
             (* ; Relation (id1,mid1,"karwqsamAnAXikaraNam",id3,mid3,"25.1b") ] *)
(* rel is marked with the verb and not with the karwA. This is to ensure that the parse is correct. 
Consider a sent with X Y v1 v2, where X and Y are karwA and karwAsamAnAXikaraNa w.r.t v1 and not wrt v2. And suppose in the final parse X is karwA of v2, then marking a relation of karwAsamAnAXikaraNa between X and Y will be wrong *)
        else []
      | Kqw (id3,mid3,_,rt3,upasarga3,_,_,_,_,_,_,_,_,_,_,_,_)
      | Avykqw (id3,mid3,_,rt3,_,_,upasarga3,_,_,_,_,_) ->
          if members_of rt3 upasarga3 karwqsamAnAXikaraNa_verbs
           && viBakwiH1=viBakwiH2
           && ((vacanam1=vacanam2) || (rt1="mAsa" && (rt2="xakRiNAyana" || rt2="uwwarAyaNa")))
           && not (member_of rt1 saMKyeya) (* yogyawA *)
           (*&& not (member_of rt1 guNavacana) (* yogyawA *)
           &&  (member_of rt2 guNavacana) (* yogyawA *) *)
           (* && prose_order id1 id2 text_type
            samarWaH aswi janaH / janaH samarWaH aswi -- 25 Jul 2020 *)
           && prose_order id2 id3 text_type
           (* && id2-id1 <= 3 *)
         && viBakwiH1=1 && no_boundary_crossing id2 id3 text_type
          then [ Relation (id2,mid2,"viXeya_viSeRaNam",id1,mid1,"34.2")   ]
             (* ; Relation (id1,mid1,"karwqsamAnAXikaraNam",id3,mid3,"25.2b")  *)
        else []
      | _ -> []
      ]
(* Following part is added to account for the karwqsamAnAXikaraNam relation in the case of upapaxa viBakwis 
E.g. grAmasya aXareNa vanam aswi.*)
      | Avy (id1,mid1,word1,_,_,_,_)
      | AvywaxXiwa (id1,mid1,word1,_,_,_,_,_) -> match m3 with
        [ Wif (id3,mid3,_,rt3,_,_,upasarga3,_,_,_,_,_,_,_,_,_)
        | Kqw (id3,mid3,_,rt3,upasarga3,_,_,_,_,_,_,_,_,_,_,_,_)
        | Avykqw (id3,mid3,_,rt3,_,_,upasarga3,_,_,_,_,_) ->
          if members_of rt3 upasarga3 karwqsamAnAXikaraNa_verbs
           && viBakwiH2=1
           && prose_order id1 id2 text_type
           && prose_order id2 id3 text_type
           (* && id2-id1 <= 3 *)
           && no_boundary_crossing id2 id3 text_type
          then match word1 with
          [ "avaH" | "avaraswAw"| "avarawaH" | "avaswAw" | "aXaH"|
            "aXarAw" | "aXaswAw" | "paraswAw"| "parawaH"| "aXareNa"|
            "paScAw" | "puraH" | "puraswAw"| "purawaH"| "upari"|
            "upariRtAw"| "uwwarA"| "uwwarAhi"| "uwwarAw"| "uwwarawaH"|
            "uwwareNa"| "xakRiNA"| "xakRiNAhi"| "xakRiNAw"| "xakRiNawaH"|
            "xakRiNena" ->
            [ Relation (id2,mid2,"viXeya_viSeRaNam",id1,mid1,"34.3") ] 
          |_ -> []
          ]
          else []
        | _ -> []
        ]
      | _ -> []
      ]
      (* else [] *)
  | Kqw (id2,mid2,_,_,_,_,_,_,_,_,rt2,_,_,lifgam2,viBakwiH2,vacanam2,_)
  | WaxXiwa (id2,mid2,_,rt2,_,_,_,lifgam2,viBakwiH2,vacanam2,_) ->
      match m1 with
      [ Sup (id1,mid1,_,rt1,_,_,lifgam1,viBakwiH1,vacanam1,_)
      | Kqw (id1,mid1,_,_,_,_,_,_,_,_,rt1,_,_,lifgam1,viBakwiH1,vacanam1,_)
      | WaxXiwa (id1,mid1,_,rt1,_,_,_,lifgam1,viBakwiH1,vacanam1,_) ->
        match m3 with
        [ Wif (id3,mid3,_,rt3,_,_,upasarga3,_,prayogaH3,_,puruRaH3,vacanam3,_,_,_,_) ->
          if    aBihiwa rt1 vacanam1 vacanam3 puruRaH3
             && members_of rt3 upasarga3 karwqsamAnAXikaraNa_verbs
             && viBakwiH1=viBakwiH2 && prayogaH3 = "karwari"
           && ((noun_agreement_vibh vacanam1 vacanam2 lifgam1 lifgam2 viBakwiH1 viBakwiH2) || pronominal12 rt1 || (rt3="BU1" && upasarga3="X")) (* to account for jyowiH agniH Bavawi *)
(* || pronominal12 rt1 *)
           && ((vacanam1=vacanam2) || (rt1="mAsa" && (rt2="xakRiNAyana" || rt2="uwwarAyaNa"))|| (rt2="xArA") || (rt1 = "vexa" && rt2="pramANa"))
           && not (member_of rt1 saMKyeya) (* yogyawA *)
           (*&& not (member_of rt1 guNavacana) (* yogyawA *)*)
           && not (rt1="kim" || rt1="kiFciw" || rt1="kiFcana"|| rt1="yAvaw" || rt1="wAvaw" ) (* yogyawA  To stop: kA hAniH Bavawi hAniH is not karwqsamAnAXikaraNa of kA*)
           (* && prose_order id1 id2 text_type 
            * samarWaH aswi janaH / janaH samarWaH aswi -- 25 Jul 2020 *)
           && prose_order id2 id3 text_type
           (* && id2-id1 <= 3   found an example where diff is > 3 *)
(* Bhatti kAavya 1.1 shloka *)
         && viBakwiH1=1 && no_boundary_crossing id2 id3 text_type
        then [ Relation (id2,mid2,"viXeya_viSeRaNam",id1,mid1,"34.4")  ]
             (*; Relation (id1,mid1,"karwqsamAnAXikaraNam",id3,mid3,"25.4b") ] *)
(* rel is marked with the verb and not with the karwA. This is to ensure that the parse is correct. 
Consider a sent with X Y v1 v2, where X and Y are karwA and karwAsamAnAXikaraNa w.r.t v1 and not wrt v2. And suppose in the final parse X is karwA of v2, then marking a relation of karwAsamAnAXikaraNa between X and Y will be wrong *)
        else []
      | Kqw (id3,mid3,_,rt3,upasarga3,_,_,_,_,_,_,_,_,_,_,_,_)
      | Avykqw (id3,mid3,_,rt3,_,_,upasarga3,_,_,_,_,_) ->
          if members_of rt3 upasarga3 karwqsamAnAXikaraNa_verbs
           && viBakwiH1=viBakwiH2
           && ((vacanam1=vacanam2) || (rt1="mAsa" && (rt2="xakRiNAyana" || rt2="uwwarAyaNa")))
           && not (member_of rt1 saMKyeya) (* yogyawA *)
           (*&& not (member_of rt1 guNavacana) (* yogyawA *)
           &&  (member_of rt2 guNavacana) (* yogyawA *)*)
           (* && prose_order id1 id2 text_type
            samarWaH aswi janaH / janaH samarWaH aswi -- 25 Jul 2020 *)
           && prose_order id2 id3 text_type
           (* && id2-id1 <= 3 *)
         && viBakwiH1=1 && no_boundary_crossing id2 id3 text_type
          then [ Relation (id2,mid2,"viXeya_viSeRaNam",id1,mid1,"34.5")  ]
             (* ; Relation (id1,mid1,"karwqsamAnAXikaraNam",id3,mid3,"25.5b") ] *)
        else []
        | _ -> []
        ]
      | Avy (id1,mid1,word1,_,_,_,_) 
      | AvywaxXiwa (id1,mid1,word1,_,_,_,_,_) -> match m3 with
        [ Wif (id3,mid3,_,rt3,_,_,upasarga3,_,_,_,_,_,_,_,_,_)
        | Kqw (id3,mid3,_,rt3,upasarga3,_,_,_,_,_,_,_,_,_,_,_,_)
        | Avykqw (id3,mid3,_,rt3,_,_,upasarga3,_,_,_,_,_) ->
          if members_of rt3 upasarga3 karwqsamAnAXikaraNa_verbs
           && viBakwiH2=1
           && prose_order id1 id2 text_type
           && prose_order id2 id3 text_type
           (* && id2-id1 <= 3 *)
           && no_boundary_crossing id2 id3 text_type
          then match word1 with
          [ "avaH" | "avaraswAw"| "avarawaH" | "avaswAw" | "aXaH"|
            "aXarAw" | "aXareNa" | "aXaswAw" | "paraswAw"| "parawaH"|
            "paScAw" | "puraH" | "puraswAw"| "purawaH"| "upari"|
            "upariRtAw"| "uwwarA"| "uwwarAhi"| "uwwarAw"| "uwwarawaH"|
            "uwwareNa"| "xakRiNA"| "xakRiNAhi"| "xakRiNAw"| "xakRiNawaH"|
            "xakRiNena" ->
            [ Relation (id2,mid2,"viXeya_viSeRaNam",id1,mid1,"34.6") ] 
          |_ -> []
          ]
          else []
        | _ -> []
        ]
      | _ -> []
      ]
  | Avy (id2,mid2,word2,_,_,_,_)
  | AvywaxXiwa (id2,mid2,word2,_,_,_,_,_) -> match word2 with
       [ "avaH" | "avaraswAw"| "avarawaH" | "avaswAw" | "aXaH"|
         "aXarAw" | "aXareNa" | "aXaswAw" | "paraswAw"| "parawaH"|
         "paScAw" | "puraH" | "puraswAw"| "purawaH"| "upari"|
         "upariRtAw"| "uwwarA"| "uwwarAhi"| "uwwarAw"| "uwwarawaH"|
         "uwwareNa"| "xakRiNA"| "xakRiNAhi"| "xakRiNAw"| "xakRiNawaH"|
         "xakRiNena" |
         "miWyA" | "anyaWA" ->
          match m1 with
         [ Sup (id1,mid1,_,rt1,_,_,_,viBakwiH1,_,_)
         | Kqw (id1,mid1,_,_,_,_,_,_,_,_,rt1,_,_,_,viBakwiH1,_,_)
         | WaxXiwa (id1,mid1,_,rt1,_,_,_,_,viBakwiH1,_,_) ->
           match m3 with
           [ Wif (id3,mid3,_,rt3,_,_,upasarga3,_,_,_,puruRaH3,_,_,_,_,_) ->
                if members_of rt3 upasarga3 karwqsamAnAXikaraNa_verbs
              (*&& ((noun_agreement_vibh rt1 vacanam1 vacanam2 lifgam1 lifgam2 viBakwiH1 viBakwiH2) || pronominal12 rt1)  to account for jyowiH agniH Bavawi *)
(* || pronominal12 rt1 *)
              && not (member_of rt1 saMKyeya) (* yogyawA *)
              && prose_order id1 id2 text_type
              && prose_order id2 id3 text_type
              (* && id2-id1 <= 3 *)
            && viBakwiH1=1 && no_boundary_crossing id2 id3 text_type
           then [ Relation (id2,mid2,"viXeya_viSeRaNam",id1,mid1,"34.7") ] 
           else []
(* rel is marked with the verb and not with the karwA. This is to ensure that the parse is correct. 
Consider a sent with X Y v1 v2, where X and Y are karwA and karwAsamAnAXikaraNa w.r.t v1 and not wrt v2. And suppose in the final parse X is karwA of v2, then marking a relation of karwAsamAnAXikaraNa between X and Y will be wrong *)
          | Kqw (id3,mid3,_,rt3,upasarga3,_,_,_,_,_,_,_,_,_,_,_,_)
          | Avykqw (id3,mid3,_,rt3,_,_,upasarga3,_,_,_,_,_) ->
          if members_of rt3 upasarga3 karwqsamAnAXikaraNa_verbs
           && prose_order id1 id2 text_type
           && prose_order id2 id3 text_type
           (* && id2-id1 <= 3 *)
           && viBakwiH1=1 && no_boundary_crossing id2 id3 text_type
           then [ Relation (id2,mid2,"viXeya_viSeRaNam",id1,mid1,"34.8") ] 
           else []
          |_ -> []
          ]
        |_ -> []
        ]
    |_ -> []
    ]
  | _ -> []
  ]
;

(* In case there is no 'be' verb, then this function markes karwqsamAnAXikaraNa 
 * Example: saH vExyaH
 * अ-पर्याप्तम् तत् अस्माकम् बलम् भीष्म-अभिरक्षितम्*)

value rlkarwqsamAnAXikarana_noverb m1 m2 text_type = 
        if karwqsamverbs.val = 1000
        then
        match m2 with
    [ Sup (id2,mid2,word2,rt2,_,uwwarapaxa2,_,viBakwiH2,vacanam2,_) ->
      (* if compound word2 uwwarapaxa2  || member_of rt2 guNavacana 
      guNavacana removed to accound for kAkaH kokilaH na Bavawi
      then*)
      match m1 with
      [ Sup (id1,mid1,word1,rt1,pUrvapaxa1,uwwarapaxa1,lifgam1,viBakwiH1,vacanam1,_)
      | Kqw (id1,mid1,word1,_,_,_,_,_,_,_,rt1,pUrvapaxa1,uwwarapaxa1,lifgam1,viBakwiH1,vacanam1,_)
      | WaxXiwa (id1,mid1,word1,rt1,pUrvapaxa1,uwwarapaxa1,_,lifgam1,viBakwiH1,vacanam1,_) ->
          if (   finite_verb_in_sentence.val = 1000 
              || finite_verb_in_sentence.val = id1 ) 
          (* The second condition is to handle rAmaH vExyaH *)
          then
           let rel = handle_sp_compounds id1 mid1 id2 mid2 rt1 word1 pUrvapaxa1 uwwarapaxa1 lifgam1 in
           if not (rel = []) then []
           else if viBakwiH1=1
             && (viBakwiH2=1 || (viBakwiH2=6 && pronominal123 rt2))
             (*  viBakwiH2=6 is added to account for ixam mama Bavawi  5.10.2019*)
              (* &&  viBakwiH1=viBakwiH2 *)
           (*&& ((noun_agreement_vibh rt1 vacanam1 vacanam2 lifgam1 lifgam2 viBakwiH1 viBakwiH2) || pronominal12 rt1)  to account for jyowiH agniH Bavawi *)
(* || pronominal12 rt1 *)
           && ((vacanam1=vacanam2) || (rt1="mAsa" && (rt2="xakRiNAyana" || rt2="uwwarAyaNa"))|| (rt2="xArA") || (rt1 = "vexa" && rt2="pramANa"))
           && not (member_of rt1 saMKyeya) (* yogyawA *)
           (*&& (not (pronominal123 rt2) || rt2="kim")
              commented; since we can have saH vExyaH *)
           && not (rt2 = get_assoc rt1 parAjAwi_list)
           (*&& not (member_of rt1 guNavacana)*) (* yogyawA *)
           (* && not (pUrva2=uwwara2) || (member_of rt2 guNavacana)) *)
           && not (rt1="kiFciw" || rt1="kiFcana"|| rt1="yAvaw" || rt1="wAvaw" ) (* yogyawA  To stop: kA hAniH Bavawi hAniH is karwqsamAnAXikaraNa of kA
           Earlier kim was also included in the above list. But hAniH as karwqsam is OK. This is similar to sunxara-kANde kim na sunxaram bhavawi *)
           && (*prose_order id1 id2 text_type *)
           id1 < id2 
           (* && id2-id1 <= 3   Found an example where this diff is > 3 *)
(* Bhatti kAavya 1.1 shloka *)
        then [Relation (id2,mid2,"samAnAXikaraNam",id1,mid1,"34.9") ]
(* rel is marked with the verb and not with the karwA. This is to ensure that the parse is correct. 
Consider a sent with X Y v1 v2, where X and Y are karwA and karwAsamAnAXikaraNa w.r.t v1 and not wrt v2. And suppose in the final parse X is karwA of v2, then marking a relation of karwAsamAnAXikaraNa between X and Y will be wrong *)
        else []
        else []
(* Following part is added to account for the karmasamAnAXikaraNam relation in the case of upapaxa viBakwis 
E.g. grAmasya aXareNa vanam aswi.*)
      | Avy (id1,mid1,word1,_,_,_,_)
      | AvywaxXiwa (id1,mid1,word1,_,_,_,_,_)  ->
          if (   finite_verb_in_sentence.val = 1000 
              || finite_verb_in_sentence.val = id1 ) 
          then if viBakwiH2=1
           && prose_order id1 id2 text_type
           (* && id2-id1 <= 3 *)
          then match word1 with
          [ "avaH" | "avaraswAw"| "avarawaH" | "avaswAw" | "aXaH"|
            "aXarAw" | "aXaswAw" | "paraswAw"| "parawaH"| "aXareNa"|
            "paScAw" | "puraH" | "puraswAw"| "purawaH"| "upari"|
            "upariRtAw"| "uwwarA"| "uwwarAhi"| "uwwarAw"| "uwwarawaH"|
            "uwwareNa"| "xakRiNA"| "xakRiNAhi"| "xakRiNAw"| "xakRiNawaH"|
            "xakRiNena" ->
            [ Relation (id2,mid2,"samAnAXikaraNam",id1,mid1,"34.10") ] 
          |_ -> []
          ]
          else []
          else []
      | _ -> []
      ]
      (* else [] *)
  | Kqw (id2,mid2,_,_,_,_,_,_,_,_,rt2,_,_,_,viBakwiH2,vacanam2,_)
  | WaxXiwa (id2,mid2,_,rt2,_,_,_,_,viBakwiH2,vacanam2,_) ->
      match m1 with
      [ Sup (id1,mid1,_,rt1,_,_,lifgam1,viBakwiH1,vacanam1,_)
      | Kqw (id1,mid1,_,_,_,_,_,_,_,_,rt1,_,_,lifgam1,viBakwiH1,vacanam1,_)
      | WaxXiwa (id1,mid1,_,rt1,_,_,_,lifgam1,viBakwiH1,vacanam1,_) ->
          if (   finite_verb_in_sentence.val = 1000 
              || finite_verb_in_sentence.val = id1 ) 
          then  if viBakwiH1=viBakwiH2 
           (*&& ((noun_agreement_vibh rt1 vacanam1 vacanam2 lifgam1 lifgam2 viBakwiH1 viBakwiH2) || pronominal12 rt1)  to account for jyowiH agniH Bavawi *)
(* || pronominal12 rt1 *)
           && ((vacanam1=vacanam2) || (rt1="mAsa" && (rt2="xakRiNAyana" || rt2="uwwarAyaNa"))|| (rt2="xArA") || (rt1 = "vexa" && rt2="pramANa"))
           && not (member_of rt1 saMKyeya) (* yogyawA *)
           (*&& not (member_of rt1 guNavacana) (* yogyawA *)*)
           && not (rt1="kim" || rt1="kiFciw" || rt1="kiFcana"|| rt1="yAvaw" || rt1="wAvaw" ) (* yogyawA  To stop: kA hAniH Bavawi hAniH is not karwqsamAnAXikaraNa of kA*)
           && prose_order id1 id2 text_type
           && ( id2 = next id1 || id1 = next id2 )
         && viBakwiH1=1 
        then [ Relation (id2,mid2,"samAnAXikaraNam",id1,mid1,"34.11") ] 
(* rel is marked with the verb and not with the karwA. This is to ensure that the parse is correct. 
Consider a sent with X Y v1 v2, where X and Y are karwA and karwAsamAnAXikaraNa w.r.t v1 and not wrt v2. And suppose in the final parse X is karwA of v2, then marking a relation of karwAsamAnAXikaraNa between X and Y will be wrong *)
        else []
        else []
      | Avy (id1,mid1,word1,_,_,_,_) 
      | AvywaxXiwa (id1,mid1,word1,_,_,_,_,_) -> 
          if (   finite_verb_in_sentence.val = 1000 
              || finite_verb_in_sentence.val = id1 ) 
          then if viBakwiH2=1
           && prose_order id1 id2 text_type
           (* && id2-id1 <= 3 *)
          then match word1 with
          [ "avaH" | "avaraswAw"| "avarawaH" | "avaswAw" | "aXaH"|
            "aXarAw" | "aXareNa" | "aXaswAw" | "paraswAw"| "parawaH"|
            "paScAw" | "puraH" | "puraswAw"| "purawaH"| "upari"|
            "upariRtAw"| "uwwarA"| "uwwarAhi"| "uwwarAw"| "uwwarawaH"|
            "uwwareNa"| "xakRiNA"| "xakRiNAhi"| "xakRiNAw"| "xakRiNawaH"|
            "xakRiNena" ->
            [ Relation (id2,mid2,"samAnAXikaraNam",id1,mid1,"34.12") ] 
          |_ -> []
          ]
          else []
          else []
    | _ -> []
    ]
  | Avy (id2,mid2,word2,_,_,_,_)
  | AvywaxXiwa (id2,mid2,word2,_,_,_,_,_) -> match word2 with
       [ "avaH" | "avaraswAw"| "avarawaH" | "avaswAw" | "aXaH"|
         "aXarAw" | "aXareNa" | "aXaswAw" | "paraswAw"| "parawaH"|
         "paScAw" | "puraH" | "puraswAw"| "purawaH"| "upari"|
         "upariRtAw"| "uwwarA"| "uwwarAhi"| "uwwarAw"| "uwwarawaH"|
         "uwwareNa"| "xakRiNA"| "xakRiNAhi"| "xakRiNAw"| "xakRiNawaH"|
         "xakRiNena" | "alam" |
         "miWyA" | "anyaWA" ->
          match m1 with
         [ Sup (id1,mid1,_,rt1,_,_,_,viBakwiH1,_,_)
         | Kqw (id1,mid1,_,_,_,_,_,_,_,_,rt1,_,_,_,viBakwiH1,_,_)
         | WaxXiwa (id1,mid1,_,rt1,_,_,_,_,viBakwiH1,_,_) ->
          if (   finite_verb_in_sentence.val = 1000 
              || finite_verb_in_sentence.val = id1 ) 
          then  if not (member_of rt1 saMKyeya) (* yogyawA *)
              && prose_order id1 id2 text_type
            && viBakwiH1=1 
           then [ Relation (id2,mid2,"samAnAXikaraNam",id1,mid1,"34.13") ] 
           else []
           else []
(* rel is marked with the verb and not with the karwA. This is to ensure that the parse is correct. 
Consider a sent with X Y v1 v2, where X and Y are karwA and karwAsamAnAXikaraNa w.r.t v1 and not wrt v2. And suppose in the final parse X is karwA of v2, then marking a relation of karwAsamAnAXikaraNa between X and Y will be wrong *)
        |_ -> []
        ]
    |_ -> []
    ]
  | _ -> []
  ]
  else []
;

value rlkarmasamAnAXikaraNam m1 m2 m3 text_type = 
    match m2 with
    [ Sup (id2,mid2,word2,rt2,pUrvapaxa2,uwwarapaxa2,gen2,viB2,vac2,_) ->
      if not (pronominal123 rt2)  (* && 
      ((member_of rt2 guNavacana) || compound word2 uwwarapaxa2) 
      deleted to allow  xevAn xivOkasaH vaxanwi *)
          then
      match m1 with
      [ Sup (id1,mid1,word1,rt1,_,_,gen1,viB1,vac1,_)
      | Kqw (id1,mid1,word1,_,_,_,_,_,_,_,rt1,_,_,gen1,viB1,vac1,_)
      | WaxXiwa (id1,mid1,word1,rt1,_,_,_,gen1,viB1,vac1,_) ->
           if no_boundary_crossing id1 id2 text_type && id1 < id2
           && not (rt1="kim" ||  rt1="kiFciw" || rt1="kiFcana" || rt1="IxqS" || rt1="kIxqS" || rt1="kIxqSa" || rt1="IxqSa") 
           then match m3 with 
            [ Kqw (id3,mid3,_,rt3,upasarga3,_,_,_,_,_,_,_,_,_,_,_,_)
            | Avykqw (id3,mid3,_,rt3,_,_,upasarga3,_,_,_,_,_) ->
            let rel = handle_sp_compounds id2 mid2 id3 mid3 rt2 word2 pUrvapaxa2 uwwarapaxa2 gen2 in
	    if (not (rel=[])) then rel 
            else if   noun_agreement_vibh vac1 vac2 gen1 gen2 viB1 viB2 
                   && members_of rt3 upasarga3 karmasamAnAXikaraNa_verbs 
   	     (* then if (  members_of rt3 upasarga3 shliR_Axi_verbs
                    || members_of rt3 upasarga3 gawyarWa_verbs
                    || members_of rt3 upasarga3 aaxikarma_verbs
                    || rt3 = "kq3" || rt3="man1" (*wvAm wqNam manye *)
                   ) *) && viB1=2
                   (* to avoid kIxqSam vyavahAram as karma, karmasamAnAXikaraNam*)
            then [ Relation (id2,mid2,"karmasamAnAXikaraNam",id3,mid3,"35.1") ]
             (* waxA AyojakAH neharUM sanwuRtaM kqwavanwaH *)
           (*  else  if  members_of rt3 upasarga3 sakarmaka_verbs && viB1=2
		(* why viB1 = 1 ? *)
            then [ Relation (id2,mid2,"karmasamAnAXikaraNam",id3,mid3,"26.1b") ]
            else [] *)
            else []
            | Wif (id3,mid3,_,rt3,_,_,upasarga3,_,prayogaH3,_,_,_,_,_,_,_) ->
            if   noun_agreement_vibh vac1 vac2 gen1 gen1 viB1 viB2 
            then if members_of rt3 upasarga3 karmasamAnAXikaraNa_verbs
            then if    prayogaH3="karwari" && viB1=2
                 then [ Relation (id2,mid2,"karmasamAnAXikaraNam",id3,mid3,"35.2") ]
                 else if prayogaH3="karmaNi" && viB1=1
                 then [ Relation (id2,mid2,"karmasamAnAXikaraNam",id3,mid3,"35.3") ]
                 else []
                   (* to avoid kIxqSam vyavahAram as karma, karmasamAnAXikaraNam*)
            else []
            else []
            | _ -> []
            ]
            else []
      | _ -> []
      ] else []
    | Avy (id2,mid2,_,rt2,_,_,_) -> 
        if rt2="BasmasAwa" then
        match m1 with
        [ Sup (id1,mid1,_,rt1,_,_,_,_,_,_)
        | Kqw (id1,mid1,_,_,_,_,_,_,_,_,rt1,_,_,_,_,_,_)
        | WaxXiwa (id1,mid1,_,rt1,_,_,_,_,_,_,_) ->
             if no_boundary_crossing id1 id2 text_type && id1 < id2
             then match m3 with 
              [ Kqw (id3,mid3,_,rt3,upasarga3,_,_,_,_,_,_,_,_,_,_,_,_)
              | Avykqw (id3,mid3,_,rt3,_,_,upasarga3,_,_,_,_,_) ->
                if rt3="kq3" && prose_order id2 id3 text_type
                then [ Relation (id2,mid2,"karmasamAnAXikaraNam",id3,mid3,"35.4") ]
                else []
              | Wif (id3,mid3,_,rt3,_,_,upasarga3,_,prayogaH3,_,_,_,_,_,_,_) ->
                if rt3="kq3" && prose_order id2 id3 text_type
                then [ Relation (id2,mid2,"karmasamAnAXikaraNam",id3,mid3,"35.5") ]
                else []
              | _ -> []
              ]
              else []
        | _ -> []
        ]
        else []
    | Kqw (id2,mid2,word2,_,_,_,_,_,_,_,rt2,pUrvapaxa2,uwwarapaxa2,gen2,viB2,vac2,_)
    | WaxXiwa (id2,mid2,word2,rt2,pUrvapaxa2,uwwarapaxa2,_,gen2,viB2,vac2,_) ->
      if not (pronominal123 rt2) 
      then match m1 with
      [ Sup (id1,mid1,word1,rt1,_,_,gen1,viB1,vac1,_)
      | Kqw (id1,mid1,word1,_,_,_,_,_,_,_,rt1,_,_,gen1,viB1,vac1,_)
      | WaxXiwa (id1,mid1,word1,rt1,_,_,_,gen1,viB1,vac1,_) ->
           if no_boundary_crossing id1 id2 text_type && id1 < id2
           && not (rt1="kim" ||  rt1="kiFciw" || rt1="kiFcana" || rt1="IxqS" || rt1="kIxqS" || rt1="kIxqSa" || rt1="IxqSa") 
           then match m3 with 
            [ Kqw (id3,mid3,_,rt3,upasarga3,_,_,_,_,_,_,_,_,_,_,_,_)
            | Avykqw (id3,mid3,_,rt3,_,_,upasarga3,_,_,_,_,_) ->
            let rel = handle_sp_compounds id2 mid2 id3 mid3 rt2 word2 pUrvapaxa2 uwwarapaxa2 gen2 in
	    if (not (rel=[])) then rel 
            else if   noun_agreement_vibh vac1 vac2 gen1 gen2 viB1 viB2 
                   && members_of rt3 upasarga3 karmasamAnAXikaraNa_verbs 
   	     (* then if (  members_of rt3 upasarga3 shliR_Axi_verbs
                    || members_of rt3 upasarga3 gawyarWa_verbs
                    || members_of rt3 upasarga3 aaxikarma_verbs
                    || rt3 = "kq3" || rt3="man1" (*wvAm wqNam manye *)
                   ) *) && viB1=2
                   (* to avoid kIxqSam vyavahAram as karma, karmasamAnAXikaraNam*)
            then [ Relation (id2,mid2,"karmasamAnAXikaraNam",id3,mid3,"35.6") ]
             (* waxA AyojakAH neharUM sanwuRtaM kqwavanwaH *)
           (*  else  if  members_of rt3 upasarga3 sakarmaka_verbs && viB1=2
		(* why viB1 = 1 ? *)
            then [ Relation (id2,mid2,"karmasamAnAXikaraNam",id3,mid3,"26.1b") ]
            else [] *)
            else []
            | Wif (id3,mid3,_,rt3,_,_,upasarga3,_,prayogaH3,_,_,_,_,_,_,_) ->
            if   noun_agreement_vibh vac1 vac2 gen1 gen1 viB1 viB2 
            then if members_of rt3 upasarga3 karmasamAnAXikaraNa_verbs
            then if    prayogaH3="karwari" && viB1=2
                 then [ Relation (id2,mid2,"karmasamAnAXikaraNam",id3,mid3,"35.7") ]
                 else if prayogaH3="karmaNi" && viB1=1
                 then [ Relation (id2,mid2,"karmasamAnAXikaraNam",id3,mid3,"35.8") ]
                 else []
                   (* to avoid kIxqSam vyavahAram as karma, karmasamAnAXikaraNam*)
            else []
            else []
            | _ -> []
            ]
            else []
        | _ -> []
      ] else []
   | _ -> []
   ]
;

(* Special rules for specific words *)

(* rAmaH eva vanam gacCawi. 
   rAmaH api gacCawi.
   rAmaH na gacCawi.
   We need to prepare a list of avyayas from avayayakosha  *)
value rlsambanXa1 m1 m2 text_type = match m2 with
  [ Avy (id2,mid2,_,rt2,_,_,_) ->
          if (rt2="eva"|| rt2="wu"||rt2="uwa"||rt2="nu"|| rt2="ha"||rt2="iva" || rt2="cEva" || rt2="hi"|| rt2="Kalu" || rt2="vE" || rt2="api")
          then match m1 with
     [ Wif (id1,mid1,word1,_,_,_,_,_,_,_,_,_,_,_,_,_)
     | Kqw (id1,mid1,word1,_,_,_,_,_,_,_,_,_,_,_,_,_,_)
     | Avykqw (id1,mid1,word1,_,_,_,_,_,_,_,_,_)
     | AvywaxXiwa (id1,mid1,word1,_,_,_,_,_)
     | Avy (id1,mid1,word1,_,_,_,_)
     | WaxXiwa (id1,mid1,word1,_,_,_,_,_,_,_,_) -> 
          if id1 = previous id2  
          then [ Relation (id2,mid2,"sambanXaH",id1,mid1,"35.9")]
          else []
       (* else if (id1=next id2) 
            (*&& text_type = "Sloka" *)&& rt2="api"
            What is the example?? -- Amba 5july 2020
       then [ Relation (id2,mid2,"sambanXaH",id1,mid1,"27.2")] *)
     | Sup (id1,mid1,word1,rt1,_,_,_,viBakwiH1,_,_) ->
       if     not(viBakwiH1=8) && id1 = previous id2  
       then [ Relation (id2,mid2,"sambanXaH",id1,mid1,"35.10")]
       else []
     ]
     else []
    | Sup (id2,mid2,word2,rt2,_,_,_,viB2,vac2,_) ->
        match m1 with
        [ Sup (id1,mid1,_,rt1,_,_,_,viB1,vac1,_) ->
                if viB1 = 5 && rt2 = "Baya" && id1 = previous id2  
                then [ Relation (id1,mid1,"apAxAnam",id2,mid2,"35.11")]
                (* else if viB1 = 7 && ((vac1 = "xvi" && vac2 = "eka") || vac1 = "bahu" ) && rt1 = "wax"
                then [ Relation (id1,mid1,"viSeRaNam",id2,mid2,"27.1c")] 
        I think this should be treated as nirXAraNam rather than viSeRaNam
                wayoH ekA nArI; una (xo nArIoM) meM se eka nArI *) 
                else []

        | _ -> []
        ]
    | _ -> []
  ]
;

(* ayi Bo Rama mAma uxXara *)
(* value rlsambanXa2 m1 m2 text_type = match m2 with
  [ Avy (id2,mid2,word2,_,_,_,_) ->
   match m1 with
     [ Avy (id1,mid1,word1,_,_,_,_) ->
    if (id1=previous id2)
       && (member_of word1 samboXana_sUcaka)
       && (member_of word2 samboXana_sUcaka)
       && (not (word1=word2))
       then [ Relation (id1,mid1,"sambanXaH",id2,mid2,"28.1")]
       else []
 
     | _ -> []
     ]
  | _ -> []
  ]
  ; *)
(* eva ca, ca eva, ... *)
(* value rlsambanXa2 m1 m2 text_type = match m2 with
  [ Avy (id2,mid2,word2,_,_,_,_) ->
   match m1 with
     [ Avy (id1,mid1,word1,_,_,_,_) ->
    if (id1=previous id2) && (not (word1=word2))
       then match word1 with
       [ "eva" -> match word2 with
                 [ "ca" -> [Relation (id1,mid1,"sambanXaH",id2,mid2,"28.2")]
                 | _ -> []
                 ]
       | "ca" -> match word2 with
                 [ "eva" -> [Relation (id1,mid1,"sambanXaH",id2,mid2,"28.3")]
                 | _ -> []
                 ]
       | _ -> []
       ]
       else []
 
     | _ -> []
     ]
  | _ -> []
  ]
  ; *)

value rl_sma m1 m2 text_type = match m2 with
  [ Wif (id2,mid2,_,_,_,_,_,_,_,_,_,_,_,_,_,_) ->
     match m1 with
     [ Avy (id1,mid1,word1,_,_,_,_) -> 
       if no_boundary_crossing id1 id2 text_type
       then match word1 with
       [ "sma" -> if (id1 = next id2) 
       (* Need an example for Shloka which does not have sma immediately after the finite verb 
        * || text_type = "Sloka" *)
          then [ Relation (id1,mid1,"sambanXaH",id2,mid2,"36.1")]
          else []
       | _ -> []
       ]
       else []
     | _ -> []
     ]
  | _ -> []
  ]
  ;

value rlavy_sent_connector m1 m2 text_type = match m2 with
  [ Wif (id2,mid2,_,_,_,_,_,_,_,_,_,_,_,_,_,_) ->
     match m1 with
     [ Avy (id1,mid1,word1,_,_,_,_) -> 
       if no_boundary_crossing id1 id2 text_type
       then match word1 with
       [ "yaxyapi" 
       | "yawaH" -> if (id1 < id2)
          then [ Relation (id1,mid1,"kAraNa_xyowakaH",id2,mid2,"37.1")]
          else []
       | "waWApi"
       | "wawaH"
       | "awaH" -> if (id1 < id2)
          then [ Relation (id1,mid1,"kArya_xyowakaH",id2,mid2,"37.2")]
          else []
       | "yaxi" 
       | "cew" -> if (id1 < id2)
          then [ Relation (id1,mid1,"AvaSyakawA_xyowakaH",id2,mid2,"37.2")]
          else []
       | "warhi" -> if (id1 < id2)
          then [ Relation (id1,mid1,"pariNAma_xyowakaH",id2,mid2,"37.2")]
          else []
       | _ -> []
       ]
       else []
     | _ -> []
     ]
  | _ -> []
  ]
  ;

(* ;wvaM mA gacCa. *)
value rlavy_wifkqw_special m1 m2 text_type = match m2 with
  [ Wif (id2,mid2,_,_,_,_,_,_,_,_,_,_,_,_,_,_)
  | Kqw (id2,mid2,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_) (* na jFAwaH; na avalokya *)
  | Avykqw (id2,mid2,_,_,_,_,_,_,_,_,_,_) ->
     match m1 with
     [ Avy (id1,mid1,word1,_,_,_,_) -> 
           if no_boundary_crossing id1 id2 text_type
           then match word1 with
       [ "no" 
       | "nEva" 
       | "nahi" 
       | "na" ->  if prose_order id1 id2 text_type
         then [ Relation (id1,mid1,"prawiReXaH",id2,mid2,"38.1")]
           else []
       | "kacciw" | "Sam" | "svaswi" | "svAhA" | "svaXA" | "vaRat" 
       | "kim" ->  if id1 = total_wrds.val 
                   then [ Relation (id1,mid1,"sambanXaH",id2,mid2,"38.2")]
                   else if  id1 < id2 
                        then if not (id1 = 1) && id2 = id1+1
                             then [ Relation (id1,mid1,"prayojanam",id2,mid2,"38.3")]
                             else [ Relation (id1,mid1,"prayojanam",id2,mid2,"38.4")
                                  ; Relation (id1,mid1,"sambanXaH",id2,mid2,"38.5")]
                        else []
                   (* kim wvam paTasi -> yes/no, prayojanam     29.5,29.6
                    * kim wvam saMskqwam paTasi -> yes/no, prayojanam 29.5, 29.6
                    * wvam saMskqwam kim paTasi -> prayojanam   29.4
                    * wvam kim saMskqwam paTasi -> yes/no, prayojanam 29.5,29.6
                    * wvam paTasi kim -> yes/no  29.3 *)
      (* | "saha"
       | "sAkam"
       | "sArXam"
       | "samam"
       | "vinA" -> if prose_order id1 id2 text_type
           then [ Relation (id1,mid1,"sahakAraka",id2,mid2,"29.4")]
           else [] *)
       | "waw" ->  if prose_order id1 id2 text_type
         then [ Relation (id1,mid1,"sambanXaH",id2,mid2,"38.6")]
         else []
       | _ -> []
       ]
       else []
    | _ -> []
    ]
  | _ -> []
  ]
  ;
value rlavy_wif_mA m1 m2 text_type = match m2 with
  [ Wif (id2,mid2,_,_,_,_,_,_,_,lakAraH2,_,_,_,_,_,_) ->
     match m1 with
     [ Avy (id1,mid1,word1,_,_,_,_) ->
       if   ( id2=next id1 || text_type = "Sloka")
      && word1="mA"
      && (lakAraH2="lot" || lakAraH2="viXilif" || lakAraH2="lqt" || lakAraH2="luf")
       then [ Relation (id1,mid1,"prawiReXaH",id2,mid2,"39.1")]
       else []
     | _ -> []
     ]
  | _ -> []
  ]
;
(* canxraH nAma BUpawiH prawivasawi sma
 wasya bahu-SakwiH ugra-SakwiH ananwa-SakwiH ca iwi wrayaH puwrAH Asan
   api ca miwraprApwi-miwraBexa-kAkolUkIya-labXapraNASa-aparIkRiwa-kArakANi iwi paFca wanwrANi racayiwvA wAn pATiwavAn *) 
value rl_nAma m1 m2 m3 text_type = match m3 with
  [ Sup (id3,mid3,_,rt3,_,_,_,viBakwiH3,vacanam3,_)
  | Kqw (id3,mid3,_,_,_,_,_,_,_,_,rt3,_,_,_,viBakwiH3,vacanam3,_)
  | WaxXiwa (id3,mid3,_,rt3,_,_,_,_,viBakwiH3,vacanam3,_) -> match m1 with

       [ Sup (id1,mid1,_,rt1,_,_,_,viBakwiH1,_,_)
       | Kqw (id1,mid1,_,_,_,_,_,_,_,_,rt1,_,_,_,viBakwiH1,_,_)
       | WaxXiwa (id1,mid1,_,rt1,_,_,_,_,viBakwiH1,_,_) ->  match m2 with

             [ Avy (id2,mid2,word2,_,_,_,_) ->
               if  (word2="nAma" || word2="iwi") (* we can have mArIca nAma rAkRaseNa ... paFca wanwrANi racayiwvA ...*)
               then if id2 < id3 (* This need not be just before the category
                    e.g. X nAma ekam nagaram  -- see the presence of ekam! 
                    nAma1 -- similar to prawiyogi;
                    nAma2 -- similar to anuyogi  *)
                    && not (member_of rt3 saMKyeya)
                    && (not (pronominal123 rt3) || rt3="kim")
                    && not (rt3="kiFciw" || rt3="kiFcana") 
                    then if id1=previous id2 && word2="nAma" && viBakwiH1=viBakwiH3
                         then [ Relation (id1,mid1,"saFjFA",id3,mid3,"39.2")
                              ;  Relation (id2,mid2,"saFjFA_xyowakaH",id1,mid1,"39.3")]
                         else if word2="iwi" && viBakwiH1=1
                              then if (id1=previous id2) && vacanam3="eka" 
                                   then [ Relation (id1,mid1,"saFjFA",id3,mid3,"39.4")
                                        ;  Relation (id2,mid2,"saFjFA_xyowakaH",id1,mid1,"39.5")]
                                   else if (id1 < id2) && vacanam3="bahu" 
                                   then [ Relation (id1,mid1,"Gataka",id3,mid3,"39.6")
                                       ;  Relation (id2,mid2,"Gataka_xyowakaH",id1,mid1,"39.7")]
                                   else []
                              else []
                    else []
                else []
              | _ -> []
              ]
      | _ -> []
      ]
  | _ -> []
  ]
;

(*  rAmeNa saha sIwA vanam gacCawi; bAlAnAm kqwe samyak aswi *)
value rl_saha_vinA_kqwe m1 m2 m3 text_type = match m3 with
  [ Wif (id3,mid3,_,_,_,_,_,_,_,_,_,_,_,_,_,_)
  | Kqw (id3,mid3,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_)
  | Avykqw (id3,mid3,_,_,_,_,_,_,_,_,_,_) -> match m1 with

       [ Sup (id1,mid1,_,rt1,_,_,_,viBakwiH1,_,_)
       | Kqw (id1,mid1,_,_,_,_,_,_,_,_,rt1,_,_,_,viBakwiH1,_,_)
       | WaxXiwa (id1,mid1,_,rt1,_,_,_,_,viBakwiH1,_,_) ->  
              
             match viBakwiH1 with
             [ 3 -> 
                match m2 with
                [ Avy (id2,mid2,word2,_,_,_,_) -> match word2 with
                    [ "saha" | "sAkam" | "sArXam" | "samam" | "sahiwaH" ->
                         [ Relation (id1,mid1,"sahArWaH",id3,mid3,"40.1")
                         ; Relation (id2,mid2,"sahArWa_xyowakaH",id1,mid1,"40.2")]
		    | "anwareNa" | "vinA" | "nAnA" | "pqWak" | "qwe" ->
                         [ Relation (id1,mid1,"vinArWaH",id3,mid3,"40.3")
                         ; Relation (id2,mid2,"vinArWa_xyowakaH",id1,mid1,"0.4")]

                    | _ -> []
                    ]
                 | _ -> []
                ]
              | 6 -> 
                    match m2 with 
                    [ Avy (id2,mid2,word2,_,_,_,_) -> match word2 with
                      ["kqwe" ->
                         [ Relation (id1,mid1,"prayojanam",id3,mid3,"40.5")
                         ; Relation (id2,mid2,"prayojanam_xyowakaH",id1,mid1,"40.6")]
                      | _ -> []
                      ]
                    | _ -> []
                    ]
               | _ -> []
               ]
      | _ -> []
      ]
  | _ -> []
  ]
;

(* value rl_iwi_Gataka m1 m2 m3 text_type = match m1 with
        [ Avy (id1,mid1,word1,_,_,_,_) -> 
          if not (word1="iwi") then []
          else match m2 with
             [ Sup (id2,mid2,_,rt2,_,_,_,_,_,_) ->
                if not (safKyA rt2) then []
                else match m3 with
                 [ Sup (id3,mid3,_,rt3,_,_,_,_,vacanam3,_)
                 | Kqw (id3,mid3,_,_,_,_,_,_,_,_,rt3,_,_,_,_,vacanam3,_)
                 | WaxXiwa (id3,mid3,_,rt3,_,_,_,_,_,vacanam3,_) ->  
                      if vacanam3="bahu" then
                      [Relation (id1,mid1,"Gataka_xyowakaH",id3,mid3,"38.1")] 
                      else []
                 | _ -> []
                 ]
             | _ -> []
             ]
        | _ -> []
        ]
;
*)
(* evam ukwvA saH agacCaw *)
(* iwi ukwvA saH agacCaw *)

value rlevamkarma m1 m2 text_type = match m1 with
      [ Avy (id1,mid1,word1,_,_,_,_) -> 
           if (word1="iwi" || word1="evam") && id1 = 1
           then match m2 with
            [ Wif (id2,mid2,_,rt2,_,_,upasarga2,_,_,_,_,_,_,_,_,_)
            | Kqw (id2,mid2,_,rt2,upasarga2,_,_,_,_,_,_,_,_,_,_,_,_)
            | Avykqw (id2,mid2,_,rt2,_,_,upasarga2,_,_,_,_,_) ->
               if no_boundary_crossing id1 id2 text_type
               then if   prose_order id1 id2 text_type
                 && (   members_of rt2 upasarga2 sakarmaka_verbs
                     || members_of rt2 upasarga2 vAkyakarma_verbs
                     || members_of rt2 upasarga2 xvikarmaka1
                     || members_of rt2 upasarga2 xvikarmaka2)
                 &&  word1="iwi" 
               then [ Relation (id1,mid1,"karma",id2,mid2,"40.7") ]
                else if    prose_order id1 id2 text_type
                       && rt2="vac1" &&  word1="evam" 
                    then  [ Relation (id1,mid1,"gONakarma",id2,mid2,"40.8") ]
               else [] 
               else []
            | _ -> []
            ]
           else []
      | _ -> []
      ]
;
(* iwi after any noun or verb is related to the previous word by sambanXa relation
;Note the direction also. Now iwi is the head, and not the verb. *)

(* What is the example for iwi after a verb, not having vAkyakarma relation but a sambanXa relation ?  -- AMBA 08Jun18
rAmaH iwi nAma ...: here rAmaH-iwi is sambanXa *)
value rl_last_iwi m1 m2 text_type = match m1 with
  [ Avy (id1,mid1,word1,_,_,_,_) ->
     if word1="iwi"
     then match m2 with
     (*[ Wif (id2,mid2,_,_,_,_,_,_,_,_,_,_,_,_,_,_)
     | Avykqw (id2,mid2,_,_,_,_,_,_,_,_,_,_) *)
     [ Sup(id2,mid2,_,_,_,_,_,_,_,_)
     (*| Avy (id2,mid2,_,_,_,_,_)
     | Kqw (id2,mid2,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_) *) ->
       if    id1=next id2 
       then if  id1=total_wrds.val
            then [ Relation (id1,mid1,"sambanXaH",id2,mid2,"41.1")]
            else []
       else []
     | _ -> []
     ]
     else []
  | _ -> []
  ]
;

(* Sentential connectives *)

(* rAme vanam gawe sawi sIwA api gacCawi *)
value rlBAvalakRaNa_sapwamI1 m1 m2 text_type = match m1 with
  [ Kqw (id1,mid1,_,_,_,_,kqw1,_,_,_,_,_,_,_,viBakwiH1,_,_) -> 
      if  (kqw1="Sawq_lat" || kqw1="SAnac_lat" || kqw1="kwa" || kqw1="kwavawu" || kqw1="Sawq_lqt" || kqw1="SAnac_lqt")
       && (viBakwiH1=7 ) 
         (* 2.3.36; yasya_ca_BAvena_BAvalakRaNam; *)
       (* || viBakwiH1 = 6  --> This results in over generation. Hence commented
             2.3.37 RaRTI cAnAxare  - ruxawaH prAvrAjIw  *)
     then match m2 with
     [ Wif (id2,mid2,_,rt2,_,_,_,_,_,_,_,_,_,_,_,_) ->
        if   prose_order id1 id2 text_type 
           && no_boundary_crossing id1 id2 text_type
        then if  (kqw1="Sawq_lat" || kqw1="SAnac_lat")
        then [ Relation (id1,mid1,"BAvalakRaNasapwamI_samAnakAlaH",id2,mid2,"42.1")] 
        else if (kqw1="kwa" || kqw1="kwavawu")
        then [ Relation (id1,mid1,"BAvalakRaNasapwamI_pUrvakAlaH",id2,mid2,"42.2")] 
        else if (kqw1="Sawq_lqt" || kqw1="SAnac_lqt")
        then [ Relation (id1,mid1,"BAvalakRaNasapwamI_ananwarakAlaH",id2,mid2,"43.3")] 
        else []
        else []
     | Kqw (id2,mid2,_,rt2,_,_,kqw2,_,_,_,_,_,_,_,viBakwiH2,_,_) ->
        if   viBakwiH2=1  && (kqw2="kwa" || kqw2="kwavawu")
           && prose_order id1 id2 text_type
           && no_boundary_crossing id1 id2 text_type
        then if  (kqw1="Sawq_lat" || kqw1="SAnac_lat")
        then [ Relation (id1,mid1,"BAvalakRaNasapwamI_samAnakAlaH",id2,mid2,"43.4")] 
        else if (kqw1="kwa" || kqw1="kwavawu")
        then [ Relation (id1,mid1,"BAvalakRaNasapwamI_pUrvakAlaH",id2,mid2,"43.5")] 
        else if (kqw1="Sawq_lqt" || kqw1="SAnac_lqt")
        then [ Relation (id1,mid1,"BAvalakRaNasapwamI_ananwarakAlaH",id2,mid2,"43.6")] 
        else []
        else []
     | _ -> []
     ]
     else []
  | _ -> []
  ]
;
value rlBAvalakRaNa_sapwamI2 m1 m2 text_type = match m2 with
    [ Kqw (id2,mid2,_,_,_,_,kqw2,_,_,_,_,_,_,_,viBakwiH2,_,_) ->
       match m1 with
       [ Sup (id1,mid1,_,_,_,_,_,viBakwiH1,_,_) ->
     if  prose_order id1 id2 text_type 
           && no_boundary_crossing id1 id2 text_type
        && viBakwiH1=viBakwiH2 
        && (viBakwiH1=7 || viBakwiH1=6)
        && (kqw2="Sawq_lat" || kqw2="SAnac_lat" || kqw2="kwa" || kqw2="kwavawu")
     then [ Relation (id1,mid1,"karwA",id2,mid2,"44.1") 
          ; Relation (id1,mid1,"karma",id2,mid2,"44.2") 
          ]
     else []
       | _ -> []
       ]
    | _ -> []
    ]
;
(*
SrUyawAm iwi Amanwrya rAmaH avocaw.
praBAwe aham rAjasaBAm gawvA kA vArwA iwi paSyAmi. 
rAmaH avaxaw yaw aham gacCAmi
aham gacCAmi iwi rAmaH avaxaw
Replacing iwi with yaw will result in the mirror image; ->  'X iwi Y'  is same as 'Y yaw X'
*)
value rlvAkyakarma m1 m2 m3 text_type = match m2 with
      [ Avy (id2,mid2,word2,_,_,_,_) ->
           if (word2="iwi" || word2="evam") 
           then match m3 with
           [ Wif (id3,mid3,_,rt3,_,_,upasarga3,_,_,_,_,_,_,_,_,_)
           | Kqw (id3,mid3,_,rt3,upasarga3,_,_,_,_,_,_,_,_,_,_,_,_)
           | Avykqw (id3,mid3,_,rt3,_,_,upasarga3,_,_,_,_,_) ->
              if (* id2 < id3 does not hold good in Sloka; see BhG1-23-24 below *) 
              prose_order id2 id3 text_type 
              && members_of rt3 upasarga3 vAkyakarma_verbs
              then  match m1 with
                 [ Wif (id1,mid1,_,_,_,_,_,_,_,_,_,_,_,_,_,_) ->
                     (* if prose_order id1 id2 text_type *)
                         if id1 < id2 
                    (*  if id1 = previous id2 
                      BhG 1.23-24; evam ukwvA hqRIkeSaH gudAkeSena BArawa, uvAca pArWa paSya ewAn samavewAn kurun iwi 
                      id1 = --; id2 = 2 (evam) id3 = ukwvA;
                      id1 = paSya; id2 = iwi; id3 = uvAca *)
                     then [ Relation (id1,mid1,"vAkyakarma",id3,mid3,"45.1")
                     ; Relation (id2,mid2,"vAkyakarma_xyowakaH",id1,mid1,"45.2")
                     ]
                    else []
                 | Kqw (id1,mid1,_,_,_,_,_,_,_,_,_,_,_,_,viBakwiH1,_,_) ->
            (*| Avykqw (id1,mid1,_,rt1,_,_,_,_,_,_)  
                How can in '.. kwvA .. iwi ...' , kwvA be a vAkyakarma? 
               if prose_order id1 id2 text_type*)
                    if id1 = previous id2 && viBakwiH1=1
                    then [ Relation (id1,mid1,"vAkyakarma",id3,mid3,"45.3")
                     ; Relation (id2,mid2,"vAkyakarma_xyowakaH",id1,mid1,"45.4")
                     ]
                    else []
                 | _ -> []
                 ]
              else []
           | Sup (id3,mid3,word3,rt3,_,_,_,_,_,_) -> 
                 if rt3="mawi" || rt3 = "mawa" then match m1 with
                 [ Wif (id1,mid1,_,_,_,_,_,_,_,_,_,_,_,_,_,_)
                 | Kqw (id1,mid1,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_) ->
                    if id1 = previous id2 then
                    [ Relation (id1,mid1,"vAkyakarma",id3,mid3,"45.5")
                    ; Relation (id2,mid2,"vAkyakarma_xyowakaH",id1,mid1,"45.6")
                    ]
                    else []
                 | _ -> []
                 ]
                 else []
           | _ -> []
           ]
           else []
    | _ -> []
    ]
;

(* saH avaxaw yaw aham gacCAmi *)

value rlvAkyakarma1 m1 m2 m3 text_type = match m3 with
       [ Wif (id3,mid3,_,rt3,_,_,_,_,_,_,_,_,_,_,_,_) -> match m2 with
       (* | Avykqw (id3,mid3,_,rt3,_,_,_,_,_,_,_,_) -> Any example for Avykqw ? *)
          [ Avy (id2,mid2,word2,_,_,_,_) ->
             if    prose_order id2 id3 text_type
                && no_boundary_crossing id2 id3 text_type
                && word2="yaw"
             then match m1 with
             [ Wif (id1,mid1,_,rt1,_,_,upasarga1,_,_,_,_,_,_,_,_,_) ->
            (* | Kqw (id1,mid1,_,rt1,upasarga1,_,_,_,_,_,_,_,_,_,_,_,_)
             | Avykqw (id1,mid1,_,rt1,_,_,upasarga1,_,_,_,_,_) -> 
                 Need examples where we get kqw or Avykqw with yaw *)
               if    prose_order id1 id2 text_type
                  && no_boundary_crossing id1 id2 text_type
                  && members_of rt1 upasarga1 vAkyakarma_verbs
               then [ Relation (id2,mid2,"vAkyakarma_xyowakaH",id3,mid3,"46.1")
                    ; Relation (id3,mid3,"vAkyakarma",id1,mid1,"46.2")
                    ]
               else []
             | Kqw (id1,mid1,_,rt1,upasarga1,_,kqw_prawyayaH1,_,_,_,_,_,_,_,_,_,_) -> 
               if    prose_order id1 id2 text_type
                  && no_boundary_crossing id1 id2 text_type
                  && members_of rt1 upasarga1 vAkyakarma_verbs
                  && kqw_prawyayaH1 ="kwa" || kqw_prawyayaH1 = "kwavawu" 
               then [ Relation (id2,mid2,"vAkyakarma_xyowakaH",id3,mid3,"46.3")
                    ; Relation (id3,mid3,"vAkyakarma",id1,mid1,"46.4")
                    ]
               else []
             | _ -> []
             ]
             else []
          | _ -> []
          ]
       | Kqw (id3,mid3,_,rt3,_,_,kqw_prawyayaH3,_,_,_,_,_,_,_,_,_,_) -> 
           if kqw_prawyayaH3 ="kwa" || kqw_prawyayaH3 = "kwavawu" 
           then match m2 with
           [ Avy (id2,mid2,word2,_,_,_,_) ->
             if    prose_order id2 id3 text_type
                && no_boundary_crossing id2 id3 text_type
                && word2="yaw"
             then match m1 with
             [ Wif (id1,mid1,_,rt1,_,_,upasarga1,_,_,_,_,_,_,_,_,_) ->
             (*| Kqw (id1,mid1,_,rt1,upasarga1,_,_,_,_,_,_,_,_,_,_,_,_)
             | Avykqw (id1,mid1,_,rt1,_,_,upasarga1,_,_,_,_,_) ->
                 Need examples where we get kqw or Avykqw with yaw *)
               if    prose_order id1 id2 text_type
                  && no_boundary_crossing id1 id2 text_type
                  && members_of rt1 upasarga1 vAkyakarma_verbs
               then [ Relation (id2,mid2,"vAkyakarma_xyowakaH",id3,mid3,"46.5")
                    ; Relation (id3,mid3,"vAkyakarma",id1,mid1,"46.6")
                    ]
               else []
             | Kqw (id1,mid1,_,rt1,upasarga1,_,kqw_prawyayaH1,_,_,_,_,_,_,_,_,_,_) -> 
               if    prose_order id1 id2 text_type
                  && no_boundary_crossing id1 id2 text_type
                  && members_of rt1 upasarga1 vAkyakarma_verbs
                  && kqw_prawyayaH1 ="kwa" || kqw_prawyayaH1 = "kwavawu" 
               then [ Relation (id2,mid2,"vAkyakarma_xyowakaH",id3,mid3,"46.7")
                    ; Relation (id3,mid3,"vAkyakarma",id1,mid1,"46.8")
                    ]
               else []
             | _ -> []
             ]
             else []
           | _ -> []
           ] else []
    | _ -> []
    ]
;

(*
sentences with connectives joiniing a wif with kqw fail, if we have rlsent_kqw_connectives and rlsent_wif_cocnnectives seperately.
For example:  श्यामः विरोधं कर्तुं अचेष्टत किन्तु तस्य वचः कः अपि न श्रुतवान्
failed to parse.
*)
(*
value rlsent_kqw_connectives m1 m2 m3 text_type = match m3 with
       [Kqw (id3,mid3,_,rt3,_,_,_,_,_,_,_,_,_,_) -> (* only kwa kwavawu *)
         match m1 with
         [ Kqw (id1,mid1,_,rt1,_,_,_,_,_,_,_,_,_,_) -> (* add condition for only kwa kwavawu *)
             match m2 with
             [ Avy (id2,mid2,word2,_,_,_) ->
              if    id1 < id2 && id2 < id3
              then match word2 with
              [ "yaw" -> if not (member_of rt1 vAkyakarma_verbs)
                     then [ Relation (id1,mid1,"prawiyogI",id2,mid2,"39.1")
                      ; Relation (id2,mid2,"anuyogI",id3,mid3,"39.2")
                      ]
                     else []
              |"aWa" 
              |"kinwu" 
              |"paranwu" -> [ Relation (id1,mid1,"prawiyogI",id2,mid2,"39.1")
                            ; Relation (id2,mid2,"anuyogI",id3,mid3,"39.2")
                            ]
               | _ -> []
              ]
              else []
             | _ -> []
             ]
          | _ -> []
          ]
    | _ -> []
    ]
;

*)
value sent_beginning_connectives id1 mid1 id2 mid2 rt2 upasarga2 word1 text_type =
              if no_boundary_crossing id1 id2 text_type
              then
	      if id1 = 1 &&  word1 = "api" && text_type="Prose"
              && no_boundary_crossing id1 id2 text_type
              then [ Relation (id1,mid1,"sambanXaH",id2,mid2,"47.1")]
              else if    id1 < id2
              then match word1 with
              [ "yaw" -> if not (members_of rt2 upasarga2 vAkyakarma_verbs)
                         then [ Relation (id1,mid1,"sambanXaH",id2,mid2,"47.2")
                              ]
                         else []
              |"prawilomam"
              |"awaH"
              |"wawaH"
              |"aWa"
              |"apiwu"
              |"kinwu"
              |"paranwu" -> if ((id1 = 1  && text_type="Prose") || (text_type = "Sloka"))  then
			    [ Relation (id1,mid1,"sambanXaH",id2,mid2,"47.3") ]
			    else []
              |"iwaH"
              |"param"
              |"warhi" -> if id1 = 1 then
			    [ Relation (id1,mid1,"sambanXaH",id2,mid2,"47.4") ]
			    else []
              |"nocew"
              |"anyaWA"
              |"aWavA"
              |"uwa"
              |"yaWA"
              |"waWA"
              |"waWEva"
              |"waWaHparam"
              |"wawwvawaH"
              |"waxananwaram" -> if (no_boundary_crossing id1 id2 text_type || (id1 = 1))
			   then  [ Relation (id1,mid1,"sambanXaH",id2,mid2,"47.5") ]
			    else []
                            (*|"wu"  wu is never used in the beginning of a sentence; we always show its relation with the previous word, and then disambiguate*)
              | _ -> []
              ]
              else []
              else []
;
value rlsent_beginning_connectives m1 m2 text_type = match m1 with
     [ Avy (id1,mid1,word1,_,_,_,_)
     | Sup (id1,mid1,word1,_,_,_,_,_,_,_) -> match m2 with
         [ Wif (id2,mid2,_,rt2,_,_,upasarga2,_,_,_,_,_,_,_,_,_)  ->
           sent_beginning_connectives id1 mid1 id2 mid2 rt2 upasarga2 word1 text_type
          | Kqw (id2,mid2,_,rt2,upasarga2,_,kqw2,_,_,_,_,_,_,_,_,_,_) -> 
             (*if member_of kqw2 bhaavavaaci_kqw --  why BAvavAci ? *)
                          (* yaWA eweRAM boXaH Bavawi waWA kaScana upAyaH karaNIyaH *)
             if kqw2="kwa" || kqw2 = "kwavawu" || kqw2 = "wavyaw" || kqw2 = "anIyar"
             then sent_beginning_connectives id1 mid1 id2 mid2 rt2 upasarga2 word1 text_type
             else []
          | _ -> []
          ]
     | _ -> []
     ]
; 

value rl_avaXiH m1 m2 text_type = match m1 with
     [ Avy (id1,mid1,word1,_,_,_,_) -> match m2 with
       [ Wif (id2,mid2,_,_,_,_,_,_,_,_,_,_,_,_,_,_) -> 
              if    id1 < id2  && (word1="yAvaw" || word1="wAvaw")
              then [ Relation (id1,mid1,"avaXiH",id2,mid2,"48.1")]
              else []
       | _ -> []
       ]
     | _ -> []
     ]
;

value rlsent_connectives m1 m2 m3 text_type = match m2 with
     [ Avy (id2,mid2,word2,_,_,_,_) -> match m3 with
       [ Wif (id3,mid3,_,_,_,_,_,_,_,_,_,_,_,_,_,_) -> match m1 with
         [ Wif (id1,mid1,_,rt1,_,_,upasarga1,_,_,_,_,_,_,_,_,_)  ->
              if    id1 < id2 && id2 < id3
              then match word2 with
              [ "yaw" -> if not (members_of rt1 upasarga1 vAkyakarma_verbs)
                         then [ Relation (id1,mid1,"prawiyogI",id2,mid2,"49.1")
                              ; Relation (id2,mid2,"anuyogI",id3,mid3,"49.2")
                              ]
                         else []
              |"aWa"
              |"apiwu"
              |"kinwu"
              |"paranwu" -> [ Relation (id1,mid1,"viroXakaH",id3,mid3,"49.3")
                            ; Relation (id2,mid2,"viroXa_xyowakaH",id3,mid3,"49.4")
                            ]
              | _ -> []
              ]
              else []
         | Kqw (id1,mid1,word1,rt1,upasarga1,_,kqw1,_,_,_,_,_,uwwarapaxa1,_,_,_,_) ->
              if    id1 < id2 && id2 < id3 
                 && (kqw1 = "kwa" || kqw1 = "kwavawu") 
                 && uwwarapaxa1=word1
              then match word2 with
              [ "yaw" -> if not (members_of rt1 upasarga1 vAkyakarma_verbs)
                         then [ Relation (id1,mid1,"prawiyogI",id2,mid2,"49.5")
                              ; Relation (id2,mid2,"anuyogI",id3,mid3,"49.6")
                              ]
                         else []
              |"aWa"
              |"apiwu"
              |"kinwu"
              |"paranwu" -> [ Relation (id1,mid1,"viroXakaH",id3,mid3,"49.7")
                            ; Relation (id2,mid2,"viroXa_xyowakaH",id3,mid3,"49.7")]
              | _ -> []
              ]
              else []
         | _ -> []
         ]
       | Kqw (id3,mid3,word3,_,_,_,kqw3,_,_,_,_,_,uwwarapaxa3,_,_,_,_) -> match m1 with
         [ Wif (id1,mid1,_,rt1,_,_,upasarga1,_,_,_,_,_,_,_,_,_)  ->
              if    id1 < id2 && id2 < id3
              then match word2 with
              [ "yaw" -> if not (members_of rt1 upasarga1 vAkyakarma_verbs)
                         then [ Relation (id1,mid1,"prawiyogI",id2,mid2,"49.9")
                              ; Relation (id2,mid2,"anuyogI",id3,mid3,"49.10")
                              ]
                         else []
              |"aWa"
              |"apiwu"
              |"kinwu"
              |"paranwu" -> [ Relation (id1,mid1,"viroXakaH",id3,mid3,"49.11")
                            ; Relation (id2,mid2,"viroXa_xyowakaH",id3,mid3,"49.12")
                            ]
              | _ -> []
              ]
              else []
         | Kqw (id1,mid1,word1,rt1,upasarga1,_,kqw1,_,_,_,_,_,uwwarapaxa1,_,_,_,_) ->
              if    id1 < id2 && id2 < id3 && (kqw1 = "kwa" || kqw1 = "kwavawu") && (kqw3 ="kwa" || kqw3 = "kwavawu") && uwwarapaxa3=word3 && uwwarapaxa1=word1
              then match word2 with
              [ "yaw" -> if not (members_of rt1 upasarga1 vAkyakarma_verbs)
                         then [ Relation (id1,mid1,"prawiyogI",id2,mid2,"49.13")
                              ; Relation (id2,mid2,"anuyogI",id3,mid3,"49.14")
                              ]
                         else []
              |"aWa"
              |"apiwu"
              |"kinwu"
              |"paranwu" -> [ Relation (id1,mid1,"viroXakaH",id3,mid3,"49.15")
                            ; Relation (id2,mid2,"viroXa_xyowakaH",id3,mid3,"49.16")
                            ]
              | _ -> []
              ]
              else []
         | _ -> []
         ]
       | _ -> []
       ]
     | _ -> []
     ]
;

value rlupamAna_upameya_sup m1 m2 m3 text_type = match m2 with
     [ Avy (id2,mid2,word2,_,_,_,_) -> 
        if word2 = "iva" then match m3 with
        [ Sup (id3,mid3,_,_,_,_,_,viBakwiH3,_,_)
        | Kqw (id3,mid3,_,_,_,_,_,_,_,_,_,_,_,_,viBakwiH3,_,_)
        | WaxXiwa (id3,mid3,_,_,_,_,_,_,viBakwiH3,_,_) -> 
             match m1 with
             [ Sup (id1,mid1,_,_,_,_,_,viBakwiH1,_,_)
             | WaxXiwa (id1,mid1,_,_,_,_,_,_,viBakwiH1,_,_) -> 
                   if id1 = previous id2 (* && id2 < id3 
                   rAmaH iva SyAmaH or SyAmaH rAmaH iva *) && (viBakwiH1=1 || viBakwiH1=viBakwiH3)
                   then  [ Relation (id1,mid1,"upamAnam",id3,mid3,"50.1")
                         ; Relation (id2,mid2,"upamAna_xyowakaH",id1,mid1,"50.2")
                         ]
                   else []
             | Kqw (id1,mid1,_,_,_,_,_,_,_,_,_,_,_,_,viBakwiH1,_,_) ->
                   if id1 = next id2 (* && id2 < id3 
                   aSmanA iva nirmiwaM xuRtAnAm hqxayam  *) && viBakwiH1=viBakwiH3
                   then  [ Relation (id1,mid1,"upamAnam",id3,mid3,"50.3")
                         ; Relation (id2,mid2,"upamAna_xyowakaH",id1,mid1,"50.4")
                         ]
                   else []
             | _ -> []
             ]
        | Wif (id3,mid3,_,_,_,_,_,_,_,_,_,_,_,_,_,_) -> 
             match m1 with
             [ Wif (id1,mid1,_,_,_,_,_,_,_,_,_,_,_,_,_,_) ->
                   if id1 = previous id2 && id2 < id3
                   then  [ Relation (id1,mid1,"upamAnam",id3,mid3,"50.5")
                         ; Relation (id2,mid2,"upamAna_xyowakaH",id1,mid1,"50.6")
                         ]
                   else []
             | _ -> []
             ]
        (* | Kqw (id3,mid3,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_) -> 
             match m1 with
             [ Kqw (id1,mid1,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_) -> 
                   if id1 = previous id2 && id2 < id3
                   then  [ Relation (id1,mid1,"upamAnam",id2,mid2,"41.5")
                         ; Relation (id2,mid2,"upamAnaxyowakaH",id3,mid3,"41.6")
                         ]
                   else []
             | _ -> []
             ] *)
        | _ -> []
        ]
        else []
     | _ -> []
     ]
;
value rlniwya_sambanXa_avy m1 m2 text_type = match m2 with
     [Avy (id2,mid2,_,rt2,_,_,_) -> match m1 with
      [Avy (id1,mid1,_,rt1,_,_,_) ->
        if  (rt1="yaxA" && rt2="waxA")
           || (rt1="yawra" && rt2="wawra")
           || (rt1="yawaH" && rt2="wawaH")
           || (rt1="yaWA" && rt2="waWA")
           || (rt1="yAvaw" && rt2="wAvaw")
(* waw is added to account for the following Shloka
यदि माम् अ-प्रतीकारम् अ-शस्त्रम् शस्त्र-पाणयः धार्तराष्ट्राः रणे हन्युः तत् मे क्षेम-तरम् भवेत्  1.46 *)
        then [ Relation (id1,mid1,"niwya_sambanXaH",id2,mid2,"51.1")]
        else []
      | _ -> []
      ]
     | AvywaxXiwa (id2,mid2,word2,rt2,_,_,_,_) -> match m1 with
       [ AvywaxXiwa (id1,mid1,word1,rt1,_,_,_,_) -> 
            if word1="yaxvaw" && word2="waxvaw"
            then [ Relation (id1,mid1,"niwya_sambanXaH",id2,mid2,"51.2")]
            else []
       | _ -> []
       ]
     | _ -> []
     ]
; 
value rlniwya_sambanXa_sup m1 m2 text_type = match m2 with
     [ Sup(id2,mid2,_,rt2,_,_,lifgam2,viBakwiH2,vacanam2,_)  -> 
      match m1 with
      [ Sup(id1,mid1,_,rt1,_,_,lifgam1,viBakwiH1,vacanam1,_) ->
        if (lifgam1=lifgam2) && (vacanam1=vacanam2) && not (id1=id2)
        then if  (
                   (rt1="yax" && rt2="wax") 
                || (rt1="yax" && rt2 = "ewax")
                || (rt1="yAvaw" && rt2="wAvaw")
                || (rt1="yAvawI" && rt2="wAvawI")
                || (rt1="yAxqS" && rt2="wAxqS")
                || (rt1="yAxqSI" && rt2="wAxqSI"))
        (* || rt1="kim"  || rt1 = "ewax" *) 
        (* How can there be a niwya sambanXa between kim and wax? *)
        (* How can there be a niwya sambanXa between ewax and wax? *)
         then [ Relation (id1,mid1,"niwya_sambanXaH1",id2,mid2,"52.1")]
         else []
        else []
      | _ -> []
      ]
     | _ -> []
     ]
; 

value rl_ca m1 m2 text_type = match m2 with
    [ Avy (id2,mid2,_,_,_,_,_) 
    | Kqw (id2,mid2,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_)
    | WaxXiwa (id2,mid2,_,_,_,_,_,_,_,_,_)
    | Wif (id2,mid2,_,_,_,_,_,_,_,_,_,_,_,_,_,_)
    | Avykqw (id2,mid2,_,_,_,_,_,_,_,_,_,_) 
    | Sup(id2,mid2,_,_,_,_,_,_,_,_)  -> match m1 with
      [ Avy (id1,mid1,word1,_,_,_,_) -> match word1 with
            [ "ca"
            | "vA" -> if id2 = previous id1
                      then [ Relation (id1,mid1,"sambanXaH",id2,mid2,"53.1")]
                      else []
            | _ -> []
            ]
      | _ -> []
      ]
    | _ -> []
    ]
;

value rl_exclamatory1 m1 m2 text_type = match m1 with
   [ Avy (id1,mid1,_,word1,_,_,_) ->  match m2 with
         [ Wif (id2,mid2,_,_,_,_,_,_,_,_,_,_,_,_,_,_)
         | Kqw (id2,mid2,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_) -> 
              if id1 < id2
              && no_boundary_crossing id1 id2 text_type
              &&   word1="aho" 
              then [ Relation (id1,mid1,"sambanXaH",id2,mid2,"54.1") 
                   ]
              else []
         |_ -> []
         ]
      |_ -> []
      ]
;

value rl_exclamatory2 m1 m2 m3 text_type = match m1 with
   [ Avy (id1,mid1,_,word1,_,_,_) ->  match m2 with
      [ Avy (id2,mid2,_,word2,_,_,_) -> match m3 with
         [ Wif (id3,mid3,_,_,_,_,_,_,_,_,_,_,_,_,_,_)
         | Kqw (id3,mid3,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_) -> 
              if id1 = previous id2 && id2 < id3
              && no_boundary_crossing id2 id3 text_type
              &&   ((word1="hA" && word2="hanwa") || 
                  (word1="aho" && word2="bawa") ||
                  (word1="ayi" && word2="Bo") ||
                  (word1="eva" && word2="ca")) 
         (*||
                  (word1="ca" && word2="eva")) 
              How can eva connect to a word after it?
              In prose form it is impossible. and even in Shloka form I can not think of any example *)
              then [ Relation (id1,mid1,"sambanXaH",id2,mid2,"55.2") 
                   ; Relation (id2,mid2,"sambanXaH",id3,mid3,"55.3") 
                   ]
              else []
         |_ -> []
         ]
      |_ -> []
      ]
   |_ -> []
   ]
;

(* patuwaraH SyAmaH rAmAw aswi *)

value rl_wulanA m1 m2 m3 text_type = match m1 with
   [ WaxXiwa (id1,mid1,_,_,_,_,wax_prawyayaH,_,viB1,_,_) -> 
       if ((wax_prawyayaH="warap") || (wax_prawyayaH="wamap"))
       then match m2 with
       [ Kqw (id2,mid2,_,_,_,_,_,_,_,_,_,_,_,_,viB2,_,_)
       | WaxXiwa (id2,mid2,_,_,_,_,_,_,viB2,_,_)
       | Sup(id2,mid2,_,_,_,_,_,viB2,_,_)  -> match m3 with
           [ Kqw (id3,mid3,_,_,_,_,_,_,_,_,_,_,_,_,viB3,_,_)
           | WaxXiwa (id3,mid3,_,_,_,_,_,_,viB3,_,_)
           | Sup(id3,mid3,_,_,_,_,_,viB3,_,_)  -> 
              if viB3=5 && viB1=viB2
              && no_boundary_crossing id2 id3 text_type
              then [ Relation (id3,mid3,"wulanA_binxuH",id2,mid2,"56.1")]
              else []
           |_ -> []
           ]
       |_ -> []
       ] else []
   | Sup(id1,mid1,_,rt1,_,_,_,viB1,_,_) -> 
             match rt1 with
                   ["SreRTa" |"SreRTA" | "SreyasI" | "Sreyas" | "aXika" | "kuSala" | "nipuNa" |"vara"
                   | "cawura" | "cawurA" | "parA" | "para" | "uwwama" | "jyAyasI" | "jyAyas" 
                   | "jyeRTa" | "jyeRTA"| "preyas" | "preyasI" | "preRTa" | "preRTA" | "patIyas" 
                   | "patIyasI" | "patiRTa"| "patiRTA" | "laGiyas" | "laGiyasI" | "laGiRTa" 
                   | "laGiRTA" | "garIyas" | "garIyasI" | "gariRTa" | "gariRTA" | "nexiRTa" 
                   | "nexiRTa" | "nexiyas" | "nexiyasI" | "sAXiRTa" | "sAXiRTA" | "sAxIyas" 
                   | "sAXiyasI"| "kaniRTa" | "kaniRTA" | "kanIyas" | "kaniyasI" | "yaviRTa" 
                   | "yaviRTA" | "yavIyas" | "yavIyAn" | "alpiRTa" | "alpiRTA" | "alpIyas" 
                   | "alpIyasI" | "srajiRTa" | "srajiRTA" | "sragvI" | "srajIyas" | "srajIyasI" 
                   | "wvaciRTa" | "wvaciRTA" | "wvacIyas" | "wvacIyasI" -> 
                   match m2 with
                     [ Kqw (id2,mid2,_,_,_,_,_,_,_,_,_,_,_,_,viB2,_,_)
                     | WaxXiwa (id2,mid2,_,_,_,_,_,_,viB2,_,_)
                     | Sup(id2,mid2,_,_,_,_,_,viB2,_,_)  -> match m3 with
                        [ Kqw (id3,mid3,_,_,_,_,_,_,_,_,_,_,_,_,viB3,_,_)
                        | WaxXiwa (id3,mid3,_,_,_,_,_,_,viB3,_,_)
                        | Sup(id3,mid3,_,_,_,_,_,viB3,_,_)  -> 
                           if viB3=5 && viB1=viB2
                           && no_boundary_crossing id2 id3 text_type
                           then [ Relation (id3,mid3,"wulanA_binxuH",id2,mid2,"56.2")]
                           else []
                        |_ -> []
                        ]
                    |_ -> []
                    ]
                   | _  -> []
                   ]
   | Wif (id1,mid1,_,rt1,_,_,upasarga1,_,_,_,_,_,_,_,_,_) ->
               if (rt1="ric1" && upasarga1="awi") || (rt1="SiR2" && upasarga1="vi")
               then
                 match m2 with
                  [ Kqw (id2,mid2,_,_,_,_,_,_,_,_,_,_,_,_,viB2,_,_)
                  | WaxXiwa (id2,mid2,_,_,_,_,_,_,viB2,_,_)
                  | Sup(id2,mid2,_,_,_,_,_,viB2,_,_) ->
                        if viB2=5 
                        then [ Relation (id2,mid2,"wulanA_binxuH",id1,mid1,"56.3")]
                        else []
                  |_ -> []
                  ]
               else []
   |_ -> []
   ]
;
(* Following function marks all the relations between two finite verbs due to discourse markers or co-referentials *)
value rl_wif_kriyA_kriyA m1 m2 m3 text_type = match m2 with
     [ Avy (id2,mid2,_,word2,_,_,_) -> 
        if    word2 = "yaxyapi" || word2 = "waWApi" 
           || word2 = "yaxi" || word2 = "warhi" || word2="cew"
           || word2 = "yawaH" || word2 = "wawaH" 
        then match m3 with
        [ Wif (id3,mid3,_,_,_,_,_,_,prayogaH3,lakAra3,puruRaH3,_,_,_,_,_) ->
             match m1 with
              [ Wif (id1,mid1,_,_,_,_,_,_,prayogaH1,lakAra1,puruRaH1,_,_,_,_,_) ->
                      if id1 < id2
                      then match word2 with
                      ["yaxyapi"
                      | "waWApi"  -> [ Relation (id1,mid1,"vyaBicAraH",id3,mid3,"57.1")]
                      | "yaxi"
                      | "warhi" ->  [ Relation (id1,mid1,"AvaSyakawA_pariNAma_sambanXaH",id3,mid3,"57.2")]
                      | "yawaH"
                      | "wawaH" -> [ Relation (id1,mid1,"kArya_kAraNa_BAvaH",id3,mid3,"57.3")]
                      | _ -> []
                      ]
                      else []
              | _ -> []
              ]
        | _ -> []
        ]
        else []
     | _ -> []
     ]
;

value rlca_samucciwa m1 m2 m3 text_type = match m2 with
     [ Avy (id2,mid2,_,word2,_,_,_) -> 
        if word2 = "ca" || word2 = "cEva" || word2 = "vA" || word2 = "aWa" || word2="waWA" || word2 = "api"
        then match m3 with
        [ Wif (id3,mid3,_,_,_,_,_,_,prayogaH3,lakAra3,puruRaH3,_,_,_,_,_) ->
           (* if id3 = next id2 then ; not necessary. e.g. rAmaH SAlAm gacCawi pATam ca paTawi*) 
             match m1 with
              [ Wif (id1,mid1,_,_,_,_,_,_,prayogaH1,lakAra1,puruRaH1,_,_,_,_,_) ->
              if id1 < id2 && prayogaH1=prayogaH3 && lakAra1=lakAra3 && puruRaH1=puruRaH3 (* && vacanam1=vacanam2  muKam pariSuRyawi gAwrANi ca sIxanwi *)
              && no_boundary_crossing id1 id3 text_type
                 (*&& (word3="ca" || word3="cEva" || (word3="waWA" && id3 < id2 && id3 > 1))&*)
              (*then if (((word2="ca" || word2="cEva")  && ((id2 < id3) || (id2 > id3)) && (id2 > id1+1)) (* id2 > id1+1 since otherwise in rAmaH ca vanam gacCawi, gacCawi is joined with rAmaH with ca *) *)
              then if (((word2="ca" || word2="cEva")  && ((id2 = id1+2)|| (id2=id3+1))) 
             (* id2 is the second word in the second sentence
               && (id2 = id1+2)) *)
             (* id2 > id3 for handling 'sma' as in yAnwi sma ca , and more than two samucciwas as in rAmaH moxawi KAxawi pibawi hasawi roxawi ca *)
                     || (word2="waWA" && id2 < id3 && yaWA_pos.val = 1000))
                 then
                         (* if (id2=id3 || id2 = id3+1) then *)
                         (*if (id2 = id3+1) then 
                                 * This condition is not needed.
                                 * rAmaH gAyawi sIwA ca paTawi; rAmaH gAyawi sIwA paTawi ca *)
                 [ Relation (id1,mid1,"samucciwaH",id3,mid3,"58.1")
                 ; Relation (id2,mid2,"samuccaya_xyowakaH",id3,mid3,"58.2")
                 ] 
              else []
              (* [ Relation (id3,mid3,"samucciwaH",id1,mid1,"46.1A")]*)
              else if (word2="vA")  && ((id2 < id3) || (id2 = id3+1)) && (id1 < id2) (* && not (id1 = id2-1)*)
                 then
                 [ Relation (id1,mid1,"anyawaraH",id3,mid3,"58.3")
                 ; Relation (id2,mid2,"anyawara_xyowakaH",id3,mid3,"58.4")
                 ]
                 else []
                 (*else []*)
              | _ -> []
              ]
            (* else [] *)
        | Avykqw (id3,mid3,_,_,_,_,_,_,kqw_prawyaya3,_,_,_) -> match m1 with
             [ Avykqw (id1,mid1,_,_,_,_,_,_,kqw_prawyaya1,_,_,_) ->
                 if id1 < id2 && kqw_prawyaya1=kqw_prawyaya3
                 then if (( (word2="ca" || word2="cEva")  && (id2 = next id3))
                     || (word2="waWA" && id2 < id3 && id2 > 1 && yaWA_pos.val = 1000))
                 then
                 [ Relation (id1,mid1,"sup_samucciwaH",id3,mid3,"58.5")
                 ; Relation (id2,mid2,"sup_samuccaya_xyowakaH",id3,mid3,"58.6")
                 ]
                 else if ( word2="vA")  && (id2 = next id3)
                 then
                 [ Relation (id1,mid1,"sup_anyawaraH",id3,mid3,"58.7")
                 ; Relation (id2,mid2,"sup_anyawara_xyowakaH",id3,mid3,"58.8")
                 ]
                 else []
                 else []
             | _ -> []
             ]
        | Sup(id3,mid3,_,_,_,_,_,viBakwiH3,vacanam3,_) 
        | WaxXiwa (id3,mid3,_,_,_,_,_,_,viBakwiH3,vacanam3,_) -> 
              match m1 with
              [ Sup(id1,mid1,word1,rt1,_,_,_,viBakwiH1,vacanam1,_) 
              | WaxXiwa (id1,mid1,word1,rt1,_,_,_,_,viBakwiH1,vacanam1,_) ->
              (* | Kqw (id1,mid1,word1,rt1,_,_,_,_,_,_,_,_,_,_,viBakwiH1,_,_) ->
                      This is commented to avoid the grouping of sIxanwi and gAwrANi with muKam_ca in 
                      sIxanwi mama gAwrANi muKam ca pariSuRyawi  *)
                 if id1 < id3  && viBakwiH1=viBakwiH3 
                 (* && vacanam1 = vacanam3 ; hqxayAni naBaH ca vyanunAxaya BhG 1.19 *)
                    && not (viBakwiH1 = 8 )
                 then if (  ((word2="ca" || word2="cEva") (*|| word2="api"*) && (id2 = next id3) || (id2 = id3 + 2)) (* we can have X Y Z api ca *)
                     || (word2="waWA" && id2 < id3 && id2 > 1 && yaWA_pos.val = 1000)
                     || (word2="aWa" && id2 < id3 && id2 > id1 ))
                 (* need an example of api as samuccaya *)
                    (* && not (( pronoun3 rt1 || member_of rt1 saMKyeya || member_of rt1 pUraNa || (member_of rt1 guNavAcI && uwwarapaxa1=word1) || (member_of rt1 uwwara_guNavAcI && not (uwwarapaxa1=word1))|| member_of rt1 sambanXavAcI) )  Removed uwwarapaxa guNavAcI *)
                 (*   && not ( pronoun3 rt1 || member_of rt1 saMKyeya || member_of rt1 pUraNa || member_of rt1 sambanXavAcI)  What is the necessity? give examples. *)
                 (* then if id3 = next id2 *) (* yogyawA *)
                 then
                 [ Relation (id1,mid1,"sup_samucciwaH",id3,mid3,"58.9")
                 ; Relation (id2,mid2,"sup_samuccaya_xyowakaH",id3,mid3,"58.10")
                 ]
                 else if (word2="vA") && (id2 = next id3)
                 then
                 [ Relation (id1,mid1,"sup_anyawaraH",id3,mid3,"58.11")
                 ; Relation (id2,mid2,"sup_anyawara_xyowakaH",id3,mid3,"58.12")
                 ]
                 else []
                 else []
              | _ -> []
              ]
        | Kqw (id3,mid3,_,_,_,_,kqw3,_,_,_,_,_,_,_,viBakwiH3,vacanam3,_) ->
              match m1 with
              [ Kqw (id1,mid1,_,_,_,_,kqw1,_,_,_,_,_,_,_,viBakwiH1,vacanam1,_) ->
                 if    id1 < id3
                    && viBakwiH1=viBakwiH3 && vacanam1=vacanam3
                    && kqw3=kqw1
                 then if (  ((word2="ca" || word2="cEva") && (id2 = next id3)) 
                     || (word2="waWA" && id2 < id3 && id2 > 1 && yaWA_pos.val = 1000))
                 then
                 [ Relation (id1,mid1,"sup_samucciwaH",id3,mid3,"58.13")
                 ; Relation (id2,mid2,"sup_samuccaya_xyowakaH",id3,mid3,"58.14")
                 ]
                 else if (word2="vA") && (id2 = next id3) 
                 then 
                 [ Relation (id1,mid1,"sup_anyawaraH",id3,mid3,"58.15")
                 ; Relation (id2,mid2,"sup_anyawara_xyowakaH",id3,mid3,"58.16")
                 ]
                 else []
                 else []
              | Sup(id1,mid1,word1,rt1,_,_,_,viBakwiH1,vacanam1,_)
              | WaxXiwa (id1,mid1,word1,rt1,_,_,_,_,viBakwiH1,vacanam1,_) ->
                 if id1 < id3  && viBakwiH1=viBakwiH3 && vacanam1=vacanam3
                 then if (  ((word2="ca" || word2="cEva") && (id2 = next id3)) 
                     || (word2="waWA" && id2 < id3 && id2 > 1 && yaWA_pos.val = 1000))
                 then
                 [ Relation (id1,mid1,"sup_samucciwaH",id3,mid3,"58.17")
                 ; Relation (id2,mid2,"sup_samuccaya_xyowakaH",id3,mid3,"58.18")
                 ]
                 else if (word2="vA") && (id2 = next id3)
                 then
                 [ Relation (id1,mid1,"sup_anyawaraH",id3,mid3,"58.19")
                 ; Relation (id2,mid2,"sup_anyawara_xyowakaH",id3,mid3,"58.20")
                 ]
                 else []
                 else []
              |  _ -> []
              ]
        | _ -> [] 
        ]
        else []
     | _ -> []
     ]
;

value init_relation_encoding_array () =
List.iter assign relations_encodings
where assign (ident,index) = 
relation_array.(index) := ident
;

value init_sentence_feature_variables morphs  = 
 List.iter 
 (fun m -> match m with 
     [ Wif (id,_,_,rt,_,_,upasarga,_,_,_,_,_,_,_,_,_) -> 
             do { 
             (); finite_verb_in_sentence.val := id; 
             if(total_wrds.val < id) then total_wrds.val := id else ();
             if members_of rt upasarga karwqsamAnAXikaraNa_verbs 
             then karwqsamverbs.val := id else ()
             }
     | WaxXiwa (id,_,_,_,_,_,_,_,_,_,_)
     | Kqw (id,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_)
     | Avykqw (id,_,_,_,_,_,_,_,_,_,_,_)
     | AvywaxXiwa (id,_,_,_,_,_,_,_)-> if (total_wrds.val < id) then total_wrds.val := id else ()
     | Sup (id,_,word,rt,_,_,_,_,_,_) -> do {
                 if (total_wrds.val < id) then total_wrds.val := id else ()
                 ;if rt="yax" then yax_pos.val := id else ()
                 ;if rt="yAvaw" then yAvaw_pos.val := id else ()
                 ;if rt="wAvaw" then wAvaw_pos.val := id else ()
                 ;if word="wvam" then wvam_pos.val := id else ()
                 }
     | Avy (id,_,word,_,_,_,_) -> do {
                 if (total_wrds.val < id) then total_wrds.val := id else ()
                ;match word with
          [ "iwi" -> do { (); iwi_pos.val := id;}
          (*| "evam" -> do { (); evam_pos.val := id;}*)
          | "yaxA" -> do { (); yaxA_pos.val := id;}
          | "yaWA" -> do { (); yaWA_pos.val := id;}
          | "waxA" -> do { (); waxA_pos.val := id;}
          | "yawra" -> do { (); yawra_pos.val := id;}
          | "wawra" -> do { (); wawra_pos.val := id;}
          | "yAvaw" -> do { (); yAvaw_pos.val := id;}
          | "wAvaw" -> do { (); wAvaw_pos.val := id;}
          | "yaxi" -> do { (); yaxi_pos.val := id;}
          | "yawaH" -> do { (); yawaH_pos.val := id;}
          | "warhi" -> do { (); warhi_pos.val := id;}
          | "waw" -> do { (); waw_pos.val := id;}
          | "wax" -> do { (); waw_pos.val := id;}
          | "awaH" -> do { (); awaH_pos.val := id;}
          | "wawaH" -> do { (); wawaH_pos.val := id;}
          | "cew" -> do { (); cew_pos.val := id;}
          | "yaxyapi" -> do { (); yaxyapi_pos.val := id;}
          | "waWApi" -> do { (); waWApi_pos.val := id;}
          | "waWA" -> do { (); waWA_pos.val := id;}
          | "aWApi" -> do { (); aWApi_pos.val := id;}
          | "aWa" -> do { (); aWa_pos.val := id;}
          | "yaw" -> do { (); yaw_pos.val := id;}
          | "yax" -> do { (); yaw_pos.val := id;}
          | "yasmAw" -> do { (); yasmAw_pos.val := id;}
          | "wasmAw" -> do { (); wasmAw_pos.val := id;}
          | "hi" -> do { (); hi_pos.val := id;}
          | "apiwu" -> do { (); apiwu_pos.val := id;}
          | "kinwu" -> do { (); kinwu_pos.val := id;}
          | "paranwu" -> do { (); paranwu_pos.val := id;}
          | _ -> ()
          ] 
          }
     ] 
 ) morphs
;

value all_rules2 = 
[
rlwifkarwA_karma; rlkqwkarwA_karma;
rlanaBihiwe; rlapAxAna_wasil; rlAvy_kriyAviSeRaNam_or_aXikaraNam; rlBAvalakRaNa_sapwamI1; rlBAvalakRaNa_sapwamI2; rlpUrvakAla; rlwumun1; rlwumun2; rlkwa_as; rlsamAnakAla; rlviSeRaNam; rlavy_viSeRaNam; rlvIpsA; rlsamboXana_xyowakaH; rlnirXAraNam; rlupapaxa_other_rel; rlupapaxa; rlsambanXa1; rlavy_wif_mA; rlavy_wifkqw_special; rl_sma; rlavy_sent_connector;
rl_kAraka_RaRTI1; rl_kAraka_RaRTI2; rl_kAraka_RaRTI3;
rlAvykqw_karma; rlevamkarma; rl_last_iwi; rlRaRTIsambanXaH; rlviRayAXikaraNam; rlhewuprayoge; 
rlniwya_sambanXa_avy; rlniwya_sambanXa_sup; (* rl_initial_avy;*)  rl_ca; rlsent_beginning_connectives; (*rlparimANa_viSeRaNam;*) rl_exclamatory1; (*rlhewu_sup;*) rlkarwqrahiwakarwqsamAnAXikaraNam; rlafgavikAra; rl_spl_aXikaraNam; 
 (* rlkarwqsamAnAXikarana_noverb;  This is over-generating  we need more stringent conditions *)
rlkriyAviSeRaNam_wqwIyA; rlaXikaraNam
  ]
;
value all_rules3 = [rlkarwqsamAnAXikaraNam; rlkarmasamAnAXikaraNam; (*rlwAxarWya;*) rlvAkyakarma; rlvAkyakarma1; rlsent_connectives; rlupamAna_upameya_sup; rlca_samucciwa; rl_exclamatory2; rl_ca_wif_aBihiwa_karwA_karma; rl_wulanA; rl_nAma; rl_saha_vinA_kqwe; rl_wif_kriyA_kriyA]
;

value kAraka_engine3 morphs text_type =
  loop1 [] morphs 
  where rec loop1 acc1 = fun
       [ [] -> acc1
       | [ m1 :: r1 ] -> 
             let relations_m1 = loop2 [] morphs
             where rec loop2 acc2 = fun
            [ [] -> acc2
            | [ m2 :: r2 ] -> 
                     let relations_m1_m2 = loop3 [] morphs
                     where rec loop3 acc3 = fun
                     [ [] -> if distinct_2 m1 m2  then
                               List.fold_left collate acc2 all_rules2 where
                               collate rls rule = match rule m1 m2 text_type with
                               [ [] -> List2.union rls acc3
                               | r -> List.append r rls
                               ]
                             else acc3
                     | [m3 :: r3 ] -> 
                            if distinct_3 m1 m2 m3 then
                               let relations_m1_m2_m3 = 
                                 List.fold_left collate acc3 all_rules3 where
                                 collate rls rule = match rule m1 m2 m3 text_type with
                                 [ [] -> rls
                                 | r -> List2.union r rls
                                 ] in loop3 (List2.union relations_m1_m2_m3 acc3) r3
                            else loop3 acc3 r3
                    ] in loop2 (List2.union relations_m1_m2 acc2) r2
            ] in loop1 (List2.union relations_m1 acc1) r1
       ] 
;

value process morphs text_type tfpath = 
  let offline_file = tfpath^"graph.txt"  in
  let cho = open_out offline_file in do
  { (* List.iter print_morph_id morphs *) (* we print the input for verification *)
   let rel_lst = List.sort_uniq compare (kAraka_engine3 morphs text_type) in
    let sorted_lst = List.rev (List.sort_uniq compare rel_lst) in  do
    { List.iter (print_relation cho) sorted_lst
    ; flush cho
    ; close_out cho
    ; let tpl_lst = mk_tuple_lst [] sorted_lst in  (* do {
        List.iter Constraint.print_relation tpl_lst 
        ; *) Constraint.solver tpl_lst text_type
    (* } *)
    }
  }
;

(* value text_type arg1 = if arg1="Prose" || arg1="Sloka" then arg1 else failwith "Incorrect Argument\n"
; 
*)

value main () = if (Array.length Sys.argv < 3 ) then do
           { print_string "\n\n"
           ; print_string "Usage: ./build_graph tmp_file_path Prose|Sloka\n\n"
           ; failwith "Parsing aborted\n"
           } 
        else do
           { init_relation_encoding_array()
           ; let _ = relations_encodings
           ; let _ = afgavikaara_list
           ; let _ = nirXAraNa_list
           ; let text_type = Sys.argv.(2)
             and tfpath = Sys.argv.(1)
             and morphs = analyse (Stream.of_channel stdin) in
             do
             { init_sentence_feature_variables morphs
             ; process morphs text_type tfpath
             }
           }
;
main()
;
