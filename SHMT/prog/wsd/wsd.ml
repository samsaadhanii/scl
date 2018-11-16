open Pada_structure; (* corresponds to clips_head.txt *)

open Bank_lexer; 
module Gram = Camlp4.PreCast.MakeGram Bank_lexer 
;
open Bank_lexer.Token
;
value morphs = Gram.Entry.mk "morphs"
;

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
        "(compound_hd"; c = IDENT; ")"; 
        "(lifgam"; ling = IDENT; ")"; 
        "(viBakwiH"; vib = INT; ")"; 
        "(vacanam"; vac = IDENT; ")"; 
        "(rel_nm"; rel = IDENT; ")";
        "(relata_pos"; rel_pos = INT; ")";
    ")" -> 
    (int_of_string i,int_of_string m,w,r,c,ling,int_of_string vib,vac, rel, int_of_string rel_pos)
    ] ] ;

  wif:
    [ [ "(wif"; "(id"; i = INT; ")"; 
        "(mid"; m = INT; ")"; 
        "(word"; w = IDENT; ")"; 
        "(rt"; r = IDENT; ")"; 
        "(compound_hd"; c = IDENT; ")"; 
        "(upasarga"; upa = IDENT; ")"; 
        "(sanAxi_prawyayaH"; san = IDENT; ")"; 
        "(prayogaH"; voice = IDENT; ")"; 
        "(lakAraH"; la = IDENT; ")"; 
        "(puruRaH"; per = IDENT; ")"; 
        "(vacanam"; vac = IDENT; ")"; 
        "(paxI"; padi = IDENT; ")"; 
        "(XAwuH"; rtwithiw = IDENT; ")"; 
        "(gaNaH"; gana = IDENT; ")"; 
        "(rel_nm"; rel = IDENT; ")";
        "(relata_pos"; rel_pos = INT; ")";
    ")" -> 
    (int_of_string i,int_of_string m,w,r,c,upa,san,voice,la,per,vac,padi,rtwithiw,gana, rel, int_of_string rel_pos)
    ] ] ;

  kqw:
    [ [ "(kqw"; "(id"; i = INT; ")"; 
        "(mid"; m = INT; ")"; 
        "(word"; w = IDENT; ")"; 
        "(rt"; kqwrt = IDENT; ")"; 
        "(compound_hd"; c = IDENT; ")"; 
        "(upasarga"; upa = IDENT; ")"; 
        "(sanAxi_prawyayaH"; san = IDENT; ")"; 
        "(kqw_prawyayaH"; kp = IDENT; ")"; 
        "(XAwuH"; rtwithiw = IDENT; ")"; 
        "(gaNaH"; gana = IDENT; ")"; 
        "(kqw_pratipadika"; r = IDENT; ")"; 
        "(lifgam"; ling = IDENT; ")"; 
        "(viBakwiH"; vib = INT; ")"; 
        "(vacanam"; vac = IDENT; ")"; 
        "(rel_nm"; rel = IDENT; ")";
        "(relata_pos"; rel_pos = INT; ")";
    ")" -> 
    (int_of_string i,int_of_string m,w,kqwrt,c,upa,san,kp,rtwithiw,gana,r,ling,int_of_string vib,vac, rel, int_of_string rel_pos)
    ] ] ;

  avy:
    [ [ "(avy"; "(id"; i = INT; ")"; 
        "(mid"; m = INT; ")"; 
        "(word"; w = IDENT; ")"; 
        "(rt"; r = IDENT; ")"; 
        "(compound_hd"; c = IDENT; ")"; 
        "(rel_nm"; rel = IDENT; ")";
        "(relata_pos"; rel_pos = INT; ")";
    ")" ->
    (int_of_string i,int_of_string m,w,r,c, rel, int_of_string rel_pos)
    ] ] ;

  avywaxXiwa:
    [ [ "(avywaxXiwa"; "(id"; i = INT; ")"; 
        "(mid"; m = INT; ")"; 
        "(word"; w = IDENT; ")"; 
        "(rt"; r = IDENT; ")"; 
        "(compound_hd"; c = IDENT; ")"; 
        "(waxXiwa_prawyayaH"; taddhita = IDENT; ")"; 
        "(rel_nm"; rel = IDENT; ")";
        "(relata_pos"; rel_pos = INT; ")";
    ")" -> 
    (int_of_string i,int_of_string m,w,r,c,taddhita, rel, int_of_string rel_pos)
    ] ] ;

  avykqw:
    [ [ "(avykqw"; "(id"; i = INT; ")"; 
        "(mid"; m = INT; ")"; 
        "(word"; w = IDENT; ")"; 
        "(rt"; r = IDENT; ")"; 
        "(compound_hd"; c = IDENT; ")"; 
        "(sanAxiH"; san = IDENT; ")";
        "(kqw_prawyayaH"; kqw = IDENT; ")"; 
        "(XAwuH"; rtwithiw = IDENT; ")"; 
        "(gaNaH"; gana = IDENT; ")"; 
        "(rel_nm"; rel = IDENT; ")";
        "(relata_pos"; rel_pos = INT; ")";
     ")" -> 
    (int_of_string i,int_of_string m,w,r,c,san,kqw,rtwithiw,gana, rel, int_of_string rel_pos)
    ] ] ;

  waxXiwa:
    [ [ "(waxXiwa"; "(id"; i = INT; ")"; 
        "(mid"; m = INT; ")"; 
        "(word"; w = IDENT; ")"; 
        "(rt"; r = IDENT; ")"; 
        "(compound_hd"; c = IDENT; ")"; 
        "(waxXiwa_rt"; taddhitart = IDENT; ")"; 
        "(waxXiwa_prawyayaH"; taddhita = IDENT; ")"; 
        "(lifgam"; ling = IDENT; ")"; 
        "(viBakwiH"; vib = INT; ")"; 
        "(vacanam"; vac = IDENT; ")";
        "(rel_nm"; rel = IDENT; ")";
        "(relata_pos"; rel_pos = INT; ")";
    ")" -> 
    (int_of_string i,int_of_string m,w,r,c,taddhita,taddhitart,ling,int_of_string vib,vac, rel, int_of_string rel_pos)
    ] ] ;
