open Pada_structure;
open Common;
open Adata;

value sawq_sanac_kqw m1 =
     match m1 with
     [ Kqw (id1,cid1,mid1,word1,_,_,_,kqw_prawyayaH1,_,_,rt1,pUrvapaxa1,uwwarapaxa1,lifgam1,viBakwiH1,vacanam1,_) ->
           if  ((kqw_prawyayaH1 = "Sawq_lat")
            ||  (kqw_prawyayaH1 = "Sawq_lqt")
            ||  (kqw_prawyayaH1 = "SAnac_lat")
            ||  (kqw_prawyayaH1 = "SAnac_lqt")) 
           then True
           else False
     | _ -> False
     ]
;

(* value sp_uwwarapaxa rt word lifgam =
       if (rt="pUrvaka" && lifgam="napuM")
         || rt="arWa" 
         || rt="ananwaram" 
         || rt="saxqSa" 
         || rt="safkASa" 
         || rt="safkASa" 
         || word="-sahiwaH" 
         || word="-pUrveNa" 
       then True else False
;  Already present in common.ml *)

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
IIc       D.1		3	2        1(gONa)	(anaBihiwe muKya-karmaNi xviwIyA)
IId       D.2		3	2	 1(muKya)	(anaBihiwe gONa-karmaNi xviwIyA)
							##IIc       D.1		3	2        1(muKya)	(anaBihiwe gONa-karmaNi xviwIyA)
							##IId       D.2		3	2	 1(gONa)	(anaBihiwe muKya-karmaNi xviwIyA)

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
IVf	D.1      	3           3          		1(gONa) 2       (prayojya karwA is anaBihiwa; hence wqwIyA)
IVg	D.2      	3           3          		2 1(muKya)       (prayojya karwA is anaBihiwa; hence wqwIyA)

*) 


