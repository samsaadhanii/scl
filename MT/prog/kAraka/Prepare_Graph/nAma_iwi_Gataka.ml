open Pada_structure;
open Global_var; 
open Common;
open Adata;

(* value rl_iwi_Gataka m1 m2 m3 text_type = match m1 with
        [ Avy (id1,cid1,mid1,word1,_,_,_,_) -> 
          if not (word1="iwi") then []
          else match m2 with
             [ Sup (id2,cid2,mid2,_,rt2,_,_,_,_,_,_) ->
                if not (member_of rt2 saMKyeya) then []
                else match m3 with
                 [ Sup (id3,cid3,mid3,_,rt3,_,_,_,_,vacanam3,_)
                 | Kqw (id3,cid3,mid3,_,_,_,_,_,_,_,rt3,_,_,_,_,vacanam3,_)
                 | WaxXiwa (id3,cid3,mid3,_,rt3,_,_,_,_,_,vacanam3,_) ->  
                      let  d13 = if id1 > id3 then id1-id3 else id3-id1 in
                      if vacanam3="bahu" then
                      [Relation (id1,cid1,mid1,"Gataka_xyowakaH",id3,cid3,mid3,"40.9",d13)] 
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

(* iwi after any noun or verb is related to the previous word by sambanXa relation
;Note the direction also. Now iwi is the head, and not the verb. *)

(* What is the example for iwi after a verb, not having vAkyakarma relation but a sambanXa relation ?  -- AMBA 08Jun18
rAmaH iwi nAma ...: here rAmaH-iwi is sambanXa *)
value rl_last_iwi m1 m2 text_type = match m1 with
  [ Avy (id1,cid1,mid1,word1,_,_,_,_) ->
     if word1="iwi"
     then match m2 with
          (*| Wif (id2,cid2,mid2,_,_,_,_,_,_,_,_,_,_,_,_,_)
            | Avykqw (id2,cid2,mid2,_,_,_,_,_,_,_,_,_) *)
     [ Sup(id2,cid2,mid2,_,_,_,_,_,_,_,_) ->
          (*| Avy (id2,cid2,mid2,_,_,_,_,_)
            | Kqw (id2,cid2,mid2,_,_,_,_,_,_,_,_,_,_,_,_,_,_) *)
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

(* canxraH nAma BUpawiH prawivasawi sma
 wasya bahu-SakwiH ugra-SakwiH ananwa-SakwiH ca iwi wrayaH puwrAH Asan
   api ca miwraprApwi-miwraBexa-kAkolUkIya-labXapraNASa-aparIkRiwa-kArakANi iwi paFca wanwrANi racayiwvA wAn pATiwavAn *) 
value rl_nAma m1 m2 m3 text_type = match m3 with
  [ Sup (id3,cid3,mid3,_,rt3,_,_,lifgam3,viBakwiH3,vacanam3,_)
  | Kqw (id3,cid3,mid3,_,_,_,_,_,_,_,rt3,_,_,lifgam3,viBakwiH3,vacanam3,_)
  | WaxXiwa (id3,cid3,mid3,_,rt3,_,_,_,lifgam3,viBakwiH3,vacanam3,_) -> 
       match m1 with
       [ Sup (id1,cid1,mid1,_,rt1,_,_,lifgam1,viBakwiH1,_,_) ->
       (*| Kqw (id1,cid1,mid1,_,_,_,_,_,_,_,_,rt1,_,_,lifgam1,viBakwiH1,_,_)
       | WaxXiwa (id1,cid1,mid1,_,rt1,_,_,_,lifgam1,viBakwiH1,_,_) ->   
        I doubt if kqw or waxXiwa can be saFjFAs  I also think that we should check these names in the list of NERs  and they should be declared as sups *)
	if lifgam1 = lifgam3 then
        let  d13 = if id1 > id3 then id1-id3 else id3-id1 in
        match m2 with
             [ Avy (id2,cid2,mid2,word2,_,_,_,_) 
             | Sup (id2,cid2,mid2,word2,_,_,_,_,_,_,_) ->
               let  d12 = if id1 > id2 then id1-id2 else id2-id1 in
               if member_of rt3 manuRyasaFjFAvAcI &&  viBakwiH1 = 6 && (word2 = "nAma") (* wasyA nAma sIwA AsIw *)
               then [ Relation (id1,cid1,mid1,"RaRTIsambanXaH",id3,cid3,mid3,"39.4a",d13)
                    ;  Relation (id2,cid2,mid2,"karwA",id1,cid1,mid1,"39.5a",d12)
                    ]
               else if  (member_of rt3 jAwivAcaka) || (rt3="praBava") (* ikRvAku vaMSaH praBavaH rAmaH nAma janEH SruwaH *)
                    then if  (word2="nAma" || word2="iwi" (* we can have mArIca nAma rAkRaseNa ... paFca wanwrANi racayiwvA ... tested on mArIcaH nAma rAkRasaH *)
                           || (word2 = "nAmakaH" && lifgam1 = "puM")
                           || (word2 = "nAmakam" && lifgam1 = "napuM")
                           || (word2 = "nAmikA" && lifgam1 = "swrI"))
                         then if (* id2 < id3 ; This need not be just before the category
                                 e.g. X nAma ekam nagaram  -- see the presence of ekam! 
         		             id2 need not be < id3; rAkRasaM saMxaxarSa kabanXa nAma; here RAkRasaM (id3) is before nAma (id2)
                                  nAma1 -- similar to prawiyogi;
                                  nAma2 -- similar to anuyogi  *)
                                not (member_of rt3 saMKyeya)
                                  (* && (not (pronominal123 rt3) || rt3="kim") saFjFi can be a pronoun *)
                              && not (rt3="kiFciw" || rt3="kiFcana") 
                              then if id1=previous id2 && (word2="nAma"|| word2="nAmakaH" || word2 = "nAmikA" || word2 = "nAmakam") && viBakwiH1=viBakwiH3
                                   then [ Relation (id1,cid1,mid1,"saFjFA",id3,cid3,mid3,"39.2",d13)
                                        ;  Relation (id2,cid2,mid2,"saFjFA_xyowakaH",id1,cid1,mid1,"39.3",d12)
                                        ]
                                   else if word2="iwi" && viBakwiH1=1  && id1=previous id2 && vacanam3="eka" 
                                        then [ Relation (id1,cid1,mid1,"saFjFA",id3,cid3,mid3,"39.4",d13)
                                             ;  Relation (id2,cid2,mid2,"saFjFA_xyowakaH",id1,cid1,mid1,"39.5",d12)
                                             ]
			                else []
                              else []
                         else []
                     else  if (id1 < id2) && (id2=previous id3) && vacanam3="bahu" && viBakwiH3=1 && viBakwiH1=1 && member_of rt3 saMKyeya
                               then [ Relation (id1,cid1,mid1,"GatakaH",id3,cid3,mid3,"39.6",d13)
                                    ;  Relation (id2,cid2,mid2,"Gataka_xyowakaH",id3,cid3,mid3,"39.7",d12)
                                    ]
                              else []
              | _ -> []
              ] else []
      | _ -> []
      ]
  | _ -> []
  ]
;
