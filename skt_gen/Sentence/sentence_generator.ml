(* Copyright: Amba Kulkarni (2018-2023) *)

open Paths;
open Scanf;
open Noun_puM;
open Noun_napuM;
open Noun_swrI;
open Aaxikarma_dhaatu;
open Akarmaka_dhaatu;
open ApAxAna_dhaatu;
open BuxXyarWa_dhaatu;
open GawyarWa_dhaatu;
open KaraNa_dhaatu;
open PrawyavasAnArWa_dhaatu;
open Sakarmaka_dhaatu;
open SampraxAna_dhaatu;
open Sabxakarma_dhaatu;
open Shakaadi;
open Shlish_aadi;
open VAkyakarma_dhaatu;
open Xvikarmaka1_dhaatu;
open Xvikarmaka2_dhaatu;

open Pada_structure; (* corresponds to clips_head.txt *)

open Bank_lexer; 
module Gram = Camlp4.PreCast.MakeGram Bank_lexer 
;
open Bank_lexer.Token;

exception Report of string
;

value scl_morph_path = sclinstalldir^"/morph_bin/"
;

value ltproc = ltprocbin ^ " -cg "
;

value parses = Gram.Entry.mk "parses"
;

value datapath = sclinstalldir^"/skt_gen/Sentence/data/";

(* Grammar of parsed_analyses coming from sentence *)

