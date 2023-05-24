(* Copyright: Amba Kulkarni (2014-2023) 
 * Sanjeev Panchal (2015-2020) *)


open Paths;
open Scanf;

open Pada_structure; 

open Bank_lexer; 
module Gram = Camlp4.PreCast.MakeGram Bank_lexer 
;
open Bank_lexer.Token;

open Constraint;
open Relations;
open Aaxikarma_dhaatu;
open Afgavikaara;
open Akarmaka_dhaatu;
open Amarakosha_jaati;
open Animate;
open ApAxAna_dhaatu;
open Avy_viSeRaNam;
open BuxXyarWa_dhaatu;
open BuxXivAci;
open Bhaava_kqw; 
open GawyarWa_dhaatu;
open GuNavacana;
open GuNa_not_guNavacana;
open Intensifiers;
open KAlAXikaraNa;
open KAlAXva;
open KaraNa_dhaatu;
open KarmasamAnAXikaraNa_dhaatu;
open KarwqsamAnAXikaraNa_dhaatu;
open KriyAviSeRaNa;
open Kqxanwa;
open ManuRyaparyAya;
open ManuRyasaFjFAvAcI;
open Named_entity;
open NirXAraNa;
open Non_RaRTI;
open ParAjAwi;
open PUraNa;
open PrawyavasAnArWa_dhaatu;
open Sakarmaka_dhaatu;
open Sambandhavaaci;
open SamboXana_sUcaka;
open SaMKyeya;
open SampraxAna_dhaatu;
open Sabxakarma_dhaatu; 
open Shakaadi; 
open SabxavAci; 
open Shlish_aadi; 
open UpAXi;
open Upapada6;
open VAkyakarma_dhaatu;
open ViRayAXikaraNa;
open ViRayi;
open WaxXiwAnwa;
open XravyavAcI;
open XeSAXikaraNa;
open Xvikarmaka1_dhaatu;
open Xvikarmaka2_dhaatu;
open Non_neuter_kartaa_dhaatu;

value morphs = Gram.Entry.mk "morphs"
;

(* Global Variables *)
value finite_verb_in_sentence = ref 50; 
value iwi_pos = ref 50;  (* Assumption: A sentence has less than 50 words *)
(*value evam_pos = ref 50;*)  (* Assumption: A sentence has less than 50 words *)
value yaxA_pos = ref 50; 
value waxA_pos = ref 50; 
value yaWA_pos = ref 50; 
value waWA_pos = ref 50; 
value yawra_pos = ref 50; 
value wawra_pos = ref 50; 
value yaxi_pos = ref 50; 
value warhi_pos = ref 50; 
value waw_pos = ref 50; 
value cew_pos = ref 50;
value yawaH_pos = ref 50; 
value awaH_pos = ref 50; 
value wawaH_pos = ref 50; 
value yaxyapi_pos = ref 50;
value waWApi_pos = ref 50; 
value aWApi_pos = ref 50; 
value yAvaw_pos = ref 50;
value wAvaw_pos = ref 50; 
value kinwu_pos = ref 50; 
value apiwu_pos = ref 50; 
value paranwu_pos = ref 50; 
value aWa_pos = ref 50; 
value yaw_pos = ref 50; 
value yasmAw_pos = ref 50; 
value wasmAw_pos = ref 50; 
value hi_pos = ref 50; 
value yax_pos = ref 50; 
value wvam_pos = ref 50; 
value aham_pos = ref 50; 
value karwqsamverbs = ref 50; 
value kwvA_lyap_pos1 = ref 50; 
value kwvA_lyap_pos2 = ref 50; 
value kwvA_lyap_pos3 = ref 50; 
value manual_boundary1 = ref 50; 
value manual_boundary2 = ref 50; 
value manual_boundary3 = ref 50; 
value manual_boundary4 = ref 50; 
value manual_boundary5 = ref 50; 
value manual_boundary6 = ref 50; 
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
        "(XAwuH"; rtwithiw = IDENT; ")"; 
        "(gaNaH"; gana = IDENT; ")"; 
        "(level"; lev = INT; ")";
    ")" -> 
    (int_of_string i, int_of_string c,int_of_string m,w,r,cp,cu,upa,san,voice,la,per,vac,padi,rtwithiw,gana,int_of_string lev)
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
    (int_of_string i, int_of_string c,int_of_string m,w,kqwrt,upa,san,kp,p,rtwithiw,gana,r,cp,cu,ling,int_of_string vib,vac,int_of_string lev)
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
           "(XAwuH"; rtwithiw = IDENT; ")"; 
           "(gaNaH"; gana = IDENT; ")"; 
           "(level"; lev = INT; ")";
     ")" -> 
    (int_of_string i, int_of_string c,int_of_string m,w,r,cp,cu,upa,san,kqw,rtwithiw,gana,int_of_string lev)
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

value distinct_2 m1 m2 = match m1 with
  [ Wif (id1,_,_,_,_,pUrvapaxa1,_,_,_,_,_,_,_,_,_,_,_)
  | Kqw (id1,_,_,_,_,_,_,_,_,_,_,_,pUrvapaxa1,_,_,_,_,_)
  | Avykqw (id1,_,_,_,_,pUrvapaxa1,_,_,_,_,_,_,_)
  | AvywaxXiwa (id1,_,_,_,_,pUrvapaxa1,_,_,_)
  | Sup (id1,_,_,_,_,pUrvapaxa1,_,_,_,_,_)
  | Avy (id1,_,_,_,_,pUrvapaxa1,_,_)
  | WaxXiwa (id1,_,_,_,_,pUrvapaxa1,_,_,_,_,_,_) -> match m2 with
  	[ Wif (id2,_,_,_,_,pUrvapaxa2,_,_,_,_,_,_,_,_,_,_,_)
  	| Kqw (id2,_,_,_,_,pUrvapaxa2,_,_,_,_,_,_,_,_,_,_,_,_)
 	| Avykqw (id2,_,_,_,_,pUrvapaxa2,_,_,_,_,_,_,_)
 	| AvywaxXiwa (id2,_,_,_,_,pUrvapaxa2,_,_,_)
 	| Sup (id2,_,_,_,_,pUrvapaxa2,_,_,_,_,_)
 	| Avy (id2,_,_,_,_,pUrvapaxa2,_,_)
 	| WaxXiwa (id2,_,_,_,_,_,pUrvapaxa2,_,_,_,_,_) -> 
                if not (id1 = id2) && not (pUrvapaxa1="y") && not (pUrvapaxa2 = "y")
                then True
                else False
        ]
   ]
;

value distinct_3 m1 m2 m3 =   distinct_2 m1 m2 
                           && distinct_2 m1 m3 
                           && distinct_2 m2 m3
;

