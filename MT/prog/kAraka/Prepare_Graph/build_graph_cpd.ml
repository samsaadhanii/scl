(* Copyright: Amba Kulkarni (2014-2024) 
 * Sanjeev Panchal (2015-2020) *)


(* open Paths; *)

open Pada_structure; 

open Bank_lexer; 
module Gram = Camlp4.PreCast.MakeGram Bank_lexer 
;
open Bank_lexer.Token;

open Relations;
open GuNavacana;
open GuNa_not_guNavacana;
open Akarmaka_dhaatu;
open KAlAXikaraNa;
open KaraNa_dhaatu;
open KriyAviSeRaNa;
open ManuRyasaFjFAvAcI;
open Named_entity;
open WaxXiwAnwa;
open BuxXyarWa_dhaatu;
open GuNavacana;
open GuNa_not_guNavacana;
open GawyarWa_dhaatu;
open Sabxakarma_dhaatu; 
open PrawyavasAnArWa_dhaatu;
open Sakarmaka_dhaatu;
open XravyavAcI;
open XeSAXikaraNa;
open Xvikarmaka1_dhaatu;
open Xvikarmaka2_dhaatu;
open JAwivAcaka;
open SafKyA_vAcI;
open KAla_vAcI;
open CawuRpAxa_jAwi_vAcI;
open VarNavAcI;
open VyAGrAxi;
open WaxXiwAnwa_safKyA_vAcI;
open WaxXiwAnwa_xik_vAcI;
open Xik_vAcI;
open Exceptional_cpd_list;
open NaxI_vAcI;

value morphs = Gram.Entry.mk "morphs"
;

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
        "(cid"; c = INT; ")"; 
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
    (int_of_string i, int_of_string c, int_of_string m,w,r,cp,cu,ling,int_of_string vib,vac,int_of_string lev)
    ] ] ;

  wif:
    [ [ "(wif"; "(id"; i = INT; ")"; 
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
        "(level"; lev = INT; ")";
    ")" -> 
    (int_of_string i, int_of_string c,int_of_string m,w,r,cp,cu,upa,san,voice,la,per,vac,padi,gana,int_of_string lev)
    ] ] ;

  kqw:
    [ [ "(kqw"; "(id"; i = INT; ")"; 
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
        "(level"; lev = INT; ")";
    ")" -> 
    (int_of_string i, int_of_string c,int_of_string m,w,kqwrt,upa,san,kp,p,gana,r,cp,cu,ling,int_of_string vib,vac,int_of_string lev)
    ] ] ;

  avy:
    [ [ "(avy"; "(id"; i = INT; ")"; 
        "(cid"; c = INT; ")"; 
        "(mid"; m = INT; ")"; 
        "(word"; w = IDENT; ")"; 
        "(rt"; r = IDENT; ")"; 
        "(pUrvapaxa"; cp = IDENT; ")"; 
        "(uwwarapaxa"; cu = IDENT; ")"; 
        "(level"; lev = INT; ")";")" -> 
    (int_of_string i, int_of_string c,int_of_string m,w,r,cp,cu,int_of_string lev)
    ] ] ;

  avywaxXiwa:
    [ [ "(avywaxXiwa"; "(id"; i = INT; ")"; 
               "(cid"; c = INT; ")"; 
               "(mid"; m = INT; ")"; 
               "(word"; w = IDENT; ")"; 
               "(rt"; r = IDENT; ")"; 
               "(pUrvapaxa"; cp = IDENT; ")"; 
               "(uwwarapaxa"; cu = IDENT; ")"; 
               "(waxXiwa_prawyayaH"; taddhita = IDENT; ")"; 
               "(level"; lev = INT; ")";
    ")" -> 
    (int_of_string i, int_of_string c,int_of_string m,w,r,cp,cu,taddhita,int_of_string lev)
    ] ] ;

  avykqw:
    [ [ "(avykqw"; "(id"; i = INT; ")"; 
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
           "(level"; lev = INT; ")";
     ")" -> 
    (int_of_string i, int_of_string c,int_of_string m,w,r,cp,cu,upa,san,kqw,gana,int_of_string lev)
    ] ] ;
  waxXiwa:
    [ [ "(waxXiwa"; "(id"; i = INT; ")"; 
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
            "(level"; lev = INT; ")";
    ")" -> 
    (int_of_string i, int_of_string c,int_of_string m,w,r,cp,cu,taddhita,ling,int_of_string vib,vac,int_of_string lev)
    ] ] ;
END
;

value get_assoc key assoc_array =
     try 
	List.assoc key assoc_array
     with [ Not_found -> ""]
;


value distinct_2_pUrvapaxa m1 m2 = match m1 with 
  [ Wif (id1,_,_,_,_,pUrvapaxa1,_,_,_,_,_,_,_,_,_,_)
  | Kqw (id1,_,_,_,_,_,_,_,_,_,_,pUrvapaxa1,_,_,_,_,_)
  | Avykqw (id1,_,_,_,_,pUrvapaxa1,_,_,_,_,_,_)
  | AvywaxXiwa (id1,_,_,_,_,pUrvapaxa1,_,_,_)
  | Sup (id1,_,_,_,_,pUrvapaxa1,_,_,_,_,_)
  | Avy (id1,_,_,_,_,pUrvapaxa1,_,_)
  | WaxXiwa (id1,_,_,_,_,pUrvapaxa1,_,_,_,_,_,_) -> match m2 with
  	[ Wif (id2,_,_,_,_,pUrvapaxa2,_,_,_,_,_,_,_,_,_,_)
  	| Kqw (id2,_,_,_,_,pUrvapaxa2,_,_,_,_,_,_,_,_,_,_,_)
 	| Avykqw (id2,_,_,_,_,pUrvapaxa2,_,_,_,_,_,_)
 	| AvywaxXiwa (id2,_,_,_,_,pUrvapaxa2,_,_,_)
 	| Sup (id2,_,_,_,_,pUrvapaxa2,_,_,_,_,_)
 	| Avy (id2,_,_,_,_,pUrvapaxa2,_,_)
 	| WaxXiwa (id2,_,_,_,_,_,pUrvapaxa2,_,_,_,_,_) -> 
                if not (id1 = id2) && (pUrvapaxa1="y") && not (pUrvapaxa2 = "y")
                then True
                else False
        ]
   ]
;

value compound_pUrvapaxa_uwwarapaxa m1 m2 = match m1 with
  [ Wif (id1,cid1,_,_,_,_,_,_,_,_,_,_,_,_,_,_)
  | Kqw (id1,cid1,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_)
  | Avykqw (id1,cid1,_,_,_,_,_,_,_,_,_,_)
  | AvywaxXiwa (id1,cid1,_,_,_,_,_,_,_)
  | Sup (id1,cid1,_,_,_,_,_,_,_,_,_)
  | Avy (id1,cid1,_,_,_,_,_,_)
  | WaxXiwa (id1,cid1,_,_,_,_,_,_,_,_,_,_) -> match m2 with
  	[ Wif (id2,cid2,_,_,_,_,_,_,_,_,_,_,_,_,_,_)
  	| Kqw (id2,cid2,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_)
 	| Avykqw (id2,cid2,_,_,_,_,_,_,_,_,_,_)
 	| AvywaxXiwa (id2,cid2,_,_,_,_,_,_,_)
 	| Sup (id2,cid2,_,_,_,_,_,_,_,_,_)
 	| Avy (id2,cid2,_,_,_,_,_,_)
 	| WaxXiwa (id2,cid2,_,_,_,_,_,_,_,_,_,_) -> 
                if (id1 = id2) && not (cid1 = cid2)
                then True
                else False
        ]
   ]
;

value compound_pUrvapaxa_uwwarapaxa_3 m1 m2 m3 = compound_pUrvapaxa_uwwarapaxa m1 m2
                                                 && compound_pUrvapaxa_uwwarapaxa m2 m3
                                                 && compound_pUrvapaxa_uwwarapaxa m1 m3
;

value rec populate_from trie = fun
   [ [] -> trie.val
   | [w::rest] ->  do { let word = Transduction.code_raw_WX w
		        in try trie.val := Trie.enter trie.val word
                           with [ Trie.Redundancy -> output_string stderr ("Fatal error: duplicated entry:" ^ w ^"\n") ]
		       ; populate_from trie rest 
                     }
  ]
;

value build_trie list = 
  let trie = ref Trie.empty in
      (*do { populate_from trie list
     ; (trie.val) *)
      populate_from trie list
     (*}*)
;

value member_of word trie =
       Trie.mem (Transduction.code_raw_WX word) trie
;
    
value members_of rt upasarga trie =
       if upasarga = "X" 
       then member_of rt trie
       else member_of (upasarga^"_"^rt) trie
;

value karaNa_verbs = build_trie karaNa_XAwu_list
;

value akarmaka_verbs = build_trie akarmaka_XAwu_list
;

value sakarmaka_verbs =  build_trie sakarmaka_XAwu_list
;

value xvikarmaka1 = build_trie xvikarmaka_XAwu_list1
;

value xvikarmaka2 = build_trie xvikarmaka_XAwu_list2
;