EXTEND Gram
  GLOBAL: parses;
  parses:
    [ [ l = parse_rec; `EOI -> l
      | l = parse_rec -> failwith "Wrong parse data"
    ] ] ;
  parse_rec:
    [ [ -> []
      | l = parse_rec; t = parse ->  (* left (terminal) recursion essential *)
    l @ [ t ]
    ] ] ;
  parse:
    [ [ s = sup -> Sup s 
      | sv = sup_viSeRaNa -> Sup_viSeRaNa sv 
      | w = wif -> Wif w 
      | k = kqw -> Kqw k
      | kv = kqw_vis -> Kqw_viSeRaNa kv
      | a = avy -> Avy a
      | ak = avykqw -> Avykqw ak
      | w = waxXiwa -> WaxXiwa w
    ] ] ;

  sup:
    [ [ "(sup"; "(id"; i = INT; ")"; 
        "(rt"; r = IDENT; ")"; 
        "(cat"; c = IDENT; ")"; 
        "(gen"; ling = IDENT; ")"; 
        "(num"; vac = IDENT; ")"; 
        "(rel"; rel = IDENT; ")"; 
        "(to_indx"; toid = INT; ")";
    ")" -> 
    (int_of_string i,r,c,ling,vac,rel,int_of_string toid)
    ] ] ;

  sup_viSeRaNa:
    [ [ "(sup_viSeRaNa"; "(id"; i = INT; ")"; 
        "(rt"; r = IDENT; ")"; 
        "(rel"; rel = IDENT; ")"; 
        "(to_indx"; toid = INT; ")";
    ")" -> 
    (int_of_string i,r,rel,int_of_string toid)
    ] ] ;

  wif:
    [ [ "(wif"; "(id"; i = INT; ")"; 
        "(upasarga"; upa = IDENT; ")"; 
        "(rt"; r = IDENT; ")"; 
        "(san_suff"; san = IDENT; ")"; 
        "(prayoga"; voice = IDENT; ")"; 
        "(lakAra"; la = IDENT; ")"; 
        "(rel"; rel = IDENT; ")"; 
        "(to_indx"; toid = INT; ")"; 
    ")" -> 
    (int_of_string i,upa,r,san,voice,la,rel, int_of_string toid)
    ] ] ;

  kqw:
    [ [ "(kqw"; "(id"; i = INT; ")"; 
        "(upasarga"; upa = IDENT; ")"; 
        "(rt"; rt = IDENT; ")"; 
        "(san_suff"; san = IDENT; ")"; 
        "(kqw_suff"; kp = IDENT; ")"; 
        "(gen"; ling = IDENT; ")"; 
        "(num"; vac = IDENT; ")"; 
        "(rel"; rel = IDENT; ")"; 
        "(to_indx"; toid = INT; ")";
    ")" -> 
    (int_of_string i,upa,rt,san,kp,ling,vac,rel,int_of_string toid)
    ] ] ;

  kqw_vis:
    [ [ "(kqw_viSeRaNa"; "(id"; i = INT; ")"; 
        "(upasarga"; upa = IDENT; ")"; 
        "(rt"; rt = IDENT; ")"; 
        "(san_suff"; san = IDENT; ")"; 
        "(kqw_suff"; kp = IDENT; ")"; 
        "(rel"; rel = IDENT; ")"; 
        "(to_indx"; toid = INT; ")";
    ")" -> 
    (int_of_string i,upa,rt,san,kp,rel,int_of_string toid)
    ] ] ;

  avy:
    [ [ "(avy"; "(id"; i = INT; ")"; 
        "(rt"; r = IDENT; ")"; 
        "(rel"; rel = IDENT; ")"; 
        "(to_indx"; toid = INT; ")";")" -> 
    (int_of_string i,r,rel,int_of_string toid)
    ] ] ;

  avykqw:
    [ [ "(avykqw"; "(id"; i = INT; ")"; 
           "(upasarga"; upa = IDENT; ")";
           "(rt"; r = IDENT; ")"; 
           "(san_suff"; san = IDENT; ")";
           "(kqw_suff"; kqw = IDENT; ")"; 
           "(rel"; rel = IDENT; ")"; 
           "(to_indx"; toid = INT; ")";
     ")" -> 
    (int_of_string i,upa,r,san,kqw,rel,int_of_string toid)
    ] ] ;

  waxXiwa:
    [ [ "(waxXiwa"; "(id"; i = INT; ")"; 
            "(rt"; r = IDENT; ")"; 
            "(waxXiwa_suff"; taddhita = IDENT; ")"; 
            "(gen"; ling = IDENT; ")"; 
            "(num"; vac = IDENT; ")"; 
            "(rel"; rel = IDENT; ")";
            "(to_indx"; toid = INT; ")";
    ")" -> 
    (int_of_string i,r,taddhita,ling,vac,rel,int_of_string toid)
    ] ] ;
END
;

value analyse strm = let parses = 
  try Gram.parse parses Loc.ghost strm with
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
       ]  in parses
;

value print_parse_id  = fun
[ Sup (id,rt,cat,gen,num,rel,toid) -> print_string "Sup"
| _ -> ()
]
;


value strip_last_char str =
 if str = "" then "" else
 String.sub str 0 ((String.length str) -1)
;

value check_exit_status = fun
  [ Unix.WEXITED 0 -> ()
  | Unix.WEXITED r -> Printf.eprintf "warning: the process terminated with exit code (%d)\n%!" r
  | Unix.WSIGNALED n -> Printf.eprintf "warning: the process was killed by a signal (number: %d)\n%!" n
  | Unix.WSTOPPED n -> Printf.eprintf "warning: the process was stopped by a signal (number: %d)\n%!" n
  ]
;
 
value syscall ?(env=[| |]) cmd =
  let (ic,oc,ec) = Unix.open_process_full cmd env in
  let buf1 = Buffer.create 96
  and buf2 = Buffer.create 48 in do
   { try
        while True do Buffer.add_channel buf1 ic 1 done
     with [ End_of_file -> () ]
    (*  with [ End_of_file -> () ]*)
   ; try
        while True do Buffer.add_channel buf2 ec 1 done
      with [ End_of_file -> () ]
   ; let exit_status = Unix.close_process_full (ic, oc, ec) in
         check_exit_status exit_status
   ; (Buffer.contents buf1, Buffer.contents buf2)
   }
;
(*
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
*)

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
    
value members_of upasarga rt trie =
       if upasarga = "-"
       then member_of rt trie
       else member_of (upasarga^"_"^rt) trie
;

value noun_masc = build_trie noun_puM_list
;
value noun_neut = build_trie noun_napuM_list
;
value noun_fem = build_trie noun_swrI_list
;

value karaNa_verbs = build_trie karaNa_XAwu_list
;

value sampraxAna_verbs = build_trie sampraxAna_XAwu_list
;

value apAxAna_verbs = build_trie apAxAna_XAwu_list
;

value sakarmaka_verbs =  build_trie sakarmaka_XAwu_list
;

value xvikarmaka1 = build_trie xvikarmaka_XAwu_list1
;

value xvikarmaka2 = build_trie xvikarmaka_XAwu_list2
;

value aaxikarma_verbs =  build_trie aaxikarma_XAwu_list
;

value gawyarWa_verbs = build_trie gawyarWa_XAwu_list
;

value buxXyarWa_verbs = build_trie buxXyarWa_XAwu_list
;

value shabxakarma_verbs = build_trie shabdakarma_dhaatu_list
;

value prawyavasAnArWa_verbs = build_trie prawyavasAnArWa_XAwu_list
;

value shliR_Axi_verbs = build_trie shlish_aadi_list
;

value akarmaka_verbs = build_trie akarmaka_XAwu_list
;
	
value vAkyakarma_verbs = build_trie vAkyakarma_XAwu_list
;

value shakAxi = build_trie shakaadi_list
;

value split2 str fmt =  Scanf.sscanf str fmt (fun x y -> (x,y))
;
value split4 str fmt =  Scanf.sscanf str fmt (fun x y z t -> (x,y,z,t))
;
	
value print_space_string str1 = do { print_string str1; print_string " "}
;

value get_assoc key assoc_array =
     try
        List.assoc key assoc_array
     with [ Not_found -> ""]
;

(*value rec read_file chin acc fmt =
      try let line = input_line chin in
      let (a,b) = split2 line fmt in
      let acc = List.append acc [(a,b)] in
            read_file chin acc fmt
    with
    [ End_of_file -> do { close_in chin; acc}
    ]
;*)

type dhatu_attrbs = list (string * string)
;

value load_root_info file =
try (Gen.gobble file : dhatu_attrbs)
  with [ _ ->  raise (Report file) ]
;


(*value read_list file fmt =
let chin = open_in file in
 read_file chin [] fmt
;

value root_info_list =
      read_list (datapath ^ "dhatu_info_chart_uBaya_wx.txt") "%s %s"
;
*)

value get_category rt rel = match rt with
    [ "anwara" | "anwarA" | "anya" | "anyA" | "anyawama" | "anyawamA" |
      "anyawara" | "anyawarA" | "apara" | "aparA" | "aRtawaya" |
      "aRtAwaya" | "asmax" | "avara" | "avarA" | "aXara" | "aXarA" |
      "axas" | "bahir" | "Bavaw" | "BavawI" | "dawama" | "dawamA" |
      "dawara" | "dawarA" | "ekawama" | "ekawamA" | "ekawara" | "ekawarA" |
      "ekawaya" | "ekawayA" | "ewax" | "iwara" | "iwarA" | "ixam" |
      "kawama" | "kawamA" | "kawara" | "kawarA" | "kawi" | "kiFcana" |
      "kiFciw" | "kim" | "mUrwaya" | "nema" | "nemA" | "paFcawaya" |
      "para" | "parA" | "pUrva" | "pUrvA" | "sahasrawaya" | "sahasrawayA" |
      "sama" | "samA" | "sapwawaya" | "sarva" | "sarvA" | "sima" |
      "simA" | "sva" | "svA" | "uBa" | "uBA" | "uBaya" | "uBayA" |
      "uwwara" | "uwwarA" | "viSva" | "viSvA" | "wax" | "wAxqS" | "wAxqSI" |
      "waya" | "wriwaya" | "wva" | "wvA" | "wyax" | "xakRiNa" | "xakRiNA" |
      "xaSawaya" | "XOwaya" | "xviwaya" | "xviwayA" | "yax" | 
      "yuRmax"  -> "sarva"
    | "agrima" | "agrimA" | "arbuxawama" | "arbuxawamA" | 
      "aRtacawvAriMSa" | "aRtacawvAriMSA" | "aRtAcawvAriMSa" | 
      "aRtAcawvAriMSA" | "aRtacawvAriMSawwama" | "aRtacawvAriMSawwamA" | 
      "aRtAcawvAriMSawwama" | "aRtAcawvAriMSawwamA" | "aRtama" | 
      "aRtamI" | "aRtanavawa" | "aRtanavawA" | "aRtAnavawa" | "aRtAnavawA" |
      "aRtanavawiwama" | "aRtanavawiwamA" | "aRtAnavawiwama" |
      "aRtAnavawiwamA" | "aRtapaFcASa" | "aRtapaFcASA" | "aRtApaFcASa" |
      "aRtApaFcASA" | "aRtapaFcASawwama" | "aRtapaFcASawwamA" |
      "aRtApaFcASawwama" | "aRtApaFcASawwamA" | "aRtaRaRta" | "aRtaRaRtA" | 
      "aRtARaRta" | "aRtARaRtA" | "aRtaRaRtiwama" | "aRtaRaRtiwamA" |
      "aRtARaRtiwama" | "aRtARaRtiwamA" | "aRtasapwawa" | "aRtasapwawA" |
      "aRtAsapwawa" | "aRtAsapwawA" | "aRtasapwawiwama" | "aRtasapwawiwamA" |
      "aRtAsapwawiwama" | "aRtAsapwawiwamA" | "aRtASIwa" | "aRtASIwA" |
      "aRtASIwiwama" | "aRtASIwiwamA" | "aRtAviMSa" | "aRtAviMSA" |
      "aRtAviMSawiwama" | "aRtAviMSawiwamA" | "aRtAwriMSa" | "aRtAwriMSA" |
      "aRtAwriMSawwama" | "aRtAwriMSawwamA" | "aRtAxaSa" | "aRtAxaSI" |
      "aSIwa" | "aSIwA" | "aSIwiwama" | "aSIwiwamA" | "ayuwawama" |
      "ayuwawamA" | "cawuHpaFcASA" | "cawuHpaFcASawwama" | "cawuHpaFcASawwamA" |
      "cawuHRaRta" | "cawuHRaRtA" | "cawuHRaRtiwama" | "cawuHRaRtiwamA" |
      "cawuHsapwawa" | "cawuHsapwawA" | "cawuHsapwawiwama" | "cawuHsapwawiwamA" |
      "cawuraSIwa" | "cawuraSIwA" | "cawuraSIwiwama" | "cawuraSIwiwamA" |
      "cawurnavawa" | "cawurnavawA" | "cawurnavawiwama" | "cawurnavawiwamA" |
      "cawuRpaFcASa" | "cawurviMSa" | "cawurviMSA" | "cawurviMSawiwama" |
      "cawurviMSawiwamA" | "cawurWa" | "cawurxaSa" | "cawurxaSI" |
      "cawuScawvAriMSa" | "cawuScawvAriMSA" | "cawuScawvAriMSawwama" |
      "cawuScawvAriMSawwamA" | "cawuswriMSa" | "cawuswriMSA" |
      "cawuswriMSawwama" | "cawuswriMSawwamA" | "cawvAriMSa" | "cawvAriMSA" |
      "cawvAriMSawwama" | "cawvAriMSawwamA" | "ekacawvAriMSa" |
      "ekacawvAriMSA" | "ekacawvAriMSawwama" | "ekacawvAriMSawwamA" |
      "ekanavawa" | "ekanavawA" | "ekanavawiwama" | "ekanavawiwamA" |
      "ekapaFcASa" | "ekapaFcASA" | "ekapaFcASawwama" | "ekapaFcASawwamA" |
      "ekaRaRta" | "ekaRaRtA" | "ekaRaRtiwama" | "ekaRaRtiwamA" |
      "ekasapwawa" | "ekasapwawA" | "ekasapwawiwama" | "ekasapwawiwamA" |
      "ekASIwa" | "ekASIwA" | "ekASIwiwama" | "ekASIwiwamA" | "ekaviMSa" |
      "ekaviMSA" | "ekaviMSawiwama" | "ekaviMSawiwamA" | "ekawriMSa" |
      "ekawriMSA" | "ekawriMSawwama" | "ekawriMSawwamA" | "ekAxaSa" |
      "ekAxaSI" | "ekonacawvAriMSa" | "ekonacawvAriMSA" |
      "ekonacawvAriMSawwama" | "ekonacawvAriMSawwamA" | "ekonanavawa" |
      "ekonanavawA" | "ekonanavawiwama" | "ekonanavawiwamA" |
      "ekonapaFcASa" | "ekonapaFcASA" | "ekonapaFcASawwama" |
      "ekonapaFcASawwamA" | "ekonaRaRta" | "ekonaRaRtiwama" |
      "ekonaRaRtiwamA" | "ekonasapwawa" | "ekonasapwawA" |
      "ekonasapwawiwama" | "ekonasapwawiwamA" | "ekonaSawawama" |
      "ekonaSawawamA" | "ekonASIwa" | "ekonASIwA" |
      "ekonASIwiwama" | "ekonASIwiwamA" | "ekonaviMSawiwama" |
      "ekonaviMSawiwamA" | "ekonawriMSa" | "ekonawriMSawwama" |
      "ekonawriMSawwamA" | "IlawamA" | "iyuwawamA" | "Karvawama" | 
      "KarvawamA" | "kotiwama" | "kotiwamA" | "lakRawama" | "lakRawamA" |
      "mahASaMKawama" | "mahASaMKawamA" | "navacawvAriMSa" | "navacawvAriMSA" |
      "navacawvAriMSawwama" | "navacawvAriMSawwamA" | "navama" |
      "navamI" | "navanavawa" | "navanavawA" | "navanavawiwama" |
      "navanavawiwamA" | "navapaFcASa" | "navapaFcASA" | "navapaFcASawwama" |
      "navapaFcASawwamA" | "navaRaRta" | "navaRaRtA" | "navaRaRtiwama" |
      "navaRaRtiwamA" | "navasapwawa" | "navasapwawA" | "navasapwawiwama" |
      "navasapwawiwamA" | "navASIwa" | "navASIwA" | "navASIwiwama" |
      "navASIwiwamA" | "navaviMSa" | "navaviMSA" | "navaviMSawiwama" |
      "navaviMSawiwamA" | "navawa" | "navawA" | "navawiwama" |
      "navawiwamA" | "navawriMSa" | "navawriMSA" | "navawriMSawwama" |
      "navawriMSawwamA" | "navaxaSa" | "navaxaSI" | "nIlawama" |
      "niyuwawama" | "paFcacawvAriMSa" | "paFcacawvAriMSA" |
      "paFcacawvAriMSawwama" | "paFcacawvAriMSawwamA" | "paFcama" |
      "paFcamI" | "paFcanavawa" | "paFcanavawA" |
      "paFcanavawiwama" | "paFcanavawiwamA" | "paFcapaFcASa" |
      "paFcapaFcASA" | "paFcapaFcASawwama" | "paFcapaFcASawwamA" |
      "paFcaRaRta" | "paFcaRaRtA" | "paFcaRaRtiwama" |
      "paFcaRaRtiwamA" | "paFcASa" | "paFcASA" | "paFcasapwawa" |
      "paFcasapwawA" | "paFcasapwawiwama" | "paFcasapwawiwamA" |
      "paFcASawwama" | "paFcASawwamA" | "paFcASIwa" | "paFcASIwA" |
      "paFcASIwiwama" | "paFcASIwiwamA" | "paFcaviMSa" | "paFcaviMSA" |
      "paFcaviMSawiwama" | "paFcaviMSawiwamA" | "paFcawriMSa" | "paFcawriMSA" |
      "paFcawriMSawwama" | "paFcawriMSawwamA" | "paFcaxaSa" | "paFcaxaSI" |
      "paxmawama" | "paxmawamA" | "praWama" | "prayuwawama" |
      "prayuwawamA" | "RadaSIwa" | "RadaSIwA" | "RadaSIwiwama" |
      "RadaSIwiwamA" | "RadviMSa" | "RadviMSA" | "RadviMSawiwama" |
      "RadviMSawiwamA" | "RaNNavawa" | "RaNNavawA" | "RaNNavawiwama" |
      "RaNNavawiwamA" | "RaRta" | "RaRTa" | "RaRTI" |
      "RaRtiwama" | "RaRtiwamA" | "RatcawvAriMSa" | "RatcawvAriMSA" |
      "RatcawvAriMSawwama" | "RatcawvAriMSawwamA" | "RatpaFcASa" | "RatpaFcASA" |
      "RatpaFcASawwama" | "RatpaFcASawwamA" | "RatRaRta" | "RatRaRtA" |
      "RatRaRtiwama" | "RatRaRtiwamA" | "Ratsapwawa" | "RatsapwawA" |
      "Ratsapwawiwama" | "RatsapwawiwamA" | "RatwriMSa" | "RatwriMSA" |
      "RatwriMSawwama" | "RatwriMSawwamA" | "RodaSa" | "RodaSI" |
      "sahasrawama" | "sahasrawamA" | "SaMKawama" | "SaMKawamA" |
      "sapwacawvAriMSa" | "sapwacawvAriMSA" | "sapwacawvAriMSawwama" |
      "sapwacawvAriMSawwamA" | "sapwama" | "sapwamI" | "sapwanavawa" |
      "sapwanavawA" | "sapwanavawiwama" | "sapwanavawiwamA" |
      "sapwapaFcASa" | "sapwapaFcASA" | "sapwapaFcASawwama" |
      "sapwapaFcASawwamA" | "sapwaRaRta" | "sapwaRaRtA" |
      "sapwaRaRtiwama" | "sapwaRaRtiwamA" | "sapwasapwawa" | "sapwasapwawA" |
      "sapwasapwawiwama" | "sapwasapwawiwamA" | "sapwASIwa" | "sapwASIwA" |
      "sapwASIwiwama" | "sapwASIwiwamA" | "sapwaviMSa" | "sapwaviMSA" |
      "sapwaviMSawiwama" | "sapwaviMSawiwamA" | "sapwawa" | "sapwawA" |
      "sapwawiwama" | "sapwawiwamA" | "sapwawriMSa" | "sapwawriMSA" |
      "sapwawriMSawwama" | "sapwawriMSawwamA" | "sapwaxaSa" | "sapwaxaSI" |
      "Sawawama" | "SawawamA" | "viMSa" | "viMSA" | "viMSawiwama" |
      "viMSawiwamA" | "wqwIya" | "wrayaHpaFcASa" | "wrayaHpaFcASA" |
      "wrayaHpaFcASawwama" | "wrayaHpaFcASawwamA" | "wrayaHRaRta" |
      "wrayaHRaRtA" | "wrayaHRaRtiwama" | "wrayaHRaRtiwamA" | "wrayaHsapwawa" |
      "wrayaHsapwawA" | "wrayaHsapwawiwama" | "wrayaHsapwawiwamA" |
      "wrayaScawvAriMSa" | "wrayaScawvAriMSA" | "wrayaScawvAriMSawwama" |
      "wrayaScawvAriMSawwamA" | "wrayaswriMSa" | "wrayaswriMSA" |
      "wrayaswriMSawwama" | "wrayaswriMSawwamA" | "wrayonavawa" |
      "wrayonavawA" | "wrayonavawiwama" | "wrayonavawiwamA" |
      "wrayoviMSa" | "wrayoviMSA" | "wrayoviMSawiwama" | "wrayoviMSawiwamA" | 
      "wrayoxaSa" | "wrayoxaSI" | "wricawvAriMSa" | "wricawvAriMSA" |
      "wricawvAriMSawwama" | "wricawvAriMSawwamA" | "wriMSa" |
      "wriMSA" | "wriMSawwama" | "wriMSawwamA" | "wrinavawa" | "wrinavawA" |
      "wrinavawiwama" | "wrinavawiwamA" | "wripaFcASa" | "wripaFcASA" |
      "wripaFcASawwama" | "wripaFcASawwamA" | "wriRaRta" | "wriRaRtA" |
      "wriRaRtiwama" | "wriRaRtiwamA" | "wrisapwawa" | "wrisapwawA" |
      "wrisapwawiwama" | "wrisapwawiwamA" | "wryaSIwa" | "wryaSIwA" |
      "wryaSIwiwama" | "wryaSIwiwamA" | "wurya" | "xaSaKarvawama" |
      "xaSaKarvawamA" | "xaSakotiwama" | "xaSakotiwamA" | "xaSama" |
      "xaSamI" | "xaSanIlawama" | "xaSanIlawamA" | "xaSapaxmawama" |
      "xaSapaxmawamA" | "xaSArbuxawama" | "xaSArbuxawamA" | "xaSaSaMKawama" |
      "xaSaSaMKawamA" | "xvAcawvAriMSa" | "xvAcawvAriMSA" | "xvAcawvAriMSawwama" |
      "xvAcawvAriMSawwamA" | "xvAnavawa" | "xvAnavawA" | "xvAnavawiwama" |
      "xvAnavawiwamA" | "xvApaFcASa" | "xvApaFcASA" | "xvApaFcASawwama" |
      "xvApaFcASawwamA" | "xvARaRta" | "xvARaRtA" | "xvARaRtiwama" |
      "xvARaRtiwamA" | "xvAsapwawa" | "xvAsapwawA" | "xvAsapwawiwama" |
      "xvAsapwawiwamA" | "xvAviMSa" | "xvAviMSA" | "xvAviMSawiwama" |
      "xvAviMSawiwamA" | "xvAwriMSa" | "xvAwriMSA" | "xvAwriMSawwama" |
      "xvAwriMSawwamA" | "xvAxaSa" | "xvAxaSI" | "xvicawvAriMSa" |
      "xvicawvAriMSA" | "xvicawvAriMSawwama" | "xvicawvAriMSawwamA" |
      "xvinavawa" | "xvinavawA" | "xvinavawiwama" | "xvinavawiwamA" |
      "xvipaFcASa" | "xvipaFcASA" | "xvipaFcASawwama" | "xvipaFcASawwamA" |
      "xviRaRta" | "xviRaRtA" | "xviRaRtiwama" | "xviRaRtiwamA" |
      "xvisapwawa" | "xvisapwawA" | "xvisapwawiwama" | "xvisapwawiwamA" |
      "xviwIya" | "xvyaSIwa" | "xvyaSIwA" | "xvyaSIwiwama" | 
      "xvyaSIwiwamA" -> "pUraNa"
    | "arbuxa" | "aRtacawvAriMSaw" | "aRtAcawvAriMSaw" | "aRtan" |
       "aRtanavawi" | "aRtAnavawi" | "aRtapaFcASaw" | "aRtApaFcASaw" |
       "aRtaRaRti" | "aRtARaRti" | "aRtasapwawi" | "aRtAsapwawi" |
       "aRtaSawI" | "aRtASIwi" | "aRtAviMSawi" | "aRtAwriMSaw" |
       "aRtAxaSan" | "aSIwi" | "ayuwa" | "cawuHpaFcASaw" |
       "cawuHRaRti" | "cawuHsapwawi" | "cawuHSawI" | "cawur" |
       "cawuraSIwi" | "cawurnavawi" | "cawurviMSawi" | "cawurxaSan" |
       "cawuScawvAriMSaw" | "cawuswriMSaw" | "cawvAriMSaw" | "eka" |
       "ekacawvAriMSaw" | "ekanavawi" | "ekapaFcASaw" | "ekaRaRti" |
       "ekasapwawi" | "ekASIwi" | "ekaviMSawi" | "ekawriMSaw" |
       "ekAxaSan" | "ekonacawvAriMSaw" | "ekonanavawi" | "ekonapaFcASaw" |
       "ekonaRaRti" | "ekonasapwawi" | "ekonaSawa" | "ekonASIwi" |
       "ekonaviMSawi" | "ekonawriMSaw" | "Karva" | "koti" |
       "lakRa" | "mahASaMKa" | "navacawvAriMSaw" | "navan" | "navanavawi" |
       "navapaFcASaw" | "navaRaRti" | "navasapwawi" | "navaSawI" |
       "navASIwi" | "navaviMSawi" | "navawi" | "navawriMSaw" |
       "navaxaSan" | "nIla" | "niyuwa" | "paFcacawvAriMSaw" | "paFcan" |
       "paFcanavawi" | "paFcapaFcASaw" | "paFcaRaRti" | "paFcasapwawi" |
       "paFcASaw" | "paFcaSawI" | "paFcASIwi" | "paFcaviMSawi" |
       "paFcawriMSaw" | "paFcaxaSan" | "paxma" | "prayuwa" | "RadaSIwi" |
       "RadviMSawi" | "RaNNavawi" | "RaR" | "RaRti" | "RatcawvAriMSaw" |
       "RatpaFcASaw" | "RatRaRti" | "Ratsapwawi" | "RatSawI" |
       "RatwriMSaw" | "RodaSan" | "sahasra" | "SaMKa" | "sapwacawvAriMSaw" |
       "sapwan" | "sapwanavawi" | "sapwapaFcASaw" | "sapwaRaRti" |
       "sapwasapwawi" | "sapwaSawI" | "sapwASIwi" | "sapwaviMSawi" |
       "sapwawi" | "sapwawriMSaw" | "sapwaxaSan" | "Sawa" |
       "viMSawi" | "wrayaHpaFcASaw" | "wrayaHRaRti" | "wrayaHsapwawi" |
       "wrayaScawvAriMSaw" | "wrayaswriMSaw" | "wrayonavawi" |
       "wrayoviMSawi" | "wrayoxaSan" | "wri" | "wricawvAriMSaw" |
       "wriMSaw" | "wrinavawi" | "wripaFcASaw" | "wriRaRti" |
       "wrisapwawi" | "wriSawI" | "wryaSIwi" | "xaSaKarva" |
       "xaSakoti" | "xaSan" | "xaSanIla" | "xaSapaxma" |
       "xaSArbuxa" | "xaSaSaMKa" | "xvAcawvAriMSaw" | "xvAnavawi" |
       "xvApaFcASaw" | "xvARaRti" | "xvAsapwawi" | "xvAviMSawi" |
       "xvAwriMSaw" | "xvAxaSan" | "xvi" | "xvicawvAriMSaw" |
       "xvinavawi" | "xvipaFcASaw" | "xviRaRti" | "xvisapwawi" |
       "xviSawI" | "xvyaSIwi" -> 
         if (rel = "viSeRaNam") then "saMKyeya" else "saMKyA"
    | "ekA" | "neka" -> "saMKyeya"
    | _ -> "nA"
    ]
;

value report up vb str = let str1 = if up="-" then vb^" "^str else up^"+"^vb^" "^str
                         in raise (Report str1)
;

value report_rel str = raise (Report str)
;

value verb_type upasarga rt =
          if members_of upasarga rt akarmaka_verbs then "akarmaka"
          else if members_of upasarga rt xvikarmaka2 then "xvikarmaka2"
          else if members_of upasarga rt xvikarmaka1 then "xvikarmaka1"
          else if members_of upasarga rt gawyarWa_verbs then "gawi"
          else if members_of upasarga rt buxXyarWa_verbs  then "buxXi"
          else if members_of upasarga rt prawyavasAnArWa_verbs then "prawyavasAnArWa"
          else if members_of upasarga rt shabxakarma_verbs then "Sabxakarma"
          else if members_of upasarga rt sakarmaka_verbs then "sakarmaka" else ""
;

value call_core_sup_gen rt cat gen vib num  = 
      let str = "^"^rt^"<vargaH:"^cat^"><lifgam:"^gen^"><viBakwiH:"^string_of_int vib^"><vacanam:"^num^"><level:1>"^"$" in
      let str_sup_gen = "echo '"^str^"'|"^ltproc^ scl_morph_path^"sup_gen.bin" in 
      let (strout, strerr) = syscall str_sup_gen in
      if String.contains strout '#'
      then let pos = (Str.search_backward (Str.regexp_string "-" ) rt (String.length rt)) in
      let str_after = Str.string_after rt (pos+1)
      and str_before = Str.string_before rt (pos+1)  in
      let str = "^"^str_after^"<vargaH:"^cat^"><lifgam:"^gen^"><viBakwiH:"^string_of_int vib^"><vacanam:"^num^"><level:1>"^"$" in 
      let str_supunkn_gen = "echo '"^str^"'|"^ltproc^" /Users/ambakulkarni/amba/scl/skt_gen/Sentence/UNKN_PDGM/unkn_gen.bin" in
      let (strout1, strerr1) = syscall str_supunkn_gen in
      if String.contains strout1 '#'
      then rt
      else let s = strip_last_char strout1 in str_before^s
      else strip_last_char strout
;

value call_sup_gen rt cat gen vib num = 
      match gen with
      [ "puM" -> call_core_sup_gen rt cat "puM" vib num 
      | "napuM" -> call_core_sup_gen rt cat "napuM" vib num 
      | "swrI" -> call_core_sup_gen rt cat "swrI" vib num 
      | "a" -> call_core_sup_gen rt cat "a" vib num 
      | "puM_napuM" -> let acc1 = call_core_sup_gen rt cat "puM" vib num in
                       let acc2 = call_core_sup_gen rt cat "napuM" vib num in
                       acc1^"/"^acc2 
      | "puM_swrI" -> let acc1 = call_core_sup_gen rt cat "puM" vib num in
                      let acc2 = call_core_sup_gen rt cat "swrI" vib num in
                      acc1^"/"^acc2
      | "napuM_swrI" -> let acc1 = call_core_sup_gen rt cat "napuM" vib num in
                        let acc2 = call_core_sup_gen rt cat "swrI" vib num in
                        acc1^"/"^acc2
      | "puM_napuM_swrI" -> let acc1 = call_core_sup_gen rt cat "puM" vib num in
               let acc2 = call_core_sup_gen rt cat "swrI" vib num in
               let acc3 = call_core_sup_gen rt cat "napuM" vib num in
                acc1^"/"^acc2^"/"^acc3
      | _ -> "-"
      ]
;
		      
value call_kqwrt_gen upasarga rt san_suff gen kqw_suff prayoga feature_list =
      let pr = if not (prayoga = "") then "<prayogaH:"^prayoga^">" else prayoga in
      (* let str = "^<kqw_XAwu:"^rt^">"^upasarga^san_suff^"<lifgam:"^gen^"><kqw_prawyayaH:"^kqw_suff^">"^pr^"<XAwuH:"^feature_list.(1)^"><gaNaH:"^feature_list.(2)^"><level:0>$" in *)
      let str = "^"^rt^upasarga^san_suff^"<lifgam:"^gen^"><kqw_prawyayaH:"^kqw_suff^">"^pr^"<XAwuH:"^feature_list.(1)^"><gaNaH:"^feature_list.(2)^"><level:0>$" in
      let str_kqwrt_gen = "echo '"^str^"'|"^ltproc^scl_morph_path^"kqw_gen.bin" in
      let (strout, strerr) = syscall str_kqwrt_gen in 
      strip_last_char strout
;

value call_kqwform_gen upasarga rt san_suff gen kqw_suff prayoga feature_list kqwrt vib num =
      let pr = if not (prayoga = "") then "<prayogaH:"^prayoga^">" else prayoga in
      (*let str = "^<kqw_XAwu:"^rt^">"^upasarga^san_suff^"<kqw_prawyayaH:"^kqw_suff^">"^pr^"<XAwuH:"^feature_list.(1)^"><gaNaH:"^feature_list.(2)^">"^kqwrt^"<vargaH:nA><lifgam:"^gen^"><viBakwiH:"^ string_of_int vib^"><vacanam:"^num^"><level:2>$" in *)
      let str = "^"^rt^upasarga^san_suff^"<kqw_prawyayaH:"^kqw_suff^">"^pr^"<XAwuH:"^feature_list.(1)^"><gaNaH:"^feature_list.(2)^">"^kqwrt^"<vargaH:nA><lifgam:"^gen^"><viBakwiH:"^ string_of_int vib^"><vacanam:"^num^"><level:2>$" in
      let str_kqw_gen = "echo '"^str^"'|"^ltproc^scl_morph_path^"kqw_gen.bin" in
      let (strout, strerr) = syscall str_kqw_gen in 
      strip_last_char strout
;

value call_core_kqw_gen upasarga rt san_suff gen kqw_suff prayoga feature_list vib num =
   let kqwrt = call_kqwrt_gen upasarga rt san_suff gen kqw_suff prayoga feature_list in
   call_kqwform_gen upasarga rt san_suff gen kqw_suff prayoga feature_list kqwrt vib num
;

value call_kqw_gen upasarga rt san_suff gen kqw_suff prayoga feature_list vib num =
      match gen with
      [ "puM" -> call_core_kqw_gen upasarga rt san_suff "puM" kqw_suff prayoga feature_list vib num
      | "napuM" -> call_core_kqw_gen upasarga rt san_suff "napuM" kqw_suff prayoga feature_list vib num 
      | "swrI" -> call_core_kqw_gen upasarga rt san_suff "swrI" kqw_suff prayoga feature_list vib num 
      | "puM_napuM" -> let acc1 = call_core_kqw_gen upasarga rt san_suff "puM" kqw_suff prayoga feature_list vib num in
                       let acc2 = call_core_kqw_gen upasarga rt san_suff "napuM" kqw_suff prayoga feature_list vib num in
                       acc1^"/"^acc2
      | "puM_swrI" -> let acc1 = call_core_kqw_gen upasarga rt san_suff "puM" kqw_suff prayoga feature_list vib num in
                      let acc2 = call_core_kqw_gen upasarga rt san_suff "swrI" kqw_suff prayoga feature_list vib num in
                      acc1^"/"^acc2
      | "napuM_swrI" -> let acc1 = call_core_kqw_gen upasarga rt san_suff "napuM" kqw_suff prayoga feature_list vib num in
                        let acc2 = call_core_kqw_gen upasarga rt san_suff "swrI" kqw_suff prayoga feature_list vib num in
                        acc1^"/"^acc2
      | "a" -> let acc1 = call_core_kqw_gen upasarga rt san_suff "puM" kqw_suff prayoga feature_list vib num in
               let acc2 = call_core_kqw_gen upasarga rt san_suff "swrI" kqw_suff prayoga feature_list vib num in
               let acc3 = call_core_kqw_gen upasarga rt san_suff "napuM" kqw_suff prayoga feature_list vib num in
                acc1^"/"^acc2^"/"^acc3
      | _ -> "-"
      ]
;
		      
value call_avykqw_gen upasarga rt san_suff kqw_suff feature_list =
      (*let str = "^<kqw_XAwu:"^rt^">"^upasarga^san_suff^"<vargaH:avy><kqw_prawyayaH:"^kqw_suff^"><XAwuH:"^feature_list.(1)^"><gaNaH:"^feature_list.(2)^"><level:2>$" in *)
      let str = "^"^rt^upasarga^san_suff^"<vargaH:avy><kqw_prawyayaH:"^kqw_suff^"><XAwuH:"^feature_list.(1)^"><gaNaH:"^feature_list.(2)^"><level:2>$" in
      let str_avykqw_gen = "echo '"^str^"'|"^ltproc^scl_morph_path^"kqw_gen.bin" in
      let (strout, strerr) = syscall str_avykqw_gen in 
      strip_last_char strout
;

value call_wif_gen upasarga rt san_suff prayoga lakAra paxI per_num feature_list =
      let str = "^"^rt^upasarga^san_suff^"<prayogaH:"^prayoga^"><lakAraH:"^lakAra^"><puruRaH:"^per_num.(0)^"><vacanam:"^per_num.(1)^"><paxI:"^paxI^"><XAwuH:"^feature_list.(1)^"><gaNaH:"^feature_list.(2)^"><level:1>$" in
      let str_wif_gen = "echo '"^str^"'|"^ltproc^scl_morph_path^"wif_gen.bin" in
      let (strout, strerr) = syscall str_wif_gen in 
      strip_last_char strout
;

value get_gender m = match m with
 [Sup (id,rt,cat,gen,num,rel,toid) ->
    if(gen = "-") 
    then if rt="asmax" || rt="yuRmax" then "a"
    else if member_of rt noun_masc
      then if member_of rt noun_neut
         then if member_of rt noun_fem
              then "puM_napuM_swrI" else "puM_napuM"
         else if member_of rt noun_fem
              then "pum_swrI" else "puM"
      else if member_of rt noun_neut
           then if member_of rt noun_fem
                then "napuM_swrI" else "napuM"
           else if member_of rt noun_fem
                then "swrI" else "puM" (* default gender *)
    else gen
 | _ -> ""
 ]
;

value handle_sup_samucciwa id v1 parse =
   loop [] parse
   where rec loop acc = fun
   [ [] -> acc
   | [m1 :: r1 ] -> match m1 with
      [ Sup (id1,rt1,cat1,_,num1,rel,to_id1) ->
         if (id=to_id1) && (rel="sup_samucciwa")
         then let cat = if not (cat1 = "-") then cat1 
                        else get_category rt1 rel in
              let gen1 = get_gender m1 in 
              let str_sup_gen = call_sup_gen rt1 cat gen1 v1 num1 in
              let acc1 = List.append acc [str_sup_gen] in
              loop acc1 r1 
         else loop acc r1
       | _ -> loop acc r1
       ]
   ]
;

value get_lakAra kAla = match kAla with
["varwamAnaH" -> "lat"
|"anaxyawanaBUwaH" -> "laf"
|"sAmAnyaBUwaH" -> "luf"
|"parokRaBUwaH" -> "lit"
|"anaxyawanaBaviRyakAlaH" -> "lut"
|"sAmAnyaBaviRyakAlaH" -> "lqt"
|"AjFAprArWanAxiRu" -> "lot"
|"viXiH" -> "viXilif"
|"ASIH" -> "ASIrlif"
|"kriyAniRpawwO-hewumaxBAve-ca" -> "lqf"
|"varwamAnasamAnakAlaH" -> "Sawq_lat"
|"varwamAnasamAnakAlaH-karwari" -> "SAnac_lat_karwari"
|"varwamAnasamAnakAlaH-karmaNi" -> "SAnac_lat_karmaNi"
|"BaviRyawsamAnakAlaH" -> "Sawq_lqt"
|"BaviRyawsamAnakAlaH-karwari" -> "SAnac_lqt_karwari"
|"BaviRyawsamAnakAlaH-karmaNi" -> "SAnac_lqt_karmaNi"
|"BUwakarma" -> "kwa"
|"BUwakarwA" -> "kwavawu"
|"prayojanam" -> "wumun"
|"pUrvakAlaH" -> "kwvA"
|"BAvaH1" -> "lyut"
|"BAvaH2" -> "GaF"
| _ -> kAla
]
;
value handle_viSeRaNas id gen num vib parse root_info_list =
   loop [] parse
   where rec loop acc = fun
   [ [] -> acc
   | [m1 :: r1 ] -> match m1 with
        [ Sup_viSeRaNa (id1,rt,rel,to_id1) ->
               if (id=to_id1) && (rel="viSeRaNam" || rel="aBexaH")
               then let cat = get_category rt rel in
		    let str_sup_gen = call_sup_gen rt cat gen vib num in
                    let acc1 = List.append acc [str_sup_gen] in
                    loop acc1 r1
                    
               else loop acc r1
 
        | Kqw_viSeRaNa (id1,upasarga,rt,san_suff,kAla,rel,to_id1) -> 
            if (id=to_id1) && (rel="viSeRaNam" || rel="aBexaH") then
            let kqw_suff = get_lakAra kAla in
            let root_info = get_assoc rt root_info_list in
            let u = if upasarga = "-" then "" else "<upasarga:"^upasarga^">" in
            let feature_list = Array.of_list (Str.bounded_split (Str.regexp_string ",") root_info 3) in
            let s = if san_suff = "-" then "" else "<sanAxi_prawyayaH:"^san_suff^">" in
            let str_kqw_gen = if kqw_suff="SAnac_lat_karwari"
            then call_kqw_gen u rt s gen "SAnac_lat" "karwari" feature_list vib num
            else if kqw_suff="SAnac_lat_karmaNi"
            then call_kqw_gen u rt s gen "SAnac_lat" "karmaNi" feature_list vib num
            else call_kqw_gen u rt s gen kqw_suff "" feature_list vib num in
            if kAla="BUwakarwA" && (members_of upasarga rt akarmaka_verbs || members_of upasarga rt gawyarWa_verbs || members_of upasarga rt shliR_Axi_verbs || members_of upasarga rt aaxikarma_verbs)
            then 
            let str1_kqw_gen = call_kqw_gen u rt s gen "kwa" "" feature_list vib num in
            let str = String.concat "/" [str1_kqw_gen; str_kqw_gen] in 
            let acc1 = List.append acc [str] in
            loop acc1 r1
            else let acc1 = List.append acc [str_kqw_gen] in 
            loop acc1 r1 
           else loop acc r1
        | _ -> loop acc r1
        ]
   ]
;


value get_kqw_suff kqw_suff upasarga rel =
    if(kqw_suff = "-") 
    then if rel="pUrvakAlaH"
    then if upasarga="-" then "kwvA" else "lyap"
    else if rel="prayojanam" || rel="karma" || rel="sahAyakakriyA"
    then "wumun" else ""
    else kqw_suff
;

value rec sublist acc i j =
     if i > j then []
     else
      List.append [(List.nth acc i)] (sublist acc (i+1) j)
;

value insert_ca to_id acc = 
    List.append (sublist acc 0 to_id) ["ca"]
;

value get_person_number id prayoga parse =
    let aBihiwa = if (prayoga = "karwari") then "karwA"
                  else if (prayoga = "karmaNi") then "karma"
                  else "" in
   loop1 parse
   where rec loop1 = fun
   [ [] -> [| "pra";"eka" |]
   | [m1 :: r1 ] -> match m1 with
        [ Sup (_,rt,_,_,num1,rel1,to_id1) 
        | Kqw (_,_,rt,_,_,_,num1,rel1,to_id1) -> 
               if (id = to_id1) && rel1=aBihiwa
               then let per = if (rt = "asmax") then "u" 
                              else if (rt = "yuRmax") then "ma"
                              else "pra" in [| per ;  num1 |]
               else loop1 r1
        | _ -> loop1 r1
        ]
   ]
;

(* value get_upapaxa_vibhakti rel =
    match rel with
    [ "aBiwaH"
    | "aXoZXaH"
    | "aXoXaH"
    | "aXyaXi"
    | "anwarA"
    | "nikaRA"
    | "pariwaH"
    | "samayA" 
    | "sarvawaH"
    | "uBayawaH" -> 2
    | "aXareNa" 
    | "xakRiNena"
    | "uwwareNa" -> 2 (* also 6 *)
    | "samIpam"
    | "samIpAw"
    | "samIpena"
    | "samIpe"
    | "viprakqRtam"
    | "viprakqRtAw"
    | "viprakqRtena"
    | "viprakqRte"
    | "xUram"
    | "xUrAw"
    | "xUre"
    | "xUreNa"
    | "nikatam"
    | "nikatAw"
    | "nikatena"
    | "nikate"
    | "anwikam"
    | "anwikAw"
    | "anwikena"
    | "anwike"
    | "aByASam"
    | "aByASAw"
    | "aByASena"
    | "uwwarA" 
    | "aByASe" -> 5 (* also 6 *)
    | "ArAw"
    | "bahiH"
    | "prAFca"
    | "prawyaFca"
    | "prawyak"
    | "uwwarAhi"
    | "uwwaram"
    | "xakRiNAhi"
    | "xakRiNam"
    | "xakRiNA" -> 5
    | "agrawaH"
    | "anwaH"
    | "aXaH"
    | "avaH"
    | "aXaswAw"
    | "puraH"
    | "puraswAw"
    | "paraswAw"
    | "avaswAw"
    | "parawaH"
    | "avarawaH"
    | "avaraswAw"
    | "purawaH"
    | "xakRiNawaH"
    | "xakRiNAw"
    | "upariRtAw"
    | "paScAw"
    | "uwwarAw"
    | "aXarAw"
    | "upari"
    | "uwwarawaH" -> 6
    | "xakRiNe" -> 7
    | "uwware" -> 7
    | _  -> 1
    ]
;
*)

value get_vibhakti m parse = match m with
 [Sup (_,_,_,_,_,rel,toid)
 | Kqw (_,_,_,_,_,_,_,rel,toid)  ->
      if not (rel = "karwA" || 
              rel = "prayojakakarwA" || 
              rel = "prayojyakarwA" || 
              rel = "karwqsamAnAXikaraNam" || 
              rel = "karma" || 
              rel = "muKyakarma" || 
              rel = "gONakarma" || 
              rel = "aXikaraNam" || 
              rel = "karmasamAnAXikaraNam" )
      then loop1 parse
      where rec loop1 = fun
      [ [] -> 1 (*0 *)
      | [m1 :: r1 ] -> match m1 with
        [ Wif (id1,upasarga1,rt1,san_suff1,_,_,_,_) 
        | Kqw (id1,upasarga1,rt1,san_suff1,_,_,_,_,_) 
        | Avykqw (id1,upasarga1,rt1,san_suff1,_,_,_) -> 
              if ( toid = id1) then match rel with
              [ "karaNam" -> if members_of upasarga1 rt1 karaNa_verbs then 3 
                             else report upasarga1 rt1 "does not have a karana expectancy"
              | "hewuH" -> 3
              | "sampraxAnam" -> if members_of upasarga1 rt1 sampraxAna_verbs then 4 
                                 else report upasarga1 rt1 "does not have an expectancy for a sampradaana"
              | "prayojanam" -> 4
              | "apAxAnam" -> if members_of upasarga1 rt1 apAxAna_verbs then 5 
                              else report upasarga1 rt1 "does not have an expectancy for a apaadaana"
              | "kriyAviSeRaNam" -> 2
              | "xeSAXikaraNam" -> 7
              | "kAlAXikaraNam" -> 7
              | "viRayAXikaraNam" -> 7
              | "samboXyaH" -> 8
              | "samboXanasUcakam" -> 1
              | _ -> (*get_upapaxa_vibhakti rel *) 1
                     (*get_vibhakti rel*)
              (* | _ -> let str = "I do not know how to handle "^rel^"relation"
                     in report_rel str *)
              ] else  loop1 r1
       |Sup (id1,rt1,_,_,_,_,_)
       |Kqw_viSeRaNa (id1,rt1,_,_,_,_,_)
       |Sup_viSeRaNa (id1,rt1,_,_)
       | Avy (id1,rt1,_,_) -> 
              if (toid = id1) then match rel with
              [ "RaRTIsambanXaH" -> 6
              | "sanxarBa_binxuH" 
              | "wulanA_binxuH" -> match rt1 with
                [ "yukwa" -> 3
                | "avAcI" 
                | "avAc" 
                | "Binna" 
                | "BinnA" 
                | "iwara" 
                | "iwarA" 
                | "paScimA" 
                | "paScima" 
                | "prAcI" 
                | "pUrvA" 
                | "pUrva" 
                | "vilakRaNa" 
                | "vilakRaNA" 
                | "xUrA" 
                | "prawIcI" 
                | "uxac" 
                | "uxIcI" -> 5
                | "sama" 
                | "samA" 
                | "samAna" 
                | "samAnA" 
                | "saxqkRA" 
                | "saxqkRa" 
                | "saxqkRI" 
                | "saxqSA" 
                | "saxqSa" 
                | "saxqS" 
                | "wulya" 
                | "wulyA"  -> 3 (* also 6*)
		| "anya"
		| "anyA"
                | "aByASA" 
                | "aByASa" 
                | "viprakqRta" 
                | "xUra"
                | "viprakqRtA" -> 5 (* also 6 *)
                | "alam" -> 4
    | "aBiwaH"
    | "aXoZXaH"
    | "aXoXaH"
    | "aXyaXi"
    | "anwarA"
    | "nikaRA"
    | "pariwaH"
    | "samayA" 
    | "sarvawaH"
    | "uBayawaH" -> 2
    | "aXareNa" 
    | "xakRiNena"
    | "uwwareNa" -> 2 (* also 6 *)
    | "samIpam"
    | "samIpAw"
    | "samIpena"
    | "samIpe"
    | "viprakqRtam"
    | "viprakqRtAw"
    | "viprakqRtena"
    | "viprakqRte"
    | "xUram"
    | "xUrAw"
    | "xUre"
    | "xUreNa"
    | "nikatam"
    | "nikatAw"
    | "nikatena"
    | "nikate"
    | "anwikam"
    | "anwikAw"
    | "anwikena"
    | "anwike"
    | "aByASam"
    | "aByASAw"
    | "aByASena"
    | "uwwarA" 
    | "aByASe" -> 5 (* also 6 *)
    | "ArAw"
    | "bahiH"
    | "prAFca"
    | "prawyaFca"
    | "prawyak"
    | "uwwarAhi"
    | "uwwaram"
    | "xakRiNAhi"
    | "xakRiNam"
    | "xakRiNAn"
    | "xakRiNA" -> 5
    | "agrawaH"
    | "anwaH"
    | "aXaH"
    | "avaH"
    | "aXaswAw"
    | "puraH"
    | "puraswAw"
    | "paraswAw"
    | "avaswAw"
    | "parawaH"
    | "avarawaH"
    | "avaraswAw"
    | "purawaH"
    | "xakRiNawaH"
    | "xakRiNAw"
    | "upariRtAw"
    | "paScAw"
    | "uwwarAw"
    | "aXarAw"
    | "upari"
    | "uwwarawaH" -> 6
    | "xakRiNe" -> 7
    | "uwware" -> 7
                | _ -> 1 (* raise an error *)
              ]
             | "prayojanam" -> match rt1 with
                [ "arWe"
                | "kqwe" -> 6
                | "AyuRya" 
                | "Baxra" 
                | "ciraFjIviwa" 
                | "hiwa" 
                | "kuSala" 
                | "maxra" 
                | "Sam"  (* Avy *)
                | "nirAmaya" 
                | "suKa"  -> 4 (* also 6 *)
                | "svAhA" 
                | "svaswi" 
                | "svaXA" 
                | "vaRat" -> 4
                | _ -> 1 (* raise an error *)
                ]
	     | "uxgAravAcaka" -> if (rt1 = "hA") || (rt1 = "Xik") then  2 else 1
	     | "ABimuKya" -> if (rt1 = "prawi") then  2 else 1
	     | "prawisixXa" -> if (rt1 = "alam") then  3 else 1
	     | "srowa" -> if (rt1 = "AraBya") || (rt1 ="praBqwi")  then  5 else 1
	     | "viRayAXikaraNam" -> match rt1 with
                [ "sAXu"
                | "asAXu"
                | "anurakwa"
                | "anurakwA"
                | "Asakwa"
                | "AsakwA"
                | "Ayukwa"
                | "AyukwA"
                | "kuSala"
                | "kuSalA"
                | "lagna"
                | "lagnA"
                | "nipuNa"
                | "nipuNA" -> 7
                | "prasiwa"
                | "prasiwA" 
                | "uwsuka"
                | "uwsukA"  -> 3 (* also 7 *)
                | _ -> 1
                ]
             | "svAmI" -> match rt1 with
                ["aXipawi"
                | "ISvara"
                | "prawiBU"
                | "sAkRin"
                | "sAkRiNI"
                | "xAyAxa"
                | "svAminI"
                | "svAmin" -> 7
                | _ -> 1
                ]
             | "vinArWaH" 
             | "sahArWaH" -> 3
             (*| "vinArWaH" -> if (rt1="vinA" || rt1 = "qwe") then 3 (* also 5 *) 
                             else if (rt1 = "anwareNa") then 2 else 1  ?? seems redundant? *)
             | "nirXAraNam" -> if (rt1 = "prasUwA") then 6 (* also 7 *) else 1
             | _ -> let str = "I do not know how to handle "^rel^"relation"
                     in report_rel str
             ]
              else loop1 r1
        (*block samboXanaviBakwi with upapaxa*)
       | _ -> loop1 r1
       ]
     ]
      else loop2 parse
      where rec loop2 = fun
      [ [] -> 1 (*0 *)
      | [m2 :: r2 ] -> match m2 with
        [ Wif (id1,upasarga1,rt1,san_suff1,prayoga1,_,_,_) ->
          if (toid = id1)
          then match san_suff1 with
          ["Nic" -> match rel with
              ["karwA"
              |"karwqsamAnAXikaraNam" -> 
                 report upasarga1 rt1 "being in Nic form, karwA is not allowed"
              |"prayojakakarwA" -> if (prayoga1 = "karwari") then 1 else 3
              |"prayojyakarwA" -> 
                 if (prayoga1 = "karwari") 
                 then match verb_type upasarga1 rt1 with
                 ["akarmaka"
                 |"gawi"
                 |"buxXi"
                 |"prawyavasAnArWa"
                 |"Sabxakarma" -> 2 
                 | "sakarmaka" 
                 | "xvikarmaka1"
                 | "xvikarmaka2" -> 3
                 | _ -> 0 (* raise an exception *)
                 ]
                 else if (prayoga1 = "karmaNi") 
                 then match verb_type upasarga1 rt1 with
                 ["akarmaka"
                 |"gawi" -> 1
                 |"buxXi"
                 |"prawyavasAnArWa" 
                 |"Sabxakarma" -> 2 (* 12 *)
                 | "sakarmaka"
                 | "xvikarmaka1"
                 | "xvikarmaka2" -> 3
                 | _ -> 0 (* raise an exception *)
                 ]
                 else 0 (*raise an exception *)
              |"karma" -> if members_of upasarga1 rt1 akarmaka_verbs
                          then report upasarga1 rt1 "is akarmaka hence karma is not allowed"
                          else
                 if (prayoga1 = "karwari") then 2
                 else if (prayoga1 = "karmaNi") 
                 then match verb_type upasarga1 rt1 with
                 ["gawi" -> 1
                 |"buxXi"
                 |"prawyavasAnArWa" 
                 |"Sabxakarma" -> 1 (*12 *)
                 |"sakarmaka" -> 1
                 | _ -> 0 (* raise an exception *)
                 ]
                 else 0 (*raise an exception *)
              |"muKyakarma" ->  if  not (members_of upasarga1 rt1 xvikarmaka1)
                                &&  not (members_of upasarga1 rt1 xvikarmaka2)
                                then 0 (* raise exception *)
				else if (prayoga1 = "karwari") then 2 
                                else if (members_of upasarga1 rt1 xvikarmaka1)
                                then 2
                                else if (members_of upasarga1 rt1 xvikarmaka2)
                                then 1
				else 0 (* this case does not arise *)
              |"gONakarma" ->  if   not (members_of upasarga1 rt1 xvikarmaka1)
                                &&  not (members_of upasarga1 rt1 xvikarmaka2)
                                then 0 (* raise exception *)
				else if (prayoga1 = "karwari") then 2 
                                else if (members_of upasarga1 rt1 xvikarmaka1)
                                then 1
                                else if (members_of upasarga1 rt1 xvikarmaka2)
                                then 2
				else 0 (* this case does not arise *)
              |"karmasamAnAXikaraNam" -> if (prayoga1 = "karwari") 
                                         then 2 else 0 (* raise exception *)
					(* karmaNi prayoga rules to be written *)
              | "aXikaraNam" ->  if (members_of upasarga1 rt1 gawyarWa_verbs)
                                 then report upasarga1 rt1
              "being gatyarthaka, does not have an expectancy for aXikaraNam"
                                 else if (upasarga1="aXi") &&
                                 ((rt1 ="SI1") || (rt1="RWA1") || (rt1="As1"))
                                 then if (prayoga1 = "karwari" )
                                 then 2 else 1
                                 else 7
              | "-" -> 1
              | _ -> 0 (* raise exception *)
              ]
          | "-" ->  match rel with (* Not-Nic *)
              ["karwA" -> if (prayoga1 = "karwari") then 1 else 3
              |"karwqsamAnAXikaraNam" -> if (prayoga1 = "karwari") 
                                         then 1 else 0 (* raise exception *)
              |"karma" -> if members_of upasarga1 rt1 sakarmaka_verbs
                          then if (prayoga1 = "karmaNi") then 1 else 2 
                          else report upasarga1 rt1 "is akarmaka hence karma is not allowed"
              |"muKyakarma" ->  if  not (members_of upasarga1 rt1 xvikarmaka1)
                                &&  not (members_of upasarga1 rt1 xvikarmaka2)
                                then 0 (* raise exception *)
				else if (prayoga1 = "karwari") then 2 
                                else if (members_of upasarga1 rt1 xvikarmaka1)
                                then 2
                                else if (members_of upasarga1 rt1 xvikarmaka2)
                                then 1
				else 0 (* this case does not arise *)
              |"gONakarma" ->  if   not (members_of upasarga1 rt1 xvikarmaka1)
                                &&  not (members_of upasarga1 rt1 xvikarmaka2)
                                then 0 (* raise exception *)
				else if (prayoga1 = "karwari") then 2 
                                else if (members_of upasarga1 rt1 xvikarmaka1)
                                then 1
                                else if (members_of upasarga1 rt1 xvikarmaka2)
                                then 2
				else 0 (* this case does not arise *)
              |"karmasamAnAXikaraNam" -> if (prayoga1 = "karwari") 
                                         then 2 else 0 (* raise exception *)
					(* karmaNi prayoga rules to be written *)
              | "aXikaraNam" ->  if (members_of upasarga1 rt1 gawyarWa_verbs)
                                 then report upasarga1 rt1 
              "being gatyarthaka, does not have an expectancy for aXikaraNam"
                                 else if (upasarga1="aXi") &&
                                 ((rt1 ="SI1") || (rt1="RTA1") || (rt1="As1"))
                                 then if (prayoga1 = "karwari" )
                                 then 2 else 1
                                 else 7
              | "-" -> 1
              | _ -> 0 (* raise exception *)
              ]
          | _ -> 0
          ]
              else loop2 r2
        | Kqw_viSeRaNa (id1,upasarga1,rt1,san_suff1,kqw_suff1,_,_)
        | Kqw (id1,upasarga1,rt1,san_suff1,kqw_suff1,_,_,_,_)  ->
           match kqw_suff1 with
           [ "BUwakarwA" (* kwavawu *)
           | "varwamAnasamAnakAlaH" (* Sawq_lat *)
           | "varwamAnasamAnakAlaH-karwari" (* SAnac_lat_karwari *)
           | "BaviRyawsamAnakAlaH"  (* Sawq_lqt *) ->
              if ( toid = id1)
              then match rel with
              ["karwA" -> 1
              |"karma" -> if members_of upasarga1 rt1 sakarmaka_verbs
                          then 2 else 0 (* raise exception *)
              |"muKyakarma" 
              |"gONakarma" ->  if (members_of upasarga1 rt1 xvikarmaka1)
                               || (members_of upasarga1 rt1 xvikarmaka2)
                               then 2 else 0 (* raise exception *)
              |"karmasamAnAXikaraNam" -> 2 
              | "aXikaraNam" ->  if (upasarga1="aXi") &&
                                 ((rt1 ="SI1") || (rt1="RTA1") || (rt1="As1"))
                                 then 2 else 7
              | "-" -> 1
              | _ -> 0 (* raise exception *)
              ]
              else loop2 r2
           | "BAvaH" -> 
              if ( toid = id1)
              then match rel with
              ["karwA" -> 6 (* implement uBayaprApwO karmaNi *)
              |"karma" -> if members_of upasarga1 rt1 sakarmaka_verbs
                          then 6 else 0 (* raise exception *)
              |"muKyakarma" 
              |"gONakarma" ->  if (members_of upasarga1 rt1 xvikarmaka1)
                               || (members_of upasarga1 rt1 xvikarmaka2)
                               then 6 else 0 (* raise exception *)
              |"karmasamAnAXikaraNam" -> 6 
              | "aXikaraNam" ->  if (upasarga1="aXi") &&
                                 ((rt1 ="SI1") || (rt1="RTA1") || (rt1="As1"))
                                 then 2 else 7
              | "-" -> 1
              | _ -> 0 (* raise exception *)
              ]
              else loop2 r2
           | "pUrvakAlaH"
           | "prayojanam" ->
              if ( toid = id1)
              then match rel with
              ["karwA" -> 0 (* raise exception *)
              |"karma" -> if members_of upasarga1 rt1 sakarmaka_verbs
                          then 2 else 0 (* raise exception *)
              |"muKyakarma" 
              |"gONakarma" ->  if (members_of upasarga1 rt1 xvikarmaka1)
                               || (members_of upasarga1 rt1 xvikarmaka2)
                               then 2 else 0 (* raise exception *)
              |"karmasamAnAXikaraNam" -> 2 
              | "aXikaraNam" ->  if (upasarga1="aXi") &&
                                 ((rt1 ="SI1") || (rt1="RTA1") || (rt1="As1"))
                                 then 2 else 7
              | "-" -> 1
              | _ -> 0 (* raise exception *)
              ]
              else loop2 r2
           | "BUwakarma"
           | "varwamAnasamAnakAlaH-karmaNi" (* SAnac_lat_karmaNi *) ->
              if members_of upasarga1 rt1 akarmaka_verbs
              then 0 (*raise exception *)
              else if ( toid = id1)
              then match rel with
              ["karwA" -> 3
              |"karma" -> if members_of upasarga1 rt1 sakarmaka_verbs
                          then 1 else 0 (* raise exception *)
              |"muKyakarma" -> if (members_of upasarga1 rt1 xvikarmaka1)
                               then 2 
                               else if (members_of upasarga1 rt1 xvikarmaka2)
                               then 1 
                               else 0 (* raise exception *)
              |"gONakarma" ->  if (members_of upasarga1 rt1 xvikarmaka1)
                               then 1 
                               else if (members_of upasarga1 rt1 xvikarmaka2)
                               then 2 
                               else 0 (* raise exception *)
              |"karmasamAnAXikaraNam" -> 1
              | "aXikaraNam" ->  if (upasarga1="aXi") &&
                                 ((rt1 ="SI1") || (rt1="RTA1") || (rt1="As1"))
                                 then 2 else 7
              | "-" -> 1
              | _ -> 0 (* raise exception *)
              ]
              else loop2 r2
          | _ -> 0
          ]
        | Avykqw (id1,upasarga1,rt1,san_suff1,kqw_suff1,_,_) -> 
              if ( toid = id1)
              then match rel with
              ["karwA" ->  if not (kqw_suff1 = "kwvA" || kqw_suff1 = "lyap") 
                           then 3 else 0 (*raise exception *)
              |"karma"  -> if members_of upasarga1 rt1 sakarmaka_verbs
                           then 2 else 0 (*raise exception *)
              |"muKyakarma" 
              |"gONakarma" ->  if (members_of upasarga1 rt1 xvikarmaka1)
                               || (members_of upasarga1 rt1 xvikarmaka2)
                               then 2 else 0 (*raise exception *)
              |"karmasamAnAXikaraNam" -> 2 
              | "aXikaraNam" ->  if (upasarga1="aXi") &&
                                 ((rt1 ="SI1") || (rt1="RTA1") || (rt1="As1"))
                                 then 2 else 7
              | "-" -> 1
              | _ -> 0 (* raise exception *)
              ]
              else loop2 r2
         | _ -> loop2 r2
         ]
     ]
 | _ -> 0 (* raise exception *)
 ]
;

value get_generated_wif id upasarga rt san_suff prayoga kAla acc parses root_info_list =
   let lakAra = get_lakAra kAla in
   let root_info = get_assoc rt root_info_list in
   let feature_list  = Array.of_list (Str.bounded_split (Str.regexp_string "," ) root_info 3) in
   let per_num = if prayoga="BAve" then [|"pra" ; "eka"|]
                 else get_person_number id prayoga parses in
       let u = if upasarga = "-" then "" else "<upasarga:"^upasarga^">" in
       let s = if san_suff = "-" then "" else "<sanAxi_prawyayaH:"^san_suff^">" in
       if feature_list.(0) = "uBayapaxI" 
       then if prayoga = "karwari" 
       then
	let str1 = call_wif_gen u rt s prayoga lakAra "parasmEpaxI" per_num feature_list in
        let str11 = str1^" (pa.pa.)" in
	let str2 = call_wif_gen u rt s prayoga lakAra "AwmanepaxI" per_num feature_list in
        let str21 = str2^" (A.pa.)" in
        let str = String.concat "/" [str11; str21] in List.append acc [str]
       else
	let str = call_wif_gen u rt s prayoga lakAra "AwmanepaxI" per_num feature_list in
        let str1 = str^" (A.pa.)" in
        List.append acc [str1]
       else
          if prayoga = "karwari" then
           let str_wif_gen = call_wif_gen u rt s prayoga lakAra feature_list.(0) per_num feature_list in 
           List.append acc [str_wif_gen]
       else
          let str_wif_gen = call_wif_gen u rt s prayoga lakAra "AwmanepaxI" per_num feature_list in
        let str1 = str_wif_gen^" (A.pa.)" in
          List.append acc [str1]
;

value get_generated_words parses root_info_list=
  loop1 [] parses
  where rec loop1 acc = fun
  [ [] -> acc
  | [ m1 :: r1 ] -> match m1 with
    [ Sup (id,rt,cat,gen,num,rel,_) -> 
          if not (rel = "sup_samucciwa")
          then 
             let v1 = get_vibhakti m1 parses in
             let saha_vinA_str = if rel = "sahArWaH" then "saha" 
             else if rel = "vinArWaH" then "vinA" else "" in
             let cat1 = if not (cat = "-") then cat 
                        else get_category rt rel in
             let gen1 = get_gender m1 in 
             let str = handle_viSeRaNas id gen1 num v1 parses root_info_list in
             let acc1 = List.append acc str in
             let str1 = handle_sup_samucciwa id v1 parses in
             let acc2 = List.append acc1 str1 in
	     let str_sup_gen = call_sup_gen rt cat1 gen1 v1 num in
             
             let acc3 = List.append acc2 [str_sup_gen] in
             if str1 = [] 
             then if saha_vinA_str = "" 
             then loop1 acc3 r1 
             else loop1 (List.append acc3 [saha_vinA_str]) r1
             else  if saha_vinA_str = ""
             then loop1 (List.append acc3 ["ca"; saha_vinA_str]) r1
             else loop1 (List.append acc3 ["ca"]) r1
          else loop1 acc r1
    | Kqw (id,upasarga,rt,san_suff,kAla,gen,num,_,_) ->
          (*if not (rel = "samucciwam")
          then *)
             let kqw_suff = get_lakAra kAla in
             let v1 = get_vibhakti m1 parses in
             let root_info = get_assoc rt root_info_list in
             let feature_list  = Array.of_list (Str.bounded_split (Str.regexp_string "," ) root_info 3) in
             let u = if upasarga = "-" then "" else "<upasarga:"^upasarga^">" in
             let s = if san_suff = "-" then "" else "<sanAxi_prawyayaH:"^san_suff^">" in
             let str = handle_viSeRaNas id gen num v1 parses root_info_list in
             let acc1 = List.append acc str in
             let str_kqw_gen = if kqw_suff="SAnac_lat_karwari"
             then call_kqw_gen u rt s gen "SAnac_lat" "karwari" feature_list v1 num 
             else if kqw_suff="SAnac_lat_karmaNi"
             then call_kqw_gen u rt s gen "SAnac_lat" "karmaNi" feature_list v1 num 
             else call_kqw_gen u rt s gen kqw_suff "" feature_list v1 num in
             if kAla="BUwakarwA" && (members_of upasarga rt akarmaka_verbs || members_of upasarga rt gawyarWa_verbs || members_of upasarga rt shliR_Axi_verbs || members_of upasarga rt aaxikarma_verbs)
            then let str1_kqw_gen = call_kqw_gen u rt s gen "kwa" "" feature_list v1 num in 
            let str = String.concat "/" [str1_kqw_gen; str_kqw_gen] in
            let acc2 = List.append acc1 [str] in
            loop1 acc2 r1 
            else let acc2 = List.append acc1 [str_kqw_gen] in 
            loop1 acc2 r1 
        (*  else loop1 acc r1*)
    | Avykqw (id,upasarga,rt,san_suff,kqw_suff,rel,_) ->
         (* if not (rel = "samucciwam")
          then *)
            let kqw_suff1 = get_kqw_suff kqw_suff upasarga rel in
            let root_info = get_assoc rt root_info_list in
            let feature_list = Array.of_list (Str.bounded_split (Str.regexp "," ) root_info 3) in
         do { let u = if upasarga = "-" then "" else "<upasarga:"^upasarga^">" in
              let s = if san_suff = "-" then "" else "<sanAxi_prawyayaH:"^san_suff^">" in
	      let str_avykqw_gen = call_avykqw_gen u rt s kqw_suff1 feature_list in
              let acc1 = List.append acc [str_avykqw_gen] in
              loop1 acc1 r1
            }
         (* else loop1 acc r1*)
    | Wif (id,upasarga,rt,san_suff,prayoga,kAla,rel,to_id) ->
          let acc1 = if (rel = "samucciwa") 
                     then if (id > to_id+1)
                          then insert_ca to_id acc
                          else acc
                      else acc
          in let acc2 = get_generated_wif id upasarga rt san_suff prayoga kAla acc1 parses root_info_list
          in let acc3 = if (id = to_id+1) then List.append acc2 ["ca"] else acc2
          in loop1 acc3 r1
   | Avy (_,rt,_,_) -> do
      { let acc1 =  List.append acc [rt] in
       loop1 acc1 r1
      }
   | _ -> loop1 acc r1
   ]
  ]
;

value print_spcstring str = do { print_string str; print_string " "}
;

value print_words words = do {List.iter print_spcstring words; print_string "<@br>"}
;

value print_wordlist word = do {List.iter print_words word;print_string "\n"}
;

value print_sents words = List.iter print_wordlist words
;

(* copied from http://gallium.inria.fr/blog/on-the-nary-cartesian-product/ *)
(* n_cartesian_product [[["1"]];[["2"];["3"]]];
- : list (list string) = [["1"; "2"]; ["1"; "3"]] *)

value rec n_cartesian_product = fun
  [ [] -> [[]]
  | [x :: xs] -> if x = [] then n_cartesian_product xs (* added by Amba *)
                 else 
                 let rest = n_cartesian_product xs in 
    List.concat (List.map (fun i -> List.map (fun rs -> i@rs) rest) x)
  ]
;

value make_list words =
  loop [] words
  where rec loop acc = fun
  [ [] -> acc
  | [w :: r] -> let acc1 = acc@[[w]] in loop acc1 r
  ]
  ;

value list_of_alternate_words acc str =
 loop [[]] str 
 where rec loop acc = fun
 [ [] -> acc
 | [w :: r]  -> let words = Str.split (Str.regexp_string "/") w in
                let w_list = make_list words in
                loop (List.append acc [w_list]) r
 ]
;

value process parses = do {
  (*let offline_file = "word_gen.txt"  in
  let cho = open_out offline_file in *)
  (*List.iter print_parse_id parses;  we print the input for verification *)
  let root_info_list = load_root_info (datapath ^ "dhatu_info_chart_uBaya_wx.rem") in
   let str = get_generated_words parses root_info_list in (*do
  { List.iter print_string str ; 
    print_string "done"; *)
  let comb = list_of_alternate_words [] str in 
  let gen_sents = n_cartesian_product comb in 
  List.iter print_words gen_sents
  }
;

value main () = let parses = analyse (Stream.of_channel stdin) in
                process parses
                (*let gen_sents = process parses in do {
                print_string "generated sentences = "
                ; List.iter print_words gen_sents
                }*)
;
main()
;
