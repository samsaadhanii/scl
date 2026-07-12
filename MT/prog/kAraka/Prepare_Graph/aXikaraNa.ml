open Pada_structure;
open Global_var;
open Common;
open Adata;

value aXikaraNa_type word rt = 
          if member_of word kAlAXikaraNas then "kAla_aXi"
          else if member_of rt viRayAXikaraNa_nouns then "viRaya_aXi" 
          else if member_of word xeSAXikaraNas then "xeSa_aXi"
          else "aXikaraNa"
;

value kv_or_spl_aXi id1 cid1 mid1 id2 cid2 mid2 word text_type = 
          let d = if id1 > id2 then id1-id2 else id2-id1 in
          if no_boundary_crossing_with_iwi id1 id2 text_type || id1 = 1
          then if member_of (word^" avy") kriyAviSeRaNas
          then [ Relation (id1,cid1,mid1,"kri_vi",id2,cid2,mid2,"100.1",d)] 
          else if member_of word kAlAXikaraNas 
          then [ Relation (id1,cid1,mid1,"kAla_aXi",id2,cid2,mid2,"100.2",d) ]
          else if member_of word xeSAXikaraNas 
          then [ Relation (id1,cid1,mid1,"xeSa_aXi",id2,cid2,mid2,"100.3",d) ]
          else []
          else [] 
;

(* This is needed here, since waxA should not be marked as an aXikaraNa, if it occurs single with kwvA, lyap etc. *)
value rl_spl_aXikaraNam m1 m2 text_type = match m2 with
  [ Wif (id2,cid2,mid2,_,_,pUrvapaxa2,_,_,_,_,_,_,_,_,_,_) 
  | Kqw (id2,cid2,mid2,_,_,_,_,_,_,_,_,pUrvapaxa2,_,_,_,_,_) ->
     let kqw = get_kqw_suff m2
     and cat = get_kqw_suff m2 in
     if ((kqw = "anIyar" || kqw = "yaw" || kqw = "kwa" || kqw = "kwavawu"|| kqw = "wavyaw" || kqw = "lyut") && (pUrvapaxa2="n")) || (cat = "wif")
     then match m1 with
     [ Avy (id1,cid1,mid1,word1,_,_,uwwarapaxa1,_) -> 
           let  d12 = if id1 > id2 then id1-id2 else id2-id1 in
           if    prose_order id1 id2 text_type 
	      && no_boundary_crossing1 id1 id2 
           then match word1 with
           [ "yaxA" -> if id2 < waxA_pos.val
                       (* In the case of waxA, only if there is no finite verb, link it with the kqw *)
                        then [ Relation (id1,cid1,mid1,"kAla_aXi",id2,cid2,mid2,"9.1",d12) ]
                        else []
           |"waxA" -> match cat with
                       [ "kqw" ->  if finite_verb_in_sentence.val == 50
                                   then [ Relation (id1,cid1,mid1,"kAla_aXi",id2,cid2,mid2,"9.2",d12) ]
                                   else []
                       | "wif" -> [ Relation (id1,cid1,mid1,"kAla_aXi",id2,cid2,mid2,"9.3",d12) ]
                       | _ -> []
                       ]
           | "yawra" -> if (id2 < wawra_pos.val ) 
                         then [ Relation (id1,cid1,mid1,"xeSa_aXi",id2,cid2,mid2,"9.4",d12) ]
                         else []
           | "wawra" -> [ Relation (id1,cid1,mid1,"xeSa_aXi",id2,cid2,mid2,"9.5",d12) ]
           | _ -> []
           ]
           else []
     | _ -> []
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
                 then [ Relation (id1,cid1,mid1,"viRaya_aXi",id2,cid2,mid2,"9.9",d12)] 
                 else []
          | _ -> []
          ]
          else []
      | _ -> []
      ]
   | _ -> []
   ]
;

value rlaXikaraNam m1 m2 text_type = match m2 with
   [ Wif (id2,cid2,mid2,_,_,_,_,_,_,_,_,_,_,_,_,_) 
   | Kqw (id2,cid2,mid2,_,_,_,_,_,_,_,_,_,_,_,_,_,_)
   | Avykqw (id2,cid2,mid2,_,_,_,_,_,_,_,_,_) -> 
      match m1 with
      [ Sup (id1,cid1,mid1,word1,_,_,_,_,viBakwiH1,_,_)
      | WaxXiwa (id1,cid1,mid1,word1,_,_,_,_,_,viBakwiH1,_,_) 
      | Kqw (id1,cid1,mid1,word1,_,_,_,_,_,_,_,_,_,_,viBakwiH1,_,_) ->
             let  d12 = if id1 > id2 then id1-id2 else id2-id1 
             and  kqw = get_kqw_suff m1 in
             if   prose_order id1 id2 text_type && no_boundary_crossing_with_iwi id1 id2 text_type
               && not (kqw="Sawq_lat" || kqw="SAnac" || kqw="kwa" || kqw="kwavawu")
               && viBakwiH1 = 7
             then 
                  if member_of word1 kAlAXikaraNas
                  then  [ Relation (id1,cid1,mid1, "kAla_aXi",id2,cid2,mid2,"10.1",d12)] 
                  else if member_of word1 xeSAXikaraNas
                       then  [ Relation (id1,cid1,mid1, "xeSa_aXi",id2,cid2,mid2,"10.2",d12)] 
                       else []
             else []
      | _ -> []
      ]
   | _ -> []
   ]
;
