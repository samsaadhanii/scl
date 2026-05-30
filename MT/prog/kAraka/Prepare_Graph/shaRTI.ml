open Pada_structure;
open Common;
open Adata;

value rlRaRTIsambanXaH m1 m2 text_type = match m1 with
      [ Sup (id1,cid1,mid1,_,rt1,pUrvapaxa1,_,lifga1,viBakwiH1,vacana1,_)
      | Kqw (id1,cid1,mid1,_,rt1,pUrvapaxa1,_,_,_,_,_,_,_,lifga1,viBakwiH1,vacana1,_)
      | WaxXiwa (id1,cid1,mid1,_,rt1,pUrvapaxa1,_,_,lifga1,viBakwiH1,vacana1,_) ->
           if not (pUrvapaxa1="y") && viBakwiH1=6  (*&& (not (member_of rt1 guNavacana)  THIS is removed, since there can be an ellipsis of the viSeRya ||  rt1="xayA" || rt1 = "mAyA") *)
           then match m2 with 
                 [ Kqw (id2,cid2,mid2,word2,rt2,_,_,kqw2,_,_,_,pUrvapaxa2,uwwarapaxa2,_,viBakwiH2,_,_) -> 
                   let  d12 = if id1 > id2 then id1-id2 else id2-id1 in
		   if   prose_order id1 id2 text_type
                     && not (pUrvapaxa2="y")
                   then if no_boundary_crossing_with_iwi id1 id2 text_type
                        && ((kqw2="GaF" || kqw2="wavyaw" || kqw2="wqc" || kqw2 = "kwin" || kqw2 = "ac" || kqw2="Nvul"))
                         (*|| (kqw2="kwa" && not (viBakwiH2 = 1))  -- Need example for kwa *)
                                (* Rules for kAraka RaRTI are given below.
                                 * Here we are dealing with only SeRe RaRTI *)
				(* pawriNAm viruwena Removed Sawq_l?t, SAnac_l?t, kwa and kwavawu *)
                       && not (viBakwiH2 = 8)
                       && (not (member_of rt2 guNavacana) || (rt2="xayA") || (rt2 = "kqpA") || (rt2 = "karuNA") || (rt2 = "mAyA"))
			&& not (pronominal123 rt2)
                       then [ Relation (id1,cid1,mid1,"RaRTIsambanXaH",id2,cid2,mid2,"28.1",d12)]
                       else if   pUrvapaxa2="y"     (* asamartha padavidhi - xevaxawwasya guru-kulam; piwuH vacana-nirxeSAw *)
                            then if   member_of rt2 sambanXavAcI 
                                    || word2="hiwa-" 
                                    || word2="vacana-"  (* We should add all rUDa kqxanwas here *) (*rAmasya hiwakAmyayA, rAmasya vacanAnusAreNa *)
                                     (* asamarWa compound *)
                                 then [ Relation (id1,cid1,mid1,"RaRTIsambanXaH",id2,cid2,mid2,"28.2",d12)]
                   			(* We need to mark this relation with the puurvapaxa and not the uwwarapaxa *)
                   		 else [ Relation (id1,cid1,mid1,"RaRTIsambanXaH",id2,cid2,mid2,"28.3",d12)]
                           else if member_of rt2 viRayi_list || member_of rt1 sambanXavAcI
                                then [ Relation (id1,cid1,mid1,"RaRTIsambanXaH",id2,cid2,mid2,"28.4",d12)]
                                else []
                   else []
                 | Sup (id2,cid2,mid2,word2,rt2,pUrvapaxa2,uwwarapaxa2,_,viBakwiH2,_,_)
                 | WaxXiwa (id2,cid2,mid2,word2,rt2,pUrvapaxa2,uwwarapaxa2,_,_,viBakwiH2,_,_) -> 
       		   let  d12 = if id1 > id2 then id1-id2 else id2-id1 in
                   if     prose_order id1 id2 text_type (*&& not (uwwarapaxa2 = "y")*)
                       && not (pUrvapaxa2="y")
                          then if no_boundary_crossing_with_iwi id1 id2 text_type
                               && (not (member_of rt2 guNavacana) || (rt2="xayA") || (rt2 = "kqpA") || (rt2 = "karuNA") || (rt2 = "mAyA") || (rt2="guru") || (rt2 = "kqRNa")|| (rt2="priya")) (* saH mama priyaH aswi *)
				(* guru & kqRNa are both guNavacana as well as nouns in different meanings  -- as a noun, it can have a RaRTI sambanXa *)
			       && not (pronominal123 rt2)
                               then [ Relation (id1,cid1,mid1,"RaRTIsambanXaH",id2,cid2,mid2,"28.5",d12)]
                               else if (rt2="ayuwa") || (rt2="sahasra")  (* ayuwa = 10 thousand; gavAM ayuwaM thousands of cows *)
                                    then [ Relation (id1,cid1,mid1,"RaRTIsambanXaH",id2,cid2,mid2,"28.5a",d12)]
                                    else if   pUrvapaxa2="y"     (* asamartha padavidhi - xevaxawwasya guru-kulam; piwuH vacana-nirxeSAw *)
                                         then if   member_of rt2 sambanXavAcI 
                                                || word2="hiwa-" 
                                                || word2="vacana-"  (* We should add all rUDa kqxanwas here *) (*rAmasya hiwakAmyayA, rAmasya vacanAnusAreNa *)
                                                   (* asamarWa compound *)
                                                || (not (lifga1="napuM") || (rt1="vyAkaraNa"))
                                              then [ Relation (id1,cid1,mid1,"RaRTIsambanXaH",id2,cid2,mid2,"28.2",d12)]
                                              else []
                                        else if (rt2="vaXa")   (* han1 + ap *)
                                             then [ Relation (id1,cid1,mid1,"RaRTIsambanXaH",id2,cid2,mid2,"28.5a",d12)]
					     else if member_of rt1 sambanXavAcI || member_of rt2 viRayi_list 
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
                                                           && not (rt2="jyAyas") (* This has IyasUna suffix, sense of warap is there *)
                                                           && not (rt2="jyAyasI") (* This has IyasUna suffix, sense of warap is there *)
                                                         (* && (not (member_of rt2 guNavacana)) *)
                                                         && (not ((rt1="uBa" || rt1="uBA") && viBakwiH1=6))
                                                           then  [ Relation (id1,cid1,mid1,"RaRTIsambanXaH",id2,cid2,mid2,"28.8",d12)]
                   					   else  []
                   	else  []
                 (*| Avykqw (id2,cid2,mid2,word2,_,_,_,_,_,_,_,_)
                 | AvywaxXiwa (id2,cid2,mid2,word2,_,pUrvapaxa2,_,_,_) ->
                   let  d12 = if id1 > id2 then id1-id2 else id2-id1 in
                   if    prose_order id1 id2 text_type
                      && not (pUrvapaxa2="y")
                      && (no_boundary_crossing_with_iwi id1 id2)
                   then [ Relation (id1,cid1,mid1,"RaRTIsambanXaH",id2,cid2,mid2,"28.11",d12)]
                   else []
                  There can not be RaRTI sambanXa with kwvA, mawup etc.*)
                 | Avy (id2,cid2,mid2,word2,_,pUrvapaxa2,_,_) ->
                       let  d12 = if id1 > id2 then id1-id2 else id2-id1 in
                       if word2 = "nAma"
                       && not (pUrvapaxa2="y")
                       then [ Relation (id1,cid1,mid1,"RaRTIsambanXaH",id2,cid2,mid2,"28.11",d12)]
		       else []
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
  [ Kqw (id2,cid2,mid2,_,kqw_rt2,upasarga2,_,kqw2,_,_,rt2,_,_,_,_,_,_) ->
     match m1 with
     [ Sup (id1,cid1,mid1,_,_,_,_,_,viBakwiH1,_,_)
     | Kqw (id1,cid1,mid1,_,_,_,_,_,_,_,_,_,_,_,viBakwiH1,_,_)
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
  [ Kqw (id2,cid2,mid2,rt2,upasarga2,_,_,kqw2,_,_,_,_,_,_,_,_,_) ->
     match m1 with
     [ Sup (id1,cid1,mid1,_,_,_,_,_,viBakwiH1,_,_)
     | Kqw (id1,cid1,mid1,_,_,_,_,_,_,_,_,_,_,_,viBakwiH1,_,_)
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
  [ Avykqw (id2,cid2,mid2,_,_,_,_,_,_,kqw2,_,_) ->
     match m1 with
     [ Sup (id1,cid1,mid1,_,_,_,_,_,viBakwiH1,_,_)
     | Kqw (id1,cid1,mid1,_,_,_,_,_,_,_,_,_,_,_,viBakwiH1,_,_)
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

