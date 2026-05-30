open Pada_structure;
open Global_var; 
open Common;
open Adata;

(* To add

number: 1,2,3 => if 1+1 then 2 else 3
person: u > m > a
choose max among the given persons.

gender: neuter > masc > fem
choose max among the given genders 
Ref: Kale's Higher Sanskrit grammar; 789
*)
value rl_ca_wif_aBihiwa_karwA_karma m1 m2 m3 text_type = match m2 with
 [ Avy (id2,cid2,mid2,word2,_,_,_,_) -> 
   if word2="ca" then match m3 with
   [ Wif (id3,cid3,mid3,_,rt3,_,_,upasarga3,sanAxiH3,prayogaH3,_,puruRaH3,vacanam3,_,_,_) ->
     match m1 with
     [ WaxXiwa (id1,cid1,mid1,word1,rt1,pUrvapaxa1,uwwarapaxa1,_,_,viBakwiH1,_,_)
     | Kqw (id1,cid1,mid1,word1,_,_,_,_,_,_,rt1,pUrvapaxa1,uwwarapaxa1,_,viBakwiH1,_,_)
     | Sup (id1,cid1,mid1,word1,rt1,pUrvapaxa1,uwwarapaxa1,_,viBakwiH1,_,_) -> 
       let  d13 = if id1 > id3 then id1-id3 else id3-id1 in
       if   prose_order id1 id3 text_type && id2 = next id1
         && (  (aBihiwa rt1 "bahu" vacanam3 puruRaH3)
             || (aBihiwa rt1 "xvi" vacanam3 puruRaH3))
         && d13 < 8
       then match viBakwiH1 with
       [ 1 -> match prayogaH3 with
           [ "karwari" -> match sanAxiH3 with
                 [ "Nic" -> [ Relation (id1,cid1,mid1,"prayojakakarwA",id3,cid3,mid3,"2.31", d13)]  
                      (* aBihiwe praWamA  - xevaxawwaH:prayojakakarwA pATayawi*)
                 | _     -> [ Relation (id1,cid1,mid1,"karwA",id3,cid3,mid3,"2.32", d13)]
                      (* rAmaH sIwA ca gacCawaH; rAmaH sIwA ramA ca gacCanwi *)
                 ]
           |"karmaNi" -> match verb_type rt3 upasarga3 with
                 [ "xvikarmaka2" -> [ Relation (id1,cid1,mid1,"muKyakarma",id3,cid3,mid3,"2.33", d13)]  
                         (*praXAne nIhqkqRvah  - ajA:muKyakarma grAmaM nIyawe *)
                 | "xvikarmaka1" -> 
                       [ Relation (id1,cid1,mid1,"gONakarma",id3,cid3,mid3,"2.34", d13)]  
                         (*apraXAne xuhAxinAm.. - gOH xugXaM:gONakarma xuhyawe *)
                 | _ -> match sanAxiH3 with
                    ["Nic" ->  match verb_type rt3 upasarga3 with
                           [ "gawi" -> 
                                [ Relation (id1,cid1,mid1,"prayojyakarwA",id3,cid3,mid3,"2.35", d13)]  
                           (*gawibuxXi.. -> karma; aBihiwa   yajFaxawwena xevaxawwaH:prayojyakarwA  grAmaM  gamyawe *)
                           | "buxXi"
                           | "Sabxakarma"
                           | "prawyavasAnArWa"  -> 
                                   [ Relation (id1,cid1,mid1,"prayojyakarwA",id3,cid3,mid3,"2.36", d13)  
                                       (*yajFaxawwena  xevaxawwaH PalaM KAxyawe *)
                                   ; Relation (id1,cid1,mid1,"karma",id3,cid3,mid3,"2.37", d13) 
                                   ]
                           | "sakarmaka"  -> 
                                   [ Relation (id1,cid1,mid1,"karma",id3,cid3,mid3,"2.38", d13)]  
                                 (* aBihiwe praWamA  -yajFaxawwena  xevaxawwaM  PalaM  KAxyawe *)
                           | _ -> []
                           ]
                   | _ -> if members_of rt3 upasarga3 sakarmaka_verbs
                          then [ Relation (id1,cid1,mid1,"karma",id3,cid3,mid3,"2.39", d13)]  
                              (* aBihiwe praWamA  - xevaxawwena grAmaH gamyawe*)
                          else []
                    ]
                 ]
           | _ -> []
           ]
     | _ -> []
     ]
     else []
     | _ -> []
     ]
  | _ -> []
  ] 
  else []
 | _ -> []
 ]
  ;

