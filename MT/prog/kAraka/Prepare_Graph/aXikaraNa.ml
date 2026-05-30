open Pada_structure;
open Global_var;
open Common;
open Adata;

value aXikaraNa_type word rt = 
          if member_of word kAlAXikaraNas then "kAlAXikaraNam"
          else if member_of rt viRayAXikaraNa_nouns then "viRayAXikaraNam" 
          else if member_of word xeSAXikaraNas then "xeSAXikaraNam"
          else "aXikaraNam"
;

value kv_or_spl_aXi id1 cid1 mid1 id2 cid2 mid2 word text_type = 
          let d = if id1 > id2 then id1-id2 else id2-id1 in
          if no_boundary_crossing_with_iwi id1 id2 text_type || id1 = 1
          then if member_of (word^" avy") kriyAviSeRaNas
          then [ Relation (id1,cid1,mid1,"kriyAviSeRaNam",id2,cid2,mid2,"100.1",d)] 
          else if member_of word kAlAXikaraNas 
          then [ Relation (id1,cid1,mid1,"kAlAXikaraNam",id2,cid2,mid2,"100.2",d) ]
          else if member_of word xeSAXikaraNas 
          then [ Relation (id1,cid1,mid1,"xeSAXikaraNam",id2,cid2,mid2,"100.3",d) ]
          else []
          else [] 
;

value spl_aXikaraNa id1 id2 cid1 cid2 mid1 mid2 word1 text_type wif_kqw rl1 rl2 rl3 rl4 =
       let  d12 = if id1 > id2 then id1-id2 else id2-id1 in
       if    prose_order id1 id2 text_type 
	  && no_boundary_crossing1 id1 id2 
       then
          if (word1="yaxA" && id2 < waxA_pos.val )
                  (* In the case of waxA, only if there is no finite verb, link it with the kqw *)
          then [ Relation (id1,cid1,mid1,"kAlAXikaraNam",id2,cid2,mid2,rl1,d12) ]
          else if (word1="waxA" && finite_verb_in_sentence.val == 50 && wif_kqw="kqw")
               then [ Relation (id1,cid1,mid1,"kAlAXikaraNam",id2,cid2,mid2,rl2,d12) ]
               else if (word1="waxA" && finite_verb_in_sentence.val < 50 && wif_kqw="wif")
                    then [ Relation (id1,cid1,mid1,"kAlAXikaraNam",id2,cid2,mid2,rl3,d12) ]
                    else if (word1="yawra" && id2 < wawra_pos.val ) || word1="wawra"
                         then [ Relation (id1,cid1,mid1,"xeSAXikaraNam",id2,cid2,mid2,rl4,d12) ]
                         else []
       else []
;

(* This is needed here, since waxA should not be marked as an aXikaraNa, if it occurs single with kwvA, lyap etc. *)
value rl_spl_aXikaraNam m1 m2 text_type = match m2 with
  [ Wif (id2,cid2,mid2,_,_,_,_,_,_,_,_,_,_,_,_,_) ->
     match m1 with
     [ Avy (id1,cid1,mid1,word1,_,_,uwwarapaxa1,_) -> 
           spl_aXikaraNa id1 id2 cid1 cid2 mid1 mid2 word1 text_type "wif" "9.1" "9.2" "9.3" "9.4"
     | _ -> []
     ]
  | Kqw (id2,cid2,mid2,_,_,_,_,kqw2,_,_,_,pUrvapaxa2,_,_,_,_,_) ->
     if (kqw2 = "anIyar" || kqw2 = "yaw" || kqw2 = "kwa" || kqw2 = "kwavawu"|| kqw2 = "wavyaw" || kqw2 = "lyut") && (pUrvapaxa2="n")
     then match m1 with
     [ Avy (id1,cid1,mid1,word1,_,_,uwwarapaxa1,_) -> 
         spl_aXikaraNa id1 id2 cid1 cid2 mid1 mid2 word1 text_type "kqw" "9.5" "9.6" "9.7" "9.8"
     |_ -> []
     ]
     else []
  | _ -> []
  ]
  ;


