open Pada_structure;
open Global_var; 
open Common;
open Adata;

value rl_sma_sawi m1 m2 text_type = match m2 with
  [ Wif (id2,cid2,mid2,_,_,_,_,_,_,_,_,_,_,_,_,_) ->
     match m1 with
     [ Avy (id1,cid1,mid1,word1,_,_,_,_) -> 
       let  d12 = if id1 > id2 then id1-id2 else id2-id1 in
       if no_boundary_crossing_with_iwi id1 id2 text_type
       then match word1 with
       [ "sma" -> if   (id1 = next id2) 
                    || text_type = "Sloka" (* smopawiRTanwi ... in BR-15-01-001-022c *)
                  then [ Relation (id1,cid1,mid1,"saM",id2,cid2,mid2,"36.1",d12)]
                  else []
       | "sawi" ->if   (id1 = next id2) 
                  then [ Relation (id1,cid1,mid1,"saM",id2,cid2,mid2,"36.1",d12)]
                  else []
       | _ -> []
       ]
       else []
     | _ -> []
     ]
  | _ -> []
  ]
  ;

(* wvaM mA gacCa. *)
value rlavy_wif_mA m1 m2 text_type = match m2 with
  [ Wif (id2,cid2,mid2,_,_,_,_,_,_,_,lakAraH2,_,_,_,_,_) ->
     match m1 with
     [ Avy (id1,cid1,mid1,word1,_,_,_,_) ->
       let  d12 = if id1 > id2 then id1-id2 else id2-id1 in
       if   ( id2=next id1 || text_type = "Sloka")
      && word1="mA"
      && (lakAraH2="lot" || lakAraH2="viXilif" || lakAraH2="lqt" || lakAraH2="luf")
       then [ Relation (id1,cid1,mid1,"prawiReXa",id2,cid2,mid2,"39.1",d12)]
       else []
     | _ -> []
     ]
  | _ -> []
  ]
;

value rlavy_wifkqw_special m1 m2 text_type = match m2 with
  [ Wif (id2,cid2,mid2,_,_,pUrvapaxa2,uwwarapaxa2,_,_,_,_,_,_,_,_,_) 
  | Kqw (id2,cid2,mid2,_,_,_,_,_,_,_,_,pUrvapaxa2,uwwarapaxa2,_,_,_,_) 
  | Avykqw (id2,cid2,mid2,_,_,pUrvapaxa2,uwwarapaxa2,_,_,_,_,_) ->
       let kqw = get_kqw_suff m2
       and cat = get_cat m2 in
	if   ((kqw="kwa" || kqw="kwavawu" || kqw="yaw" || kqw="anIyar" || kqw="wavyaw" || kqw="ac") && (finite_verb_in_sentence.val == 50)) 
          || (cat = "avykqw") || (cat="wif")
             (* ac added to account for तस्मात् न अर्हाः वयम् हन्तुम् धार्तराष्ट्रान् स्व-बान्धवान् - relation between na and arhAH which is ac *)
        then match m1 with
        [ Avy (id1,cid1,mid1,word1,_,_,_,_) -> 
           let  d12 = if id1 > id2 then id1-id2 else id2-id1  in
           if no_boundary_crossing_with_iwi id1 id2 text_type
           then match word1 with
           [ "no" 
           | "nEva" 
           | "nahi" 
           | "na" ->  (*if prose_order id1 id2 text_type this overgenerates; e.g. virakwaH awra na hqRyawi na kupyawi*)
		      if ((id1 < id2) || (id2 = 1)) && (pUrvapaxa2="n") && (uwwarapaxa2="n") && (not (kqw = "wumun"))
			(* BaviwA na ca ....*)
                      then [ Relation (id1,cid1,mid1,"prawiReXa",id2,cid2,mid2,"38.1",d12)]
                      else []
           (* | "kacciw"  ->
			if word2="aswi"
                        then [ Relation (id1,cid1,mid1,"karwA",id2,cid2,mid2,"38.2",d12)] (* suggested by Dr. Bhagyalata Pataskar *)
			else [] *)
           | "kim" ->  if id1 = total_wrds.val  (* last word *)
                       then [ Relation (id1,cid1,mid1,"saM",id2,cid2,mid2,"38.3",d12)]
                       else if  id1 < id2 
                            then if not (id1 = 1) && id2 = next id1
                                 then [ Relation (id1,cid1,mid1,"prayojanam1",id2,cid2,mid2,"38.4",d12)]
                                 else if (id1 = 1)
                                      then [ Relation (id1,cid1,mid1,"saM",id2,cid2,mid2,"38.6",d12)]
				      else [ Relation (id1,cid1,mid1,"prayojanam1",id2,cid2,mid2,"38.5",d12) ]
                            else []
                   (* kim wvam paTasi -> yes/no, prayojanam     29.5,29.6
                    * kim wvam saMskqwam paTasi -> yes/no, prayojanam 29.5, 29.6
                    * wvam saMskqwam kim paTasi -> prayojanam   29.4
                    * wvam kim saMskqwam paTasi -> yes/no, prayojanam 29.5,29.6
                    * wvam paTasi kim -> yes/no  29.3 *)
          (*| "waw" ->  if prose_order id1 id2 text_type
                      then [ Relation (id1,cid1,mid1,"saM",id2,cid2,mid2,"38.6",d12)]
                      else [] *)
          | _ -> []
          ]
          else []
      | _ -> []
      ]
      else []
  | _ -> []
  ]
  ;

