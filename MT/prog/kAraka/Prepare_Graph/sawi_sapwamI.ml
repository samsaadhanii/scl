open Pada_structure;
open Common;
open Adata;

value bhAvalakRaNa_sapwamI id1 id2 id3 cid1 cid2 cid3 mid1 mid2 mid3 text_type kqw1 karwA_karma rl1 rl2 rl3 =
 if (karwA_karma = "" ) then [] 
 else let  d13 = if id1 > id3 then id1-id3 else id2-id1 in
       let  d23 = if id2 > id3 then id2-id3 else id2-id1 in
        if   prose_order id1 id2 text_type 
           && no_boundary_crossing_except_kwvA id1 id2 text_type
        then if  (kqw1="Sawq_lat" || kqw1="SAnac_lat")
             then [ Relation (id1,cid1,mid1,karwA_karma,id3,cid3,mid3,rl1,d13)
                  ; Relation (id3,cid3,mid3,"BAva_samAna",id2,cid2,mid2,rl1,d23)
                  ] 
             else if (kqw1="kwa" || kqw1="kwavawu")
                  then [ Relation (id1,cid1,mid1,karwA_karma,id3,cid3,mid3,rl3,d13)
                       ; Relation (id3,cid3,mid3,"BAva_pU",id2,cid2,mid2,rl2,d23)
                       ]
                  else if (kqw1="Sawq_lqt" || kqw1="SAnac_lqt")
                       then [ Relation (id1,cid1,mid1,karwA_karma,id3,cid3,mid3,rl3,d13)
                            ; Relation (id3,cid3,mid3,"BAva_ananwara",id2,cid2,mid2,rl1,d23)
                            ] 
                       else []
        else []
;

(* rAme vanam gawe sawi sIwA api gacCawi *)
value rlBAvalakRaNa_sapwamI1 m1 m2 m3 text_type = match m3 with
  [ Kqw (id3,cid3,mid3,_,rt3,upasarga3,_,kqw3,_,_,_,_,_,lifgam3,viBakwiH3,_,_) -> 
      if  (kqw3="Sawq_lat" || kqw3="SAnac_lat" || kqw3="kwa" || kqw3="kwavawu" || kqw3="Sawq_lqt" || kqw3="SAnac_lqt")
       && ((viBakwiH3=7  && lifgam3="puM")
         (* 2.3.36; yasya_ca_BAvena_BAvalakRaNam; *)
        || viBakwiH3 = 6)  (*--> This results in over generation. Hence commented
             2.3.37 RaRTI cAnAxare  - ruxawaH prAvrAjIw  *)
     then match m1 with
       [ Sup (id1,cid1,mid1,_,_,_,_,_,viBakwiH1,_,_) ->
          if  prose_order id1 id3 text_type 
           && no_boundary_crossing_except_kwvA id1 id3 text_type
          then let karwA_karma =
                   if (viBakwiH1=7 || viBakwiH1=6) && ((id1 < id3) || (id1=next id3) || (id1=id3+2)) (* in the case of intervening particles such as wu *)
                   then  if     kqw3="Sawq_lat" || kqw3="SAnac_lat" 
                             || kqw3="Sawq_lqt" || kqw3="SAnac_lqt" 
                             || kqw3="kwa" || kqw3="kwavawu"
                         then "BkarwA"
			 else ""
                   else if viBakwiH1=2  && ((id1 < id3) || (id1=next id3) || (id1=id3+2)) (* अष्ट-अङ्ग-सङ्ग्रहे ज्ञाते वृथा प्राक्-तन्त्रयोः श्रमः भवति *) (* in the case of intervening particles such as wu *)
                         && (kqw3="kwa" || kqw3="kwavawu")
                         && not ((verb_type rt3 upasarga3) = "akarmaka")
                   then "Bkarma"
                   else ""
                    in match m2 with
                       [ Wif (id2,cid2,mid2,_,rt2,_,_,_,_,_,_,_,_,_,_,_) ->
                         bhAvalakRaNa_sapwamI id1 id2 id3 cid1 cid2 cid3 mid1 mid2 mid3 text_type kqw3 karwA_karma "42.1" "42.2" "42.3"
                       | Kqw (id2,cid2,mid2,_,rt2,_,_,kqw2,_,_,_,_,_,_,viBakwiH2,_,_) ->
                          if   viBakwiH2=1  && (kqw2="kwa" || kqw2="kwavawu")
                          then bhAvalakRaNa_sapwamI id1 id2 id3 cid1 cid2 cid3 mid1 mid2 mid3 text_type kqw3 karwA_karma "42.4" "42.5" "42.6"
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