END
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

value upapaxa_vib = [ ("2_aBi","2u6");
		("2_aBiwaH","2u6");
		("2_anu","2u6");
		("2_anwarA","2u6");
		("2_anwareNa","2u6");
		("2_aXoXaH","2u6");
		("2_aXo.ZXaH","2u6");
		("2_aXyaXi","2u6");
		("2_hA","2u6");
		("2_nAnA","2u6");
		("2_nikaRA","2u6");
		("2_pari","2u6");
		("2_pariwaH","2u6");
		("2_pqWak","2u6");
		("2_prawi","2u6");
		("2_samayA","2u6");
		("2_sarvawaH","2u6");
		("2_uBayawaH","2u6");
		("2_upa","2u6");
		("2_uparyupari","2u6");
		("2_uwwareNa","2u6");
		("2_vinA","2u6");
		("2_xakRiNena","2u6");
		("2_Xik","2u6");
		("3_alam","3u");
		("3_nAnA","3u");
		("3_saha","3u");
		("3_sAkam","3u");
		("3_sama","3u");
		("3_samA","3u");
		("3_samam","3u");
		("3_samAna","3u");
		("3_samAnA","3u");
		("3_sArXam","3u");
		("3_saxqkRa","3u");
		("3_saxqkRi","3u");
		("3_saxqS","3u");
		("3_saxqSa","3u");
		("3_saxqSi","3u");
		("3_vinA","3u");
		("3_wulya","3u");
		("3_wulyA","3u");
		("4_alam","4u");
		("4_arWa","4u");
		("4_AyuRya","4u");
		("4_Baxra","4u");
		("4_ciraFjIviwa","4u");
		("4_hiwa","4u");
		("4_kuSala","4u");
		("4_maxra","4u");
		("4_namaH","4ko");
		("4_nirAmaya","4u");
		("4_paWya","4u");
		("4_prayojanam","4u");
		("4_Sam","4u");
		("4_suKa","4u");
		("4_svAhA","4ko");
		("4_svaswi","4u");
		("4_svaXA","4u");
		("4_vaRat","4u");
		("5_aByASa","5u");
		("5_aByASA","5u");
		("5_aByASam","5u");
		("5_aByASAw","5u");
		("5_aByASe","5u");
		("5_aByASena","5u");
		("5_anwika","5u");
		("5_anwikA","5u");
		("5_anwikam","5u");
		("5_anwikAn","5u");
		("5_anwikAw","5u");
		("5_anwike","5u");
		("5_anwikena","5u");
		("5_anya","5u");
		("5_anyA","5u");
		("5_AraBya","5u");
		("5_ArAw","5u");
		("%5_arWAnwara","6");
		("5_bahiH","5u");
		("5_Binna","5u");
		("5_BinnA","5u");
		("5_iwara","5u");
		("5_iwarA","5u");
		("%5_kawipaya","6");
		("5_nAnA","5u");
		("5_nikata","5u");
		("5_nikatA","5u");
		("5_nikatam","5u");
		("5_nikatAn","5u");
		("5_nikatAw","5u");
		("5_nikate","5u");
		("5_nikatena","5u");
		("5_paScima","5u");
		("5_paScimam","5u");
		("5_pqWak","5u");
		("5_praBqwi","5u");
		("5_prAk","5u");
		("5_prawi","5u");
		("5_prawyak","5u");
		("5_pUrva","5u");
		("5_pUrvam","5u");
		("5_qwe","5u");
		("5_samIpa","5u");
		("5_samIpA","5u");
		("5_samIpam","5u");
		("5_samIpAn","5u");
		("5_samIpAw","5u");
		("5_samIpe","5u");
		("5_samIpena","5u");
		("5_uwwara","5u");
		("5_uwwarA","5u");
		("5_uwwarAhi","5u");
		("5_uwwaram","5u");
		("5_uxak","5u");
		("5_vilakRaNa","5u");
		("5_vilakRaNA","5u");
		("5_vinA","5u");
		("5_viprakqRta","5u");
		("5_viprakqRtA","5u");
		("5_viprakqRtam","5u");
		("5_viprakqRtAw","5u");
		("5_viprakqRte","5u");
		("5_viprakqRtena","5u");
		("5_xakRiNa","5u");
		("5_xakRiNA","5u");
		("5_xakRiNAhi","5u");
		("5_xakRiNam","5u");
		("5_xUra","5u");
		("5_xUrA","5u");
		("5_xUram","5u");
		("5_xUrAw","5u");
		("5_xUre","5u");
		("5_xUreNa","5u");
		("6_aByASa","6");
		("6_aByASam","6");
		("6_aByASAw","6");
		("6_aByASe","6");
		("6_aByASena","6");
		("6_anwaH","6");
		("6_anwika","6");
		("6_anwikam","6");
		("6_anwikAw","6");
		("6_anwike","6");
		("6_anwikena","6");
		("6_arWa","6");
		("6_aXaH","6");
		("6_aXaswAw","6");
		("6_aXipawi","6");
		("6_AyuRya","6");
		("6_Baxra","6");
		("6_ciraFjIviwa","6");
		("6_hiwa","6");
		("6_ISvara","6");
		("6_kuSala","6");
		("6_maxra","6");
		("6_nikata","6");
		("6_nikatam","6");
		("6_nikatAw","6");
		("6_nikate","6");
		("6_nikatena","6");
		("6_nirAmaya","6");
		("6_prasUwa","6");
		("6_prasUwA","6");
		("6_prawiBU","6");
		("6_puraH","6");
		("6_puraswAw","6");
		("6_sAkRin","6");
		("6_Sam","6");
		("6_sama","6");
		("6_samA","6");
		("6_samAna","6");
		("6_samAnA","6");
		("6_samIpa","6");
		("6_samIpam","6");
		("6_samIpAw","6");
		("6_samIpe","6");
		("6_samIpena","6");
		("6_saxqkRa","6");
		("6_saxqkRI","6");
		("6_saxqS","6");
		("6_saxqSa","6");
		("6_saxqSi","6");
		("6_suKa","6");
		("6_svAmin","6");
		("6_svAminI","6");
		("6_upari","6");
		("6_upariRtAw","6");
		("6_uwwarawaH","6");
		("6_uwwareNa","6");
		("6_viprakqRta","6");
		("6_viprakqRtA","6");
		("6_viprakqRtam","6");
		("6_viprakqRtAw","6");
		("6_viprakqRte","6");
		("6_viprakqRtena","6");
		("6_wulya","6");
		("6_wulyA","6");
		("6_xakRiNawaH","6");
		("6_xakRiNena","6");
		("6_xAyAxa","6");
		("6_xUra","6");
		("6_xUram","6");
		("6_xUrAw","6");
		("6_xUre","6");
		("6_xUreNa","6");
		("7_anurakwa","7u");
		("7_anurakwA","7u");
		("7_Asakwa","7u");
		("7_AsakwA","7u");
		("7_asAXu","7u");
		("7_aXipawi","7u");
		("7_Ayukwa","7u");
		("7_AyukwA","7u");
		("7_ISvara","7u");
		("7_kuSala","7u");
		("7_kuSalA","7u");
		("7_lagna","7u");
		("7_lagnA","7u");
		("7_nipuNa","7u");
		("7_nipuNA","7u");
		("7_prasiwa","7u");
		("7_prasUwa","7u");
		("7_prasUwA","7u");
		("7_prawiBU","7u");
		("7_sAkRin","7u");
		("7_sAkRiNI","7u");
		("7_sAXu","7u");
		("7_svAmin","7u");
		("7_svAminI","7u");
		("7_uwsuka","7u");
		("7_uwsukA","7u");
		("7_xAyAxa","7u");
]
;

