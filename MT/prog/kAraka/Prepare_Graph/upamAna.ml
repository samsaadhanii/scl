open Pada_structure;
open Common;
open Adata;

value mark_upamAna id1 cid1 mid1 id2 cid2 mid2 word2 id3 cid3 mid3 rl1 rl2 =
         let d12 = if id1 > id2 then id1-id2 else id2-id1 in
         let d23 = if id2 > id3 then id2-id3 else id3-id2 in
         let d13 = if id1 > id3 then id1-id3 else id3-id1 in
         if (d12 > 4) || (d23 > 4) then []  (* the upamAna cannot be far away from the upamAna xyowaka *)
         else if  (id1 < id2) && (id2 < id3)  (* A iva B  / yaWA A B *)
      then  if id2 = next id1 
(* saH aBigawaH saxBiH samuxraH iva sinXuBiH *)
            then 
		 if (word2 = "yaWA") then
                 [ Relation (id3,cid3,mid3,"upamAna",id1,cid1,mid1,"91a",d13)
                 ; Relation (id2,cid2,mid2,"upamAna_xyo",id3,cid3,mid3,"92a",d12)
                 ]
		 else 
                 [ Relation (id1,cid1,mid1,"upamAna",id3,cid3,mid3,"91",d13)
                 ; Relation (id2,cid2,mid2,"upamAna_xyo",id1,cid1,mid1,"92",d12)
                 ]
            else  if id3 = next id2 then
		    if (word2 = "yaWA")
                    then [ Relation (id1,cid1,mid1,"upamAna",id3,cid3,mid3,"93",d13)
                         ; Relation (id2,cid2,mid2,"upamAna_xyo",id1,cid1,mid1,"94",d12)
                         ]
                    else [ Relation (id3,cid3,mid3,"upamAna",id1,cid1,mid1,"93a",d13)
                         ; Relation (id2,cid2,mid2,"upamAna_xyo",id3,cid3,mid3,"94a",d12)
                         ]
                  else [ Relation (id3,cid3,mid3,"upamAna",id1,cid1,mid1,"95",d13)]
      else if  id1 < id2 && id3 < id2 (* B A iva *)
           then  if  d12 > d23 
                 then  if id2 = next id3 
                   then [ Relation (id3,cid3,mid3,"upamAna",id1,cid1,mid1,"96",d13)
                        ; Relation (id2,cid2,mid2,"upamAna_xyo",id3,cid3,mid3,"97",d12)
                        ]
		   else if id2-id3 < 5 (* To ensure that the upamAna is not far away from iva *)
                   then [ Relation (id3,cid3,mid3,"upamAna",id1,cid1,mid1,"98",d13)]
		   else []
                 else if  d23 > d12 
                  then  if id2 = next id1 
                        then [ Relation (id1,cid1,mid1,"upamAna",id3,cid3,mid3,"99",d13)
                             ; Relation (id2,cid2,mid2,"upamAna_xyo",id1,cid1,mid1,"100",d12)
                             ]
		        else if id2-id1 < 5 (* To ensure that the upamAna is not far away from iva *)
                        then [ Relation (id1,cid1,mid1,"upamAna",id3,cid3,mid3,"101",d13)]
		        else []
	          else []
	  else []
;

