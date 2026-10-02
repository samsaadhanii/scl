open Pada_structure;
open Common;
open Adata;
open AXikaraNa;
open NirXAraNa;

(* aSvaH vegena XAvawi.*)
(* ;rAmaH brAhmaNavaw aXIwe *)
value rlAvy_kriyAviSeRaNam_or_aXikaraNam m1 m2 text_type = match m2 with
  [ Wif (id2,cid2,mid2,word2,_,pUrvapaxa2,uwwarapaxa2,_,_,_,_,_,_,_,_,_) 
  | Avykqw (id2,cid2,mid2,word2,_,pUrvapaxa2,uwwarapaxa2,_,_,_,_,_) -> 
     if  pUrvapaxa2="y" || uwwarapaxa2="y" then []
     else if word2 = "AraBya" then []  (* wawA eva ... AraBya .. paryanwam ....Bavew *)
     else match m1 with
     [ Avykqw (id1,cid1,mid1,word1,_,_,uwwarapaxa1,_,_,_,_,_)
     | Avy (id1,cid1,mid1,word1,_,_,uwwarapaxa1,_) -> 
       if prose_order id1 id2 text_type 
       then if (word1="svar") && (word2="gawaH")  (* fixed for svar gawaH ca saH - from Sankshepa RamayaNam *)
            then let  d12 = if id1 > id2 then id1-id2 else id2-id1 in
                 [ Relation (id1,cid1,mid1,"gawikarma",id2,cid2,mid2,"7.1a",d12)]
             (* In case of BavalakRaNa sapwamI, the kriyAviSeRaNa should be to the left of the kqw *)
            else kv_or_spl_aXi id1 cid1 mid1 id2 cid2 mid2 word1 text_type
       else []
     | AvywaxXiwa (id1,cid1,mid1,word1,_,_,uwwarapaxa1,taddhita1,_) -> 
       let  d12 = if id1 > id2 then id1-id2 else id2-id1 in
       if prose_order id1 id2 text_type && taddhita1="vaw" 
       then [ Relation (id1,cid1,mid1,"kri_vi",id2,cid2,mid2,"7.1",d12)]
       else kv_or_spl_aXi id1 cid1 mid1 id2 cid2 mid2 word1  text_type
     (* | Sup (id1,cid1,mid1,word1,_,_,uwwarapaxa1,_,_,_,_)->
       if  prose_order id1 id2 text_type 
       then kv_or_spl_aXi id1 cid1 mid1 id2 cid2 mid2 word1 text_type
       else [] 
    This is covered under anaBihiwe 3.20 *)
     |_ -> []
     ]
  | Kqw (id2,cid2,mid2,word2,_,_,_,kqw_prawyaya2,_,_,pUrvapaxa2,uwwarapaxa2,_,_,viBakwiH2,_,_)   ->
     if  pUrvapaxa2="y" || uwwarapaxa2="y" then []
     else if kqw_prawyaya2 ="kwa" || kqw_prawyaya2 ="kwavawu" || kqw_prawyaya2 = "yaw" || kqw_prawyaya2 = "lyut" || kqw_prawyaya2 = "wavyaw" || kqw_prawyaya2 = "anIyar"
    (* kaWam waw jFeyam ? *)
     then match m1 with
     [ Avykqw (id1,cid1,mid1,word1,_,_,uwwarapaxa1,_,_,_,_,_)
     | Avy (id1,cid1,mid1,word1,_,_,uwwarapaxa1,_) -> 
       if prose_order id1 id2 text_type 
       then if (viBakwiH2 = 7) && ( id1 > id2) then [] 
            else if (word1="svar") && (word2="gawaH")  (* fixed for svar gawaH ca saH - from Sankshepa RamayaNam *)
            then let  d12 = if id1 > id2 then id1-id2 else id2-id1 in
                 [ Relation (id1,cid1,mid1,"gawikarma",id2,cid2,mid2,"7.1a",d12)]
             (* In case of BavalakRaNa sapwamI, the kriyAviSeRaNa should be to the left of the kqw *)
            else kv_or_spl_aXi id1 cid1 mid1 id2 cid2 mid2 word1 text_type
       else []
     | AvywaxXiwa (id1,cid1,mid1,word1,_,_,uwwarapaxa1,taddhita1,_) -> 
       let  d12 = if id1 > id2 then id1-id2 else id2-id1 in
       if prose_order id1 id2 text_type && taddhita1="vaw" 
       then [ Relation (id1,cid1,mid1,"kri_vi",id2,cid2,mid2,"7.2",d12)]
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
  [ Wif (id2,cid2,mid2,_,_,_,_,_,_,_,_,_,_,_,_,_) 
  | Kqw (id2,cid2,mid2,_,_,_,_,_,_,_,_,_,_,_,_,_,_)  
  | Avykqw (id2,cid2,mid2,_,_,_,_,_,_,_,_,_) -> 
     match m1 with
     [ WaxXiwa (id1,cid1,mid1,word1,_,_,uwwarapaxa1,_,_,viBakwiH1,_,_) 
     | Kqw (id1,cid1,mid1,word1,_,_,_,_,_,_,_,_,uwwarapaxa1,_,viBakwiH1,_,_)
     | Sup (id1,cid1,mid1,word1,_,_,uwwarapaxa1,_,viBakwiH1,_,_) -> 
       let  d12 = if id1 > id2 then id1-id2 else id2-id1 in
            if (member_of (word1^" "^string_of_int viBakwiH1) kriyAviSeRaNas) (* yogyawA *) (*&& lifgam1="napuM"*)
            then [ Relation (id1,cid1,mid1,"kri_vi",id2,cid2,mid2,"8.1",d12)] (* vegena XAvawi *)  (* yogyawA *)
            else []
     | _ -> []
     ]
  | _ -> []
  ]
;

value nirXAraNam id1 cid1 mid1 id2 cid2 mid2 vacanam2 viBakwiH2 text_type rl1 =
       let  d12 = if id1 > id2 then id1-id2 else id2-id1 in
           if  ((id1=previous id2 && text_type = "Prose") || text_type = "Sloka")
               (* && vacanam2="eka" -- asmAkam viSiRtAH ye wAn niboXa xvija-uwwama *) (* && not(viBakwiH2=8) -- xehaBUwAm vara *)
           then [ Relation (id1,cid1,mid1,"nirXA",id2,cid2,mid2,rl1,d12)]
           else []
;

value rlnirXAraNam m1 m2 text_type = match m1 with
      [ Sup (id1,cid1,mid1,_,rt1,_,_,lifgam1,viBakwiH1,vacanam1,_)
      | Kqw (id1,cid1,mid1,_,_,_,_,_,_,_,rt1,_,_,lifgam1,viBakwiH1,vacanam1,_)
      | WaxXiwa (id1,cid1,mid1,_,rt1,_,_,_,lifgam1,viBakwiH1,vacanam1,_) ->
               (* nqRu xvijaH SreRTaH Bavawi *)
           if     (viBakwiH1=6 || viBakwiH1=7)  
               && (vacanam1="xvi" || vacanam1="bahu")
           then match m2 with
             (* && (member_of rt2 guNavAcI || member_of rt2 sambanXavAcI) *)  (* yogyawA *)
             (* It is necessary to check  ((is_jAwi rt1) || (is_guNa rt1) || (is_kriyA rt1)); 
                jAwi-guNa-kriyABiH samuxAyAw ekasya pqWak-karaNam nirXAraNam  Under A 2.2.10 in kASikA *)
        [ Sup (id2,cid2,mid2,_,rt2,_,_,lifgam2,viBakwiH2,vacanam2,_)
        | Kqw (id2,cid2,mid2,_,_,_,_,_,_,_,rt2,_,_,lifgam2,viBakwiH2,vacanam2,_) ->
           if  ((rt2 = (get_assoc rt1 nirXAraNa_list)) 
                 || ((rt2 = "kiFciw" || rt2="vara" || rt2="SreRTa" || rt2="uwwama" || rt2 = "uwwamA" || rt2 = "SreRTA" || rt2="praXAna" || rt2 = "praXAnA" (* || rt2="maXya" -- How can maXye be nirXAraNa? *)
                     || member_of (rt1^" "^rt2) amarakosha_jAwi
                     || member_of rt2 sambanXavAcI)  (* yogyawA *)
                    && ((lifgam1=lifgam2) || lifgam1 = "a")))
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

(* vqkRAw vqkRam kUxawi  -- apAxAnam_vIpsA *)
(* vanena vanam gacCawi -- karaNam_vIpsA *)
value supAxi_vIpsa id1 cid1 mid1 id2 cid2 mid2 word1 word2 vac1 vac2 gen1 gen2 vib1 vib2 rlid =
   let d = if id1 > id2 then id1-id2 else id2-id1 in
   if  word1=word2 && noun_agreement_vibh vac1 vac2 gen1 gen2 vib1 vib2
   then [ Relation (id1,cid1,mid1,"vIpsA",id2,cid2,mid2,rlid,d)]
   else if  vib1 = 5 && vib2 = 2
        then [ Relation (id1,cid1,mid1,"apA_vIpsA",id2,cid2,mid2,rlid,d)]
        else if vib1 = 3 && vib2 = 2
             then [ Relation (id1,cid1,mid1,"karaNa_vIpsA",id2,cid2,mid2,rlid,d)]
             else []
;

value rlvIpsA m1 m2 text_type = match m2 with
  [ Sup (id2,cid2,mid2,word2,rt2,_,uwwarapaxa2,lifgam2,viBakwiH2,vacanam2,_) 
  | Kqw (id2,cid2,mid2,word2,_,_,_,_,_,_,rt2,_,uwwarapaxa2,lifgam2,viBakwiH2,vacanam2,_) 
  | WaxXiwa (id2,cid2,mid2,word2,rt2,_,_,uwwarapaxa2,lifgam2,viBakwiH2,vacanam2,_) ->
     match m1 with
     [ Sup (id1,cid1,mid1,word1,rt1,_,uwwarapaxa1,lifgam1,viBakwiH1,vacanam1,_) 
     | Kqw (id1,cid1,mid1,word1,_,_,_,_,_,_,rt1,_,uwwarapaxa1,lifgam1,viBakwiH1,vacanam1,_)
     | WaxXiwa (id1,cid1,mid1,word1,rt1,_,_,uwwarapaxa1,lifgam1,viBakwiH1,vacanam1,_) ->
        let cat1 = get_cat m1
        and cat2 = get_cat m2 in
        if cat1 = cat2 && not (uwwarapaxa1 = "y") && not (uwwarapaxa2 = "y") && rt1 = rt2 && id1 = previous id2
        then supAxi_vIpsa id1 cid1 mid1 id2 cid2 mid2 word1 word2 vacanam1 vacanam2 lifgam1 lifgam2 viBakwiH1 viBakwiH2 "21.1"
        else []
     | _ -> []
     ]
  | Avy (id2,cid2,mid2,word2,_,_,uwwarapaxa2,_) ->  match m1 with
     [ Avy (id1,cid1,mid1,word1,_,_,uwwarapaxa1,_) ->
        let d = if id1 > id2 then id1-id2 else id2-id1 in
        if not (uwwarapaxa1 = "y") && not (uwwarapaxa2 = "y") && word1 = word2 && id1 = previous id2
        then [ Relation (id1,cid1,mid1,"vIpsA",id2,cid2,mid2,"21.2",d)]
        else []
     | _ -> []
     ]
  | _ -> []
  ]
  ;


(* Special rules for specific words *)


(* praBqwi should be connected to the verb by avaXi_prAramBa, and wawaH will be the sanxarBa-binxuH
saH wawaH praBqwi na AgacCawi
saH wawaH param prawixinam pATam paTawi *)

value rl_avaXi3 m1 m2 m3 text_type = match m3 with
  [ Wif (id3,cid3,mid3,_,_,_,_,_,_,_,_,_,_,_,_,_) 
  | Kqw (id3,cid3,mid3,_,_,_,_,_,_,_,_,_,_,_,_,_,_)  
  | Avykqw (id3,cid3,mid3,_,_,_,_,_,_,_,_,_) ->  match m2 with
     [ Avy (id2,cid2,mid2,word2,_,_,_,_) 
     | Sup (id2,cid2,mid2,word2,_,_,_,_,_,_,_) -> match m1 with
        [ Avy (id1,cid1,mid1,word1,_,_,_,_)
        | Sup (id1,cid1,mid1,word1,_,_,_,_,_,_,_) -> 
          let     d12 = if id1 > id2 then id1-id2 else id2-id1
             and  d23 = if id2 > id3 then id2-id3 else id3-id2 in
          match word1 with
          [ "praBqwi" 
          | "AraBya" 
          | "param"   -> if  (id1 = next id2) 
                         then [ Relation (id1,cid1,mid1,"sanxarBa",id2,cid2,mid2,"36.1a",d12)
                              ; Relation (id2,cid2,mid2,"avaXi_Axi",id3,cid3,mid3,"36.1a",d23)]
                         else []
          | "paryanwam"  -> if  (id1 = next id2) 
                         then [ Relation (id1,cid1,mid1,"sanxarBa",id2,cid2,mid2,"36.1b",d12)
                              ; Relation (id2,cid2,mid2,"avaXi_anwa",id3,cid3,mid3,"36.1b",d23)]
                         else []
          | _ -> []
          ]
        | _ -> []
        ] 
     | _ -> []
     ]
  | _ -> []
  ]
  ;

value rl_avaXi2 m1 m2 text_type = match m2 with
  [ Wif (id2,cid2,mid2,_,_,_,_,_,_,_,_,_,_,_,_,_) 
  | Kqw (id2,cid2,mid2,_,_,_,_,_,_,_,_,_,_,_,_,_,_)  -> match m1 with
        [ Avy (id1,cid1,mid1,_,rt1,_,_,_) -> 
          let     d12 = if id1 > id2 then id1-id2 else id2-id1 in
          match rt1 with
          [ "praBqwi" 
          | "param"     -> [ Relation (id1,cid1,mid1,"avaXi_Axi",id2,cid2,mid2,"36.1a",d12)]
          | _ -> []
          ]
        | Sup (id1,cid1,mid1,_,rt1,_,_,_,_,_,_) -> 
          let     d12 = if id1 > id2 then id1-id2 else id2-id1 in
          match rt1 with
          [ "paryanwa"  -> [ Relation (id1,cid1,mid1,"avaXi_anwa",id2,cid2,mid2,"36.1b",d12)]
          | _ -> []
          ]
        | Avykqw (id1,cid1,mid1,word1,_,_,_,_,_,_,_,_) -> 
          let     d12 = if id1 > id2 then id1-id2 else id2-id1 in
          match word1 with
          [ "AraBya"     -> [ Relation (id1,cid1,mid1,"avaXi_Axi",id2,cid2,mid2,"36.1c",d12)]
          | _ -> []
          ]
        | _ -> []
        ]
  | _ -> []
  ]
;