(* In gawyarWaka, buxXi, prawyavasAnArWa and shabxakarma, only sakarmaka dhaatus are considered: see extract.sh programme for details *)
value gawyarWa_verbs = build_trie gawyarWa_XAwu_list
;

value buxXyarWa_verbs = build_trie buxXyarWa_XAwu_list
;

value shabxakarma_verbs = build_trie shabdakarma_dhaatu_list
;

value prawyavasAnArWa_verbs = build_trie prawyavasAnArWa_XAwu_list
;

value named_entity = build_trie named_entity_list
;

value safKyA_vAcI = build_trie safKyA_vAcI_list
;

value waxXiwAnwa_safKyA_vAcI = build_trie waxXiwAnwa_safKyA_vAcI_list
;

value waxXiwAnwa_xik_vAcI = build_trie waxXiwAnwa_xik_vAcI_list
;

value guNavacana = build_trie guNavacana_list
;

value jAwivAcaka = build_trie jAwivAcaka_list
;

value guNa_not_guNavacana = build_trie guNa_not_guNavacana_list
;

value xravyavAcI = build_trie xravyavAci_list
;

value xik_vAcI = build_trie xik_vAcI_list
;

value kAla_vAcI = build_trie kAla_vAcI_list
;

value cawuRpAxa_jAwi_vAcI = build_trie cawuRpAxa_jAwi_vAcI_list
;

value varNa_vAcI = build_trie varNavAcI_list
;

value vyAGrAxi = build_trie vyAGrAxi_list
;

value naxI_vAcI = build_trie naxI_vAcI_list
;

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


(* Compound Analysis *)

value is_swokAxi word = match word with 
  [ "swokAw-" | "alpAw-" | "kRullakAw-" | "sUkRmAw-" | "SlakRNAw-" 
  | "xaBrAw-" | "kqSAw-" | "wanu-" | "mAwrA-" | "wruti-" | "lavAw-" 
  | "leSAw-" | "kaNAw-" | "aNu-" | "samIpAw-" | "nikatAw-" 
  | "AsannAw-" | "sannikqRtAw-" | "sanIdAw-" | "saxeSAw-" 
  | "aByASAw-" | "saviXAw-" | "samaryAxAw-" | "saveSAw-" 
  | "upakaNTAw-" | "anwikAw-" | "aByarNAw-" | "aByagrAw-" 
  | "upahvarAw-" | "xUrAw-" | "viprakqRtAw-" | "parAw-" | "ArAw-" 
  | "kqcCrAw-" | "kqcCra-"
    -> True
  | _ -> False 
  ]
;

value is_SreNyAxi word = match word with 
  [ "SreNi-" | "eka-" | "pUga-" | "kuNda-" | "rASi-" | "viSiKa-" | "nicaya-" 
  | "niXAna-" | "inxra-" | "xeva-" | "muNda-" | "BUwa-" | "SravaNa-" | "vaxAnya-" 
  | "aXyApaka-" | "aBirUpaka-" | "brAhmaNa-" | "kRawriya-" | "patu-" | "paNdiwa-" 
  | "kuSala-" | "capala-" | "nipuNa-" | "kqpaNa-"
    -> True
  | _ -> False 
  ]
;

value is_kqwAxi rt = match rt with 
  [ "kqwa" | "miwa" | "mawa" | "BUwa" | "ukwa" | "samAjFAwa" | "samAmnAwa" 
  | "samAKyAwa" | "saMBAviwa" | "avaXAriwa" | "nirAkqwa" | "avakalpiwa" 
  | "upakqwa" | "upAkqwa" 
    -> True
  | _ -> False
  ]
;

(*value rl_compound_kwAnwa_2 m1 m2 text_type = match m2 with *)
(*  [ Kqw (id2,cid2,mid2,_,base2,upasarga2,_,kqw_prawyaya2,_,_,rt2,pUrvapaxa2,uwwarapaxa2,_,_,_,_)*)
(*    -> match m1 with *)
(*       [ Kqw (id1,cid1,mid1,word1,_,_,_,kqw_prawyaya1,_,_,rt1,pUrvapaxa1,uwwarapaxa1,_,_,_,_)*)
(*         -> *)
(*         (* 2.1.49 *)*)
(*         [ Relation (id1,cid1,mid1,"karmaXArayaH_1",id2,cid2,mid2,"200.1",0) ]*)
(*       | _ -> []  *)
(*       ]*)
(*  *)
(*  | _ -> *)
(*  ]*)
(*;*)

value rl_compound_kwAnwa_2 m1 = match m1 with 
  [ Kqw (_,_,_,_,_,_,_,kqw_prawyaya1,_,_,_,_,_,_,_,_,_)
    -> if kqw_prawyaya1 = "kwa" then 
         True
       else False
  | _ -> False
  ]
;


