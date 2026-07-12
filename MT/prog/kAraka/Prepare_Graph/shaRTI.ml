open Pada_structure;
open Common;
open Adata;

value rlRaRTIsambanXaH m1 m2 text_type = match m1 with
      [ Sup (id1,cid1,mid1,_,rt1,pUrvapaxa1,_,lifga1,viBakwiH1,vacana1,_)
      | Kqw (id1,cid1,mid1,_,rt1,pUrvapaxa1,_,_,_,_,_,_,_,lifga1,viBakwiH1,vacana1,_)
      | WaxXiwa (id1,cid1,mid1,_,rt1,pUrvapaxa1,_,_,lifga1,viBakwiH1,vacana1,_) ->
           if not (pUrvapaxa1="y") && viBakwiH1=6 && (not (member_of rt1 guNavacana))
           then match m2 with 
                 [ Kqw (id2,cid2,mid2,word2,rt2,_,_,kqw2,_,_,_,pUrvapaxa2,uwwarapaxa2,_,viBakwiH2,_,_) -> 
                   let  d12 = if id1 > id2 then id1-id2 else id2-id1 in
		   if    prose_order id1 id2 text_type
                      && no_boundary_crossing_with_iwi id1 id2 text_type
                      && not (viBakwiH2 = 8)
                      && (kqw2="GaF" || kqw2="wavyaw" || kqw2="wqc" || kqw2 = "kwin" || kqw2 = "ac" || kqw2="Nvul")
                               (* With other kqw suffixes such as lyut etc., it is a kAraka RaRTI *)
                   then if  (not (member_of rt2 guNavacana)) 
                         ||  member_of rt2 viRayi_list 
                        then [ Relation (id1,cid1,mid1,"RaRTI_saM",id2,cid2,mid2,"28.1",d12)]
                        else []
                   else []
                 | Sup (id2,cid2,mid2,word2,rt2,pUrvapaxa2,uwwarapaxa2,_,viBakwiH2,_,_)
                 | WaxXiwa (id2,cid2,mid2,word2,rt2,pUrvapaxa2,uwwarapaxa2,_,_,viBakwiH2,_,_) -> 
       		   let  d12 = if id1 > id2 then id1-id2 else id2-id1 in
                   if     prose_order id1 id2 text_type (*&& not (uwwarapaxa2 = "y")*)
                       && not (pUrvapaxa2="y")
                       && not (viBakwiH2 = 8) 
                       && no_boundary_crossing_with_iwi id1 id2 text_type
	   	       && not (pronominal123 rt2)
                    then if  member_of rt2 sambanXavAcI || member_of rt2 viRayi_list 
                         then [ Relation (id1,cid1,mid1,"RaRTI_saM",id2,cid2,mid2,"28.5a",d12)]
                         else  match rt2 with
                         [ "xayA" | "kqpA"| "karuNA"| "mAyA"| "priya" (* saH mama priyaH aswi *)
                         | "kqRNa" (* guru & kqRNa are both guNavacana as well as nouns in different meanings  -- as a noun, it can have a RaRTI sambanXa *)
                         | "ayuwa"|"sahasra"  (* ayuwa = 10 thousand; gavAM ayuwaM thousands of cows *)
                               -> if vacana1 = "bahu"
                                  then [ Relation (id1,cid1,mid1,"RaRTI_saM",id2,cid2,mid2,"28.5a",d12)]
                                  else []
                         | "AwmA"   (* rAmasya Awma *)
                         | "vaXa"   (* han1 + ap *)
                               -> [ Relation (id1,cid1,mid1,"RaRTI_saM",id2,cid2,mid2,"28.5",d12)]
                         | "maXya" ->  if vacana1 = "xvi"
                                       then [ Relation (id1,cid1,mid1,"RaRTI_saM",id2,cid2,mid2,"28.5a",d12)]
                                       else []
                         | "uBa" 
                         | "uBA"
                         | "arWa"
                         | "jAyas"
                         | "jAyasI" -> []
                         | _ ->  if    not (member_of rt2 guNavacana) 
                                    && not (member_of rt2 saMKyeya) 
                                    && not (member_of rt2 non_RaRTI_list) (* These are the words which can not be related to a word in RaRTI. e.g. paryApwa  We can not have X{6} paryApwa *)
                                    && not (member_of rt2 manuRyasaFjFAvAcI) (* These are the names of human beings, and hence we can not have X{6} rt2 *)
                                    && not (member_of rt2 named_entity) (* These are the names of entities, and hence we can not have X{6} rt2 *)
                                    && not (member_of rt2 upapada6_list) (* This is needed, since in these cases the relation is sanxarBa_binxuH *)
                                    && not (pronominal123 rt2) (* sEnyasya mama; mama should be related to sEnya and not the other way *)
                                    && not (member_of rt2 taddhitaantas)
                                then  [ Relation (id1,cid1,mid1,"RaRTI_saM",id2,cid2,mid2,"28.8",d12)]
                   	        else  []
                          ]
                     else  []
                 | Avy (id2,cid2,mid2,word2,_,pUrvapaxa2,_,_) ->
                       let  d12 = if id1 > id2 then id1-id2 else id2-id1 in
                       if word2 = "nAma"
                       && not (pUrvapaxa2="y")
                       then [ Relation (id1,cid1,mid1,"RaRTI_saM",id2,cid2,mid2,"28.11",d12)]
		       else []
                 | _ -> []
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
       if   id2 > id1 (* id2 = next id1; we may have some kriyAviSeRaNa etc in between; e.g. BavawAm ekawra avasWAnam *)
         && viBakwiH1=6
         && no_boundary_crossing_with_iwi id1 id2 text_type
         && not (
                 (kqw2="Sawq_lat" && not (rt2="xviR1")) 
              || (kqw2="ukaF" && not (kqw_rt2="kAmuka")) 
              || kqw2="SAnac_lat" || kqw2="Kal" || kqw2="yuc" || kqw2="u" || kqw2="wqN" || kqw2="SAnan" 
              || kqw2="cAnaS" || kqw2="wqc" || kqw2="kAnac" || kqw2="kvasu" || kqw2="ki" 
              || kqw2="kin" || kqw2="kwvA" || kqw2="Namul" || kqw2="kvasun" || kqw2="wosun" || kqw2="lyap" 
              || kqw2="wumun" || kqw2="se" || kqw2="ase" || kqw2="ken"
              || (kqw2="kwa" && not(rt2="man1" || rt2="buX1" || rt2="buX2" || rt2="buX3" || rt2="pUj1"))
              (* || kqw2 = "Nyaw" *)
         )
       then match verb_type rt2 upasarga2 with
           [ "xvikarmaka1" 
           | "xvikarmaka2" -> [ Relation (id1,cid1,mid1,"muKya_karma",id2,cid2,mid2,"29.1",d12)
                              ; Relation (id1,cid1,mid1,"gONa_karma",id2,cid2,mid2,"29.2",d12)
                              ]
           | "akarmaka" ->    [ Relation (id1,cid1,mid1,"karwA",id2,cid2,mid2,"29.3",d12)]
           | _ ->             [ Relation (id1,cid1,mid1,"karwA",id2,cid2,mid2,"29.4",d12)
                              ; Relation (id1,cid1,mid1,"karma",id2,cid2,mid2,"29.5",d12)
                              ]
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
       then  [ Relation (id1,cid1,mid1,"karma",id2,cid2,mid2,"31.2",d12) 
             ]
       else []
     |_ -> []
     ]
   |_ -> []
 ]
;

value rlhewuprayoge m1 m2 m3 text_type = match m3 with
     [ Wif (id3,cid3,mid3,_,_,_,_,_,_,_,_,_,_,_,_,_) -> match m2 with
       [ Sup(id2,cid2,mid2,_,rt2,_,_,_,viBakwiH2,_,_) ->
          match m1 with
          [ Sup(id1,cid1,mid1,_,rt1,_,_,_,viBakwiH1,_,_) ->
             let  d12 = if id1 > id2 then id1-id2 else id2-id1 
             and  d13 = if id1 > id3 then id1-id3 else id3-id1 in
                  if    rt2="hewu"    (* RaRTI hewuprayoge 2.3.26 *) 
                     && viBakwiH1=6   (* annasya hewoH vasawi *)
                     && id1=previous id2
                  then [ Relation (id1,cid1,mid1,"hewu",id3,cid3,mid3,"32.1",d13)
                       ; Relation (id2,cid2,mid2,"vAkya:kAraNa_xyo",id1,cid1,mid1,"32.2",d12)
                       ]
                  else if   pronoun3 rt1   
                            (* sarvanAmnAswqwIyA ca 2.3.27
                            nimiwwakAraNahewuRu sarvAsAM prAyaxarSanaM  kasya hewoH, kena hewunA, kam hewum, kasmin hewO *)
                         && (viBakwiH1 = 3 || viBakwiH1 = 2) 
                         && (rt2 = "hewu" || rt2 = "kAraNa" || rt2 = "prayojana" || rt2 = "nimiwwa")
                         && viBakwiH1=viBakwiH2
                         && id1=previous id2
                       then [ Relation (id1,cid1,mid1,"hewu",id3,cid3,mid3,"32.1",d13)
                            ; Relation (id2,cid2,mid2,"vAkya:kAraNa_xyo",id1,cid1,mid1,"32.2",d12)
                            ]
                       else []
          | _ -> []
          ]
     | _ -> []
     ]
   | _ -> []
   ]
;