value distinct_2 m1 m2 = match m1 with
  [ Wif (id1,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_)
  | Kqw (id1,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_)
  | Avykqw (id1,_,_,_,_,_,_,_,_,_,_)
  | AvywaxXiwa (id1,_,_,_,_,_,_,_)
  | Sup (id1,_,_,_,_,_,_,_,_,_)
  | Avy (id1,_,_,_,_,_,_)
  | WaxXiwa (id1,_,_,_,_,_,_,_,_,_,_,_) -> match m2 with
  	[ Wif (id2,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_)
  	| Kqw (id2,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_)
 	| Avykqw (id2,_,_,_,_,_,_,_,_,_,_)
 	| AvywaxXiwa (id2,_,_,_,_,_,_,_)
 	| Sup (id2,_,_,_,_,_,_,_,_,_)
 	| Avy (id2,_,_,_,_,_,_)
 	| WaxXiwa (id2,_,_,_,_,_,_,_,_,_,_,_) -> 
                if not (id1=id2) 
                then True
                else False
        ]
   ]
;

value distinct_3 m1 m2 m3 =   distinct_2 m1 m2 
                           && distinct_2 m1 m3 
                           && distinct_2 m2 m3
;

value get_hn_vib upapaxa vib = try List.assoc (vib^"_"^upapaxa) upapaxa_vib
      with [Not_found -> ""]