value rlviRayAXikaraNam m1 m2 text_type = match m2 with
   [ Sup (id2,cid2,mid2,_,rt2,_,_,_,_,_,_)
   | Kqw (id2,cid2,mid2,_,_,_,_,_,_,_,rt2,_,_,_,_,_,_)
   | WaxXiwa (id2,cid2,mid2,_,rt2,_,_,_,_,_,_,_) -> 
      match m1 with
      [ Sup (id1,cid1,mid1,_,_,_,_,_,viBakwiH1,_,_)
      | Kqw (id1,cid1,mid1,_,_,_,_,_,_,_,_,_,_,_,viBakwiH1,_,_)
      | WaxXiwa (id1,cid1,mid1,_,_,_,_,_,_,viBakwiH1,_,_) ->
          let  d12 = if id1 > id2 then id1-id2 else id2-id1 in
          if prose_order id1 id2 text_type && no_boundary_crossing_with_iwi id1 id2 text_type
          then match viBakwiH1 with
          [ 7 -> if member_of rt2 viRayAXikaraNa_nouns
                 then [ Relation (id1,cid1,mid1,"viRayAXikaraNam",id2,cid2,mid2,"9.9",d12)] 
                 else []
          | _ -> []
          ]
          else []
      | _ -> []
      ]
   | _ -> []
   ]
;

value xeSakAlAXikaraNam id1 cid1 mid1 id2 cid2 mid2 word1 rl1 rl2 =
       let  d12 = if id1 > id2 then id1-id2 else id2-id1 in
       if member_of word1 kAlAXikaraNas
       then  [ Relation (id1,cid1,mid1, "kAlAXikaraNam",id2,cid2,mid2,rl1, d12)] 
       else if member_of word1 xeSAXikaraNas
            then  [ Relation (id1,cid1,mid1, "xeSAXikaraNam",id2,cid2,mid2,rl2, d12)] 
            else []
;

value rlaXikaraNam m1 m2 text_type = match m2 with
   [ Wif (id2,cid2,mid2,_,_,_,_,_,_,_,_,_,_,_,_,_) 
   | Kqw (id2,cid2,mid2,_,_,_,_,_,_,_,_,_,_,_,_,_,_)
   | Avykqw (id2,cid2,mid2,_,_,_,_,_,_,_,_,_) -> 
      match m1 with
      [ Sup (id1,cid1,mid1,word1,_,_,_,_,viBakwiH1,_,_)
      | WaxXiwa (id1,cid1,mid1,word1,_,_,_,_,_,viBakwiH1,_,_) ->
             if prose_order id1 id2 text_type && no_boundary_crossing_with_iwi id1 id2 text_type
             then xeSakAlAXikaraNam id1 cid1 mid1 id2 cid2 mid2 word1 "10.1" "10.2"
             else []
      | Kqw (id1,cid1,mid1,word1,_,_,_,kqw_prawyayaH1,_,_,rt1,_,_,_,viBakwiH1,_,_) ->
             if    not (kqw_prawyayaH1="Sawq_lat"
                     || kqw_prawyayaH1="SAnac"
                     || kqw_prawyayaH1="kwa"
                     || kqw_prawyayaH1="kwavawu")
                &&  prose_order id1 id2 text_type && no_boundary_crossing_with_iwi id1 id2 text_type
            then xeSakAlAXikaraNam id1 cid1 mid1 id2 cid2 mid2 word1 "10.1" "10.2"
            else []
              (* covered in BAvalakRaNa sapwamI
                praBAwe -- Sawq_lat; is aXikaraNa  Hence above condition is commented 14 April 2017
                ... gacCawi ... paTawi; here gacCawi is marked as aXikaraNa. 
                To stop this, again this is uncommented. 26th May 2018 *)

      | _ -> []
      ]
   | _ -> []
   ]
;