value rl_compound_kwa m1 m2 text_type = match m1 with 
  [ Sup (id1,cid1,mid1,word1,rt1,pUrvapaxa1,uwwarapaxa1,_,_,_,_)
  | Kqw (id1,cid1,mid1,word1,_,_,_,_,_,_,rt1,pUrvapaxa1,uwwarapaxa1,_,_,_,_)
  | WaxXiwa (id1,cid1,mid1,word1,rt1,pUrvapaxa1,uwwarapaxa1,_,_,_,_,_) -> 
     match m2 with
     [ Kqw (id2,cid2,mid2,_,base2,upasarga2,_,kqw_prawyaya2,_,_,rt2,pUrvapaxa2,uwwarapaxa2,_,_,_,_)
      -> 
        if (id1 = id2) && (pUrvapaxa1="y") && (uwwarapaxa2="y") && (cid2 > cid1) then
          if kqw_prawyaya2 = "kwa" then
            if rl_compound_kwAnwa_2 m1 then 
              (* 2.1.49 *)
              [ Relation (id1,cid1,mid1,"karmaXArayaH_1",id2,cid2,mid2,"200.1",0) ]
            else if is_SreNyAxi word1 && is_kqwAxi rt2 then 
              (* 2.1.59 *)
              [ Relation (id1,cid1,mid1,"karmaXArayaH",id2,cid2,mid2,"200.2",0) ]
            else if rt2 = "pawiwa" then 
              (* 2-1-24 & 2-1-38 *)
              [ Relation (id1,cid1,mid1,"xviwIyA_wawpuruRaH",id2,cid2,mid2,"200.3",0); Relation (id1,cid1,mid1,"paFcamI_wawpuruRaH",id2,cid2,mid2,"200.2",0) ]
            else if rt2 = "Sriwa" || rt2 = "awIwa" || rt2 = "gawa" || rt2 = "awyaswa" || rt2 = "prApwa" || rt2 = "Apanna" then 
              (* 2-1-24 *)
              [ Relation (id1,cid1,mid1,"xviwIyA_wawpuruRaH",id2,cid2,mid2,"200.4",0) ]
            else if rt2 = "hiwa" || rt2 = "rakRiwa" then 
              (* 2-1-36 *)
              [ Relation (id1,cid1,mid1,"cawurWI_wawpuruRaH",id2,cid2,mid2,"200.5",0) ]
            else if rt2 = "BIwa" || rt2 = "apewa" || rt2 = "apoDa" || rt2 = "mukwa" || rt2 = "apawraswa" then 
              (* 2-1-37 vArwikam *)
              (* 2-1-38 *)
              [ Relation (id1,cid1,mid1,"paFcamI_wawpuruRaH",id2,cid2,mid2,"200.6",0) ]
            else if rt1 = "svayam" || rt1 = "KatvA" || rt1 = "sAmi" || member_of rt1 kAla_vAcI then 
              (* svayam kwena (2-1-25) *)
              (* KatvA kRepe (2-1-26); ninxAyAm *)
              (* sAmi (2-1-27) *)
              (* kAlAH (2-1-28) *)
              [ Relation (id1,cid1,mid1,"xviwIyA_wawpuruRaH",id2,cid2,mid2,"200.7",0) ]
            else if word1 = "wawra-" then 
              (* 2-1-46 *)
              [ Relation (id1,cid1,mid1,"sapwamI_wawpuruRaH",id2,cid2,mid2,"200.8",0) ]
            else if is_swokAxi word1 then 
              (* 2-1-39 *)
              [ Relation (id1,cid1,mid1,"paFcamI_wawpuruRaH",id2,cid2,mid2,"200.9",0) ]
            (*else if (members_of base2 upasarga2 karaNa_verbs) || (not (verb_type base2 upasarga2 = "akarmaka")) then *)
            else if (members_of base2 upasarga2 karaNa_verbs) then
              (* karwqkaraNe kqwA bahulam (2.1.32 *)
              [ Relation (id1,cid1,mid1,"wqwIyA_wawpuruRaH",id2,cid2,mid2,"200.10",0) ]
            else []
          else if kqw_prawyaya2 = "yaw" || kqw_prawyaya2 = "Nyaw" then 
            if (members_of base2 upasarga2 karaNa_verbs) || (not (verb_type base2 upasarga2 = "akarmaka")) then 
              (* kqwyEraXikArWavacane (2.1.33) *)
              [ Relation (id1,cid1,mid1,"wqwIyA_wawpuruRaH",id2,cid2,mid2,"200.11",0) ]
            else []
          else []
        else []
     | Sup (id2,cid2,mid2,_,_,pUrvapaxa2,uwwarapaxa2,_,_,_,_)
     | WaxXiwa (id2,cid2,mid2,_,_,pUrvapaxa2,uwwarapaxa2,_,_,_,_,_)  
       -> 
         if (id1 = id2) && (pUrvapaxa1="y") && (uwwarapaxa2="y") && (cid2 > cid1) then
           if rt1 = "prApwa" || rt1 = "Apanna" then 
              [ Relation (id1,cid1,mid1,"wawpuruRaH",id2,cid2,mid2,"200.12",0) ]
           else []
         else []
     | _ -> []
     ] 
  | _ -> []
  ]
;

value rl_compound_yaw_2 m = match m with 
  [ Kqw (_,_,_,_,_,_,_,kqw_prawyaya1,_,_,_,_,_,_,_,_,_)
    -> if kqw_prawyaya1 = "yaw" then 
         True
       else False
  | _ -> False
  ]
;

value rl_compound_viBakwi_wa_pu m1 m2 text_type = match m1 with
  [ Sup (id1,cid1,mid1,_,rt1,pUrvapaxa1,uwwarapaxa1,_,_,_,_)
  | Kqw (id1,cid1,mid1,_,_,_,_,_,_,_,rt1,pUrvapaxa1,uwwarapaxa1,_,_,_,_)
  | WaxXiwa (id1,cid1,mid1,_,rt1,pUrvapaxa1,uwwarapaxa1,_,_,_,_,_) -> 
    match m2 with
    [ Sup (id2,cid2,mid2,_,rt2,pUrvapaxa2,uwwarapaxa2,_,_,_,_)
    | WaxXiwa (id2,cid2,mid2,_,rt2,pUrvapaxa2,uwwarapaxa2,_,_,_,_,_)  
    | Kqw (id2,cid2,mid2,_,_,_,_,_,_,_,rt2,pUrvapaxa2,uwwarapaxa2,_,_,_,_)
      -> 
        if (id1 = id2) && (pUrvapaxa1="y") && (uwwarapaxa2="y") && (cid2 > cid1) then
          if member_of rt1 kAla_vAcI then
            if rl_compound_yaw_2 m2 then 
              (* kqwyErqNe 2.1.43 *)
              [ Relation (id1,cid1,mid1,"sapwamI_wawpuruRaH",id2,cid2,mid2,"200.13",0)]
            else 
              (* awyanwasaMyoge ca 2.1.29 *)
              [ Relation (id1,cid1,mid1,"xviwIyA_wawpuruRaH",id2,cid2,mid2,"200.14",0)]
          else match rt2 with 
          [ "pUrva" | "saxqSa" | "sama" | "Una" | "kalaha" | "miSra" | "SlakRNa"
            (* pUrvasaxqSasamonArWakalahanipuNamiSraSlakRNEH (2-1-31) *)
            -> [ Relation (id1,cid1,mid1,"wqwIyA_wawpuruRaH",id2,cid2,mid2,"200.15",0) ]
          | "XAna" | "anna" | "oxana" | "pqWuka" 
            (* annena vyaFjanam (2-1-34) *)
	          (* BakRyeNa miSrIkaraNam (2-1-35) *)
            -> [ Relation (id1,cid1,mid1,"wqwIyA_wawpuruRaH",id2,cid2,mid2,"200.16",0) ]
          | "Baya" | "BIwi" | "BI" 
            (* paFcamI Bayena 2-1-35 *)
            -> [ Relation (id1,cid1,mid1,"paFcamI_wawpuruRaH",id2,cid2,mid2,"200.17",0) ]
            (* sapwamI SONdEH 2-1-40 *)
          | "SONda" | "XUrwa" | "kiwava" | "vyAda" | "pravINa" 
          | "saMvIwa" | "anwar" | "aXi" | "patu" | "paNdiwa" 
          | "capala" | "vAsa" | "baxXa" | "aXIna" 
          | "ata" | "brahman" | "guru"
            (* sixXaSuRkapakvabanXESca (2-1-41) *)
          | "sixXa" | "SuRka" | "pakva" | "banXa"
            (* XvAfkReNa kRepe (2-1-42) *)
          | "guFja" | "kAkaciFca" | "kqRNala" | "kAkamuxga" 
          | "muxgaparNa" | "saha" | "kAkAfga" | "kAkanAsika" 
          | "vAyasa" | "kAkamAca" | "ariRta" | "AwmaGoRa" | "baliBu" 
          | "balipuRta" | "ciraFjIvi" | "ekaxqRta" | "kAka" | "karata" 
          | "mOkala" | "paraBq" | "sakqwpraja" | "XvAfkRa" | "kAkola" 
          | "xroNakAka" | "xroNa" | "bala"
            -> [ Relation (id1,cid1,mid1,"sapwamI_wawpuruRaH",id2,cid2,mid2,"200.18",0)]
          | "arWa" | "bali" | "suKa" 
            -> (* cawurWI waxarWArWabalihiwasuKarakRiwEH (2-1-36) *) 
            [ Relation (id1,cid1,mid1,"wa_pu_4",id2,cid2,mid2,"200.19",0) ]
          | "nipuNa" -> [ Relation (id1,cid1,mid1,"wqwIyA_wawpuruRaH",id2,cid2,mid2,"200.14",0); Relation (id1,cid1,mid1,"sapwamI_wawpuruRaH",id2,cid2,mid2,"200.19",0) ]
          | _ -> 
            if member_of rt2 guNavacana then 
              (* wqwIyA wawkqwArWena guNavacanena (2-1-30) *)
              [ Relation (id1,cid1,mid1,"wqwIyA_wawpuruRaH",id2,cid2,mid2,"200.20",0) ]
            else []
          ]
        else []
    | _ -> []
    ]
  | _ -> []
  ]
;

value rl_compound_kqwya_1 m = match m with 
  [ Kqw (_,_,_,_,_,_,_,kqw_prawyaya1,_,_,_,_,_,_,_,_,_)
    -> match kqw_prawyaya1 with 
       [ "wavyaw" | "wavya" | "anIyar" | "Nyaw" | "yaw"
         -> True
       | _ -> False
       ]
  | _ -> False
  ]
;

value is_kriyA m = match m with
  [ Kqw (_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_)
  | Wif (_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_) 
    -> True
  | _ -> False
  ]
;

value rl_compound_K m1 m2 text_type = match m1 with
  [ Sup (id1,cid1,mid1,_,rt1,pUrvapaxa1,uwwarapaxa1,_,_,_,_)
  | Kqw (id1,cid1,mid1,_,_,_,_,_,_,_,rt1,pUrvapaxa1,uwwarapaxa1,_,_,_,_)
  | WaxXiwa (id1,cid1,mid1,_,rt1,pUrvapaxa1,uwwarapaxa1,_,_,_,_,_) -> 
    match m2 with
    [ Sup (id2,cid2,mid2,_,rt2,pUrvapaxa2,uwwarapaxa2,_,_,_,_)
    | WaxXiwa (id2,cid2,mid2,_,rt2,pUrvapaxa2,uwwarapaxa2,_,_,_,_,_)  
    | Kqw (id2,cid2,mid2,_,_,_,_,_,_,_,rt2,pUrvapaxa2,uwwarapaxa2,_,_,_,_)
      -> 
        if (id1 = id2) && (pUrvapaxa1="y") && (uwwarapaxa2="y") && (cid2 > cid1) then
          match rt1 with 
          [ "yuvan" | "yuvawi" 
            ->
              if (rt2 = "Kalawi" || rt2 = "paliwa" || rt2 = "valina" || rt2 = "jarawi" || rt2 = "jaran") then
                [ Relation (id1,cid1,mid1,"karmaXArayaH_2",id2,cid2,mid2,"200.21",0) ]
              else []
          | "eka" | "sarva" | "jaraw" | "purANa" | "nava" | "kevala" 
            -> [ Relation (id1,cid1,mid1,"wa_pu",id2,cid2,mid2,"200.22",0) ]
          | "pUrva" | "apara" | "praWama" | "carama" | "jaGanya" 
          | "samAna" | "maXya" | "maXyama" | "vIra"
            -> [ Relation (id1,cid1,mid1,"karmaXArayaH_1",id2,cid2,mid2,"200.23",0) ]
          | "saw" | "mahaw" | "parama" | "uwwama" | "uwkqRta"
            -> [ Relation (id1,cid1,mid1,"karmaXArayaH_1",id2,cid2,mid2,"200.24",0) ]
          | "kawara" | "kawama" -> [ Relation (id1,cid1,mid1,"karmaXArayaH_1",id2,cid2,mid2,"200.25",0) ]
          | "kim" -> [ Relation (id1,cid1,mid1,"karmaXArayaH_1",id2,cid2,mid2,"200.26",0) ]
          | "pApa" | "aNaka" 
            -> (* Check if rt2 is a kuwsiwa word *)
              [ Relation (id1,cid1,mid1,"karmaXArayaH_2",id2,cid2,mid2,"200.27",0); Relation (id1,cid1,mid1,"karmaXArayaH_3",id2,cid2,mid2,"200.28",0) ]
          | "kumAra" -> 
            match rt2 with 
            [ "SramaNA" | "pravrajiwA" | "kulatA" | "garBiNI" | "wApasI" 
            | "xAsI" | "banXakI" | "aXyApaka" | "aBirUpaka" | "paNdiwa" 
            | "patu" | "mqxu" | "kuSala" | "capala" | "nipuNa" 
              -> [ Relation (id1,cid1,mid1,"karmaXArayaH",id2,cid2,mid2,"200.29",0) ]
            | _ -> []
            ]
          | _ -> match rt2 with 
                 [ "vqnxAraka" | "nAga" | "kuFjara"
                   -> (* 2-1-62 *)
                   [ Relation (id1,cid1,mid1,"karmaXArayaH_2",id2,cid2,mid2,"200.30",0) ]
                 | "garBiNI" 
                   -> if member_of rt1 cawuRpAxa_jAwi_vAcI then 
                    (* Create a file with a list of cawuRpAxa_jAwi *)
                        [ Relation (id1,cid1,mid1,"karmaXArayaH_2",id2,cid2,mid2,"200.31",0) ]
                      else []
                 | "potA" | "yuvawi" | "swoka" | "kawipaya" | "gqRti" 
                 | "Xenu" | "vaSA" | "vehaw" | "baRkayaNI" | "pravakwq" 
                 | "Srowriya" | "aXyApaka" | "XUrwa"
                   -> if member_of rt1 jAwivAcaka then 
                        (* 2-1-65 *)
                        [ Relation (id1,cid1,mid1,"karmaXArayaH_2",id2,cid2,mid2,"200.32",0) ]
                      else []
                 | "mawallikA" | "macarcikA" | "uxXa" | "prakANda" | "wallaja" 
                   -> if member_of rt1 jAwivAcaka then 
                        (* 2-1-66 *)
                        [ Relation (id1,cid1,mid1,"karmaXArayaH_2",id2,cid2,mid2,"200.33",0) ]
                      else []
                 | "KasUci" | "kiwava" 
                   -> (* 2-1-53 *)
                      [ Relation (id1,cid1,mid1,"karmaXArayaH_2",id2,cid2,mid2,"200.34",0) ]
                 | _ -> 
                    if member_of rt1 varNa_vAcI && member_of rt2 varNa_vAcI then 
                      (* 2-1-69 *)
                      [ Relation (id1,cid1,mid1,"karmaXArayaH_3",id2,cid2,mid2,"200.35",0) ]
                    else if (member_of rt2 jAwivAcaka) = False && 
                      (rl_compound_kqwya_1 m1 || rt1 = "wulya" || rt1 = "saxqSa") then
                      (* 2-1-68 *)
                      [ Relation (id1,cid1,mid1,"karmaXArayaH",id2,cid2,mid2,"200.36",0) ]
                    else if member_of rt2 vyAGrAxi then 
                      (* 2-1-56 *)
                      [ Relation (id1,cid1,mid1,"karmaXArayaH_5",id2,cid2,mid2,"200.37",0) ]
                    else if (member_of rt2 guNavacana || member_of rt2 guNa_not_guNavacana) 
                            && member_of rt1 xravyavAcI then 
                      (* 2-1-55 *)
                      [ Relation (id1,cid1,mid1,"karmaXArayaH_4",id2,cid2,mid2,"200.38",0) ]
                    else if member_of rt2 jAwivAcaka && 
                      ((member_of rt1 guNavacana || member_of rt1 guNa_not_guNavacana) 
                      (* All guNas can be classified as either guNavacana, or non_guNavacana. 
                        Hence checking both the lists guNavacana and guNa_not_guNavacana *)
                        (*|| member_of rt1 saFjFA_vAcI *) (* NOTE: How to collect list of saFjFA_vAcI *)
                      (* if m1 is captured as kqw or wif, then it considered as kriyA *)  
                        || is_kriyA m1) then 
                      (* 2-1-57 *)
                      [ Relation (id1,cid1,mid1,"karmaXArayaH_1",id2,cid2,mid2,"200.39",0) ] 
                    else []
                 ]
          ]
        else []
    | _ -> []
    ]
  | _ -> []
  ]
;

value rl_compound_naF m1 m2 text_type = match m1 with
  [ Sup (id1,cid1,mid1,word1,_,pUrvapaxa1,_,_,_,_,_) -> 
    if pUrvapaxa1 = "y" && (word1 = "a-" || word1 = "an-") then
      match m2 with
      [ Sup (id2,cid2,mid2,_,_,_,uwwarapaxa2,_,_,_,_)
      | Kqw (id2,cid2,mid2,_,_,_,_,_,_,_,_,_,uwwarapaxa2,_,_,_,_)
      | WaxXiwa (id2,cid2,mid2,_,_,_,uwwarapaxa2,_,_,_,_,_) -> 
        if uwwarapaxa2 = "y" && (id1 = id2) && (cid2 > cid1) then
          (* 2-2-06 *)
          [ Relation (id1,cid1,mid1,"naF_wawpuruRaH",id2,cid2,mid2,"200.40",0) ] 
        else []
      | _ -> []
      ]
    else []
  | _ -> []
  ]
;

value rl_compound_xvigu m1 m2 text_type = match m1 with
  [ Sup (id1,cid1,mid1,word1,rt1,pUrvapaxa1,uwwarapaxa1,_,_,_,_)
  | WaxXiwa (id1,cid1,mid1,word1,rt1,pUrvapaxa1,uwwarapaxa1,_,_,_,_,_) -> 
    match m2 with 
    [ Sup (id2,cid2,mid2,_,rt2,pUrvapaxa2,uwwarapaxa2,lifga2,_,_,_)
    | Kqw (id2,cid2,mid2,_,_,_,_,_,_,_,rt2,pUrvapaxa2,uwwarapaxa2,lifga2,_,_,_)
    | WaxXiwa (id2,cid2,mid2,_,rt2,pUrvapaxa2,uwwarapaxa2,_,lifga2,_,_,_) -> 
      if (id1 = id2) && (pUrvapaxa1="y") && (uwwarapaxa2="y") && (cid2 > cid1) then
        if member_of rt1 waxXiwAnwa_safKyA_vAcI then
          (* 2-1-52 *)
          [ Relation (id1,cid1,mid1,"wa_pu_xvigu",id2,cid2,mid2,"200.41",0) ] 
        else if member_of rt1 safKyA_vAcI then 
          if lifga2 = "napuM" then
            (* 2-1-51 *)
            [ Relation (id1,cid1,mid1,"wa_pu_xvigu",id2,cid2,mid2,"200.42",0) ] 
          else if member_of (word1 ^ rt2) named_entity then
            (* 2-1-50 *)
            [ Relation (id1,cid1,mid1,"wa_pu_xvigu",id2,cid2,mid2,"200.43",0) ] 
          else []
        else []
      else []
    | _ -> []
    ]
  | _ -> []
  ]
;

value is_prAxi rt = 
  match rt with 
  [ "pra" | "parA" | "apa" | "sam" | "anu" 
  | "ava" | "nis" | "nir" | "xus" | "xur" 
  | "vi" | "Af" | "ni" | "aXi" | "api" 
  | "aBi" | "su" | "uw" | "awi" | "prawi" 
  | "pari" | "upa" -> True
  | _ -> False
  ]
;

value upapaxa_list rt = 
  match rt with 
  [ "xa" | "ja" | "kAra" | "jFa" 
  | "nibarhaNa" | "niRUxana" | "xarSana" | "xama" | "arxana" 
  | "sUxana" | "BOjI" -> True
  | _ -> False
  ]
;

value yAjakAxi rt = 
  match rt with 
  [ "yAjaka" | "pUjaka" | "paricAraka" | "pariRecaka" 
  | "snAwaka" | "aXyApaka" | "uwsAxaka" | "uxvarwaka" | "howq" 
  | "powq" | "Barwq" | "raWagaNaka" | "pawwigaNaka" -> True
  | _ -> False
  ]
;

value krIdA_jIvika rt = 
  match rt with 
  [ "leKaka" | "pracAyikA" | "BafjikA" -> True
  | _ -> False
  ]
;

value rl_compound_residual_T m1 m2 text_type = match m1 with
  [ Sup (id1,cid1,mid1,word1,rt1,pUrvapaxa1,uwwarapaxa1,_,_,_,_)
  | Kqw (id1,cid1,mid1,word1,_,_,_,_,_,_,rt1,pUrvapaxa1,uwwarapaxa1,_,_,_,_)
  | WaxXiwa (id1,cid1,mid1,word1,rt1,pUrvapaxa1,uwwarapaxa1,_,_,_,_,_) -> 
    match m2 with
    [ Sup (id2,cid2,mid2,_,rt2,pUrvapaxa2,uwwarapaxa2,lifgam2,_,_,_)
    | Kqw (id2,cid2,mid2,_,_,_,_,_,_,_,rt2,pUrvapaxa2,uwwarapaxa2,lifgam2,_,_,_)
      ->
        if (id1 = id2) && (pUrvapaxa1="y") && (uwwarapaxa2="y") && (cid2 > cid1) then
          if rt1 = "pUrva" || rt1 = "apara" || rt1 = "aXara" || rt1 = "uwwara" then
            (* 2-2-01 *)
            [ Relation (id1,cid1,mid1,"wawpuruRaH",id2,cid2,mid2,"200.44",0) ] 
          else if member_of rt1 xik_vAcI && member_of (word1 ^ rt2) named_entity then
            (* 2-1-50 *)
            [ Relation (id1,cid1,mid1,"wawpuruRaH",id2,cid2,mid2,"200.45",0) ] 
          else if member_of rt1 waxXiwAnwa_xik_vAcI then
            (* 2-1-51 *)
            [ Relation (id1,cid1,mid1,"wawpuruRaH",id2,cid2,mid2,"200.46",0) ] 
          else if member_of rt1 kAla_vAcI then
            (* 2-2-05 *)
            [ Relation (id1,cid1,mid1,"wawpuruRaH",id2,cid2,mid2,"200.47",0) ] 
          else if rt1 = "arXa" then 
            (* 2-2-02 *)
            [ Relation (id1,cid1,mid1,"praWamA_wawpuruRaH",id2,cid2,mid2,"200.48",0) ] 
          else if rt1 = "xviwIya" || rt1 = "wqwIya" || rt1 = "cawurWa" || rt1 = "wurya" || rt1 = "wurIya" then 
            (* 2-2-03 *)
            [ Relation (id1,cid1,mid1,"wawpuruRaH",id2,cid2,mid2,"200.49",0) ] 
          else if rt1 = "IRaw" && member_of rt2 guNavacana then 
            (* 2-2-07 *)
            [ Relation (id1,cid1,mid1,"wawpuruRaH",id2,cid2,mid2,"200.50",0) ] 
          else if rt1 = "ku" || is_prAxi rt1 then 
            (* 2-2-18 *)
            [ Relation (id1,cid1,mid1,"wawpuruRaH",id2,cid2,mid2,"200.51",0) ] 
          else if upapaxa_list rt2 then 
            (* 2-2-19 *)
            [ Relation (id1,cid1,mid1,"upapaxa_wawpuruRaH",id2,cid2,mid2,"200.52",0) ] 
          else if yAjakAxi rt2 then 
            (* 2-2-09 *)
            [ Relation (id1,cid1,mid1,"RaRTI_wawpuruRaH",id2,cid2,mid2,"200.53",0) ] 
          else if (rt2 = "xviwIya" || rt2 = "wqwIya" || rt2 = "cawurWa" || rt2 = "wurya" || rt2 = "wurIya")
            && lifgam2 = "napuM" then 
            (* 2-2-03 *)
            [ Relation (id1,cid1,mid1,"RaRTI_wawpuruRaH",id2,cid2,mid2,"200.54",0) ] 
          else if krIdA_jIvika rt2 then 
            (* 2-2-17 *)
            [ Relation (id1,cid1,mid1,"RaRTI_wawpuruRaH",id2,cid2,mid2,"200.55",0) ] 
          else []
        else []
    | _ -> []
    ]
  | _ -> []
  ]
;

value rl_compound_B m1 m2 text_type = match m1 with
  [ Sup (id1,cid1,mid1,word1,rt1,pUrvapaxa1,_,_,_,_,_)
  | Kqw (id1,cid1,mid1,word1,_,_,_,_,_,_,rt1,pUrvapaxa1,_,_,_,_,_)
  | WaxXiwa (id1,cid1,mid1,word1,rt1,pUrvapaxa1,_,_,_,_,_,_) 
    ->  match m2 with
    [ Sup (id2,cid2,mid2,_,rt2,pUrvapaxa2,uwwarapaxa2,lifgam2,_,_,_) ->
      if (id1 = id2) && (pUrvapaxa1="y") && (uwwarapaxa2="y") && (cid2 > cid1) then 
        if (rt1 = "Asanna" || rt1 = "axUra" || rt1 = "aXika" || member_of rt1 safKyA_vAcI) 
          && (member_of rt2 safKyA_vAcI) then
            (* 2-2-25 *)
          [ Relation (id1,cid1,mid1,"bahuvrIhiH",id2,cid2,mid2,"200.56",0) ] 
        else if member_of rt1 xik_vAcI && member_of rt2 xik_vAcI && lifgam2 = "swrI" then 
          (* 2-2-26 *)
          [ Relation (id1,cid1,mid1,"bahuvrIhiH",id2,cid2,mid2,"200.57",0) ] 
        else if word1 = "sa-" && not (lifgam2 = "napuM") then 
          (* 2-2-28 *)
          [ Relation (id1,cid1,mid1,"bahuvrIhiH",id2,cid2,mid2,"200.58",0) ] 
        else []
      else []
    | _ -> []
    ]
  | Avy (id1,cid1,mid1,word1,rt1,pUrvapaxa1,_,_) -> 
    match m2 with
    [ Sup (id2,cid2,mid2,_,rt2,pUrvapaxa2,uwwarapaxa2,_,_,_,_) ->
      if (id1 = id2) && (pUrvapaxa1="y") && (uwwarapaxa2="y") && (cid2 > cid1) then 
        if member_of rt2 safKyA_vAcI then
          (* 2-2-25 *)
          [ Relation (id1,cid1,mid1,"bahuvrIhiH",id2,cid2,mid2,"200.59",0) ] 
        else []
      else []
    | _ -> []
    ]
  | _ -> []
  ]
;

value rl_compound_A1 m1 m2 text_type = match m2 with
  [ Kqw (id2,cid2,mid2,_,_,_,_,_,_,_,_,pUrvapaxa2,uwwarapaxa2,lifgam2,viBakwiH2,_,_)
  | Sup (id2,cid2,mid2,_,_,pUrvapaxa2,uwwarapaxa2,lifgam2,viBakwiH2,_,_)
  | WaxXiwa (id2,cid2,mid2,_,_,pUrvapaxa2,uwwarapaxa2,_,lifgam2,viBakwiH2,_,_) -> 
     if (lifgam2 = "napuM") && (viBakwiH2 = 1) (* Add a good comment here - uwwarapaxa in an A1 will always be in the form similar to the one in praWamA viBakwi in napuMsaka lifga *)
     then
     match m1 with
     [ Sup (id1,cid1,mid1,word1,rt1,pUrvapaxa1,_,_,_,_,_) (* Needs to be deleted after pUrvapaxa morph analysis *)
     | Avy (id1,cid1,mid1,word1,rt1,pUrvapaxa1,_,_) -> 
	  if (id1 = id2) && (cid2 = cid1+1) && (pUrvapaxa1="y") && (uwwarapaxa2="y")
	  then 
	    match rt1 with 
	    [ "yaWA" (* yaWAZsAxqSye (2-1-7) *)
	    | "yAvaw" (* yAvaxavaXAraNe (2-1-8) *) (* Check *)
	    | "apa" | "pari" | "bahir" | "aFcu" | "prAk" (* apaparibahiraFcavaH paFcamyAH (2-1-12) *)
	    | "Af" (* Af maryAxAZBiviXyoH (2-1-13);Af:maryAxArWe *)
	    | "aBi" (* lakRaNenAZBiprawI ABimuKye (2-1-14);maryAxArWe *) 
	    | "prawi" (* lakRaNenAZBiprawI ABimuKye (2-1-14);maryAxArWe *)
	    | "anu" (* anuryawsamayA (2-1-15);anu:sAmIpyArWe/yasya cAyAmaH (2-1-16);anu:AyAmArWe *)
	    | "aXi" | "awi" | "xur" | "xus" | "su" | "nir" | "sa" | "upa" | "waw" | "iwi" (* avyayaM viBakwi.. (2-1-6) *)
	      -> [ Relation (id2,cid2,mid2,"avyayIBAvaH_1",id1,cid1,mid1,"300.1",0) ]
	    | _ -> []
	    ]
	  else []
     | _ -> []
     ]
     else []
   | _ -> []
 ]
;

value rl_compound_A2 m1 m2 text_type = match m1 with
  [ Avy (id1,cid1,mid1,word1,rt1,_,_,_) -> 
     match m2 with
     [ Sup (id2,cid2,mid2,_,rt2,pUrvapaxa2,uwwarapaxa2,lifgam2,viBakwiH2,_,_)
       -> 
	  if (id1 = id2) && (cid1 = cid2+1) && (pUrvapaxa2="y")
	  then 
	    match rt1 with 
	    [ "prawi" (* supprawinA mAwrArWe (2-1-9);prawi: mAwrArWe *)
	      -> [ Relation (id2,cid2,mid2,"avyayIBavaH_2",id1,cid1,mid1,"300.2",0) ]
	    | "pari" (* akRaSalAkAsaMKyAH pariNA (2-1-10) *)
	      -> if rt2 = "akRa" || rt2 = "SalAkA" || member_of rt2 safKyA_vAcI
	         then 
	           [ Relation (id2,cid2,mid2,"avyayIBavaH_2",id1,cid1,mid1,"300.3",0) ]
	         else []
	    | _ -> []
	    ]
	  else []
     | _ -> []
     ]
   | _ -> []
 ]
;

value rl_compound_A6 m1 m2 text_type = match m1 with
  [ Sup (id1,cid1,mid1,word1,rt1,pUrvapaxa1,_,_,_,_,_) -> 
     if member_of rt1 safKyA_vAcI then
     match m2 with
     [ Sup (id2,cid2,mid2,_,rt2,_,_,_,_,_,_)
     | Avy (id2,cid2,mid2,_,rt2,_,_,_) 
       -> 
	  if (id1 = id2) && (cid2 = cid1+1) && (pUrvapaxa1="y")
	  then 
	    match rt1 with 
	    [ "muni" | "BaraxvAja" | "BAraxvAja" | "qRi" (* saMKyA vaMSyena (2-1-19) *)
	      -> [ Relation (id2,cid2,mid2,"avyayIBAvaH_6",id1,cid1,mid1,"300.4",0) ]
	    | _ -> []
	    ]
	  else []
     | _ -> []
     ]
     else []
   | _ -> []
 ]
;

value rl_compound_A7 m1 m2 text_type = match m1 with
  [ Sup (id1,cid1,mid1,word1,rt1,pUrvapaxa1,_,_,_,_,_)
  | Avy (id1,cid1,mid1,word1,rt1,pUrvapaxa1,_,_) -> 
     match m2 with
     [ Sup (id2,cid2,mid2,_,rt2,_,_,_,_,_,_)
     | Avy (id2,cid2,mid2,_,rt2,_,_,_) 
       -> 
	  if (id1 = id2) && (cid2 = cid1+1) && (pUrvapaxa1="y")
	  then 
	    match rt1 with 
	    [ "pAre" | "maXye" (* pAre maXye RaRTyA vA (2-1-18) *)
	      -> [ Relation (id2,cid2,mid2,"avyayIBAvaH_7",id1,cid1,mid1,"300.5",0) ]
	    | _ -> []
	    ]
	  else []
     | _ -> []
     ]
   | _ -> []
 ]
;

value rl_compound_A3 m1 m2 text_type = match m1 with
  [ Sup (id1,cid1,mid1,word1,rt1,pUrvapaxa1,uwwarapaxa1,_,_,_,_)
  | Kqw (id1,cid1,mid1,word1,_,_,_,_,_,_,rt1,pUrvapaxa1,uwwarapaxa1,_,_,_,_)
  | WaxXiwa (id1,cid1,mid1,word1,rt1,pUrvapaxa1,uwwarapaxa1,_,_,_,_,_)
  | Avy (id1,cid1,mid1,word1,rt1,pUrvapaxa1,uwwarapaxa1,_)
  | Wif (id1,cid1,mid1,word1,rt1,pUrvapaxa1,uwwarapaxa1,_,_,_,_,_,_,_,_,_) 
  | Avykqw (id1,cid1,mid1,word1,rt1,pUrvapaxa1,uwwarapaxa1,_,_,_,_,_)
  | AvywaxXiwa (id1,cid1,mid1,word1,rt1,pUrvapaxa1,uwwarapaxa1,_,_)
    -> match m2 with 
       [ Sup (id2,cid2,mid2,word2,rt2,pUrvapaxa2,uwwarapaxa2,_,_,_,_)
       | Kqw (id2,cid2,mid2,word2,_,_,_,_,_,_,rt2,pUrvapaxa2,uwwarapaxa2,_,_,_,_)
       | WaxXiwa (id2,cid2,mid2,word2,rt2,pUrvapaxa2,uwwarapaxa2,_,_,_,_,_)
       | Avy (id2,cid2,mid2,word2,rt2,pUrvapaxa2,uwwarapaxa2,_)
       | Wif (id2,cid2,mid2,word2,rt2,pUrvapaxa2,uwwarapaxa2,_,_,_,_,_,_,_,_,_) 
       | Avykqw (id2,cid2,mid2,word2,rt2,pUrvapaxa2,uwwarapaxa2,_,_,_,_,_)
       | AvywaxXiwa (id2,cid2,mid2,word2,rt2,pUrvapaxa2,uwwarapaxa2,_,_)
       -> 
	  if (id1 = id2) && (cid2 = cid1+1) && (pUrvapaxa1="y")
	    then 
	      let cpd_type = get_assoc (word1 ^ "_" ^ rt2) wiRTaxgu_list in 
	      if cpd_type = "" then []
	      else [ Relation (id2,cid2,mid2,cpd_type,id1,cid1,mid1,"200.83",0) ]
	  else []
(*     | _ -> []*)
     ] 
(*   | _ -> []*)
 ]
;

value rl_avyayIBAva_kriyAviSeRaNa m1 m2 text_type = match m2 with
  [ Kqw (id2,cid2,mid2,_,_,_,_,_,_,_,_,_,_,_,_,_,_)
  | Wif (id2,cid2,mid2,_,_,_,_,_,_,_,_,_,_,_,_,_) 
  | Avykqw (id2,cid2,mid2,_,_,_,_,_,_,_,_,_) -> 
     match m1 with
     [ Sup (id1,cid1,mid1,word1,rt1,pUrvapaxa1,uwwarapaxa1,_,_,_,_)
     | Avy (id1,cid1,mid1,word1,rt1,pUrvapaxa1,uwwarapaxa1,_) -> 
     do {
	  if (pUrvapaxa1="y")
	  then 
	    match rt1 with 
	    [ "yaWA" (* yaWAZsAxqSye (2-1-7) *)
	    | "yAvaw" (* yAvaxavaXAraNe (2-1-8) *) (* Check *)
	    | "apa" | "pari" | "bahir" | "aFcu" | "prAk" (* apaparibahiraFcavaH paFcamyAH (2-1-12) *)
	    | "Af" (* Af maryAxAZBiviXyoH (2-1-13);Af:maryAxArWe *)
	    | "aBi" (* lakRaNenAZBiprawI ABimuKye (2-1-14);maryAxArWe *) 
	    | "prawi" (* lakRaNenAZBiprawI ABimuKye (2-1-14);maryAxArWe *)
	    | "anu" (* anuryawsamayA (2-1-15);anu:sAmIpyArWe/yasya cAyAmaH (2-1-16);anu:AyAmArWe *)
	    | "aXi" | "awi" | "xur" | "xus" | "su" | "nir" | "sa" | "upa" | "waw" | "iwi" (* avyayaM viBakwi.. (2-1-6) *)
	      -> [ Relation (id1,cid1,mid1,"kriyAviSeRaNam",id2,cid2,mid2,"300.100",0) ]
	    | _ -> []
	    ]
	  else []
	}
     | _ -> []
     ]
   | _ -> []
 ]
;

value rl_avyayIBAva_rel m1 m2 m3 text_type = match m3 with
  [ Kqw (id3,cid3,mid3,_,_,_,_,_,_,_,_,_,_,_,_,_,_)
  | Wif (id3,cid3,mid3,_,_,_,_,_,_,_,_,_,_,_,_,_) 
  | Avykqw (id3,cid3,mid3,_,_,_,_,_,_,_,_,_) -> 
     match m1 with
     [ Sup (id1,cid1,mid1,word1,rt1,pUrvapaxa1,_,_,_,_,_)
     | Avy (id1,cid1,mid1,word1,rt1,pUrvapaxa1,_,_) 
       -> 
	  match m2 with 
	  [ Sup (id2,cid2,mid2,word2,rt2,_,uwwarapaxa2,_,viBakwiH2,_,_)
	    -> if (id1 = id2) && (cid2 = cid1 + 1) && (pUrvapaxa1="y") && (uwwarapaxa2="y")
	       then
	         match rt1 with 
	         [ "pAre" | "maXye"
	           -> match viBakwiH2 with 
	              [ 1 -> [ Relation (id1,cid1,mid1,"aXikaraNam",id3,cid3,mid3,"300.99",0) ]
	              | 2 -> [ Relation (id1,cid1,mid1,"karma",id3,cid3,mid3,"300.98",0) ]
	              | 5 -> [ Relation (id1,cid1,mid1,"apAxAnam",id3,cid3,mid3,"300.97",0) ]
	              | _ -> []
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

value rl_avyayIBAva_karwA m1 m2 text_type = match m2 with
  [ Kqw (id2,cid2,mid2,_,_,_,_,_,_,_,_,_,_,_,_,_,_)
  | Wif (id2,cid2,mid2,_,_,_,_,_,_,_,_,_,_,_,_,_) 
  | Avykqw (id2,cid2,mid2,_,_,_,_,_,_,_,_,_) -> 
     match m1 with
     [ Sup (id1,cid1,mid1,word1,rt1,pUrvapaxa1,uwwarapaxa1,_,_,_,_)
     | Avy (id1,cid1,mid1,word1,rt1,pUrvapaxa1,uwwarapaxa1,_) -> 
     if uwwarapaxa1="y"
       then if rt1 = "pari" || rt1 = "prawi"
              then [ Relation (id1,cid1,mid1,"karwA",id2,cid2,mid2,"300.5",0) ]
	    else []
     else []
     | _ -> []
     ]
   | _ -> []
 ]
;

value exceptional_cpds m1 m2 =
  match m1 with 
  [ Sup (id1,cid1,mid1,word1,rt1,pUrvapaxa1,uwwarapaxa1,_,_,_,_)
  | Kqw (id1,cid1,mid1,word1,_,_,_,_,_,_,rt1,pUrvapaxa1,uwwarapaxa1,_,_,_,_)
  | WaxXiwa (id1,cid1,mid1,word1,rt1,pUrvapaxa1,uwwarapaxa1,_,_,_,_,_)
  | Avy (id1,cid1,mid1,word1,rt1,pUrvapaxa1,uwwarapaxa1,_)
  | Wif (id1,cid1,mid1,word1,rt1,pUrvapaxa1,uwwarapaxa1,_,_,_,_,_,_,_,_,_) 
  | Avykqw (id1,cid1,mid1,word1,rt1,pUrvapaxa1,uwwarapaxa1,_,_,_,_,_)
  | AvywaxXiwa (id1,cid1,mid1,word1,rt1,pUrvapaxa1,uwwarapaxa1,_,_)
    -> match m2 with 
       [ Sup (id2,cid2,mid2,word2,rt2,pUrvapaxa2,uwwarapaxa2,_,_,_,_)
       | Kqw (id2,cid2,mid2,word2,_,_,_,_,_,_,rt2,pUrvapaxa2,uwwarapaxa2,_,_,_,_)
       | WaxXiwa (id2,cid2,mid2,word2,rt2,pUrvapaxa2,uwwarapaxa2,_,_,_,_,_)
       | Avy (id2,cid2,mid2,word2,rt2,pUrvapaxa2,uwwarapaxa2,_)
       | Wif (id2,cid2,mid2,word2,rt2,pUrvapaxa2,uwwarapaxa2,_,_,_,_,_,_,_,_,_) 
       | Avykqw (id2,cid2,mid2,word2,rt2,pUrvapaxa2,uwwarapaxa2,_,_,_,_,_)
       | AvywaxXiwa (id2,cid2,mid2,word2,rt2,pUrvapaxa2,uwwarapaxa2,_,_)
        -> if (id1 = id2) && (pUrvapaxa1="y") && (uwwarapaxa2="y") && (cid2 > cid1) then
             let cpd_type_aluk = get_assoc (word1 ^ "_" ^ rt2) exceptional_aluk_cpd_list in 
               if cpd_type_aluk = "" then
                let cpd_type_luk = get_assoc (rt1 ^ "_" ^ rt2) exceptional_luk_cpd_list in 
                  if cpd_type_luk = "" then 
                    let cpd_type_m_aluk = get_assoc (word1 ^ "_" ^ rt2) mayUra_vyaMsaka_aluk_list in 
                      if cpd_type_m_aluk = "" then 
                        let cpd_type_m_luk = get_assoc (rt1 ^ "_" ^ rt2) mayUra_vyaMsaka_luk_list in 
                          if cpd_type_m_luk = "" then []
                          else [ Relation (id1,cid1,mid1,cpd_type_m_luk,id2,cid2,mid2,"200.60",0) ]
                      else [ Relation (id1,cid1,mid1,cpd_type_m_aluk,id2,cid2,mid2,"200.61",0) ]
                  else [ Relation (id1,cid1,mid1,cpd_type_luk,id2,cid2,mid2,"200.62",0) ]
              else [ Relation (id1,cid1,mid1,cpd_type_aluk,id2,cid2,mid2,"200.63",0) ]
           else []
       (* | _ -> [] *)
       ]
  (* | _ -> [] *)
  ]
;

value rl_wa_pu_6 m1 m2 = 
  match m1 with
  [ Sup (id1,cid1,mid1,word1,_,pUrvapaxa1,uwwarapaxa1,_,_,_,_)
  | Kqw (id1,cid1,mid1,word1,_,_,_,_,_,_,_,pUrvapaxa1,uwwarapaxa1,_,_,_,_)
  | WaxXiwa (id1,cid1,mid1,word1,_,pUrvapaxa1,uwwarapaxa1,_,_,_,_,_)
    -> match m2 with 
       [ Sup (id2,cid2,mid2,word2,rt2,pUrvapaxa2,uwwarapaxa2,_,_,_,_)
       | Kqw (id2,cid2,mid2,word2,_,_,_,_,_,_,rt2,pUrvapaxa2,uwwarapaxa2,_,_,_,_)
       | WaxXiwa (id2,cid2,mid2,word2,rt2,pUrvapaxa2,uwwarapaxa2,_,_,_,_,_)
         -> if (id1 = id2) && (pUrvapaxa1="y") && (uwwarapaxa2="y") && (cid2 > cid1) then
              [ Relation (id1,cid1,mid1,"RaRTI_wawpuruRaH",id2,cid2,mid2,"200.64",0) ]
            else []
       | _ -> []
       ]
  | _ -> []
  ]
;

value print_rel = fun 
  [ Relation (i1 , i2 , i3 , i4 , i5 , i6, i7, i8, i9) -> 
      print_string ("\nRelation " ^ i4 ^ " from " ^ (string_of_int i1) ^ "." ^ (string_of_int i2) ^ "." ^ (string_of_int i3) ^ " to " ^ (string_of_int i5) ^ "." ^ (string_of_int i6) ^ "." ^ (string_of_int i7) ^ " with rule ID " ^ i8 ^ " and distance " ^ (string_of_int i9))
  ]
;

value remove_leading_hyphen s =
  if String.length s > 0 && s.[0] == '-' then
    String.sub s 1 (String.length s - 1)
  else
    s
;

value rl_compound_kwa_3 m1 m2 m3 = 
(*  let _ = print_string "\n\nrl_compound_kwa_3" in*)
  match m1 with
  [ Kqw (id1,cid1,mid1,word1,_,_,_,_,_,_,rt1,pUrvapaxa1,uwwarapaxa1,_,_,_,_) -> 
(*    let _ = print_string ("\nm1 matched " ^ word1 ^ "; " ^ (string_of_int id1) ^ "; " ^ (string_of_int id1) ^ "; " ^ (string_of_int cid1) ^ "; " ^ (string_of_int mid1)) in *)
    match m3 with 
    [ Kqw (id3,cid3,mid3,word3,_,_,_,_,_,_,rt3,pUrvapaxa3,uwwarapaxa3,_,_,_,_) -> 
(*      let _ = print_string ("\nm3 matched " ^ word3 ^ "; " ^ (string_of_int id3) ^ "; " ^ (string_of_int id3) ^ "; " ^ (string_of_int cid3) ^ "; " ^ (string_of_int mid3)) in *)
      match m2 with 
      [ Sup (id2,cid2,mid2,word2,rt2,pUrvapaxa2,uwwarapaxa2,_,_,_,_)
      | Kqw (id2,cid2,mid2,word2,_,_,_,_,_,_,rt2,pUrvapaxa2,uwwarapaxa2,_,_,_,_)
      | WaxXiwa (id2,cid2,mid2,word2,rt2,pUrvapaxa2,uwwarapaxa2,_,_,_,_,_) -> 
(*        let _ = print_string ("\nm2 matched " ^ word2 ^ "; " ^ (string_of_int id2) ^ "; " ^ (string_of_int id2) ^ "; " ^ (string_of_int cid2) ^ "; " ^ (string_of_int mid2)) in *)
        if (id1 = id2) && (id1 = id3) && (cid1 < cid2) && (cid2 < cid3) then 
          let stripped_rt2 = remove_leading_hyphen rt2 in 
(*          let _ = print_string ("\nd12 = " ^ (string_of_int d12) ^ "; d13 = " ^ (string_of_int d13) ^ "; d23 = " ^ (string_of_int d23)) in *)
          if (word2 = "-a-") || (word2 = "-an-") then 
            (* 2-1-60 kwena naFviSiRtenAnaF *)
            [ Relation (id2,cid2,mid2,"naF_wawpuruRaH",id3,cid3,mid3,"200.66",0); Relation (id1,cid1,mid1,"karmaXArayaH_2",id3,cid3,mid3,"200.67",0) ]
          else if is_prAxi stripped_rt2 then 
            [ Relation (id2,cid2,mid2,"wawpuruRaH",id3,cid3,mid3,"200.68",0); Relation (id1,cid1,mid1,"karmaXArayaH_2",id3,cid3,mid3,"200.69",0) ]
          else []
        else []
      | _ -> []
      ]
    | _ -> []
    ]
  | _ -> []
  ]
;

value rl_compound_others_3 m1 m2 m3 = 
(*  let _ = print_string "\n\nrl_compound_others_3" in*)
  match m1 with
  [ Sup (id1,cid1,mid1,word1,rt1,pUrvapaxa1,uwwarapaxa1,_,_,_,_)
  | Kqw (id1,cid1,mid1,word1,_,_,_,_,_,_,rt1,pUrvapaxa1,uwwarapaxa1,_,_,_,_) 
  | WaxXiwa (id1,cid1,mid1,word1,rt1,pUrvapaxa1,uwwarapaxa1,_,_,_,_,_) -> 
(*    let _ = print_string ("\nm1 matched " ^ word1 ^ "; " ^ (string_of_int id1) ^ "; " ^ (string_of_int id1) ^ "; " ^ (string_of_int cid1) ^ "; " ^ (string_of_int mid1)) in *)
    match m3 with 
    [ Sup (id3,cid3,mid3,word3,rt3,pUrvapaxa3,uwwarapaxa3,_,_,_,_)
    | Kqw (id3,cid3,mid3,word3,_,_,_,_,_,_,rt3,pUrvapaxa3,uwwarapaxa3,_,_,_,_)
    | WaxXiwa (id3,cid3,mid3,word3,rt3,pUrvapaxa3,uwwarapaxa3,_,_,_,_,_) -> 
(*      let _ = print_string ("\nm3 matched " ^ word3 ^ "; " ^ (string_of_int id3) ^ "; " ^ (string_of_int id3) ^ "; " ^ (string_of_int cid3) ^ "; " ^ (string_of_int mid3)) in *)
      match m2 with 
      [ Sup (id2,cid2,mid2,word2,rt2,pUrvapaxa2,uwwarapaxa2,_,_,_,_)
      | Kqw (id2,cid2,mid2,word2,_,_,_,_,_,_,rt2,pUrvapaxa2,uwwarapaxa2,_,_,_,_)
      | WaxXiwa (id2,cid2,mid2,word2,rt2,pUrvapaxa2,uwwarapaxa2,_,_,_,_,_) -> 
        if (id1 = id2) && (id1 = id3) && (cid1 < cid2) && (cid2 < cid3) then 
          (* let _ = print_string ("\nm2 matched " ^ word2 ^ "; " ^ (string_of_int id2) ^ "; " ^ (string_of_int cid2) ^ "; " ^ (string_of_int mid2)) in *)
          let stripped_rt2 = remove_leading_hyphen rt2 in 
          if member_of rt1 safKyA_vAcI then 
            [ Relation (id1,cid1,mid1,"wa_pu_xvigu",id2,cid2,mid2,"200.70",0); Relation (id2,cid2,mid2,"ba_vrI",id3,cid3,mid3,"200.71",0) ]
          else if member_of rt1 xik_vAcI then 
            [ Relation (id1,cid1,mid1,"wa_pu",id2,cid2,mid2,"200.72",0); Relation (id2,cid2,mid2,"ba_vrI",id3,cid3,mid3,"200.73",0) ]
          else if (word2 = "-a-") || (word2 = "-an-") then 
            (* 2-1-60 kwena naFviSiRtenAnaF *)
            [ Relation (id2,cid2,mid2,"naF_wa_pu",id3,cid3,mid3,"200.66",0); Relation (id1,cid1,mid1,"karmaXArayaH_2",id3,cid3,mid3,"200.67",0); ]
          else if is_prAxi stripped_rt2 then 
            [ Relation (id2,cid2,mid2,"wa_pu",id3,cid3,mid3,"200.68",0); Relation (id1,cid1,mid1,"karmaXArayaH_2",id3,cid3,mid3,"200.69",0) ]
          (* NOTE: Add condition for list of avayavavAcI words in word1, ahorAwra in word2, kwAnwa word in word3*)
          else []
        else []
      | _ -> []
      ]
    | _ -> []
    ]
  | _ -> []
  ]
;

value other_cpd_rules = [ rl_compound_A1; rl_compound_A2; rl_compound_A6; rl_compound_A7; rl_compound_A3; rl_compound_kwa; rl_compound_viBakwi_wa_pu; rl_compound_K; rl_compound_xvigu; rl_compound_residual_T; rl_compound_B; ]
;

value rl_handle_compound m1 m2 text_type = 
  match m1 with
  [ 
    Sup (id1,cid1,mid1,word1,_,pUrvapaxa1,uwwarapaxa1,_,_,_,_)
  | Kqw (id1,cid1,mid1,word1,_,_,_,_,_,_,_,pUrvapaxa1,uwwarapaxa1,_,_,_,_)
  | WaxXiwa (id1,cid1,mid1,word1,_,pUrvapaxa1,uwwarapaxa1,_,_,_,_,_)
  | Avy (id1,cid1,mid1,word1,_,pUrvapaxa1,uwwarapaxa1,_)
  | Wif (id1,cid1,mid1,word1,_,pUrvapaxa1,uwwarapaxa1,_,_,_,_,_,_,_,_,_) 
  | Avykqw (id1,cid1,mid1,word1,_,pUrvapaxa1,uwwarapaxa1,_,_,_,_,_)
  | AvywaxXiwa (id1,cid1,mid1,word1,_,pUrvapaxa1,uwwarapaxa1,_,_) ->
    match m2 with
    [ Sup (id2,cid2,mid2,word2,rt2,pUrvapaxa2,uwwarapaxa2,_,_,_,_)
    | Kqw (id2,cid2,mid2,word2,rt2,_,_,_,_,_,_,pUrvapaxa2,uwwarapaxa2,_,_,_,_)
    | WaxXiwa (id2,cid2,mid2,word2,rt2,pUrvapaxa2,uwwarapaxa2,_,_,_,_,_)
    | Avy (id2,cid2,mid2,word2,rt2,pUrvapaxa2,uwwarapaxa2,_)
    | Wif (id2,cid2,mid2,word2,rt2,pUrvapaxa2,uwwarapaxa2,_,_,_,_,_,_,_,_,_) 
    | Avykqw (id2,cid2,mid2,word2,rt2,pUrvapaxa2,uwwarapaxa2,_,_,_,_,_)
    | AvywaxXiwa (id2,cid2,mid2,word2,rt2,pUrvapaxa2,uwwarapaxa2,_,_) 
      -> if pUrvapaxa1 = "n" then []
         else if (word1 = "a-") || (word1 = "an-") then
         rl_compound_naF m1 m2 text_type
         else if (rt2 = "sva") then []
         else let rel = exceptional_cpds m1 m2 in 
          if rel = [] then 
            List.fold_left collate [] other_cpd_rules where
            collate rls rule = match rule m1 m2 text_type with
            [ [] -> if rls = [] then 
                      rl_wa_pu_6 m1 m2
                    else rls 
            | r -> List.append r rls
            ]
          else rel
     ]
  ]
;


value pUrvapaxa_rules = [ rl_avyayIBAva_kriyAviSeRaNa ]
;

value all_compound_3_rules = [ rl_compound_others_3 ]
;

value pUrvapaxa_rules_3 = [ rl_avyayIBAva_rel ]
;

value compound_rules = [ rl_handle_compound(*;  rl_compound_kwa; rl_compound_viBakwi_wa_pu; rl_compound_K; rl_compound_A1; rl_compound_A2; rl_compound_A6; rl_compound_A7; rl_compound_naF*) ]
;

value compound_engine morphs text_type =
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
          [ [] -> if compound_pUrvapaxa_uwwarapaxa m1 m2  then
                    List.fold_left collate acc2 compound_rules where
                    collate rls rule = match rule m1 m2 text_type with
                    [ [] -> List2.union rls acc3
                    | r -> List.append r rls
                    ]
                  (* else if distinct_2_pUrvapaxa m1 m2 then
                    List.fold_left collate acc2 pUrvapaxa_rules where
                    collate rls rule = match rule m1 m2 text_type with
                    [ [] -> List2.union rls acc3
                    | r -> List.append r rls
                    ] *)
                  else acc3
          | [m3 :: r3 ] -> 
                  if compound_pUrvapaxa_uwwarapaxa_3 m1 m2 m3 then
                    let relations_m1_m2_m3 = 
                    List.fold_left collate acc3 all_compound_3_rules where
                    collate rls rule = match rule m1 m2 m3 with
                    [ [] -> rls
                    | r -> List2.union r rls
                    ] in loop3 (List2.union relations_m1_m2_m3 acc3) r3
                  else loop3 acc3 r3
                 (* in let _ = print_string ("\nNumber of relations_m1_m2_m3: " ^ (string_of_int (List.length relations_m1_m2_m3))) 
                 in let _ = print_string ("\nNumber of acc3: " ^ (string_of_int (List.length acc3)))  *)
               ] in 
               (* let _ = print_string ("\n\nNumber of relations_m1_m2: " ^ (string_of_int (List.length relations_m1_m2))) in
               let _ = print_string ("\n\nNumber of acc2: " ^ (string_of_int (List.length acc2))) in *)
               loop2 (List2.union relations_m1_m2 acc2) r2
       ] in 
       (* let _ = print_string ("\n\nNumber of relations_m1: " ^ (string_of_int (List.length relations_m1))) in
       let _ = print_string ("\n\nNumber of acc1: " ^ (string_of_int (List.length acc1))) in *)
       loop1 (List2.union relations_m1 acc1) r1
  ] 
;
