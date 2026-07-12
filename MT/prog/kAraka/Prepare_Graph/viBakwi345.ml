open Pada_structure;
open Common;
open Afgavikaara;
open Adata;
open AXikaraNa;

(* Verb - Noun relations: Other kaaraka and non-kaaraka relations

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

value anaBihiwe m1 m2 id1 cid1 mid1 rt1 word1 pUrvapaxa1 uwwarapaxa1 lifgam1 viBakwiH1 id2 cid2 mid2 rt2 pUrvapaxa2 uwwarapaxa2 upasarga2 kqw1 kqw2 text_type =
   if ((pUrvapaxa1 = "y") || (pUrvapaxa2 = "y")) then []
   else
   let  d12 = if id1 > id2 then id1-id2 else id2-id1 in
   match viBakwiH1 with
       [ 3 -> if (rt2="yaj1")
                   then [ Relation (id1,cid1,mid1,"karma",id2,cid2,mid2,"4.1",d12)] (* yajeH karmaNaH karaNa saFjFA  vArwika*)
	           else if (rt2 = "yuj2") && (kqw2 = 1)
                        then [ Relation (id1,cid1,mid1,"sahArWa",id2,cid2,mid2,"4.2a",d12)] 
	           else if (member_of rt1 kAlAXvas)
                        then [ Relation (id1,cid1,mid1,"apavarga_saM",id2,cid2,mid2,"4.2",d12)] (* xevaxawwena mAsena pATaH aXIwaH apavarge wqwIyA A 2.3.6 *)  (* yogyawA *)
                        
                        else 
                            if members_of rt2 upasarga2 karaNa_verbs
                             then if member_of rt1 shabxavAci_nouns || member_of rt1 buxXivAci_nouns
                                  then [ Relation (id1,cid1,mid1,"karaNa",id2,cid2,mid2,"4.3",d12) ]  (*karwq karaNayoswqwIyA - yAnena gacCawi*) 
                                  else if member_of rt1 saMKyeya
                                       then [ Relation (id1,cid1,mid1,"karaNa",id2,cid2,mid2,"4.5",d12)]   (*karwq karaNayoswqwIyA - yAnena gacCawi*) 
 				       else if not (member_of rt1 guNa_not_guNavacana) && not (is_human rt1) && not (rt1 = "asmax") && not (rt1 = "yuRmax") && not (member_of rt1 kqxanwas) 
                                       then [ Relation (id1,cid1,mid1,"karaNa",id2,cid2,mid2,"4.6",d12)   (*karwq karaNayoswqwIyA - yAnena gacCawi*) 
                                            ; Relation (id1,cid1,mid1,"hewu",id2,cid2,mid2,"4.7",d12) ]
                                       else [ Relation (id1,cid1,mid1,"hewu",id2,cid2,mid2,"4.8",d12) ]
                              else if (rt2="jFA2" && upasarga2 = "sam")
                     (* samjFonyawarasyAm karmaNi A. 2.3.22 -mAwrA saFjAnIwe *) 
                    || (rt2="hu1" && text_type="Vedic")
                     (* wqwIyA ca hoSCanxasi A 2.3.3 - yavAgvA juhowi *)
                                   then if not (member_of rt1 guNa_not_guNavacana) (*|| pronominal123 rt1*)
                                            then [ Relation (id1,cid1,mid1,"karma",id2,cid2,mid2,"4.9",d12) ]
                                            else [ Relation (id1,cid1,mid1,"hewu",id2,cid2,mid2,"4.10",d12) ]
                                   else (* if not (member_of rt1 guNa_not_guNavacana) *)
					let rel = rlafgavikAra m1 m2 text_type in
                                        if rel = [] then [ Relation (id1,cid1,mid1,"hewu",id2,cid2,mid2,"4.11",d12) ] (* annena vasawi *) 
					else []
           (* anaBihiwa karwA -> rlanaBihiwakarwA *)
       | 4 ->  if members_of rt2 upasarga2 sampraxAna_verbs
               (*then if member_of rt1 animate_nouns
                * This has problems. saH pATaSAlAyE Xanam xaxAwi will fail to assign sampraxAna to pATaSAlA *)
               then if not (member_of rt1 guNa_not_guNavacana) && not (lifgam1="napuM") 
                    then if kqw1=0 
                         then [ Relation (id1,cid1,mid1,"sampra",id2,cid2,mid2,"4.12",d12)] (* rajakAya xaxAwi *)
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
                    then [ Relation (id1,cid1,mid1,"karma_sa",id2,cid2,mid2,"4.15",d12) ]
                (* manyakarmaNyanAxare viBARAZprANiRu 2-3-17 ahaM wvAM wqNAya manye / aham wvA wqNAya manye *)
                   else if members_of rt2 upasarga2 gawyarWa_verbs (* saH grAmAya gacCawi *)
                        then [ Relation (id1,cid1,mid1,"karma",id2,cid2,mid2,"3.3a" ,d12) ]
                        else if kqw1 = 0 && not (pUrvapaxa2 = "y") && not (uwwarapaxa2 = "y")
                             then [ Relation (id1,cid1,mid1,"prayojanam1",id2,cid2,mid2,"4.16",d12)] (* puwrAya puswakaM krINAwi *) 
                             else [ Relation (id1,cid1,mid1,"prayojanam1",id2,cid2,mid2,"4.17",d12)] (* prakRAlanAya xaxAwi *)
       | 5 -> if members_of rt2 upasarga2 apAxAna_verbs
              then if pronominal123 rt1
                   then (*if word1="wasmAw"
                        then if kqw2=0
                             then [ Relation (id1,cid1,mid1,"vAkya:kArya_xyo",id2,cid2,mid2,"4.17c",d12)]  
			     else []
                        else*) [ Relation (id1,cid1,mid1,"apA",id2,cid2,mid2,"4.17d",d12)
                             ; Relation (id1,cid1,mid1,"hewuH5",id2,cid2,mid2,"4.18",d12) ]
                   else if not(member_of rt1 guNa_not_guNavacana) || (kqw1=1)  (* allow kqxanwas also  -- xAwqByaH Xanam laBanwe *)
                        then [ Relation (id1,cid1,mid1,"apA",id2,cid2,mid2,"4.19",d12)  (* apAxAne paFcamI  - rAmaH grAmAw AgacCawi / raveH lokaH prakASam aXigacCawi *) 
                             ;  Relation (id1,cid1,mid1,"hewuH5",id2,cid2,mid2,"4.20",d12)] (* raveH lokaH suKam aXigacCawi *) 
                        else if   rt1="swoka" 
                                || rt1="alpa" 
                                || rt1="kqcCra"
                                || rt1="kawipaya"
                             then [ Relation (id1,cid1,mid1,"karaNa",id2,cid2,mid2,"4.22",d12)] 
             (* karaNe ca swokAlpakqcCrakawipayasyAsawwvavacanasya 2-3-33 - swokAw mukwaH *)
                             else if (member_of rt1 guNavacana) (* yogyawA *)
                                  then [ Relation (id1,cid1,mid1,"hewuH5",id2,cid2,mid2,"4.23",d12)] (* viBARA guNe aswriyAm 2-3-25 - jAdyAw baxXaH*)  
                                  else if (member_of word1 kAlAXvas)
                                       then [ Relation (id1,cid1,mid1,"aXikaraNa",id2,cid2,mid2,"4.24",d12) ] (* sapwamIpaFcamyO kArakamaXye A 2.3.7 
                                                                                                -- kroSAw lakRyam viXyawi *)
                                       else if (rt2="xqS1" || (rt2="IkR1" && upasarga2="pra")) (* prAsAxAw prekRyawe and AsanAw prekRyawe *)
				          && (rt1 = "Asana" || rt1 = "prAsAxa")  (* These are rare constructions, and the condition needs to be stated as if rt1 is a possible aXikaranNa ; This is to avoid marking vacanAw as lyapkarmAXikaraNa for in vacanA xarSayAmAsa *)
                                            then [ Relation (id1,cid1,mid1,"lyablopakarmAXikaraNam",id2,cid2,mid2,"4.25",d12) 
                                                 ; Relation (id1,cid1,mid1,"hewuH5",id2,cid2,mid2,"4.26",d12) ]
                                            else [ Relation (id1,cid1,mid1,"hewuH5",id2,cid2,mid2,"4.27",d12) ] (* हेतौ पञ्चमी वा स्यादिस्यर्थः।A bAlamanorama tIkA *)
               else if word1="wasmAw" && not (pUrvapaxa2 = "y") 
                    then if kqw2=0
                    then [ Relation (id1,cid1,mid1,"vAkya:kArya_xyo",id2,cid2,mid2,"4.17a",d12)]  
		    else if rt2="arh1" (* wasmAw vayam arhAH - is with ac suffix; This looks like an exceptional case *)
                    then [ Relation (id1,cid1,mid1,"vAkya:kArya_xyo",id2,cid2,mid2,"4.17b",d12)]  
		    else []
                    else if word1="yasmAw"
                         then [ Relation (id1,cid1,mid1,"vAkya:kAraNa_xyo",id2,cid2,mid2,"4.17b",d12)]  
                         else [ Relation (id1,cid1,mid1,"hewuH5",id2,cid2,mid2,"4.27a",d12) ] (* हेतौ पञ्चमी वा स्यादिस्यर्थः।A bAlamanorama tIkA *)
       | 6 -> if (  rt2="vi_ava_hq1" || rt2="paNa1" || rt2="xiv1")
          then [ Relation (id1,cid1,mid1,"karma",id2,cid2,mid2,"4.28",d12) ]  
           (* vyavahqpaNoH samarWayoH 2-3-57 -- Sawasya vyavaharawi,
              xivaswaxarWasya 2-3-58 xiv1 if it is in vyavahAra arWa-- Sawasya xIvyawi*)
            else []
       | 7  -> if (upasarga2="aXi" && (rt2="SIf1" || rt2="sWA1"))
               then if member_of word1 kAlAXikaraNas (* praBAwe vEkuNTam wiRTawi *)
                    then [ Relation (id1,cid1, mid1, "kAla_aXi", id2,cid2, mid2,"4.29",d12) ]
                    else  [] 
               else if (rt2="gam1" || rt2="SAs1" || rt2="syanx1")
                    then if member_of word1 kAlAXikaraNas (* praBAwe vEkuNTam wiRTawi *)
                         then [ Relation (id1,cid1, mid1, "kAla_aXi", id2,cid2, mid2,"4.30",d12) ]
                         else  if (kqw1 = 0) then [ Relation (id1,cid1,mid1, "aXikaraNa", id2,cid2, mid2,"4.31",d12) ]
                              else []
                    else if word1="maXye" then []
                         else match m1 with
               [  Kqw (id1,cid1,mid1,word1,_,_,_,kqw_prawyayaH1,_,_,rt1,_,_,_,viBakwiH1,_,_) ->
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
           [ Wif (id2,cid2,mid2,_,rt2,_,_,upasarga2,sanAxiH2,_,lakAraH2,puruRaH2,_,_,_,_) -> 
            if ((id1 <= 2 && text_type = "Prose") || text_type = "Sloka")
            && kqw1=0 (* the word should not be a kqxanwa to be in samboXana ; this was over-generating in the case of upasafgamya abravIw; upasafgamya being marked as a samboXya *)
              then  if (uwwarapaxa1="y") then [ Relation (id1,cid1,mid1,"samboXya",id2,cid2,mid2,"4.34c",d12)]
             (* if ((lakAraH2="lot") && (puruRaH2="ma"))
              then [ Relation (id1,cid1,mid1,"samboXya",id2,cid2,mid2,"3.14",d12)]
              else [] *)
              else if ((rt1="brahma" || rt1 = "miwra") && not (lifgam1 = "napuM")) 
                   then [ Relation (id1,cid1,mid1,"samboXya",id2,cid2,mid2,"4.34a",d12)]
                   else if (member_of rt1 manuRyasaFjFAvAcI || member_of rt1 upAXi || member_of rt1 named_entity || member_of rt1 sambanXavAcI || rt1="mahoxaya" || rt1 = "mahoxayA" || rt1 = "mahABAga" || rt1 = "mahABAgA") 
              && not (pUrvapaxa1="y"|| uwwarapaxa1="y")
 (* These conditions under-generate. In the case of manuRyasaFjFAvAcI, the list needs to be populated. But more importantly, we have various adjectives such as anaGa, etc which are used for samboXana.  But still it is aviable to us this condition, with words such as anaGa etc added to this list, rather than making the list open *)
              then [ Relation (id1,cid1,mid1,"samboXya",id2,cid2,mid2,"4.34b",d12)]
              else[]
              else []
           | Kqw (id2,cid2,mid2,_,_,_,_,kqw_prawyayaH2,_,_,_,_,_,_,viBakwiH2,_,_) -> 
               if (kqw_prawyayaH2="kwa" || kqw_prawyayaH2="kwavawu" || kqw_prawyayaH2="ac" || kqw_prawyayaH2="yaw") 
                 && (viBakwiH2=1) 
                 (*&& (id2 = total_wrds.val)*)
          (* Need an example where the kwAnwa is not at the end, and has a relation with kamboXya, in Sloka form. This was overgenerating solutions. Only when an example is provided, we can uncomment this condition 
           * || text_type="Sloka")  
-- Here is an example: लोके अस्मिन् द्विविधा निष्ठा पुरा प्रोक्ता मया अन्-अघ  
In order to handle the over-generation, we add a constraint that samboXya can be attached only to the root *)
                 && ((id1 < 2 && text_type = "Prose") || text_type = "Sloka")
                 && (member_of rt1 manuRyasaFjFAvAcI || member_of rt1 upAXi ) 
(* These conditions under-generate. In the case of manuRyasaFjFAvAcI, the list needs to be populated. But more importantly, we have various adjectives such as anaGa, etc which are used for samboXana.  30th dec 2023 *)
               (* && not (pUrvapaxa1="y"|| uwwarapaxa1="y") --
 we need to think about how to allow compound names for samboXya  -- 2nd Aug 2023 *)
               (* To establish a relation between rAma and gawaH in 'rAma saH gawaH', but to stop such a relation in 'rAma gawaH saH mama puwraH aswi. *)
    (*           
Counter ex for napum: anawa-rUpa wvayA viSvam wawam
if (not (lifgam1="napuM") && kqw_prawyayaH2="kwa" || kqw_prawyayaH2="kwavawu" || kqw_prawyayaH2="ac" || kqw_prawyayaH2="yaw") && (viBakwiH2=1) && id2 = total_wrds.val  *)
               then [ Relation (id1,cid1,mid1,"samboXya",id2,cid2,mid2,"4.35",d12)]
              else []
           |  _ -> []
           ]
       | 2  -> (* covered in rlwifkarwA_karma and rlkqwkarwA_karma *)
           if (member_of rt1 kAlAXvas)
           then [ Relation (id1,cid1,mid1,"awyanwa_saM",id2,cid2,mid2,"4.36",d12)] (* xevaxawwaH mAsam pATam aXIwe kAlAXvanorawyanwasaMyoge A 2.3.5 *)  (* yogyawA *)
           else if member_of (word1^" "^string_of_int viBakwiH1) kriyAviSeRaNas (* yogyawA *) && lifgam1="napuM" && uwwarapaxa2="n"
           then [ Relation (id1,cid1,mid1,"kri_vi",id2,cid2,mid2,"4.37",d12)] 
           else [] (* rlwifanaBihiwakarma rlkqwanaBihiwakarma *)
       | _ -> [] (* raise an exception *)
       ]
;

value rlanaBihiwe m1 m2 text_type = match m2 with
  [ Wif (id2,cid2,mid2,_,rt2,pUrvapaxa2,uwwarapaxa2,upasarga2,_,_,_,_,_,_,_,_) ->
     match m1 with
     [ Sup (id1,cid1,mid1,word1,rt1,pUrvapaxa1,uwwarapaxa1,lifgam1,viBakwiH1,_,_) ->
       if prose_order id1 id2 text_type
        &&  (no_boundary_crossing_with_iwi id1 id2 text_type || viBakwiH1 = 8)
       then let kqw1=0 in let kqw2=0 in anaBihiwe m1 m2 id1 cid1 mid1 rt1 word1 pUrvapaxa1 uwwarapaxa1 lifgam1 viBakwiH1 id2 cid2 mid2 rt2 pUrvapaxa2 uwwarapaxa2 upasarga2 kqw1 kqw2 text_type
       else []
     | Kqw (id1,cid1,mid1,word1,_,_,_,kqw1,_,_,rt1,pUrvapaxa1,uwwarapaxa1,lifgam1,viBakwiH1,_,_) ->
       if prose_order id1 id2 text_type (* check for leKani etc. *)
         &&  (no_boundary_crossing_with_iwi id1 id2 text_type || viBakwiH1 = 8)
	 then if ((kqw1 ="Sawq_lat") || (kqw1 = "kwa")) (* In these cases, the kqxanwas can be kaarakas *)
       (*then if (* kqw1="wqc" && *) (viBakwiH1=3 || viBakwiH1 = 5)
Why this condition of 3 & 5 and hewu? We should write this in anaBihiwe itself!
       then [ Relation (id1,cid1,mid1,"hewu",id2,cid2,mid2,"4.38",d12)] 
       else *) 
       then let kqw1=0 in let kqw2=0 in anaBihiwe m1 m2 id1 cid1 mid1 rt1 word1 pUrvapaxa1 uwwarapaxa1 lifgam1 viBakwiH1 id2 cid2 mid2 rt2 pUrvapaxa2 uwwarapaxa2 upasarga2 kqw1 kqw2 text_type
       else let kqw1=1 in let kqw2=0 in anaBihiwe m1 m2 id1 cid1 mid1 rt1 word1 pUrvapaxa1 uwwarapaxa1 lifgam1 viBakwiH1 id2 cid2 mid2 rt2 pUrvapaxa2 uwwarapaxa2 upasarga2 kqw1 kqw2 text_type
       else []
     | WaxXiwa (id1,cid1,mid1,word1,rt1,pUrvapaxa1,uwwarapaxa1,waxXiwa_prawyayaH1,lifgam1,viBakwiH1,_,_) -> 
       let  d12 = if id1 > id2 then id1-id2 else id2-id1 in
       if prose_order id1 id2 text_type
         &&  ( no_boundary_crossing_with_iwi id1 id2 text_type || viBakwiH1 = 8)
       then if  waxXiwa_prawyayaH1="wva" && viBakwiH1=5
       then [ Relation (id1,cid1,mid1,"hewuH5",id2,cid2,mid2,"4.39",d12)] 
       else let kqw1=0 in let  kqw2=0 in anaBihiwe m1 m2 id1 cid1 mid1 rt1 word1 pUrvapaxa1 uwwarapaxa1 lifgam1 viBakwiH1 id2 cid2 mid2 rt2 pUrvapaxa2 uwwarapaxa2 upasarga2 kqw1 kqw2 text_type
       else []
     | Avy (id1,cid1,mid1,word1,_,_,uwwarapaxa1,_) -> 
       let  d12 = if id1 > id2 then id1-id2 else id2-id1 in
           if ((word1 = "yawaH") || (word1 = "wawaH")) 
           then if members_of rt2 upasarga2 apAxAna_verbs
                then [ Relation (id1,cid1,mid1,"apA",id2,cid2,mid2,"4.39a",d12)
                     ; Relation (id1,cid1,mid1,"hewuH5",id2,cid2,mid2,"4.39b",d12) ]
		else [ Relation (id1,cid1,mid1,"hewuH5",id2,cid2,mid2,"4.39c",d12) ]
	   else []
     | _ -> []
     ]
  | Avykqw (id2,cid2,mid2,_,rt2,pUrvapaxa2,uwwarapaxa2,upasarga2,_,_,_,_) -> 
     match m1 with
     [ Sup (id1,cid1,mid1,word1,rt1,pUrvapaxa1,uwwarapaxa1,lifgam1,viBakwiH1,_,_) ->
       if prose_order id1 id2 text_type
         &&  ( no_boundary_crossing_with_iwi id1 id2 text_type || viBakwiH1 = 8)
       then let kqw1=0 in let kqw2=1 in anaBihiwe m1 m2 id1 cid1 mid1 rt1 word1 pUrvapaxa1 uwwarapaxa1 lifgam1 viBakwiH1 id2 cid2 mid2 rt2 pUrvapaxa2 uwwarapaxa2 upasarga2 kqw1 kqw2 text_type
       else []
     | Kqw (id1,cid1,mid1,word1,_,_,_,kqw1,_,_,rt1,pUrvapaxa1,uwwarapaxa1,lifgam1,viBakwiH1,_,_) ->
       if prose_order id1 id2 text_type (* check for leKani etc. *)
         &&  ( no_boundary_crossing_with_iwi id1 id2 text_type || viBakwiH1 = 8)
	 then if  ((kqw1 ="Sawq_lat") || (kqw1 = "kwa")) (* In these cases, the kqxanwas can be kaarakas *)
       (*then if (* kqw1="wqc" && *) (viBakwiH1=3 || viBakwiH1 = 5)
Why this condition of 3 & 5 and hewu? We should write this in anaBihiwe itself!
       then [ Relation (id1,cid1,mid1,"hewu",id2,cid2,mid2,"4.40",d12)] 
       else *) 
       then let kqw1=0 in let kqw2=1 in anaBihiwe m1 m2 id1 cid1 mid1 rt1 word1 pUrvapaxa1 uwwarapaxa1 lifgam1 viBakwiH1 id2 cid2 mid2 rt2 pUrvapaxa2 uwwarapaxa2 upasarga2 kqw1 kqw2 text_type
       else let kqw1=1 in let kqw2=1 in anaBihiwe m1 m2 id1 cid1 mid1 rt1 word1 pUrvapaxa1 uwwarapaxa1 lifgam1 viBakwiH1 id2 cid2 mid2 rt2 pUrvapaxa2 uwwarapaxa2 upasarga2 kqw1 kqw2 text_type
       else []
     | WaxXiwa (id1,cid1,mid1,word1,rt1,pUrvapaxa1,uwwarapaxa1,waxXiwa_prawyayaH1,lifgam1,viBakwiH1,_,_) -> 
       let  d12 = if id1 > id2 then id1-id2 else id2-id1 in
       if prose_order id1 id2 text_type
         &&  ( no_boundary_crossing_with_iwi id1 id2 text_type || viBakwiH1 = 8)
       then if  waxXiwa_prawyayaH1="wva" && viBakwiH1=5
       then [ Relation (id1,cid1,mid1,"hewuH5",id2,cid2,mid2,"4.41",d12)] 
       else let kqw1=0 in let  kqw2=1 in anaBihiwe m1 m2 id1 cid1 mid1 rt1 word1 pUrvapaxa1 uwwarapaxa1 lifgam1 viBakwiH1 id2 cid2 mid2 rt2 pUrvapaxa2 uwwarapaxa2 upasarga2 kqw1 kqw2 text_type
       else []
     | Avy (id1,cid1,mid1,word1,_,_,uwwarapaxa1,_) -> 
       let  d12 = if id1 > id2 then id1-id2 else id2-id1 in
           if ((word1 = "yawaH") || (word1 = "wawaH")) 
           then if members_of rt2 upasarga2 apAxAna_verbs
                then [ Relation (id1,cid1,mid1,"apA",id2,cid2,mid2,"4.42a",d12)
                     ; Relation (id1,cid1,mid1,"hewuH5",id2,cid2,mid2,"4.42b",d12) ]
		else [ Relation (id1,cid1,mid1,"hewuH5",id2,cid2,mid2,"4.42c",d12) ]
	   else []
     | _ -> []
     ]
  | Kqw (id2,cid2,mid2,_,rt2,upasarga2,_,kqw2,_,_,_,pUrvapaxa2,uwwarapaxa2,_,viBakwiH2,_,_) ->
       match m1 with
       [ Sup (id1,cid1,mid1,word1,rt1,pUrvapaxa1,uwwarapaxa1,lifgam1,viBakwiH1,_,_)
       | WaxXiwa (id1,cid1,mid1,word1,rt1,pUrvapaxa1,uwwarapaxa1,_,lifgam1,viBakwiH1,_,_) -> 
            if prose_order id1 id2 text_type && not (viBakwiH2 = 8)
            &&  ( no_boundary_crossing_with_iwi id1 id2 text_type || viBakwiH1 = 8)
            then let kqw1=0 in let kqw2=1 in anaBihiwe m1 m2 id1 cid1 mid1 rt1 word1 pUrvapaxa1 uwwarapaxa1 lifgam1 viBakwiH1 id2 cid2 mid2 rt2 pUrvapaxa2 uwwarapaxa2 upasarga2 kqw1 kqw2 text_type
            else []
       | Kqw (id1,cid1,mid1,word1,_,_,_,kqw1,_,_,rt1,pUrvapaxa1,uwwarapaxa1,lifgam1,viBakwiH1,_,_) ->
            if prose_order id1 id2 text_type && not (viBakwiH2 = 8)
            &&  ( no_boundary_crossing_with_iwi id1 id2 text_type || viBakwiH1 = 8)
	    then if ((kqw1 ="Sawq_lat") || (kqw1 = "kwa")) (* In these cases, the kqxanwas can be kaarakas *)
            then let kqw1=0 in let kqw2=1 in anaBihiwe m1 m2 id1 cid1 mid1 rt1 word1 pUrvapaxa1 uwwarapaxa1 lifgam1 viBakwiH1 id2 cid2 mid2 rt2 pUrvapaxa2 uwwarapaxa2 upasarga2 kqw1 kqw2 text_type
            else let kqw1=1 in let kqw2=1 in anaBihiwe m1 m2 id1 cid1 mid1 rt1 word1 pUrvapaxa1 uwwarapaxa1 lifgam1 viBakwiH1 id2 cid2 mid2 rt2 pUrvapaxa2 uwwarapaxa2 upasarga2 kqw1 kqw2 text_type
            else []
       | Avy (id1,cid1,mid1,word1,_,_,uwwarapaxa1,_) -> 
           let  d12 = if id1 > id2 then id1-id2 else id2-id1 in
           if ((word1 = "yawaH") || (word1 = "wawaH")) 
           then if members_of rt2 upasarga2 apAxAna_verbs 
                then [ Relation (id1,cid1,mid1,"apA",id2,cid2,mid2,"4.43a",d12)]
                     (*; Relation (id1,cid1,mid1,"hewuH5",id2,cid2,mid2,"4.43b",d12) ]
		else [ Relation (id1,cid1,mid1,"hewuH5",id2,cid2,mid2,"4.43c",d12) ]  -- removed, since typically yawaH and wawaH mark the relation with the wif and not kqw *)
		else []
	   else []
       | _ -> []
       ]
   | Sup (id2,cid2,mid2,word2,rt2,pUrvapaxa2,uwwarapaxa2,lifgam2,viBakwiH2,_,_) -> 
       if (rt2 = "samBava" || rt2 = "viswAra")  (* samBava = sam+BU+ap; we still do not have kqw analyser that analyses with ap suffix  ; Add here all the words for which kqw analysis is not avalilable -- Amba 9.12.2025 *)
       then match m1 with
       [ Avy (id1,cid1,mid1,word1,_,_,uwwarapaxa1,_) -> 
           let  d12 = if id1 > id2 then id1-id2 else id2-id1 in
           if ((word1 = "yawaH") || (word1 = "wawaH")) 
           then [ Relation (id1,cid1,mid1,"apA",id2,cid2,mid2,"4.43a",d12)]
	   else []
       | _ -> []
       ] else []
  | _ -> []
  ]
  ;
(* Examples: grAmawaH ganwum icCanwam rAmam SyAmaH kaWAm kaWayawi *)
value rlapAxAna_wasil m1 m2 text_type = match m2 with
  [ Wif (id2,cid2,mid2,_,rt2,_,_,upasarga2,_,_,_,_,_,_,_,_)
  | Kqw (id2,cid2,mid2,_,rt2,upasarga2,_,_,_,_,_,_,_,_,_,_,_) 
  | Avykqw (id2,cid2,mid2,_,rt2,_,_,upasarga2,_,_,_,_) ->
     match m1 with
     [ AvywaxXiwa (id1,cid1,mid1,word1,rt1,_,_,taddhita1,_)->
       let  d12 = if id1 > id2 then id1-id2 else id2-id1 in
       if prose_order id1 id2 text_type  && taddhita1="wasil" && no_boundary_crossing_with_iwi id1 id2 text_type
       then if members_of rt2 upasarga2 apAxAna_verbs && (not(member_of rt1 guNavacana) || pronominal123 rt1)
       then [ Relation (id1,cid1,mid1,"apA",id2,cid2,mid2,"6.1",d12)] 
     (*  This leads to over generalisation, since only few waH ending words are kriyAviSeRaNas. We list them in the kriyAviSeRaNa list
 else if not (member_of rt1 xravyavAcI) 
       then [ Relation (id1,cid1,mid1,"kri_vi",id2,cid2,mid2,"5.2",d12)]  *)
       else if member_of (word1^" avy") kriyAviSeRaNas
       then [ Relation (id1,cid1,mid1,"kri_vi",id2,cid2,mid2,"6.2",d12)] 
       else [ Relation (id1,cid1,mid1,"hewuH5",id2,cid2,mid2,"6.3",d12)] 
       else []
     | Avy (id1,cid1,mid1,word1,_,_,uwwarapaxa1,_) -> 
       let  d12 = if id1 > id2 then id1-id2 else id2-id1 in
       if prose_order id1 id2 text_type && no_boundary_crossing_with_iwi id1 id2 text_type && (word1="wawaH" || word1="kuwaH")
       then if members_of rt2 upasarga2 apAxAna_verbs
            then [ Relation (id1,cid1,mid1,"apA",id2,cid2,mid2,"6.4",d12)] 
            else (*if id1 > 1  -- Why this condition necessary? kuwaH na pAsyAmi -- here it is hewuH5
                 then*) 
            if not (word1 = "wawaH")  (* this condition is added to handle several example from BhG such as मम योनिः महत् ब्रह्म अस्ति. तस्मिन् गर्भम् दधामि अहम्. सम्भवः सर्व-भूतानाम् ततः भवति भारत.*)
            then [ Relation (id1,cid1,mid1,"hewuH5",id2,cid2,mid2,"6.5",d12)] 
            else []
       else []
     |_ -> []
     ]
  | _ -> []
  ]
  ;