value compound_pUrvapaxa_uwwarapaxa m1 m2 = match m1 with
  [ Wif (id1,cid1,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_)
  | Kqw (id1,cid1,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_)
  | Avykqw (id1,cid1,_,_,_,_,_,_,_,_,_,_,_)
  | AvywaxXiwa (id1,cid1,_,_,_,_,_,_,_)
  | Sup (id1,cid1,_,_,_,_,_,_,_,_,_)
  | Avy (id1,cid1,_,_,_,_,_,_)
  | WaxXiwa (id1,cid1,_,_,_,_,_,_,_,_,_,_) -> match m2 with
  	[ Wif (id2,cid2,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_)
  	| Kqw (id2,cid2,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_)
 	| Avykqw (id2,cid2,_,_,_,_,_,_,_,_,_,_,_)
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

value no_boundary_crossing2 id1 id2 boundary =
      if boundary < 50 
      then if    (id1 <= boundary && id2 <= boundary) 
              || (id1 >= boundary && id2 >= boundary) 
           then True
           else False
      else True
;

value no_boundary_crossing_hi id1 id2 hi_pos =
  if ((id1=hi_pos-1)  && (id2 < hi_pos)) then False else True
(* In the case of hi, the word previous to hi should be related to the words after hi, and hot before hi. 
ewax icCAmi aham Srowum param kOwUhalam hi me 

This condition is not correct.
For example, kupyawi ekaH hi a-lABawaH, in this example ekaH is related to kupyawi.*)
;

value no_boundary_crossing1 id1 id2 =
        no_boundary_crossing2 id1 id2 kinwu_pos.val
    &&  no_boundary_crossing2 id1 id2 apiwu_pos.val
    &&  no_boundary_crossing2 id1 id2 paranwu_pos.val
    (*&&  no_boundary_crossing2 id1 id2 aWa_pos.val  We can have aWa in between in a single sentence *)
    &&  no_boundary_crossing2 id1 id2 wasmAw_pos.val
    &&  no_boundary_crossing2 id1 id2 yawaH_pos.val
    (* &&  no_boundary_crossing2 id1 id2 wawaH_pos.val *)
    (* &&  no_boundary_crossing_hi id1 id2 hi_pos.val -- condition removed, see the counter example below the definition of this function *)
    &&  (no_boundary_crossing2 id1 id2 wawra_pos.val || yawra_pos.val = 50)
    &&  no_boundary_crossing2 id1 id2 waWApi_pos.val
    &&  no_boundary_crossing2 id1 id2 warhi_pos.val
    (* &&  (no_boundary_crossing2 id1 id2 waw_pos.val || (yaw_pos.val = 50 && cew_pos.val = 50 && yaxi_pos.val = 50))
    &&  (no_boundary_crossing2 id1 id2 yaw_pos.val || waw_pos.val = 50)
          yaw creates a problem, since it is also used with waw, and in such cases it does not serve as a boundary, e..g. saH yaw jAnAwi waw SiSyAya vaxawi *)
    &&  (no_boundary_crossing2 id1 id2 waxA_pos.val || yaxA_pos.val = 50)
    &&  (no_boundary_crossing2 id1 id2 waWA_pos.val || yaWA_pos.val = 50)
    &&  no_boundary_crossing2 id1 id2 manual_boundary1.val
    &&  no_boundary_crossing2 id1 id2 manual_boundary2.val
    &&  no_boundary_crossing2 id1 id2 manual_boundary3.val
    &&  no_boundary_crossing2 id1 id2 manual_boundary4.val
    &&  no_boundary_crossing2 id1 id2 manual_boundary5.val
    &&  no_boundary_crossing2 id1 id2 manual_boundary6.val

     (* else if id1 < yaw_pos.val && id2 > yaw_pos.val then False
yaw is ambiguous. It can be a pronoun as well. *)
      (* else if id1 < iwi_pos.val && id2 > iwi_pos.val then False 
 mawwaH eva iwi vixXi; mawwaH is connected to vixXi, intervenned by iwi. *)
      (*else if id1 < evam_pos.val && id2 > evam_pos.val then False*)
 (*yaH buxXiwvAw wawra kevalam AwmAnam paSyawi ...*)
(* If there is waw, then there should be either yaw or cew or yaxi, else it is not a boundary marker *)
(* For yaxi ... waw refer to BhG 1.46 *)
 (* This condition is added to account for the boundary crossing with only waxA as in
    xqRtvA wu pANdavAnIkam vyUDam xuryoXanaswaxA AcAryam upasafgamya vacanam abravIw BhG1.2 *)
;

value no_boundary_crossing_kwvA_lyap id1 id2 =
        no_boundary_crossing2 id1 id2 kwvA_lyap_pos1.val 
    &&  no_boundary_crossing2 id1 id2 kwvA_lyap_pos2.val 
    &&  no_boundary_crossing2 id1 id2 kwvA_lyap_pos3.val 
;


value no_boundary_crossing_with_iwi id1 id2 text_type =
  if text_type="Prose" then
           no_boundary_crossing1 id1 id2
       &&  no_boundary_crossing2 id1 id2 iwi_pos.val 
       &&  no_boundary_crossing_kwvA_lyap id1 id2
   else if text_type="Sloka" then
    if  no_boundary_crossing1 id1 id2
    (*&&  no_boundary_crossing_kwvA_lyap id1 id2 -- counter example: आदिश्यते भूधरतां अवेक्ष्य कृष्णेन देह-उद्वहनाय शेषः
*)
   (*In the case of Sloka, we may have a verse starting with yaw and ending with waw, or some words after waw without any verb; as in
yaw SreyaH syAw niSciwaM brUhi waw me ; here there is no crossing, wince yaw waw do not come under crossing*)
   then True 
   else False 
  else True (* text_type does not match ; Should produce error in sch case *)
;

value no_boundary_crossing_except_kwvA id1 id2 text_type =
  if text_type="Prose" then
           no_boundary_crossing1 id1 id2
       &&  no_boundary_crossing2 id1 id2 iwi_pos.val 
   else if text_type="Sloka" then
    if no_boundary_crossing1 id1 id2
   (*In the case of Sloka, we may have a verse starting with yaw and ending with waw, or some words after waw without any verb; as in
yaw SreyaH syAw niSciwaM brUhi waw me ; here there is no crossing, wince yaw waw do not come under crossing*)
   then True 
   else False 
  else True (* text_type does not match ; Should produce error in such case *)
;
value no_boundary_crossing id1 id2 text_type =
  if text_type="Prose" then
      no_boundary_crossing1 id1 id2
   && no_boundary_crossing_kwvA_lyap id1 id2
  (* else if text_type="Sloka" then
      no_boundary_crossing1 id1 id2
   In the case of Sloka, we may have a verse starting with yaw and ending with waw, or some words after waw without any verb; as in
yaw SreyaH syAw niSciwaM brUhi waw me
  else False *)
  else True
;

value print_relation cho = fun
  [ Relation (i1 , i2 , i3 , i4 , i5 , i6, i7, i8, i9)  -> do
         { output_string cho (string_of_int i1); output_string cho " "
         ; output_string cho (string_of_int i2); output_string cho " "
         ; output_string cho (string_of_int i3); output_string cho " "
         ; output_string cho (string_of_int (encode i4)); output_string cho " "
         ; output_string cho (string_of_int i5); output_string cho " "
         ; output_string cho (string_of_int i6); output_string cho " "
         ; output_string cho (string_of_int i7); output_string cho " "
         ; output_string cho i4; output_string cho " "
         ; output_string cho i8; output_string cho " "
         ; output_string cho (string_of_int i9); output_string cho "\n"
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
   [ Relation (id1,cid1,mid1,rel,id2,cid2,mid2,rl,dist) -> let erel = encode rel in
          if erel >= 4000  && erel < 5000 then [Relationc (id1,cid1,mid1,(erel + id1),id2,cid2,mid2,dist)]
          else if erel >= 2000  && erel < 4000 then [Relationc (id1,cid1,mid1,(erel + id2),id2,cid2,mid2,dist)]
          else [Relationc (id1,cid1,mid1,erel,id2,cid2,mid2,dist)]
   ]
 ;
 
value rec mk_tuple_lst acc = fun
   [ [] -> List.sort_uniq compare acc
   | [r :: l ] -> let tpl = mk_tuple r in
                  let acc1 = tpl@acc in
                  mk_tuple_lst acc1 l
   ]
;

value pronoun3 rt = (rt="yax" || rt="wax" || rt="ewax" || rt="ixam" || rt="sarva" || rt="sarvA" || rt="svIya" || rt="svIyA" || rt="kim" || rt="Bavaw" || rt="uBa"|| rt="uBA" || rt="yAvaw" || rt = "wAvaw" || rt = "axas" || rt="kiFciw" || rt="kiFcana" || rt="Awman" || rt="sva" || rt="svA" || rt="anya" || rt = "anyA" || rt="IxqS" || rt="kIxqS" || rt="kIxqSa" || rt = "IxqSa") 
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
(* value populate_from file trie =
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
    
value members_of rt upasarga trie =
       if upasarga = "X" 
       then member_of rt trie
       else member_of (upasarga^"_"^rt) trie
;

value amarakosha_jAwi = build_trie amarakosha_jaati_list
;

value kAlAXikaraNas = build_trie kAlAXikaraNa_list
;

value kriyAviSeRaNas = build_trie kriyAviSeRaNa_list
;

value karaNa_verbs = build_trie karaNa_XAwu_list
;

value sampraxAna_verbs = build_trie sampraxAna_XAwu_list
;

value animate_nouns = build_trie animate_list
;

value apAxAna_verbs = build_trie apAxAna_XAwu_list
;

value kAlAXikaraNas = build_trie kAlAXikaraNa_list
;

value xeSAXikaraNas = build_trie xeSAXikaraNa_list
;

value kAlAXvas = build_trie kAlAXva_list
;

value sakarmaka_verbs =  build_trie sakarmaka_XAwu_list
;

value xvikarmaka1 = build_trie xvikarmaka_XAwu_list1
;

value xvikarmaka2 = build_trie xvikarmaka_XAwu_list2
;

value aaxikarma_verbs =  build_trie aaxikarma_XAwu_list
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

value shliR_Axi_verbs = build_trie shlish_aadi_list
;

value akarmaka_verbs = build_trie akarmaka_XAwu_list
;

value vAkyakarma_verbs = build_trie vAkyakarma_XAwu_list
;

value shakAxi = build_trie shakaadi_list

(* Ocaml does not allow variables starting with Caps. Hence SakAxi -> shakAxi *)
;

value karwqsamAnAXikaraNa_verbs = build_trie karwqsamAnAXikaraNa_XAwu_list
;

value karmasamAnAXikaraNa_verbs = build_trie karmasamAnAXikaraNa_XAwu_list
;

value buxXivAci_nouns = build_trie buxXivAci_list
;

value shabxavAci_nouns = build_trie shabdavaaci_list
;

value bhaavavaaci_kqw = build_trie bhaava_kqw_list
;

value samboXana_sUcaka = build_trie samboXana_sUcaka_list
;

value avy_viSeRaNam_list = build_trie avy_viSeRaNam_list
;

value intensifiers_list = build_trie intensifiers_list
;

value viRayAXikaraNa_nouns = build_trie viRayAXikaraNa_list
;

value saMKyeya = build_trie saMKyeya_list
;

value pUraNa = build_trie pUraNa_list
;

value guNavacana = build_trie guNavacana_list
;

value guNa_not_guNavacana = build_trie guNa_not_guNavacana_list
;

 (* kqxanwa list is introduced, since we still do not have an exhastive kqxanwa analyser ; we need it for viSeRaNas and RaRTI sambanXa*)

value kqxanwas = build_trie kqxanwa_list
;

 (* waxXiwAnwa_list is introduced, since we still do not have an exhastive waxXXiwa analyser ; we need it for viSeRaNas *)
value taddhitaantas = build_trie waxXiwAnwa_list
;

value sambanXavAcI = build_trie sambanXavAci_list
;

value xravyavAcI = build_trie xravyavAci_list
;

value manuRyaparyAya = build_trie manuRyaparyAya
;

value manuRyasaFjFAvAcI = build_trie manuRyasaFjFAvAci
;

value upAXi = build_trie upAXi_list
;

value viRayi_list = build_trie viRayi_list
;

value non_RaRTI_list = build_trie non_RaRTI_list
;

value named_entity = build_trie named_entity_list
;

value upapada6_list = build_trie upapada6_list
;

value non_neuter_kartaa_dhaatu_list = build_trie non_neuter_kartaa_dhaatu_list
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
value kv_or_spl_aXi id1 cid1 mid1 id2 cid2 mid2 word text_type = 
          let d = if id1 > id2 then id1-id2 else id2-id1 in
          if no_boundary_crossing_with_iwi id1 id2 text_type
          then if member_of (word^" avy") kriyAviSeRaNas
          then [ Relation (id1,cid1,mid1,"kriyAviSeRaNam",id2,cid2,mid2,"100.1",d)] 
          else if member_of word kAlAXikaraNas 
          then [ Relation (id1,cid1,mid1,"kAlAXikaraNam",id2,cid2,mid2,"100.2",d) ]
          else if member_of word xeSAXikaraNas 
          then [ Relation (id1,cid1,mid1,"xeSAXikaraNam",id2,cid2,mid2,"100.3",d) ]
          else []
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
value supAxi_vIpsa id1 id2 cid1 cid2 mid1 mid2 word1 word2 rt1 rt2 vac1 vac2 gen1 gen2 vib1 vib2 rlid =
   let d = if id1 > id2 then id1-id2 else id2-id1 in
   if    id1=previous id2 
   then if  word1=word2
          && noun_agreement_vibh vac1 vac2 gen1 gen2 vib1 vib2
        then [ Relation (id1,cid1,mid1,"vIpsA",id2,cid2,mid2,rlid,d)]
         else if  rt1 = rt2
              then if  vib1 = 5 && vib2 = 2
                   then [ Relation (id1,cid1,mid1,"apAxAnam_vIpsA",id2,cid2,mid2,rlid,d)]
                   else if vib1 = 3 && vib2 = 2
                        then [ Relation (id1,cid1,mid1,"karaNam_vIpsA",id2,cid2,mid2,rlid,d)]
                        else []
              else []
   else []
;

value handle_sp_compounds id1 cid1 mid1 id2 cid2 mid2 rt1 word1 pUrvapaxa1 uwwarapaxa1 lifgam1 = 

       if uwwarapaxa1="y" then
       let d = if id1 > id2 then id1-id2 else id2-id1 in
       if rt1="pUrvaka" && lifgam1="napuM" 
       then [ Relation (id1,cid1,mid1,"kriyAviSeRaNam",id2,cid2,mid2,"1.1", d)]
       else if rt1="arWa" 
       then [ Relation (id1,cid1,mid1,"prayojanam1",id2,cid2,mid2,"1.5", d)]
       else if rt1="ananwaram" 
       then [ Relation (id1,cid1,mid1,"kAlAXikaraNam",id2,cid2,mid2,"1.6", d)]
       else if word1="-sahiwaH" 
       then [ Relation (id1,cid1,mid1,"sahArWaH",id2,cid2,mid2,"1.6a", d)]
       else if rt1="saxqSa" 
       then [ Relation (id1,cid1,mid1,"viSeRaNam",id2,cid2,mid2,"1.6b", d)]
       else if rt1="safkASa" 
       then [ Relation (id1,cid1,mid1,"viSeRaNam",id2,cid2,mid2,"1.6c", d)]
       else if ((rt1="pramuKa") || (rt1="pUrveNa"))
       then [ Relation (id1,cid1,mid1,"kriyAviSeRaNam",id2,cid2,mid2,"1.2", d)]
       else []
       else []

   (* else if (word1="yaWA") && lifgam1="napuM"
      then [ Relation (id1,cid1,mid1,"kriyAviSeRaNam",id2,cid2,mid2,"1.4", d)] -- Need to handle in new system where components of compound are separated 
      else if word1="kqwe" && compound word1 uwwarapaxa1
      then [ Relation (id1,cid1,mid1,"prayojanam",id2,cid2,mid2,"1.33c", d)]
      else if (pUrvapaxa1="sa") && lifgam1="napuM"
      then [ Relation (id1,cid1,mid1,"kriyAviSeRaNam",id2,cid2,mid2,"1.30c", d)] -- Need to handle in new system where components of compound are separated
         Need example for sa- as a kriyAviSeRaNam (e.g. sa-Axaram)
         sa-Saram cApam - is not a kriyAviSeRaNam 
   *)
;

value is_human rt = member_of rt upAXi
                   || member_of rt sambanXavAcI
                   || member_of rt manuRyaparyAya
                   || member_of rt manuRyasaFjFAvAcI
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
value wifkarwA_karma m1 m2 text_type = match m2 with
  [ Wif (id2,cid2,mid2,_,rt2,_,_,upasarga2,sanAxiH2,prayogaH2,_,puruRaH2,vacanam2,_,_,_,_) ->
     match m1 with
     [ WaxXiwa (id1,cid1,mid1,word1,rt1,pUrvapaxa1,uwwarapaxa1,_,lifgam1,viBakwiH1,vacanam1,_)
     | Kqw (id1,cid1,mid1,word1,_,_,_,_,_,_,_,rt1,pUrvapaxa1,uwwarapaxa1,lifgam1,viBakwiH1,vacanam1,_)
     | Sup (id1,cid1,mid1,word1,rt1,pUrvapaxa1,uwwarapaxa1,lifgam1,viBakwiH1,vacanam1,_) -> 
       let d = if id1 > id2 then id1-id2 else id2-id1 in
       if prose_order id1 id2 text_type
       && no_boundary_crossing_except_kwvA id1 id2 text_type
       then match viBakwiH1 with
       [ 1 ->  if aBihiwa rt1 vacanam1 vacanam2 puruRaH2
           then match prayogaH2 with
           [ "karwari" -> let rel = handle_sp_compounds id1 cid1 mid1 id2 cid2 mid2 rt1 word1 pUrvapaxa1 uwwarapaxa1 lifgam1 in
                          if not (rel = []) then rel 
			  else match sanAxiH2 with
                 [ "Nic" ->  [ Relation (id1,cid1,mid1,"prayojakakarwA",id2,cid2,mid2,"2.1", d)]  
                      (* aBihiwe praWamA  - xevaxawwaH:prayojakakarwA pATayawi*)
                 | _     ->  if not (member_of rt1 intensifiers_list) 
                              (* && not (member_of word1 upapada6_list) 
                               * Why is this condition needed? It creates problem with sentences such as suKam prINayawi *)
                             && not (member_of (word1^" "^string_of_int(viBakwiH1)) kriyAviSeRaNas)
                             then if members_of rt2 upasarga2 karwqsamAnAXikaraNa_verbs
                             then [ Relation (id1,cid1,mid1,"karwA_be_verbs",id2,cid2,mid2,"2.2", d)]  
                             else if members_of rt2 upasarga2 non_neuter_kartaa_dhaatu_list 
                                  then if not (lifgam1="napuM") then
				    [ Relation (id1,cid1,mid1,"karwA",id2,cid2,mid2,"2.2a", d)]  
				  else []
				  else  [ Relation (id1,cid1,mid1,"karwA",id2,cid2,mid2,"2.2b", d)]  
                             else []
                      (* aBihiwe praWamA -xevaxawwaH:karwA paTawi*)
                 ]
           |"karmaNi" -> let rel = handle_sp_compounds id1 cid1 mid1 id2 cid2 mid2 rt1 word1 pUrvapaxa1 uwwarapaxa1 lifgam1 in
                          if not (rel = []) then rel 
                          else match verb_type rt2 upasarga2 with
                 [ "xvikarmaka2" -> [ Relation (id1,cid1,mid1,"muKyakarma",id2,cid2,mid2,"2.3", d)]  
                         (*praXAne nIhqkqRvah  - ajA:muKyakarma grAmaM nIyawe *)
                 | "xvikarmaka1" -> [ Relation (id1,cid1,mid1,"gONakarma",id2,cid2,mid2,"2.4", d)]  
                         (*apraXAne xuhAxinAm.. - gOH xugXaM:gONakarma xuhyawe *)
                 | _ -> match sanAxiH2 with
                    ["Nic" ->  match verb_type rt2 upasarga2 with
                           [ "gawi" -> [ Relation (id1,cid1,mid1,"prayojyakarwA",id2,cid2,mid2,"2.5", d)]  
                           (*gawibuxXi.. -> karma; aBihiwa   yajFaxawwena xevaxawwaH:prayojyakarwA  grAmaM  gamyawe *)
                           | "buxXi"
                           | "prawyavasAnArWa" 
                           | "Sabxakarma" ->
                                   [ Relation (id1,cid1,mid1,"prayojyakarwA",id2,cid2,mid2,"2.6", d)  
                                       (*yajFaxawwena  xevaxawwaH PalaM KAxyawe *)
                                   ; Relation (id1,cid1,mid1,"karma",id2,cid2,mid2,"2.7", d) 
                                   ]
                           (*| "sakarmaka"  -> [ Relation (id1,cid1,mid1,"prayojyakarwA",id2,cid2,mid2,"1.8", d)]  *)
                           | "sakarmaka"  -> [ Relation (id1,cid1,mid1,"karma",id2,cid2,mid2,"2.8", d)]
                                 (* aBihiwe praWamA  -yajFaxawwena  xevaxawwena  oxanam  pAcyawe *)
                           | "akarmaka" -> [ Relation (id1,cid1,mid1,"prayojyakarwA",id2,cid2,mid2,"2.9", d)]  
                           | _ -> []
                           ]
                   | _ -> if members_of rt2 upasarga2 sakarmaka_verbs
                       then [ Relation (id1,cid1,mid1,"karma",id2,cid2,mid2,"2.10", d)]  
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
                     | "xvikarmaka1" -> [ Relation (id1,cid1,mid1,"karma",id2,cid2,mid2,"2.11", d)]  
                                 (* karmaNi xviwIyA - yajFaxawwaH xevaxawwena rAjAnaM vasuXAM yAcayawi  *)
                     | "akarmaka" -> let rel = handle_sp_compounds id1 cid1 mid1 id2 cid2 mid2 rt1 word1 pUrvapaxa1 uwwarapaxa1 lifgam1 in
				     if (not (rel=[])) then rel 
                                     (* else if (uwwarapaxa1=pUrvapaxa1 ) || (pUrvapaxa1="a")
		                     then [ Relation (id1,cid1,mid1,"karma",id2,cid2,mid2,"2.4", d)]  *)
                                     else [ Relation (id1,cid1,mid1,"prayojyakarwA",id2,cid2,mid2,"2.12", d)]  
                             (*gawibuxXi.. elevates prayojya_karwA to karma, hence xviwIyA *)
                     | "buxXi"
                     | "Sabxakarma"
		     | "gawi"
                     | "prawyavasAnArWa" -> let rel = handle_sp_compounds id1 cid1 mid1 id2 cid2 mid2 rt1 word1 pUrvapaxa1 uwwarapaxa1 lifgam1 in
			     if (not (rel=[])) then rel 
                             else [ Relation (id1,cid1,mid1,"prayojyakarwA",id2,cid2,mid2,"2.13", d) (* '' *) 
                                  ; Relation (id1,cid1,mid1,"karma",id2,cid2,mid2,"2.14", d) (* karmaNi xviwIyA *) 
                                  ]
                     | "sakarmaka" (* not gawibuxXi && not prawyavasAnArWa_verbs *) ->
                             let rel = handle_sp_compounds id1 cid1 mid1 id2 cid2 mid2 rt1 word1 pUrvapaxa1 uwwarapaxa1 lifgam1 in
			     if (not (rel=[])) then rel 
                                  (*else if (uwwarapaxa1=pUrvapaxa1 ) || (pUrvapaxa1="a")
		                    then [ Relation (id1,cid1,mid1,"prayojyakarwA",id2,cid2,mid2,"1.24", d)]  *)
			     else if rt2="hq" || rt2= "kq3"   (* hqkroranyawarasyAm 1.4.53 *)
                             then  [ Relation (id1,cid1,mid1,"prayojyakarwA",id2,cid2,mid2,"2.13", d) 
                                   ; Relation (id1,cid1,mid1,"karma",id2,cid2,mid2,"2.14", d) (* karmaNi xviwIyA *) 
                                   ]
                             else [Relation (id1,cid1,mid1,"karma",id2,cid2,mid2,"2.15" , d)] 
				(* rAmaH xevaxawwena annaM pAcayawi *)
                             (* This is Nic, so it can only be a prayojyakarwA e.g. gqhiNI puwrAya moxakam paryaveRayaw   **** This is wrong. paryaveRayaw has Nic due to curAxi gaNa. It is svArWa Nic *) 
                     | _ -> []
                     ]
                | _ -> if    not (member_of (word1 ^ " " ^ string_of_int viBakwiH1) kriyAviSeRaNas) 
                          && not (member_of word1 kAlAXvas)
                       then match verb_type rt2 upasarga2 with
                      [ "xvikarmaka1" 
                      | "xvikarmaka2" -> 
                             let rel = handle_sp_compounds id1 cid1 mid1 id2 cid2 mid2 rt1 word1 pUrvapaxa1 uwwarapaxa1 lifgam1 in
			     if (not (rel=[])) then rel 
                             else (*if member_of rt1 manuRyasaFjFAvAcI  || member_of rt1 prANivAcI then*)
                                  [ Relation (id1,cid1,mid1,"gONakarma",id2,cid2,mid2,"2.16" , d)
                              (* karmaNi xviwIyA  - rAjAnaM vasuXAM yAcawe*)
                                  ; Relation (id1,cid1,mid1,"muKyakarma",id2,cid2,mid2,"2.17" , d) 
                              (* karmaNi xviwIyA - gAM xogXi payaH *)
                                  ]
			      (*else []*)
                      | "gawi"
                      | "buxXi" 
                      | "Sabxakarma" 
                      | "prawyavasAnArWa"
                      | "sakarmaka" -> if rt2="yaj1"  && text_type = "Vedic"
                                       then [ Relation (id1,cid1,mid1,"sampraxAnam",id2,cid2,mid2,"2.18", d)] (* yajeH sampraxAnasya karma sajFA *)
				       else let rel = handle_sp_compounds id1 cid1 mid1 id2 cid2 mid2 rt1 word1 pUrvapaxa1 uwwarapaxa1 lifgam1 in
			               if (not (rel=[])) then rel 
                                       else if (verb_type rt2 upasarga2 = "gawi") && (word1="kim")
				       then [] (* kim rAmaH gacCawi; here kim is not a karma of gacCawi*)
				       else if not (member_of word1 kAlAXikaraNas) && not (member_of word1 xeSAXikaraNas)
                                       then [ Relation (id1,cid1,mid1,"karma",id2,cid2,mid2,"2.19" , d)] (* karmaNi xviwIyA *) 
                                       else []
                      | "akarmaka" ->  handle_sp_compounds id1 cid1 mid1 id2 cid2 mid2 rt1 word1 pUrvapaxa1 uwwarapaxa1 lifgam1
                                       (* else if (uwwarapaxa1=pUrvapaxa1 ) || (pUrvapaxa1="a")
		                       then [ Relation (id1,cid1,mid1,"karma",id2,cid2,mid2,"2.4", d)] *)
                      | _ -> []
                      ]
                     else []
                  ]
           | "karmaNi" -> match verb_type rt2 upasarga2 with 
                  [ "xvikarmaka1" -> [ Relation (id1,cid1,mid1,"muKyakarma",id2,cid2,mid2,"2.20", d)] 
                          (* aprAXAne xuhAxi - gOH  xuhyawe xugXaM  *)
                  | "xvikarmaka2" -> [ Relation (id1,cid1,mid1,"gONakarma",id2,cid2,mid2,"2.21", d)] 
                          (* praXAne nI..  ajA nIyawe grAmaM *)
                  | _ -> match sanAxiH2 with
                     ["Nic" -> match verb_type rt2 upasarga2 with
                          [ "gawi" -> [ Relation (id1,cid1,mid1,"karma",id2,cid2,mid2,"2.22" , d)] (* karmaNi xviwIyA *)
                          | "buxXi"
                          | "Sabxakarma"
                          | "prawyavasAnArWa" -> 
                                  [ Relation (id1,cid1,mid1,"prayojyakarwA",id2,cid2,mid2,"2.23" , d) 
                                  ; Relation (id1,cid1,mid1,"karma",id2,cid2,mid2,"2.24", d) (* anukwakarmaNi xviwIyA *) 
                                  ]
                          (* | "sakarmaka" -> [ Relation (id1,cid1,mid1,"karma",id2,cid2,mid2,"1.37a", d )] (* karmaNi xviwIyA *) *)
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
                      [ "karwari" -> [ Relation (id1,cid1,mid1,"prayojyakarwA",id2,cid2,mid2,"2.25" , d)]
                             (* karwq_karaNayoH wqwIyA - yajFaxawwaH xevaxawwena annaM pAcayawi *)
                      | "karmaNi" -> 
                             [ Relation (id1,cid1,mid1,"prayojakakarwA",id2,cid2,mid2,"2.26", d ) 
                             ; Relation (id1,cid1,mid1,"prayojyakarwA",id2,cid2,mid2,"2.27" , d)  
                             (* karwqkaraNayoH wqwIyA - yajFaxawwena  xevaxawwena annaM pAcyawe *)
                             ]
                      (*| _ -> if prayogaH2 = "karmaNi" 
                         then [ Relation (id1,cid1,mid1,"prayojakakarwA",id2,cid2,mid2,"1.43" , d)] (* karwqkaraNayoH wqwIyA *) 
                         else [] *)
                      | _ -> []
                      ]
                | "akarmaka" ->  match prayogaH2 with
                      [ "karwari" -> []
                      | _ ->  [ Relation (id1,cid1,mid1,"prayojakakarwA",id2,cid2,mid2,"2.28", d )]
                      ]
                | _ ->  [ Relation (id1,cid1,mid1,"karwA",id2,cid2,mid2,"2.29", d )] (* karwq_karaNayoH_wqwIyA *) 
                ]
        | _ ->  if (prayogaH2 = "karmaNi" || prayogaH2 = "BAve")
                  && not (member_of word1 kAlAXvas)
            then [ Relation (id1,cid1,mid1,"karwA",id2,cid2,mid2,"2.30", d )] (* karwqkaraNayoH wqwIyA *) 
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

value rlwifkarwA_karma m1 m2 text_type = match m2 with
  [ Wif (id2,cid2,mid2,_,rt2,_,_,upasarga2,sanAxiH2,prayogaH2,_,puruRaH2,vacanam2,_,_,_,_) ->
     match m1 with
     [ WaxXiwa (id1,cid1,mid1,word1,rt1,pUrvapaxa1,uwwarapaxa1,_,lifgam1,viBakwiH1,vacanam1,_)
     | Sup (id1,cid1,mid1,word1,rt1,pUrvapaxa1,uwwarapaxa1,lifgam1,viBakwiH1,vacanam1,_) -> 
		wifkarwA_karma m1 m2 text_type
     | Kqw (id1,cid1,mid1,word1,_,_,_,kqw_prawyayaH1,_,_,_,rt1,pUrvapaxa1,uwwarapaxa1,lifgam1,viBakwiH1,vacanam1,_) ->
		if not (kqw_prawyayaH1 = "wavyaw" || kqw_prawyayaH1 = "anIyar")
		then wifkarwA_karma m1 m2 text_type
		else []
     | _ -> []
     ]
  | _ -> []
  ]
;

value rlafgavikAra m1 m2 text_type = match m2 with
   [ Sup (id2,cid2,mid2,_,rt2,_,_,_,_,_,_)
   | Kqw (id2,cid2,mid2,_,_,_,_,_,_,_,_,rt2,_,_,_,_,_,_)
   | WaxXiwa (id2,cid2,mid2,_,rt2,_,_,_,_,_,_,_) -> 
      match m1 with
      [ Sup (id1,cid1,mid1,_,rt1,_,_,_,viBakwiH1,_,_)
      | Kqw (id1,cid1,mid1,_,_,_,_,_,_,_,_,rt1,_,_,_,viBakwiH1,_,_)
      | WaxXiwa (id1,cid1,mid1,_,rt1,_,_,_,_,viBakwiH1,_,_) ->
       let  d12 = if id1 > id2 then id1-id2 else id2-id1 in
       if   rt2 = get_assoc rt1 afgavikaara_list 
         && (id1 = previous id2 || id1 = next id2)
         && viBakwiH1 = 3
       then [ Relation (id1,cid1,mid1,"afgavikAraH",id2,cid2,mid2,"11.1",d12)] 
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
 [ Avy (id2,cid2,mid2,word2,_,_,_,_) -> 
   if word2="ca" then match m3 with
   [ Wif (id3,cid3,mid3,_,rt3,_,_,upasarga3,sanAxiH3,prayogaH3,_,puruRaH3,vacanam3,_,_,_,_) ->
     match m1 with
     [ WaxXiwa (id1,cid1,mid1,word1,rt1,pUrvapaxa1,uwwarapaxa1,_,_,viBakwiH1,_,_)
     | Kqw (id1,cid1,mid1,word1,_,_,_,_,_,_,_,rt1,pUrvapaxa1,uwwarapaxa1,_,viBakwiH1,_,_)
     | Sup (id1,cid1,mid1,word1,rt1,pUrvapaxa1,uwwarapaxa1,_,viBakwiH1,_,_) -> 
       let  d13 = if id1 > id3 then id1-id3 else id3-id1 in
       if   prose_order id1 id3 text_type && id2 = next id1
         && (  (aBihiwa rt1 "bahu" vacanam3 puruRaH3)
             || (aBihiwa rt1 "xvi" vacanam3 puruRaH3))
       then match viBakwiH1 with
       [ 1 -> match prayogaH3 with
           [ "karwari" -> match sanAxiH3 with
                 [ "Nic" -> [ Relation (id1,cid1,mid1,"prayojakakarwA",id3,cid3,mid3,"2.31", d13)]  
                      (* aBihiwe praWamA  - xevaxawwaH:prayojakakarwA pATayawi*)
                 | _     -> [ Relation (id1,cid1,mid1,"karwA",id3,cid3,mid3,"2.32", d13)]
                      (* rAmaH sIwA ca gacCawaH; rAmaH sIwA ramA ca gacCanwi *)
                 ]
           |"karmaNi" -> match verb_type rt3 upasarga3 with
                 [ "xvikarmaka2" -> [ Relation (id1,cid1,mid1,"muKyakarma",id3,cid3,mid3,"2.33", d13)]  
                         (*praXAne nIhqkqRvah  - ajA:muKyakarma grAmaM nIyawe *)
                 | "xvikarmaka1" -> 
                       [ Relation (id1,cid1,mid1,"gONakarma",id3,cid3,mid3,"2.34", d13)]  
                         (*apraXAne xuhAxinAm.. - gOH xugXaM:gONakarma xuhyawe *)
                 | _ -> match sanAxiH3 with
                    ["Nic" ->  match verb_type rt3 upasarga3 with
                           [ "gawi" -> 
                                [ Relation (id1,cid1,mid1,"prayojyakarwA",id3,cid3,mid3,"2.35", d13)]  
                           (*gawibuxXi.. -> karma; aBihiwa   yajFaxawwena xevaxawwaH:prayojyakarwA  grAmaM  gamyawe *)
                           | "buxXi"
                           | "Sabxakarma"
                           | "prawyavasAnArWa"  -> 
                                   [ Relation (id1,cid1,mid1,"prayojyakarwA",id3,cid3,mid3,"2.36", d13)  
                                       (*yajFaxawwena  xevaxawwaH PalaM KAxyawe *)
                                   ; Relation (id1,cid1,mid1,"karma",id3,cid3,mid3,"2.37", d13) 
                                   ]
                           | "sakarmaka"  -> 
                                   [ Relation (id1,cid1,mid1,"karma",id3,cid3,mid3,"2.38", d13)]  
                                 (* aBihiwe praWamA  -yajFaxawwena  xevaxawwaM  PalaM  KAxyawe *)
                           | _ -> []
                           ]
                   | _ -> if members_of rt3 upasarga3 sakarmaka_verbs
                          then [ Relation (id1,cid1,mid1,"karma",id3,cid3,mid3,"2.39", d13)]  
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
  [ Kqw (id2,cid2,mid2,_,rt2,upasarga2,sanAxiH2,kqw2,_,_,_,_,pUrvapaxa2,uwwarapaxa2,lifgam2,viBakwiH2,vacanam2,_) ->
     match m1 with
     [ WaxXiwa (id1,cid1,mid1,word1,rt1,pUrvapaxa1,uwwarapaxa1,_,lifgam1,viBakwiH1,vacanam1,_) 
     | Kqw (id1,cid1,mid1,word1,_,_,_,_,_,_,_,rt1,pUrvapaxa1,uwwarapaxa1,lifgam1,viBakwiH1,vacanam1,_)
     | Sup (id1,cid1,mid1,word1,rt1,pUrvapaxa1,uwwarapaxa1,lifgam1,viBakwiH1,vacanam1,_) -> 
       let  d12 = if id1 > id2 then id1-id2 else id2-id1 in
       if no_boundary_crossing_with_iwi id1 id2 text_type
        &&  prose_order id1 id2 text_type
       then if not (sanAxiH2="Nic")
       then match kqw2 with
         [ "kwa" -> if not (viBakwiH2 = 7) 
                    then match viBakwiH1 with
                [ 1 -> let rel = handle_sp_compounds id1 cid1 mid1 id2 cid2 mid2 rt1 word1 pUrvapaxa1 uwwarapaxa1 lifgam1 in
	               if (not (rel=[])) then rel 
                      (*&&  (finite_verb_in_sentence.val=50 ||
                           finite_verb_in_sentence.val=id2  ||
                           finite_verb_in_sentence.val=id1) 
                      This condition creates a problem when a word has both sup and wif analysis and wif analysis is not the desired output. Ex: wena mama ayam mohaH vigawaH , here mohaH is not marked*)
                       else if    noun_agreement vacanam1 vacanam2 lifgam1 lifgam2
                      && viBakwiH2=1
                      (* && (id1 < id2  || finite_verb_in_sentence.val == 50) This condition is removed to handle shlokas suc as mayA xqRtA sIwA 
This condition is added, to rule out the possibility of karwA in Sloka form when kqw precedes the noun as in gawaH rAmaH, or samavewAH pANdavAH, where gawaH and samavewAH should be marked as viSeRaNas and not rAmaH or pANdavAH as karwA *)
                   then if (members_of rt2 upasarga2 shliR_Axi_verbs
                       || members_of rt2 upasarga2 aaxikarma_verbs
                       || rt2="ciw2")
                      (* || members_of rt2 upasarga2 akarmaka_verbs 
                       * in the case of akarmaka, karwa is abhihiwa in kwa *)
                      (* For ciw2, there is no rule by Panini.
                       * But we come across sentences such as 'rAjA cinwiwaH/ viRayaH ciwiwaH' *)
                       && not (member_of rt1 intensifiers_list)
                   then [ Relation (id1,cid1,mid1,"karwA",id2,cid2,mid2,"3.1" ,d12)
                        ; Relation (id1,cid1,mid1,"karma",id2,cid2,mid2,"3.2",d12) ]
                   else if members_of rt2 upasarga2 gawyarWa_verbs
                   then [ Relation (id1,cid1,mid1,"gawikarwA",id2,cid2,mid2,"3.3a" ,d12) ]
                   else if members_of rt2 upasarga2 akarmaka_verbs
                   then [ Relation (id1,cid1,mid1,"karwA",id2,cid2,mid2,"3.3" ,d12) ]
                    (*3-4-71 AxikarmaNi kwaH karwari ca . 3-4-72 gawyarWAkarmakaSliRaSIfsWAZZsavasajanaruhajIryawiByaSca.
                      AxikarmaNi--rAmaH kataM prakqwaH,gawyarWa- rAmaH gqhaM gawaH... *)
                   (* ; Relation (id1,cid1,mid1,"karma",id2,cid2,mid2,"2.2",d12) 
                        samavewAH yuyuwsvaH; here in shloka order, yuyuwsavaH is marked as a karma of samavewAH, which is wrong. *) 
                       (* kwayoreva.. *)  (* ?? DO Not mark karma; this is just samAnAXikaraNam *)
                   else if members_of rt2 upasarga2 sakarmaka_verbs 
                        (* && finite_verb_in_sentence.val == 50 -- mayA sIwA xqRtA iwi sH nyavexayaw, final verb is present, and sIwA is karma for xqRtA 
                           Here is a problematic sentence: waM vrajanwaM priyaH BrAwA lakRmaNaH anujagAma snehAw vinaya-sampannaH sumiwrAnanxa-varXanaH BrAwaraM xayiwaH BrAwuH sOBrAwram anuxarSayan
			   In this sumiwrAnanxa-varXanaH is marked as karma of vinaya-sampannaH, which is wrong *)
                          (* && (pUrvapaxa2=uwwarapaxa2 || pUrvapaxa2="a") *)
                   then [ Relation (id1,cid1,mid1,"karma",id2,cid2,mid2,"3.4",d12)]  
                      (*3-4-71 wayoreva kqwykwaKalarWAH rAmeNa granWaH paTiwaH *)
                   else if    members_of rt2 upasarga2 xvikarmaka1   
                           || members_of rt2 upasarga2 xvikarmaka2   
                   then [ Relation (id1,cid1,mid1,"muKyakarma",id2,cid2,mid2,"3.5",d12)]  
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
                      [ Relation (id1,cid1,mid1,"viSeRaNam",id2,cid2,mid2,"2.4",d12)] (*rlkqwaBihiwa3*)
                     | _ -> [] 
                     ]  *)
             | 2 -> let rel = handle_sp_compounds id1 cid1 mid1 id2 cid2 mid2 rt1 word1 pUrvapaxa1 uwwarapaxa1 lifgam1 in
	             if (not (rel=[])) then rel 
                     else if (not (viBakwiH1 = viBakwiH2)
                           || members_of rt2 upasarga2 gawyarWa_verbs)
                     (* In case of gawyarWaka, we can have vanam gawaM raWam PaSya, where vanam is the karma of gawa, but if it is not a gawyarWaka verb then the karma will always be ukwa, and hence will have the same viBakwi as that of kwa, and in such cases we mark them as viSeRaNas, and do not mark the kaaraka relation *)
                     then if not (member_of word1 kAlAXvas)
   			&& (  members_of rt2 upasarga2 shliR_Axi_verbs
                           || members_of rt2 upasarga2 aaxikarma_verbs
                           )
                        (* This last condition is added to avoid the karma marking between vyUDam camUm paSya; here there should not be a karma rel between vyUDam and camUm; rather it should be a viSeRaNa *)
                     then [ Relation (id1,cid1,mid1,"karma",id2,cid2,mid2,"3.6",d12)] 
                     else if members_of rt2 upasarga2 gawyarWa_verbs
                     then [ Relation (id1,cid1,mid1,"gawikarma",id2,cid2,mid2,"2.7a",d12)]
                     (*else [ Relation (id1,cid1,mid1,"karma",id2,cid2,mid2,"2.7a",d12)]
                       else if (uwwarapaxa1=pUrvapaxa1 ) || (pUrvapaxa1="a") 
		     then [ Relation (id1,cid1,mid1,"karma",id2,cid2,mid2,"2.4",d12)] 
Why this condition? 
Counter example: sarva-BUwa-hiwe rawAH *)
                     (*  in case of kwa, if the verb is sakarmaka, the karma will be ukwa. So we need not mark the karma 
                     else if members_of rt2 upasarga2 sakarmaka_verbs
                     then [ Relation (id1,cid1,mid1,"karma",id2,cid2,mid2,"3.7",d12)] *)
                     else if members_of rt2 upasarga2 xvikarmaka1
                           ||  members_of rt2 upasarga2 xvikarmaka2
                     then [ Relation (id1,cid1,mid1,"gONakarma",id2,cid2,mid2,"3.8",d12)] 
                     else []
                     else [] (*  Why 2.8 is needed? wawkAlam pravqwwAH -> wawkAlam is marked as a karma for pra_vqw, which is asakarmaka [ Relation (id1,cid1,mid1,"karma",id2,cid2,mid2,"2.8",d12)] *)
                    (* anaBihiwe karmaNi xviwIyA gurum upaSliRtaH , grAmaM gawaH, kataM prakqwaH*)
                     (* else [ Relation (id1,cid1,mid1,"viSeRaNam",id2,cid2,mid2,"2.5",d12)]  Any example for this rule? *)
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
			let rel = rlafgavikAra m1 m2 text_type in
			if rel = [] then [ Relation (id1,cid1,mid1,"karwA",id2,cid2,mid2,"3.9",d12)] (* karwq_karaNayoH_wqwIyA rAmeNa granWaH paTiwaH*) 
                        else []
                    else []
               | _ -> []
               ]
               else []
        | "ac" -> match viBakwiH1 with
                   [ 1 -> if noun_agreement vacanam1 vacanam2 lifgam1 lifgam2
                          && not (member_of rt1 intensifiers_list)
                      then [ Relation (id1,cid1,mid1,"karwA",id2,cid2,mid2,"3.10",d12)] (* aBihiwe karwari praWamA , rAmaH gawavAn *) 
                      else []
                   | 2 -> if (    members_of rt2 upasarga2 sakarmaka_verbs
                               || members_of rt2 upasarga2 xvikarmaka2
                               || members_of rt2 upasarga2 xvikarmaka1
                             )
                             && not (member_of word1 kAlAXvas)
                          then let rel = handle_sp_compounds id1 cid1 mid1 id2 cid2 mid2 rt1 word1 pUrvapaxa1 uwwarapaxa1 lifgam1 in
	                       if (not (rel=[])) then rel 
			       else [ Relation (id1,cid1,mid1,"karma",id2,cid2,mid2,"3.11",d12)] (*rAmaH gqhaM gawavAn*) 
                          else []
                   | _ -> []
                   ]
        | "kwavawu" 
        | "u" -> if not (viBakwiH2=7)
                       then match viBakwiH1 with
                   [ 1 -> if noun_agreement vacanam1 vacanam2 lifgam1 lifgam2
                          && not (member_of rt1 intensifiers_list)
                      then [ Relation (id1,cid1,mid1,"karwA",id2,cid2,mid2,"3.12",d12)] (* aBihiwe karwari praWamA , rAmaH gawavAn *) 
                      else []
                   | 2 -> let rel = handle_sp_compounds id1 cid1 mid1 id2 cid2 mid2 rt1 word1 pUrvapaxa1 uwwarapaxa1 lifgam1 in
	    if (not (rel=[])) then rel 
                          else if  members_of rt2 upasarga2 sakarmaka_verbs
                          && not (member_of word1 kAlAXvas)
                          then (*if pUrvapaxa1=uwwarapaxa1 || pUrvapaxa1="a"
			  then *)
                          [ Relation (id1,cid1,mid1,"karma",id2,cid2,mid2,"3.13",d12)] (*rAmaH gqhaM gawavAn*) 
                          else if members_of rt2 upasarga2 xvikarmaka2
                               || members_of rt2 upasarga2 xvikarmaka1
                          then [ Relation (id1,cid1,mid1,"muKyakarma",id2,cid2,mid2,"3.14",d12)
                               ; Relation (id1,cid1,mid1,"gONakarma",id2,cid2,mid2,"3.15",d12)]
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
                 [ 1 -> if members_of rt2 upasarga2 sakarmaka_verbs && (pUrvapaxa2=uwwarapaxa2|| pUrvapaxa2="a")
                   then [ Relation (id1,cid1,mid1,"karma",id2,cid2,mid2,"3.16",d12)]  
                    (* rlkqwaBihiwa10  wayoreva kqwyakwaKalarWAH  rAmeNa granWaH paTiwavyaH/paTanIyaH *)
                 else []
                 | 3 -> [ Relation (id1,cid1,mid1,"karwA",id2,cid2,mid2,"3.17",d12)]  
                    (* karwq_karaNayoH_wqwIyA rAmeNa granWaH paTiwavyaH/paTanIyaH*)
                 | _ -> []
                 ]
        | "SAnac_lat" 
        | "SAnac_lqt" 
        | "Sawq_lat" 
        | "Sawq_lqt" ->  if not (viBakwiH2=7) then 
                         let rel = handle_sp_compounds id1 cid1 mid1 id2 cid2 mid2 rt1 word1 pUrvapaxa1 uwwarapaxa1 lifgam1 in
	                 if (not (rel=[])) then rel 
                         else if viBakwiH1=2 && (members_of rt2 upasarga2 sakarmaka_verbs || members_of rt2 upasarga2 xvikarmaka1 || members_of rt2 upasarga2 xvikarmaka2) 
                         then [ Relation (id1,cid1,mid1,"karma",id2,cid2,mid2,"3.18",d12)] 
                         (*else if not (viBakwiH2 = 7)  should viBhakiH2 not be = 4 ? *)
                         (*else if (viBakwiH1 = 4) (* kqpayA AviRtam viRixanwam waM --- BhG 2.1 *) 
                          The BhG2.1 does not cover this case. So example is wrong.
                          Further this produces the same relation as of 4.15.
                          Hence this is commented. -- Amba  12th Nov 2022
                         then [ Relation (id1,cid1,mid1,"prayojanam1",id2,cid2,mid2,"3.19",d12)] *)
			 else []
                         else if 
                              ((kqw2="Sawq_lat" || kqw2= "Sawq_lqt") && viBakwiH1=2)
                           || ((kqw2="SAnac_lat" || kqw2= "SAnac_lqt") && viBakwiH1=7)
                         then if (members_of rt2 upasarga2 sakarmaka_verbs || members_of rt2 upasarga2 xvikarmaka1 || members_of rt2 upasarga2 xvikarmaka2) 
                         then [ Relation (id1,cid1,mid1,"karma",id2,cid2,mid2,"3.20",d12)] 
			 else []
			 else []
        | "wqc" 
        | "Nvul"  -> let rel = handle_sp_compounds id1 cid1 mid1 id2 cid2 mid2 rt1 word1 pUrvapaxa1 uwwarapaxa1 lifgam1 in
	             if (not (rel=[])) then rel 
                     else if viBakwiH1=2 && (members_of rt2 upasarga2 sakarmaka_verbs || members_of rt2 upasarga2 xvikarmaka1 || members_of rt2 upasarga2 xvikarmaka2)
                     then [ Relation (id1,cid1,mid1,"karma",id2,cid2,mid2,"3.21",d12)] 
		     else []
	| "lyut" -> match viBakwiH1 with
                    [ 3 -> [ (* Relation (id1,cid1,mid1,"karwA",id2,cid2,mid2,"3.22",d12) -- In karwA this should be in 6th case isn't it?
                           ;  *)Relation (id1,cid1,mid1,"karaNam",id2,cid2,mid2,"3.23",d12)
                           ]
                    | 6 -> let rel = handle_sp_compounds id1 cid1 mid1 id2 cid2 mid2 rt1 word1 pUrvapaxa1 uwwarapaxa1 lifgam1 in
	                   if (not (rel=[])) then rel 
                           else if (members_of rt2 upasarga2 sakarmaka_verbs) && (pUrvapaxa1=uwwarapaxa1 || pUrvapaxa1="a")
                                then [ Relation (id1,cid1,mid1,"karma",id2,cid2,mid2,"3.24",d12)] 
                                else []
                    | 2  ->  if (members_of rt2 upasarga2 sakarmaka_verbs)
                             then [ Relation (id1,cid1,mid1,"karma",id2,cid2,mid2,"3.24a",d12)] 
                             else []
                    | _ -> []
                    ]
        | _ ->  let rel = handle_sp_compounds id1 cid1 mid1 id2 cid2 mid2 rt1 word1 pUrvapaxa1 uwwarapaxa1 lifgam1 in
	        if (not (rel=[])) then rel 
                else if viBakwiH1=6 && (members_of rt2 upasarga2 sakarmaka_verbs) && (pUrvapaxa1=uwwarapaxa1 || pUrvapaxa1="a") 
                then [ Relation (id1,cid1,mid1,"karma",id2,cid2,mid2,"3.25",d12)] 
                else []
        ]
      else match kqw2 with (* Nic *)
        [ "kwa" -> match viBakwiH1 with
                [ 1 -> if noun_agreement vacanam1 vacanam2 lifgam1 lifgam2
                   then match verb_type rt2 upasarga2 with
                   [ "akarmaka" -> [ Relation (id1,cid1,mid1,"prayojyakarwA",id2,cid2,mid2,"3.26",d12)] 
                   | "xvikarmaka1" -> [ Relation (id1,cid1,mid1,"gONakarma",id2,cid2,mid2,"3.27",d12)] 
                   | "xvikarmaka2" -> [ Relation (id1,cid1,mid1,"muKyakarma",id2,cid2,mid2,"3.28",d12)] 
                   | "gawi" -> [ Relation (id1,cid1,mid1,"prayojakakarwA",id2,cid2,mid2,"3.29",d12)  
                          (* yajFaxawwaH xevaxawwaM grAmaM gamiwaH  gawibuxXi.. elevates prayojya_karwA to karma, hence xviwIyA *)
                           ; Relation (id1,cid1,mid1,"prayojyakarwA",id2,cid2,mid2,"3.30",d12) (*yajFaxawwena xevaxawwaH pATaM kAriwaH *) 
                           ]
                   | _ ->  if  members_of rt2 upasarga2 shliR_Axi_verbs
                           then [ Relation (id1,cid1,mid1,"prayojakakarwA",id2,cid2,mid2,"3.31",d12)  
                         (* yajFaxawwaH xevaxawwaM grAmaM gamiwaH  gawibuxXi.. elevates prayojya_karwA to karma, hence xviwIyA *)
                                ; Relation (id1,cid1,mid1,"prayojyakarwA",id2,cid2,mid2,"3.32",d12) (*yajFaxawwena xevaxawwaH pATaM kAriwaH *) 
                                ]
                            else if members_of rt2 upasarga2 aaxikarma_verbs
                            then [ Relation (id1,cid1,mid1,"prayojakakarwA",id2,cid2,mid2,"3.33",d12) (* AxikarmaNi,gawyarWAkarmaka... *) 
                                 ; Relation (id1,cid1,mid1,"prayojyakarwA",id2,cid2,mid2,"3.34",d12) 
                                 ; Relation (id1,cid1,mid1,"karma",id2,cid2,mid2,"3.35",d12) 
                                 ]
                            else [ Relation (id1,cid1,mid1,"karma",id2,cid2,mid2,"3.36",d12) ]
                   ]
                   else []
             | 2 ->  if not (member_of word1 kAlAXvas) && not (rt1 = "kevala")
                     then match verb_type rt2 upasarga2 with
                   ["akarmaka" -> [ Relation (id1,cid1,mid1,"prayojyakarwA",id2,cid2,mid2,"3.37",d12)] 
                   | "xvikarmaka1" ->  [ Relation (id1,cid1,mid1,"muKyakarma",id2,cid2,mid2,"3.38",d12)] 
                   | "xvikarmaka2" ->  [ Relation (id1,cid1,mid1,"gONakarma",id2,cid2,mid2,"3.39",d12)] 
                   | _ -> let rel = handle_sp_compounds id1 cid1 mid1 id2 cid2 mid2 rt1 word1 pUrvapaxa1 uwwarapaxa1 lifgam1 in
	                  if (not (rel=[])) then rel 
                          else if (uwwarapaxa1=pUrvapaxa1 ) || (pUrvapaxa1="a")
		          then [ Relation (id1,cid1,mid1,"karma",id2,cid2,mid2,"3.40",d12)] 
                          else [ Relation (id1,cid1,mid1,"prayojyakarwA",id2,cid2,mid2,"3.41",d12) 
                               ; Relation (id1,cid1,mid1,"karma",id2,cid2,mid2,"3.42",d12) 
                               ]
                   ]
                   else []
             | 3 ->  if not (member_of word1 kAlAXvas)
		     then match verb_type rt2 upasarga2 with
                  ["gawi" -> [ Relation (id1,cid1,mid1,"prayojakakarwA",id2,cid2,mid2,"3.43",d12)] 
                  | "xvikarmaka1"
                  | "xvikarmaka2" -> [ Relation (id1,cid1,mid1,"prayojakakarwA",id2,cid2,mid2,"3.44",d12) 
                                     ; Relation (id1,cid1,mid1,"prayojyakarwA",id2,cid2,mid2,"3.45",d12) 
                                     ]
                  | "sakarmaka"  ->
                         [ Relation (id1,cid1,mid1,"prayojakakarwA",id2,cid2,mid2,"3.46",d12) ]
                  |_ -> if members_of rt2 upasarga2 shliR_Axi_verbs 
                    then [ Relation (id1,cid1,mid1,"prayojakakarwA",id2,cid2,mid2,"3.47",d12)] 
                    else if members_of rt2 upasarga2 aaxikarma_verbs
                    then [ Relation (id1,cid1,mid1,"prayojakakarwA",id2,cid2,mid2,"3.48",d12) 
                         ; Relation (id1,cid1,mid1,"prayojyakarwA",id2,cid2,mid2,"3.49",d12) 
                         ]
                    else [ Relation (id1,cid1,mid1,"prayojakakarwA",id2,cid2,mid2,"3.50",d12)] 
                 ]
                   else []
              | _ -> []
              ]
        | "kwavawu" -> match viBakwiH1 with
                   [ 1 -> if noun_agreement vacanam1 vacanam2 lifgam1 lifgam2
                      then [ Relation (id1,cid1,mid1,"prayojakakarwA",id2,cid2,mid2,"3.51",d12)]   
                      else []
                   | 2 -> if not (member_of word1 kAlAXvas)
                             && members_of rt2 upasarga2 sakarmaka_verbs
                      then [ Relation (id1,cid1,mid1,"prayojyakarwA",id2,cid2,mid2,"3.52",d12)] (* To write and check *) 
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
              then [ Relation (id1,cid1,mid1,"karma",id2,cid2,mid2,"3.53",d12)] 
            else []
          | "SAnac_lat" 
          | "SAnac_lqt" 
          | "Sawq_lat" 
          | "Sawq_lqt" ->  let rel = handle_sp_compounds id1 cid1 mid1 id2 cid2 mid2 rt1 word1 pUrvapaxa1 uwwarapaxa1 lifgam1 in
	    if (not (rel=[])) then rel 
            else if viBakwiH1=2 
                 &&  (members_of rt2 upasarga2 xvikarmaka1
                      || members_of rt2 upasarga2 xvikarmaka1
                      || members_of rt2 upasarga2 shabxakarma_verbs
                      || members_of rt2 upasarga2 gawyarWa_verbs
                      || members_of rt2 upasarga2 prawyavasAnArWa_verbs
                      || members_of rt2 upasarga2 buxXyarWa_verbs)
            then [ Relation (id1,cid1,mid1,"karma",id2,cid2,mid2,"3.54",d12)
                 ; Relation (id1,cid1,mid1,"prayojyakarwA",id2,cid2,mid2,"3.55",d12)]
            else if viBakwiH1=2 && (members_of rt2 upasarga2 sakarmaka_verbs || members_of rt2 upasarga2 akarmaka_verbs)
                 then [ Relation (id1,cid1,mid1,"karma",id2,cid2,mid2,"3.56",d12)]
                 else if viBakwiH1=3 && (members_of rt2 upasarga2 sakarmaka_verbs) 
                      then [ Relation (id1,cid1,mid1,"prayojya_karwA",id2,cid2,mid2,"3.57",d12)]
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

value anaBihiwe m1 m2 id1 cid1 mid1 rt1 word1 pUrvapaxa1 uwwarapaxa1 lifgam1 viBakwiH1 id2 cid2 mid2 rt2 upasarga2 kqw1 kqw2 text_type =
   let  d12 = if id1 > id2 then id1-id2 else id2-id1 in
   match viBakwiH1 with
       [ 3 -> if (rt2="yaj1")
                   then [ Relation (id1,cid1,mid1,"karma",id2,cid2,mid2,"4.1",d12)] (* yajeH karmaNaH karaNa saFjFA  vArwika*)
	           else if (member_of rt1 kAlAXvas)
                        then [ Relation (id1,cid1,mid1,"apavarga_sambanXaH",id2,cid2,mid2,"4.2",d12)] (* xevaxawwena mAsena pATaH aXIwaH apavarge wqwIyA A 2.3.6 *)  (* yogyawA *)
                        
                        else 
                            if members_of rt2 upasarga2 karaNa_verbs
                             then if member_of rt1 shabxavAci_nouns || member_of rt1 buxXivAci_nouns
                                  then [ Relation (id1,cid1,mid1,"karaNam",id2,cid2,mid2,"4.3",d12) ]  (*karwq karaNayoswqwIyA - yAnena gacCawi*) 
                                  else if member_of rt1 saMKyeya
                                       then [ Relation (id1,cid1,mid1,"karaNam",id2,cid2,mid2,"4.5",d12)]   (*karwq karaNayoswqwIyA - yAnena gacCawi*) 
 				       else if not (member_of rt1 guNa_not_guNavacana) && not (is_human rt1) && not (rt1 = "asmax") && not (rt1 = "yuRmax") && not (member_of rt1 kqxanwas)
                                       then [ Relation (id1,cid1,mid1,"karaNam",id2,cid2,mid2,"4.6",d12)   (*karwq karaNayoswqwIyA - yAnena gacCawi*) 
                                            ; Relation (id1,cid1,mid1,"hewuH",id2,cid2,mid2,"4.7",d12) ]
                                       else [ Relation (id1,cid1,mid1,"hewuH",id2,cid2,mid2,"4.8",d12) ]
                              else if (rt2="jFA2" && upasarga2 = "sam")
                     (* samjFonyawarasyAm karmaNi A. 2.3.22 -mAwrA saFjAnIwe *) 
                    || (rt2="hu1" && text_type="Vedic")
                     (* wqwIyA ca hoSCanxasi A 2.3.3 - yavAgvA juhowi *)
                                   then if not (member_of rt1 guNa_not_guNavacana) (*|| pronominal123 rt1*)
                                            then [ Relation (id1,cid1,mid1,"karma",id2,cid2,mid2,"4.9",d12) ]
                                            else [ Relation (id1,cid1,mid1,"hewuH",id2,cid2,mid2,"4.10",d12) ]
                                   else (* if not (member_of rt1 guNa_not_guNavacana) *)
					let rel = rlafgavikAra m1 m2 text_type in
                                        if rel = [] then [ Relation (id1,cid1,mid1,"hewuH",id2,cid2,mid2,"4.11",d12) ] (* annena vasawi *) 
					else []
           (* anaBihiwa karwA -> rlanaBihiwakarwA *)
       | 4 ->  if members_of rt2 upasarga2 sampraxAna_verbs
               (*then if member_of rt1 animate_nouns
                * This has problems. saH pATaSAlAyE Xanam xaxAwi will fail to assign sampraxAna to pATaSAlA *)
               then if not (member_of rt1 guNa_not_guNavacana) && not (lifgam1="napuM") 
                then if kqw1=0 
                    then [ Relation (id1,cid1,mid1,"sampraxAnam",id2,cid2,mid2,"4.12",d12)] (* rajakAya xaxAwi *)
                    else [ Relation (id1,cid1,mid1,"prayojanam1",id2,cid2,mid2,"4.13",d12)]  
                 else [ Relation (id1,cid1,mid1,"prayojanam1",id2,cid2,mid2,"4.14",d12)] (* prakRAlanAya xaxAwi *)
                         (*cawurWI sampraxAne 2-3-13  viprAya xaxAwi *) 
            (*    else if  members_of rt2 upasarga2 gawyarWa_verbs 
                    then [ Relation (id1,cid1,mid1,"karma",id2,cid2,mid2,"3.8b",d12) ] दास्योः वचनेषु महिष्याः निर्-अतिशया श्रद्धा भवति
             (* gawyarWakarmaNi xviwIyAcawurWyO ceRtAyAmanaXvani 2-3-12 rAmaH grAmAya gacCawi 
              * Malay -- whether sampraxAna or karma ? *) 
             -- overgeneration
e.g. saH prAwaH BramaNAya gacCawi -- Amruta   14 July 2020
             *)
                    else if rt2="man1" 
                         then [ Relation (id1,cid1,mid1,"karmasamAnAXikaraNam",id2,cid2,mid2,"4.15",d12) ]
                (* manyakarmaNyanAxare viBARAZprANiRu 2-3-17 ahaM wvAM wqNAya manye / aham wvA wqNAya manye *)
                         else if kqw1 = 0
                              then [ Relation (id1,cid1,mid1,"prayojanam1",id2,cid2,mid2,"4.16",d12)] (* puwrAya puswakaM krINAwi *) 
                              else []
       | 5 -> if members_of rt2 upasarga2 apAxAna_verbs
                    then if pronominal123 rt1
                        then [ Relation (id1,cid1,mid1,"apAxAnam",id2,cid2,mid2,"4.17",d12)
                             ; Relation (id1,cid1,mid1,"hewuH5",id2,cid2,mid2,"4.18",d12) ]
                    else if not(member_of rt1 guNa_not_guNavacana) || (kqw1=1)  (* allow kqxanwas also  -- xAwqByaH Xanam laBanwe *)
                         then [ Relation (id1,cid1,mid1,"apAxAnam",id2,cid2,mid2,"4.19",d12)  (* apAxAne paFcamI  - rAmaH grAmAw AgacCawi / raveH lokaH prakASam aXigacCawi *) 
                              ;  Relation (id1,cid1,mid1,"hewuH5",id2,cid2,mid2,"4.20",d12)] (* raveH lokaH suKam aXigacCawi *) 
                             else [ Relation (id1,cid1,mid1,"hewuH5",id2,cid2,mid2,"4.21",d12) ]   (* BayAw nirgacCawi *)
                   else if   rt1="swoka" 
                           || rt1="alpa" 
                           || rt1="kqcCra"
                           || rt1="kawipaya"
                        then [ Relation (id1,cid1,mid1,"karaNam",id2,cid2,mid2,"4.22",d12)] 
             (* karaNe ca swokAlpakqcCrakawipayasyAsawwvavacanasya 2-3-33 - swokAw mukwaH *)
                        else if (member_of rt1 guNavacana) (* yogyawA *)
                             then [ Relation (id1,cid1,mid1,"hewuH5",id2,cid2,mid2,"4.23",d12)] (* viBARA guNe aswriyAm 2-3-25 - jAdyAw baxXaH*)  
                             else if (member_of word1 kAlAXvas)
                                  then [ Relation (id1,cid1,mid1,"aXikaraNam",id2,cid2,mid2,"4.24",d12) ] (* sapwamIpaFcamyO kArakamaXye A 2.3.7 
                                                                                                -- kroSAw lakRyam viXyawi *)
                                  else if (rt2="xqS1" || (rt2="IkR1" && upasarga2="pra")) (* prAsAxAw prekRyawe and AsanAw prekRyawe *)
				          && (rt1 = "Asana" || rt1 = "prAsAxa")  (* These are rare constructions, and the condition needs to be stated as if rt1 is a possible aXikaranNa ; This is to avoid marking vacanAw as lyapkarmAXikaraNa for in vacanA xarSayAmAsa *)
                                       then [ Relation (id1,cid1,mid1,"lyapkarmAXikaraNam",id2,cid2,mid2,"4.25",d12) 
                                            ; Relation (id1,cid1,mid1,"hewuH5",id2,cid2,mid2,"4.26",d12) ]
                                       else [ Relation (id1,cid1,mid1,"hewuH5",id2,cid2,mid2,"4.27",d12) ] (* हेतौ पञ्चमी वा स्यादिस्यर्थः।A bAlamanorama tIkA *)
            (* else if word1="wasmAw" || word1="yasmAw"
                 then [ Relation (id1,cid1,mid1,"hewuH",id2,cid2,mid2,"3.19",d12)]  
	         else [] *)
       | 6 -> if (  rt2="vi_ava_hq1" || rt2="paNa1" || rt2="xiv1")
          then [ Relation (id1,cid1,mid1,"karma",id2,cid2,mid2,"4.28",d12) ]  
           (* vyavahqpaNoH samarWayoH 2-3-57 -- Sawasya vyavaharawi,
              xivaswaxarWasya 2-3-58 xiv1 if it is in vyavahAra arWa-- Sawasya xIvyawi*)
            else []
       | 7  -> if (upasarga2="aXi" && (rt2="SIf1" || rt2="sWA1"))
               then if member_of word1 kAlAXikaraNas (* praBAwe vEkuNTam wiRTawi *)
                    then [ Relation (id1,cid1, mid1, "kAlAXikaraNam", id2,cid2, mid2,"4.29",d12) ]
                    else [] 
               else if (rt2="gam1" || rt2="SAs1" || rt2="syanx1")
                    then if member_of word1 kAlAXikaraNas (* praBAwe vEkuNTam wiRTawi *)
                         then [ Relation (id1,cid1, mid1, "kAlAXikaraNam", id2,cid2, mid2,"4.30",d12) ]
                         else if (kqw1 = 0) then [ Relation (id1,cid1,mid1, "aXikaraNam", id2,cid2, mid2,"4.31",d12) ]
                              else []
                    else if word1="maXye" then []
                         else match m1 with
               [  Kqw (id1,cid1,mid1,word1,_,_,_,kqw_prawyayaH1,_,_,_,rt1,_,_,_,viBakwiH1,_,_) ->
                   if not (kqw_prawyayaH1="Sawq_lat" 
                        || kqw_prawyayaH1="SAnac" 
                        || kqw_prawyayaH1="kwa" 
                        || kqw_prawyayaH1="kwavawu") 
                      (* covered in BAvalakRaNa sapwamI 
                         praBAwe -- Sawq_lat; is aXikaraNa  Hence above condition is commented 14 April 2017 
 ... gacCawi ... paTawi; here gacCawi is marked as aXikaraNa. To stop this, again this is uncommented. 26th May 2018 *)
                  then  [ Relation (id1,cid1, mid1, (aXikaraNa_type word1 rt1), id2,cid2, mid2,"4.32",d12)] 
                  else [] 
               | _ -> if not (rt1="Bavaw"|| rt1="asmax" || rt1 = "yuRmax") then [ Relation (id1,cid1, mid1, (aXikaraNa_type word1 rt1), id2,cid2, mid2,"4.33",d12) ] 
                      else []
               ]
       | 8 ->  match m2 with
           [ Wif (id2,cid2,mid2,_,rt2,_,_,upasarga2,sanAxiH2,_,lakAraH2,puruRaH2,_,_,_,_,_) -> 
           if (rt1="brahma" || rt1 = "miwra" || not (lifgam1 = "napuM")) 
            && ((id1 <= 2 && text_type = "Prose") || text_type = "Sloka")
            && kqw1=0 (* the word should not be a kqxanwa to be in samboXana ; this was over-generating in the case of upasafgamya abravIw; upasafgamya being marked as a samboXya *)
             (* if ((lakAraH2="lot") && (puruRaH2="ma"))
              then [ Relation (id1,cid1,mid1,"samboXyaH",id2,cid2,mid2,"3.14",d12)]
              else [] *)
              && (member_of rt1 manuRyasaFjFAvAcI || member_of rt1 upAXi || pUrvapaxa1="y"|| uwwarapaxa1="y")
              then [ Relation (id1,cid1,mid1,"samboXyaH",id2,cid2,mid2,"4.34",d12)]
              else [ ]
           | Kqw (id2,cid2,mid2,_,_,_,_,kqw_prawyayaH2,_,_,_,_,_,_,_,viBakwiH2,_,_) -> 
               if (kqw_prawyayaH2="kwa" || kqw_prawyayaH2="kwavawu" || kqw_prawyayaH2="ac" || kqw_prawyayaH2="yaw") 
                 && (viBakwiH2=1) 
                 && (id2 = total_wrds.val)
          (* Need an example where the kwAnwa is not at the end, and has a relation with kamboXya, in Sloka form. This was overgenerating solutions. Only when an example is provided, we can uncomment this condition 
           * || text_type="Sloka")  *)
                 && ((id1 < 2 && text_type = "Prose") || text_type = "Sloka")
                 && (member_of rt1 manuRyasaFjFAvAcI || member_of rt1 upAXi || pUrvapaxa1="y"||uwwarapaxa1="y")
               (* To establish a relation between rAma and gawaH in 'rAma saH gawaH', but to stop such a relation in 'rAma gawaH saH mama puwraH aswi. *)
    (*           
Counter ex for napum: anawa-rUpa wvayA viSvam wawam
if (not (lifgam1="napuM") && kqw_prawyayaH2="kwa" || kqw_prawyayaH2="kwavawu" || kqw_prawyayaH2="ac" || kqw_prawyayaH2="yaw") && (viBakwiH2=1) && id2 = total_wrds.val  *)
               then [ Relation (id1,cid1,mid1,"samboXyaH",id2,cid2,mid2,"4.35",d12)]
              else []
           |  _ -> []
           ]
       | 2  -> (* covered in rlwifkarwA_karma and rlkqwkarwA_karma *)
           if (member_of rt1 kAlAXvas)
           then [ Relation (id1,cid1,mid1,"awyanwasaMyoga_sambanXaH",id2,cid2,mid2,"4.36",d12)] (* xevaxawwaH mAsam pATam aXIwe kAlAXvanorawyanwasaMyoge A 2.3.5 *)  (* yogyawA *)
           else if member_of (word1^" "^string_of_int viBakwiH1) kriyAviSeRaNas (* yogyawA *) && lifgam1="napuM"
           then [ Relation (id1,cid1,mid1,"kriyAviSeRaNam",id2,cid2,mid2,"4.37",d12)] 
           else [] (* rlwifanaBihiwakarma rlkqwanaBihiwakarma *)
       | _ -> [] (* raise an exception *)
       ]
;

value rlanaBihiwe m1 m2 text_type = match m2 with
  [ Wif (id2,cid2,mid2,_,rt2,_,_,upasarga2,_,_,_,_,_,_,_,_,_)
  | Avykqw (id2,cid2,mid2,_,rt2,_,_,upasarga2,_,_,_,_,_) -> 
     match m1 with
     [ Sup (id1,cid1,mid1,word1,rt1,pUrvapaxa1,uwwarapaxa1,lifgam1,viBakwiH1,_,_) ->
       if prose_order id1 id2 text_type
         &&  no_boundary_crossing_with_iwi id1 id2 text_type
       then let kqw1=0 in let kqw2=0 in anaBihiwe m1 m2 id1 cid1 mid1 rt1 word1 pUrvapaxa1 uwwarapaxa1 lifgam1 viBakwiH1 id2 cid2 mid2 rt2 upasarga2 kqw1 kqw2 text_type
       else []
     | Kqw (id1,cid1,mid1,word1,_,_,_,kqw1,_,_,_,rt1,pUrvapaxa1,uwwarapaxa1,lifgam1,viBakwiH1,_,_) ->
       if prose_order id1 id2 text_type (* check for leKani etc. *)
         &&  no_boundary_crossing_with_iwi id1 id2 text_type
       (*then if (* kqw1="wqc" && *) (viBakwiH1=3 || viBakwiH1 = 5)
Why this condition of 3 & 5 and hewu? We should write this in anaBihiwe itself!
       then [ Relation (id1,cid1,mid1,"hewuH",id2,cid2,mid2,"3.25",d12)] 
       else *) 
       then let kqw1=1 in let kqw2=0 in anaBihiwe m1 m2 id1 cid1 mid1 rt1 word1 pUrvapaxa1 uwwarapaxa1 lifgam1 viBakwiH1 id2 cid2 mid2 rt2 upasarga2 kqw1 kqw2 text_type
       else []
     | WaxXiwa (id1,cid1,mid1,word1,rt1,pUrvapaxa1,uwwarapaxa1,waxXiwa_prawyayaH1,lifgam1,viBakwiH1,_,_) -> 
       let  d12 = if id1 > id2 then id1-id2 else id2-id1 in
       if prose_order id1 id2 text_type
         &&  no_boundary_crossing_with_iwi id1 id2 text_type
       then if  waxXiwa_prawyayaH1="wva" && viBakwiH1=5
       then [ Relation (id1,cid1,mid1,"hewuH5",id2,cid2,mid2,"4.37",d12)] 
       else let kqw1=0 in let  kqw2=0 in anaBihiwe m1 m2 id1 cid1 mid1 rt1 word1 pUrvapaxa1 uwwarapaxa1 lifgam1 viBakwiH1 id2 cid2 mid2 rt2 upasarga2 kqw1 kqw2 text_type
       else []
     | _ -> []
     ]
  | Kqw (id2,cid2,mid2,_,rt2,upasarga2,_,_,_,_,_,_,_,_,_,viBakwiH2,_,_) ->
       match m1 with
       [ Sup (id1,cid1,mid1,word1,rt1,pUrvapaxa1,uwwarapaxa1,lifgam1,viBakwiH1,_,_)
       | WaxXiwa (id1,cid1,mid1,word1,rt1,pUrvapaxa1,uwwarapaxa1,_,lifgam1,viBakwiH1,_,_) -> 
            if prose_order id1 id2 text_type && not (viBakwiH2 = 8)
            &&  no_boundary_crossing_with_iwi id1 id2 text_type
            then let kqw1=0 in let kqw2=1 in anaBihiwe m1 m2 id1 cid1 mid1 rt1 word1 pUrvapaxa1 uwwarapaxa1 lifgam1 viBakwiH1 id2 cid2 mid2 rt2 upasarga2 kqw1 kqw2 text_type
            else []
       | Kqw (id1,cid1,mid1,word1,_,_,_,_,_,_,_,rt1,pUrvapaxa1,uwwarapaxa1,lifgam1,viBakwiH1,_,_) ->
            if prose_order id1 id2 text_type && not (viBakwiH2 = 8)
            &&  no_boundary_crossing_with_iwi id1 id2 text_type
            then let kqw1=1 in let kqw2=1 in anaBihiwe m1 m2 id1 cid1 mid1 rt1 word1 pUrvapaxa1 uwwarapaxa1 lifgam1 viBakwiH1 id2 cid2 mid2 rt2 upasarga2 kqw1 kqw2 text_type
            else []
       | _ -> []
       ]
  | _ -> []
  ]
  ;


value rlAvykqw_karma m1 m2 text_type = match m2 with
  [ Avykqw (id2,cid2,mid2,_,rt2,_,_,upasarga2,sanAxiH2,_,_,_,_) -> match m1 with
     [ WaxXiwa (id1,cid1,mid1,word1,rt1,pUrvapaxa1,uwwarapaxa1,_,lifgam1,viBakwiH1,_,_) 
     | Kqw (id1,cid1,mid1,word1,_,_,_,_,_,_,_,rt1,pUrvapaxa1,uwwarapaxa1,lifgam1,viBakwiH1,_,_)
     | Sup (id1,cid1,mid1,word1,rt1,pUrvapaxa1,uwwarapaxa1,lifgam1,viBakwiH1,_,_) -> 
       let  d12 = if id1 > id2 then id1-id2 else id2-id1 in
       if  prose_order id1 id2 text_type && no_boundary_crossing_with_iwi id1 id2 text_type
       then match viBakwiH1 with
        [ 2 -> if not (member_of word1 kAlAXvas)
        then match verb_type rt2 upasarga2 with
              [ "xvikarmaka1" 
              | "xvikarmaka2" -> [ Relation (id1,cid1,mid1,"gONakarma",id2,cid2,mid2,"5.1" ,d12)  
                                (* karmaNi xviwIyA  - rAjAnaM vasuXAM yAcawe*)
                               ; Relation (id1,cid1,mid1,"muKyakarma",id2,cid2,mid2,"5.2" ,d12)  
                                (* karmaNi xviwIyA - gAM xogXi payaH *)
                                  ]
              | "gawi"
              | "buxXi" 
              | "Sabxakarma" 
              | "prawyavasAnArWa" -> if not (sanAxiH2="Nic")
                                        then let rel = handle_sp_compounds id1 cid1 mid1 id2 cid2 mid2 rt1 word1 pUrvapaxa1 uwwarapaxa1 lifgam1 in
	                                  if (not (rel=[])) then rel 
                                          else [ Relation (id1,cid1,mid1,"karma",id2,cid2,mid2,"5.3" ,d12)] (* karmaNi xviwIyA *) 
                                     else if member_of rt1 animate_nouns || member_of rt1 manuRyasaFjFAvAcI 
                                          then [ Relation (id1,cid1,mid1,"prayojyakarwA",id2,cid2,mid2,"5.4",d12) 
                                               ; Relation (id1,cid1,mid1,"karma",id2,cid2,mid2,"5.5",d12) 
                                               ]
                                          else [ Relation (id1,cid1,mid1,"karma",id2,cid2,mid2,"5.6",d12) ]
              | "sakarmaka" -> if not (sanAxiH2="Nic")
                                        then let rel = handle_sp_compounds id1 cid1 mid1 id2 cid2 mid2 rt1 word1 pUrvapaxa1 uwwarapaxa1 lifgam1 in
	                                  if (rel=[]) then 
                                             [ Relation (id1,cid1,mid1,"karma",id2,cid2,mid2,"5.7" ,d12)] (* karmaNi xviwIyA *) 
					  else []
                               else [ Relation (id1,cid1,mid1,"karma",id2,cid2,mid2,"5.8",d12) ]
              | "akarmaka" -> if (sanAxiH2="Nic")
                              then let rel = handle_sp_compounds id1 cid1 mid1 id2 cid2 mid2 rt1 word1 pUrvapaxa1 uwwarapaxa1 lifgam1 in
	                      if (not (rel=[])) then rel 
                              else [ Relation (id1,cid1,mid1,"karma",id2,cid2,mid2,"5.9",d12)] 
                              else []
              | _ -> []
              ] 
              else []
        | 3 ->  if (sanAxiH2="Nic")
                then let rel = handle_sp_compounds id1 cid1 mid1 id2 cid2 mid2 rt1 word1 pUrvapaxa1 uwwarapaxa1 lifgam1 in
	             if (not (rel=[])) then rel 
		     else [ Relation (id1,cid1,mid1,"maXyasWakarwA",id2,cid2,mid2,"5.10" ,d12)  ]
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
  [ Wif (id2,cid2,mid2,_,rt2,_,_,upasarga2,_,_,_,_,_,_,_,_,_)
  | Kqw (id2,cid2,mid2,_,rt2,upasarga2,_,_,_,_,_,_,_,_,_,_,_,_) 
  | Avykqw (id2,cid2,mid2,_,rt2,_,_,upasarga2,_,_,_,_,_) ->
     match m1 with
     [ AvywaxXiwa (id1,cid1,mid1,word1,rt1,_,_,taddhita1,_)->
       let  d12 = if id1 > id2 then id1-id2 else id2-id1 in
       if prose_order id1 id2 text_type  && taddhita1="wasil" && no_boundary_crossing_with_iwi id1 id2 text_type
       then if members_of rt2 upasarga2 apAxAna_verbs && (not(member_of rt1 guNavacana) || pronominal123 rt1)
       then [ Relation (id1,cid1,mid1,"apAxAnam",id2,cid2,mid2,"6.1",d12)] 
     (*  This leads to over generalisation, since only few waH ending words are kriyAviSeRaNas. We list them in the kriyAviSeRaNa list
 else if not (member_of rt1 xravyavAcI) 
       then [ Relation (id1,cid1,mid1,"kriyAviSeRaNam",id2,cid2,mid2,"5.2",d12)]  *)
       else if member_of (word1^" avy") kriyAviSeRaNas
       then [ Relation (id1,cid1,mid1,"kriyAviSeRaNam",id2,cid2,mid2,"6.2",d12)] 
       else [ Relation (id1,cid1,mid1,"hewuH5",id2,cid2,mid2,"6.3",d12)] 
       else []
     | Avy (id1,cid1,mid1,word1,_,_,uwwarapaxa1,_) -> 
       let  d12 = if id1 > id2 then id1-id2 else id2-id1 in
       if prose_order id1 id2 text_type && no_boundary_crossing_with_iwi id1 id2 text_type && (word1="wawaH" || word1="kuwaH")
       then if members_of rt2 upasarga2 apAxAna_verbs
       then [ Relation (id1,cid1,mid1,"apAxAnam",id2,cid2,mid2,"6.4",d12)] 
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
  [ Wif (id2,cid2,mid2,word2,_,pUrvapaxa2,uwwarapaxa2,_,_,_,_,_,_,_,_,_,_) 
  | Avykqw (id2,cid2,mid2,word2,_,pUrvapaxa2,uwwarapaxa2,_,_,_,_,_,_) -> 
    (* kaWam waw jFeyam ? *)
     if  pUrvapaxa2="y" || uwwarapaxa2="y" then []
     else match m1 with
     [ Avykqw (id1,cid1,mid1,word1,_,_,uwwarapaxa1,_,_,_,_,_,_)
     | Avy (id1,cid1,mid1,word1,_,_,uwwarapaxa1,_) -> 
       if prose_order id1 id2 text_type 
       then if word1="yaxA" 
            then if id2 < waxA_pos.val 
                 then kv_or_spl_aXi cid1 id1 mid1 id2 cid2 mid2 word1 text_type
                 else []
            else kv_or_spl_aXi id1 cid1 mid1 id2 cid2 mid2 word1 text_type
       else []
     | AvywaxXiwa (id1,cid1,mid1,word1,_,_,uwwarapaxa1,taddhita1,_) -> 
       let  d12 = if id1 > id2 then id1-id2 else id2-id1 in
       if prose_order id1 id2 text_type && taddhita1="vaw" 
       then [ Relation (id1,cid1,mid1,"kriyAviSeRaNam",id2,cid2,mid2,"7.1",d12)]
       else kv_or_spl_aXi id1 cid1 mid1 id2 cid2 mid2 word1  text_type
     (* | Sup (id1,cid1,mid1,word1,_,_,uwwarapaxa1,_,_,_,_)->
       if  prose_order id1 id2 text_type 
       then kv_or_spl_aXi id1 cid1 mid1 id2 cid2 mid2 word1 text_type
       else [] 
    This is covered under anaBihiwe 3.20 *)
     |_ -> []
     ]
  | Kqw (id2,cid2,mid2,word2,_,_,_,kqw_prawyaya2,_,_,_,pUrvapaxa2,uwwarapaxa2,_,_,_,_,_)   ->
     if  pUrvapaxa2="y" || uwwarapaxa2="y" then []
     else if kqw_prawyaya2 ="kwa" || kqw_prawyaya2 ="kwavawu"
     then match m1 with
     [ Avykqw (id1,cid1,mid1,word1,_,_,uwwarapaxa1,_,_,_,_,_,_)
     | Avy (id1,cid1,mid1,word1,_,_,uwwarapaxa1,_) -> 
       if prose_order id1 id2 text_type 
       then if word1="yaxA" 
            then if id2 < waxA_pos.val 
                 then kv_or_spl_aXi id1 cid1 mid1 id2 cid2 mid2 word1  text_type
                 else []
            else kv_or_spl_aXi id1 cid1 mid1 id2 cid2 mid2 word1 text_type
       else []
     | AvywaxXiwa (id1,cid1,mid1,word1,_,_,uwwarapaxa1,taddhita1,_) -> 
       let  d12 = if id1 > id2 then id1-id2 else id2-id1 in
       if prose_order id1 id2 text_type && taddhita1="vaw" 
       then [ Relation (id1,cid1,mid1,"kriyAviSeRaNam",id2,cid2,mid2,"7.2",d12)]
       else kv_or_spl_aXi id1 cid1 mid1 id2 cid2 mid2 word1  text_type
     (* | Sup (id1,cid1,mid1,word1,_,_,uwwarapaxa1,_,_,_,_)->
       if  prose_order id1 id2 text_type 
       then kv_or_spl_aXi id1 cid1 mid1 id2 cid2 mid2 word1 text_type
       else [] 
    This is covered under anaBihiwe 3.20 *)
     |_ -> []
     ]
     else []
  | _ -> []
  ]
  ;

value rlkriyAviSeRaNam_wqwIyA m1 m2 text_type = match m2 with
  [ Wif (id2,cid2,mid2,_,_,_,_,_,_,_,_,_,_,_,_,_,_) 
  | Kqw (id2,cid2,mid2,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_)  
  | Avykqw (id2,cid2,mid2,_,_,_,_,_,_,_,_,_,_) -> 
     match m1 with
     [ WaxXiwa (id1,cid1,mid1,_,_,_,uwwarapaxa1,_,_,viBakwiH1,_,_) 
     | Kqw (id1,cid1,mid1,_,_,_,_,_,_,_,_,_,_,uwwarapaxa1,_,viBakwiH1,_,_)
     | Sup (id1,cid1,mid1,_,_,_,uwwarapaxa1,_,viBakwiH1,_,_) -> 
       let  d12 = if id1 > id2 then id1-id2 else id2-id1 in
            if (member_of (uwwarapaxa1^" "^string_of_int viBakwiH1) kriyAviSeRaNas) (* yogyawA *) (*&& lifgam1="napuM"*)
            then [ Relation (id1,cid1,mid1,"kriyAviSeRaNam",id2,cid2,mid2,"8.1",d12)] (* vegena XAvawi *)  (* yogyawA *)
            else []
     | _ -> []
     ]
  | _ -> []
  ]
;
value spl_aXikaraNa id1 id2 cid1 cid2 mid1 mid2 word1 text_type wif_kqw rl1 rl2 rl3 rl4 =
       let  d12 = if id1 > id2 then id1-id2 else id2-id1 in
       if    prose_order id1 id2 text_type 
	  && no_boundary_crossing1 id1 id2 
       then
          if (word1="yaxA" && id2 < waxA_pos.val )
                  (* In the case of waxA, only if there is no finite verb, link it with the kqw *)
          then [ Relation (id1,cid1,mid1,"kAlAXikaraNam",id2,cid2,mid2,rl1,d12) ]
          else if (word1="waxA" && finite_verb_in_sentence.val == 50 && wif_kqw="kqw")
               then [ Relation (id1,cid1,mid1,"kAlAXikaraNam",id2,cid2,mid2,rl2,d12) ]
               else if (word1="waxA" && finite_verb_in_sentence.val < 50 && wif_kqw="wif")
                    then [ Relation (id1,cid1,mid1,"kAlAXikaraNam",id2,cid2,mid2,rl3,d12) ]
                    else if (word1="yawra" && id2 < wawra_pos.val ) || word1="wawra"
                         then [ Relation (id1,cid1,mid1,"xeSAXikaraNam",id2,cid2,mid2,rl4,d12) ]
                         else []
       else []
;

(* This is needed here, since waxA should not be marked as an aXikaraNa, if it occurs single with kwvA, lyap etc. *)
value rl_spl_aXikaraNam m1 m2 text_type = match m2 with
  [ Wif (id2,cid2,mid2,_,_,_,_,_,_,_,_,_,_,_,_,_,_) ->
     match m1 with
     [ Avy (id1,cid1,mid1,word1,_,_,uwwarapaxa1,_) -> 
           spl_aXikaraNa id1 id2 cid1 cid2 mid1 mid2 word1 text_type "wif" "9.1" "9.2" "9.3" "9.4"
     | _ -> []
     ]
  | Kqw (id2,cid2,mid2,_,_,_,_,kqw2,_,_,_,_,_,_,_,_,_,_) ->
     if kqw2 = "anIyar" || kqw2 = "yaw" || kqw2 = "kwa" || kqw2 = "kwavawu"|| kqw2 = "wavyaw"
     then match m1 with
     [ Avy (id1,cid1,mid1,word1,_,_,uwwarapaxa1,_) -> 
         spl_aXikaraNa id1 id2 cid1 cid2 mid1 mid2 word1 text_type "kqw" "9.5" "9.6" "9.7" "9.8"
     |_ -> []
     ]
     else []
  | _ -> []
  ]
  ;


value rlviRayAXikaraNam m1 m2 text_type = match m2 with
   [ Sup (id2,cid2,mid2,_,rt2,_,_,_,_,_,_)
   | Kqw (id2,cid2,mid2,_,_,_,_,_,_,_,_,rt2,_,_,_,_,_,_)
   | WaxXiwa (id2,cid2,mid2,_,rt2,_,_,_,_,_,_,_) -> 
      match m1 with
      [ Sup (id1,cid1,mid1,_,_,_,_,_,viBakwiH1,_,_)
      | Kqw (id1,cid1,mid1,_,_,_,_,_,_,_,_,_,_,_,_,viBakwiH1,_,_)
      | WaxXiwa (id1,cid1,mid1,_,_,_,_,_,_,viBakwiH1,_,_) ->
          let  d12 = if id1 > id2 then id1-id2 else id2-id1 in
          if prose_order id1 id2 text_type && no_boundary_crossing_with_iwi id1 id2 text_type
          then match viBakwiH1 with
          [ 7 -> if member_of rt2 viRayAXikaraNa_nouns
                 then [ Relation (id1,cid1,mid1,"viRayAXikaraNam",id2,cid2,mid2,"9.1",d12)] 
                 else []
          | _ -> []
          ]
          else []
      | _ -> []
      ]
   | _ -> []
   ]
;

value xeSakAlAXikaraNam id1 cid1 mid1 id2 cid2 mid2 word1 rl1 rl2 =
       let  d12 = if id1 > id2 then id1-id2 else id2-id1 in
       if member_of word1 kAlAXikaraNas
       then  [ Relation (id1,cid1,mid1, "kAlAXikaraNam",id2,cid2,mid2,rl1, d12)] 
       else if member_of word1 xeSAXikaraNas
            then  [ Relation (id1,cid1,mid1, "xeSAXikaraNam",id2,cid2,mid2,rl2, d12)] 
            else []
;

value rlaXikaraNam m1 m2 text_type = match m2 with
   [ Wif (id2,cid2,mid2,_,_,_,_,_,_,_,_,_,_,_,_,_,_) 
   | Kqw (id2,cid2,mid2,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_)
   | Avykqw (id2,cid2,mid2,_,_,_,_,_,_,_,_,_,_) -> 
      match m1 with
      [ Sup (id1,cid1,mid1,word1,_,_,_,_,viBakwiH1,_,_)
      | WaxXiwa (id1,cid1,mid1,word1,_,_,_,_,_,viBakwiH1,_,_) ->
             if prose_order id1 id2 text_type && no_boundary_crossing_with_iwi id1 id2 text_type
             then xeSakAlAXikaraNam id1 cid1 mid1 id2 cid2 mid2 word1 "10.1" "10.2"
             else []
      | Kqw (id1,cid1,mid1,word1,_,_,_,kqw_prawyayaH1,_,_,_,rt1,_,_,_,viBakwiH1,_,_) ->
             if    not (kqw_prawyayaH1="Sawq_lat"
                     || kqw_prawyayaH1="SAnac"
                     || kqw_prawyayaH1="kwa"
                     || kqw_prawyayaH1="kwavawu")
                &&  prose_order id1 id2 text_type && no_boundary_crossing_with_iwi id1 id2 text_type
            then xeSakAlAXikaraNam id1 cid1 mid1 id2 cid2 mid2 word1 "10.1" "10.2"
            else []
              (* covered in BAvalakRaNa sapwamI
                praBAwe -- Sawq_lat; is aXikaraNa  Hence above condition is commented 14 April 2017
                ... gacCawi ... paTawi; here gacCawi is marked as aXikaraNa. 
                To stop this, again this is uncommented. 26th May 2018 *)

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

value kwvA_lyap id1 cid1 mid1 id2 cid2 mid2 kqw1 text_type rl1 =
       let  d12 = if id1 > id2 then id1-id2 else id2-id1 in
       if    prose_order id1 id2 text_type 
          (*&& no_boundary_crossing_with_iwi id1 id2 text_type 
          BhG 1.20-21 
aWa ... xqRtvA ... waxA .. Aha;  xqRtvA is related to Aha *)
       then if (kqw1="kwvA" || kqw1="lyap")
            then [ Relation (id1,cid1,mid1,"pUrvakAlaH",id2,cid2,mid2,rl1,d12)] 
                  (* samAna karwqkayoH pUrvakAle  rAmaH xugXam pIwvA vanam gacCawi*)  
            else []
      else []
;

(* Verb-verb relations *)
(* rAmaH xugXam pIwvA vanam gacCawi *)
(* assign_assign_prayojana_avykqw *)
value rlpUrvakAla m1 m2 text_type = match m2 with
  [ Wif (id2,cid2,mid2,_,_,_,_,_,_,_,_,_,_,_,_,_,_) ->
     match m1 with
     [ Avykqw (id1,cid1,mid1,_,_,_,_,_,_,kqw1,_,_,_) ->
       kwvA_lyap id1 cid1 mid1 id2 cid2 mid2 kqw1 text_type "12.1"
     | _ -> []
     ]
  | Avykqw (id2,cid2,mid2,_,_,_,_,_,_,kqw2,_,_,_) ->
     match m1 with
     [ Avykqw (id1,cid1,mid1,_,_,_,_,_,_,kqw1,_,_,_) ->
         if not (kqw2="kwvA" || kqw2="lyap"|| kqw2 ="wumun") (* Korada Subrahmanyam *)
         then kwvA_lyap id1 cid1 mid1 id2 cid2 mid2 kqw1 text_type "12.2"
             (* samAna karwqkayoH pUrvakAle  rAmaH xugXam pIwvA vanam gacCawi*)  
        else []
     | _ -> []
     ]
   | Kqw (id2,cid2,mid2,_,_,_,_,kqw_prawyayaH2,_,_,_,_,_,_,_,viBakwiH2,vacanam2,_) ->
     (* if not (viBakwiH2=7) 
     && not(kqw_prawyayaH2="GaF") (* to avoid relation of jFAwvA with niScaya in niScayaM jFAwvA *)
            (* to avoid relating xqRtvA with pravqwwe in
               aWa vyavasWiwAn xqRtvA XArwarARtrAn kapi-XvajaH.
               pravqwwe Saswra-sampAwe XanuH uxyamya pANdavaH..1.20
               hqRIkeSam waxA vAkyam ixam Aha mahI-pawe. 
               better explanation needed  -- Amba 4th Dec 2018*) *)
     if (kqw_prawyayaH2="kwa" || kqw_prawyayaH2="kwavawu")
     && viBakwiH2=1
    && not (vacanam2="xvi")
     then match m1 with
     [ Avykqw (id1,cid1,mid1,_,_,_,_,_,_,kqw1,_,_,_) ->
       kwvA_lyap id1 cid1 mid1 id2 cid2 mid2 kqw1 text_type "12.3"
     | _ -> []
     ]
     else []
   | _ -> []
   ]
;

value wumun id1 cid1 mid1 id2 cid2 mid2 kqw1 rt2 upasarga2 viBakwiH2 text_type rl1 rl2 rl3 =
      let  d12 = if id1 > id2 then id1-id2 else id2-id1 in
      if prose_order id1 id2 text_type && kqw1="wumun" && not (viBakwiH2 = 8) 
      && no_boundary_crossing_with_iwi id1 id2 text_type
      then if (rt2="iR2" || rt2="icCuka") 
           then [ Relation ( id1,cid1,mid1,"iRkarma",id2,cid2,mid2,rl1,d12)] 
           else if (members_of rt2 upasarga2 shakAxi)
            then [ Relation (id2,cid2,mid2,"sahAyakakriyA",id1,cid1,mid1,rl2,d12)]
            else if not (rt2="as2") then [ Relation (id1,cid1,mid1,"prayojanam1",id2,cid2,mid2,rl3,d12)]
                 else []
      else []
;

(* rAmaH puswakam paTiwum gqham gacCawi 
 rAmaH puswakam paTiwum gacCanwam bAlakam paSyawi. *)
(* rAmaH puswakam paTiwum Saknowi *)
(* SakxqSglA ... 3.4.65 *)

value rlwumun1 m1 m2 text_type = match m2 with
  [ Wif (id2,cid2,mid2,_,rt2,_,_,upasarga2,_,_,_,_,_,_,_,_,_) ->
     match m1 with
     [ Avykqw (id1,cid1,mid1,_,_,_,_,_,_,kqw1,_,_,_) ->
          wumun id1 cid1 mid1 id2 cid2 mid2 kqw1 rt2 upasarga2 0 text_type "13.1" "13.2" "13.3"
     | _ -> []
     ]
  | Avykqw (id2,cid2,mid2,_,rt2,_,_,upasarga2,_,kqw2,_,_,_) -> 
     if not (kqw2 = "wumun") then
       match m1 with
       [ Avykqw (id1,cid1,mid1,_,_,_,_,_,_,kqw1,_,_,_) ->
            wumun id1 cid1 mid1 id2 cid2 mid2 kqw1 rt2 upasarga2 0 text_type "13.1" "13.2" "13.3"
       | _ -> []
       ]
     else []
  | Kqw (id2,cid2,mid2,_,rt2,upasarga2,_,_,_,_,_,_,_,_,_,viBakwiH2,_,_) ->
     match m1 with
     [ Avykqw (id1,cid1,mid1,_,_,_,_,_,_,kqw1,_,_,_) ->
          if not(viBakwiH2=7) && not(rt2="iR2") then  (* to avoid sawi sapwami cases getting a karma *)
          wumun id1 cid1 mid1 id2 cid2 mid2 kqw1 rt2 upasarga2 viBakwiH2 text_type "13.4" "13.5" "13.6"
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
  [ Kqw (id2,cid2,mid2,word2,_,_,_,_,_,_,_,_,rt2,pUrvapaxa2,uwwarapaxa2,_,_,_) 
  | Sup (id2,cid2,mid2,word2,rt2,pUrvapaxa2,uwwarapaxa2,_,_,_,_) 
  | Avy (id2,cid2,mid2,word2,rt2,pUrvapaxa2,uwwarapaxa2,_) ->
     match m1 with
     [ Avykqw (id1,cid1,mid1,_,_,_,_,_,_,kqw1,_,_,_) ->
      let  d12 = if id1 > id2 then id1-id2 else id2-id1 in
      if prose_order id1 id2 text_type && kqw1="wumun" 
      && no_boundary_crossing_with_iwi id1 id2 text_type
      then match word2 with
           [ "SakwaH" | "SakwA" | "samarWaH" | "samarWA" | "paryApwaH" | "paryApwA" | "alam" | "a-samarWaH"->
                 [ Relation (id1,cid1,mid1,"prayojanam1",id2,cid2,mid2,"14.1",d12)]
           | _ -> []
           ]
      else []
     | _ -> []
     ]
  | _ -> []
  ]
;

value rlkwa_as m1 m2 text_type = 
  match m2 with
  [ Wif (id2,cid2,mid2,_,rt2,_,_,_,_,_,_,_,_,_,_,_,_) ->
     match m1 with
     [ Kqw (id1,cid1,mid1,_,_,_,_,kqw1,_,_,_,_,_,_,_,_,_,_) ->
      let  d12 = if id1 > id2 then id1-id2 else id2-id1 in
       if    prose_order id1 id2 text_type 
          && rt2="as1" 
          && (kqw1="kwa"|| kqw1="kwavawu") 
          && no_boundary_crossing_with_iwi id1 id2 text_type
       then [ Relation (id1,cid1,mid1,"sahAyakakriyA",id2,cid2,mid2,"15.1",d12)]
       else []
     | _ -> []
     ]
  | _ -> []
  ]
;

value samAna_ananwarakAla id1 cid1 mid1 id2 cid2 mid2 text_type kqw1 viBakwiH1 vacanam1 vacanam2 rl1 rl2 =
     let  d12 = if id1 > id2 then id1-id2 else id2-id1 in
     if     prose_order id1 id2 text_type 
        && no_boundary_crossing_with_iwi id1 id2 text_type
        && viBakwiH1=1 && vacanam1 = vacanam2
     then if (kqw1="Sawq_lat" || kqw1="SAnac_lat") 
     then [ Relation (id1,cid1,mid1,"varwamAnasamAnakAlaH",id2,cid2,mid2, rl1,d12)]
     else if (kqw1="Sawq_lqt" || kqw1="SAnac_lqt") 
     then [ Relation (id1,cid1,mid1,"ananwarakAlaH",id2,cid2,mid2, rl2,d12)]
     else []
     else []
;

(* assign_samAnakAlikawvam *)
(* rAmaH grAmam gacCan wqNam spqSawi. *)
value rlsamAnakAla m1 m2 text_type = match m1 with
  [ Kqw (id1,cid1,mid1,word1,_,_,_,kqw1,_,_,_,_,pu1,uw1,_,viBakwiH1,vacanam1,_) -> 
        if not(pu1="y" || uw1="y") then
	match m2 with
       [ Wif (id2,cid2,mid2,_,_,_,_,_,_,_,_,_,vacanam2,_,_,_,_) ->
          samAna_ananwarakAla id1 cid1 mid1 id2 cid2 mid2 text_type kqw1 viBakwiH1 vacanam1 vacanam2 "16.1" "16.2"
       | Kqw (id2,cid2,mid2,word2,_,_,_,kqw2,_,_,_,_,pu2,uw2,_,viBakwiH2,vacanam2,_) ->
            if   not(pu2="y" || uw2="y")
             &&  not (viBakwiH2 = 8) &&  (kqw2 = "kwa" || kqw2 = "kwavawu" || kqw2 = "aNiyar" || kqw2 = "wavyaw") && finite_verb_in_sentence.val == 50
            then samAna_ananwarakAla id1 cid1 mid1 id2 cid2 mid2 text_type kqw1 viBakwiH1 vacanam1 vacanam2 "16.1" "16.2"
            else []
       |_ -> []
       ] else []
  | _ -> []
  ]
;
(* Noun Noun relation *)
(* assign_noun_viSeRaNa *)
(* grAmam gacCanwam rAmam SyAmaH paSyawi. *)
(* yogyawA *)
value rlviSeRaNam m1 m2 text_type = match m2 with
  [ Sup (id2,cid2,mid2,word2,rt2,pUrvapaxa2,uwwarapaxa2,lifgam2,viBakwiH2,vacanam2,_) 
  | Kqw (id2,cid2,mid2,word2,_,_,_,_,_,_,_,rt2,pUrvapaxa2,uwwarapaxa2,lifgam2,viBakwiH2,vacanam2,_) -> 
             (* if (member_of rt2 upAXi) then [] else  -- it is possible to have wAn rAkRasAn, wAn puwrAn, wAn AcAryAn, etc *)
                 (*| WaxXiwa (id2,cid2,mid2,word2,rt2,_,uwwarapaxa2,_,lifgam2,viBakwiH2,vacanam2,_) ->   *)
               (*  There is a problem with sentences such as 
               aham Bavanwam anviRyan upAgamam
               I think Head can not be kqw or waxxXiwa 
               Not clear about this. So uncommented kqw and waxXiwa -- Amba 26th Sep 2019

               Uncommented Kqw to handle
               kaH aByupAyaH aswi.
               *)
   match m1 with
      [ Sup (id1,cid1,mid1,word1,rt1,pUrvapaxa1,uwwarapaxa1,lifgam1,viBakwiH1,vacanam1,_) -> 
           let  d12 = if id1 > id2 then id1-id2 else id2-id1 in
           if no_boundary_crossing_except_kwvA id1 id2 text_type
              && (noun_agreement_vibh vacanam1 vacanam2 lifgam1 lifgam2 viBakwiH1 viBakwiH2) 
              &&  prose_order id1 id2 text_type
	      && (not ((rt1="arWa" || rt1 = "ananwaram" || word1 = "sahiwaH" || rt1 = "saxqSa" || rt1 = "safjASa" || rt1 = "pramuKa" || rt1 = "pUrveNa") && (uwwarapaxa1 = "y")))
           then if ( member_of rt1 saMKyeya || member_of rt1 pUraNa || member_of rt1 kqxanwas || member_of rt1 taddhitaantas || member_of rt1 guNavacana 
                  || pUrvapaxa1="y" || uwwarapaxa1="y" || ((rt1 = "sarva" || rt1 = "sarvA") &&  id1 > id2 && text_type = "Sloka")  || (pronoun3 rt1)
                   (* || (pronoun3 rt1 && (member_of rt2 manuRyasaFjFAvAcI || member_of rt2 sambanXavAcI || member_of rt2 upAXi)) -- ewAn camUm paSya fails *)
                  )
			(* pronoun3 rt1 is removed, since pronoun is preferred as a viSeRya in the absence of a manuRyasaFjFAvAci Sabxa *)
                && not (member_of rt1 sambanXavAcI) 
                && not (member_of rt1 upAXi) 
                && not (member_of rt1 manuRyasaFjFAvAcI) 
                   (* && (not (pUrvapaxa1="y" || uwwarapaxa1="y"))  || not (member_of uwwarapaxa1 xravyavAcI))  -- problematic with bahuvrIhi compounds *)
                && (not (rt1=rt2) || pUrvapaxa1="y" || uwwarapaxa1="y" || pUrvapaxa2="y" || uwwarapaxa2="y")
                                          (* && not (member_of rt1 sambanXavAcI) 
                                             && not (member_of rt1 upAXi) -- 
                                            Why these two needed? We are allowing only the words in a given lists - saMKyeya, pUraNa, etc. see above *)
                && not (rt2="yukwa") && not (rt2="yukwA")
                                           (* && not (pUrvapaxa1="sa") if the word agrees in g,n,v then mark it as a possible viseRaNam *)
                && not (rt1 = "yax" && rt2 = "wax" && not (viBakwiH1 == 1))
                                           (* yasmAw wasmAw -- not possible, but yaH saH is possible *)
                && not (rt1 = "wax" && lifgam1 = "napuM")
                && not ((rt1 = "ewax" || rt1="wax") && lifgam1 = "napuM" && (rt2="asmax" || rt2 = "yuRmax"))
		&& not (member_of rt2 saMKyeya)
		   (* && not (pronoun3 rt2)  && member_of rt1 upAXi; pronoun is always preferred as a viSeRya in the absence of a  prANisaFjFAvAci Sabxa *)
           then [ Relation (id1,cid1,mid1,"viSeRaNam",id2,cid2,mid2,"17.1",d12)]

           else if rt2 = get_assoc rt1 parAjAwi_list  (* && not (finite_verb_in_sentence.val = 50 && karwqsamverbs.val = 50) *)
           then [ Relation (id1,cid1,mid1,"viSeRaNam",id2,cid2,mid2,"17.2",d12)]

           else if (((member_of rt1 sambanXavAcI) || (member_of rt1 upAXi)) && (member_of rt2 manuRyasaFjFAvAcI || (rt2="samuxra" && rt1="pawi")))
                  (*&& not (member_of rt2 saMKyeya || member_of rt2 pUraNa || pronoun3 rt2 ))*)
                  (* && not (member_of rt2 guNavacana) ; this condition is not needed. If it is a viSeRaNa, then automatically, the constraint solver will reject 
                      this solution.  if this condition exists, xaSaraWasya puwraH rAmaH will not be parsed, since is in guNavacana list *)
                  (* && not (member_of rt2 sambanXavAcI) Why this condition? counter ex: wava XImawA SiRyeNa xrupaxa-puwreNa *)
           then [ Relation (id1,cid1,mid1,"aBexaH",id2,cid2,mid2,"17.3",d12)]
           else []

           else if rt1="miwra" && viBakwiH1=viBakwiH2 && vacanam1=vacanam2 && not ( member_of rt2 saMKyeya || member_of rt2 pUraNa )
           then [ Relation (id1,cid1,mid1,"aBexaH",id2,cid2,mid2,"17.4",d12)]
           else []

           (*not (finite_verb_in_sentence.val = 50 && karwqsamverbs.val = 50)
           &&  there can be just kqxanwa such as kwa/kwavawu as well *) 
           (* (id2 > id1 ) *) (* Even in Shlokas, the upAXi should come before the name || text_type = "Sloka"  I think id2 > id1  needs to be modified, look at vayam sarve below *)
           (*&& not (member_of (word2^" "^string_of_int viBakwiH2) kriyAviSeRaNas) (* why is this cond? *)*)
           (* pronoun3 -> pronominal123: mayA avyakwa-mUrwinA from SBG *)
           (* vayam sarve  ayaneRu ca sarveRu*)
           (* Even in Sloka, we can not have a pronoun after the viSeRya e.g. vArwA kA AsIw, here kA can not be viSeRaNa, it should be karwqsamAnAXikaraNam; manaH-sWiwiH kA aBavaw, kA is not a viSeRanam but karwqsamAnAXikaraNam *)
           (* && not (viBakwiH1 = 6) *) (* && (id2 = next id1) *)
           (* Example for viSeRaNa after the viSeRya ? 
            * Hence removed this -- || id2 > id1 *)
           (* && not (finite_verb_in_sentence.val = 50 && karwqsamverbs.val = 50)  -- removed since with kqxanwas, this does not work; e.g. bahUni kAvyAni paTiwAni hariNA ; bahUni is not marked as a viSeRaNam *)
           (*pronominal123 -> pronoun3; need good examples in support of asmax and yuRmax to be adjectives. mayA purA (BhG 3.2), was wrongly parsed as mayA as an adj of purA. To stop this, pronominal123 is changed to pronoun3; Malay  16th Aug 2019*)
           (* pronouns are immediately after the viSeRya e.g. vAkyam ixam *)
           (* && not (rt2="yax") && not (rt2="wax") *) 
           (* Whether to allow yax/wax or not: 
              What are the pros and cons of allowing Vs not allowing?
              We can have vyAkulaH saH, and also ye janAH ...*)
     (*| AvywaxXiwa (id1,cid1,mid1,word1,_,_,uwwarapaxa1,_,_) ->
       if prose_order id1 id2 text_type
       && no_boundary_crossing_except_kwvA id1 id2 text_type
       && (pUrvapaxa1="y" || uwwarapaxa1="y")
       then [ Relation (id1,cid1,mid1,"viSeRaNam",id2,cid2,mid2,"12.3",d12)]
       else [] 
      This introduced a link with every other word in case of wasil prawyaya
      *)
     | WaxXiwa (id1,cid1,mid1,_,rt1,_,_,_,lifgam1,viBakwiH1,vacanam1,_) -> if (member_of rt1 upAXi) then [] else
       let  d12 = if id1 > id2 then id1-id2 else id2-id1 in
       if prose_order id1 id2 text_type
       && not (finite_verb_in_sentence.val = 50 && karwqsamverbs.val = 50)
            && no_boundary_crossing_except_kwvA id1 id2 text_type
        && noun_agreement_vibh vacanam1 vacanam2 lifgam1 lifgam2 viBakwiH1 viBakwiH2
        && not (member_of (word2^" "^string_of_int viBakwiH2) kriyAviSeRaNas) (* Why is this cond? *)
        && not(rt1=rt2) && no_boundary_crossing_except_kwvA id1 id2 text_type
       then [ Relation (id1,cid1,mid1,"viSeRaNam",id2,cid2,mid2,"17.5",d12)]
       else []
     | Kqw (id1,cid1,mid1,_,_,_,_,kqw_prawyayaH1,_,_,_,rt1,_,_,lifgam1,viBakwiH1,vacanam1,_) -> 
       (* if (member_of rt1 upAXi) then [] else *)
       let  d12 = if id1 > id2 then id1-id2 else id2-id1 in
       if not (finite_verb_in_sentence.val = 50)
       (*&& not ( karwqsamverbs.val = 50) -- Why this condition? *)
       && no_boundary_crossing_except_kwvA id1 id2 text_type
       && ((viBakwiH1=viBakwiH2 && vacanam1=vacanam2 && niyawalifgam kqw_prawyayaH1)
          || noun_agreement_vibh vacanam1 vacanam2 lifgam1 lifgam2 viBakwiH1 viBakwiH2)
(* When it is Sawq_lat with viB = 1, then it is more likely that it is a kriyAviSeRaNa, linking directly with the wifganwa.
gacCan bAlakaH wqNam spqSawi / bAlakaH gacCan wqNam spqSawi *)
       && not (member_of (word2^" "^string_of_int viBakwiH2) kriyAviSeRaNas) (* Why is this cond? *)
       && not(rt1=rt2) && not(rt2="kim")
       then if (kqw_prawyayaH1="Sawq_lat") && (viBakwiH1 > 1 && viBakwiH1 < 7) (* vasawi papmAwIre rAmaH; with viBakwiH1=7, vasawi would become an adj of pampAwIre *)
       then [ Relation (id1,cid1,mid1,"viSeRaNam",id2,cid2,mid2,"17.6",d12)]
       else if prose_order id1 id2 text_type
         && not (kqw_prawyayaH1="Sawq_lat")
         && not (kqw_prawyayaH1="lyut")
         && not (kqw_prawyayaH1="wavyaw")
         && not (kqw_prawyayaH1="anIyar")
       then [ Relation (id1,cid1,mid1,"viSeRaNam",id2,cid2,mid2,"17.7",d12)]
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
  [ Sup (id1,cid1,mid1,word1,rt1,_,uwwarapaxa1,lifgam1,viBakwiH1,vacanam1,_)
  | Kqw (id1,cid1,mid1,word1,_,_,_,_,_,_,_,rt1,_,uwwarapaxa1,lifgam1,viBakwiH1,vacanam1,_)
  | WaxXiwa (id1,cid1,mid1,word1,rt1,_,uwwarapaxa1,_,lifgam1,viBakwiH1,vacanam1,_) -> 
   match m2 with
      [ Sup (id2,cid2,mid2,word2,rt2,_,uwwarapaxa2,lifgam2,viBakwiH2,vacanam2,_) ->
       let  d12 = if id1 > id2 then id1-id2 else id2-id1 in
       if id2=next id1
       && (noun_agreement_vibh vacanam1 vacanam2 lifgam1 lifgam2 viBakwiH1 viBakwiH2) 
       && ( rt2="sarva" || member_of rt2 saMKyeya )
       then [ Relation (id2,cid2,mid2,"parimANa_viSeRaNam",id1,cid1,mid1,"12.6",d12)]
       else []
      | _ -> []
      ]
  | _ -> []
  ]
  ;
*)
(* yogyawA *)
value rlavy_viSeRaNam m1 m2 text_type = match m2 with
  [ Sup (id2,cid2,mid2,_,rt2,_,_,lifgam2,viBakwiH2,vacanam2,_)
  | Kqw (id2,cid2,mid2,_,_,_,_,_,_,_,_,rt2,_,_,lifgam2,viBakwiH2,vacanam2,_)
  | WaxXiwa (id2,cid2,mid2,_,rt2,_,_,_,lifgam2,viBakwiH2,vacanam2,_) -> 
     match m1 with
     [ Avy (id1,cid1,mid1,word1,_,pUrvapaxa1,uwwarapaxa1,_) ->
       let  d12 = if id1 > id2 then id1-id2 else id2-id1 in
       (*if id1=previous id2 && member_of word1 avy_viSeRaNam_list*)
             (*  changed to id1 < id2 for handling kimapi safkRipwam SAswram *)
       if uwwarapaxa1="iva" &&  not (pUrvapaxa1 = uwwarapaxa1) && id1 = id2-1
       then [ Relation (id1,cid1,mid1,"upamAnam_rahiwa_upamAna_xyowakaH",id2,cid2,mid2,"18.1",d12)]
       else
       if id1 < id2 && member_of word1 avy_viSeRaNam_list
       then [ Relation (id1,cid1,mid1,"viSeRaNam",id2,cid2,mid2,"18.2",d12)]
       else if id1=previous id2 && member_of word1 intensifiers_list && not (pronominal123 rt2)
       && member_of rt2 guNavacana (* Once it is intensifier, we need not check if it is a guNavacana or not 
       This is not true. We may have param simhaH ... samarWaH na aswi, where paraM is not wIvrawAxarSI *)
       then [ Relation (id1,cid1,mid1,"wIvrawAxarSI",id2,cid2,mid2,"18.3",d12)]
(* This relation is added since it is an exception to the constraint that a kriyAviSeRaNa or a viSeRaNa can not have a viSeRaNa.
E.g. saH awIva vegena XAvawI / saH awIva sunxaram bAlakam paSyawi *)
       else []
     | Sup (id1,cid1,mid1,_,rt1,_,_,lifgam1,viBakwiH1,vacanam1,_) ->
       let  d12 = if id1 > id2 then id1-id2 else id2-id1 in
        if id1=previous id2 && member_of rt1 intensifiers_list && not (pronominal123 rt2)
       && (noun_agreement_vibh vacanam1 vacanam2 lifgam1 lifgam2 viBakwiH1 viBakwiH2) 
       && member_of rt2 guNavacana  (* Once it is intensifier, we need not check if it is a guNavacana or not  - not necessarily*)
       then [ Relation (id1,cid1,mid1,"wIvrawAxarSI",id2,cid2,mid2,"18.4",d12)]
       else []
(* kevala is not an avy *)
     | _ -> []
     ]
  | _ -> []
  ]
  ;

value rlsamboXana_xyowakaH m1 m2 text_type = match m2 with
  [ Sup (id2,cid2,mid2,_,_,_,_,_,viBakwiH2,_,_)
  | Kqw (id2,cid2,mid2,_,_,_,_,_,_,_,_,_,_,_,_,viBakwiH2,_,_)
  | WaxXiwa (id2,cid2,mid2,_,_,_,_,_,_,viBakwiH2,_,_) -> 
   match m1 with
     [ Avy (id1,cid1,mid1,word1,_,_,_,_) ->
       let  d12 = if id1 > id2 then id1-id2 else id2-id1 in
    if  id1=previous id2 
      && member_of word1 samboXana_sUcaka
      && viBakwiH2=8
       then [ Relation (id1,cid1,mid1,"samboXana_xyowakaH",id2,cid2,mid2,"19.1",d12)]
       else []
     | _ -> []
     ]
  (*| Wif (id2,cid2,mid2,_,rt2,_,_,_,_,_,_,_,_,_,_,_,_) ->
    match m1 with
     [ Avy (id1,cid1,mid1,word1,_,_,_,_) ->
       let  d12 = if id1 > id2 then id1-id2 else id2-id1 in
        if  member_of word1 samboXana_sUcaka
       then [ Relation (id1,cid1,mid1,"sambanXaH",id2,cid2,mid2,"14.2",d12)]
       else []
     | _ -> []
     ] *)
  | _ -> []
  ]
  ;

value nirXAraNam id1 cid1 mid1 id2 cid2 mid2 vacanam2 viBakwiH2 text_type rl1 =
       let  d12 = if id1 > id2 then id1-id2 else id2-id1 in
           if  ((id1=previous id2 && text_type = "Prose") || text_type = "Sloka")
               (* && vacanam2="eka" -- asmAkam viSiRtAH ye wAn niboXa xvija-uwwama *) (* && not(viBakwiH2=8) -- xehaBUwAm vara *)
           then [ Relation (id1,cid1,mid1,"nirXAraNam",id2,cid2,mid2,rl1,d12)]
           else []
;

value rlnirXAraNam m1 m2 text_type = match m1 with
      [ Sup (id1,cid1,mid1,_,rt1,_,_,lifgam1,viBakwiH1,vacanam1,_)
      | Kqw (id1,cid1,mid1,_,_,_,_,_,_,_,_,rt1,_,_,lifgam1,viBakwiH1,vacanam1,_)
      | WaxXiwa (id1,cid1,mid1,_,rt1,_,_,_,lifgam1,viBakwiH1,vacanam1,_) ->
               (* nqRu xvijaH SreRTaH Bavawi *)
           if     (viBakwiH1=6 || viBakwiH1=7)  
               && (vacanam1="xvi" || vacanam1="bahu")
           then match m2 with
             (* && (member_of rt2 guNavAcI || member_of rt2 sambanXavAcI) *)  (* yogyawA *)
             (* It is necessary to check  ((is_jAwi rt1) || (is_guNa rt1) || (is_kriyA rt1)); 
                jAwi-guNa-kriyABiH samuxAyAw ekasya pqWak-karaNam nirXAraNam  Under A 2.2.10 in kASikA *)
        [ Sup (id2,cid2,mid2,_,rt2,_,_,lifgam2,viBakwiH2,vacanam2,_)
        | Kqw (id2,cid2,mid2,_,_,_,_,_,_,_,_,rt2,_,_,lifgam2,viBakwiH2,vacanam2,_) ->
           if  ((rt2 = (get_assoc rt1 nirXAraNa_list)) 
                 || ((rt2 = "kiFciw" || rt2="vara" || rt2="SreRTa" (* || rt2="maXya" -- How can maXye be nirXAraNa? *)
                     || member_of (rt1^" "^rt2) amarakosha_jAwi
                     || member_of rt2 sambanXavAcI)  (* yogyawA *)
                    && lifgam1=lifgam2))
               (*|| member_of rt2 guNavacana --- removed, since otherwise wapasvI vAg-vixAma varam ...; it would mark the relation between wapasvI and vAg-vixAm also, in addition to vAg-vixAm varam *)
           then  nirXAraNam id1 cid1 mid1 id2 cid2 mid2 vacanam2 viBakwiH2 text_type "20.1" (* 2.3.41;*)
           else []
        | WaxXiwa (id2,cid2,mid2,_,rt2,_,_,waxXiwa_prawyayaH2,_,viBakwiH2,vacanam2,_) -> 
           if ((rt2 = (get_assoc rt1 nirXAraNa_list)) || waxXiwa_prawyayaH2="warap")
           then  nirXAraNam id1 cid1 mid1 id2 cid2 mid2 vacanam2 viBakwiH2 text_type "20.2" (* 2.3.41;*)
           else []
        | _ -> []
        ]
        else []
    | _ -> []
    ]
;

(* A sort of phrase formation: upapaxa and vIpsA *)

value rlvIpsA m1 m2 text_type = match m2 with
  [ Sup (id2,cid2,mid2,word2,rt2,_,uwwarapaxa2,lifgam2,viBakwiH2,vacanam2,_) -> match m1 with
     [ Sup (id1,cid1,mid1,word1,rt1,_,uwwarapaxa1,lifgam1,viBakwiH1,vacanam1,_) -> 
	if not (uwwarapaxa1 = "y") && not (uwwarapaxa2 = "y")
        then supAxi_vIpsa id1 cid1 mid1 id2 cid2 mid2 word1 word2 rt1 rt2 vacanam1 vacanam2 lifgam1 lifgam2 viBakwiH1 viBakwiH2 "21.1"
	else []
     | _ -> []
     ]
  | Kqw (id2,cid2,mid2,word2,_,_,_,_,_,_,_,rt2,_,uwwarapaxa2,lifgam2,viBakwiH2,vacanam2,_) -> match m1 with
     [ Kqw (id1,cid1,mid1,word1,_,_,_,_,_,_,_,rt1,_,uwwarapaxa1,lifgam1,viBakwiH1,vacanam1,_) ->
	if not (uwwarapaxa1 = "y") && not (uwwarapaxa2 = "y")
        then supAxi_vIpsa id1 cid1 mid1 id2 cid2 mid2 word1 word2 rt1 rt2 vacanam1 vacanam2 lifgam1 lifgam2 viBakwiH1 viBakwiH2 "22.2"
	else []
     | _ -> []
     ]
  | WaxXiwa (id2,cid2,mid2,word2,rt2,_,_,uwwarapaxa2,lifgam2,viBakwiH2,vacanam2,_) -> match m1 with
     [ WaxXiwa (id1,cid1,mid1,word1,rt1,_,_,uwwarapaxa1,lifgam1,viBakwiH1,vacanam1,_) ->
	if not (uwwarapaxa1 = "y") && not (uwwarapaxa2 = "y")
        then supAxi_vIpsa id1 cid1 mid1 id2 cid2 mid2 word1 word2 rt1 rt2 vacanam1 vacanam2 lifgam1 lifgam2 viBakwiH1 viBakwiH2 "23.3"
	else []
     | _ -> []
     ]
  | Avy (id2,cid2,mid2,word2,_,_,uwwarapaxa2,_) -> match m1 with
     [ Avy (id1,cid1,mid1,word1,_,_,uwwarapaxa1,_) ->
       let  d12 = if id1 > id2 then id1-id2 else id2-id1 in
       if   id1=previous id2 
         && word1=word2
	 && not (uwwarapaxa1 = "y") && not (uwwarapaxa2 = "y")
       then [ Relation (id1,cid1,mid1,"vIpsA",id2,cid2,mid2,"24.4",d12)]
       else []
     | _ -> []
     ]
  | _ -> []
  ]
  ;

value rlupapaxa m1 m2 text_type = match m2 with
   [ Avy (id2,cid2,mid2,word2,rt2,_,_,_)
   | AvywaxXiwa (id2,cid2,mid2,word2,rt2,_,_,_,_)
   | Sup (id2,cid2,mid2,word2,rt2,_,_,_,_,_,_)
   | Kqw (id2,cid2,mid2,word2,_,_,_,_,_,_,_,rt2,_,_,_,_,_,_)
   | Avykqw (id2,cid2,mid2,word2,rt2,_,_,_,_,_,_,_,_)
   | WaxXiwa (id2,cid2,mid2,word2,rt2,_,_,_,_,_,_,_) ->
      match m1 with
      [ Sup (id1,cid1,mid1,_,rt1,_,_,_,viBakwiH1,_,_)
      | Kqw (id1,cid1,mid1,_,_,_,_,_,_,_,_,rt1,_,_,_,viBakwiH1,_,_)
      | WaxXiwa (id1,cid1,mid1,_,rt1,_,_,_,_,viBakwiH1,_,_) ->
       let  d12 = if id1 > id2 then id1-id2 else id2-id1 in
         if   (id1=previous id2 || id1 = id2-2 (* to handle 'rAmeNa ca saha *)
               || (id1=next id2  && text_type = "Sloka") || ((word2="hA" || word2 = "Xik") && id1=next id2) || ((word2="alam") && id1=next id2))
         then match viBakwiH1 with
         [ 2  -> match word2 with
                 [ "aBiwaH" | "pariwaH" | "nikaRA" | "samayA" 
                   | "uparyupari" | "aXoXaH" | "aXoZXaH" | "aXyaXi" | "uBayawaH" 
                   | "sarvawaH" -> 
                    [Relation (id1,cid1,mid1,"upa_apekRA",id2,cid2,mid2,"25.1",d12)]
                 | "hA" | "Xik" ->
                    [Relation (id2,cid2,mid2,"uxgAravAcakaH",id1,cid1,mid1,"25.2",d12)]
                 | "prawi" ->
                    [ Relation (id1,cid1,mid1,"upa_ABimuKyam",id2,cid2,mid2,"25.3",d12)
                    ; Relation (id1,cid1,mid1,"upa_karmapravacanIyaH",id2,cid2,mid2,"25.4",d12)
                    ]
                 | "aBi" | "anu" (* |"api"   Discuss with Sanjeev *) ->
                    [Relation (id1,cid1,mid1,"upa_karmapravacanIyaH",id2,cid2,mid2,"25.5",d12)]
		 | "anwarA" | "uwwareNa" | "xakRiNena" | "aXareNa" -> 
                    [Relation (id1,cid1,mid1,"upa_apekRA",id2,cid2,mid2,"25.6",d12)]
                 | _ -> []
                 ]
         | 3  -> match rt2 with
                 [ "samAna" | "samAnA" | "saxqkRa" | 
                   "saxqkRA" | "saxqkRI" | "saxqSA" | "saxqSa" | "saxqS" | 
                   "wulya" | "wulyA" | (* "yukwa" | *)  "samA" ->  (* yukwa cannot have wulanA binxu *)
                    [Relation (id1,cid1,mid1,"wulanA_binxuH",id2,cid2,mid2,"25.7",d12)]
                 | "uwsuka" | "prasiwa" | "uwsukA" | "prasiwA" ->
                    [Relation (id1,cid1,mid1,"viRayAXikaraNam",id2,cid2,mid2,"25.8",d12)]
                 | _ -> match word2 with
                    [ "alam" ->
                      [Relation (id2,cid2,mid2,"prawiReXaH",id1,cid1,mid1,"25.9",d12)]
                    | _ -> []
                    ]
                 ]
        | 4 -> match word2 with
		 [ "alam" | "praBuH" | "SakwaH"  ->
                    [Relation (id1,cid1,mid1,"upa_apekRA",id2,cid2,mid2,"25.10",d12)]
                 | "AyuRyam" |"Baxram" | "ciraFjIviwam" |
                   "hiwam" | "kuSalam" | "maxram" | "nirAmayam" | "Sam" |
                   "suKam" | "svAhA" | "svaswi" | "svaXA" | "vaRat"  ->
                    [Relation (id1,cid1,mid1,"prayojanam1",id2,cid2,mid2,"25.11",d12)]
                 | "namaH" ->
                    [Relation (id1,cid1,mid1,"prayojanam1",id2,cid2,mid2,"25.12",d12)]
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
                    [Relation (id1,cid1,mid1,"upa_apekRA",id2,cid2,mid2,"25.13",d12)]
                 | "apa" | "pari" | "prawi" ->
                    [Relation (id1,cid1,mid1,"upa_karmapravacanIyaH",id2,cid2,mid2,"25.14",d12)]
                 | "A" ->
                    [Relation (id1,cid1,mid1,"upa_karmapravacanIyaH",id2,cid2,mid2,"25.15",d12)]
                 | "AraBya" | "praBqwiH" ->
                       [Relation (id1,cid1,mid1,"upa_AramBa_binxuH",id2,cid2,mid2,"25.16",d12)]
                 | _ -> match rt2 with
                     [  "Binna" | "BinnA" | "iwara" | "iwarA" | "pUrvA" | "pUrva" | "vilakRaNa" | 
                       "vilakRaNA"| "anya" | "anyA" ->
                       [Relation (id1,cid1,mid1,"wulanA_binxuH",id2,cid2,mid2,"25.17",d12)]
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
                    "maXye" (* added by amba *) | 
                    "xakRiNAhi" -> (* added by amba *)
                       [Relation (id1,cid1,mid1,"upa_apekRA",id2,cid2,mid2,"25.18",d12)]
 
		 | "AyuRyam" |"Baxram" | "ciraFjIviwam" |
                   "hiwam" | "kuSalam" | "maxram" | "nirAmayam" | "Sam" |
                   "suKam" |"arWe" 
        (* | "kqwe" *) ->
                    [Relation (id1,cid1,mid1,"prayojanam1",id2,cid2,mid2,"25.19",d12)]
                 | "xakRiNe" | "uwware" ->
                         [Relation (id1,cid1,mid1,"aXikaraNam",id2,cid2,mid2,"25.20",d12)]
                 | _ -> match rt2 with
                   [ "samAna" | "samAnA" | "saxqkRa" | "saxqkRI" |
                     "saxqS" |  "saxqkRA" |  "saxqSA" | "saxqSa" |
                     "wulya" | "wulyA" | (*"yukwa" |*) "samA"| "sama"  -> (*yukwa has an expectancy of 3/karaNa *)
                       [Relation (id1,cid1,mid1,"wulanA_binxuH",id2,cid2,mid2,"25.21",d12)]
                   | "prasUwA" | "prasUwa" ->
                       [Relation (id1,cid1,mid1,"nirXAraNam",id2,cid2,mid2,"25.22",d12)]
                   | "aXipawi" | "ISvara"  | "prawiBU" | "sAkRin" | "sAkRiNI" |
                     "xAyAxa" | "svAmin" | "svAminI" ->
                       [Relation (id1,cid1,mid1,"aBexaH",id2,cid2,mid2,"25.23",d12)]
                   | _ -> []
                   ] 
                 ]
        | 7 -> match rt2 with
               ["anurakwa" | "anurakwA" | "Asakwa" | "AsakwA" |
                "Ayukwa" | "AyukwA" | (*"yukwa" | *) "kuSala" |"kuSAlA" | "lagna"|
                "lagnA" | "nipuNA" | "nipuNa" | "prasiwa" | "prasiwA" | "kOSala" | "pravqwwa" |
                "uwsuka" | "uwsukA" | "sAXu" | "sAXvI" | "asAXvI" | "asAXu" ->
                       [Relation (id1,cid1,mid1,"viRayAXikaraNam",id2,cid2,mid2,"25.24",d12)]
                       (* why should yukwa have viRayAXikaraNa ? any example? *)
               | "prawiBU" |"sAkRiNI" | "sAkRin" | "svAmin" | "svAminI" | 
                  "ISvara" | "xAyAxa" | "aXipawi" ->
                       [Relation (id1,cid1,mid1,"aBexaH",id2,cid2,mid2,"25.25",d12)]
               | "prasUwA" | "prasUwa"  ->
                       [Relation (id1,cid1,mid1,"nirXAraNam",id2,cid2,mid2,"25.26",d12)]
               | _ -> match word2 with
                     [ "aXi" | "upa" ->
                         [Relation (id1,cid1,mid1,"upa_karmapravacanIyaH",id2,cid2,mid2,"25.27",d12)]
                      | _ -> [] 
                      ]
               ]
        | 8 -> if rt2="namaH" 
               then [Relation (id1,cid1,mid1,"samboXyaH",id2,cid2,mid2,"25.28",d12)]
               else []
        | _ -> []
        ]
        else []
     | AvywaxXiwa (id1,cid1,mid1,word1,rt1,_,_,waxXiwaprawyayaH1,_) ->
       let  d12 = if id1 > id2 then id1-id2 else id2-id1 in
            if waxXiwaprawyayaH1 = "wasil" && rt2 = "prawi" 
            then  [Relation (id1,cid1,mid1,"upa_karmapravacanIyaH",id2,cid2,mid2,"25.29",d12)]
            else []
     | Avy (id1,cid1,mid1,word1,rt1,_,_,_) -> 
       let  d12 = if id1 > id2 then id1-id2 else id2-id1 in
                if word1="axya"
                then match word2 with
                 ["AraBya" | "praBqwiH" ->
                     [Relation (id1,cid1,mid1,"upa_AramBa_binxuH",id2,cid2,mid2,"25.30",d12)]
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
  [ Sup (id1,cid1,mid1,word1,rt1,_,_,_,viB1,_,_)
  | Kqw (id1,cid1,mid1,word1,_,_,_,_,_,_,_,rt1,_,_,_,viB1,_,_)
  | WaxXiwa (id1,cid1,mid1,word1,rt1,_,_,_,_,viB1,_,_) ->
   if not (viB1=8) then
    match word1 with
       [ "aByASam" | "aByASaH" | "aByASAw" | "aByASe" | "aByASA" | "aByASena" | "pUrvam" | "pUrvAn"|
         "anwikam" | "anwikAw" | "anwike" | "anwikena" | "anwikAn" | "prAcI" | "prAk" | "pUrvA" | "pUrvaH" | 
         "prAFca" | "prawyaFca" | "prawyak" | "avAcI" | "avAc" |"prawIcI" | "uxac" | "uxak" | "uxIcI"|
         "samIpam" | "samIpAw" | "samIpe" | "samIpena" | "uwwaram" | "paScimA" | "paScimam" | "paScimAn" | 
	 "uwware" | "viprakqRtam" | "viprakqRtAw" | "viprakqRtA" |  "maXye" | 
         "viprakqRte" | "viprakqRtena" | "xakRiNam" |"xakRiNAn" | "uwwarAn" | "xakRiNe" | "samakRam" | 
         "xUram" | "xUrAw" | "xUre" | "xUrA" | "xUreNa" | "nikatam" | "nikatAw" | "nikatena" | "nikate" | "sahiwaH" ->
        match m2 with 
         [ Wif (id2,cid2,mid2,_,_,_,_,_,_,_,_,_,_,_,_,_,_)
         | Kqw (id2,cid2,mid2,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_)
         | Avykqw (id2,cid2,mid2,_,_,_,_,_,_,_,_,_,_) ->
       let  d12 = if id1 > id2 then id1-id2 else id2-id1 in
           if (id1 < id2)  && no_boundary_crossing_with_iwi id1 id2 text_type
           then if word1 = "sahiwaH"
           then [ Relation (id1,cid1,mid1,"sambanXa_upa",id2,cid2,mid2,"26.1",d12)] 
           else [ Relation (id1,cid1,mid1,"xeSAXikaraNam_upa",id2,cid2,mid2,"26.2",d12)] 
           else []
         |_ -> []
         ]
       | _ -> 
           match m2 with
           [ Wif (id2,cid2,mid2,_,_,_,_,_,_,_,_,_,_,_,_,_,_)
           | Kqw (id2,cid2,mid2,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_)
           | Avykqw (id2,cid2,mid2,_,_,_,_,_,_,_,_,_,_) ->
       let  d12 = if id1 > id2 then id1-id2 else id2-id1 in
               match rt1 with
               [ "prAk" | "yukwa " ->
                 if  (id1 < id2) && no_boundary_crossing_with_iwi id1 id2 text_type
                 then  [ Relation (id1,cid1,mid1,"sambanXa_upa",id2,cid2,mid2,"26.3",d12)] 
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
           [ Wif (id2,cid2,mid2,_,rt2,_,_,upasarga2,_,_,_,_,_,_,_,_,_)
           | Kqw (id2,cid2,mid2,_,rt2,upasarga2,_,_,_,_,_,_,_,_,_,_,_,_)
           | Avykqw (id2,cid2,mid2,_,rt2,_,_,upasarga2,_,_,_,_,_) ->
       let  d12 = if id1 > id2 then id1-id2 else id2-id1 in
             if  id1 < id2  && (no_boundary_crossing_with_iwi id1 id2) 
             && members_of rt2 upasarga2 karwqsamAnAXikaraNa_verbs
             then [ Relation (id1,cid1,mid1,"karwqsamAnAXikaraNam_upa",id2,cid2,mid2,"18.9",d12)]
             else []
           |_ -> []
           ] *)
         | _ -> []
         ]
       ] else []
   | Avy (id1,cid1,mid1,word1,rt1,_,_,_) 
   | AvywaxXiwa (id1,cid1,mid1,word1,rt1,_,_,_,_)
   | Avykqw (id1,cid1,mid1,word1,rt1,_,_,_,_,_,_,_,_) ->
           match word1 with
          [ "praBqwiH"|
           "aBi" | "anu" | "apa" | "api" |
            "AraBya" | "A" | "aXi" | "vaRat" |
            "namaH" | "nAnA" | "pari" | "prawi" |
            "upa"  ->
              match m2 with
             [ Wif (id2,cid2,mid2,_,_,_,_,_,_,_,_,_,_,_,_,_,_)
             | Kqw (id2,cid2,mid2,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_)
             | Avykqw (id2,cid2,mid2,_,_,_,_,_,_,_,_,_,_) ->
       let  d12 = if id1 > id2 then id1-id2 else id2-id1 in
               if (id1 < id2) && no_boundary_crossing_with_iwi id1 id2 text_type
               then [ Relation (id1,cid1,mid1,"sambanXa_upa",id2,cid2,mid2,"26.4",d12)] 
               else []
             |_ -> []
             ]
       
          | "alam" ->
             match m2 with
             [ Wif (id2,cid2,mid2,_,rt2,_,_,upasarga2,_,_,_,_,_,_,_,_,_)
             | Kqw (id2,cid2,mid2,_,rt2,upasarga2,_,_,_,_,_,_,_,_,_,_,_,_)
             | Avykqw (id2,cid2,mid2,_,rt2,_,_,upasarga2,_,_,_,_,_) ->
       let  d12 = if id1 > id2 then id1-id2 else id2-id1 in
               if (id1 < id2) && no_boundary_crossing_with_iwi id1 id2 text_type
                 && members_of rt2 upasarga2 karwqsamAnAXikaraNa_verbs
               then  [ Relation (id1,cid1,mid1,"karwqsamAnAXikaraNam_upa",id2,cid2,mid2,"26.5",d12)
                     ; Relation (id1,cid1,mid1,"sambanXa_upa",id2,cid2,mid2,"26.6",d12)
                     ]
               else []
             |_ -> []
             ]  (* What is the example? *)
	   | "aXaswAw" | "puraswAw" | "paraswAw" | "avaraswAw" | "aXaH" |
             "uwwarawaH" | "xakRiNawaH" | "avaH" | "parawaH" | 
             "avarawaH" | "puraH" | "purawaH" | "pqRTawaH" | "upari" | "upariRtAw" | "paScAw" | 
             "uwwarAw" | "aXarAw" | "xakRiNAw" | "maXye"  ->
             match m2 with 
             [ Wif (id2,cid2,mid2,_,rt2,_,_,upasarga2,_,_,_,_,_,_,_,_,_)
             | Kqw (id2,cid2,mid2,_,rt2,upasarga2,_,_,_,_,_,_,_,_,_,_,_,_)
             | Avykqw (id2,cid2,mid2,_,rt2,_,_,upasarga2,_,_,_,_,_) ->
       let  d12 = if id1 > id2 then id1-id2 else id2-id1 in
               if (id1 < id2) && no_boundary_crossing_with_iwi id1 id2 text_type
               then if rt1="paScAw" then
                    if members_of rt2 upasarga2 apAxAna_verbs
               then [ Relation (id1,cid1,mid1,"apAxAnam_upa",id2,cid2,mid2,"26.7",d12) 
                    ; Relation (id1,cid1,mid1,"aXikaraNam_upa",id2,cid2,mid2,"26.8",d12)] 
               else if members_of rt2 upasarga2 karwqsamAnAXikaraNa_verbs 
               then [ Relation (id1,cid1,mid1,"karwA_upa",id2,cid2,mid2,"26.9",d12)
                    ; Relation (id1,cid1,mid1,"aXikaraNam_upa",id2,cid2,mid2,"26.10",d12)] 
               else [ Relation (id1,cid1,mid1,"aXikaraNam_upa",id2,cid2,mid2,"26.11",d12)] 
               else if members_of rt2 upasarga2 apAxAna_verbs
               then [ Relation (id1,cid1,mid1,"apAxAnam_upa",id2,cid2,mid2,"26.12",d12) 
                    ; Relation (id1,cid1,mid1,"xeSAXikaraNam_upa",id2,cid2,mid2,"26.13",d12)] 
               else if members_of rt2 upasarga2 karwqsamAnAXikaraNa_verbs 
               then [ Relation (id1,cid1,mid1,"karwA_upa",id2,cid2,mid2,"26.14",d12)
                    ; Relation (id1,cid1,mid1,"xeSAXikaraNam_upa",id2,cid2,mid2,"26.15",d12)] 
               else [ Relation (id1,cid1,mid1,"xeSAXikaraNam_upa",id2,cid2,mid2,"26.16",d12)] 
               else []
             |_ -> []
             ]
	| "uwwareNa" | "aXareNa" | "xakRiNena" | "xakRiNA" | "xakRiNAhi" | "uwwarA" | "uwwarAhi" | "avaswAw" ->
	match m2 with
         [ Wif (id2,cid2,mid2,_,rt2,_,_,upasarga2,_,_,_,_,_,_,_,_,_)
         | Kqw (id2,cid2,mid2,_,rt2,upasarga2,_,_,_,_,_,_,_,_,_,_,_,_)
         | Avykqw (id2,cid2,mid2,_,rt2,_,_,upasarga2,_,_,_,_,_) ->
       let  d12 = if id1 > id2 then id1-id2 else id2-id1 in
            if (id1 < id2) && no_boundary_crossing_with_iwi id1 id2 text_type
           (*  && members_of rt2 upasarga2 apAxAna_verbs
            then [ Relation (id1,cid1,mid1,"apAxAnam_upa",id2,cid2,mid2,"18.2",d12)] *)
             && members_of rt2 upasarga2 karwqsamAnAXikaraNa_verbs
            then [ Relation (id1,cid1,mid1,"karwA_upa",id2,cid2,mid2,"27.1",d12)]
            else [ Relation (id1,cid1,mid1,"xeSAXikaraNam_upa",id2,cid2,mid2,"27.2",d12)]
          |_ -> []
          ]

          | "agrawaH" | "aBiwaH" | "anwaH" | "aXoXaH" | "aXoZXaH" | "aXyaXi" | "anwarA"|
             "bahiH" | "nikaRA" | "samayA" | "uBayawaH" | "uparyupari" |
             "pariwaH" | "sarvawaH"  | "ArAw" ->
             match m2 with
              [ Wif (id2,cid2,mid2,_,_,_,_,_,_,_,_,_,_,_,_,_,_)
              | Kqw (id2,cid2,mid2,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_)
              | Avykqw (id2,cid2,mid2,_,_,_,_,_,_,_,_,_,_) ->
       let  d12 = if id1 > id2 then id1-id2 else id2-id1 in
                if (id1 < id2)  && no_boundary_crossing_with_iwi id1 id2 text_type
                then [ Relation (id1,cid1,mid1,"xeSAXikaraNam_upa",id2,cid2,mid2,"27.3",d12)]
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
  [ Sup (id1,cid1,mid1,word1,rt1,_,_,lifgam1,viBakwiH1,vacanam1,_)
  | Kqw (id1,cid1,mid1,word1,_,_,_,_,_,_,_,rt1,_,_,lifgam1,viBakwiH1,vacanam1,_)
  | WaxXiwa (id1,cid1,mid1,word1,rt1,_,_,_,lifgam1,viBakwiH1,vacanam1,_) ->
    match word1 with
       [ "sAXu" | "prawIcI" | "hiwam" | "asAXu" |
         "kuSalam" | "Sam" | "uxac" | "uxIcI" ->
         match m2 with
         [ Sup (id2,cid2,mid2,word2,rt2,_,_,lifgam2,viBakwiH2,vacanam2,_)
         | Kqw (id2,cid2,mid2,word2,_,_,_,_,_,_,_,rt2,_,_,lifgam2,viBakwiH2,vacanam2,_)
         | WaxXiwa (id2,cid2,mid2,word2,rt2,_,_,_,lifgam2,viBakwiH2,vacanam2,_) ->
       let  d12 = if id1 > id2 then id1-id2 else id2-id1 in
           if  id1 < id2  && (no_boundary_crossing_with_iwi id1 id2) 
           &&  noun_agreement_vibh vacanam1 vacanam2 lifgam1 lifgam2 viBakwiH1 viBakwiH2
           then [ Relation (id1,cid1,mid1,"viSeRaNam_upa",id2,cid2,mid2,"19.1",d12)] 
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
           [ Sup (id2,cid2,mid2,word2,rt2,_,_,lifgam2,viBakwiH2,vacanam2,_)
           | Kqw (id2,cid2,mid2,word2,_,_,_,_,_,_,_,rt2,_,_,lifgam2,viBakwiH2,vacanam2,_)
           | WaxXiwa (id2,cid2,mid2,word2,rt2,_,_,_,lifgam2,viBakwiH2,vacanam2,_) ->
       let  d12 = if id1 > id2 then id1-id2 else id2-id1 in
             if  id1 < id2  && (no_boundary_crossing_with_iwi id1 id2) 
              &&  noun_agreement_vibh vacanam1 vacanam2 lifgam1 lifgam2 viBakwiH1 viBakwiH2
              then [ Relation (id1,cid1,mid1,"viSeRaNam_upa",id2,cid2,mid2,"19.2",d12)] 
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
      [ Sup (id1,cid1,mid1,_,rt1,_,_,lifga1,viBakwiH1,vacana1,_)
      | Kqw (id1,cid1,mid1,_,rt1,_,_,_,_,_,_,_,_,_,lifga1,viBakwiH1,vacana1,_)
      | WaxXiwa (id1,cid1,mid1,_,rt1,_,_,_,lifga1,viBakwiH1,vacana1,_) ->
           if viBakwiH1=6 && not (member_of rt1 guNavacana)
           then match m2 with 
                 [ Kqw (id2,cid2,mid2,_,rt2,_,_,kqw2,_,_,_,_,pUrvapaxa2,uwwarapaxa2,_,viBakwiH2,_,_) -> 
       let  d12 = if id1 > id2 then id1-id2 else id2-id1 in
		   if   prose_order id1 id2 text_type
                   then if no_boundary_crossing_with_iwi id1 id2 text_type
                       && ((kqw2="GaF" || kqw2="wavyaw" || kqw2="wqc" || kqw2 = "kwin" || kqw2 = "ac" || kqw2="Nvul")
                         || (kqw2="kwa" && not (viBakwiH2 = 1)))
                                (* Rules for kAraka RaRTI are given below.
                                 * Here we are dealing with only SeRe RaRTI *)
				(* pawriNAm viruwena Removed Sawq_l?t, SAnac_l?t, kwa and kwavawu *)
                       && not (viBakwiH2 = 8)
                       && (not (member_of rt2 guNavacana))
                   then [ Relation (id1,cid1,mid1,"RaRTIsambanXaH",id2,cid2,mid2,"28.1",d12)]
                   else if   not (pUrvapaxa2=uwwarapaxa2)    (* Compound *)
                   then if   member_of pUrvapaxa2 sambanXavAcI 
                            || pUrvapaxa2="hiwa" 
                            || pUrvapaxa2="vacana"  (* We should add all rUDa kqxanwas here *) (*rAmasya hiwakAmyayA, rAmasya vacanAnusAreNa *)
                             (* asamarWa compound *)
                   then [ Relation (id1,cid1,mid1,"RaRTIsambanXaH",id2,cid2,mid2,"28.2",d12)]
 (* We need to mark this relation with the puurvapaxa and not the uwwarapaxa *)
                   else [ Relation (id1,cid1,mid1,"RaRTIsambanXaH",id2,cid2,mid2,"28.3",d12)]
                   else if member_of rt2 viRayi_list
                   then [ Relation (id1,cid1,mid1,"RaRTIsambanXaH",id2,cid2,mid2,"28.4",d12)]
                   else []
                   else []
                 | Sup (id2,cid2,mid2,word2,rt2,pUrvapaxa2,uwwarapaxa2,_,viBakwiH2,_,_)
                 | WaxXiwa (id2,cid2,mid2,word2,rt2,pUrvapaxa2,uwwarapaxa2,_,_,viBakwiH2,_,_) -> 
       let  d12 = if id1 > id2 then id1-id2 else id2-id1 in
                   if     prose_order id1 id2 text_type
                   then if member_of rt2 sambanXavAcI 
                        then if not (lifga1="napuM")
                             then [ Relation (id1,cid1,mid1,"RaRTIsambanXaH",id2,cid2,mid2,"28.5",d12)]
                             else []
                        else if member_of rt2 viRayi_list
                             then [ Relation (id1,cid1,mid1,"RaRTIsambanXaH",id2,cid2,mid2,"28.6",d12)]
                             else if rt2 = "maXya" &&  vacana1 = "xvi"
                                  then [ Relation (id1,cid1,mid1,"RaRTIsambanXaH",id2,cid2,mid2,"28.7",d12)]
                                  else  if no_boundary_crossing_with_iwi id1 id2 text_type
                                        && not (viBakwiH2 = 8) 
                                        && not (member_of rt2 non_RaRTI_list) (* These are the words which can not be related to a word in RaRTI. e.g. paryApwa  We can not have X{6} paryApwa *)
                                        && not (member_of rt2 manuRyasaFjFAvAcI) (* These are the names of human beings, and hence we can not have X{6} rt2 *)
                                        && not (member_of rt2 named_entity) (* These are the names of entities, and hence we can not have X{6} rt2 *)
                                        && not (member_of rt2 upapada6_list) (* This is needed, since in these cases the relation is sanxarBa_binxuH *)
                                        && (rt2="Awman" || not (pronominal123 rt2)) (* sEnyasya mama; mama should be related to sEnya and not the other way ; rAmasya AwmA should be parsed *)
                                        && not (rt2 = "maXya")
                                        && not (rt2 = "arWa")
                                        && not (member_of rt2 taddhitaantas)
                                        (* && (not (member_of rt2 guNavacana)) *)
                                        && (not ((rt1="uBa" || rt1="uBA") && viBakwiH1=6))
                                        then  [ Relation (id1,cid1,mid1,"RaRTIsambanXaH",id2,cid2,mid2,"28.8",d12)]
                        (* else if   not (pUrvapaxa2=uwwarapaxa2) 
                           then  [ Relation (id1,cid1,mid1,"RaRTIsambanXaH",id2,cid2,mid2,"28.8",d12)] *)
                   else []
                   else []
                 (*| Avykqw (id2,cid2,mid2,word2,_,_,_,_,_,_,_,_,_)
                 | AvywaxXiwa (id2,cid2,mid2,word2,_,_,_,_,_) ->
       let  d12 = if id1 > id2 then id1-id2 else id2-id1 in
                   if    prose_order id1 id2 text_type
                      && (no_boundary_crossing_with_iwi id1 id2)
                   then [ Relation (id1,cid1,mid1,"RaRTIsambanXaH",id2,cid2,mid2,"28.8",d12)]
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
  [ Kqw (id2,cid2,mid2,_,kqw_rt2,upasarga2,_,kqw2,_,_,_,rt2,_,_,_,_,_,_) ->
     match m1 with
     [ Sup (id1,cid1,mid1,_,_,_,_,_,viBakwiH1,_,_)
     | Kqw (id1,cid1,mid1,_,_,_,_,_,_,_,_,_,_,_,_,viBakwiH1,_,_)
     | WaxXiwa (id1,cid1,mid1,_,_,_,_,_,_,viBakwiH1,_,_) -> 
       let  d12 = if id1 > id2 then id1-id2 else id2-id1 in
                     if id2 > id1 (* id2 = next id1; we may have some kriyAviSeRaNa etc in between; e.g. BavawAm ekawra avasWAnam *)
       && viBakwiH1=6
       && no_boundary_crossing_with_iwi id1 id2 text_type
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
           | "xvikarmaka2" -> [ Relation (id1,cid1,mid1,"muKyakarma",id2,cid2,mid2,"29.1",d12)
                              ; Relation (id1,cid1,mid1,"gONakarma",id2,cid2,mid2,"29.2",d12)]
           | "akarmaka" ->    [ Relation (id1,cid1,mid1,"karwA",id2,cid2,mid2,"29.3",d12)]
           | _ ->             [ Relation (id1,cid1,mid1,"karwA",id2,cid2,mid2,"29.4",d12)
                               ; Relation (id1,cid1,mid1,"karma",id2,cid2,mid2,"29.5",d12)]
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
  [ Kqw (id2,cid2,mid2,rt2,upasarga2,_,_,kqw2,_,_,_,_,_,_,_,_,_,_) ->
     match m1 with
     [ Sup (id1,cid1,mid1,_,_,_,_,_,viBakwiH1,_,_)
     | Kqw (id1,cid1,mid1,_,_,_,_,_,_,_,_,_,_,_,_,viBakwiH1,_,_)
     | WaxXiwa (id1,cid1,mid1,_,_,_,_,_,_,viBakwiH1,_,_) -> 
       let  d12 = if id1 > id2 then id1-id2 else id2-id1 in
       if    id2=next id1 
          && viBakwiH1=6 
          && no_boundary_crossing_with_iwi id1 id2 text_type
          && kqw2="kwa" 
          && (   members_of rt2 upasarga2 akarmaka_verbs 
              || members_of rt2 upasarga2 gawyarWa_verbs 
              || members_of rt2 upasarga2 prawyavasAnArWa_verbs)
       then  [ Relation (id1,cid1,mid1,"karwA",id2,cid2,mid2,"30.1",d12)]  (*aXikaraNa vAcanaH ca 2.3.68 *)
             (* karwq_karmaNoH_kqwi *) 
       else []
     |_ -> []
     ]
   |_ -> []
 ]
;

value rl_kAraka_RaRTI3 m1 m2 text_type = match m2 with
  [ Avykqw (id2,cid2,mid2,_,_,_,_,_,_,kqw2,_,_,_) ->
     match m1 with
     [ Sup (id1,cid1,mid1,_,_,_,_,_,viBakwiH1,_,_)
     | Kqw (id1,cid1,mid1,_,_,_,_,_,_,_,_,_,_,_,_,viBakwiH1,_,_)
     | WaxXiwa (id1,cid1,mid1,_,_,_,_,_,_,viBakwiH1,_,_) -> 
       let  d12 = if id1 > id2 then id1-id2 else id2-id1 in
       if    prose_order id1 id2 text_type 
          && viBakwiH1=6 
          && no_boundary_crossing_with_iwi id1 id2 text_type
          && kqw2="wumun"
           (* I do not understand how can there be karwA ?
              then  [ Relation (id1,cid1,mid1,"karwA",id2,cid2,mid2,"23.1",d12) 
                    ; Relation (id1,cid1,mid1,"karma",id2,cid2,mid2,"23.2",d12) 
                    ] (* karwq_karmaNoH_kqwi *) *)
       then  [ Relation (id1,cid1,mid1,"karma",id2,cid2,mid2,"31.2",d12) 
             ]
       else []
     |_ -> []
     ]
   |_ -> []
 ]
;

value rlhewuprayoge m1 m2 text_type = match m2 with
     [ Sup(id2,cid2,mid2,_,rt2,_,_,_,viBakwiH2,_,_) ->
     if rt2="hewu"
     then match m1 with
          [ Sup(id1,cid1,mid1,_,rt1,_,_,_,viBakwiH1,_,_) ->
       let  d12 = if id1 > id2 then id1-id2 else id2-id1 in
                if   viBakwiH1=6
                  && no_boundary_crossing_with_iwi id1 id2 text_type
                then [ Relation (id1,cid1,mid1,"hewuH",id2,cid2,mid2,"32.1",d12)]
                else if    pronoun3 rt1 
                     (* sarvanAmnaswqwIyA ca 2.3.37; 
                        nimiwwakAraNahewuRu sarvAsAM prAyaxarSanaM  kasya hewoH, kene hewunA, kam hewum, kasmina hewO *)
                        && viBakwiH1=viBakwiH2
                     then [ Relation (id1,cid1,mid1,"viSeRaNam",id2,cid2,mid2,"32.2",d12)]
                     else []
          | _ -> []
          ]
     else []
     | _ -> []
     ]
; 

value karwqrahiwakarwqsamAnAXikaraNam id1 cid1 mid1 id2 cid2 mid2 rt2 upasarga2 rl1 =
       let  d12 = if id1 > id2 then id1-id2 else id2-id1 in
      if   members_of rt2 upasarga2 karwqsamAnAXikaraNa_verbs
      then [ Relation (id1,cid1,mid1,"karwqrahiwakarwqsamAnAXikaraNam",id2,cid2,mid2, rl1,d12) ] 
      else []
;

value rlkarwqrahiwakarwqsamAnAXikaraNam m1 m2 text_type = match m1 with
    [ Kqw (id1,cid1,mid1,_,_,_,_,_,_,_,_,_,_,_,_,viBakwiH1,_,_)
    | WaxXiwa (id1,cid1,mid1,_,_,_,_,_,_,viBakwiH1,_,_) ->
        if viBakwiH1 = 1
        then match m2 with
        [ Wif (id2,cid2,mid2,_,rt2,_,_,upasarga2,_,_,lakAraH2,puruRaH2,_,_,_,_,_) ->
              if    ((puruRaH2="ma"  && wvam_pos.val = 50) || (puruRaH2="u" && aham_pos.val=50))
                 && (lakAraH2="lot" || lakAraH2 = "ASIrlif"|| lakAraH2 = "viXilif" || lakAraH2 = "lat")
                 && wvam_pos.val = 50
              then   karwqrahiwakarwqsamAnAXikaraNam id1 cid1 mid1 id2 cid2 mid2 rt2 upasarga2 "33.1"
              else []
        (*| Kqw (id2,cid2,mid2,_,rt2,upasarga2,_,_,_,_,_,_,_,_,_,_,_,_) *)
        | Avykqw (id2,cid2,mid2,_,rt2,_,_,upasarga2,_,kqw2,_,_,_) ->
              if kqw2 = "kwvA"
              then   karwqrahiwakarwqsamAnAXikaraNam id1 cid1 mid1 id2 cid2 mid2 rt2 upasarga2 "33.2"
              else []
        | _ -> []
        ]
        else []
    | Sup (id1,cid1,mid1,word1,rt1,pUrvapaxa1,uwwarapaxa1,_,viBakwiH1,_,_) ->
        if viBakwiH1 = 1 && (pUrvapaxa1="y" || uwwarapaxa1="y") || member_of rt1 guNavacana || member_of rt1 upAXi || member_of rt1 pUraNa
        then match m2 with
        [ Wif (id2,cid2,mid2,_,rt2,_,_,upasarga2,_,_,lakAraH2,puruRaH2,_,_,_,_,_) ->
              if   ((puruRaH2="ma"  && wvam_pos.val = 50) || (puruRaH2="u" && aham_pos.val=50))
                && (lakAraH2="lot" || lakAraH2 = "ASIrlif"|| lakAraH2 = "viXilif" || lakAraH2 = "lat")
              then   karwqrahiwakarwqsamAnAXikaraNam id1 cid1 mid1 id2 cid2 mid2 rt2 upasarga2 "33.3"
              else []

        (*| Kqw (id2,cid2,mid2,_,rt2,upasarga2,_,_,_,_,_,_,_,_,_,_,_,_) *)

        | Avykqw (id2,cid2,mid2,_,rt2,_,_,upasarga2,_,kqw2,_,_,_) ->
              if kqw2 = "kwvA"
              then   karwqrahiwakarwqsamAnAXikaraNam id1 cid1 mid1 id2 cid2 mid2 rt2 upasarga2 "33.4"
              else []
        | _ -> []
        ]
        else []
    | _ -> []
    ]
;

value rlkarwqsamAnAXikaraNam m1 m2 m3 text_type = match m2 with
    [ Sup (id2,cid2,mid2,word2,rt2,_,uwwarapaxa2,lifgam2,viBakwiH2,vacanam2,_) ->
      (* if pUrvapaxa2="y" || uwwarapaxa2="y"  || member_of rt2 guNavacana 
      guNavacana removed to accound for kAkaH kokilaH na Bavawi
      then*)
      match m1 with
      [ Sup (id1,cid1,mid1,_,rt1,_,_,lifgam1,viBakwiH1,vacanam1,_)
      | Kqw (id1,cid1,mid1,_,_,_,_,_,_,_,_,rt1,_,_,lifgam1,viBakwiH1,vacanam1,_)
      | WaxXiwa (id1,cid1,mid1,_,rt1,_,_,_,lifgam1,viBakwiH1,vacanam1,_) ->
       let  d12 = if id1 > id2 then id1-id2 else id2-id1 in
        match m3 with
        [ Wif (id3,cid3,mid3,_,rt3,_,_,upasarga3,_,_,_,puruRaH3,vacanam3,_,_,_,_) ->
          if    (aBihiwa rt1 vacanam1 vacanam3 puruRaH3 || pronominal12 rt2)
             && (aBihiwa rt2 vacanam2 vacanam3 puruRaH3 || pronominal12 rt1)
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
         && no_boundary_crossing_with_iwi id2 id3 text_type
         && no_boundary_crossing_with_iwi id1 id2 text_type
          then [ Relation (id2,cid2,mid2,"viXeya_viSeRaNam",id1,cid1,mid1,"34.1",d12) ]
             (* ; Relation (id1,cid1,mid1,"karwqsamAnAXikaraNam",id3,cid3,mid3,"25.1b",d13) ] *)
(* rel is marked with the verb and not with the karwA. This is to ensure that the parse is correct. 
Consider a sent with X Y v1 v2, where X and Y are karwA and karwAsamAnAXikaraNa w.r.t v1 and not wrt v2. And suppose in the final parse X is karwA of v2, then marking a relation of karwAsamAnAXikaraNa between X and Y will be wrong *)
        else []
      | Kqw (id3,cid3,mid3,_,rt3,upasarga3,_,_,_,_,_,_,_,_,_,_,_,_)
      | Avykqw (id3,cid3,mid3,_,rt3,_,_,upasarga3,_,_,_,_,_) ->
          if members_of rt3 upasarga3 karwqsamAnAXikaraNa_verbs
           && viBakwiH1=viBakwiH2
           && ((vacanam1=vacanam2) || (rt1="mAsa" && (rt2="xakRiNAyana" || rt2="uwwarAyaNa")))
           && not (member_of rt1 saMKyeya) (* yogyawA *)
           (*&& not (member_of rt1 guNavacana) (* yogyawA *)
           &&  (member_of rt2 guNavacana) (* yogyawA *) *)
           (* && prose_order id1 id2 text_type
            samarWaH aswi janaH / janaH samarWaH aswi -- 25 Jul 2020 *)
            && id1 < id2 
           && prose_order id2 id3 text_type
           (* && id2-id1 <= 3 *)
         && viBakwiH1=1 && no_boundary_crossing_with_iwi id2 id3 text_type
          then [ Relation (id2,cid2,mid2,"viXeya_viSeRaNam",id1,cid1,mid1,"34.2",d12)   ]
             (* ; Relation (id1,cid1,mid1,"karwqsamAnAXikaraNam",id3,cid3,mid3,"25.2b",d13)  *)
        else []
      | _ -> []
      ]
(* Following part is added to account for the karwqsamAnAXikaraNam relation in the case of upapaxa viBakwis 
E.g. grAmasya aXareNa vanam aswi.*)
      | Avy (id1,cid1,mid1,word1,_,_,_,_)
      | AvywaxXiwa (id1,cid1,mid1,word1,_,_,_,_,_) -> match m3 with
        [ Wif (id3,cid3,mid3,_,rt3,_,_,upasarga3,_,_,_,_,_,_,_,_,_)
        | Kqw (id3,cid3,mid3,_,rt3,upasarga3,_,_,_,_,_,_,_,_,_,_,_,_)
        | Avykqw (id3,cid3,mid3,_,rt3,_,_,upasarga3,_,_,_,_,_) ->
       let  d12 = if id1 > id2 then id1-id2 else id2-id1 in
          if members_of rt3 upasarga3 karwqsamAnAXikaraNa_verbs
           && viBakwiH2=1
           && prose_order id1 id2 text_type
           && prose_order id2 id3 text_type
            && id1 < id2 
           (* && id2-id1 <= 3 *)
           && no_boundary_crossing_with_iwi id2 id3 text_type
          then match word1 with
          [ "avaH" | "avaraswAw"| "avarawaH" | "avaswAw" | "aXaH"|
            "aXarAw" | "aXaswAw" | "paraswAw"| "parawaH"| "aXareNa"|
            "paScAw" | "puraH" | "puraswAw"| "purawaH"| "upari"|
            "upariRtAw"| "uwwarA"| "uwwarAhi"| "uwwarAw"| "uwwarawaH"|
            "uwwareNa"| "xakRiNA"| "xakRiNAhi"| "xakRiNAw"| "xakRiNawaH"|
            "xakRiNena" ->
            [ Relation (id2,cid2,mid2,"viXeya_viSeRaNam",id1,cid1,mid1,"34.3",d12) ] 
          |_ -> []
          ]
          else []
        | _ -> []
        ]
      | _ -> []
      ]
      (* else [] *)
  | Kqw (id2,cid2,mid2,_,_,_,_,_,_,_,_,rt2,_,_,lifgam2,viBakwiH2,vacanam2,_)
  | WaxXiwa (id2,cid2,mid2,_,rt2,_,_,_,lifgam2,viBakwiH2,vacanam2,_) ->
      match m1 with
      [ Sup (id1,cid1,mid1,_,rt1,_,_,lifgam1,viBakwiH1,vacanam1,_)
      | Kqw (id1,cid1,mid1,_,_,_,_,_,_,_,_,rt1,_,_,lifgam1,viBakwiH1,vacanam1,_)
      | WaxXiwa (id1,cid1,mid1,_,rt1,_,_,_,lifgam1,viBakwiH1,vacanam1,_) ->
       let  d12 = if id1 > id2 then id1-id2 else id2-id1 in
        match m3 with
        [ Wif (id3,cid3,mid3,_,rt3,_,_,upasarga3,_,prayogaH3,_,puruRaH3,vacanam3,_,_,_,_) ->
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
            && id1 < id2 
           && prose_order id2 id3 text_type
           (* && id2-id1 <= 3   found an example where diff is > 3 *)
(* Bhatti kAavya 1.1 shloka *)
         && viBakwiH1=1 && no_boundary_crossing_with_iwi id2 id3 text_type
        then [ Relation (id2,cid2,mid2,"viXeya_viSeRaNam",id1,cid1,mid1,"34.4",d12)  ]
             (*; Relation (id1,cid1,mid1,"karwqsamAnAXikaraNam",id3,cid3,mid3,"25.4b",d13) ] *)
(* rel is marked with the verb and not with the karwA. This is to ensure that the parse is correct. 
Consider a sent with X Y v1 v2, where X and Y are karwA and karwAsamAnAXikaraNa w.r.t v1 and not wrt v2. And suppose in the final parse X is karwA of v2, then marking a relation of karwAsamAnAXikaraNa between X and Y will be wrong *)
        else []
      | Kqw (id3,cid3,mid3,_,rt3,upasarga3,_,_,_,_,_,_,_,_,_,_,_,_)
      | Avykqw (id3,cid3,mid3,_,rt3,_,_,upasarga3,_,_,_,_,_) ->
          if members_of rt3 upasarga3 karwqsamAnAXikaraNa_verbs
           && viBakwiH1=viBakwiH2
           && ((vacanam1=vacanam2) || (rt1="mAsa" && (rt2="xakRiNAyana" || rt2="uwwarAyaNa")))
           && not (member_of rt1 saMKyeya) (* yogyawA *)
           (*&& not (member_of rt1 guNavacana) (* yogyawA *)
           &&  (member_of rt2 guNavacana) (* yogyawA *)*)
           (* && prose_order id1 id2 text_type
            samarWaH aswi janaH / janaH samarWaH aswi -- 25 Jul 2020 *)
            && id1 < id2 
           && prose_order id2 id3 text_type
           (* && id2-id1 <= 3 *)
         && viBakwiH1=1 && no_boundary_crossing_with_iwi id2 id3 text_type
          then [ Relation (id2,cid2,mid2,"viXeya_viSeRaNam",id1,cid1,mid1,"34.5",d12)  ]
             (* ; Relation (id1,cid1,mid1,"karwqsamAnAXikaraNam",id3,cid3,mid3,"25.5b",d13) ] *)
        else []
        | _ -> []
        ]
      | Avy (id1,cid1,mid1,word1,_,_,_,_) 
      | AvywaxXiwa (id1,cid1,mid1,word1,_,_,_,_,_) -> 
       let  d12 = if id1 > id2 then id1-id2 else id2-id1 in
       match m3 with
        [ Wif (id3,cid3,mid3,_,rt3,_,_,upasarga3,_,_,_,_,_,_,_,_,_)
        | Kqw (id3,cid3,mid3,_,rt3,upasarga3,_,_,_,_,_,_,_,_,_,_,_,_)
        | Avykqw (id3,cid3,mid3,_,rt3,_,_,upasarga3,_,_,_,_,_) ->
          if members_of rt3 upasarga3 karwqsamAnAXikaraNa_verbs
           && viBakwiH2=1
           && prose_order id1 id2 text_type
           && prose_order id2 id3 text_type
           (* && id2-id1 <= 3 *)
            && id1 < id2 
           && no_boundary_crossing_with_iwi id2 id3 text_type
          then match word1 with
          [ "avaH" | "avaraswAw"| "avarawaH" | "avaswAw" | "aXaH"|
            "aXarAw" | "aXareNa" | "aXaswAw" | "paraswAw"| "parawaH"|
            "paScAw" | "puraH" | "puraswAw"| "purawaH"| "upari"|
            "upariRtAw"| "uwwarA"| "uwwarAhi"| "uwwarAw"| "uwwarawaH"|
            "uwwareNa"| "xakRiNA"| "xakRiNAhi"| "xakRiNAw"| "xakRiNawaH"|
            "xakRiNena" ->
            [ Relation (id2,cid2,mid2,"viXeya_viSeRaNam",id1,cid1,mid1,"34.6",d12) ] 
          |_ -> []
          ]
          else []
        | _ -> []
        ]
      | _ -> []
      ]
  | Avy (id2,cid2,mid2,word2,_,_,_,_)
  | AvywaxXiwa (id2,cid2,mid2,word2,_,_,_,_,_) -> match word2 with
       [ "avaH" | "avaraswAw"| "avarawaH" | "avaswAw" | "aXaH"|
         "aXarAw" | "aXareNa" | "aXaswAw" | "paraswAw"| "parawaH"|
         "paScAw" | "puraH" | "puraswAw"| "purawaH"| "upari"|
         "upariRtAw"| "uwwarA"| "uwwarAhi"| "uwwarAw"| "uwwarawaH"|
         "uwwareNa"| "xakRiNA"| "xakRiNAhi"| "xakRiNAw"| "xakRiNawaH"|
         "xakRiNena" |
         "miWyA" | "anyaWA" ->
          match m1 with
         [ Sup (id1,cid1,mid1,_,rt1,_,_,_,viBakwiH1,_,_)
         | Kqw (id1,cid1,mid1,_,_,_,_,_,_,_,_,rt1,_,_,_,viBakwiH1,_,_)
         | WaxXiwa (id1,cid1,mid1,_,rt1,_,_,_,_,viBakwiH1,_,_) ->
       let  d12 = if id1 > id2 then id1-id2 else id2-id1 in
           match m3 with
           [ Wif (id3,cid3,mid3,_,rt3,_,_,upasarga3,_,_,_,puruRaH3,_,_,_,_,_) ->
                if members_of rt3 upasarga3 karwqsamAnAXikaraNa_verbs
              (*&& ((noun_agreement_vibh rt1 vacanam1 vacanam2 lifgam1 lifgam2 viBakwiH1 viBakwiH2) || pronominal12 rt1)  to account for jyowiH agniH Bavawi *)
(* || pronominal12 rt1 *)
              && not (member_of rt1 saMKyeya) (* yogyawA *)
              && prose_order id1 id2 text_type
              && prose_order id2 id3 text_type
            && id1 < id2 
              (* && id2-id1 <= 3 *)
            && viBakwiH1=1 && no_boundary_crossing_with_iwi id2 id3 text_type
           then [ Relation (id2,cid2,mid2,"viXeya_viSeRaNam",id1,cid1,mid1,"34.7",d12) ] 
           else []
(* rel is marked with the verb and not with the karwA. This is to ensure that the parse is correct. 
Consider a sent with X Y v1 v2, where X and Y are karwA and karwAsamAnAXikaraNa w.r.t v1 and not wrt v2. And suppose in the final parse X is karwA of v2, then marking a relation of karwAsamAnAXikaraNa between X and Y will be wrong *)
          | Kqw (id3,cid3,mid3,_,rt3,upasarga3,_,_,_,_,_,_,_,_,_,_,_,_)
          | Avykqw (id3,cid3,mid3,_,rt3,_,_,upasarga3,_,_,_,_,_) ->
          if members_of rt3 upasarga3 karwqsamAnAXikaraNa_verbs
           && prose_order id1 id2 text_type
           && prose_order id2 id3 text_type
           (* && id2-id1 <= 3 *)
            && id1 < id2 
           && viBakwiH1=1 && no_boundary_crossing_with_iwi id2 id3 text_type
           then [ Relation (id2,cid2,mid2,"viXeya_viSeRaNam",id1,cid1,mid1,"34.8",d12) ] 
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
        if karwqsamverbs.val = 50
        then
        match m2 with
    [ Sup (id2,cid2,mid2,word2,rt2,_,uwwarapaxa2,_,viBakwiH2,vacanam2,_) ->
      (* if pUrvapaxa2="y" || uwwarapaxa2="y" || member_of rt2 guNavacana 
      guNavacana removed to accound for kAkaH kokilaH na Bavawi
      then*)
      match m1 with
      [ Sup (id1,cid1,mid1,word1,rt1,pUrvapaxa1,uwwarapaxa1,lifgam1,viBakwiH1,vacanam1,_)
      | Kqw (id1,cid1,mid1,word1,_,_,_,_,_,_,_,rt1,pUrvapaxa1,uwwarapaxa1,lifgam1,viBakwiH1,vacanam1,_)
      | WaxXiwa (id1,cid1,mid1,word1,rt1,pUrvapaxa1,uwwarapaxa1,_,lifgam1,viBakwiH1,vacanam1,_) ->
       let  d12 = if id1 > id2 then id1-id2 else id2-id1 in
          if (   finite_verb_in_sentence.val = 50 
              || finite_verb_in_sentence.val = id1 ) 
          (* The second condition is to handle rAmaH vExyaH *)
          then
           (* let rel = handle_sp_compounds id1 cid1 mid1 id2 cid2 mid2 rt1 word1 pUrvapaxa1 uwwarapaxa1 lifgam1 in
           if not (rel = []) then []
           else  ---- a sup cannot be related to another sup with sp_counpound relations that are mainly kaaraka related relations *) 
           if viBakwiH1=1
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
        then [Relation (id2,cid2,mid2,"samAnAXikaraNam",id1,cid1,mid1,"34.9",d12) ]
(* rel is marked with the verb and not with the karwA. This is to ensure that the parse is correct. 
Consider a sent with X Y v1 v2, where X and Y are karwA and karwAsamAnAXikaraNa w.r.t v1 and not wrt v2. And suppose in the final parse X is karwA of v2, then marking a relation of karwAsamAnAXikaraNa between X and Y will be wrong *)
        else []
        else []
(* Following part is added to account for the karmasamAnAXikaraNam relation in the case of upapaxa viBakwis 
E.g. grAmasya aXareNa vanam aswi.*)
      | Avy (id1,cid1,mid1,word1,_,_,_,_)
      | AvywaxXiwa (id1,cid1,mid1,word1,_,_,_,_,_)  ->
       let  d12 = if id1 > id2 then id1-id2 else id2-id1 in
          if (   finite_verb_in_sentence.val = 50 
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
            [ Relation (id2,cid2,mid2,"samAnAXikaraNam",id1,cid1,mid1,"34.10",d12) ] 
          |_ -> []
          ]
          else []
          else []
      | _ -> []
      ]
      (* else [] *)
  | Kqw (id2,cid2,mid2,_,_,_,_,_,_,_,_,rt2,_,_,_,viBakwiH2,vacanam2,_)
  | WaxXiwa (id2,cid2,mid2,_,rt2,_,_,_,_,viBakwiH2,vacanam2,_) -> match m1 with
      [ Sup (id1,cid1,mid1,_,rt1,_,_,lifgam1,viBakwiH1,vacanam1,_)
      | Kqw (id1,cid1,mid1,_,_,_,_,_,_,_,_,rt1,_,_,lifgam1,viBakwiH1,vacanam1,_)
      | WaxXiwa (id1,cid1,mid1,_,rt1,_,_,_,lifgam1,viBakwiH1,vacanam1,_) ->
       let  d12 = if id1 > id2 then id1-id2 else id2-id1 in
          if (   finite_verb_in_sentence.val = 50 
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
        then [ Relation (id2,cid2,mid2,"samAnAXikaraNam",id1,cid1,mid1,"34.11",d12) ] 
(* rel is marked with the verb and not with the karwA. This is to ensure that the parse is correct. 
Consider a sent with X Y v1 v2, where X and Y are karwA and karwAsamAnAXikaraNa w.r.t v1 and not wrt v2. And suppose in the final parse X is karwA of v2, then marking a relation of karwAsamAnAXikaraNa between X and Y will be wrong *)
        else []
        else []
      | Avy (id1,cid1,mid1,word1,_,_,_,_) 
      | AvywaxXiwa (id1,cid1,mid1,word1,_,_,_,_,_) -> 
       let  d12 = if id1 > id2 then id1-id2 else id2-id1 in
          if (   finite_verb_in_sentence.val = 50 
              || finite_verb_in_sentence.val = id1 ) 
          then if   viBakwiH2=1
                 && prose_order id1 id2 text_type
           (* && id2-id1 <= 3 *)
          then match word1 with
          [ "avaH" | "avaraswAw"| "avarawaH" | "avaswAw" | "aXaH"|
            "aXarAw" | "aXareNa" | "aXaswAw" | "paraswAw"| "parawaH"|
            "paScAw" | "puraH" | "puraswAw"| "purawaH"| "upari"|
            "upariRtAw"| "uwwarA"| "uwwarAhi"| "uwwarAw"| "uwwarawaH"|
            "uwwareNa"| "xakRiNA"| "xakRiNAhi"| "xakRiNAw"| "xakRiNawaH"|
            "xakRiNena" ->
            [ Relation (id2,cid2,mid2,"samAnAXikaraNam",id1,cid1,mid1,"34.12",d12) ] 
          |_ -> []
          ]
          else []
          else []
    | _ -> []
    ]
  | Avy (id2,cid2,mid2,word2,_,_,_,_)
  | AvywaxXiwa (id2,cid2,mid2,word2,_,_,_,_,_) -> 
match word2 with
       [ "avaH" | "avaraswAw"| "avarawaH" | "avaswAw" | "aXaH"|
         "aXarAw" | "aXareNa" | "aXaswAw" | "paraswAw"| "parawaH"|
         "paScAw" | "puraH" | "puraswAw"| "purawaH"| "upari"|
         "upariRtAw"| "uwwarA"| "uwwarAhi"| "uwwarAw"| "uwwarawaH"|
         "uwwareNa"| "xakRiNA"| "xakRiNAhi"| "xakRiNAw"| "xakRiNawaH"|
         "xakRiNena" | "alam" |
         "miWyA" | "anyaWA" ->
          match m1 with
         [ Sup (id1,cid1,mid1,_,rt1,_,_,_,viBakwiH1,_,_)
         | Kqw (id1,cid1,mid1,_,_,_,_,_,_,_,_,rt1,_,_,_,viBakwiH1,_,_)
         | WaxXiwa (id1,cid1,mid1,_,rt1,_,_,_,_,viBakwiH1,_,_) ->
       let  d12 = if id1 > id2 then id1-id2 else id2-id1 in
          if (   finite_verb_in_sentence.val = 50 
              || finite_verb_in_sentence.val = id1 ) 
          then  if not (member_of rt1 saMKyeya) (* yogyawA *)
              && prose_order id1 id2 text_type
            && viBakwiH1=1 
           then [ Relation (id2,cid2,mid2,"samAnAXikaraNam",id1,cid1,mid1,"34.13",d12) ] 
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

value vikArya rt1 rt2 =
  if (rt1="savarNa" && rt2 = "kuNdala") then True
  else if (rt1="mqwwikA" && rt2 = "Gata") then True else False
;
  
value rlkarmasamAnAXikaraNam m1 m2 m3 text_type = 
    match m2 with
    [ Sup (id2,cid2,mid2,word2,rt2,pUrvapaxa2,uwwarapaxa2,gen2,viB2,vac2,_) ->
      if not (pronominal123 rt2)   && not ( member_of rt2 manuRyasaFjFAvAcI ) (* && 
      ((member_of rt2 guNavacana) || pUrvapaxa2="y" || uwwarapaxa2="y") 
      deleted to allow  xevAn xivOkasaH vaxanwi *)
          then
      match m1 with
      [ Sup (id1,cid1,mid1,word1,rt1,_,_,gen1,viB1,vac1,_)
      | Kqw (id1,cid1,mid1,word1,_,_,_,_,_,_,_,rt1,_,_,gen1,viB1,vac1,_)
      | WaxXiwa (id1,cid1,mid1,word1,rt1,_,_,_,gen1,viB1,vac1,_) ->
           if no_boundary_crossing_with_iwi id1 id2 text_type && id1 < id2
           && not (rt1="kim" ||  rt1="kiFciw" || rt1="kiFcana" || rt1="IxqS" || rt1="kIxqS" || rt1="kIxqSa" || rt1="IxqSa") 
                      (* to avoid kIxqSam vyavahAram as karma, karmasamAnAXikaraNam*)
           && noun_agreement_vibh vac1 vac2 gen1 gen1 viB1 viB2 
           then match m3 with 
            [ Kqw (id3,cid3,mid3,_,rt3,upasarga3,_,prawyayaH3,_,_,_,_,_,_,_,_,_,_)
            | Avykqw (id3,cid3,mid3,_,rt3,_,_,upasarga3,_,prawyayaH3,_,_,_) ->
               let  d23 = if id2 > id3 then id2-id3 else id3-id2 in
                    (*let rel = handle_sp_compounds id2 cid2 mid2 id3 cid3 mid3 rt2 word2 m2 gen2 in
	              if (not (rel=[])) then rel 
                      else*) 
               if   members_of rt3 upasarga3 karmasamAnAXikaraNa_verbs 
                 && viB1=2 (*|| ((prawyayaH3="kwa" || prawyayaH3="kwavawu") && viB1=1))*)
                 && (vikArya rt1 rt2 || not (rt3="kq3"))
               then [ Relation (id2,cid2,mid2,"karmasamAnAXikaraNam",id3,cid3,mid3,"35.1",d23) ]
                (* waxA AyojakAH neharUM sanwuRtaM kqwavanwaH *)
               else []
            | Wif (id3,cid3,mid3,_,rt3,_,_,upasarga3,_,prayogaH3,_,_,_,_,_,_,_) ->
               let  d23 = if id2 > id3 then id2-id3 else id3-id2 in
               if  members_of rt3 upasarga3 karmasamAnAXikaraNa_verbs
               && (vikArya rt1 rt2 || not (rt3="kq3"))
               then if    prayogaH3="karwari" && viB1=2
                    then [ Relation (id2,cid2,mid2,"karmasamAnAXikaraNam",id3,cid3,mid3,"35.2",d23) ]
                    else if prayogaH3="karmaNi" && viB1=1
                    then [ Relation (id2,cid2,mid2,"karmasamAnAXikaraNam",id3,cid3,mid3,"35.3",d23) ]
                    else []
                   (* to avoid kIxqSam vyavahAram as karma, karmasamAnAXikaraNam*)
               else []
            | _ -> []
            ]
            else []
      | _ -> []
      ] else []
    | Avy (id2,cid2,mid2,_,rt2,_,_,_) -> 
        if rt2="BasmasAwa" then
        match m1 with
        [ Sup (id1,cid1,mid1,_,rt1,_,_,_,_,_,_)
        | Kqw (id1,cid1,mid1,_,_,_,_,_,_,_,_,rt1,_,_,_,_,_,_)
        | WaxXiwa (id1,cid1,mid1,_,rt1,_,_,_,_,_,_,_) ->
             if no_boundary_crossing_with_iwi id1 id2 text_type && id1 < id2
             then match m3 with 
              [ Kqw (id3,cid3,mid3,_,rt3,upasarga3,_,_,_,_,_,_,_,_,_,_,_,_)
              | Avykqw (id3,cid3,mid3,_,rt3,_,_,upasarga3,_,_,_,_,_) ->
       let  d23 = if id2 > id3 then id2-id3 else id3-id2 in
                if rt3="kq3" && prose_order id2 id3 text_type && (vikArya rt1 rt2)
                then [ Relation (id2,cid2,mid2,"karmasamAnAXikaraNam",id3,cid3,mid3,"35.4",d23) ]
                else []
              | Wif (id3,cid3,mid3,_,rt3,_,_,upasarga3,_,prayogaH3,_,_,_,_,_,_,_) ->
       let  d23 = if id2 > id3 then id2-id3 else id3-id2 in
                if rt3="kq3" && prose_order id2 id3 text_type && (vikArya rt1 rt2)
                then [ Relation (id2,cid2,mid2,"karmasamAnAXikaraNam",id3,cid3,mid3,"35.5",d23) ]
                else []
              | _ -> []
              ]
              else []
        | _ -> []
        ]
        else []
    | Kqw (id2,cid2,mid2,word2,_,_,_,_,_,_,_,rt2,pUrvapaxa2,uwwarapaxa2,gen2,viB2,vac2,_)
    | WaxXiwa (id2,cid2,mid2,word2,rt2,pUrvapaxa2,uwwarapaxa2,_,gen2,viB2,vac2,_) ->
      if not (pronominal123 rt2) 
      then match m1 with
      [ Sup (id1,cid1,mid1,word1,rt1,_,_,gen1,viB1,vac1,_)
      | Kqw (id1,cid1,mid1,word1,_,_,_,_,_,_,_,rt1,_,_,gen1,viB1,vac1,_)
      | WaxXiwa (id1,cid1,mid1,word1,rt1,_,_,_,gen1,viB1,vac1,_) ->
           if no_boundary_crossing_with_iwi id1 id2 text_type && id1 < id2
           && not (rt1="kim" ||  rt1="kiFciw" || rt1="kiFcana" || rt1="IxqS" || rt1="kIxqS" || rt1="kIxqSa" || rt1="IxqSa") 
           then match m3 with 
            [ Kqw (id3,cid3,mid3,_,rt3,upasarga3,_,prawyayaH3,_,_,_,_,_,_,_,_,_,_)
            | Avykqw (id3,cid3,mid3,_,rt3,_,_,upasarga3,_,prawyayaH3,_,_,_) ->
       let  d23 = if id2 > id3 then id2-id3 else id3-id2 in
            let rel = handle_sp_compounds id2 cid2 mid2 id3 cid3 mid3 rt2 word2 pUrvapaxa2 uwwarapaxa2 gen2 in
	    if (not (rel=[])) then rel 
            else if   noun_agreement_vibh vac1 vac2 gen1 gen2 viB1 viB2 
                   && members_of rt3 upasarga3 karmasamAnAXikaraNa_verbs 
                   && (viB1=2 || ((prawyayaH3="kwa" || prawyayaH3="kwavawu") && viB1=1))
                   && ((vikArya rt1 rt2) || not (rt3="kq3"))
                   (* to avoid kIxqSam vyavahAram as karma, karmasamAnAXikaraNam*)
            then [ Relation (id2,cid2,mid2,"karmasamAnAXikaraNam",id3,cid3,mid3,"35.6",d23) ]
             (* waxA AyojakAH neharUM sanwuRtaM kqwavanwaH *)
           (*  else  if  members_of rt3 upasarga3 sakarmaka_verbs && viB1=2
		(* why viB1 = 1 ? *)
            then [ Relation (id2,cid2,mid2,"karmasamAnAXikaraNam",id3,cid3,mid3,"26.1b",d23) ]
            else [] *)
            else []
            | Wif (id3,cid3,mid3,_,rt3,_,_,upasarga3,_,prayogaH3,_,_,_,_,_,_,_) ->
       let  d23 = if id2 > id3 then id2-id3 else id3-id2 in
            if   noun_agreement_vibh vac1 vac2 gen1 gen1 viB1 viB2 
            then if members_of rt3 upasarga3 karmasamAnAXikaraNa_verbs
            then if    prayogaH3="karwari" && viB1=2
                   && ((vikArya rt1 rt2) || not (rt3="kq3"))
                 then [ Relation (id2,cid2,mid2,"karmasamAnAXikaraNam",id3,cid3,mid3,"35.7",d23) ]
                 else if prayogaH3="karmaNi" && viB1=1
                   && ((vikArya rt1 rt2) || not (rt3="kq3"))
                 then [ Relation (id2,cid2,mid2,"karmasamAnAXikaraNam",id3,cid3,mid3,"35.8",d23) ]
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
   We need to prepare a list of avyayas from avayayakosha  *)
value rlsambanXa1 m1 m2 text_type = match m2 with
  [ Avy (id2,cid2,mid2,_,rt2,_,_,_) ->
          if (rt2="eva"|| rt2="wu"||rt2="uwa"||rt2="nu"|| rt2="ha"|| rt2="cEva" || rt2="hi"|| rt2="Kalu" || rt2="vE" || rt2="api" || rt2="COMMA" || rt2=",") (* iva removed *)
          then match m1 with
        [ Wif (id1,cid1,mid1,word1,_,_,_,_,_,_,_,_,_,_,_,_,_)
        | Kqw (id1,cid1,mid1,word1,_,_,_,_,_,_,_,_,_,_,_,_,_,_)
        | Avykqw (id1,cid1,mid1,word1,_,_,_,_,_,_,_,_,_)
        | AvywaxXiwa (id1,cid1,mid1,word1,_,_,_,_,_)
        | Avy (id1,cid1,mid1,word1,_,_,_,_)
        | WaxXiwa (id1,cid1,mid1,word1,_,_,_,_,_,_,_,_) -> 
       let  d12 = if id1 > id2 then id1-id2 else id2-id1 in
             if id1 = previous id2  
             then [ Relation (id2,cid2,mid2,"sambanXaH",id1,cid1,mid1,"35.9",d12)]
             else []
       (* else if (id1=next id2) 
            (*&& text_type = "Sloka" *)&& rt2="api"
            What is the example?? -- Amba 5july 2020
       then [ Relation (id2,cid2,mid2,"sambanXaH",id1,cid1,mid1,"27.2",d12)] *)
     | Sup (id1,cid1,mid1,word1,rt1,_,_,_,viBakwiH1,_,_) ->
       let  d12 = if id1 > id2 then id1-id2 else id2-id1 in
       if     not(viBakwiH1=8) && id1 = previous id2  
       then [ Relation (id2,cid2,mid2,"sambanXaH",id1,cid1,mid1,"35.10",d12)]
       else []
     ]
     else []
    | Sup (id2,cid2,mid2,word2,rt2,_,_,_,viB2,vac2,_) ->
        match m1 with
        [ Sup (id1,cid1,mid1,_,rt1,_,_,_,viB1,vac1,_) ->
       let  d12 = if id1 > id2 then id1-id2 else id2-id1 in
                if viB1 = 5 && rt2 = "Baya" && id1 = previous id2  
                then [ Relation (id1,cid1,mid1,"apAxAnam",id2,cid2,mid2,"35.11",d12)]
                (* else if viB1 = 7 && ((vac1 = "xvi" && vac2 = "eka") || vac1 = "bahu" ) && rt1 = "wax"
                then [ Relation (id1,cid1,mid1,"viSeRaNam",id2,cid2,mid2,"27.1c")] 
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
  [ Avy (id2,cid2,mid2,word2,_,_,_,_) ->
   match m1 with
     [ Avy (id1,cid1,mid1,word1,_,_,_,_) ->
       let  d12 = if id1 > id2 then id1-id2 else id2-id1 in
    if (id1=previous id2)
       && (member_of word1 samboXana_sUcaka)
       && (member_of word2 samboXana_sUcaka)
       && (not (word1=word2))
       then [ Relation (id1,cid1,mid1,"sambanXaH",id2,cid2,mid2,"28.1",d12)]
       else []
 
     | _ -> []
     ]
  | _ -> []
  ]
  ; *)

(* eva ca, ca eva, ... *)
(* value rlsambanXa2 m1 m2 text_type = match m2 with
  [ Avy (id2,cid2,mid2,word2,_,_,_,_) ->
   match m1 with
     [ Avy (id1,cid1,mid1,word1,_,_,_,_) ->
       let  d12 = if id1 > id2 then id1-id2 else id2-id1 in
    if (id1=previous id2) && (not (word1=word2))
       then match word1 with
       [ "eva" -> match word2 with
                 [ "ca" -> [Relation (id1,cid1,mid1,"sambanXaH",id2,cid2,mid2,"28.2",d12)]
                 | _ -> []
                 ]
       | "ca" -> match word2 with
                 [ "eva" -> [Relation (id1,cid1,mid1,"sambanXaH",id2,cid2,mid2,"28.3",d12)]
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
  [ Wif (id2,cid2,mid2,_,_,_,_,_,_,_,_,_,_,_,_,_,_) ->
     match m1 with
     [ Avy (id1,cid1,mid1,word1,_,_,_,_) -> 
       let  d12 = if id1 > id2 then id1-id2 else id2-id1 in
       if no_boundary_crossing_with_iwi id1 id2 text_type
       then match word1 with
       [ "sma" -> if   (id1 = next id2) 
                    || text_type = "Sloka" (* smopawiRTanwi ... in BR-15-01-001-022c *)
                  then [ Relation (id1,cid1,mid1,"sambanXaH",id2,cid2,mid2,"36.1",d12)]
                  else []
       | _ -> []
       ]
       else []
     | _ -> []
     ]
  | _ -> []
  ]
  ;

value discourse_rel1 m1 id2 cid2 mid2 text_type = match m1 with
     [ Avy (id1,cid1,mid1,word1,_,_,_,_) -> 
       let  d12 = if id1 > id2 then id1-id2 else id2-id1 in
       if no_boundary_crossing_with_iwi id1 id2 text_type
       then match word1 with
       [ "yaxyapi" 
       | "yawaH" -> if (id1 < id2)
          then [ Relation (id1,cid1,mid1,"kAraNa_xyowakaH",id2,cid2,mid2,"37.1",d12)]
          else []
       | "waWApi"
       | "aWApi"
       | "waryhapi"
       | "cexapi"
       | "sannapi"
       | "wawaH"
       | "awaH" -> if (id1 < id2)
          then [ Relation (id1,cid1,mid1,"kArya_xyowakaH",id2,cid2,mid2,"37.2",d12)]
          else [ Relation (id1,cid1,mid1,"sambanXaH",id2,cid2,mid2,"37.3",d12)]
       (*| "yaxi" 
       | "cew" -> if (id1 < id2)
          then [ Relation (id1,cid1,mid1,"AvaSyakawA_xyowakaH",id2,cid2,mid2,"37.2",d12)]
          else []
       | "warhi" -> if (id1 < id2)
          then [ Relation (id1,cid1,mid1,"pariNAma_xyowakaH",id2,cid2,mid2,"37.2",d12)]
          else [] 
      taken care of with AvaSyakawA_pariNAma_xyowakaH *)
       | _ -> []
       ]
       else []
     | _ -> []
     ]
;
value rlavy_sent_connector m1 m2 text_type = match m2 with
  [ Wif (id2,cid2,mid2,_,_,_,_,_,_,_,_,_,_,_,_,_,_) ->
       discourse_rel1 m1 id2 cid2 mid2 text_type
  | Kqw (id2,cid2,mid2,_,_,_,_,kqw2,_,_,_,_,_,_,_,viB1,_,_) ->
       if(kqw2 = "kwa" || kqw2 = "kwavawu") && viB1=1 && finite_verb_in_sentence.val == 50
       then discourse_rel1 m1 id2 cid2 mid2 text_type
       else []
  | _ -> []
  ]
  ;

(* ;wvaM mA gacCa. *)
value rlavy_wifkqw_special m1 m2 text_type = match m2 with
  [ Wif (id2,cid2,mid2,_,_,_,_,_,_,_,_,_,_,_,_,_,_)
  | Kqw (id2,cid2,mid2,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_) (* na jFAwaH; na avalokya *)
  | Avykqw (id2,cid2,mid2,_,_,_,_,_,_,_,_,_,_) ->
     match m1 with
     [ Avy (id1,cid1,mid1,word1,_,_,_,_) -> 
       let  d12 = if id1 > id2 then id1-id2 else id2-id1 in
           if no_boundary_crossing_with_iwi id1 id2 text_type
           then match word1 with
           [ "no" 
           | "nEva" 
           | "nahi" 
           | "na" ->  (*if prose_order id1 id2 text_type this overgenerates; e.g. virakwaH awra na hqRyawi na kupyawi*)
		      if id1 < id2
                      then [ Relation (id1,cid1,mid1,"prawiReXaH",id2,cid2,mid2,"38.1",d12)]
                      else []
           | "kacciw" | "Sam" | "svaswi" | "svAhA" | "svaXA" | "vaRat" | "namaH"
           | "kim" ->  if id1 = total_wrds.val 
                       then [ Relation (id1,cid1,mid1,"sambanXaH",id2,cid2,mid2,"38.2",d12)]
                       else if  id1 < id2 
                            then if not (id1 = 1) && id2 = id1+1
                                 then [ Relation (id1,cid1,mid1,"prayojanam1",id2,cid2,mid2,"38.3",d12)]
                                 else [ Relation (id1,cid1,mid1,"prayojanam1",id2,cid2,mid2,"38.4",d12)
                                      ; Relation (id1,cid1,mid1,"sambanXaH",id2,cid2,mid2,"38.5",d12)
                                      ]
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
                      then [ Relation (id1,cid1,mid1,"sahakAraka",id2,cid2,mid2,"29.4",d12)]
                      else [] *)
          | "waw" ->  if prose_order id1 id2 text_type
                      then [ Relation (id1,cid1,mid1,"sambanXaH",id2,cid2,mid2,"38.6",d12)]
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
  [ Wif (id2,cid2,mid2,_,_,_,_,_,_,_,lakAraH2,_,_,_,_,_,_) ->
     match m1 with
     [ Avy (id1,cid1,mid1,word1,_,_,_,_) ->
       let  d12 = if id1 > id2 then id1-id2 else id2-id1 in
       if   ( id2=next id1 || text_type = "Sloka")
      && word1="mA"
      && (lakAraH2="lot" || lakAraH2="viXilif" || lakAraH2="lqt" || lakAraH2="luf")
       then [ Relation (id1,cid1,mid1,"prawiReXaH",id2,cid2,mid2,"39.1",d12)]
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
  [ Sup (id3,cid3,mid3,_,rt3,_,_,lifgam3,viBakwiH3,vacanam3,_)
  | Kqw (id3,cid3,mid3,_,_,_,_,_,_,_,_,rt3,_,_,lifgam3,viBakwiH3,vacanam3,_)
  | WaxXiwa (id3,cid3,mid3,_,rt3,_,_,_,lifgam3,viBakwiH3,vacanam3,_) -> match m1 with

       [ Sup (id1,cid1,mid1,_,rt1,_,_,lifgam1,viBakwiH1,_,_)
       | Kqw (id1,cid1,mid1,_,_,_,_,_,_,_,_,rt1,_,_,lifgam1,viBakwiH1,_,_)
       | WaxXiwa (id1,cid1,mid1,_,rt1,_,_,_,lifgam1,viBakwiH1,_,_) ->  
	if lifgam1 = lifgam3 then
        let  d13 = if id1 > id3 then id1-id3 else id3-id1 in
        match m2 with
             [ Avy (id2,cid2,mid2,word2,_,_,_,_) ->
               let  d12 = if id1 > id2 then id1-id2 else id2-id1 in
               if  (word2="nAma" || word2="iwi") (* we can have mArIca nAma rAkRaseNa ... paFca wanwrANi racayiwvA ...*)
               then if (* id2 < id3 ; This need not be just before the category
                    e.g. X nAma ekam nagaram  -- see the presence of ekam! 
			id2 need not be < id3; rAkRasaM saMxaxarSa kabanXa nAma; here RAkRasaM (id3) is before nAma (id2)
                    nAma1 -- similar to prawiyogi;
                    nAma2 -- similar to anuyogi  *)
                    not (member_of rt3 saMKyeya)
                    && (not (pronominal123 rt3) || rt3="kim")
                    && not (rt3="kiFciw" || rt3="kiFcana") 
                    then if id1=previous id2 && word2="nAma" && viBakwiH1=viBakwiH3
                         then [ Relation (id1,cid1,mid1,"saFjFA",id3,cid3,mid3,"39.2",d13)
                              ;  Relation (id2,cid2,mid2,"saFjFA_xyowakaH",id1,cid1,mid1,"39.3",d12)]
                         else if word2="iwi" && viBakwiH1=1
                              then if (id1=previous id2) && vacanam3="eka" 
                                   then [ Relation (id1,cid1,mid1,"saFjFA",id3,cid3,mid3,"39.4",d13)
                                        ;  Relation (id2,cid2,mid2,"saFjFA_xyowakaH",id1,cid1,mid1,"39.5",d12)]
                                   else if (id1 < id2) && vacanam3="bahu" 
                                   then [ Relation (id1,cid1,mid1,"Gataka",id3,cid3,mid3,"39.6",d13)
                                       ;  Relation (id2,cid2,mid2,"Gataka_xyowakaH",id1,cid1,mid1,"39.7",d12)]
                                   else []
                              else []
                    else []
                else []
              | _ -> []
              ] else []
      | _ -> []
      ]
  | _ -> []
  ]
;

(*  rAmeNa saha sIwA vanam gacCawi; bAlAnAm kqwe samyak aswi *)
value rl_saha_vinA_kqwe m1 m2 m3 text_type = match m3 with
  [ Wif (id3,cid3,mid3,_,rt2,_,_,upasarga2,_,_,_,_,_,_,_,_,_)
  | Kqw (id3,cid3,mid3,_,rt2,upasarga2,_,_,_,_,_,_,_,_,_,_,_,_)
  | Avykqw (id3,cid3,mid3,_,rt2,_,_,upasarga2,_,_,_,_,_) -> match m1 with

       [ Sup (id1,cid1,mid1,_,rt1,_,_,_,viBakwiH1,_,_)
       | Kqw (id1,cid1,mid1,_,_,_,_,_,_,_,_,rt1,_,_,_,viBakwiH1,_,_)
       | WaxXiwa (id1,cid1,mid1,_,rt1,_,_,_,_,viBakwiH1,_,_) ->  
              
       let  d13 = if id1 > id3 then id1-id3 else id3-id1 in
             match viBakwiH1 with
             [ 3 -> if rt2="gam1" && upasarga2 = "sam_Af" then [ Relation (id1,cid1,mid1,"sahArWaH",id3,cid3,mid3,"40.1",d13)]
                    else if rt2="gam1" && upasarga2 = "sam" then [ Relation (id1,cid1,mid1,"sahArWaH",id3,cid3,mid3,"40.1",d13)]
                    else match m2 with
                [ Avy (id2,cid2,mid2,word2,_,_,_,_) -> 
                   let  d12 = if id1 > id2 then id1-id2 else id2-id1 in
                    match word2 with
                    [ "saha" | "sAkam" | "sArXam" | "samam" ->
                         [ Relation (id1,cid1,mid1,"sahArWaH",id3,cid3,mid3,"40.2",d13)
                         ; Relation (id2,cid2,mid2,"sahArWa_xyowakaH",id1,cid1,mid1,"40.3",d12)]
		    | "anwareNa" | "vinA" | "nAnA" | "pqWak" | "qwe" ->
                         [ Relation (id1,cid1,mid1,"vinArWaH",id3,cid3,mid3,"40.4",d13)
                         ; Relation (id2,cid2,mid2,"vinArWa_xyowakaH",id1,cid1,mid1,"40.5",d12)]

                    | _ -> []
                    ]
                 | Sup (id2,cid2,mid2,word2,rt2,_,_,_,viBakwiH2,_,_) ->
                   let  d12 = if id1 > id2 then id1-id2 else id2-id1 in
                     if (word2 = "sahiwaH") then
                         [ Relation (id1,cid1,mid1,"sahArWaH",id3,cid3,mid3,"40.2",d13)
                         ; Relation (id2,cid2,mid2,"sahArWa_xyowakaH",id1,cid1,mid1,"40.3",d12)]
		     else []
                 | _ -> []
                ]
              | 5 ->  match m2 with
                  [ Avy (id2,cid2,mid2,word2,_,_,_,_) -> 
                    let  d12 = if id1 > id2 then id1-id2 else id2-id1 in
                           match word2 with
		    [ "qwe" ->
                         [ Relation (id1,cid1,mid1,"vinArWaH",id3,cid3,mid3,"40.6",d13)
                         ; Relation (id2,cid2,mid2,"vinArWa_xyowakaH",id1,cid1,mid1,"40.7",d12)]
                    | _ -> []
                    ]
                   | _ -> []
                   ]
              | 6 -> 
                    match m2 with 
                    [ Avy (id2,cid2,mid2,word2,_,_,_,_) -> 
       let  d12 = if id1 > id2 then id1-id2 else id2-id1 in
              match word2 with
                      ["kqwe" ->
                         [ Relation (id1,cid1,mid1,"prayojanam",id3,cid3,mid3,"40.8",d13)
                         ; Relation (id2,cid2,mid2,"prayojanam_xyowakaH",id1,cid1,mid1,"40.9",d12)]
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
        [ Avy (id1,cid1,mid1,word1,_,_,_,_) -> 
          if not (word1="iwi") then []
          else match m2 with
             [ Sup (id2,cid2,mid2,_,rt2,_,_,_,_,_,_) ->
                if not (safKyA rt2) then []
                else match m3 with
                 [ Sup (id3,cid3,mid3,_,rt3,_,_,_,_,vacanam3,_)
                 | Kqw (id3,cid3,mid3,_,_,_,_,_,_,_,_,rt3,_,_,_,_,vacanam3,_)
                 | WaxXiwa (id3,cid3,mid3,_,rt3,_,_,_,_,_,vacanam3,_) ->  
       let  d13 = if id1 > id3 then id1-id3 else id3-id1 in
                      if vacanam3="bahu" then
                      [Relation (id1,cid1,mid1,"Gataka_xyowakaH",id3,cid3,mid3,"38.1",d13)] 
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
      [ Avy (id1,cid1,mid1,word1,_,_,_,_) -> 
           if (word1="iwi" || word1="evam") && id1 = 1
           then match m2 with
            [ Wif (id2,cid2,mid2,_,rt2,_,_,upasarga2,_,_,_,_,_,_,_,_,_)
            | Kqw (id2,cid2,mid2,_,rt2,upasarga2,_,_,_,_,_,_,_,_,_,_,_,_)
            | Avykqw (id2,cid2,mid2,_,rt2,_,_,upasarga2,_,_,_,_,_) ->
       let  d12 = if id1 > id2 then id1-id2 else id2-id1 in
               if no_boundary_crossing_with_iwi id1 id2 text_type
               then if   prose_order id1 id2 text_type
                 && (   members_of rt2 upasarga2 sakarmaka_verbs
                     || members_of rt2 upasarga2 vAkyakarma_verbs
                     || members_of rt2 upasarga2 xvikarmaka1
                     || members_of rt2 upasarga2 xvikarmaka2)
                 &&  word1="iwi" 
               then [ Relation (id1,cid1,mid1,"karma",id2,cid2,mid2,"40.7",d12) ]
                else if    prose_order id1 id2 text_type
                       && rt2="vac1" &&  word1="evam" 
                    then  [ Relation (id1,cid1,mid1,"gONakarma",id2,cid2,mid2,"40.8",d12) ]
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
  [ Avy (id1,cid1,mid1,word1,_,_,_,_) ->
     if word1="iwi"
     then match m2 with
          (*| Wif (id2,cid2,mid2,_,_,_,_,_,_,_,_,_,_,_,_,_,_)
            | Avykqw (id2,cid2,mid2,_,_,_,_,_,_,_,_,_,_) *)
     [ Sup(id2,cid2,mid2,_,_,_,_,_,_,_,_) ->
          (*| Avy (id2,cid2,mid2,_,_,_,_,_)
            | Kqw (id2,cid2,mid2,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_) *)
       let  d12 = if id1 > id2 then id1-id2 else id2-id1 in
       if    id1=next id2 
       then if  id1=total_wrds.val
            then [ Relation (id1,cid1,mid1,"sambanXaH",id2,cid2,mid2,"41.1",d12)]
            else []
       else []
     | _ -> []
     ]
     else []
  | _ -> []
  ]
;

(* Sentential connectives *)

value bhAvalakRaNa_sapwamI id1 id2 id3 cid1 cid2 cid3 mid1 mid2 mid3 text_type kqw1 karwA_karma rl1 rl2 rl3 =
 if (karwA_karma = "" ) then [] 
 else let  d13 = if id1 > id3 then id1-id3 else id2-id1 in
       let  d23 = if id2 > id3 then id2-id3 else id2-id1 in
        if   prose_order id1 id2 text_type 
           && no_boundary_crossing_except_kwvA id1 id2 text_type
        then if  (kqw1="Sawq_lat" || kqw1="SAnac_lat")
             then [ Relation (id1,cid1,mid1,karwA_karma,id3,cid3,mid3,rl1,d13)
                  ; Relation (id3,cid3,mid3,"BAvalakRaNasapwamI_samAnakAlaH",id2,cid2,mid2,rl1,d23)
                  ] 
             else if (kqw1="kwa" || kqw1="kwavawu")
                  then [ Relation (id1,cid1,mid1,karwA_karma,id3,cid3,mid3,rl3,d13)
                       ; Relation (id3,cid3,mid3,"BAvalakRaNasapwamI_pUrvakAlaH",id2,cid2,mid2,rl2,d23)
                       ]
                  else if (kqw1="Sawq_lqt" || kqw1="SAnac_lqt")
                       then [ Relation (id1,cid1,mid1,karwA_karma,id3,cid3,mid3,rl3,d13)
                            ; Relation (id3,cid3,mid3,"BAvalakRaNasapwamI_ananwarakAlaH",id2,cid2,mid2,rl1,d23)
                            ] 
                       else []
        else []
;

(* rAme vanam gawe sawi sIwA api gacCawi *)
value rlBAvalakRaNa_sapwamI1 m1 m2 m3 text_type = match m3 with
  [ Kqw (id3,cid3,mid3,_,rt3,upasarga3,_,kqw3,_,_,_,_,_,_,lifgam3,viBakwiH3,_,_) -> 
      if  (kqw3="Sawq_lat" || kqw3="SAnac_lat" || kqw3="kwa" || kqw3="kwavawu" || kqw3="Sawq_lqt" || kqw3="SAnac_lqt")
       && viBakwiH3=7  && lifgam3="puM"
         (* 2.3.36; yasya_ca_BAvena_BAvalakRaNam; *)
       (* || viBakwiH1 = 6  --> This results in over generation. Hence commented
             2.3.37 RaRTI cAnAxare  - ruxawaH prAvrAjIw  *)
     then match m1 with
       [ Sup (id1,cid1,mid1,_,_,_,_,_,viBakwiH1,_,_) ->
          if  prose_order id1 id3 text_type 
           && no_boundary_crossing_except_kwvA id1 id3 text_type
          then let karwA_karma =
                   if (viBakwiH1=7 || viBakwiH1=6)
                   then  if  (kqw3="Sawq_lat" || kqw3="SAnac_lat" || kqw3="kwa" || kqw3="kwavawu") 
                         then "BkarwA"
			 else ""
                   else if viBakwiH1=2 
                         && (kqw3="kwa" || kqw3="kwavawu")
                         && not ((verb_type rt3 upasarga3) = "akarmaka")
                   then "Bkarma"
                   else ""
                    in match m2 with
                       [ Wif (id2,cid2,mid2,_,rt2,_,_,_,_,_,_,_,_,_,_,_,_) ->
                         bhAvalakRaNa_sapwamI id1 id2 id3 cid1 cid2 cid3 mid1 mid2 mid3 text_type kqw3 karwA_karma "42.1" "42.2" "42.3"
                       | Kqw (id2,cid2,mid2,_,rt2,_,_,kqw2,_,_,_,_,_,_,_,viBakwiH2,_,_) ->
                          if   viBakwiH2=1  && (kqw2="kwa" || kqw2="kwavawu")
                          then bhAvalakRaNa_sapwamI id1 id2 id3 cid1 cid2 cid3 mid1 mid2 mid3 text_type kqw3 karwA_karma "42.4" "42.5" "42.6"
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


(*
value rlBAvalakRaNa_sapwamI2 m1 m2 text_type = match m2 with
    [ Kqw (id2,cid2,mid2,_,rt2,upasarga2,_,kqw2,_,_,_,_,_,_,_,viBakwiH2,_,_) ->
       match m1 with
       [ Sup (id1,cid1,mid1,_,_,_,_,_,viBakwiH1,_,_) ->
       let  d12 = if id1 > id2 then id1-id2 else id2-id1 in
     if  prose_order id1 id2 text_type 
           && no_boundary_crossing_except_kwvA id1 id2 text_type
     then if viBakwiH1=viBakwiH2 
           && (viBakwiH1=7 || viBakwiH1=6)
               && (kqw2="Sawq_lat" || kqw2="SAnac_lat" || kqw2="kwa" || kqw2="kwavawu")
          then [ Relation (id1,cid1,mid1,"BkarwA",id2,cid2,mid2,"44.1",d12) 
              ]
          else if viBakwiH1=2 && viBakwiH2=7
                   && (kqw2="kwa" || kqw2="kwavawu")
                   && not ((verb_type rt2 upasarga2) = "akarmaka")
               then [ Relation (id1,cid1,mid1,"Bkarma",id2,cid2,mid2,"44.2",d12) ]
               else []
     else []
       | _ -> []
       ]
    | _ -> []
    ]
;

*)

value vAkyakarma_iwi id1 id2 id3 cid1 cid2 cid3 mid1 mid2 mid3 text_type rl1 rl2 =
       let  d12 = if id1 > id2 then id1-id2 else id2-id1 in
        let   d13 = if id1 > id3 then id1-id3 else id3-id1 in
               if   no_boundary_crossing id1 id3 text_type
                 && no_boundary_crossing id1 id2 text_type
               then [ Relation (id2,cid2,mid2,"vAkyakarma_xyowakaH",id1,cid1,mid1,rl1,d12)
               ; Relation (id1,cid1,mid1,"vAkyakarma",id3,cid3,mid3,rl2,d13)
               ]
               else []
;

(*
SrUyawAm iwi Amanwrya rAmaH avocaw.
praBAwe aham rAjasaBAm gawvA kA vArwA iwi paSyAmi. 
aham gacCAmi iwi rAmaH avaxaw
*)
value rlvAkyakarma m1 m2 m3 text_type = match m2 with
      [ Avy (id2,cid2,mid2,word2,_,_,_,_) ->
           if (word2="iwi" || word2="evam") 
           then match m3 with
           [ Wif (id3,cid3,mid3,_,rt3,_,_,upasarga3,_,_,_,_,_,_,_,_,_)
           | Kqw (id3,cid3,mid3,_,rt3,upasarga3,_,_,_,_,_,_,_,_,_,_,_,_)
           | Avykqw (id3,cid3,mid3,_,rt3,_,_,upasarga3,_,_,_,_,_) ->
              if (* id2 < id3 does not hold good in Sloka; see BhG1-23-24 below *) 
              prose_order id2 id3 text_type 
              && members_of rt3 upasarga3 vAkyakarma_verbs
              then  match m1 with
                 [ Wif (id1,cid1,mid1,_,_,_,_,_,_,_,_,_,_,_,_,_,_) ->
                     (* if prose_order id1 id2 text_type *)
                    (*  if id1 = previous id2 
                      BhG 1.23-24; evam ukwvA hqRIkeSaH gudAkeSena BArawa, uvAca pArWa paSya ewAn samavewAn kurun iwi 
                      id1 = --; id2 = 2 (evam) id3 = ukwvA;
                      id1 = paSya; id2 = iwi; id3 = uvAca *)
                     if id1 < id2 
                     then vAkyakarma_iwi id1 id2 id3 cid1 cid2 cid3 mid1 mid2 mid3 text_type "45.1" "45.2"
                     else []
                 | Kqw (id1,cid1,mid1,_,_,_,_,_,_,_,_,_,_,_,_,viBakwiH1,_,_) ->
            (*| Avykqw (id1,cid1,mid1,_,rt1,_,_,_,_,_,_)  
                How can in '.. kwvA .. iwi ...' , kwvA be a vAkyakarma? 
               if prose_order id1 id2 text_type*)
                     if id1 < id2 
                     (*if id1 = previous id2*) && viBakwiH1=1
                     then vAkyakarma_iwi id1 id2 id3 cid1 cid2 cid3 mid1 mid2 mid3 text_type "45.3" "45.4"
                     else []
                 | _ -> []
                 ]
              else []
           | Sup (id3,cid3,mid3,word3,rt3,_,_,_,_,_,_) -> 
                 if rt3="mawi" || rt3 = "mawa" then match m1 with
                 [ Wif (id1,cid1,mid1,_,_,_,_,_,_,_,_,_,_,_,_,_,_)
                 | Kqw (id1,cid1,mid1,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_) ->
                    if id1 = previous id2 
                    then vAkyakarma_iwi id1 id2 id3 cid1 cid2 cid3 mid1 mid2 mid3 text_type "45.5" "45.6"
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

(*
rAmaH avaxaw yaw aham gacCAmi
Replacing iwi with yaw will result in the mirror image; ->  'X iwi Y'  is same as 'Y yaw X'
*)

value vAkyakarma id1 id2 id3 cid1 cid2 cid3 mid1 mid2 mid3 rt1 upasarga1 text_type rl1 rl2 =
       let  d13 = if id1 > id3 then id1-id3 else id3-id1 in
        let   d23 = if id2 > id3 then id2-id3 else id3-id2 in
               if    prose_order id1 id2 text_type
                  && no_boundary_crossing id1 id3 text_type
                  && members_of rt1 upasarga1 vAkyakarma_verbs
               then [ Relation (id2,cid2,mid2,"vAkyakarma_xyowakaH",id3,cid3,mid3,rl1, d23)
                    ; Relation (id3,cid3,mid3,"vAkyakarma",id1,cid1,mid1,rl2, d13)
                    ]
               else []
;

value vAkyakarma_sub m1 m2 id3 cid3 mid3 text_type rl1 rl2 rl3 rl4 =
           match m2 with
           [ Avy (id2,cid2,mid2,word2,_,_,_,_) ->
             if    prose_order id2 id3 text_type
                && no_boundary_crossing id2 id3 text_type
                && word2="yaw"
             then match m1 with
             [ Wif (id1,cid1,mid1,_,rt1,_,_,upasarga1,_,_,_,_,_,_,_,_,_) ->
                 (*| Kqw (id1,cid1,mid1,_,rt1,upasarga1,_,_,_,_,_,_,_,_,_,_,_,_)
                   | Avykqw (id1,cid1,mid1,_,rt1,_,_,upasarga1,_,_,_,_,_) ->
                     Need examples where we get kqw or Avykqw with yaw 
                 *)
                 vAkyakarma id1 id2 id3 cid1 cid2 cid3 mid1 mid2 mid3 rt1 upasarga1 text_type  rl1 rl2
             | Kqw (id1,cid1,mid1,_,rt1,upasarga1,_,kqw_prawyayaH1,_,_,_,_,_,_,_,_,_,_) -> 
                  if kqw_prawyayaH1 ="kwa" || kqw_prawyayaH1 = "kwavawu" 
                  then vAkyakarma id1 id2 id3 cid1 cid2 cid3 mid1 mid2 mid3 rt1 upasarga1 text_type  rl3 rl4
                  else []
             | _ -> []
             ]
             else []
           | _ -> []
           ] 

;
(* saH avaxaw yaw aham gacCAmi *)

value rlvAkyakarma1 m1 m2 m3 text_type = match m3 with
       [ Wif (id3,cid3,mid3,_,_,_,_,_,_,_,_,_,_,_,_,_,_) -> 
             (* | Avykqw (id3,cid3,mid3,_,rt3,_,_,_,_,_,_,_,_) -> Any example for Avykqw ? *)
           vAkyakarma_sub m1 m2 id3 cid3 mid3 text_type "46.7" "46.8" "46.9" "46.10"
       | Kqw (id3,cid3,mid3,_,rt3,_,_,kqw_prawyayaH3,_,_,_,_,_,_,_,_,_,_) -> 
           if kqw_prawyayaH3 ="kwa" || kqw_prawyayaH3 = "kwavawu" 
           then vAkyakarma_sub m1 m2 id3 cid3 mid3 text_type "46.11" "46.12" "46.13" "46.14"
           else []
      | _ -> []
    ]
;

(*
sentences with connectives joiniing a wif with kqw fail, if we have rlsent_kqw_connectives and rlsent_wif_cocnnectives seperately.
For example:  श्यामः विरोधं कर्तुं अचेष्टत किन्तु तस्य वचः कः अपि न श्रुतवान्
failed to parse.
*)

value sent_beginning_connectives id1 cid1 mid1 id2 cid2 mid2 rt2 upasarga2 word1 text_type =
         let d12 = if id1 > id2 then id1-id2 else id2-id1 in
              if no_boundary_crossing_with_iwi id1 id2 text_type || id1=1
              then
	      if id1=1 &&  word1 = "api" && text_type="Prose"
              && no_boundary_crossing_with_iwi id1 id2 text_type
              then [ Relation (id1,cid1,mid1,"sambanXaH",id2,cid2,mid2,"47.1",d12)]
              else if    id1 < id2
              then match word1 with
              [ "yaw" -> if not (members_of rt2 upasarga2 vAkyakarma_verbs)
                         then [ Relation (id1,cid1,mid1,"sambanXaH",id2,cid2,mid2,"47.2",d12)
                              ]
                         else []
              |"prawilomam"
              |"awaH"
              |"wawaH"
              |"aWa"
              |"apiwu"
              |"kinwu"
              |"paranwu" -> if ((id1 = 1  && text_type="Prose") || (text_type = "Sloka"))  
                            then [ Relation (id1,cid1,mid1,"sambanXaH",id2,cid2,mid2,"47.3",d12) ]
			    else []
              |"iwaH"
              (*|"param" -- What is an example for this? *)
              |"warhi" -> if id1 = 1  && no_boundary_crossing_with_iwi id1 id2 text_type 
                          then [ Relation (id1,cid1,mid1,"sambanXaH",id2,cid2,mid2,"47.4",d12) ]
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
              |"waxananwaram" -> if (id1 = 1)
			         then  [ Relation (id1,cid1,mid1,"sambanXaH",id2,cid2,mid2,"47.5",d12) ]
			         else []
                            (*|"wu"  wu is never used in the beginning of a sentence; we always show its relation with the previous word, and then disambiguate*)
              | _ -> []
              ]
              else []
              else []
;
value rlsent_beginning_connectives m1 m2 text_type = match m1 with
     [ Avy (id1,cid1,mid1,word1,_,_,_,_) -> match m2 with
     (*| Sup (id1,cid1,mid1,word1,_,_,_,_,_,_,_) -> match m2 with  
         All the words in Sent_beginning_connectives should be avyas only.
         *)
         [ Wif (id2,cid2,mid2,_,rt2,_,_,upasarga2,_,_,_,_,_,_,_,_,_)  ->
           sent_beginning_connectives id1 cid1 mid1 id2 cid2 mid2 rt2 upasarga2 word1 text_type
          | Kqw (id2,cid2,mid2,_,rt2,upasarga2,_,kqw2,_,_,_,_,_,_,_,viB1,_,_) -> 
             (*if member_of kqw2 bhaavavaaci_kqw --  why BAvavAci ? *)
                          (* yaWA eweRAM boXaH Bavawi waWA kaScana upAyaH karaNIyaH *)
             if    (kqw2="kwa" || kqw2 = "kwavawu" || kqw2 = "wavyaw" || kqw2 = "anIyar") 
                && viB1=1 
                && finite_verb_in_sentence.val == 50
             then sent_beginning_connectives id1 cid1 mid1 id2 cid2 mid2 rt2 upasarga2 word1 text_type
             else []
          | _ -> []
          ]
     | _ -> []
     ]
; 

value rl_avaXiH m1 m2 text_type = match m1 with
     [ Avy (id1,cid1,mid1,word1,_,_,_,_) -> match m2 with
       [ Wif (id2,cid2,mid2,_,_,_,_,_,_,_,_,_,_,_,_,_,_) -> 
         let d12 = if id1 > id2 then id1-id2 else id2-id1 in
              if    id1 < id2  && (word1="yAvaw" || word1="wAvaw")
              then [ Relation (id1,cid1,mid1,"avaXiH",id2,cid2,mid2,"48.1",d12)]
              else []
       | _ -> []
       ]
     | _ -> []
     ]
;


value sent_connectives id1 cid1 mid1 id2 cid2 mid2 id3 cid3 mid3 rt1 upasarga1 word2 rl1 rl2 rl3 rl4 =
         (*let d12 = if id1 > id2 then id1-id2 else id2-id1  in*)
          let  d13 = if id1 > id3 then id1-id3 else id3-id1 in
           let d23 = if id2 > id3 then id2-id3 else id3-id2 in
              if    id1 < id2 && id2 < id3
              then match word2 with
              [ (*"yaw" -> if not (members_of rt1 upasarga1 vAkyakarma_verbs)
                         then [ Relation (id1,cid1,mid1,"prawiyogI",id2,cid2,mid2,rl1,d12)
                              ; Relation (id2,cid2,mid2,"anuyogI",id3,cid3,mid3,rl2,d23)
                              ]
                         else [] 
              | *)"aWa"
              |"apiwu"
              |"kinwu"
              |"paranwu" -> [ Relation (id3,cid3,mid3,"viroXakaH",id1,cid1,mid1,rl3,d13)
                            ; Relation (id2,cid2,mid2,"viroXa_xyowakaH",id3,cid3,mid3,rl4,d23)
                            ]
              | _ -> []
              ]
              else []
;

value rlsent_connectives m1 m2 m3 text_type = match m2 with
     [ Avy (id2,cid2,mid2,word2,_,_,_,_) -> match m3 with
       [ Wif (id3,cid3,mid3,_,_,_,_,_,_,_,_,_,_,_,_,_,_) -> match m1 with
         [ Wif (id1,cid1,mid1,_,rt1,_,_,upasarga1,_,_,_,_,_,_,_,_,_)  ->
             sent_connectives id1 cid1 mid1 id2 cid2 mid2 id3 cid3 mid3 rt1 upasarga1 word2 "49.1" "49.2" "49.3" "49.4"
         | Kqw (id1,cid1,mid1,word1,rt1,upasarga1,_,kqw1,_,_,_,_,_,uwwarapaxa1,_,_,_,_) ->
              if  (kqw1 = "kwa" || kqw1 = "kwavawu") 
                 && uwwarapaxa1=word1
             then sent_connectives id1 cid1 mid1 id2 cid2 mid2 id3 cid3 mid3 rt1 upasarga1 word2 "49.5" "49.6" "49.7" "49.8"
             else []
         | _ -> []
         ]
       | Kqw (id3,cid3,mid3,word3,_,_,_,kqw3,_,_,_,_,_,uwwarapaxa3,_,_,_,_) -> match m1 with
         [ Wif (id1,cid1,mid1,_,rt1,_,_,upasarga1,_,_,_,_,_,_,_,_,_)  ->
             sent_connectives id1 cid1 mid1 id2 cid2 mid2 id3 cid3 mid3 rt1 upasarga1 word2 "49.9" "49.10" "49.11" "49.12"
         | Kqw (id1,cid1,mid1,word1,rt1,upasarga1,_,kqw1,_,_,_,_,_,uwwarapaxa1,_,_,_,_) ->
              if    (kqw1 = "kwa" || kqw1 = "kwavawu") 
                 && (kqw3 ="kwa" || kqw3 = "kwavawu") 
                 && uwwarapaxa3=word3 && uwwarapaxa1=word1
              then sent_connectives id1 cid1 mid1 id2 cid2 mid2 id3 cid3 mid3 rt1 upasarga1 word2 "49.13" "49.14" "49.15" "49.16"
              else []
         | _ -> []
         ]
       | _ -> []
       ]
     | _ -> []
     ]
;

value mark_upamAna id1 cid1 mid1 id2 cid2 mid2 id3 cid3 mid3 rl1 rl2 =
         let d12 = if id1 > id2 then id1-id2 else id2-id1 in
         let d13 = if id1 > id3 then id1-id3 else id3-id1 in
      if id1 = previous id2 
      then  [ Relation (id1,cid1,mid1,"upamAnam",id3,cid3,mid3,rl1,d13)
            ; Relation (id2,cid2,mid2,"upamAna_xyowakaH",id1,cid1,mid1,rl2,d12)
            ]
      else []
;

value rlupamAna_upameya_sup m1 m2 m3 text_type = match m2 with
     [ Avy (id2,cid2,mid2,word2,_,_,_,_) -> 
        if word2 = "iva" then match m3 with
        [ Sup (id3,cid3,mid3,_,_,_,_,_,viBakwiH3,_,_)
        | Kqw (id3,cid3,mid3,_,_,_,_,_,_,_,_,_,_,_,_,viBakwiH3,_,_)
        | WaxXiwa (id3,cid3,mid3,_,_,_,_,_,_,viBakwiH3,_,_) -> 
             match m1 with
             [ Sup (id1,cid1,mid1,_,_,_,_,_,viBakwiH1,_,_)
             | WaxXiwa (id1,cid1,mid1,_,_,_,_,_,_,viBakwiH1,_,_) -> 
                   if viBakwiH1=viBakwiH3 || viBakwiH3 = 1
                   (* && id2 < id3 aSmanA iva nirmiwaM xuRtAnAm hqxayam  *) 
                   then mark_upamAna id1 cid1 mid1 id2 cid2 mid2 id3 cid3 mid3 "50.1" "50.2"
                   else []
             | Kqw (id1,cid1,mid1,_,_,_,_,_,_,_,_,_,_,_,_,viBakwiH1,_,_) ->
                   (* && id2 < id3 aSmanA iva nirmiwaM xuRtAnAm hqxayam  *) 
                   if viBakwiH1=viBakwiH3 && id1 = previous id2 
                   then [ Relation (id2,cid2,mid2,"uwprekRA_xyowakaH",id1,cid1,mid1,"50.3",1)]
                   else []
             | _ -> []
             ]
        | Wif (id3,cid3,mid3,_,_,_,_,_,_,_,_,_,_,_,_,_,_) -> 
             match m1 with
             [ Wif (id1,cid1,mid1,_,_,_,_,_,_,_,_,_,_,_,_,_,_) ->
                   if id2 < id3
                   then mark_upamAna id1 cid1 mid1 id2 cid2 mid2 id3 cid3 mid3 "50.5" "50.6"
                   else []
             | _ -> []
             ]
        (* | Kqw (id3,cid3,mid3,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_) -> 
             match m1 with
             [ Kqw (id1,cid1,mid1,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_) -> 
                   if id2 < id3
                   then mark_upamAna id1 cid1 mid1 id2 cid2 mid2 id3 cid3 mid3 "50.7" "50.8"
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
     [Avy (id2,cid2,mid2,_,rt2,_,_,_) -> match m1 with
      [Avy (id1,cid1,mid1,_,rt1,_,_,_) ->
         let d12 = if id1 > id2 then id1-id2 else id2-id1 in
        if  (rt1="yaxA" && rt2="waxA")
           || (rt1="yawaH" && rt2="wawaH")
           || (rt1="yaWA" && rt2="waWA")
           || (rt1="yAvaw" && rt2="wAvaw")
(* waw is added to account for the following Shloka
यदि माम् अ-प्रतीकारम् अ-शस्त्रम् शस्त्र-पाणयः धार्तराष्ट्राः रणे हन्युः तत् मे क्षेम-तरम् भवेत्  1.46 *)
        then [ Relation (id1,cid1,mid1,"niwya_sambanXaH",id2,cid2,mid2,"51.1",d12)]
        else []
      | _ -> []
      ]
     | AvywaxXiwa (id2,cid2,mid2,word2,rt2,_,_,_,_) -> match m1 with
       [ AvywaxXiwa (id1,cid1,mid1,word1,rt1,_,_,_,_) -> 
         let d12 = if id1 > id2 then id1-id2 else id2-id1 in
            if word1="yaxvaw" && word2="waxvaw"
            then [ Relation (id1,cid1,mid1,"niwya_sambanXaH",id2,cid2,mid2,"51.2",d12)]
            else []
       | _ -> []
       ]
     | _ -> []
     ]
; 
value rlniwya_sambanXa_sup m1 m2 text_type = match m2 with
     [ Sup(id2,cid2,mid2,_,rt2,_,_,lifgam2,viBakwiH2,vacanam2,_)  -> 
      match m1 with
      [ Sup(id1,cid1,mid1,_,rt1,_,_,lifgam1,viBakwiH1,vacanam1,_) ->
         let d12 = if id1 > id2 then id1-id2 else id2-id1 in
        if (lifgam1=lifgam2) && (vacanam1=vacanam2) && not (id1=id2)
        then if  (
                   (rt1="yax" && rt2="wax") 
                || (rt1="yax" && rt2 = "ewax")
                || (rt1="yawra" && rt2="wawra")
                || (rt1="yAvaw" && rt2="wAvaw")
                || (rt1="yAvawI" && rt2="wAvawI")
                || (rt1="yAxqS" && rt2="wAxqS")
                || (rt1="yAxqSI" && rt2="wAxqSI"))
        (* || rt1="kim"  || rt1 = "ewax" *) 
        (* How can there be a niwya sambanXa between kim and wax? *)
        (* How can there be a niwya sambanXa between ewax and wax? *)
         then [ Relation (id1,cid1,mid1,"niwya_sambanXaH1",id2,cid2,mid2,"52.1",d12)]
         else []
        else []
      | _ -> []
      ]
     | _ -> []
     ]
; 

value rl_ca m1 m2 text_type = match m2 with
    [ Avy (id2,cid2,mid2,_,_,_,_,_) 
    | Kqw (id2,cid2,mid2,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_)
    | WaxXiwa (id2,cid2,mid2,_,_,_,_,_,_,_,_,_)
    | Wif (id2,cid2,mid2,_,_,_,_,_,_,_,_,_,_,_,_,_,_)
    | Avykqw (id2,cid2,mid2,_,_,_,_,_,_,_,_,_,_) 
    | Sup(id2,cid2,mid2,_,_,_,_,_,_,_,_)  -> match m1 with
      [ Avy (id1,cid1,mid1,word1,_,_,_,_) -> 
         let d12 = if id1 > id2 then id1-id2 else id2-id1 in
         match word1 with
            [ "ca"
            | "vA" -> if id2 = previous id1
                      then [ Relation (id1,cid1,mid1,"sambanXaH",id2,cid2,mid2,"53.1",d12)]
                      else []
            | _ -> []
            ]
      | _ -> []
      ]
    | _ -> []
    ]
;

value rl_exclamatory1 m1 m2 text_type = match m1 with
   [ Avy (id1,cid1,mid1,_,word1,_,_,_) ->  match m2 with
         [ Wif (id2,cid2,mid2,_,_,_,_,_,_,_,_,_,_,_,_,_,_)
         | Kqw (id2,cid2,mid2,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_) -> 
         let d12 = if id1 > id2 then id1-id2 else id2-id1 in
              if id1 < id2
              && no_boundary_crossing_with_iwi id1 id2 text_type
              &&   word1="aho" 
              then [ Relation (id1,cid1,mid1,"sambanXaH",id2,cid2,mid2,"54.1",d12) 
                   ]
              else []
         |_ -> []
         ]
      |_ -> []
      ]
;

value rl_exclamatory2 m1 m2 m3 text_type = match m1 with
   [ Avy (id1,cid1,mid1,_,word1,_,_,_) ->  match m2 with
      [ Avy (id2,cid2,mid2,_,word2,_,_,_) -> match m3 with
         [ Wif (id3,cid3,mid3,_,_,_,_,_,_,_,_,_,_,_,_,_,_)
         | Kqw (id3,cid3,mid3,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_) -> 
         let d12 = if id1 > id2 then id1-id2 else id2-id1 in
          let d23 = if id2 > id3 then id2-id3 else id3-id2 in
              if id1 = previous id2 && id2 < id3
              && no_boundary_crossing_with_iwi id2 id3 text_type
              &&   ((word1="hA" && word2="hanwa") || 
                  (word1="aho" && word2="bawa") ||
                  (word1="ayi" && word2="Bo") ||
                  (word1="eva" && word2="ca")) 
         (*||
                  (word1="ca" && word2="eva")) 
              How can eva connect to a word after it?
              In prose form it is impossible. and even in Shloka form I can not think of any example *)
              then [ Relation (id1,cid1,mid1,"sambanXaH",id2,cid2,mid2,"55.2",d12) 
                   ; Relation (id2,cid2,mid2,"sambanXaH",id3,cid3,mid3,"55.3",d23) 
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

value rl_wulanA_binxu m2 m3 text_type viB1 rl1 =
       match m2 with
       [ Kqw (id2,cid2,mid2,_,_,_,_,_,_,_,_,_,_,_,_,viB2,_,_)
       | WaxXiwa (id2,cid2,mid2,_,_,_,_,_,_,viB2,_,_)
       | Sup(id2,cid2,mid2,_,_,_,_,_,viB2,_,_)  -> match m3 with
           [ Kqw (id3,cid3,mid3,_,_,_,_,_,_,_,_,_,_,_,_,viB3,_,_)
           | WaxXiwa (id3,cid3,mid3,_,_,_,_,_,_,viB3,_,_)
           | Sup(id3,cid3,mid3,_,_,_,_,_,viB3,_,_)  -> 
              let d23 = if id2 > id3 then id2-id3 else id3-id2 in
              if viB3=5 && viB1=viB2
              && no_boundary_crossing_with_iwi id2 id3 text_type
              then [ Relation (id3,cid3,mid3,"wulanA_binxuH",id2,cid2,mid2,rl1,d23)]
              else []
           |_ -> []
           ]
       |_ -> []
       ]
;


value rl_wulanA m1 m2 m3 text_type = match m1 with
   [ WaxXiwa (id1,cid1,mid1,_,_,_,_,wax_prawyayaH,_,viB1,_,_) -> 
       if ((wax_prawyayaH="warap") || (wax_prawyayaH="wamap"))
       then  rl_wulanA_binxu m2 m3 text_type viB1  "56.1"
       else []
   | Sup(id1,cid1,mid1,_,rt1,_,_,_,viB1,_,_) -> 
             match rt1 with
                   ["SreRTa" |"SreRTA" | "SreyasI" | "Sreyas" | "aXika" | "kuSala" | "nipuNa" |"vara"
                   | "cawura" | "cawurA" | "parA" | "para" | "uwwama" | "jyAyasI" | "jyAyas" 
                   | "jyeRTa" | "jyeRTA"| "preyas" | "preyasI" | "preRTa" | "preRTA" | "patIyas" 
                   | "patIyasI" | "patiRTa"| "patiRTA" | "laGiyas" | "laGiyasI" | "laGiRTa" 
                   | "laGiRTA" | "garIyas" | "garIyasI" | "gariRTa" | "gariRTA" 
                   | "nexiRTa" | "nexiyas" | "nexiyasI" | "sAXiRTa" | "sAXiRTA" | "sAxIyas" 
                   | "sAXiyasI"| "kaniRTa" | "kaniRTA" | "kanIyas" | "kaniyasI" | "yaviRTa" 
                   | "yaviRTA" | "yavIyas" | "yavIyAn" | "alpiRTa" | "alpiRTA" | "alpIyas" 
                   | "alpIyasI" | "srajiRTa" | "srajiRTA" | "sragvI" | "srajIyas" | "srajIyasI" 
                   | "wvaciRTa" | "wvaciRTA" | "wvacIyas" | "wvacIyasI" -> 
                       			rl_wulanA_binxu m2 m3 text_type  viB1 "56.2"
                   | _  -> []
                   ]
   | Wif (id1,cid1,mid1,_,rt1,_,_,upasarga1,_,_,_,_,_,_,_,_,_) ->
               if (rt1="ric1" && upasarga1="awi") || (rt1="SiR2" && upasarga1="vi")
               then
                 match m2 with
                  [ Kqw (id2,cid2,mid2,_,_,_,_,_,_,_,_,_,_,_,_,viB2,_,_)
                  | WaxXiwa (id2,cid2,mid2,_,_,_,_,_,_,viB2,_,_)
                  | Sup(id2,cid2,mid2,_,_,_,_,_,viB2,_,_) ->
                        let d12 = if id1 > id2 then id1-id2 else id2-id1 in
                        if viB2=5 
                        then [ Relation (id2,cid2,mid2,"wulanA_binxuH",id1,cid1,mid1,"56.3",d12)]
                        else []
                  |_ -> []
                  ]
               else []
   |_ -> []
   ]
;

(* Following function marks all the relations between two finite verbs due to discourse markers or co-referentials *)
value dis_rel_pair id1 cid1 mid1 id3 cid3 mid3 id2 cid2 mid2 word2 =
    let d13 = if id1 > id3 then id1-id3 else id3-id1 in
     let  d23 = if id2 > id3 then id2-id3 else id3-id2 in
     let  d12 = if id1 > id2 then id1-id2 else id2-id1 in
     match word2 with
     [ "yaxyapi" 
     | "aWApi" -> if (id2 < id1 && id1 < id3) 
                  then [ Relation (id3,cid3,mid3,"vyaBicAraH",id1,cid1,mid1,"57.1",d13)]
		  else if (id3 < id2 && id2 < id1)
                  then [ Relation (id3,cid3,mid3,"vyaBicAraH",id1,cid1,mid1,"57.1",d13)]
		  else []
     | "waryhapi"
     | "cexapi"
     | "sannapi"
     | "waWApi"  -> [ Relation (id3,cid3,mid3,"vyaBicAraH",id1,cid1,mid1,"57.1",d13)]
     | "yaxi"	-> if (id2 < id1) && ((id1 < id3) || (id3 < id2))
                   then [ Relation (id1,cid1,mid1,"AvaSyakawA_pariNAma_sambanXaH",id3,cid3,mid3,"57.2",d13)
                        ; Relation (id2,cid2,mid2,"AvaSyakawA_xyowakaH",id1,cid1,mid1,"57.2a",d12)
                        ]
                   else if (id2 < id3) && ((id3 < id1 ) || (id1 < id2))
                   then [ Relation (id3,cid3,mid3,"AvaSyakawA_pariNAma_sambanXaH",id1,cid1,mid1,"57.3",d13)
                        ; Relation (id2,cid2,mid2,"AvaSyakawA_xyowakaH",id3,cid3,mid3,"57.3a",d23)
                        ]
		   else []
     | "warhi" ->  if (id2 < id1) && ((id3 < id2 ) || (id1 < id3))
                   then [ Relation (id3,cid3,mid3,"AvaSyakawA_pariNAma_sambanXaH",id1,cid1,mid1,"57.4",d13)
                        ; Relation (id2,cid2,mid2,"pariNAma_xyowakaH",id1,cid1,mid1,"57.4a",d12)
                        ]
                   else if (id2 < id3) && ((id1 < id2 ) || (id3 < id1))
                   then [ Relation (id1,cid1,mid1,"AvaSyakawA_pariNAma_sambanXaH",id3,cid3,mid3,"57.5",d13)
                        ; Relation (id2,cid2,mid2,"pariNAma_xyowakaH",id3,cid3,mid3,"57.5a",d23)
                        ]
		   else []
     | "yaw"  
     | "yawaH"  ->  (*if (id2 < id1) *) 
		  if (id2 = id3+1) then
                  [ Relation (id1,cid1,mid1,"kArya_kAraNa_BAvaH",id3,cid3,mid3,"57.6",d13)
                  ; Relation (id2,cid2,mid2,"kAraNa_xyowakaH",id1,cid1,mid1,"57.6a",d23)
                  ] 
                  else if (id2 = id1+1) then
                  [ Relation (id3,cid3,mid3,"kArya_kAraNa_BAvaH",id1,cid1,mid1,"57.7",d13)
                  ; Relation (id2,cid2,mid2,"kAraNa_xyowakaH",id3,cid3,mid3,"57.7a",d23)
                  ]
		  else []
     | "wawaH" -> if not (id2 = 1 && yawaH_pos.val = 50) then 
                   [ Relation (id3,cid3,mid3,"kArya_kAraNa_BAvaH",id1,cid1,mid1,"57.8",d13)
                   ; Relation (id2,cid2,mid2,"kArya_xyowakaH",id3,cid3,mid3,"57.8a",d23)
                   ]
                  else []
     | "yaxA"
     | "waxA" -> [ Relation (id3,cid3,mid3,"samAnakAlaH",id1,cid1,mid1,"57.9",d13)]
     | _ -> []
     ]
;


value dis_rel_pair2 m1 id2 cid2 mid2 id3 cid3 mid3 word2 tense3 = match m1 with
    [ Wif (id1,cid1,mid1,_,_,_,_,_,_,_,lat1,_,_,_,_,_,_) ->
        if (lat1 = tense3) || (lat1 = "lat" && tense3 = "kwavawu") || (lat1 = "laf" && tense3 = "kwa") then
	   dis_rel_pair id1 cid1 mid1 id3 cid3 mid3 id2 cid2 mid2 word2
	else []
    | Kqw (id1,cid1,mid1,_,_,_,_,kqw1,_,_,_,_,_,_,_,viB1,_,_) ->
        if  ((kqw1 = "kwa" && (tense3 = "kwa" || tense3 = "laf")) || (kqw1 = "kwavawu" && (tense3 = "kwavawu" || kqw1 = "lat"))) && not (word2="waxA") && viB1=1
        then dis_rel_pair id1 cid1 mid1 id3 cid3 mid3 id2 cid2 mid2 word2
        else []
    | _ -> []
    ]
;

value rl_wif_kriyA_kriyA m1 m2 m3 text_type = match m2 with
     [ Avy (id2,cid2,mid2,_,word2,_,_,_) -> 
        if    word2 = "yaxyapi" || word2 = "waWApi" || word2 = "aWApi" 
           || word2 = "cexapi" || word2 = "sannapi" || word2 = "waryahpi"
           || word2 = "yaxi" || word2 = "warhi" || word2="cew"
           || word2 = "yawaH" || word2 = "wawaH" || word2="awaH"
           || word2 = "yaxA" || word2 = "waxA" || word2="yaw"
        then match m3 with
        [ Wif (id3,cid3,mid3,_,_,_,_,_,_,_,lat3,_,_,_,_,_,_) ->
	   dis_rel_pair2 m1 id2 cid2 mid2 id3 cid3 mid3 word2 lat3
        | Kqw (id3,cid3,mid3,_,_,_,_,kqw3,_,_,_,_,_,_,_,_,_,_) ->
           if(kqw3 = "kwa" || kqw3 = "kwavawu") && not (word2="waxA")
	   then dis_rel_pair2 m1 id2 cid2 mid2 id3 cid3 mid3 word2 kqw3
           else []
        | _ -> []
        ]
        else []
     | _ -> []
     ]
;

value mark_samucchiwa id1 id2 id3 cid1 cid2 cid3 mid1 mid2 mid3 rl1 rl2 =
     let  d13 = if id1 > id3 then id1-id3 else id3-id1 in
      let   d23 = if id2 > id3 then id2-id3 else id3-id2 in
                 [ Relation (id1,cid1,mid1,"samucciwaH",id3,cid3,mid3,rl1,d13)
                 ; Relation (id2,cid2,mid2,"samuccaya_xyowakaH",id3,cid3,mid3,rl2,d23)
                 ]
;

value mark_sup_samucchiwa id1 id2 id3 cid1 cid2 cid3 mid1 mid2 mid3 viBakwiH1 viBakwiH3 vacanam1 vacanam3 word2 rl1 rl2 = 
     let  d13 = if id1 > id3 then id1-id3 else id3-id1 in
      let   d23 = if id2 > id3 then id2-id3 else id3-id2 in
        if    id1 < id3
           && viBakwiH1=viBakwiH3 
           && not (viBakwiH1 = 8) 
           (* && vacanam1 = vacanam3 ; hqxayAni naBaH ca vyanunAxaya BhG 1.19 *)
           && (   ((word2="ca" || word2="cEva" || word2="api") && (id2 = next id3)) 
               || (word2="waWA" && id2 = id3+1 && id2 > 1 && yaWA_pos.val = 50))
		  (* if id2< id3 iinsteadof id2 = id3+1, then 3 words X Y and waWA ANYWHERE in the sentence get joined. To avoid this the condition that waWA should be just next to the word it would be connected with is added *)
                     (* Need an example for aWa and api as samuccaya || (word2="aWa" && id2 < id3 && id2 > id1 ) *)
        then    [ Relation (id1,cid1,mid1,"sup_samucciwaH",id3,cid3,mid3,rl1,d13)
                ; Relation (id2,cid2,mid2,"sup_samuccaya_xyowakaH",id3,cid3,mid3,rl2,d23)
                ]
        else []
;

value rlca_samucciwa m1 m2 m3 text_type = match m2 with
     [ Avy (id2,cid2,mid2,_,word2,_,_,_) -> 
        if word2 = "ca" || word2 = "cEva" || word2 = "aWa" || word2="waWA" || word2 = "api"
        then match m3 with
        [ Wif (id3,cid3,mid3,_,_,_,_,_,_,prayogaH3,lakAra3,puruRaH3,_,_,_,_,_) ->
           (* if id3 = next id2 then ; not necessary. e.g. rAmaH SAlAm gacCawi pATam ca paTawi*) 
             match m1 with
              [ Wif (id1,cid1,mid1,_,_,_,_,_,_,prayogaH1,lakAra1,puruRaH1,_,_,_,_,_) ->
                   if    id2 > id1 + 1 
                        (* not id2 > id1 To avoid rAmaH joining with gacCawi in rAmaH ca vanam gacCawi *)
                      && prayogaH1=prayogaH3 
                      && lakAra1=lakAra3 
                      && puruRaH1=puruRaH3 
                      && no_boundary_crossing_with_iwi id1 id3 text_type

                   (* && vacanam1=vacanam2  muKam pariSuRyawi gAwrANi ca sIxanwi *)

                  then if (((word2="ca" || word2="cEva")  && ((id2 = id1+2)|| (id2=next id3)))
                             (* id2 is the second word in the second sentence i.e. (id2 = id1+2)  
                                or it is next to the second/last verb 
                               --  rAmaH gAyawi sIwA ca paTawi; rAmaH gAyawi sIwA paTawi ca
                                id2 > id3 for handling 'sma' as in yAnwi sma ca *)
                           || (word2="waWA" && id2 < id3 && id2 > 1 && yaWA_pos.val = 50))
                       then
                            mark_samucchiwa id1 id2 id3 cid1 cid2 cid3 mid1 mid2 mid3 "58.1" "58.2"
                      else []
                  else []
              | _ -> []
              ]
        | Avykqw (id3,cid3,mid3,_,_,_,_,_,_,kqw_prawyaya3,_,_,_) -> match m1 with
             [ Avykqw (id1,cid1,mid1,_,_,_,_,_,_,kqw_prawyaya1,_,_,_) ->
                 if kqw_prawyaya1=kqw_prawyaya3
                 then mark_sup_samucchiwa id1 id2 id3 cid1 cid2 cid3 mid1 mid2 mid3 0 0 0 0 word2 "58.5" "58.6"
                 else []
             | _ -> []
             ]
        | Sup(id3,cid3,mid3,_,_,_,_,_,viBakwiH3,vacanam3,_) 
        | WaxXiwa (id3,cid3,mid3,_,_,_,_,_,_,viBakwiH3,vacanam3,_) -> 
              match m1 with
              [ Sup(id1,cid1,mid1,word1,rt1,_,_,_,viBakwiH1,vacanam1,_) 
              | WaxXiwa (id1,cid1,mid1,word1,rt1,_,_,_,_,viBakwiH1,vacanam1,_) ->
                   (* | Kqw (id1,cid1,mid1,word1,rt1,_,_,_,_,_,_,_,_,_,_,viBakwiH1,_,_) ->
                        This is commented to avoid the grouping of sIxanwi and gAwrANi with muKam_ca in 
                        sIxanwi mama gAwrANi muKam ca pariSuRyawi  *)
                    (* && not (( pronoun3 rt1 || member_of rt1 saMKyeya || member_of rt1 pUraNa || (member_of rt1 guNavAcI && uwwarapaxa1=word1) || (member_of rt1 uwwara_guNavAcI && not (uwwarapaxa1=word1))|| member_of rt1 sambanXavAcI) )  What is its necessity? *)
                 (* then if id3 = next id2 *) (* yogyawA *)
                  mark_sup_samucchiwa id1 id2 id3 cid1 cid2 cid3 mid1 mid2 mid3 viBakwiH1 viBakwiH3 vacanam1 vacanam3 word2 "58.9" "58.10"
              | _ -> []
              ]
        | Kqw (id3,cid3,mid3,_,_,_,_,kqw3,_,_,_,_,_,_,_,viBakwiH3,vacanam3,_) ->
              match m1 with
              [ Kqw (id1,cid1,mid1,_,_,_,_,kqw1,_,_,_,_,_,_,_,viBakwiH1,vacanam1,_) ->
                 if kqw3=kqw1
                 then mark_sup_samucchiwa id1 id2 id3 cid1 cid2 cid3 mid1 mid2 mid3 viBakwiH1 viBakwiH3 vacanam1 vacanam3 word2 "58.13" "58.14"
                 else []
              | Sup(id1,cid1,mid1,word1,rt1,_,_,_,viBakwiH1,vacanam1,_)
              | WaxXiwa (id1,cid1,mid1,word1,rt1,_,_,_,_,viBakwiH1,vacanam1,_) ->
                  mark_sup_samucchiwa id1 id2 id3 cid1 cid2 cid3 mid1 mid2 mid3 viBakwiH1 viBakwiH3 vacanam1 vacanam3 word2 "58.17" "58.18"
              |  _ -> []
              ]
        | _ -> [] 
        ]
        else []
     | _ -> []
     ]
;

value mark_sup_anyawara id1 id2 id3 cid1 cid2 cid3 mid1 mid2 mid3 viBakwiH1 viBakwiH3 vacanam1 vacanam3 rl1 rl2 =
      let  d23 = if id2 > id3 then id2-id3 else id3-id2 in
       let  d13 = if id1 > id3 then id1-id3 else id3-id1 in
           if    viBakwiH1=viBakwiH3 
              && vacanam1=vacanam3
              && id1 < id3 
              && id2 = next id3
           then  [ Relation (id1,cid1,mid1,"anyawaraH",id3,cid3,mid3,rl1, d13)
                 ; Relation (id2,cid2,mid2,"anyawara_xyowakaH",id3,cid3,mid3,rl2,d23)
                 ] 
           else []
;

value mark_anyawara id1 id2 id3 cid1 cid2 cid3 mid1 mid2 mid3 rl1 rl2 =
      let  d23 = if id2 > id3 then id2-id3 else id3-id2 in
       let  d13 = if id1 > id3 then id1-id3 else id3-id1 in
           [ Relation (id1,cid1,mid1,"sup_anyawaraH",id3,cid3,mid3,rl1,d13)
           ; Relation (id2,cid2,mid2,"sup_anyawara_xyowakaH",id3,cid3,mid3,rl2,d23)
           ] 
;

value rl_anyawara m1 m2 m3 text_type = match m2 with
     [ Avy (id2,cid2,mid2,_,word2,_,_,_) -> if word2 = "vA" 
        then match m3 with
        [ Wif (id3,cid3,mid3,_,_,_,_,_,_,prayogaH3,lakAra3,puruRaH3,_,_,_,_,_) ->
             match m1 with
              [ Wif (id1,cid1,mid1,_,_,_,_,_,_,prayogaH1,lakAra1,puruRaH1,_,_,_,_,_) ->
                  if prayogaH1=prayogaH3 
                  && lakAra1=lakAra3 
                  && puruRaH1=puruRaH3 
                      (* && vacanam1=vacanam2  muKam pariSuRyawi gAwrANi ca sIxanwi *)
                   && id1 < id3  
                   && ((id2 < id3) || (id2 = next id3)) 
(* ... gacCawi pATam vA samyak paTawi / gacCawi wiRTawi vA *)
                   && id1 < id2 
                   && no_boundary_crossing_with_iwi id1 id3 text_type
                then mark_anyawara id1 id2 id3 cid1 cid2 cid3 mid1 mid2 mid3 "58.3" "58.4"
                else []
              | _ -> []
              ]
        | Avykqw (id3,cid3,mid3,_,_,_,_,_,_,kqw3,_,_,_) ->
             match m1 with
             [ Avykqw (id1,cid1,mid1,_,_,_,_,_,_,kqw1,_,_,_) ->
                 if kqw1=kqw3
                 then mark_sup_anyawara id1 id2 id3 cid1 cid2 cid3 mid1 mid2 mid3 0 0 0 0 "58.7" "58.8"
                 else []
             | _ -> []
             ]
        | Sup(id3,cid3,mid3,_,_,_,_,_,viBakwiH3,vacanam3,_) 
        | WaxXiwa (id3,cid3,mid3,_,_,_,_,_,_,viBakwiH3,vacanam3,_) ->  
              match m1 with
              [ Sup(id1,cid1,mid1,word1,rt1,_,_,_,viBakwiH1,vacanam1,_) 
              | WaxXiwa (id1,cid1,mid1,word1,rt1,_,_,_,_,viBakwiH1,vacanam1,_) ->
                 mark_sup_anyawara id1 id2 id3 cid1 cid2 cid3 mid1 mid2 mid3 viBakwiH1 viBakwiH3 vacanam1 vacanam3 "58.11" "58.12"
              | _ -> []
              ]
        | Kqw (id3,cid3,mid3,_,_,_,_,kqw3,_,_,_,_,_,_,_,viBakwiH3,vacanam3,_) ->
              match m1 with
              [ Kqw (id1,cid1,mid1,_,_,_,_,kqw1,_,_,_,_,_,_,_,viBakwiH1,vacanam1,_) ->
                 if kqw3=kqw1
                 then mark_sup_anyawara id1 id2 id3 cid1 cid2 cid3 mid1 mid2 mid3  viBakwiH1 viBakwiH3 vacanam1 vacanam3 "58.15" "58.16"
                 else []
              | Sup(id1,cid1,mid1,word1,rt1,_,_,_,viBakwiH1,vacanam1,_)
              | WaxXiwa (id1,cid1,mid1,word1,rt1,_,_,_,_,viBakwiH1,vacanam1,_) ->
                 mark_sup_anyawara id1 id2 id3 cid1 cid2 cid3 mid1 mid2 mid3  viBakwiH1 viBakwiH3 vacanam1 vacanam3 "58.19" "58.20"
              |  _ -> []
              ] 
        | _ -> [] 
        ]
        else []
     | _ -> []
     ]
;


value rl_compound_T6 m1 m2 text_type = match m2 with
  [ Kqw (id2,cid2,mid2,_,_,_,_,_,_,_,_,_,pUrvapaxa2,uwwarapaxa2,_,_,_,_)
  | Sup (id2,cid2,mid2,_,_,pUrvapaxa2,uwwarapaxa2,_,_,_,_)
  | WaxXiwa (id2,cid2,mid2,_,_,pUrvapaxa2,uwwarapaxa2,_,_,_,_,_) -> 
     match m1 with
     [ Sup (id1,cid1,mid1,_,_,pUrvapaxa1,uwwarapaxa1,_,_,_,_)
     | Kqw (id1,cid1,mid1,_,_,_,_,_,_,_,_,_,pUrvapaxa1,uwwarapaxa1,_,_,_,_)
     | WaxXiwa (id1,cid1,mid1,_,_,pUrvapaxa1,uwwarapaxa1,_,_,_,_,_) -> 
	  if (id1 = id2) && not (cid1 = cid2) && (pUrvapaxa1="y") && ((uwwarapaxa2="y") || (pUrvapaxa2="y"))
	  then [ Relation (id1,cid1,mid1,"RaRTIsambanXaH_samAsa",id2,cid2,mid2,"200.1",0) ]
	  else []
     |_ -> []
     ]
   |_ -> []
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
     [ Wif (id,cid,_,_,rt,_,_,upasarga,_,_,_,_,_,_,_,_,_) -> 
             do { 
             (); finite_verb_in_sentence.val := id; 
             if(total_wrds.val < id) then total_wrds.val := id else ();
             if members_of rt upasarga karwqsamAnAXikaraNa_verbs 
             then karwqsamverbs.val := id else ()
             }
     | WaxXiwa (id,cid,_,_,_,_,_,_,_,_,_,_)
     | Kqw (id,cid,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_)
     | AvywaxXiwa (id,cid,_,_,_,_,_,_,_)-> if (total_wrds.val < id) then total_wrds.val := id else ()
     | Avykqw (id,cid,_,_,_,_,_,_,_,kqw,_,_,_) -> do {
                 if (total_wrds.val < id) then total_wrds.val := id else ()
                 ;if (kqw="lyap" || kqw="kwvA")  then
                   if kwvA_lyap_pos1.val = 50 then kwvA_lyap_pos1.val := id
                   else if kwvA_lyap_pos2.val = 50 then kwvA_lyap_pos2.val := id
                   else if kwvA_lyap_pos3.val = 50 then kwvA_lyap_pos3.val := id
                   else ()
                   else ()
                 }
     | Sup (id,cid,_,word,rt,_,_,_,_,_,_) -> do {
                 if (total_wrds.val < id) then total_wrds.val := id else ()
                 ;if rt="yax" then yax_pos.val := id else ()
                 ;if rt="yAvaw" then yAvaw_pos.val := id else ()
                 ;if rt="wAvaw" then wAvaw_pos.val := id else ()
                 ;if word="wvam" then wvam_pos.val := id else ()
                 ;if word="aham" then aham_pos.val := id else ()
                 }
     | Avy (id,cid,_,word,_,_,_,_) -> do {
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
          | "COMMA" -> do { (); manual_boundary1.val := id;}
          | _ -> ()
          ] 
          }
     ] 
 ) morphs
;

value all_rules2 = 
[
rlwifkarwA_karma; rlkqwkarwA_karma; rlanaBihiwe; rlapAxAna_wasil; rlAvy_kriyAviSeRaNam_or_aXikaraNam; rlpUrvakAla; rlwumun1; rlwumun2; rlkwa_as; rlsamAnakAla; rlviSeRaNam; rlavy_viSeRaNam; rlvIpsA; rlsamboXana_xyowakaH; rlnirXAraNam; rlupapaxa_other_rel; rlupapaxa; rlsambanXa1; rlavy_wif_mA; rlavy_wifkqw_special; rl_sma; rlavy_sent_connector; rl_kAraka_RaRTI1; rl_kAraka_RaRTI2; rl_kAraka_RaRTI3; rlAvykqw_karma; rlevamkarma; rl_last_iwi; rlRaRTIsambanXaH; rlviRayAXikaraNam; rlhewuprayoge; rlniwya_sambanXa_avy; rlniwya_sambanXa_sup; (* rl_initial_avy;*)  rl_ca; rlsent_beginning_connectives; (*rlparimANa_viSeRaNam;*) rl_exclamatory1; (*rlhewu_sup;*) rlkarwqrahiwakarwqsamAnAXikaraNam; rlafgavikAra;  rl_spl_aXikaraNam; (* rlkarwqsamAnAXikarana_noverb;  This is over-generating  we need more stringent conditions *) rlkriyAviSeRaNam_wqwIyA; rlaXikaraNam ]
;

value all_rules3 = [rlkarwqsamAnAXikaraNam; rlkarmasamAnAXikaraNam; rlvAkyakarma; rlvAkyakarma1; rlsent_connectives; rlupamAna_upameya_sup; rlca_samucciwa; rl_exclamatory2; rl_ca_wif_aBihiwa_karwA_karma; rl_wulanA; rl_nAma; rl_saha_vinA_kqwe; (*rl_wif_kriyA_kriyA; *) rlBAvalakRaNa_sapwamI1;]
;

value all_compound_rules = [
rl_compound_T6]
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
                              else if compound_pUrvapaxa_uwwarapaxa m1 m2  then
                               List.fold_left collate acc2 all_compound_rules where
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

value rec replace_freq_by_dist acc  = fun
[ [] -> acc
| [Relation (id1,cid1,mid1,rel,id2,cid2,mid2,rl1,dist1) :: s]  -> 
     let dist = if id2 > id1 then id2-id1 else id1-id2 in 
       let acc1 = List.append [Relation(id1,cid1,mid1,rel,id2,cid2,mid2,rl1,dist)] acc in 
           replace_freq_by_dist acc1 s
]
;

value compareincoming m1 m2 =
match m1 with
[ Relation (id1,cid1,mid1,rel,id2,cid2,mid2,rl1,dist1)  -> 
 match m2 with 
 [ Relation (id3,cid3,mid3,rel,id4,cid4,mid4,rl2,dist2)  -> 
     if id1=id3 then compare dist1 dist2 else compare id1 id3 
 ]
]
;

(*
value compareoutgoing m1 m2 =
match m1 with
[ Relation (a1,b1,c1,d1,e1,rl1,dist1)  -> 
 match m2 with 
 [ Relation (a2,b2,c2,d2,e2,rl2,dist2) ->
 if d1=d2 then if e1=e2 then if c1=c2 then compare dist1 dist2 else compare c1 c2 else compare e1 e2 else compare d1 d2
 ]
]
;
*)

value best2incoming sorted_lst =
    let dist_sorted_lst = replace_freq_by_dist [] sorted_lst in
    let sorted_lst1 = List.sort compareincoming dist_sorted_lst in  do {
      (*print_string "after compareincoming\n" ;
      List.iter (print_relation stdout) sorted_lst1 ;
      print_string "after best2incoming\n";*)
    loop [] 0 0 0 "" 0 0 0 0 0 sorted_lst1
    where rec loop acc b c d rel f g h dist count = fun
    [ [] ->  (*do { List.iter (print_relation stdout) acc;  *)  acc  (*} *)
    | [Relation (b1,c1,d1,rel1,f1,g1,h1,rl1,dist1) :: s] ->   (* do { print_sint count;  print_sint a1; print_sint b1; print_string c1; print_sint d1; print_string "\n"; *)
                      if b=b1 then 
                        if dist = dist1 then  (* do { print_string "distance same added\n"; *)
                           let acc1 = List.append acc [Relation (b1,c1,d1,rel1,f1,g1,h1,rl1,dist1)] in 
                               loop acc1 b1 c1 d1 rel1 f1 g1 h1 dist1 count s
                           (* } *)
                         else if rel1="viSeRaNam" then  (* do { print_string "viSeRaNam found\n"; *)
                                let acc1 = List.append acc [Relation (b1,c1,d1,rel1,f1,g1,h1,rl1,dist1)] in 
                                    loop acc1 b1 c1 d1 rel1 f1 g1 h1 dist1 count s
   (* It is possible that RaRTI sambanXaH with immediate next/previous words do not yield the correct answer;
E.G wri-lokajFaH vAlmIkeH nAraxaH vacaH ... here vAlmIkeH can get potentially connected to the previous and the following. But the correct relation is with vacaH. Till we do not know how to stop this, we will allos upto 3 conenctions *)
                         (*else if rel1="RaRTIsambanXaH" then  (* do { print_string "RaRTIsambanXaH found\n"; *)
                                if count < 1 then
                                    let acc1 = List.append acc [Relation (b1,c1,d1,rel1,f1,g1,h1,rl1,dist1)] in 
                                    loop acc1 b1 c1 d1 rel1 f1 g1 h1 dist1 count s
                                else (*do { print_string "skipped"; *) loop acc a1 b1 c1 d1 rel1 e1 f1 g1 h1 0 count s (*}*) *)
                             else if count < 3 then  (* { do print_string "count increased\n"; *)
                                    let acc1 = List.append acc [Relation (b1,c1,d1,rel1,f1,g1,h1,rl1,dist1)] in 
                                    let count1 = count+1 in loop acc1 b1 c1 d1 rel1 f1 g1 h1 dist1 count1 s
                                  (* } *)
                                  else (*do { print_string "skipped"; *) loop acc b1 c1 d1 rel1 f1 g1 h1 0 count s (*}*)
                      else  (*do {  print_string "added\n"; *)
                                 let acc1 = List.append acc [Relation (b1,c1,d1,rel1,f1,g1,h1,rl1,dist1)] in 
                                 loop acc1 b1 c1 d1 rel1 f1 g1 h1 dist1 1 s
                       (*} *)
             (*} *)
     ] 
  }
; 

(*
value best2outgoing sorted_lst =
    let sorted_lst1 = List.sort compareoutgoing sorted_lst in
    loop [] 0 0 "" 0 0 0 0 sorted_lst1
    where rec loop acc a b c d e dist count = fun
    [ [] -> acc
    | [Relation (a1,b1,c1,d1,e1,f1,dist1) :: s] -> 
            if e=e1 then 
               if d = d1 then 
                  if c = c1 then 
                     if b = b1 then 
                       if a = a1 then 
                        if dist = dist1 then 
                           let acc1 = List.append [Relation (a1,b1,c1,d1,e1,f1,dist1)] acc in 
                           loop acc1 a1 b1 c1 d1 e1 dist1 count s
                        else if count < 3 then
                                let acc1 = List.append [Relation (a1,b1,c1,d1,e1,f1,dist1)] acc in 
                                let count1 = count+1 in loop acc1 a1 b1 c1 d1 e1 dist1 count1 s
                             else loop acc a1 b1 c1 d1 e1 dist1 count s
                       else if count < 3 then
                             let acc1 = List.append [Relation (a1,b1,c1,d1,e1,f1,dist1)] acc in 
                             let count1 = count+1 in loop acc1 a1 b1 c1 d1 e1 dist1 count1 s
                          else loop acc a1 b1 c1 d1 e1 dist1 count s
                      else if count < 2 then
                             let acc1 = List.append [Relation (a1,b1,c1,d1,e1,f1,dist1)] acc in 
                             let count1 = count+1 in loop acc1 a1 b1 c1 d1 e1 dist1 count1 s
                          else loop acc a1 b1 c1 d1 e1 dist1 count s
                  else let acc1 = List.append [Relation (a1,b1,c1,d1,e1,f1,dist1)] acc in 
                       loop acc1 a1 b1 c1 d1 e1 dist1 1 s
              else let acc1 = List.append [Relation (a1,b1,c1,d1,e1,f1,dist1)] acc in 
                   loop acc1 a1 b1 c1 d1 e1 dist1 1 s
            else let acc1 = List.append [Relation (a1,b1,c1,d1,e1,f1,dist1)] acc in 
                 loop acc1 a1 b1 c1 d1 e1 dist1 1 s
     ] 
; 

*)

value rec filter_function x count = fun
 [ [] -> count
 | [ Relation(b,c,d,rel,f,g,h,i,j)::s ] -> if b=x then let count1=count+1 in 
                                          filter_function x count1 s 
                                     else filter_function x count s 
 ]
;

value add_rels_per_word rel_lst = 
    loop [] rel_lst where
    rec loop acc = fun
    [ [] -> acc
    | [Relation (b,c,d,rel,f,g,h,i,j) :: s] -> let count = filter_function b 0 rel_lst in
                                         let acc1 = List.append [Relation (b,c,d,rel,f,g,h,i,count)] acc in
					 loop acc1 s
    ]
;

value compare_size m1 m2 =
    match m1 with
    [ Relation (b1,c1,d1,rel1,f1,g1,h1,rl1,dist1)  -> 
       match m2 with 
       [ Relation (b2,c2,d2,rel2,f2,g2,h2,rl2,dist2) ->
           compare dist1 dist2
       ]
    ]
;

value process morphs text_type tfpath = 
  let offline_file = tfpath^"graph.txt"  in
  let cho = open_out offline_file in do
  { 			(*List.iter print_morph_id morphs *) (* we print the input for verification *)
    let rel_lst = List.sort_uniq compare (kAraka_engine3 morphs text_type) in
    let sorted_lst = List.rev (List.sort_uniq compare rel_lst) in do {
    			List.iter (print_relation cho) sorted_lst;
     let sorted_lst1 = best2incoming sorted_lst in do {
      			 output_string cho "\nAFTER best2incoming\n";
      			(*List.iter (print_relation cho) sorted_lst1; *)
      let sorted_lst2 = add_rels_per_word sorted_lst1 in
       let sorted_lst3 = List.sort compare_size sorted_lst2 in  do {
         List.iter (print_relation cho) sorted_lst3;
         flush cho;
        close_out cho;
        let tpl_lst = mk_tuple_lst [] sorted_lst3 in 			 (*do {
          			List.iter Constraint.print_relation tpl_lst ; *)
        (*let t1 = Unix.time() in do { *)
        Constraint.solver tpl_lst text_type
        (*let t2 = Unix.time() in do {
         print_float t2;
         print_float t1
        }
        } *)
          								 (*}*)
       									(*}*)
      									(*}*)
    }
   }
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
           { 
            (*Sys.command("date")
           ;*) 
	     init_relation_encoding_array()
           ; let text_type = Sys.argv.(2)
             and tfpath = Sys.argv.(1)
             and morphs = analyse (Stream.of_channel stdin) in
             do
             {
              init_sentence_feature_variables morphs
             ; process morphs text_type tfpath
             (*; Sys.command("date")*)
             }
           }
;
main()
;