;

value print_relation = fun
  [ Relation (i1 , i2 , i3 , i4 , i5 , i6)  -> 
         do
         { 
           print_int i1; print_string " "
         ; print_int i2; print_string " "
         ; print_string i3; print_string " "
         ; print_string i4; print_string " "
         ; print_string i5; print_string " "
         ; print_string i6; print_string " \n"
         } (* else ()*)
  ]
;
value rec print_relation_list = fun 
  [ [] -> ()
  | [ r :: l ] -> do { print_relation r
             ; print_relation_list l
             }
  ]
;

value previous id = id-1
;

value next id = id+1
;

(* Disambiguate viBakwiH *)

value remove_viSeRaNa_viBakwiH m1 = match m1 with
  [ Sup (id1,mid1,word1,rt1,_,_,viBakwiH1,_,rel,_)
  | WaxXiwa (id1,mid1,word1,rt1,_,_,_,_,viBakwiH1,_,rel,_)
  | Kqw (id1,mid1,word1,_,_,_,_,_,_,rt1,_,_,viBakwiH1,_,rel,_) ->
      if rel="viSeRaNam" then
           [ Relation (id1,mid1,"viBakwiH",string_of_int viBakwiH1,"0","1.1")]
      else []
  | _ -> []
  ]
;

value disambiguate_viBakwiH m1 m2 = match m1 with
  [ Sup (id1,mid1,word1,rt1,compound_hd1,_,viBakwiH1,_,rel,relata_pos) ->
      match viBakwiH1 with
      [ 2 -> match m2 with
             [ Wif (id2,mid2,_,rt2,_,_,sanAxiH2,_,_,_,_,_,_,_,_,_)->
               if rt1="aBi_kruX1" 
               then  [ Relation (id1,mid1,"viBakwiH","2","2para","3.1")]
               else if rt1="aBi_xruh1"
               then  [ Relation (id1,mid1,"viBakwiH","2","2se","3.2")]
               else if rt1="ruh1"
               then  [ Relation (id1,mid1,"viBakwiH","2","2para","3.2")]
               else if rt1="anu_sq1"
               then  [ Relation (id1,mid1,"viBakwiH","2","2kA","3.2")]
               else if rt1="aBi_ni_viS1" || rt1="upa_vas1" || rt1="aXi_sWA1"
               then  [ Relation (id1,mid1,"viBakwiH","2","2meM","3.2")]
               else if rt1="aXi_SI1" || rt1="aXi_As1"
               then  [ Relation (id1,mid1,"viBakwiH","2","2para","3.2")]
               else if rt1="xiv1"
               then  [ Relation (id1,mid1,"viBakwiH","2","2se","3.2")]
               else if rel="kriyA_viSeRaNam"
               then [ Relation (id1,mid1,"viBakwiH",string_of_int viBakwiH1,"0","3.3")]
               else if rel="gONakarma" && id2=relata_pos
               then match rt2 with 
               ["kaWa1"
               |"xuh2"
               |"yAc1"
               |"ruX1"
               |"praC1"
               |"BikR1"
               |"ci1"
               |"brU1"
               |"SAs1"
               |"ji1"
               |"maW1"
               |"manW1"
               |"muR1" -> [ Relation (id1,mid1,"viBakwiH",string_of_int viBakwiH1,"se","3.3") ]
               | _ -> []
               ]
               else [] 
             | _ -> [] 
             ]
      | 3 -> match m2 with
             [ Wif (id2,mid2,_,rt2,_,_,sanAxiH2,_,_,_,_,_,_,_,_,_)->
               if rt1="sam_jFA2" 
               then  [ Relation (id1,mid1,"viBakwiH","3","2","3.1")]
               else if rt1="sam_gam1"
               then  [ Relation (id1,mid1,"viBakwiH","3","3u","3.2")]
               else if rel="karwA"
               then  [ Relation (id1,mid1,"viBakwiH","3","3xvArA","3.2")]
               else [] 
             | _ -> [] 
             ]
      | 4 -> match m2 with
             [ Wif (id2,mid2,_,rt2,_,_,sanAxiH2,_,_,_,_,_,_,_,_,_)->
               if rt1="kruX1" 
               then  [ Relation (id1,mid1,"viBakwiH","4","4para","3.4")]
               else if rt1="xruh1" || rt1="IrRy1" || rt1="apa_rAX1"
               then  [ Relation (id1,mid1,"viBakwiH","4","4se","3.5")]
               else if rt1="asUya1"
               then  [ Relation (id1,mid1,"viBakwiH","4","4meM","3.5")]
               else if rt1="SlAG1"
               then  [ Relation (id1,mid1,"viBakwiH","4","4kI","3.5")]
               else if rt1="hnu1"
               then  [ Relation (id1,mid1,"viBakwiH","4","4ko","3.5")]
               else if rt1="sWA1" || rt1="Sap1"
               then  [ Relation (id1,mid1,"viBakwiH","4","4ke_liye","3.5")]
               else if rel="prayojanam"
               then  [ Relation (id1,mid1,"viBakwiH","4","4ke_liye","3.5")]
               else [] 
             | _ -> [] 
             ]
      | 6 -> match m2 with
             [ Wif (id2,mid2,_,rt2,_,_,sanAxiH2,_,_,_,_,_,_,_,_,_)->
               if rt1="xiv1" 
               then  [ Relation (id1,mid1,"viBakwiH","6","20","3.6")]
               else [] 
             | _ -> [] 
             ]
      | _ -> []
      ]
  | _ -> []
  ]
  ;