value rlupamAna_upameya_sup m1 m2 m3 text_type = match m2 with
     [ Avy (id2,cid2,mid2,word2,_,_,_,_) -> 
        if word2 = "iva" || word2 = "yaWA" then match m3 with
        [ Sup (id3,cid3,mid3,_,rt3,_,uwwarapaxa3,_,viBakwiH3,_,_)
        | WaxXiwa (id3,cid3,mid3,_,rt3,_,_,uwwarapaxa3,_,viBakwiH3,_,_) ->   (* saH himavAn iva *)

        (*| Kqw (id3,cid3,mid3,_,_,_,_,_,_,_,_,_,_,_,_,viBakwiH3,_,_) *)
               (* if (not (member_of rt3 sambanXavAcI) || uwwarapaxa3="y")  -- to handle sva-aXIna-pawnI as a upamAna ; we can also have mAwA iva piwA api ...  Hence this condition is commented totally Similarly we can have upAXi as well e.g. rAjA iva prajA ...
                not (member_of rt3 upAXi) *)
               (*|| uwwarapaxa3="y" -- compound is allowed: xeva-mAyA iva nirmiwA sarva-lakRaNa-sampannA *)

            if   not (member_of rt3 guNavacana) 
              && not (member_of rt3 upAXi) 
              && not ( member_of rt3 saMKyeya || member_of rt3 pUraNa || member_of rt3 kqxanwas || member_of rt3 taddhitaantas || member_of rt3 guNavacana)

               (* && not (member_of rt3 manuRyasaFjFAvAcI)   xaSaraWena pAliwA inxreNa iva *)
                (*&& not (pronominal123 rt3)  -- saH parama-prIwaH baBUva piwAmahaH iva; here saH is the upameya *)
                (* && not (uwwarapaxa3="y") *) (* This is added on trial basis to avoid upamAna upameya to be compounds *)
             then match m1 with
             [ Sup (id1,cid1,mid1,_,rt1,_,uwwarapaxa1,_,viBakwiH1,_,_)
             | WaxXiwa (id1,cid1,mid1,_,rt1,_,_,uwwarapaxa1,_,viBakwiH1,_,_) ->  (* saH himavAn iva *)
                   if    viBakwiH1=viBakwiH3                   (* || viBakwiH3 = 1 *)
                      && not (member_of rt1 guNavacana) 
                      && not (member_of rt1 upAXi) 
                      && not ( member_of rt1 saMKyeya || member_of rt1 pUraNa || member_of rt1 kqxanwas || member_of rt1 taddhitaantas || member_of rt1 guNavacana)
                                (*&& not (pronominal123 rt1)  -- saH parama-prIwaH baBUva piwAmahaH iva; here saH is the upameya *)
                                (* && (not (member_of rt1 sambanXavAcI) || uwwarapaxa1="y")  (* to handle sva-aXIna-pawnI as a upamAna *)
                                   && not (member_of rt1 manuRyasaFjFAvAcI) *)
                                (* || uwwarapaxa1="y"  -- compound is allowed: xeva-mAyA iva nirmiwA sarva-lakRaNa-sampannA *)
                                (* && id2 < id3 aSmanA iva nirmiwaM xuRtAnAm hqxayam  *) 
                   then mark_upamAna id1 cid1 mid1 id2 cid2 mid2 word2 id3 cid3 mid3 "50.1" "50.2"
                   else []
             (*| Kqw (id1,cid1,mid1,_,rt1,_,_,_,_,_,_,_,_,_,_,viBakwiH1,_,_) ->
                   (* && id2 < id3 aSmanA iva nirmiwaM xuRtAnAm hqxayam  *) 
                   if viBakwiH1=viBakwiH3 && id1 = previous id2 
                     && not (member_of rt1 sambanXavAcI) 
                     && not (member_of rt1 upAXi) 
                     && not (member_of rt1 manuRyasaFjFAvAcI) 
                     && not ( member_of rt1 saMKyeya || member_of rt1 pUraNa || member_of rt1 kqxanwas || member_of rt1 taddhitaantas || member_of rt1 guNavacana)
                   then [ Relation (id2,cid2,mid2,"uwprekRA_xyo",id1,cid1,mid1,"50.3",1)]
                   else [] *)
             | _ -> []
             ]
	     else []
        | Wif (id3,cid3,mid3,_,_,_,_,_,_,_,_,_,_,_,_,_) -> 
	     if (id3 = previous id2) 
             then [ Relation (id2,cid2,mid2,"uwprekRA_xyo",id3,cid3,mid3,"50.4",1)]
             else
             match m1 with
             [ Wif (id1,cid1,mid1,_,_,_,_,_,_,_,_,_,_,_,_,_) ->
                   if id2 < id3
                   then mark_upamAna id1 cid1 mid1 id2 cid2 mid2 word2 id3 cid3 mid3 "50.5" "50.6"
                   else []
             | _ -> []
             ]
        (* | Kqw (id3,cid3,mid3,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_) -> 
             match m1 with
             [ Kqw (id1,cid1,mid1,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_) -> 
                   if id2 < id3
                   then mark_upamAna id1 cid1 mid1 id2 cid2 mid2 word2 id3 cid3 mid3 "50.7" "50.8"
                   else []
             | _ -> []
             ] *)
        | _ -> []
        ]
        else []
     | Sup (id2,cid2,mid2,_,rt2,_,uwwarapaxa2,_,viBakwiH2,_,_) ->
         match rt2 with
         [ "samAna" | "samAnA" | "saxqkRa" | 
           "saxqkRA" | "saxqkRI" | "saxqSA" | "saxqSa" | "saxqS" | 
           "wulya" | "wulyA" | "samA" -> match m3 with
           [ Sup (id3,cid3,mid3,_,rt3,_,uwwarapaxa3,_,viBakwiH3,_,_)
           | WaxXiwa (id3,cid3,mid3,_,rt3,_,_,uwwarapaxa3,_,viBakwiH3,_,_) ->   
               if not (member_of rt3 guNavacana) 
                && (not (member_of rt3 upAXi) || uwwarapaxa3="y")
                &&  not ( member_of rt3 saMKyeya || member_of rt3 pUraNa || member_of rt3 kqxanwas || member_of rt3 taddhitaantas || member_of rt3 guNavacana) then
               match m1 with
               [ Sup (id1,cid1,mid1,_,rt1,_,uwwarapaxa1,_,viBakwiH1,_,_)
               | WaxXiwa (id1,cid1,mid1,_,rt1,_,_,uwwarapaxa1,_,viBakwiH1,_,_) ->  
                   if viBakwiH3=1  && viBakwiH1=3
                      &&  not (member_of rt1 guNavacana) 
                     && (not (member_of rt1 upAXi) || uwwarapaxa1="y")
                     && not ( member_of rt1 saMKyeya || member_of rt1 pUraNa || member_of rt1 kqxanwas || member_of rt1 taddhitaantas || member_of rt1 guNavacana)
                   then mark_upamAna id1 cid1 mid1 id2 cid2 mid2 rt2 id3 cid3 mid3 "50.9" "50.10"
                   else []
               | _ -> []
               ] else []
            | _ -> []
            ]
          | _ -> []
          ]
     | _ -> []
     ]
