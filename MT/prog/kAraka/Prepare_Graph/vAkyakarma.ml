open Pada_structure;
open Common;
open Adata;

(*
rAmaH avaxaw yaw aham gacCAmi
Replacing iwi with yaw will result in the mirror image; ->  'X iwi Y'  is same as 'Y yaw X'
*)

(* saH avaxaw yaw aham gacCAmi *)

value rlvAkyakarma1 m1 m2 m3 text_type = match m3 with
       [ Wif (id3,cid3,mid3,_,_,_,_,_,_,_,_,_,_,_,_,_) 
       | Kqw (id3,cid3,mid3,_,_,_,_,_,_,_,_,_,_,_,_,_,_) -> 
    (* | Avykqw (id3,cid3,mid3,_,_,_,_,_,_,_,_,_,_) -> Any example for Avykqw ? *)
           let kqw3 = get_kqw_suff m1 in
           if kqw3 ="kwa" || kqw3 = "kwavawu" || kqw3 = "" (* in case of wif *)
           then match m2 with
           [ Avy (id2,cid2,mid2,word2,_,_,_,_) ->
             if    prose_order id2 id3 text_type
                && no_boundary_crossing id2 id3 text_type
                && word2="yaw"
             then match m1 with
             [ Wif (id1,cid1,mid1,_,rt1,_,_,upasarga1,_,_,_,_,_,_,_,_) 
             | Kqw (id1,cid1,mid1,_,rt1,upasarga1,_,_,_,_,_,_,_,_,_,_,_) -> 
         (*  | Avykqw (id1,cid1,mid1,_,rt1,_,_,upasarga1,_,_,_,__) -> *)
                  let kqw = get_kqw_suff m1 in
                  if kqw ="kwa" || kqw = "kwavawu" || kqw = "" (* in case of wif *)
                     (* Need examples where we get kqw  with yaw *)
                  then 
                    let  d13 = if id1 > id3 then id1-id3 else id3-id1 
                    and  d23 = if id2 > id3 then id2-id3 else id3-id2 in
                       if    prose_order id1 id2 text_type
                          && no_boundary_crossing id1 id3 text_type
                          && members_of rt1 upasarga1 vAkyakarma_verbs
                       then [ Relation (id2,cid2,mid2,"vAkya:karma_xyo",id3,cid3,mid3,"46.11", d23)
                            ; Relation (id3,cid3,mid3,"vAkya:karma",id1,cid1,mid1,"46.12", d13)
                            ]
                       else []
                 else []
             | _ -> []
             ]
             else []
           | _ -> []
           ]
           else []
      | _ -> []
    ]
;

value vAkyakarma_iwi id1 id2 id3 cid1 cid2 cid3 mid1 mid2 mid3 text_type rl1 rl2 =
       let  d12 = if id1 > id2 then id1-id2 else id2-id1 in
        let   d13 = if id1 > id3 then id1-id3 else id3-id1 in
               if   no_boundary_crossing id1 id3 text_type
                 && no_boundary_crossing id1 id2 text_type
               then [ Relation (id2,cid2,mid2,"vAkya:karma_xyo",id1,cid1,mid1,rl1,d12)
               ; Relation (id1,cid1,mid1,"vAkya:karma",id3,cid3,mid3,rl2,d13)
               ]
               else []
;
(*
SrUyawAm iwi Amanwrya rAmaH avocaw.
praBAwe aham rAjasaBAm gawvA kA vArwA iwi paSyAmi. 
aham gacCAmi iwi rAmaH avaxaw
   BhG 1.23-24; evam ukwvA hqRIkeSaH gudAkeSena BArawa, uvAca pArWa paSya ewAn samavewAn kurun iwi 
   id1 = --; id2 = 2 (evam) id3 = ukwvA;
   d1 = paSya; id2 = iwi; id3 = uvAca 
*)
value rlvAkyakarma m1 m2 m3 text_type = match m2 with
      [ Avy (id2,cid2,mid2,word2,_,_,_,_) ->
           if (word2="iwi" || word2="evam") 
           then match m3 with
           [ Wif (id3,cid3,mid3,_,rt3,_,_,upasarga3,_,_,_,_,_,_,_,_)
           | Kqw (id3,cid3,mid3,_,rt3,upasarga3,_,_,_,_,_,_,_,_,_,_,_)
           | Avykqw (id3,cid3,mid3,_,rt3,_,_,upasarga3,_,_,_,_) ->
              let   d23 = if id2 > id3 then id2-id3 else id3-id2 in
              if id2=1 && members_of rt3 upasarga3 vAkyakarma_verbs
		(* evam ukwvA saH agacCaw.  iwi ukwvA saH agacCaw *)
              then [ Relation (id2,cid2,mid2,"vAkya:karma",id3,cid3,mid3,"45.1",d23)]
              else if   prose_order id2 id3 text_type 
                     && members_of rt3 upasarga3 vAkyakarma_verbs
                   then  match m1 with
                   [ Wif (id1,cid1,mid1,_,_,_,_,_,_,_,_,_,_,_,_,_) 
                   | Kqw (id1,cid1,mid1,_,_,_,_,_,_,_,_,_,_,_,_,_,_) ->
                       if id1 < id2 
                       then vAkyakarma_iwi id1 id2 id3 cid1 cid2 cid3 mid1 mid2 mid3 text_type "45.2" "45.3"
                       else []
                   | Sup (id1,cid1,mid1,word1,rt1,_,_,_,viBakwiH1,_,_) -> 
                       if id1 = previous id2 && viBakwiH1=1
                       then vAkyakarma_iwi id1 id2 id3 cid1 cid2 cid3 mid1 mid2 mid3 text_type "45.4" "45.5"
                       else []
                   | _ -> []
                   ]
                  else []
           | Sup (id3,cid3,mid3,word3,rt3,_,_,_,_,_,_) -> 
                 if rt3="mawi" || rt3 = "mawa" || rt3 = "nirNaya" || rt3 = "apavAxa" (* loka-apavAxaH *)
                 then match m1 with
                 [ Wif (id1,cid1,mid1,_,_,_,_,_,_,_,_,_,_,_,_,_)
                 | Kqw (id1,cid1,mid1,_,_,_,_,_,_,_,_,_,_,_,_,_,_) ->
                    if id1 = previous id2 
                    then vAkyakarma_iwi id1 id2 id3 cid1 cid2 cid3 mid1 mid2 mid3 text_type "45.6" "45.7"
                    else []
                 | _ -> []
                 ]
                 else []
           | _ -> []
           ]
           else []
    | _ -> []
    ]
;
