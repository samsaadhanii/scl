(* Akanksha *)
open Aaxikarma_dhaatu;
open Shlish_aadi; 
open Shakaadi; 


open GawyarWa_dhaatu;
open BuxXyarWa_dhaatu;
open PrawyavasAnArWa_dhaatu;
open Sabxakarma_dhaatu; 
open Akarmaka_dhaatu;
open Sakarmaka_dhaatu;

open KaraNa_dhaatu;
open SampraxAna_dhaatu;
open ApAxAna_dhaatu;
open VAkyakarma_dhaatu;
open Xvikarmaka1_dhaatu;
open Xvikarmaka2_dhaatu;

open KAlAXikaraNa;
open XeSAXikaraNa;
open ViRayAXikaraNa;
open ViRayi;
open AmarakoSa_jAwi;

open KarwqsamAnAXikaraNa_dhaatu;
open KarmasamAnAXikaraNa_dhaatu;

open Kqxanwa;
open Bhaava_kqw; 
open SamboXana_sUcaka;


(* Yogyata *)
open Intensifiers;

open SabxavAci; 
open BuxXivAci;
open JAwivAcaka;

open Avy_viSeRaNam;

open XravyavAcI;
open GuNavacana;
open GuNa_not_guNavacana;

open KAlAXva;
open KriyAviSeRaNa;

open Animate;
open ManuRyaparyAya;
open ManuRyasaFjFAvAcI;
open Named_entity;
open Sambandhavaaci;
open UpAXi;

open Non_RaRTI;
open Non_neuter_kartaa_dhaatu;

open PUraNa;
open SaMKyeya;

open Upapada6;
open WaxXiwAnwa;


(* Compounds *)

open SafKyA_vAcI;
open KAla_vAcI;
open CawuRpAxa_jAwi_vAcI;
open VarNavAcI;
open VyAGrAxi;
open WaxXiwAnwa_safKyA_vAcI;
open WaxXiwAnwa_xik_vAcI;
open Xik_vAcI;
open NaxI_vAcI;
open AmUrwa;



(* various required functions *)

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
      populate_from trie list
;

(* Building Tries for easy access *)
value kAlAXikaraNas = build_trie kAlAXikaraNa_list ;

value kriyAviSeRaNas = build_trie kriyAviSeRaNa_list ;

value karaNa_verbs = build_trie karaNa_XAwu_list ;

value sampraxAna_verbs = build_trie sampraxAna_XAwu_list ;

value animate_nouns = build_trie animate_list ;

value apAxAna_verbs = build_trie apAxAna_XAwu_list ;

value xeSAXikaraNas = build_trie xeSAXikaraNa_list ;

value kAlAXvas = build_trie kAlAXva_list ;

value sakarmaka_verbs =  build_trie sakarmaka_XAwu_list ;

value xvikarmaka1 = build_trie xvikarmaka_XAwu_list1 ;

value xvikarmaka2 = build_trie xvikarmaka_XAwu_list2 ;

value aaxikarma_verbs =  build_trie aaxikarma_XAwu_list ;

 (* In gawyarWaka, buxXi, prawyavasAnArWa and shabxakarma, only sakarmaka dhaatus are considered: see extract.sh programme for details *)
value gawyarWa_verbs = build_trie gawyarWa_XAwu_list ;

value buxXyarWa_verbs = build_trie buxXyarWa_XAwu_list ;

value shabxakarma_verbs = build_trie shabdakarma_dhaatu_list ;

value prawyavasAnArWa_verbs = build_trie prawyavasAnArWa_XAwu_list ;

value shliR_Axi_verbs = build_trie shlish_aadi_list ;

value akarmaka_verbs = build_trie akarmaka_XAwu_list ;

value vAkyakarma_verbs = build_trie vAkyakarma_XAwu_list ;

  (* Ocaml does not allow variables starting with Caps. Hence SakAxi -> shakAxi *)
value shakAxi = build_trie shakaadi_list ;

value karwqsamAnAXikaraNa_verbs = build_trie karwqsamAnAXikaraNa_XAwu_list ;

value karmasamAnAXikaraNa_verbs = build_trie karmasamAnAXikaraNa_XAwu_list ;

value buxXivAci_nouns = build_trie buxXivAci_list ;

value shabxavAci_nouns = build_trie shabdavaaci_list ;

value bhaavavaaci_kqw = build_trie bhaava_kqw_list ;

value samboXana_sUcaka = build_trie samboXana_sUcaka_list ;

value avy_viSeRaNam_list = build_trie avy_viSeRaNam_list ;

value intensifiers_list = build_trie intensifiers_list ;

value viRayAXikaraNa_nouns = build_trie viRayAXikaraNa_list ;

value saMKyeya = build_trie saMKyeya_list ;

value pUraNa = build_trie pUraNa_list ;

value guNavacana = build_trie guNavacana_list ;

value jAwivAcaka = build_trie jAwivAcaka_list ;

value guNa_not_guNavacana = build_trie guNa_not_guNavacana_list ;

 (* kqxanwa list is introduced, since we still do not have an exhastive kqxanwa analyser ; we need it for viSeRaNas and RaRTI sambanXa*)
value kqxanwas = build_trie kqxanwa_list ;

 (* waxXiwAnwa_list is introduced, since we still do not have an exhastive waxXXiwa analyser ; we need it for viSeRaNas *)
value taddhitaantas = build_trie waxXiwAnwa_list ;

value sambanXavAcI = build_trie sambanXavAci_list ;

value xravyavAcI = build_trie xravyavAci_list ;

value manuRyaparyAya = build_trie manuRyaparyAya ;

value manuRyasaFjFAvAcI = build_trie manuRyasaFjFAvAci ;

value upAXi = build_trie upAXi_list ;

value viRayi_list = build_trie viRayi_list ;

value non_RaRTI_list = build_trie non_RaRTI_list ;

value named_entity = build_trie named_entity_list ;

value upapada6_list = build_trie upapada6_list ;

value non_neuter_kartaa_dhaatu_list = build_trie non_neuter_kartaa_dhaatu_list ;

value amarakosha_jAwi = build_trie amarakoSa_jAwi_list ;


(*compounds *) 
value safKyA_vAcI = build_trie safKyA_vAcI_list ;

value waxXiwAnwa_safKyA_vAcI = build_trie waxXiwAnwa_safKyA_vAcI_list ;

value waxXiwAnwa_xik_vAcI = build_trie waxXiwAnwa_xik_vAcI_list ;

value xik_vAcI = build_trie xik_vAcI_list ;

value kAla_vAcI = build_trie kAla_vAcI_list ;

value cawuRpAxa_jAwi_vAcI = build_trie cawuRpAxa_jAwi_vAcI_list ;

value varNa_vAcI = build_trie varNavAcI_list ;

value vyAGrAxi = build_trie vyAGrAxi_list ;

value naxI_vAcI = build_trie naxI_vAcI_list ;

value amUrwa = build_trie amUrwa_list ;