value mark_samucchiwa id1 id2 id3 cid1 cid2 cid3 mid1 mid2 mid3 rl1 rl2 =
     let  d13 = if id1 > id3 then id1-id3 else id3-id1 in
      let   d23 = if id2 > id3 then id2-id3 else id3-id2 in
                 [ Relation (id3,cid3,mid3,"samucciwaH",id1,cid1,mid1,rl1,d13)
                 ; Relation (id2,cid2,mid2,"samuccaya_xyowakaH",id1,cid1,mid1,rl2,d23)
                 ]
;

value mark_sup_samucchiwa id1 id2 id3 cid1 cid2 cid3 mid1 mid2 mid3 viBakwiH1 viBakwiH3 vacanam1 vacanam3 word2 rl1 rl2 = 
     let  d13 = if id1 > id3 then id1-id3 else id3-id1 in
      let   d23 = if id2 > id3 then id2-id3 else id3-id2 in
        (*if    id1 < id3 *)
           if viBakwiH1=viBakwiH3 
           && not (viBakwiH1 = 8) 
           (* && vacanam1 = vacanam3 ; hqxayAni naBaH ca vyanunAxaya BhG 1.19 *)
           then if   ((word2="ca" || word2 = "evaFca" || word2 = "aWaca" || word2="cEva") (* yAnam api vanam gacCawi, here yAnam and vanam cannot be joined with samucciwa  Normally api in the second position connectes the curr sent with the previous one. Hence api not added *)
                     || (word2="waWA" && yaWA_pos.val = 50))
                  && (id2 = next id3)
		  (* if id2< id3 iinsteadof id2 = next id3, then 3 words X Y and waWA ANYWHERE in the sentence get joined. To avoid this the condition that waWA should be just next to the word it would be connected with is added *)
        then    [ Relation (id1,cid1,mid1,"sup_samucciwaH",id3,cid3,mid3,rl1,d13)
                ; Relation (id2,cid2,mid2,"sup_samuccaya_xyowakaH",id3,cid3,mid3,rl2,d23)
                ]
                     (* Need an example for aWa and api as samuccaya || (word2="aWa" && id2 < id3 && id2 > id1 ) *)
(* Example for aWa: तत्र अपश्यत् स्थितान् पार्थः पितॄन् अथ पितामहान् *)
           else if  (word2="aWa") && (id1 = next id2)
           then [ Relation (id1,cid1,mid1,"sup_samucciwaH",id3,cid3,mid3,rl1,d13)
                ; Relation (id2,cid2,mid2,"sup_samuccaya_xyowakaH",id3,cid3,mid3,rl2,d23)
                ]
	   else []
	   else []
;