(* Disambiguate rt *)
value mark_name m1 m2 = match m1 with
  [ Sup (id1,mid1,word1,rt1,compound_hd1,lifga1,viBakwiH1,vacanam1,_,_) ->
      if rt1="rAjan" || rt1="nAma" then
        match m2 with
        [ Sup (id2,mid2,word2,rt2,compound_hd2,lifga2,viBakwiH2,vacanam2,_,_) ->
          if (    (id2 = next id1  && rt1="rAjan") 
               || (id2 = previous id1 && rt1="nAma"))
            && viBakwiH1=viBakwiH2 && lifga1=lifga2 && viBakwiH1=viBakwiH2 
          then [ Relation (id2,mid2,"rt",rt2,rt2^"1","4.1")]
          else []
        | _ -> []
        ]
      else []
  | _ -> []
  ]
;

value disambiguate_kim m1 = match m1 with
  [ Sup (id1,mid1,word1,rt1,compound_hd1,lifga1,viBakwiH1,vacanam1,_,_) ->
      if rt1="kim" && lifga1="napuM" && (viBakwiH1=1 || viBakwiH1=2)
      then [ Relation (id1,mid1,"rt",rt1,rt1^"_1","5.1")
           ; Relation (id1,mid1,"viBakwiH",string_of_int viBakwiH1,"0","5.2")
           ]
      else []
  | _ -> []
  ]
