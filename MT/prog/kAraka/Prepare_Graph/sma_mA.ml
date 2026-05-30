open Pada_structure;
open Global_var; 
open Common;
open Adata;

value rl_sma m1 m2 text_type = match m2 with
  [ Wif (id2,cid2,mid2,_,_,_,_,_,_,_,_,_,_,_,_,_) ->
     match m1 with
     [ Avy (id1,cid1,mid1,word1,_,_,_,_) -> 
       let  d12 = if id1 > id2 then id1-id2 else id2-id1 in
       if no_boundary_crossing_with_iwi id1 id2 text_type
       then match word1 with
       [ "sma" -> if   (id1 = next id2) 
                    || text_type = "Sloka" (* smopawiRTanwi ... in BR-15-01-001-022c *)
                  then [ Relation (id1,cid1,mid1,"sambanXaH",id2,cid2,mid2,"36.1",d12)]
                  else []
       | _ -> []
       ]
       else []
     | _ -> []
     ]
  | _ -> []
  ]
  ;

(* ;wvaM mA gacCa. *)
value rlavy_wifkqw_special m1 m2 text_type = match m2 with
  [ Wif (id2,cid2,mid2,word2,_,pUrvapaxa2,_,_,_,_,_,_,_,_,_,_) ->
     match m1 with
     [ Avy (id1,cid1,mid1,word1,_,_,_,_) -> 
       let  d12 = if id1 > id2 then id1-id2 else id2-id1 in
           if no_boundary_crossing_with_iwi id1 id2 text_type
           then match word1 with
           [ "no" 
           | "nEva" 
           | "nahi" 
           | "na" ->  (*if prose_order id1 id2 text_type this overgenerates; e.g. virakwaH awra na hqRyawi na kupyawi*)
		      if ((id1 < id2) || (id2 = 1)) && (pUrvapaxa2="n")
			(* BaviwA na ca ....*)
                      then [ Relation (id1,cid1,mid1,"prawiReXaH",id2,cid2,mid2,"38.1",d12)]
                      else []
           | "kacciw" | "Sam" | "svaswi" | "svAhA" | "svaXA" | "vaRat" | "namaH" ->
			if word2="aswi"
                        then [ Relation (id1,cid1,mid1,"karwA",id2,cid2,mid2,"38.2",d12)] (* suggested by Dr. Bhagyalata Pataskar *)
			else []
           | "kim" ->  if id1 = total_wrds.val  (* last word *)
                       then [ Relation (id1,cid1,mid1,"sambanXaH",id2,cid2,mid2,"38.3",d12)]
                       else if  id1 < id2 
                            then if not (id1 = 1) && id2 = next id1
                                 then [ Relation (id1,cid1,mid1,"prayojanam1",id2,cid2,mid2,"38.4",d12)]
                                 else if (id1 = 1)
                                      then [ Relation (id1,cid1,mid1,"sambanXaH",id2,cid2,mid2,"38.6",d12)]
				      else [ Relation (id1,cid1,mid1,"prayojanam1",id2,cid2,mid2,"38.5",d12) ]
                            else []
                   (* kim wvam paTasi -> yes/no, prayojanam     29.5,29.6
                    * kim wvam saMskqwam paTasi -> yes/no, prayojanam 29.5, 29.6
                    * wvam saMskqwam kim paTasi -> prayojanam   29.4
                    * wvam kim saMskqwam paTasi -> yes/no, prayojanam 29.5,29.6
                    * wvam paTasi kim -> yes/no  29.3 *)
       (* | "saha"
          | "sAkam"
          | "sArXam"
          | "samam"
          | "vinA" -> if prose_order id1 id2 text_type
                      then [ Relation (id1,cid1,mid1,"sahakAraka",id2,cid2,mid2,"29.4",d12)]
                      else [] *)
          | "waw" ->  if prose_order id1 id2 text_type
                      then [ Relation (id1,cid1,mid1,"sambanXaH",id2,cid2,mid2,"38.6",d12)]
                      else []
          | _ -> []
          ]
          else []
      
      | _ -> []
      ]
     | Avykqw (id2,cid2,mid2,_,_,pUrvapaxa2,_,_,_,kqw_prawyayaH2,_,_) ->
     match m1 with
     [ Avy (id1,cid1,mid1,word1,_,_,_,_) -> 
       let  d12 = if id1 > id2 then id1-id2 else id2-id1 in
           if no_boundary_crossing_with_iwi id1 id2 text_type
           then match word1 with
           [ "no" 
           | "nEva" 
           | "nahi" 
           | "na" ->  (*if prose_order id1 id2 text_type this overgenerates; e.g. virakwaH awra na hqRyawi na kupyawi*)
		      if (id1 < id2) && (pUrvapaxa2="n") && not (kqw_prawyayaH2="wumun")
                      then [ Relation (id1,cid1,mid1,"prawiReXaH",id2,cid2,mid2,"38.7",d12)]
                      else []
           | "kacciw" | "Sam" | "svaswi" | "svAhA" | "svaXA" | "vaRat" | "namaH"
           | "kim" ->  if id1 = total_wrds.val 
                       then [ Relation (id1,cid1,mid1,"sambanXaH",id2,cid2,mid2,"38.8",d12)]
                       else if  id1 < id2 
                            then if not (id1 = 1) && id2 = next id1
                                 then [ Relation (id1,cid1,mid1,"prayojanam1",id2,cid2,mid2,"38.9",d12)]
                                 else [ Relation (id1,cid1,mid1,"prayojanam1",id2,cid2,mid2,"38.10",d12)
                                      ; Relation (id1,cid1,mid1,"sambanXaH",id2,cid2,mid2,"38.11",d12)
                                      ]
                            else []
          | "waw" ->  if prose_order id1 id2 text_type
                      then [ Relation (id1,cid1,mid1,"sambanXaH",id2,cid2,mid2,"38.12",d12)]
                      else []
          | _ -> []
          ]
          else []
      | _ -> []
      ]
  | Kqw (id2,cid2,mid2,_,_,_,_,kqw_prawyayaH2,_,_,_,pUrvapaxa2,uwwarapaxa2,_,_,_,_) ->
	if (kqw_prawyayaH2="kwa" || kqw_prawyayaH2="kwavawu" || kqw_prawyayaH2="yaw" || kqw_prawyayaH2 = "anIyar" || kqw_prawyayaH2="wavyaw" || kqw_prawyayaH2 = "ac") && (finite_verb_in_sentence.val == 50) (* ac added to account for तस्मात् न अर्हाः वयम् हन्तुम् धार्तराष्ट्रान् स्व-बान्धवान् - relation between na and arhAH which is ac *)
        then match m1 with
        [ Avy (id1,cid1,mid1,word1,_,_,_,_) -> 
           let  d12 = if id1 > id2 then id1-id2 else id2-id1 in
              if no_boundary_crossing_with_iwi id1 id2 text_type
              then match word1 with
              [ "no" 
              | "nEva" 
              | "nahi" 
              | "na" ->  (*if prose_order id1 id2 text_type this overgenerates; e.g. virakwaH awra na hqRyawi na kupyawi*)
		      if (id1 < id2) && (pUrvapaxa2="n") && (uwwarapaxa2="n")
                      then [ Relation (id1,cid1,mid1,"prawiReXaH",id2,cid2,mid2,"38.13",d12)]
                      else []
              | "kacciw" | "Sam" | "svaswi" | "svAhA" | "svaXA" | "vaRat" | "namaH"
              | "kim" ->  if id1 = total_wrds.val 
                       then [ Relation (id1,cid1,mid1,"sambanXaH",id2,cid2,mid2,"38.14",d12)]
                       else if  id1 < id2 
                            then if not (id1 = 1) && id2 = next id1
                                 then [ Relation (id1,cid1,mid1,"prayojanam1",id2,cid2,mid2,"38.15",d12)]
                                 else [ Relation (id1,cid1,mid1,"prayojanam1",id2,cid2,mid2,"38.16",d12)
                                      ; Relation (id1,cid1,mid1,"sambanXaH",id2,cid2,mid2,"38.17",d12)
                                      ]
                            else []
                   (* kim wvam paTasi -> yes/no, prayojanam     29.5,29.6
                    * kim wvam saMskqwam paTasi -> yes/no, prayojanam 29.5, 29.6
                    * wvam saMskqwam kim paTasi -> prayojanam   29.4
                    * wvam kim saMskqwam paTasi -> yes/no, prayojanam 29.5,29.6
                    * wvam paTasi kim -> yes/no  29.3 *)
          | "waw" ->  if prose_order id1 id2 text_type
                      then [ Relation (id1,cid1,mid1,"sambanXaH",id2,cid2,mid2,"38.18",d12)]
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

value rlavy_wif_mA m1 m2 text_type = match m2 with
  [ Wif (id2,cid2,mid2,_,_,_,_,_,_,_,lakAraH2,_,_,_,_,_) ->
     match m1 with
     [ Avy (id1,cid1,mid1,word1,_,_,_,_) ->
       let  d12 = if id1 > id2 then id1-id2 else id2-id1 in
       if   ( id2=next id1 || text_type = "Sloka")
      && word1="mA"
      && (lakAraH2="lot" || lakAraH2="viXilif" || lakAraH2="lqt" || lakAraH2="luf")
       then [ Relation (id1,cid1,mid1,"prawiReXaH",id2,cid2,mid2,"39.1",d12)]
       else []
     | _ -> []
     ]
  | _ -> []
  ]
;