value rlca_samucciwa m1 m2 m3 text_type = match m2 with
     [ Avy (id2,cid2,mid2,_,word2,_,_,_) -> 
        if word2 = "ca" || word2 = "evaFca" || word2 = "aWaca" || word2 = "cEva" || word2 = "aWa" || word2="waWA"  (* agaswyaM ca agaswya-BrAwaraM waWA xaxarSa ha -- Sanskshepa Ramayanam 41-42 *)
        then match m3 with
        [ Wif (id3,cid3,mid3,_,_,_,_,_,_,prayogaH3,lakAra3,puruRaH3,_,_,_,_) ->
           (* if id3 = next id2 then ; not necessary. e.g. rAmaH SAlAm gacCawi pATam ca paTawi*) 
             match m1 with
              [ Wif (id1,cid1,mid1,_,_,_,_,_,_,prayogaH1,lakAra1,puruRaH1,_,_,_,_) ->
                        (*  id2 > id1 + 1 
                            not id2 > id1 To avoid rAmaH joining with gacCawi in rAmaH ca vanam gacCawi 
                            rAmaH can never be conjoined with gacCawi, since the puruRa is different. So the above argument is not convincing.  *)
                      if prayogaH1=prayogaH3 
                      && lakAra1=lakAra3 
                      && puruRaH1=puruRaH3 
                      && no_boundary_crossing_with_iwi id1 id3 text_type

                   (* && vacanam1=vacanam2  muKam pariSuRyawi gAwrANi ca sIxanwi *)

                  (*then if (((word2="ca" || word2="cEva")  && ((id2 = id1+2)|| (id2=next id3))) *)
                  then if (((word2="ca" || word2="cEva" )  && ((id2 > id1)|| (id2=next id3)))
                             (* id2 is the second word in the second sentence i.e. (id2 = id1+2)  
                                or it is next to the second/last verb 
                               --  rAmaH gAyawi sIwA ca paTawi; rAmaH gAyawi sIwA paTawi ca
                                id2 > id3 for handling 'sma' as in yAnwi sma ca *)
                           || (word2="waWA" && id2 < id3 && id2 > 1 && yaWA_pos.val = 50))
                       then
                            mark_samucchiwa id1 id2 id3 cid1 cid2 cid3 mid1 mid2 mid3 "58.1" "58.2"
                      else []
                  else []
              | _ -> []
              ]
        | Avykqw (id3,cid3,mid3,_,_,_,_,_,_,kqw_prawyaya3,_,_) -> match m1 with
             [ Avykqw (id1,cid1,mid1,_,_,_,_,_,_,kqw_prawyaya1,_,_) ->
                 if kqw_prawyaya1=kqw_prawyaya3
                 then mark_sup_samucchiwa id1 id2 id3 cid1 cid2 cid3 mid1 mid2 mid3 0 0 0 0 word2 "58.5" "58.6"
                 else []
             | _ -> []
             ]
        | Sup(id3,cid3,mid3,_,rt3,_,_,_,viBakwiH3,vacanam3,_) 
        | WaxXiwa (id3,cid3,mid3,_,rt3,_,_,_,_,viBakwiH3,vacanam3,_) -> 
              match m1 with
              [ Sup(id1,cid1,mid1,word1,rt1,_,_,_,viBakwiH1,vacanam1,_) 
              | Kqw (id1,cid1,mid1,word1,rt1,_,_,_,_,_,_,_,_,_,viBakwiH1,vacanam1,_) 
              | WaxXiwa (id1,cid1,mid1,word1,rt1,_,_,_,_,viBakwiH1,vacanam1,_) ->
                   (* | Kqw (id1,cid1,mid1,word1,rt1,_,_,_,_,_,_,_,_,_,_,viBakwiH1,_,_) ->
                        This is commented to avoid the grouping of sIxanwi and gAwrANi with muKam_ca in 
                        sIxanwi mama gAwrANi muKam ca pariSuRyawi  *)
                    (* && not (( pronoun3 rt1 || member_of rt1 saMKyeya || member_of rt1 pUraNa || (member_of rt1 guNavAcI && uwwarapaxa1=word1) || (member_of rt1 uwwara_guNavAcI && not (uwwarapaxa1=word1))|| member_of rt1 sambanXavAcI) )  What is its necessity? *)
                 (* then if id3 = next id2 *) (* yogyawA *)
		  if not (rt1 = "kim") && not (rt3 = "kim") && not (rt1 = "yuyuwsu") && not (rt3 = "yuyuwsu") && not (rt1="yax") && not(rt1="wax") && not (rt3="yax") && not(rt3="wax")
                   then if no_boundary_crossing_with_iwi id1 id3 text_type
		   (*then if (id2-id3 = 1) && (word2="waWA") -- Why only waWA? *)
                    then mark_sup_samucchiwa id1 id2 id3 cid1 cid2 cid3 mid1 mid2 mid3 viBakwiH1 viBakwiH3 vacanam1 vacanam3 word2 "58.9" "58.10"
                    else if (id3 < id2) && (id1 < id2) (* all the samucciwa should be to the left of ca/api etc *)
                    && not (member_of rt1 sambanXavAcI)
                  then mark_sup_samucchiwa id1 id2 id3 cid1 cid2 cid3 mid1 mid2 mid3 viBakwiH1 viBakwiH3 vacanam1 vacanam3 word2 "58.11" "58.12"
		  else []
		  else []
              | _ -> []
              ]
        | Kqw (id3,cid3,mid3,rt3,word3,_,_,kqw3,_,_,_,_,_,lifgam3,viBakwiH3,vacanam3,_) ->
              match m1 with
              [ Kqw (id1,cid1,mid1,_,_,_,_,kqw1,_,_,_,_,_,lifgam1,viBakwiH1,vacanam1,_) ->
                 if kqw3=kqw1 && lifgam3 = lifgam1 (* condition for lifgam is added to avoid joining of wuRyanwi with kaWayanwaH; the first one is neuter and the second one masc *)
                 then mark_sup_samucchiwa id1 id2 id3 cid1 cid2 cid3 mid1 mid2 mid3 viBakwiH1 viBakwiH3 vacanam1 vacanam3 word2 "58.13" "58.14"
                 else []
              (* samucciwa of a kqw with sup, we need examples. In the case of niwyaM wuRyanwi ca, it would join niwyam with wuRyanwi, which is wrong.  The condition for kriyA viSeRaNa is added to account for this.*)
	      | Sup(id1,cid1,mid1,word1,rt1,_,_,_,viBakwiH1,vacanam1,_)
              | WaxXiwa (id1,cid1,mid1,word1,rt1,_,_,_,_,viBakwiH1,vacanam1,_) ->
                  if  (((member_of (word1^" "^string_of_int(viBakwiH1)) kriyAviSeRaNas) && member_of (word3^" "^string_of_int(viBakwiH3)) kriyAviSeRaNas)
                     || (not (member_of (word3^" "^string_of_int(viBakwiH3)) kriyAviSeRaNas) && not (member_of (word1^" "^string_of_int(viBakwiH1)) kriyAviSeRaNas)))
                  && no_boundary_crossing_with_iwi id1 id3 text_type
		  then
                  mark_sup_samucchiwa id1 id2 id3 cid1 cid2 cid3 mid1 mid2 mid3 viBakwiH1 viBakwiH3 vacanam1 vacanam3 word2 "58.17" "58.18"
		  else [] 
              |  _ -> []
              ]
        | Avy (id3,cid3,mid3,_,word3,_,_,_) -> 
              match m1 with
	      [ Avy (id1,cid1,mid1,_,word1,_,_,_) -> 
		 if not (word1 = "na") && (id1-id3) < 5 && (id1 - id3) > -5 then (* the two avys are not far away *)
                 mark_sup_samucchiwa id1 id2 id3 cid1 cid2 cid3 mid1 mid2 mid3 0 0 0 0 word2 "58.15" "58.16"
		 else []
              |  _ -> []
              ]
        | _ -> [] 
        ]
        else []
     | _ -> []
     ]
;

value mark_sup_anyawara id1 id2 id3 cid1 cid2 cid3 mid1 mid2 mid3 viBakwiH1 viBakwiH3 vacanam1 vacanam3 word2 rl1 rl2 =
      let  d23 = if id2 > id3 then id2-id3 else id3-id2 in
       let  d13 = if id1 > id3 then id1-id3 else id3-id1 in
           if    viBakwiH1=viBakwiH3 
              && vacanam1=vacanam3
              && id1 < id3 
              && ((id2 = next id3 && word2 = "vA") || (id2 = next id1 && (word2 = "aWavA" || word2 = "uwa" || word2 = "uwasviw")))
           then  [ Relation (id1,cid1,mid1,"sup_anyawaraH",id3,cid3,mid3,rl1, d13)
                 ; Relation (id2,cid2,mid2,"sup_anyawara_xyowakaH",id3,cid3,mid3,rl2,d23)
                 ] 
           else []
;

value mark_anyawara id1 id2 id3 cid1 cid2 cid3 mid1 mid2 mid3 rl1 rl2 =
      let  d23 = if id2 > id3 then id2-id3 else id3-id2 in
       let  d13 = if id1 > id3 then id1-id3 else id3-id1 in
           [ Relation (id1,cid1,mid1,"anyawaraH",id3,cid3,mid3,rl1,d13)
           ; Relation (id2,cid2,mid2,"anyawara_xyowakaH",id3,cid3,mid3,rl2,d23)
           ] 
;

value rl_anyawara m1 m2 m3 text_type = match m2 with
     [ Avy (id2,cid2,mid2,_,word2,_,_,_) -> 
        if word2 = "vA" || word2 = "aWavA" || word2 = "uwa" || word2 = "uwasviw"
        then match m3 with
        [ Wif (id3,cid3,mid3,_,_,_,_,_,_,prayogaH3,lakAra3,puruRaH3,_,_,_,_) ->
             match m1 with
              [ Wif (id1,cid1,mid1,_,_,_,_,_,_,prayogaH1,lakAra1,puruRaH1,_,_,_,_) ->
                  if prayogaH1=prayogaH3 
                  && lakAra1=lakAra3 
                  && puruRaH1=puruRaH3 
                      (* && vacanam1=vacanam2  muKam pariSuRyawi gAwrANi ca sIxanwi *)
                   && id1 < id3  
                   && ((id2 < id3) || (id2 = next id3)) 
(* ... gacCawi pATam vA samyak paTawi / gacCawi wiRTawi vA *)
                   && id1 < id2 
                   && no_boundary_crossing_with_iwi id1 id3 text_type
                then mark_anyawara id1 id2 id3 cid1 cid2 cid3 mid1 mid2 mid3 "58.3" "58.4"
                else []
              | _ -> []
              ]
        | Avykqw (id3,cid3,mid3,_,_,_,_,_,_,kqw3,_,_) ->
             match m1 with
             [ Avykqw (id1,cid1,mid1,_,_,_,_,_,_,kqw1,_,_) ->
                 if kqw1=kqw3
                 then mark_sup_anyawara id1 id2 id3 cid1 cid2 cid3 mid1 mid2 mid3 0 0 0 0 word2 "58.7" "58.8"
                 else []
             | _ -> []
             ]
        | Sup(id3,cid3,mid3,_,_,_,_,_,viBakwiH3,vacanam3,_) 
        | WaxXiwa (id3,cid3,mid3,_,_,_,_,_,_,viBakwiH3,vacanam3,_) ->  
              match m1 with
              [ Sup(id1,cid1,mid1,word1,rt1,_,_,_,viBakwiH1,vacanam1,_) 
              | WaxXiwa (id1,cid1,mid1,word1,rt1,_,_,_,_,viBakwiH1,vacanam1,_) ->
                 mark_sup_anyawara id1 id2 id3 cid1 cid2 cid3 mid1 mid2 mid3 viBakwiH1 viBakwiH3 vacanam1 vacanam3 word2 "58.11" "58.12"
              | _ -> []
              ]
        | Kqw (id3,cid3,mid3,_,_,_,_,kqw3,_,_,_,_,_,_,viBakwiH3,vacanam3,_) ->
              match m1 with
              [ Kqw (id1,cid1,mid1,_,_,_,_,kqw1,_,_,_,_,_,_,viBakwiH1,vacanam1,_) ->
                 if kqw3=kqw1
                 then mark_sup_anyawara id1 id2 id3 cid1 cid2 cid3 mid1 mid2 mid3  viBakwiH1 viBakwiH3 vacanam1 vacanam3 word2 "58.15" "58.16"
                 else []
              | Sup(id1,cid1,mid1,word1,rt1,_,_,_,viBakwiH1,vacanam1,_)
              | WaxXiwa (id1,cid1,mid1,word1,rt1,_,_,_,_,viBakwiH1,vacanam1,_) ->
                 mark_sup_anyawara id1 id2 id3 cid1 cid2 cid3 mid1 mid2 mid3  viBakwiH1 viBakwiH3 vacanam1 vacanam3 word2 "58.19" "58.20"
              |  _ -> []
              ] 
        | _ -> [] 
        ]
        else []
     | _ -> []
     ]
;

value rl_ca m1 m2 text_type = match m2 with
    [ Avy (id2,cid2,mid2,_,_,_,_,_) 
    | Kqw (id2,cid2,mid2,_,_,_,_,_,_,_,_,_,_,_,_,_,_)
    | WaxXiwa (id2,cid2,mid2,_,_,_,_,_,_,_,_,_)
    | Wif (id2,cid2,mid2,_,_,_,_,_,_,_,_,_,_,_,_,_)
    | Avykqw (id2,cid2,mid2,_,_,_,_,_,_,_,_,_) 
    | Sup(id2,cid2,mid2,_,_,_,_,_,_,_,_)  -> match m1 with
      [ Avy (id1,cid1,mid1,word1,_,_,_,_) -> 
         let d12 = if id1 > id2 then id1-id2 else id2-id1 in
         match word1 with
            [ "ca" 
            | "vA" -> if id2 = previous id1
                      then [ Relation (id1,cid1,mid1,"sambanXaH",id2,cid2,mid2,"53.1",d12)]
                      else []
            | _ -> []
            ]
      | _ -> []
      ]
    | _ -> []
    ]
;