;

value disambiguate_nAma m1 m2 m3 = match m1 with
  [ Avy (id1,mid1,_,rt1,_,_,_) -> 
    if rt1="nAma" then
       match m2 with
       [ Sup (id2,mid2,word2,rt2,compound_hd1,lifga2,viBakwiH2,vacanam2,_,_) ->
         match m3 with
         [ Sup (id3,mid3,word3,rt3,compound_hd1,lifga3,viBakwiH3,vacanam3,_,_) -> 
	   if lifga2 = lifga3 && viBakwiH2 = viBakwiH3 && vacanam2 = vacanam3 
           then [ Relation (id1,mid1,"rt",rt1,rt1^"_1","6.1")
                ; Relation (id1,mid1,"viBakwiH",string_of_int viBakwiH2,"0","6.2")
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


value disambiguate_avys m1 = match m1 with
  [ Avy (id1,mid1,word1,rt1,_,_,_) ->
      if (rt1="api" || rt1="param" || rt1="purA") && id1=1
      then [ Relation (id1,mid1,"rt",rt1,rt1^"1","7.1")]
      else if rt1="param" && id1=1
      then [ Relation (id1,mid1,"rt",rt1,rt1^"1","7.2")]
      else []
  | _ -> []
  ]
;

value disambiguate_wawra m1 m2 = match m1 with
  [ Avy (id1,mid1,word1,rt1,_,_,_) ->
      if rt1="wawra" 
      then match m2 with
        [ Avy (id2,mid2,word2,rt2,_,_,_) ->
           if rt2="yawra"  && id1 = next id2 
           then [ Relation (id2,mid2,"rt",rt2,rt2^"1","8.1")]
           else []
        | _ -> []
        ]
      else []
  | _ -> []
  ]
;

value disambiguate_iwi m1 m2 = match m1 with
  [ Avy (id1,mid1,word1,rt1,_,_,_) ->
      if rt1="iwi" 
      then match m2 with
         [ Sup (id2,mid2,word2,rt2,_,_,_,_,_,_) ->
           if rt2="aBiXAna"  && id2 = next id1 
           then [ Relation (id2,mid2,"rt",rt2,rt2^"1","9.1")
                ; Relation (id1,mid1,"rt",rt1,rt1^"1","9.2")
                ]
           else []
         | _ -> []
         ]
       else []
  | _ -> []
  ]
;

value upapaxa m1 m2= match m1 with
     [ Sup (id1,mid1,_,rt1,_,_,viBakwiH1,_,_,_) ->
        match m2 with
        [ Avy (id2,mid2,_,rt2,_,_,_)
        | Sup (id2,mid2,_,rt2,_,_,_,_,_,_) -> 
            let hn_vb = get_hn_vib rt2 (string_of_int viBakwiH1) in
            if id2 = next id1 && not (hn_vb="") 
            then [ Relation (id1,mid1,"viBakwiH",string_of_int viBakwiH1,hn_vb,"10.1")]
            else []
        | _ -> []
        ]
     | _ -> []
     ]
;

value all_rules3 =
[ disambiguate_nAma ]
;

value all_rules2 = 
[
  disambiguate_viBakwiH; disambiguate_wawra; disambiguate_iwi; upapaxa; mark_name
]
;

value all_rules1 = 
[
  disambiguate_avys; disambiguate_kim; remove_viSeRaNa_viBakwiH
]
;

value wsd_engine3 morphs =
  loop1 [] morphs 
  where rec loop1 acc1 = fun
       [ [] -> acc1
       | [ m1 :: r1 ] -> 
           let relations_m1 = loop2 [] morphs
           where rec loop2 acc2 = fun
           [ [] -> List.fold_left collate acc1 all_rules1 where
                   collate rls rule = match rule m1 with
                   [ [] -> List2.union rls acc2
                   | r -> [ r :: rls ]
                   ]
           | [ m2 :: r2 ] -> 
               let relations_m1_m2 = loop3 [] morphs
               where rec loop3 acc3 = fun
               [ [] ->  if distinct_2 m1 m2 then
                          List.fold_left collate acc2 all_rules2 where
                          collate rls rule = match rule m1 m2 with
                          [ [] -> List2.union rls acc3
                          | r ->  [ r :: rls ]
                          ]
                        else acc3
               | [ m3 :: r3 ] -> 
                    if distinct_3 m1 m2 m3 then
                      let relations_m1_m2_m3 = 
                       List.fold_left collate acc3 all_rules3 where
                       collate rls rule = match rule m1 m2 m3 with
                       [ [] -> rls
                       | r -> [ r :: rls ]
                       ] in loop3 (List2.union relations_m1_m2_m3 acc3) r3
                    else loop3 acc3 r3
               ] in loop2 (List2.union relations_m1_m2 acc2) r2
       ] in loop1 (List2.union relations_m1 acc1) r1
       ] 
; 

value process morphs = do
  { (* List.iter print_morph_id morphs *) (* we print the input for verification *)
   
   List.iter print_relation_list (wsd_engine3 morphs)
(*   ;List.iter print_relation_list (wsd_engine2 morphs text_type) *)
  }
;

value main () = (* if (Array.length Sys.argv < 2 ) then do
           { print_string "\n\n"
           ; print_string "Usage: ./wsd_without_kAraka_relations\n\n"
           ; failwith "Parsing aborted\n"
           } 
        else *)
            let morphs = analyse (Stream.of_channel stdin) in
            process morphs
;
main()
;