value wifkarwA_karma m1 m2 text_type = match m2 with
  [ Wif (id2,cid2,mid2,word2,rt2,_,_,upasarga2,sanAxiH2,prayogaH2,_,puruRaH2,vacanam2,_,_,_) ->
     match m1 with
     [ WaxXiwa (id1,cid1,mid1,word1,rt1,pUrvapaxa1,uwwarapaxa1,_,lifgam1,viBakwiH1,vacanam1,_)
     | Kqw (id1,cid1,mid1,word1,_,_,_,_,_,_,rt1,pUrvapaxa1,uwwarapaxa1,lifgam1,viBakwiH1,vacanam1,_)
     | Sup (id1,cid1,mid1,word1,rt1,pUrvapaxa1,uwwarapaxa1,lifgam1,viBakwiH1,vacanam1,_) -> 
       let d = if id1 > id2 then id1-id2 else id2-id1 in
       if    prose_order id1 id2 text_type
          && no_boundary_crossing1 id1 id2
          (* && d < 8   -- if this condition is there, some long sentences totally fail. *)
              (* karma and karwA cannot be far away from the verb; upto 7 is allowed, assuming that the verb will be in the same shloka; 
               *  since in some cases, the viSeRaNa is near the verb, and the viSeRya is far away e.g. SruwvA ewaw wrilokajFaH vAlmIkeH nAraxo vacaH; 
               *  vacaH is far away from SruwvA, which has ewaw next to it, the adjective of vacaH *)
       then  match viBakwiH1 with
       [ 1 ->  if aBihiwa rt1 vacanam1 vacanam2 puruRaH2
               then match prayogaH2 with
               [ "karwari" -> if uwwarapaxa1="y" &&  (*sp_uwwarapaxa rt1 word1 lifgam1 then [] *)
                                 word1="-sahiwaH" then [ Relation (id1,cid1,mid1,"sahArWa",id2,cid2,mid2,"2.1a", d)]  
			      else match sanAxiH2 with
                              [ "Nic" ->  [ Relation (id1,cid1,mid1,"prayojaka_karwA",id2,cid2,mid2,"2.1", d)]  
                                               (* aBihiwe praWamA  - xevaxawwaH:prayojakakarwA pATayawi*)
                              | _     ->  if   not (member_of rt1 intensifiers_list) 
                                            && not (member_of (word1^" "^string_of_int(viBakwiH1)) kriyAviSeRaNas)
                                          then if members_of rt2 upasarga2 karwqsamAnAXikaraNa_verbs 
                                               then if ((id2-id1 > 1) || id1=1)
                                                    then [ Relation (id1,cid1,mid1,"karwA_be_verbs",id2,cid2,mid2,"2.2", d)]  
				                    else  [ Relation (id1,cid1,mid1,"karwA",id2,cid2,mid2,"2.2a", d)]  
                                               else if members_of rt2 upasarga2 non_neuter_kartaa_dhaatu_list 
                                                    then if not (lifgam1="napuM") || (rt1="miwra") || (rt1 = "kalawra")
				                         then  [ Relation (id1,cid1,mid1,"karwA",id2,cid2,mid2,"2.2a", d)]  
				                         else []
				                    else  if not (sawq_sanac_kqw m1)  (* We decided not to mark karwA for gacCan in grAmam gacCan wqNam spqSawi *)
                                                          then [ Relation (id1,cid1,mid1,"karwA",id2,cid2,mid2,"2.2b", d)]  
				                          else []
                                          else []
                                          (* aBihiwe praWamA -xevaxawwaH:karwA paTawi*)
                             ]
           |"karmaNi" -> 
                 if uwwarapaxa1="y" && sp_uwwarapaxa rt1 word1 lifgam1 then []
                 else  match verb_type rt2 upasarga2 with
                 [ "xvikarmaka1" -> [ Relation (id1,cid1,mid1,"gONa_karma",id2,cid2,mid2,"2.3", d)]  
                         (*apraXAne xuhAxinAm.. - gOH xugXaM:gONakarma xuhyawe *)
                 | "xvikarmaka2" -> [ Relation (id1,cid1,mid1,"muKya_karma",id2,cid2,mid2,"2.4", d)]  
                         (*praXAne nIhqkqRvah  - ajA:muKyakarma grAmaM nIyawe *)
                 | _ -> 
                    match sanAxiH2 with
                    ["Nic" ->  
                           match verb_type rt2 upasarga2 with
                           [ "gawi" -> [ Relation (id1,cid1,mid1,"prayojya_karwA",id2,cid2,mid2,"2.5", d)]  
                                          (*gawibuxXi.. -> karma; aBihiwa   yajFaxawwena xevaxawwaH:prayojyakarwA  grAmaM  gamyawe *)
                           | "buxXi"
                           | "prawyavasAnArWa" 
                           | "Sabxakarma" -> 
                                   [ Relation (id1,cid1,mid1,"prayojya_karwA",id2,cid2,mid2,"2.6", d)  
                                       (*yajFaxawwena  xevaxawwaH PalaM KAxyawe *)
                                   ; Relation (id1,cid1,mid1,"karma",id2,cid2,mid2,"2.7", d) 
                                   ]
                           | "sakarmaka"  -> [ Relation (id1,cid1,mid1,"karma",id2,cid2,mid2,"2.8", d)]
                                 (* aBihiwe praWamA  -yajFaxawwena  xevaxawwena  oxanam  pAcyawe *)
                           | "akarmaka" -> [ Relation (id1,cid1,mid1,"prayojya_karwA",id2,cid2,mid2,"2.9", d)]  
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
                     | "xvikarmaka1" -> [ Relation (id1,cid1,mid1,"muKya_karma",id2,cid2,mid2,"2.11", d)
                                        ; Relation (id1,cid1,mid1,"gONa_karma",id2,cid2,mid2,"2.11a", d)
                                        ]
                                           (* karmaNi xviwIyA - yajFaxawwaH xevaxawwena rAjAnaM vasuXAM yAcayawi  *)
                     | "akarmaka" -> if uwwarapaxa1="y" && sp_uwwarapaxa rt1 word1 lifgam1 then []
				     else if puruRaH2 = "ma"
		                          then [ Relation (id1,cid1,mid1,"karma",id2,cid2,mid2,"2.12a", d)] 
                                          else [ Relation (id1,cid1,mid1,"prayojya_karwA",id2,cid2,mid2,"2.12", d)]  
				                (* In the case of 2nd peson, if it is ellipsed, there would not be prayojaka_karwA, 
                                                 *  and hence directly we call this relation as karma, 
                                                 *  For prayojya karwA, the presence of prayojaka karwA is a must. *
                                                 * gawibuxXi.. elevates prayojya_karwA to karma, hence xviwIyA *)
                     | "buxXi"
                     | "Sabxakarma"
		     | "gawi"
                     | "prawyavasAnArWa" -> if uwwarapaxa1="y" && sp_uwwarapaxa rt1 word1 lifgam1 then []
                                            else [ Relation (id1,cid1,mid1,"prayojya_karwA",id2,cid2,mid2,"2.13", d) 
                                                 ; Relation (id1,cid1,mid1,"karma",id2,cid2,mid2,"2.14", d) (* karmaNi xviwIyA *) 
                                                 ]
                     | "sakarmaka" -> (* not gawibuxXi && not prawyavasAnArWa_verbs *)
                             if uwwarapaxa1="y" && sp_uwwarapaxa rt1 word1 lifgam1 then []
			     else if rt2="hq" || rt2= "kq3"   (* hqkroranyawarasyAm 1.4.53 *)
                                  then  [ Relation (id1,cid1,mid1,"prayojya_karwA",id2,cid2,mid2,"2.13", d) 
                                        ; Relation (id1,cid1,mid1,"karma",id2,cid2,mid2,"2.14", d) (* karmaNi xviwIyA *) 
                                        ]
                                  else [Relation (id1,cid1,mid1,"karma",id2,cid2,mid2,"2.15" , d)] 
				        (* rAmaH xevaxawwena annaM pAcayawi *)
                     | _ -> []
                     ]
                | _ -> if    not (member_of (word1 ^ " " ^ string_of_int viBakwiH1) kriyAviSeRaNas) 
                          && not (member_of rt1 kAlAXvas)
                       then match verb_type rt2 upasarga2 with
                      [ "xvikarmaka1"
                      | "xvikarmaka2" -> 
				if uwwarapaxa1="y" && sp_uwwarapaxa rt1 word1 lifgam1 then []
			        else if (word2="AhuH") 
                                     then   [ Relation (id1,cid1,mid1,"muKya_karma",id2,cid2,mid2,"2.16a" , d)]
                                     else if (lifgam1="napuM") 	(*yogyawA *) (* better condition would be manuRyasaFjFAvAcI/prANivAcI *)
                                          then [ Relation (id1,cid1,mid1,"muKya_karma",id2,cid2,mid2,"2.17a" , d)]
			                  else [ Relation (id1,cid1,mid1,"gONa_karma",id2,cid2,mid2,"2.16" , d)
                                               ; Relation (id1,cid1,mid1,"muKya_karma",id2,cid2,mid2,"2.17" , d) 
                                               ]
                              (* karmaNi xviwIyA  - rAjAnaM vasuXAM yAcawe*)
                              (* karmaNi xviwIyA - gAM xogXi payaH *)
                      | "gawi"
                      | "buxXi" 
                      | "Sabxakarma" 
                      | "prawyavasAnArWa"
                      | "sakarmaka" -> if uwwarapaxa1="y" && sp_uwwarapaxa rt1 word1 lifgam1 then []
                                       else if (verb_type rt2 upasarga2 = "gawi") && (word1="kim")
				            then [] (* kim rAmaH gacCawi; here kim is not a karma of gacCawi*)
				            else if not (member_of word1 kAlAXikaraNas) && not (member_of word1 xeSAXikaraNas) 
                                                 then if not ((uwwarapaxa1="y") && (rt1 = "pUrvaka"))
                                                      then [ Relation (id1,cid1,mid1,"karma",id2,cid2,mid2,"2.19" , d)] (* karmaNi xviwIyA *) 
                                                      else []
                                                 else [] 
 					(* if rt2="yaj1"  && text_type = "Vedic"
                                         * then [ Relation (id1,cid1,mid1,"sampraxAnam",id2,cid2,mid2,"2.18", d)] (* yajeH sampraxAnasya karma sajFA *) 
					 * It should get karma saFjFA only, as in the case of aXi-SIf-sWAsAM karma *)
                      | "akarmaka" ->  []
                      | _  ->  []
                      ]
                     else []
                  ]
           | "karmaNi" -> match verb_type rt2 upasarga2 with 
                  [ "xvikarmaka1" -> [ Relation (id1,cid1,mid1,"muKya_karma",id2,cid2,mid2,"2.20", d)] 
                          (* aprAXAne xuhAxi - gOH  xuhyawe xugXaM  *)
                  | "xvikarmaka2" -> [ Relation (id1,cid1,mid1,"gONa_karma",id2,cid2,mid2,"2.21", d)] 
                          (* praXAne nI..  ajA nIyawe grAmaM *)
                  | _ -> match sanAxiH2 with
                     ["Nic" -> match verb_type rt2 upasarga2 with
                          [ "gawi" -> [ Relation (id1,cid1,mid1,"karma",id2,cid2,mid2,"2.22" , d)] (* karmaNi xviwIyA *)
                          | "buxXi"
                          | "Sabxakarma"
                          | "prawyavasAnArWa" -> 
                                  [ Relation (id1,cid1,mid1,"prayojya_karwA",id2,cid2,mid2,"2.23" , d) 
                                  ; Relation (id1,cid1,mid1,"karma",id2,cid2,mid2,"2.24", d) (* anukwakarmaNi xviwIyA *) 
                                  ]
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
                      [ "karwari" -> [ Relation (id1,cid1,mid1,"prayojya_karwA",id2,cid2,mid2,"2.25" , d)]
                             (* karwq_karaNayoH wqwIyA - yajFaxawwaH xevaxawwena annaM pAcayawi *)
                      | "karmaNi" -> 
                             [ Relation (id1,cid1,mid1,"prayojaka_karwA",id2,cid2,mid2,"2.26", d ) 
                             ; Relation (id1,cid1,mid1,"prayojya_karwA",id2,cid2,mid2,"2.27" , d)  
                             ]
                              (* karwqkaraNayoH wqwIyA - yajFaxawwena  xevaxawwena annaM pAcyawe *)
                      | _ -> []
                      ]
                | "akarmaka" ->  match prayogaH2 with
                      [ "karwari" -> []
                      | _ ->  [ Relation (id1,cid1,mid1,"prayojaka_karwA",id2,cid2,mid2,"2.28", d )]
                      ]
                | _ ->  [ Relation (id1,cid1,mid1,"karwA",id2,cid2,mid2,"2.29", d )] (* karwq_karaNayoH_wqwIyA *) 
                ]
        | _ ->  if (prayogaH2 = "karmaNi" || prayogaH2 = "BAve")
                  && not (member_of word1 kAlAXvas)	 (*yogyawA*)
		  && not (member_of (word1 ^ " " ^ string_of_int viBakwiH1) kriyAviSeRaNas)
            then [ Relation (id1,cid1,mid1,"karwA",id2,cid2,mid2,"2.30", d )] (* karwqkaraNayoH wqwIyA *) 
            else [] (* karaNam is marked below *)
        ]
     | _ -> []
     ] else []
    | _ -> []
    ]
  | _ -> []
  ]
  ;

value rlwifkarwA_karma m1 m2 text_type = match m2 with
  [ Wif (id2,cid2,mid2,_,rt2,_,_,upasarga2,sanAxiH2,prayogaH2,_,puruRaH2,vacanam2,_,_,_) ->
     match m1 with
     [ WaxXiwa (id1,cid1,mid1,word1,rt1,pUrvapaxa1,uwwarapaxa1,_,lifgam1,viBakwiH1,vacanam1,_)
     | Sup (id1,cid1,mid1,word1,rt1,pUrvapaxa1,uwwarapaxa1,lifgam1,viBakwiH1,vacanam1,_) -> 
		wifkarwA_karma m1 m2 text_type
     | Kqw (id1,cid1,mid1,word1,_,_,_,kqw_prawyayaH1,_,_,rt1,pUrvapaxa1,uwwarapaxa1,lifgam1,viBakwiH1,vacanam1,_) ->
		if not (kqw_prawyayaH1 = "wavyaw" || kqw_prawyayaH1 = "anIyar")
		then  wifkarwA_karma m1 m2 text_type
		else []
     | _ -> []
     ]
  | _ -> []
  ]
;

value rlkqwkarwA_karma m1 m2 text_type = match m2 with
(* One more condition that the verb in wif does not exist in this sent needs to be added.
 * e.g. xevaxawwaH grAmaM gawaH: here xevaxawwa is the karwA of gawaH, since there is no verb in wif
 * But in grAmam gawaH xevaxawwaH puswakaM paTawi, here xevaxawwa should not be marked as karwA of gawaH but gawaH is the viSeRaNa for xevaxawwaH *)
  [ Kqw (id2,cid2,mid2,word2,rt2,upasarga2,sanAxiH2,kqw2,_,_,_,pUrvapaxa2,uwwarapaxa2,lifgam2,viBakwiH2,vacanam2,_) ->
            (* if (uwwarapaxa2="n") then  -- Why this condition? counter example: rAvaNaH kroXa-mUrCiwaH *)
      match m1 with
     [ WaxXiwa (id1,cid1,mid1,word1,rt1,pUrvapaxa1,uwwarapaxa1,_,lifgam1,viBakwiH1,vacanam1,_) 
     | Kqw (id1,cid1,mid1,word1,_,_,_,_,_,_,rt1,pUrvapaxa1,uwwarapaxa1,lifgam1,viBakwiH1,vacanam1,_)
     | Sup (id1,cid1,mid1,word1,rt1,pUrvapaxa1,uwwarapaxa1,lifgam1,viBakwiH1,vacanam1,_) -> 
       let  d12 = if id1 > id2 then id1-id2 else id2-id1 in
       if ((pUrvapaxa2="n") || (next id1=id2))  
             (* word should not be related to the pUrvapaxa; if it is, then the word should be just before the compound as in  SApena aswaf-gamiwa-mahimA *)
        && no_boundary_crossing_with_iwi id1 id2 text_type
        && prose_order id1 id2 text_type
        && d12 < 8
       then if not (sanAxiH2="Nic") && not ((pUrvapaxa2 = "y") && (uwwarapaxa2 = "y"))
            then match kqw2 with
            [ "kwa" -> 
                if not (viBakwiH2 = 7) 
                then match viBakwiH1 with
                [ 1 -> if uwwarapaxa1="y" && sp_uwwarapaxa rt1 word1 lifgam1 then []
                       else 
                           (* (finite_verb_in_sentence.val=50 ||
                            * finite_verb_in_sentence.val=id2  ||
                            * finite_verb_in_sentence.val=id1 || iwi_pos.val = next id2)
                            *  This condition creates a problem when a word has both sup and wif analysis and 
                            *   wif analysis is not the desired output. 
                            *  Ex: wena mama ayam mohaH vigawaH , here mohaH is not marked *)
                      if noun_agreement vacanam1 vacanam2 lifgam1 lifgam2
                      then if (pUrvapaxa2="n")  (* word should not be related to the pUrvapaxa -- I have examples with other kaarakas but not with karma *)
                             && viBakwiH2=1
                             && (uwwarapaxa2 = "n")  (* If it is an uwwarapaxa && kwa, with Tatpurusha, its karma would have been the pUrvapaxa *)
                                 (* && (id1 < id2  || finite_verb_in_sentence.val == 50) This condition is removed to handle shlokas suc as mayA xqRtA sIwA 
                                    This condition is added, to rule out the possibility of karwA in Sloka form when kqw precedes the noun as in 
                                    gawaH rAmaH, or samavewAH pANdavAH, 
                                    where gawaH and samavewAH should be marked as viSeRaNas and not rAmaH or pANdavAH as karwA *)
                           then if  (members_of rt2 upasarga2 shliR_Axi_verbs
                                  || members_of rt2 upasarga2 aaxikarma_verbs
                                  || rt2="ciw2")
                                          (* || members_of rt2 upasarga2 akarmaka_verbs 
                                           * in the case of akarmaka, karwa is abhihiwa in kwa *)
                                          (* For ciw2, there is no rule by Panini.
                                           * But we come across sentences such as 'rAjA cinwiwaH/ viRayaH ciwiwaH' *)
                                  && not (member_of rt1 intensifiers_list)
                                then [ Relation (id1,cid1,mid1,"karwA",id2,cid2,mid2,"3.1" ,d12)
                                     ; Relation (id1,cid1,mid1,"karma",id2,cid2,mid2,"3.2",d12) ]
                                else if members_of rt2 upasarga2 gawyarWa_verbs && uwwarapaxa2="n"
                                     then [ Relation (id1,cid1,mid1,"gawikarwA",id2,cid2,mid2,"3.3a" ,d12) ]
                                     else if members_of rt2 upasarga2 karwqsamAnAXikaraNa_verbs
                                          then [ Relation (id1,cid1,mid1,"karwA_be_verbs",id2,cid2,mid2,"3.3b", d12)]  
                                          else if members_of rt2 upasarga2 akarmaka_verbs && uwwarapaxa2="n"
                                               then [ Relation (id1,cid1,mid1,"karwA",id2,cid2,mid2,"3.3" ,d12) ]
                                                     (*3-4-71 AxikarmaNi kwaH karwari ca . 3-4-72 gawyarWAkarmakaSliRaSIfsWAZZsavasajanaruhajIryawiByaSca.
                                                      * AxikarmaNi--rAmaH kataM prakqwaH,gawyarWa- rAmaH gqhaM gawaH... *)
                                                     (* ; Relation (id1,cid1,mid1,"karma",id2,cid2,mid2,"2.2",d12) 
                                                      *  amavewAH yuyuwsvaH; here in shloka order, yuyuwsavaH is marked as a karma of samavewAH, which is wrong. *) 
                                                     (* kwayoreva 3-4-71 *)  (* ?? Do not mark karma; this is just samAnAXikaraNam *)
                                                     (* else if  members_of rt2 upasarga2 karmasamAnAXikaraNa_verbs && uwwarapaxa2="n"
                                                      *      then [ Relation (id1,cid1,mid1,"karmasamAnAXikaraNam",id2,cid2,mid2,"3.5",d12)
                                                      *           ; Relation (id1,cid1,mid1,"muKya_karma",id2,cid2,mid2,"3.6",d12)]   -- Need examples;  
                                                      *         evaM ukwaH HqRikeSaH gudAkeSena, here hqRikeSaH is marked as a muKyakarma/karmasamAnAXikaraNam of ukwaH, which is wrong. 
                                                      *          Hence commented till a convincing example is found *)
                                               else if members_of rt2 upasarga2 sakarmaka_verbs  && uwwarapaxa2="n"
                                                         (* &&  (finite_verb_in_sentence.val == 50 || iwi_pos.val = next id2) -- 
                                                          *   this is commented to allow the karma relation between AgacCan and KaNdiwaH in bAlakasya samIpam AgacCan sarpaH KaNdiwaH -- 
                                                          *   AgacCa has both wif and kqw readings. Hence finite_verb_in_sentence.val == 50 cannnot be used *)
                                                         (* mayA sIwA xqRtA iwi saH nyavexayaw, final verb is present, and sIwA is karma for xqRtA : 
                                                          * Solution -- Treat these as two different sentences with a full stop before iwi.
                                                          * Here is a problematic sentence: waM vrajanwaM priyaH BrAwA lakRmaNaH anujagAma snehAw vinaya-sampannaH sumiwrAnanxa-varXanaH 
                                                          * BrAwaraM xayiwaH BrAwuH sOBrAwram anuxarSayan
			                                       In this sumiwrAnanxa-varXanaH is marked as karma of vinaya-sampannaH, which is wrong *)
                                                    then [ Relation (id1,cid1,mid1,"karma",id2,cid2,mid2,"3.4",d12)]  
                                                               (*3-4-71 wayoreva kqwykwaKalarWAH rAmeNa granWaH paTiwaH *)
                                                               (* else if  members_of rt2 upasarga2 xvikarmaka1   && uwwarapaxa2="n"
                                                                *      then [ Relation (id1,cid1,mid1,"muKya_karma",id2,cid2,mid2,"3.7",d12)]
                                                                *      else if members_of rt2 upasarga2 xvikarmaka2  && uwwarapaxa2="n"
                                                                *      then [ Relation (id1,cid1,mid1,"gONa_karma",id2,cid2,mid2,"3.7a",d12)] -- 
                                                                *      changed to viSeRaNas with reverse direction as below -- Amba 27.12.2025 *)
                                                    else if  members_of rt2 upasarga2 xvikarmaka1   && uwwarapaxa2="n"
                                                         then [ Relation (id2,cid2,mid2,"viSe",id1,cid1,mid1,"3.7",d12)]
                                                         else if members_of rt2 upasarga2 xvikarmaka2  && uwwarapaxa2="n"
                                                              then [ Relation (id2,cid2,mid2,"viSe",id1,cid1,mid1,"3.7a",d12)]
                                                              else []
                            else []
                      else []
             | 2 -> if uwwarapaxa1="y" && sp_uwwarapaxa rt1 word1 lifgam1 then []
                    else  
                           (* if (not (viBakwiH1 = viBakwiH2)
                            * || members_of rt2 upasarga2 gawyarWa_verbs)
                            *    In case of gawyarWaka, we can have vanam gawaM raWam PaSya, where vanam is the karma of gawa, 
                            *    but if it is not a gawyarWaka verb then the karma will always be ukwa, and hence will have the same viBakwi as that of kwa, 
                            *    and in such cases we mark them as viSeRaNas, and do not mark the kaaraka relation 
			    *    This condition is further relaxed for all the verbs.
                            *    Ex: hqwAM mEWilIM SqwvA rAmaH vilalApa *)
                        if not (member_of word1 kAlAXvas)
   			   && (  members_of rt2 upasarga2 shliR_Axi_verbs
                              || members_of rt2 upasarga2 aaxikarma_verbs
                              )
                           && (uwwarapaxa2 = "n")  (* If it is an uwwarapaxa && kwa, with Tatpurusha, its karma would have been the pUrvapaxa *)
                                 (* This last condition is added to avoid the karma marking between vyUDam camUm paSya; 
                                  * here there should not be a karma rel between vyUDam and camUm; rather it should be a viSeRaNa *)
                        then [ Relation (id1,cid1,mid1,"karma",id2,cid2,mid2,"3.8",d12)] 
                        else if members_of rt2 upasarga2 gawyarWa_verbs && (uwwarapaxa2 = "n")  
                                 (* If it is an uwwarapaxa && kwa, with Tatpurusha, its karma would have been the pUrvapaxa *)
                             then [ Relation (id1,cid1,mid1,"gawikarma",id2,cid2,mid2,"3.8a",d12)]
                                      (*else [ Relation (id1,cid1,mid1,"karma",id2,cid2,mid2,"2.8a",d12)]
                                      * else if (uwwarapaxa1="n") && (pUrvapaxa1="n") 
		                      *      then [ Relation (id1,cid1,mid1,"karma",id2,cid2,mid2,"2.4",d12)] 
                                      *      Why this condition?  Counter example: sarva-BUwa-hiwe rawAH 
                                      *      in case of kwa, if the verb is sakarmaka, the karma will be ukwa. So we need not mark the karma; 
                                      *        In case of gqXram nihawam xqRtvA rAGavaH Soka-sanwapwaH, note that nihawam is an adj of gqXram, 
                                      *        and not that gqXram is an obj of nihawam 
                                      *        else if members_of rt2 upasarga2 sakarmaka_verbs && (uwwarapaxa2 = "n")
                                      *        then [ Relation (id1,cid1,mid1,"karma",id2,cid2,mid2,"3.9",d12)] *)
                             else if members_of rt2 upasarga2 xvikarmaka1 && (uwwarapaxa2 = "n")
                                  then [ Relation (id1,cid1,mid1,"gONa_karma",id2,cid2,mid2,"3.10",d12)] 
                                  else if  members_of rt2 upasarga2 xvikarmaka2 && (uwwarapaxa2 = "n")
                                       then [ Relation (id1,cid1,mid1,"muKya_karma",id2,cid2,mid2,"3.10a",d12)] 
                                       else []
                                   (*  Why 2.8 is needed? wawkAlam pravqwwAH -> wawkAlam is marked as a karma for pra_vqw, which is asakarmaka 
                                   *   [ Relation (id1,cid1,mid1,"karma",id2,cid2,mid2,"2.8",d12)] 
                                   * anaBihiwe karmaNi xviwIyA gurum upaSliRtaH , grAmaM gawaH, kataM prakqwaH
                                   * else [ Relation (id1,cid1,mid1,"viSe",id2,cid2,mid2,"2.5",d12)]  Any example for this rule? *)
               | 3 ->  if    not (member_of word1 kAlAXvas)
                          && not (members_of rt2 upasarga2 shliR_Axi_verbs
                                  || members_of rt2 upasarga2 gawyarWa_verbs
                                  || members_of rt2 upasarga2 aaxikarma_verbs
                                  || members_of rt2 upasarga2 akarmaka_verbs)
                               (* syanxane sWiwO; no karwA relation between the words *)
                               (* && not (member_of rt1 guNavacana)
                                * why this condition? counter example: bAlena XavalI-kqwam *)
                       then let rel = rlafgavikAra m1 m2 text_type in
			    if rel = [] then [ Relation (id1,cid1,mid1,"karwA",id2,cid2,mid2,"3.11",d12)] (* karwq_karaNayoH_wqwIyA rAmeNa granWaH paTiwaH*) 
                            else []
                       else if members_of rt2 upasarga2 gawyarWa_verbs && uwwarapaxa2="n"  (* wvayA suKam prApwam *)
                            then [ Relation (id1,cid1,mid1,"gawikarwA",id2,cid2,mid2,"3.11a" ,d12) ]
                            else []
               | _ -> []
               ]
               else []
        | "ac" -> match viBakwiH1 with
                   [ 1 -> if   noun_agreement vacanam1 vacanam2 lifgam1 lifgam2
                            && not (member_of rt1 intensifiers_list)
                          then [ Relation (id1,cid1,mid1,"karwA",id2,cid2,mid2,"3.12",d12)] (* aBihiwe karwari praWamA , rAmaH gawavAn *) 
                          else []
                   | 2 -> if (    members_of rt2 upasarga2 sakarmaka_verbs
                               || members_of rt2 upasarga2 xvikarmaka2
                               || members_of rt2 upasarga2 xvikarmaka1
                             )
                             && not (member_of word1 kAlAXvas)
                          then if uwwarapaxa1="y" && sp_uwwarapaxa rt1 word1 lifgam1 then []
			       else [ Relation (id1,cid1,mid1,"karma",id2,cid2,mid2,"3.13",d12)] (*rAmaH gqhaM gawavAn*) 
                          else []
                   | _ -> []
                   ]
        | "kwavawu" 
        | "u" -> if not (viBakwiH2=7)
                       then match viBakwiH1 with
                   [ 1 -> if   noun_agreement vacanam1 vacanam2 lifgam1 lifgam2
                             && not (member_of rt1 intensifiers_list)
                          then [ Relation (id1,cid1,mid1,"karwA",id2,cid2,mid2,"3.16",d12)] (* aBihiwe karwari praWamA , rAmaH gawavAn *) 
                          else []
                   | 2 -> if uwwarapaxa1="y" && sp_uwwarapaxa rt1 word1 lifgam1 then []
                          else if  members_of rt2 upasarga2 sakarmaka_verbs
                                 && not (member_of word1 kAlAXvas)
                               then (*if pUrvapaxa1=uwwarapaxa1 || pUrvapaxa1="a" then *)
                                    [ Relation (id1,cid1,mid1,"karma",id2,cid2,mid2,"3.17",d12)] (*rAmaH gqhaM gawavAn*) 
                               else if   members_of rt2 upasarga2 xvikarmaka2
                                      || members_of rt2 upasarga2 xvikarmaka1
                                    then [ Relation (id1,cid1,mid1,"muKya_karma",id2,cid2,mid2,"3.14",d12)
                                         ; Relation (id1,cid1,mid1,"gONa_karma",id2,cid2,mid2,"3.15",d12)
                                         ]
			            else []
                   | _ -> []
                   ]
                   else []
        | "wavya"  
        | "wavyaw"  
        | "anIyar"  
        | "kyap"  
        | "Kal"
        | "yuc"   -> match viBakwiH1 with
                 [ 1 -> if members_of rt2 upasarga2 sakarmaka_verbs && (pUrvapaxa2=uwwarapaxa2|| pUrvapaxa2="a")
                        then [ Relation (id1,cid1,mid1,"karma",id2,cid2,mid2,"3.16a",d12)]  
                             (* rlkqwaBihiwa10  wayoreva kqwyakwaKalarWAH  rAmeNa granWaH paTiwavyaH/paTanIyaH *)
                        else []
                 | 3 -> [ Relation (id1,cid1,mid1,"karwA",id2,cid2,mid2,"3.17a",d12)]  
                             (* karwq_karaNayoH_wqwIyA rAmeNa granWaH paTiwavyaH/paTanIyaH*)
                 | _ -> []
                 ]
        | "yaw"  
        | "Nyaw"  -> match viBakwiH1 with
                 [ 3 -> [ Relation (id1,cid1,mid1,"karwA",id2,cid2,mid2,"3.17b",d12)]  
                        (* Seperated from the above list, since Nyaw expresses karma. For example, agniH pUrvEH uwa nUwanEH qRiBiH IdyaH Rig 1.1.2 *)
                 | _ -> []
                 ]
        | "SAnac_lat" 
        | "SAnac_lqt" 
        | "Sawq_lat" 
        | "Sawq_lqt" ->  if not (viBakwiH2=7)
                         then if uwwarapaxa1="y" && sp_uwwarapaxa rt1 word1 lifgam1 then []
                              else if viBakwiH1=2 && (members_of rt2 upasarga2 sakarmaka_verbs || members_of rt2 upasarga2 xvikarmaka1 || members_of rt2 upasarga2 xvikarmaka2) 
                                   then [ Relation (id1,cid1,mid1,"karma",id2,cid2,mid2,"3.18",d12)] 
                                      (* else if not (viBakwiH2 = 7)  should viBhakiH2 not be = 4 ? *)
                                      (* else if (viBakwiH1 = 4) (* kqpayA AviRtam viRixanwam waM --- BhG 2.1 *) 
                                       * The BhG2.1 does not cover this case. So example is wrong.
                                       * Further this produces the same relation as of 4.15.
                                       * Hence this is commented. -- Amba  12th Nov 2022
                                       * then [ Relation (id1,cid1,mid1,"prayojanam1",id2,cid2,mid2,"3.19",d12)] *)
                                   else if viBakwiH1=1 && word2="san" && not (word1="san")
                                        then [ Relation (id1,cid1,mid1,"karwqrahiwakarwqsamAnAXikaraNam",id2,cid2,mid2, "3.19a",d12) ] 
			                else []
                         else if    (kqw2="SAnac_lat" || kqw2= "SAnac_lqt") && viBakwiH1=7
                                &&  (members_of rt2 upasarga2 sakarmaka_verbs || members_of rt2 upasarga2 xvikarmaka1 || members_of rt2 upasarga2 xvikarmaka2) 
                              then [ Relation (id1,cid1,mid1,"karma",id2,cid2,mid2,"3.20",d12)] 
			      else []
        | "wqc" 
        | "Nvul"  -> if uwwarapaxa1="y" && sp_uwwarapaxa rt1 word1 lifgam1 then []
                     else if viBakwiH1=2 && (members_of rt2 upasarga2 sakarmaka_verbs || members_of rt2 upasarga2 xvikarmaka1 || members_of rt2 upasarga2 xvikarmaka2)
                          then [ Relation (id1,cid1,mid1,"karma",id2,cid2,mid2,"3.21",d12)] 
		          else []
	| "lyut" -> match viBakwiH1 with
                    [ 3 -> if members_of rt2 upasarga2 karaNa_verbs
                           then [ Relation (id1,cid1,mid1,"karaNa",id2,cid2,mid2,"3.23",d12) ]
			   else []
                    | 2  ->  if (members_of rt2 upasarga2 sakarmaka_verbs || members_of rt2 upasarga2 xvikarmaka1 || members_of rt2 upasarga2 xvikarmaka2)
                             then [ Relation (id1,cid1,mid1,"karma",id2,cid2,mid2,"3.24",d12)] 
                             else []
                    | _ -> []  (* 6 is covered under kAraka RaRTI*)
                    ]
        | _ ->  if uwwarapaxa1="y" && sp_uwwarapaxa rt1 word1 lifgam1 then []
                else if viBakwiH1=6 && (members_of rt2 upasarga2 sakarmaka_verbs) && (pUrvapaxa1=uwwarapaxa1 || pUrvapaxa1="a") 
                     then [ Relation (id1,cid1,mid1,"karma",id2,cid2,mid2,"3.25",d12)] 
                     else []
        ]
      else match kqw2 with (* Nic *)
        [ "kwa" -> match viBakwiH1 with
                [ 1 -> if noun_agreement vacanam1 vacanam2 lifgam1 lifgam2
                   then match verb_type rt2 upasarga2 with
                   [ "akarmaka" -> [ Relation (id1,cid1,mid1,"prayojya_karwA",id2,cid2,mid2,"3.26",d12)] 
                   | "xvikarmaka1" -> [ Relation (id1,cid1,mid1,"gONa_karma",id2,cid2,mid2,"3.27",d12)] 
                   | "xvikarmaka2" -> [ Relation (id1,cid1,mid1,"muKya_karma",id2,cid2,mid2,"3.28",d12)] 
                   | "gawi" -> [ Relation (id1,cid1,mid1,"prayojaka_karwA",id2,cid2,mid2,"3.29",d12)  
                                    (* yajFaxawwaH xevaxawwaM grAmaM gamiwaH  gawibuxXi.. elevates prayojya_karwA to karma, hence xviwIyA *)
                               ; Relation (id1,cid1,mid1,"prayojya_karwA",id2,cid2,mid2,"3.30",d12) (*yajFaxawwena xevaxawwaH pATaM kAriwaH *) 
                               ]
                   | _ ->  if  members_of rt2 upasarga2 shliR_Axi_verbs
                           then [ Relation (id1,cid1,mid1,"prayojaka_karwA",id2,cid2,mid2,"3.31",d12)  
                                  (* yajFaxawwaH xevaxawwaM grAmaM gamiwaH  gawibuxXi.. elevates prayojya_karwA to karma, hence xviwIyA *)
                                ; Relation (id1,cid1,mid1,"prayojya_karwA",id2,cid2,mid2,"3.32",d12) (*yajFaxawwena xevaxawwaH pATaM kAriwaH *) 
                                ]
                            else if members_of rt2 upasarga2 aaxikarma_verbs
                                 then [ Relation (id1,cid1,mid1,"prayojaka_karwA",id2,cid2,mid2,"3.33",d12) (* AxikarmaNi,gawyarWAkarmaka... *) 
                                      ; Relation (id1,cid1,mid1,"prayojya_karwA",id2,cid2,mid2,"3.34",d12) 
                                      ; Relation (id1,cid1,mid1,"karma",id2,cid2,mid2,"3.35",d12) 
                                      ]
                                 else [ Relation (id1,cid1,mid1,"karma",id2,cid2,mid2,"3.36",d12) ]
                   ]
                   else []
             | 2 ->  if not (member_of word1 kAlAXvas) && not (rt1 = "kevala")
                     then match verb_type rt2 upasarga2 with
                     ["akarmaka" -> [ Relation (id1,cid1,mid1,"prayojya_karwA",id2,cid2,mid2,"3.37",d12)] 
                     | "xvikarmaka1" ->  [ Relation (id1,cid1,mid1,"muKya_karma",id2,cid2,mid2,"3.38",d12)] 
                     | "xvikarmaka2" ->  [ Relation (id1,cid1,mid1,"gONa_karma",id2,cid2,mid2,"3.39",d12)] 
                     | _ -> if uwwarapaxa1="y" && sp_uwwarapaxa rt1 word1 lifgam1 then []
                            else if (uwwarapaxa1=pUrvapaxa1 ) || (pUrvapaxa1="a")
		                 then [ Relation (id1,cid1,mid1,"karma",id2,cid2,mid2,"3.40",d12)] 
                                 else [ Relation (id1,cid1,mid1,"prayojya_karwA",id2,cid2,mid2,"3.41",d12) 
                                      ; Relation (id1,cid1,mid1,"karma",id2,cid2,mid2,"3.42",d12) 
                                      ]
                     ]
                     else []
             | 3 ->  if not (member_of word1 kAlAXvas)
		     then match verb_type rt2 upasarga2 with
                     ["gawi" -> [ Relation (id1,cid1,mid1,"prayojaka_karwA",id2,cid2,mid2,"3.43",d12)] 
                     | "xvikarmaka1"
                     | "xvikarmaka2" -> [ Relation (id1,cid1,mid1,"prayojaka_karwA",id2,cid2,mid2,"3.44",d12) 
                                        ; Relation (id1,cid1,mid1,"prayojya_karwA",id2,cid2,mid2,"3.45",d12) 
                                        ]
                     | "sakarmaka"  -> [ Relation (id1,cid1,mid1,"prayojaka_karwA",id2,cid2,mid2,"3.46",d12) ]
                     |_ -> if members_of rt2 upasarga2 shliR_Axi_verbs 
                           then [ Relation (id1,cid1,mid1,"prayojaka_karwA",id2,cid2,mid2,"3.47",d12)] 
                           else if members_of rt2 upasarga2 aaxikarma_verbs
                                then [ Relation (id1,cid1,mid1,"prayojaka_karwA",id2,cid2,mid2,"3.48",d12) 
                                     ; Relation (id1,cid1,mid1,"prayojya_karwA",id2,cid2,mid2,"3.49",d12) 
                                     ]
                                else [ Relation (id1,cid1,mid1,"prayojaka_karwA",id2,cid2,mid2,"3.50",d12)] 
                     ]
                     else []
              | _ -> []
              ]
        | "kwavawu" -> match viBakwiH1 with
                       [ 1 -> if noun_agreement vacanam1 vacanam2 lifgam1 lifgam2
                              then [ Relation (id1,cid1,mid1,"prayojaka_karwA",id2,cid2,mid2,"3.51",d12)]   
                              else []
                       | 2 -> if not (member_of word1 kAlAXvas)
                                && members_of rt2 upasarga2 sakarmaka_verbs
                              then [ Relation (id1,cid1,mid1,"prayojya_karwA",id2,cid2,mid2,"3.52",d12)] (* To write and check *) 
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
          | "Sawq_lqt" ->  if uwwarapaxa1="y" && sp_uwwarapaxa rt1 word1 lifgam1 then []
                           else if viBakwiH1=2 
                                  &&  (   members_of rt2 upasarga2 xvikarmaka1
                                       || members_of rt2 upasarga2 xvikarmaka1
                                       || members_of rt2 upasarga2 shabxakarma_verbs
                                       || members_of rt2 upasarga2 gawyarWa_verbs
                                       || members_of rt2 upasarga2 prawyavasAnArWa_verbs
                                       || members_of rt2 upasarga2 buxXyarWa_verbs)
                               then [ Relation (id1,cid1,mid1,"karma",id2,cid2,mid2,"3.54",d12)
                                    ; Relation (id1,cid1,mid1,"prayojya_karwA",id2,cid2,mid2,"3.55",d12)
                                    ]
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

value rlAvykqw_karma m1 m2 text_type = match m2 with
  [ Avykqw (id2,cid2,mid2,_,rt2,_,_,upasarga2,sanAxiH2,_,_,_) -> match m1 with
     [ WaxXiwa (id1,cid1,mid1,word1,rt1,pUrvapaxa1,uwwarapaxa1,_,lifgam1,viBakwiH1,_,_) 
     | Kqw (id1,cid1,mid1,word1,_,_,_,_,_,_,rt1,pUrvapaxa1,uwwarapaxa1,lifgam1,viBakwiH1,_,_)
     | Sup (id1,cid1,mid1,word1,rt1,pUrvapaxa1,uwwarapaxa1,lifgam1,viBakwiH1,_,_) -> 
       let  d12 = if id1 > id2 then id1-id2 else id2-id1 in
       if  prose_order id1 id2 text_type && no_boundary_crossing_with_iwi id1 id2 text_type
       then match viBakwiH1 with
        [ 2 -> if not (member_of word1 kAlAXvas)
               then if uwwarapaxa1="y" && sp_uwwarapaxa rt1 word1 lifgam1 then []
               else match verb_type rt2 upasarga2 with
               [ "xvikarmaka1" -> if not (lifgam1="napuM")
                                  then 
				  [ Relation (id1,cid1,mid1,"gONa_karma",id2,cid2,mid2,"5.1" ,d12)  
                                  ; Relation (id1,cid1,mid1,"muKya_karma",id2,cid2,mid2,"5.2" ,d12)  
                                  ] 
                                  else 
				  [ Relation (id1,cid1,mid1,"gONa_karma",id2,cid2,mid2,"5.1" ,d12)]
              | "xvikarmaka2" -> [ Relation (id1,cid1,mid1,"gONa_karma",id2,cid2,mid2,"5.1" ,d12)  
                                 ; Relation (id1,cid1,mid1,"muKya_karma",id2,cid2,mid2,"5.2" ,d12)  
                                 ] 
                                      (* karmaNi xviwIyA  - rAjAnaM vasuXAM yAcawe*)
                                      (* karmaNi xviwIyA - gAM xogXi payaH *)
              | "gawi"
              | "buxXi" 
              | "Sabxakarma" 
              | "prawyavasAnArWa" -> if not (sanAxiH2="Nic")
                                     then [ Relation (id1,cid1,mid1,"karma",id2,cid2,mid2,"5.3" ,d12)] (* karmaNi xviwIyA *) 
                                     else if member_of rt1 animate_nouns || member_of rt1 manuRyasaFjFAvAcI || rt1="asmax" || rt1 = "yuRmax"
                                          then [ Relation (id1,cid1,mid1,"prayojya_karwA",id2,cid2,mid2,"5.4",d12) 
                                               ; Relation (id1,cid1,mid1,"karma",id2,cid2,mid2,"5.5",d12) 
                                               ]
                                          else [ Relation (id1,cid1,mid1,"karma",id2,cid2,mid2,"5.6",d12) ]
              | "sakarmaka" -> if not (sanAxiH2="Nic")
                               then if not ((uwwarapaxa1="y") &&  (rt1 = "pUrvaka"))
                                    then [ Relation (id1,cid1,mid1,"karma",id2,cid2,mid2,"5.7" ,d12)] (* karmaNi xviwIyA *) 
			            else []
                               else [ Relation (id1,cid1,mid1,"karma",id2,cid2,mid2,"5.8",d12) ]
              | "akarmaka" -> if (sanAxiH2="Nic")
                              then [ Relation (id1,cid1,mid1,"karma",id2,cid2,mid2,"5.9",d12)] 
                              else []
              | _ -> []
              ] 
              else []
        | 3 ->  if (sanAxiH2="Nic")
		then [ Relation (id1,cid1,mid1,"prayojakakarwqrahiwaprayojyakarwA",id2,cid2,mid2,"5.10" ,d12)  ]
		else []
        | _ -> []
        ]
        else []
    | _ -> []
     ]
  | _ -> []
  ]
;

value rlevamkarma m1 m2 text_type = match m1 with
      [ Avy (id1,cid1,mid1,word1,_,_,_,_) -> 
           if (word1="iwi" || word1="evam") && id1 = 1
           then match m2 with
            [ Wif (id2,cid2,mid2,_,rt2,_,_,upasarga2,_,_,_,_,_,_,_,_)
            | Kqw (id2,cid2,mid2,_,rt2,upasarga2,_,_,_,_,_,_,_,_,_,_,_)
            | Avykqw (id2,cid2,mid2,_,rt2,_,_,upasarga2,_,_,_,_) ->
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
                         then  [ Relation (id1,cid1,mid1,"gONa_karma",id2,cid2,mid2,"40.10",d12) ]
                         else [] 
               else []
            | _ -> []
            ]
           else []
      | _ -> []
      ]
;
