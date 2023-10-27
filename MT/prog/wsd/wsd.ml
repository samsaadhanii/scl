open Pada_structure; (* corresponds to clips_head.txt *)

open Bank_lexer; 
module Gram = Camlp4.PreCast.MakeGram Bank_lexer 
;
open Bank_lexer.Token
;

open Amuurwa;
open Muurwa;
open Kaalavaaci;

value morphs = Gram.Entry.mk "morphs"
;

(* Grammar of morph_analyses coming from sentence *)

EXTEND Gram
  GLOBAL: morphs;
  morphs:
    [ [ l = morph_rec; `EOI -> l
      | l = morph_rec -> failwith "Wrong morph data: WSD"
    ] ] ;
  morph_rec:
    [ [ -> []
      | l = morph_rec; t = morph ->  (* left (terminal) recursion essential *)
    l @ [ t ]
    ] ] ;
  morph:
    [ [ s = sup -> Sup s 
      | w = wif -> Wif w 
      | a = avy -> Avy a
      | k = kqw -> Kqw k
      | ak = avykqw -> Avykqw ak
      | w = waxXiwa -> WaxXiwa w
      | aw = avywaxXiwa -> AvywaxXiwa aw
    ] ] ;

  sup:
    [ [ "(sup"; "(id"; i = INT; ")"; 
        "(cid"; m = INT; ")"; 
        "(word"; w = IDENT; ")"; 
        "(rt"; r = IDENT; ")"; 
        "(pUrvapaxa"; cp = IDENT; ")"; 
        "(uwwarapaxa"; cu = IDENT; ")"; 
        "(lifgam"; ling = IDENT; ")"; 
        "(viBakwiH"; vib = INT; ")"; 
        "(vacanam"; vac = IDENT; ")"; 
        "(rel_nm"; rel = IDENT; ")";
        "(relata_pos_id"; rel_pos_id = INT; ")";
        "(relata_pos_cid"; rel_pos_cid = INT; ")";
    ")" -> 
    (int_of_string i,int_of_string m,w,r,cp,cu,ling,int_of_string vib,vac, rel, int_of_string rel_pos_id, int_of_string rel_pos_cid)
    ] ] ;

  wif:
    [ [ "(wif"; "(id"; i = INT; ")"; 
        "(cid"; m = INT; ")"; 
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
        "(rel_nm"; rel = IDENT; ")";
        "(relata_pos_id"; rel_pos_id = INT; ")";
        "(relata_pos_cid"; rel_pos_cid = INT; ")";
    ")" -> 
    (int_of_string i,int_of_string m,w,r,cp,cu,upa,san,voice,la,per,vac,padi,gana,rel, int_of_string rel_pos_id, int_of_string rel_pos_cid)
    ] ] ;

  kqw:
    [ [ "(kqw"; "(id"; i = INT; ")"; 
        "(cid"; m = INT; ")"; 
        "(word"; w = IDENT; ")"; 
        "(rt"; kqwrt = IDENT; ")"; 
        "(pUrvapaxa"; cp = IDENT; ")"; 
        "(uwwarapaxa"; cu = IDENT; ")"; 
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
        "(relata_pos_id"; rel_pos_id = INT; ")";
        "(relata_pos_cid"; rel_pos_cid = INT; ")";
    ")" -> 
    (int_of_string i,int_of_string m,w,kqwrt,cp,cu,upa,san,kp,rtwithiw,gana,r,ling,int_of_string vib,vac, rel, int_of_string rel_pos_id, int_of_string rel_pos_cid)
    ] ] ;

  avy:
    [ [ "(avy"; "(id"; i = INT; ")"; 
        "(cid"; m = INT; ")"; 
        "(word"; w = IDENT; ")"; 
        "(rt"; r = IDENT; ")"; 
        "(pUrvapaxa"; cp = IDENT; ")"; 
        "(uwwarapaxa"; cu = IDENT; ")"; 
        "(rel_nm"; rel = IDENT; ")";
        "(relata_pos_id"; rel_pos_id = INT; ")";
        "(relata_pos_cid"; rel_pos_cid = INT; ")";
    ")" ->
    (int_of_string i,int_of_string m,w,r,cp,cu, rel, int_of_string rel_pos_id, int_of_string rel_pos_cid)
    ] ] ;

  avywaxXiwa:
    [ [ "(avywaxXiwa"; "(id"; i = INT; ")"; 
        "(cid"; m = INT; ")"; 
        "(word"; w = IDENT; ")"; 
        "(rt"; r = IDENT; ")"; 
        "(pUrvapaxa"; cp = IDENT; ")"; 
        "(uwwarapaxa"; cu = IDENT; ")"; 
        "(waxXiwa_prawyayaH"; taddhita = IDENT; ")"; 
        "(rel_nm"; rel = IDENT; ")";
        "(relata_pos_id"; rel_pos_id = INT; ")";
        "(relata_pos_cid"; rel_pos_cid = INT; ")";
    ")" -> 
    (int_of_string i,int_of_string m,w,r,cp,cu,taddhita, rel, int_of_string rel_pos_id, int_of_string rel_pos_cid)
    ] ] ;

  avykqw:
    [ [ "(avykqw"; "(id"; i = INT; ")"; 
        "(cid"; m = INT; ")"; 
        "(word"; w = IDENT; ")"; 
        "(rt"; r = IDENT; ")"; 
        "(pUrvapaxa"; cp = IDENT; ")"; 
        "(uwwarapaxa"; cu = IDENT; ")"; 
        "(upasarga"; upa = IDENT; ")"; 
        "(sanAxi_prawyayaH"; san = IDENT; ")";
        "(kqw_prawyayaH"; kqw = IDENT; ")"; 
        "(XAwuH"; rtwithiw = IDENT; ")"; 
        "(gaNaH"; gana = IDENT; ")"; 
        "(rel_nm"; rel = IDENT; ")";
        "(relata_pos_id"; rel_pos_id = INT; ")";
        "(relata_pos_cid"; rel_pos_cid = INT; ")";
     ")" -> 
    (int_of_string i,int_of_string m,w,r,cp,cu,upa,san,kqw,rtwithiw,gana, rel, int_of_string rel_pos_id, int_of_string rel_pos_cid)
    ] ] ;

  waxXiwa:
    [ [ "(waxXiwa"; "(id"; i = INT; ")"; 
        "(cid"; m = INT; ")"; 
        "(word"; w = IDENT; ")"; 
        "(rt"; r = IDENT; ")"; 
        "(pUrvapaxa"; cp = IDENT; ")"; 
        "(uwwarapaxa"; cu = IDENT; ")"; 
        (*"(waxXiwa_rt"; taddhitart = IDENT; ")"; *)
        "(waxXiwa_prawyayaH"; taddhita = IDENT; ")"; 
        "(lifgam"; ling = IDENT; ")"; 
        "(viBakwiH"; vib = INT; ")"; 
        "(vacanam"; vac = IDENT; ")";
        "(rel_nm"; rel = IDENT; ")";
        "(relata_pos_id"; rel_pos_id = INT; ")";
        "(relata_pos_cid"; rel_pos_cid = INT; ")";
    ")" -> 
    (*(int_of_string i,int_of_string m,w,r,cp,cu,taddhita,taddhitart,ling,int_of_string vib,vac, rel, int_of_string rel_pos) *)
    (int_of_string i,int_of_string m,w,r,cp,cu,taddhita,ling,int_of_string vib,vac, rel, int_of_string rel_pos_id, int_of_string rel_pos_cid)
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
                ("5_pUrva","5"); (* 5u -> 5; BojanAw pUrvam = Bojana se pahale *)
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
		("7_kuSala","7meM");
		("7_kuSalA","7meM");
		("7_lagna","7meM");
		("7_lagnA","7meM");
		("7_nipuNa","7meM");
		("7_nipuNA","7meM");
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

(* karma+dhaatu,hnd_mng 
In this module, the skt mng is replaced by the hnd mng.
contribution by -- Amruta Malvade
*)

value lvc_list = [
("ASrama+pra_Ap1","ASrama_pahuzCa");
("manas+banX1","mana_lagA");
("cakRus+banX1","AkqRta_kara");
("cakRus+ni_banX1","AkqRta_ho");
("payas+upa_Buj2","pAni_pI");
("Buva+Buj2","pqWvI_kA_upaBoga_kara");
("paxa+Buj2","anuBava_kara");
("upahAsyawA+gam1","hazsI_ko_prApwa_ho");
("karNa+Af_gam1","suna");
("mqxuwA+gam1","SAnwa_ho");
("viRaya-anwara+gam1","viRayoM_ko_jAna");
("Awma-prawi-rUpa+gam1","svAnurUpa_ko_prApwa_ho");
("vaSa+gam1","vaSIBUwa_ho");
("rajanI+gam1","rAwa_biwA");
("roRavaSa+gam1","kroXiwa_ho");
("rAkRasawA+gam1","rAkRasawA_ko_prApwa_ho");
("Bakwi+gaNa1","Bakwi_ko_samaJa/jAna");
("sixXi+vi_gaNa1","sixXi_ko_jAna/samaJa");
("pAxa+grah1","ABivAxana_kara^pEra_CU");
("AxeSa+prawi_grah1","AjFA_kA_svIkAra_kara");
("raGu+kq3","raGu_raKa");
("avajFA+SiWilIkq3","apamAna_kA_wyAga_kara");
("BUwala+kq3","BUwala_banA");
("vyoma+kq3","AkASa_banA");
("uxamBaMs+kq3","jalamaya_banA");
("suprawarA+kq3","naxI_banA");
("prakASa+kq3","vana,banA");
("buxXi+kq3","niScaya_kara");
("buxXi+kq3","niScaya_kara");
("Gata+kq3","GadA_banA");
("buxXi+kq3","niScaya_kara");
("manas+kq3","vicAra_kara^soca");
("afguli+ava_lab1","aZgulI_pakada");
("anya-rasa+vi_laG2","anyarasoM_ko_Coda");
("kAla+NI1","samaya_biwA");
("niSA+NI1","rAwa_biwA");
("saMramBa+NI1","vikRubXa_kara");
("axarSana+NI1","CupA");
("sUrya+NI1","sUrya_ko_bulA");
("sva-xeha+upa_Af_NI1","arpiwa_kara");
("saMSaya+Nux1","saMSaya_xUra_kara");
("piwq+paw1","axogawi_ko_prApwa_ho");
("cakRus+paw1","xeKa^najara_dAla");
("rAGava+pA1","rAGava_ko_xeKawe_hue");
("vqxXi+puR3","vqxXi_ko_prApwa_kara");
("afka+Af_rup1","goxa_me_le");
("Xura+Ranj1","BAra_ko_XAraNa_kara");
("Ipsiwa+Sans1","icCA_ko_prakata_kara/bawA");
("vivAha-xIkRA+nir_vqw1","vivAha_saMskAra_kara");
("xohaxa-vyaWA+nis_wQ1","garBa_ke_prArmBika_kaRtoM_ko_biwA");
("vAc+Af_xA3","bAwa_kara");
("manas+xA3","mana_lagA");
("manas+Af_xA3","mana_ko_AkqRta_kara");
("cakRus+xA3","najara_dAla");
("karNa+xA3","suna");
("karNa+xA3","suna");
("syanxana+xA3","raWa_ko_xeKa");
("Sara+prawi_Af_xiS1","bANoM_ko_vyarWa_kara_xe");
("xiva+xuh2","AkASa_kA_pAlana_kara");
("SafKa+XmA1","SafKa_bajA");
("wqpwi+Af_yA1","wqpwa_ho");
("sparSa-rasa-jFawA+yA1","puwrasparaSa_ke_suKa_ko_prApwa_kara");
]
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

value amuurwa = build_trie amuurwa_list
;

value muurwa = build_trie muurwa_list
;

value kaalavaaci = build_trie kaalavaaci_list
;

value distinct_2 m1 m2 = match m1 with
  [ Wif (id1,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_)
  | Kqw (id1,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_)
  | Avykqw (id1,_,_,_,_,_,_,_,_,_,_,_,_,_)
  | AvywaxXiwa (id1,_,_,_,_,_,_,_,_,_)
  | Sup (id1,_,_,_,_,_,_,_,_,_,_,_)
  | Avy (id1,_,_,_,_,_,_,_,_)
  | WaxXiwa (id1,_,_,_,_,_,_,_,_,_,_,_,_) -> match m2 with
  	[ Wif (id2,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_)
  	| Kqw (id2,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_)
 	| Avykqw (id2,_,_,_,_,_,_,_,_,_,_,_,_,_)
 	| AvywaxXiwa (id2,_,_,_,_,_,_,_,_,_)
 	| Sup (id2,_,_,_,_,_,_,_,_,_,_,_)
 	| Avy (id2,_,_,_,_,_,_,_,_)
 	| WaxXiwa (id2,_,_,_,_,_,_,_,_,_,_,_,_) -> 
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

value get_hn_lvc karma verb = try List.assoc (karma^"+"^verb) lvc_list
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
  [ Sup (id1,cid1,word1,rt1,_,_,_,viBakwiH1,_,rel,_,_)
  | WaxXiwa (id1,cid1,word1,rt1,_,_,_,_,viBakwiH1,_,rel,_,_)
  | Kqw (id1,cid1,word1,_,_,_,_,_,_,_,rt1,_,_,viBakwiH1,_,rel,_,_) ->
      if rel="viSeRaNam" then
           [ Relation (id1,cid1,"viBakwiH",string_of_int viBakwiH1,"0","1.1")]
      else []
  | _ -> []
  ]
;

value change_nirXAraNa_viBakwiH m1 = match m1 with
  [ Sup (id1,cid1,word1,rt1,_,_,_,viBakwiH1,_,rel,_,_)
  | WaxXiwa (id1,cid1,word1,rt1,_,_,_,_,viBakwiH1,_,rel,_,_)
  | Kqw (id1,cid1,word1,_,_,_,_,_,_,_,rt1,_,_,viBakwiH1,_,rel,_,_) ->
      if rel="nirXAraNam"  && viBakwiH1 = 6 then
           [ Relation (id1,cid1,"viBakwiH",string_of_int viBakwiH1,"7meM","2.1")]
      else []
  | _ -> []
  ]
;

value disambiguate_viBakwiH m1 m2 = match m1 with
  [ Sup (id1,cid1,word1,rt1,_,_,_,viBakwiH1,_,rel,relata_pos_id,relata_pos_cid) 
  | Kqw (id1,cid1,word1,_,_,_,_,_,_,_,rt1,_,_,viBakwiH1,_,rel,relata_pos_id,relata_pos_cid) ->
      match viBakwiH1 with
      [ 2 -> match m2 with
             [ Wif (id2,cid2,_,rt2,_,_,_,sanAxiH2,_,_,_,_,_,_,_,_,_)->
               if rt2="aBi_kruX1" 
               then  [ Relation (id1,cid1,"viBakwiH","2","2para","3.1")]
               else if rt2="aBi_xruh1"
               then  [ Relation (id1,cid1,"viBakwiH","2","2se","3.2")]
               else if rt2="ruh1"
               then  [ Relation (id1,cid1,"viBakwiH","2","2para","3.2")]
               else if rt2="anu_sq1"
               then  [ Relation (id1,cid1,"viBakwiH","2","2kA","3.2")]
               else if rt2="aBi_ni_viS1" || rt1="upa_vas1" || rt1="aXi_sWA1"
               then  [ Relation (id1,cid1,"viBakwiH","2","2meM","3.2")]
               else if rt2="aXi_SI1" || rt1="aXi_As1"
               then  [ Relation (id1,cid1,"viBakwiH","2","2para","3.2")]
               else if rt2="xiv1"
               then  [ Relation (id1,cid1,"viBakwiH","2","2se","3.2")]
               else if rel="kriyAviSeRaNam"
               then [ Relation (id1,cid1,"viBakwiH",string_of_int viBakwiH1,"0","3.3")]
               else if rel="gONakarma" && id2=relata_pos_id && cid2 = relata_pos_cid
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
               |"muR1" -> [ Relation (id1,cid1,"viBakwiH",string_of_int viBakwiH1,"se","3.3") ]
               | _ -> []
               ]
               else if rel="xeSAXikaraNam" 
               then match word1 with
               [ "aBiwaH" | "aByASA" | "aByASaH" | "aByASam" | "aByASAw" |
                 "aByASe" | "aByASena" | "agrawaH" | "anwaH" | "anwarA" |
                 "anwikam" | "anwikAn" | "anwikAw" | "anwike" | "anwikena" |
                 "ArAw" | "avAc" | "avAcI" | "avaH" | "avaraswAw" | "avarawaH" |
                 "avaswAw" | "aXaH" | "aXarAw" | "aXareNa" | "aXaswAw" |
                 "aXoXaH" | "aXoZXaH" | "aXyaXi" | "bahiH" | "nikaRA" |
                 "nikatam" | "nikatAw" | "nikate" | "nikatena" | "paraswAw" |
                 "parawaH" | "pariwaH" | "paScAw" | "paScimA" | "paScimam" |
                 "paScimAn" | "pqRTawaH" | "prAcI" | "prAFca" | "prAk" |
                 "prawIcI" | "prawyaFca" | "prawyak" | "puraH" | "puraswAw" |
                 "purawaH" | "pUrvA" | "pUrvaH" | "pUrvam" | "pUrvAn" |
                 "samakRam" | "samayA" | "samIpam" | "samIpAw" | "samIpe" |
                 "samIpena" | "sarvawaH" | "uBayawaH" | "upari" | "upariRtAw" |
                 "uparyupari" | "uwwarA" | "uwwarAhi" | "uwwaram" | "uwwarAn" |
                 "uwwarAw" | "uwwarawaH" | "uwware" | "uwwareNa" | "uxac" |
                 "uxak" | "uxIcI" | "viprakqRtA" | "viprakqRtam" |
                 "viprakqRtAw" | "viprakqRte" | "viprakqRtena" | "xakRiNA" |
                 "xakRiNAhi" | "xakRiNam" | "xakRiNAn" | "xakRiNAw" |
                 "xakRiNawaH" | "xakRiNe" | "xakRiNena" | "xUrA" | "xUram" |
                 "xUrAw" | "xUre" | "xUreNa"  ->
               [ Relation (id1,cid1,"viBakwiH",string_of_int viBakwiH1,"0","3.4")]
               | _ -> []
               ]
               else [] 
             | _ -> [] 
             ]
      | 3 -> match m2 with
             [ Wif (id2,cid2,_,rt2,_,_,_,sanAxiH2,_,_,_,_,_,_,_,_,_)->
               if rt2="sam_jFA2" 
               then  [ Relation (id1,cid1,"viBakwiH","3","2","3.5")]
               else if rt2="sam_gam1"
               then  [ Relation (id1,cid1,"viBakwiH","3","3u","3.6")]
               else if rel="karwA"
               then  [ Relation (id1,cid1,"viBakwiH","3","3xvArA","3.7")]
               else [] 
             | _ -> [] 
             ]
      | 4 -> match m2 with
             [ Wif (id2,cid2,_,rt2,_,_,_,sanAxiH2,_,_,_,_,_,_,_,_,_)->
               if rt2="kruX1" 
               then  [ Relation (id1,cid1,"viBakwiH","4","4para","3.8")]
               else if rt2="xruh1" || rt1="IrRy1" || rt1="apa_rAX1"
               then  [ Relation (id1,cid1,"viBakwiH","4","4se","3.9")]
               else if rt2="asUya1"
               then  [ Relation (id1,cid1,"viBakwiH","4","4meM","3.10")]
               else if rt2="SlAG1"
               then  [ Relation (id1,cid1,"viBakwiH","4","4kI","3.11")]
               else if rt2="hnu1"
               then  [ Relation (id1,cid1,"viBakwiH","4","4ko","3.12")]
               else if rt2="sWA1" || rt1="Sap1"
               then  [ Relation (id1,cid1,"viBakwiH","4","4ke_liye","3.13")]
               else if rel="prayojanam"
               then  [ Relation (id1,cid1,"viBakwiH","4","4ke_liye","3.14")]
               else [] 
             | _ -> [] 
             ]
      | 6 -> match m2 with
             [ Wif (id2,cid2,_,rt2,_,_,_,sanAxiH2,_,_,_,_,_,_,_,_,_)->
               if rt2="xiv1" 
               then  [ Relation (id1,cid1,"viBakwiH","6","20","3.15")]
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
  [ Sup (id1,cid1,word1,rt1,_,_,lifga1,viBakwiH1,vacanam1,_,_,_) ->
      if rt1="rAjan" || rt1="nAma" then
        match m2 with
        [ Sup (id2,cid2,word2,rt2,_,_,lifga2,viBakwiH2,vacanam2,_,_,_) ->
          if (    (id2 = next id1  && rt1="rAjan") 
               || (id2 = previous id1 && rt1="nAma"))
            && viBakwiH1=viBakwiH2 && lifga1=lifga2 && viBakwiH1=viBakwiH2 
          then [ Relation (id2,cid2,"rt",rt2,rt2^"1","4.1")]
          else []
        | _ -> []
        ]
      else []
  | _ -> []
  ]
;

value disambiguate_kim m1 = match m1 with
  [ Sup (id1,cid1,word1,rt1,_,_,lifga1,viBakwiH1,vacanam1,_,_,_) ->
      if rt1="kim" && lifga1="napuM" && (viBakwiH1=1 || viBakwiH1=2)
      then [ Relation (id1,cid1,"rt",rt1,rt1^"_1","5.1")
           ; Relation (id1,cid1,"viBakwiH",string_of_int viBakwiH1,"0","5.2")
           ]
      else []
  | Avy (id1,cid1,_,rt1,_,_,rel_nm,_,_) -> 
           if rt1="kim" 
           then if rel_nm = "prayojanam"
           then [ Relation (id1,cid1,"rt",rt1,rt1^"_2","5.3")]
           else if rel_nm = "sambanXaH"
                then [ Relation (id1,cid1,"rt",rt1,rt1^"_1","5.4")]
                else []
           else []
  | _ -> []
  ]
;

value disambiguate_nAma m1 m2 m3 = match m1 with
  [ Avy (id1,cid1,_,rt1,_,_,_,_,_) -> 
    if rt1="nAma" then
       match m2 with
       [ Sup (id2,cid2,word2,rt2,_,_,lifga2,viBakwiH2,vacanam2,_,_,_) ->
         match m3 with
         [ Sup (id3,cid3,word3,rt3,_,_,lifga3,viBakwiH3,vacanam3,_,_,_) -> 
	   if lifga2 = lifga3 && viBakwiH2 = viBakwiH3 && vacanam2 = vacanam3 
           then [ Relation (id1,cid1,"rt",rt1,rt1^"_1","6.1")
                ; Relation (id1,cid1,"viBakwiH",string_of_int viBakwiH2,"0","6.2")
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
  [ Avy (id1,cid1,word1,rt1,_,_,relation1,_,_) ->
      if (rt1="api" || rt1="param" || rt1="purA") && id1=1
      then [ Relation (id1,cid1,"rt",rt1,rt1^"1","7.1")]
      else if rt1="param" && id1=1
      then [ Relation (id1,cid1,"rt",rt1,rt1^"1","7.2")]
      else if rt1="ca" && relation1="sambanXaH"
      then [ Relation (id1,cid1,"rt",rt1,rt1^"1","7.3")]
      else if rt1="ca" && relation1="samuccaya_xyowakaH"
      then [ Relation (id1,cid1,"rt",rt1,rt1^"2","7.4")]
      else if rt1="ca" && relation1="sup_samuccaya_xyowakaH"
      then [ Relation (id1,cid1,"rt",rt1,rt1^"2","7.5")]
      else []
  | _ -> []
  ]
;

value disambiguate_wawra m1 m2 = match m1 with
  [ Avy (id1,cid1,word1,rt1,_,_,_,_,_) ->
      if rt1="wawra" 
      then match m2 with
        [ Avy (id2,cid2,word2,rt2,_,_,_,_,_) ->
           if rt2="yawra"  && id1 = next id2 
           then [ Relation (id2,cid2,"rt",rt2,rt2^"1","8.1")]
           else []
        | _ -> []
        ]
      else []
  | _ -> []
  ]
;

value disambiguate_iwi m1 m2 = match m1 with
  [ Avy (id1,cid1,word1,rt1,_,_,_,_,_) ->
      if rt1="iwi" 
      then match m2 with
         [ Sup (id2,cid2,word2,rt2,_,_,_,_,_,_,_,_) ->
           if rt2="aBiXAna"  && id2 = next id1 
           then [ Relation (id2,cid2,"rt",rt2,rt2^"1","9.1")
                ; Relation (id1,cid1,"rt",rt1,rt1^"1","9.2")
                ]
           else []
         | _ -> []
         ]
       else []
  | _ -> []
  ]
;

value upapaxa m1 m2= match m1 with
     [ Sup (id1,cid1,_,rt1,_,_,_,viBakwiH1,_,_,_,_) ->
        match m2 with
        [ Avy (id2,cid2,_,rt2,_,_,_,_,_)
        | Sup (id2,cid2,_,rt2,_,_,_,_,_,_,_,_) -> 
            let hn_vb = get_hn_vib rt2 (string_of_int viBakwiH1) in
            if id2 = next id1 && not (hn_vb="") 
            then [ Relation (id1,cid1,"viBakwiH",string_of_int viBakwiH1,hn_vb,"10.1")]
            else []
        | _ -> []
        ]
     | _ -> []
     ]
;

value disambiguate_wumun m1 m2 = match m1 with
  [ Avykqw (id1,cid1,word1,_,_,_,_,_,kqw_prawyayaH1,_,_,rel1,relata_pos_id,relata_pos_cid) ->
          if kqw_prawyayaH1 ="wumun"
               then match m2 with
               [ Wif (id2,cid2,_,rt2,_,_,upasarga2,sanAxiH2,_,_,_,_,_,_,rel2,_,_)->
                        if rel1="wumunkarma" then
                  match rt2 with
                  [ "Sak3" 
                  | "arh1"
                  | "Gat1" -> 
                        [ Relation (id1,cid1,"kqw_prawyayaH",kqw_prawyayaH1,"wumun0","10.2")]
                  | "raB1" -> if upasarga2 = "Af" 
                       then [ Relation (id1,cid1,"kqw_prawyayaH",kqw_prawyayaH1,"wumun_nA","10.3")]
		       else []
                  | "jFA1" -> [ Relation (id1,cid1,"kqw_prawyayaH",kqw_prawyayaH1,"wumun_nA","10.4")]
                  | "kram1" -> if upasarga2 = "pra"
                       then [ Relation (id1,cid1,"kqw_prawyayaH",kqw_prawyayaH1,"wumun_nA","10.5")]
		       else []
                  | _ ->  []
                  ]
                  else []
               | _ -> []
               ]
               else []
  | _ -> []
  ]
;

value handle_lvc m1 m2 = match m1 with
     [ Sup (id1,cid1,_,rt1,_,_,_,viBakwiH1,_,rel,relata_pos_id,relata_pos_cid) ->
          if rel="karma" || rel = "gONakarma" || rel="muKyakarma" || rel="karmasamAnAXikaraNam" 
          then match m2 with
          [ Wif (id2,cid2,_,rt2,_,_,upasarga2,sanAxiH2,_,_,_,_,_,_,_,_,_)->
                if (id2=relata_pos_id) && (cid2 = relata_pos_cid) then 
                  if rt2 = "kq3" && member_of rt1 amuurwa
                  then [ Relation (id2,cid2,"rt",rt2,"kara","11.2")]
                  else if rt2 = "kq3" && member_of rt1 muurwa
                  then [ Relation (id2,cid2,"rt",rt2,"banA","11.2")]
                  else if rt2 = "NI1" && member_of rt1 kaalavaaci
                  then [ Relation (id2,cid2,"rt",rt2,"bIwA","11.2")]
                  else if rt2 = "gam1" && sanAxiH2 = "Nic" && member_of rt1 kaalavaaci
                  then [ Relation (id2,cid2,"rt",rt2,"bIwA","11.2")]
		  else let hn_lvc = get_hn_lvc rt1 rt2 in
                  if (hn_lvc="") then []
                  else
                     [ Relation (id1,cid1,"rt",rt1,"-","11.1")
                     ; Relation (id2,cid2,"rt",rt2,hn_lvc,"11.2")
                     ]
                else []
          | _ -> []
          ]
          else []
     | _ -> []
     ]
;

(* To Disambiguate the final kwa and kwavawu
 * kwa/kwavawu = yA_huA in Hindi, but kwa final is yA
 * *)
value disambiguate_final_kqw m1 = match m1 with
  [ Kqw (id1,cid1,word1,_,_,_,_,_,kqw_prawyayaH,_,rt1,_,_,_,_,rel,_,_) ->
      if rel="X"  && kqw_prawyayaH = "kwa" then
        [ Relation (id1,cid1,"kqw_prawyayaH",kqw_prawyayaH,"kwa_fin","1.1") ]
        else if rel="X"  && kqw_prawyayaH = "kwavawu" then
        [ Relation (id1,cid1,"kqw_prawyayaH",kqw_prawyayaH,"kwavawu_fin","1.1") ]
      else []
  | _ -> []
  ]
;

(* To Disambiguate the Sawq - varwamAnasamAnakAlaH / viSeRaNam
 *  Sawq = wA_huA in Hindi if viSeRaNam, if adv it is we_hue
 *)
value disambiguate_final_kqw m1 = match m1 with
  [ Kqw (id1,cid1,word1,_,_,_,_,_,kqw_prawyayaH,_,rt1,_,_,_,_,rel,_,_) ->
      if rel="varwamAnasamAnakAlaH"  && kqw_prawyayaH = "Sawq_lat" then
        [ Relation (id1,cid1,"kqw_prawyayaH",kqw_prawyayaH,"Sawq_lat_adv","1.1") ]
      else []
  | _ -> []
  ]
;

value all_rules3 =
[ disambiguate_nAma ]
;

value all_rules2 = 
[
        disambiguate_viBakwiH; disambiguate_wawra; disambiguate_iwi; upapaxa; mark_name; disambiguate_wumun; handle_lvc
]
;

value all_rules1 = 
[
        disambiguate_avys; disambiguate_kim; remove_viSeRaNa_viBakwiH; disambiguate_final_kqw; change_nirXAraNa_viBakwiH
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
           ; print_string "Usage: ./wsd\n\n"
           ; failwith "Parsing aborted\n"
           } 
        else *)
            let morphs = analyse (Stream.of_channel stdin) in
            process morphs
;
main()
;