;
(* saH prajApawi-samaH SrImAn aswi *)
(* value rlsamAsa_upamAna m1 m2 m3 text_type = match m2 with
   [ Sup (id2,cid2,mid2,word2,rt2,_,uwwarapaxa2,lifgam2,viBakwiH2,vacanam2,_) ->
       if (cid2 > 1) && (uwwarapaxa2 = "y")
       && ((rt2 = "sama") || (rt2 = "saxqSa"))
     then  match m3 with
     [ Sup (id3,cid3,mid3,word3,rt3,_,uwwarapaxa3,lifgam3,viBakwiH3,vacanam3,_) -> 
       let  d23 = if id2 > id3 then id2-id3 else id3-id2 in
       if noun_agreement_vibh vacanam2 vacanam3 lifgam2 lifgam3 viBakwiH2 viBakwiH3
       then  match m1 with
       [ Sup (id1,cid1,mid1,word1,rt1,pUrvapaxa1,_,_,_,_,_) -> 
            if (id1 = id2) && (cid1 = previous cid2)  && (pUrvapaxa1 = "y")
            then [ Relation (id1,cid1,mid1,"upamAna",id3,cid3,mid3,"18.1a",d23)
                 ; Relation (id2,cid2,mid2,"upamAna_xyo",id1,cid1,mid1,"18.1b",0)
                 ]
            else []
       | _ -> []
       ] else []
     | _ -> []
     ]  else []
   | _ -> []
   ]
;
*)
