open Pada_structure;
open Common;
open Adata;

(*Handling upapadas *)

value rlupapaxa m1 m2 text_type = match m2 with
   [ Avy (id2,cid2,mid2,word2,rt2,_,_,_)
   | AvywaxXiwa (id2,cid2,mid2,word2,rt2,_,_,_,_)
   | Sup (id2,cid2,mid2,word2,rt2,_,_,_,_,_,_)
   | Kqw (id2,cid2,mid2,word2,_,_,_,_,_,_,rt2,_,_,_,_,_,_)
   | Avykqw (id2,cid2,mid2,word2,rt2,_,_,_,_,_,_,_)
   | WaxXiwa (id2,cid2,mid2,word2,rt2,_,_,_,_,_,_,_) ->
      match m1 with
      [ Sup (id1,cid1,mid1,_,rt1,_,_,_,viBakwiH1,_,_)
      | Kqw (id1,cid1,mid1,_,_,_,_,_,_,_,rt1,_,_,_,viBakwiH1,_,_)
      | WaxXiwa (id1,cid1,mid1,_,rt1,_,_,_,_,viBakwiH1,_,_) ->
       let  d12 = if id1 > id2 then id1-id2 else id2-id1 in
         if   (id1=previous id2 || id1 = id2-2 (* to handle 'rAmeNa ca saha *)
               || (id1=next id2  && text_type = "Sloka") || ((word2="hA" || word2 = "Xik") && id1=next id2) || ((word2="alam") && id1=next id2) || (id1= id2+2  && text_type = "Sloka")) (* namaH Bagavawe vAsuxevAya -- id1 = id2+2 *)
         then match viBakwiH1 with
         [ 2  -> match word2 with
                 [ "aBiwaH" | "pariwaH" | "nikaRA" | "samayA" 
                   | "uparyupari" | "aXoXaH" | "aXoZXaH" | "aXyaXi" | "uBayawaH" 
                   | "sarvawaH" 
		   | "anwarA" | "uwwareNa" | "xakRiNena" | "aXareNa" -> 
                    [Relation (id1,cid1,mid1,"upa_apekRA",id2,cid2,mid2,"25.1",d12)]
                 | "hA" | "Xik" ->
                    [Relation (id2,cid2,mid2,"uxgAravAcakaH",id1,cid1,mid1,"25.2",d12)]
                 | "prawi" ->
                    [ (*Relation (id1,cid1,mid1,"upa_ABimuKyam",id2,cid2,mid2,"25.3",d12) -- Not being used
                    ; *)Relation (id1,cid1,mid1,"karmapravacanIya_anviwam",id2,cid2,mid2,"25.4",d12)
                    ]
                 | "aBi" | "anu" (* |"api"   Discuss with Sanjeev *) ->
                    [Relation (id1,cid1,mid1,"karmapravacanIya_anviwam",id2,cid2,mid2,"25.5",d12)]
		 | "praxakRiNam" -> 
                    [Relation (id1,cid1,mid1,"sanxarBa_binxuH",id2,cid2,mid2,"25.6",d12)]
                 | _ -> []
                 ]
         | 3  -> match rt2 with
                 [ "samAna" | "samAnA" | "saxqkRa" | 
                   "saxqkRA" | "saxqkRI" | "saxqSA" | "saxqSa" | "saxqS" | 
                   "wulya" | "wulyA" | (* "yukwa" | *)  "samA" ->  (* yukwa cannot have wulanA binxu *)
                    [Relation (id2,cid2,mid2,"upamAna_xyowakaH",id1,cid1,mid1,"25.7",d12)]
                 | "uwsuka" | "prasiwa" | "uwsukA" | "prasiwA" ->
                    [Relation (id1,cid1,mid1,"viRayAXikaraNam",id2,cid2,mid2,"25.8",d12)]
                 | _ -> match word2 with
                    [ "alam" ->
                      [Relation (id2,cid2,mid2,"prawiReXaH",id1,cid1,mid1,"25.9",d12)]
                    | _ -> []
                    ]
                 ]
        | 4 -> match word2 with
		 [ "alam" | "praBuH" | "SakwaH"  ->
                    [Relation (id1,cid1,mid1,"upa_apekRA",id2,cid2,mid2,"25.10",d12)]
                 | "AyuRyam" |"Baxram" | "ciraFjIviwam" |
                   "hiwam" | "kuSalam" | "maxram" | "nirAmayam" | "Sam" |
                   "suKam" | "svAhA" | "svaswi" | "svaXA" | "vaRat"  ->
                    [Relation (id1,cid1,mid1,"prayojanam1",id2,cid2,mid2,"25.11",d12)]
                 | "namaH" ->
                    [Relation (id1,cid1,mid1,"prayojanam1",id2,cid2,mid2,"25.12",d12)]
                    (*Sanjeev proposed karma relation; Pavan proposed prayojanam; karma is changed to prayojanam; 21 Mar 2021 *)
                 | _ -> []
                 ]
        | 5 -> match word2 with
                 [ "aByASam" | "aByASAw" | "aByASena" | "aByASe" | "aByASA" | "aByASaH" |"anwikAn"|
                   "anwikena" | "anwike" | "anwikAw" | "anwikam" |"ArAw" | "avAcI" | "avAc" |
                   "bahiH" | "nikatam" | "nikatAw" | "nikatena" | "nikate" |
                    "prAFca" | "prawyaFca" | "prawyak" |"paScimA" | "paScimam" | "paScimAn" |
                   "samIpam" | "samIpAw" | "samIpena" | "samIpe" | "uwwarA" |
                   "uwwarAhi"  | "prawIcI" | "uxac" | "uxak" | "uxIcI" |"prAcI" | "prAk" | "pUrvA" | "pUrvaH" |
                   "pUrvam" | "pUrvAn" | "uwwaram" | "viprakqRtam" | "paScAw" |
                   "viprakqRtAw" | "viprakqRtena" | "viprakqRte" |"viprakqRtA" |
                   "xakRiNAhi" | "xakRiNA" | "xakRiNam"|"xakRiNAn" |"uwwarAn" | "xUram" | "xUreNa" |
                   "xUrAw" | "xUrA" | "xUre" ->
                    [Relation (id1,cid1,mid1,"upa_apekRA",id2,cid2,mid2,"25.13",d12)]
                 | "apa" | "pari" | "prawi" ->
                    [Relation (id1,cid1,mid1,"karmapravacanIya_anviwam",id2,cid2,mid2,"25.14",d12)]
                 | "A" ->
                    [Relation (id1,cid1,mid1,"karmapravacanIya_anviwam",id2,cid2,mid2,"25.15",d12)]
                 | "AraBya" | "praBqwiH" ->
                       [Relation (id1,cid1,mid1,"upa_AramBa_binxuH",id2,cid2,mid2,"25.16",d12)]
                 | _ -> match rt2 with
                     [  "Binna" | "BinnA" | "iwara" | "iwarA" | "pUrvA" | "pUrva" | "vilakRaNa" | 
                       "vilakRaNA"| "anya" | "anyA" | "anyawra" ->
                       [Relation (id1,cid1,mid1,"wulanA_binxuH",id2,cid2,mid2,"25.17",d12)]
                     | _ -> []
                     ]
                 ]
        | 6 -> match word2 with
                 [ "aByASaH" | "aByASam" | "aByASena" | "aByASAw" | "aByASA" | "aByASe" |
                   "agrawaH" | "anwaH" | "anwikam" | "anwikAw" | "anwikAn" | "anwikena" |
                   "anwike" | "nikatam" | "nikatena" | "nikatAw" | "nikatAn" | 
                   "nikate" | "purawaH" | "pqRTawaH" | "xUram" | "xUrA" | "xUrAw" | "xUreNa" | 
                   "xUre" | "viprakqRtAw" | "viprakqRtena" |  "viprakqRtA" |
                   "viprakqRte" |"viprakqRtam" | 
                   "samIpam" | "samIpAw" | "samIpena" | "samIpe" | "xakRiNAn" | "uwwarAn" |
                   "uwwarawaH" | "xakRiNawaH" | "aXaswAw" | "puraswAw" | 
                   "paraswAw" | "avaraswAw" | "parawaH" | "avarawaH" | 
                   "upari" | "upariRtAw" | "paScAw" | "uwwarAw" | "aXarAw" | 
                   "xakRiNAw" | "uwwareNa" | "aXareNa" | "xakRiNena" | 
                   "puraH" | "aXaH" | "avaH" | "avaswAw" | "samakRam" |
                    "maXye" (* added by amba *) | 
                    "xakRiNAhi" -> (* added by amba *)
                       [Relation (id1,cid1,mid1,"upa_apekRA",id2,cid2,mid2,"25.18",d12)]
 
		 | "AyuRyam" |"Baxram" | "ciraFjIviwam" |
                   "hiwam" | "kuSalam" | "maxram" | "nirAmayam" | "Sam" |
                   "suKam" |"arWe" 
        (* | "kqwe" *) ->
                    [Relation (id1,cid1,mid1,"prayojanam1",id2,cid2,mid2,"25.19",d12)]
                 | "xakRiNe" | "uwware" ->
                         [Relation (id1,cid1,mid1,"aXikaraNam",id2,cid2,mid2,"25.20",d12)]
                 | _ -> match rt2 with
                   [ "samAna" | "samAnA" | "saxqkRa" | "saxqkRI" |
                     "saxqS" |  "saxqkRA" |  "saxqSA" | "saxqSa" |
                     "wulya" | "wulyA" | (*"yukwa" |*) "samA"| "sama"  -> (*yukwa has an expectancy of 3/karaNa *)
                       [Relation (id1,cid1,mid1,"wulanA_binxuH",id2,cid2,mid2,"25.21",d12)]
                   | "prasUwA" | "prasUwa" ->
                       [Relation (id1,cid1,mid1,"nirXAraNam",id2,cid2,mid2,"25.22",d12)]
                   | "aXipawi" | "ISvara"  | "prawiBU" | "sAkRin" | "sAkRiNI" |
                     "xAyAxa" | "svAmin" | "svAminI" ->
                       (*[Relation (id1,cid1,mid1,"aBexaH",id2,cid2,mid2,"25.23",d12)] -- How can it be aBexaH? Should it not be sva-svAmIBAva/RaRTIsambanXaH?  25th Aug 2023 *)
                       [Relation (id1,cid1,mid1,"RaRTIsambanXaH",id2,cid2,mid2,"25.23",d12)]
                   | _ -> []
                   ] 
                 ]
        | 7 -> match rt2 with
               ["anurakwa" | "anurakwA" | "Asakwa" | "AsakwA" |
                "Ayukwa" | "AyukwA" | (*"yukwa" | *) "kuSala" |"kuSAlA" | "lagna"|
                "lagnA" | "nipuNA" | "nipuNa" | "prasiwa" | "prasiwA" | "kOSala" | "pravqwwa" |
                "uwsuka" | "uwsukA" | "sAXu" | "sAXvI" | "asAXvI" | "asAXu" ->
                       [Relation (id1,cid1,mid1,"viRayAXikaraNam",id2,cid2,mid2,"25.24",d12)]
                       (* why should yukwa have viRayAXikaraNa ? any example? *)
               | "prawiBU" |"sAkRiNI" | "sAkRin" | "svAmin" | "svAminI" | 
                  "ISvara" | "xAyAxa" | "aXipawi" ->
                       [Relation (id1,cid1,mid1,"aBexaH",id2,cid2,mid2,"25.25",d12)]
               | "prasUwA" | "prasUwa"  ->
                       [Relation (id1,cid1,mid1,"nirXAraNam",id2,cid2,mid2,"25.26",d12)]
               | _ -> match word2 with
                     [ "aXi" | "upa" ->
                         [Relation (id1,cid1,mid1,"karmapravacanIya_anviwam",id2,cid2,mid2,"25.27",d12)]
                      | _ -> [] 
                      ]
               ]
        | 8 -> if rt2="namaH" 
               then [Relation (id1,cid1,mid1,"samboXyaH",id2,cid2,mid2,"25.28",d12)]
               else []
        | _ -> []
        ]
        else []
     | AvywaxXiwa (id1,cid1,mid1,word1,rt1,_,_,waxXiwaprawyayaH1,_) ->
       let  d12 = if id1 > id2 then id1-id2 else id2-id1 in
            if waxXiwaprawyayaH1 = "wasil" && rt2 = "prawi" 
            then  [Relation (id1,cid1,mid1,"karmapravacanIya_anviwam",id2,cid2,mid2,"25.29",d12)]
            else []
     | Avy (id1,cid1,mid1,word1,rt1,_,_,_) -> 
       let  d12 = if id1 > id2 then id1-id2 else id2-id1 in
                if word1="axya"
                then match word2 with
                 ["AraBya" | "praBqwiH" ->
                     [Relation (id1,cid1,mid1,"upa_AramBa_binxuH",id2,cid2,mid2,"25.30",d12)]
                 | _ -> []
                 ]
                 else 
	          if word2 = "SarmaNe" && (rt1="awra" || rt1 = "wawra" || rt1 = "parawra")
                  then [Relation (id1,cid1,mid1,"kAlAXikaraNam",id2,cid2,mid2,"25.30a",d12)]
		  else []
     | _ -> []
     ]
  |_ -> []
  ]
;

(* yogyawA *)
(* WHY do you need this function?
Are these not aXikaraNas, otherwise?
*)
value rlupapaxa_other_rel m1 m2 text_type = match m1 with
  [ Sup (id1,cid1,mid1,word1,rt1,_,_,_,viB1,_,_)
  | Kqw (id1,cid1,mid1,word1,_,_,_,_,_,_,rt1,_,_,_,viB1,_,_)
  | WaxXiwa (id1,cid1,mid1,word1,rt1,_,_,_,_,viB1,_,_) ->
   if not (viB1=8) then
    match word1 with
       [ "aByASam" | "aByASaH" | "aByASAw" | "aByASe" | "aByASA" | "aByASena" | "pUrvam" | "pUrvAn"|
         "anwikam" | "anwikAw" | "anwike" | "anwikena" | "anwikAn" | "prAcI" | "prAk" | "pUrvA" | "pUrvaH" | 
         "prAFca" | "prawyaFca" | "prawyak" | "avAcI" | "avAc" |"prawIcI" | "uxac" | "uxak" | "uxIcI"|
         "samIpam" | "samIpAw" | "samIpe" | "samIpena" | "uwwaram" | "paScimA" | "paScimam" | "paScimAn" | 
	 "uwware" | "viprakqRtam" | "viprakqRtAw" | "viprakqRtA" |  "maXye" | 
         "viprakqRte" | "viprakqRtena" | "xakRiNam" |"xakRiNAn" | "uwwarAn" | "xakRiNe" | "samakRam" | 
         "xUram" | "xUrAw" | "xUre" | "xUrA" | "xUreNa" | "nikatam" | "nikatAw" | "nikatena" | "nikate" | "sahiwaH" ->
        match m2 with 
         [ Wif (id2,cid2,mid2,_,_,_,_,_,_,_,_,_,_,_,_,_)
         | Kqw (id2,cid2,mid2,_,_,_,_,_,_,_,_,_,_,_,_,_,_)
         | Avykqw (id2,cid2,mid2,_,_,_,_,_,_,_,_,_) ->
       let  d12 = if id1 > id2 then id1-id2 else id2-id1 in
           if (id1 < id2)  && no_boundary_crossing_with_iwi id1 id2 text_type
           then if word1 = "sahiwaH"
           then [ Relation (id1,cid1,mid1,"sambanXa_upa",id2,cid2,mid2,"26.1",d12)] 
           else if word1 = "pUrvam" 
           then [ Relation (id1,cid1,mid1,"aXikaraNam_upa",id2,cid2,mid2,"26.2",d12)] 
           else [ Relation (id1,cid1,mid1,"xeSAXikaraNam_upa",id2,cid2,mid2,"26.3",d12)] 
           else []
         |_ -> []
         ]
       | _ -> 
           match m2 with
           [ Wif (id2,cid2,mid2,_,_,_,_,_,_,_,_,_,_,_,_,_)
           | Kqw (id2,cid2,mid2,_,_,_,_,_,_,_,_,_,_,_,_,_,_)
           | Avykqw (id2,cid2,mid2,_,_,_,_,_,_,_,_,_) ->
       let  d12 = if id1 > id2 then id1-id2 else id2-id1 in
               match rt1 with
               [ "prAk" | "yukwa " ->
                 if  (id1 < id2) && no_boundary_crossing_with_iwi id1 id2 text_type
                 then  [ Relation (id1,cid1,mid1,"sambanXa_upa",id2,cid2,mid2,"26.3",d12)] 
                 else []
               |_ -> []
               ]
          (*| "aByASa" | "aByASA" | "anurakwa" | "anurakwA" | "anya" |
            "anyA" | "Asakwa" | "AsakwA" | "avAcI" | "avAc" | "aXipawi" |
            "Ayukwa" | "AyukwA" | "Binna" | "BinnA" | "ISvara" | "iwara" |
            "iwarA" | "kuSala" | "kuSalA" | "lagna" | "lagnA" | "nipuNa" |
            "paScima" | "paScimA" | "prAcI" | "prasiwa" | "prasUwa" |
            "prasUwA" | "prawiBU" | "pUrva" | "sAkRiNI" | "sAkRin" |
            "sama" | "samA" | "saxqkRI" | "svAminI" | "svAmin" |
            "uwsuka" | "uwsukA" | "vilakRaNa" | "vilakRaNA" | "viprakqRta" |
            "viprakqRtA" | "xAyAxa" | "xUra" | "xUrA" | "sAXu" | "asAXu"|
            "samAna" | "samAnA" | "saxqkRA" | "saxqSa" | "saxqSA" | 
            "saxqkRa" | "wulya" | "wulyA" ->
           match m2 with
           [ Wif (id2,cid2,mid2,_,rt2,_,_,upasarga2,_,_,_,_,_,_,_,_)
           | Kqw (id2,cid2,mid2,_,rt2,upasarga2,_,_,_,_,_,_,_,_,_,_,_)
           | Avykqw (id2,cid2,mid2,_,rt2,_,_,upasarga2,_,_,_,_) ->
       let  d12 = if id1 > id2 then id1-id2 else id2-id1 in
             if  id1 < id2  && (no_boundary_crossing_with_iwi id1 id2) 
             && members_of rt2 upasarga2 karwqsamAnAXikaraNa_verbs
             then [ Relation (id1,cid1,mid1,"karwqsamAnAXikaraNam_upa",id2,cid2,mid2,"18.9",d12)]
             else []
           |_ -> []
           ] *)
         | _ -> []
         ]
       ] else []
   | Avy (id1,cid1,mid1,word1,rt1,_,_,_) 
   | AvywaxXiwa (id1,cid1,mid1,word1,rt1,_,_,_,_)
   | Avykqw (id1,cid1,mid1,word1,rt1,_,_,_,_,_,_,_) ->
           match word1 with
          [ "praBqwiH"|
           "aBi" | "anu" | "apa" | (*"api" | -- removed, since it overgenerates. We need to allow this only after examining examples with api *)
            "AraBya" | "A" | "aXi" | "vaRat" |
            "namaH" | "nAnA" | "pari" | "prawi" |
            "upa"  ->
              match m2 with
             [ Wif (id2,cid2,mid2,_,_,_,_,_,_,_,_,_,_,_,_,_)
             | Kqw (id2,cid2,mid2,_,_,_,_,_,_,_,_,_,_,_,_,_,_)
             | Avykqw (id2,cid2,mid2,_,_,_,_,_,_,_,_,_) ->
               let  d12 = if id1 > id2 then id1-id2 else id2-id1 in
               if (id1 < id2) && no_boundary_crossing_with_iwi id1 id2 text_type
               then [ Relation (id1,cid1,mid1,"karmapravacanIyaH",id2,cid2,mid2,"26.4a",d12)] 
               else []
             | Avy (id2,cid2,mid2,word2,rt2,_,_,_)  ->
                   let  d12 = if id1 > id2 then id1-id2 else id2-id1 in
                   if (word2 = "aswu") && (id1=previous id2)
                   then [ Relation (id1,cid1,mid1,"sambanXaH",id2,cid2,mid2,"26.4b",d12)] 
		   else []
             |_ -> []
             ]
       
          | "alam" ->
             match m2 with
             [ Wif (id2,cid2,mid2,_,rt2,_,_,upasarga2,_,_,_,_,_,_,_,_)
             | Kqw (id2,cid2,mid2,_,rt2,upasarga2,_,_,_,_,_,_,_,_,_,_,_)
             | Avykqw (id2,cid2,mid2,_,rt2,_,_,upasarga2,_,_,_,_) ->
       let  d12 = if id1 > id2 then id1-id2 else id2-id1 in
               if (id1 < id2) && no_boundary_crossing_with_iwi id1 id2 text_type
                 && members_of rt2 upasarga2 karwqsamAnAXikaraNa_verbs
               then  [ Relation (id1,cid1,mid1,"karwqsamAnAXikaraNam_upa",id2,cid2,mid2,"26.5",d12)
                     ; Relation (id1,cid1,mid1,"sambanXa_upa",id2,cid2,mid2,"26.6",d12)
                     ]
               else []
             |_ -> []
             ]  (* What is the example? *)
	   | "aXaswAw" | "puraswAw" | "paraswAw" | "avaraswAw" | "aXaH" |
             "uwwarawaH" | "xakRiNawaH" | "avaH" | "parawaH" | 
             "avarawaH" | "puraH" | "purawaH" | "pqRTawaH" | "upari" | "upariRtAw" | "paScAw" | 
             "uwwarAw" | "aXarAw" | "xakRiNAw" | "maXye"  ->
             match m2 with 
             [ Wif (id2,cid2,mid2,_,rt2,_,_,upasarga2,_,_,_,_,_,_,_,_)
             | Kqw (id2,cid2,mid2,_,rt2,upasarga2,_,_,_,_,_,_,_,_,_,_,_)
             | Avykqw (id2,cid2,mid2,_,rt2,_,_,upasarga2,_,_,_,_) ->
       let  d12 = if id1 > id2 then id1-id2 else id2-id1 in
               if (id1 < id2) && no_boundary_crossing_with_iwi id1 id2 text_type
               then if rt1="paScAw" then
                    if members_of rt2 upasarga2 apAxAna_verbs
               then [ Relation (id1,cid1,mid1,"apAxAnam_upa",id2,cid2,mid2,"26.7",d12) 
                    ; Relation (id1,cid1,mid1,"aXikaraNam_upa",id2,cid2,mid2,"26.8",d12)] 
               else if members_of rt2 upasarga2 karwqsamAnAXikaraNa_verbs 
               then [ Relation (id1,cid1,mid1,"karwA_upa",id2,cid2,mid2,"26.9",d12)
                    ; Relation (id1,cid1,mid1,"aXikaraNam_upa",id2,cid2,mid2,"26.10",d12)] 
               else [ Relation (id1,cid1,mid1,"aXikaraNam_upa",id2,cid2,mid2,"26.11",d12)] 
               else if members_of rt2 upasarga2 apAxAna_verbs
               then [ Relation (id1,cid1,mid1,"apAxAnam_upa",id2,cid2,mid2,"26.12",d12) 
                    ; Relation (id1,cid1,mid1,"xeSAXikaraNam_upa",id2,cid2,mid2,"26.13",d12)] 
               else if members_of rt2 upasarga2 karwqsamAnAXikaraNa_verbs 
               then [ Relation (id1,cid1,mid1,"karwA_upa",id2,cid2,mid2,"26.14",d12)
                    ; Relation (id1,cid1,mid1,"xeSAXikaraNam_upa",id2,cid2,mid2,"26.15",d12)] 
               else [ Relation (id1,cid1,mid1,"xeSAXikaraNam_upa",id2,cid2,mid2,"26.16",d12)] 
               else []
             |_ -> []
             ]
	| "uwwareNa" | "aXareNa" | "xakRiNena" | "xakRiNA" | "xakRiNAhi" | "uwwarA" | "uwwarAhi" | "avaswAw" ->
	match m2 with
         [ Wif (id2,cid2,mid2,_,rt2,_,_,upasarga2,_,_,_,_,_,_,_,_)
         | Kqw (id2,cid2,mid2,_,rt2,upasarga2,_,_,_,_,_,_,_,_,_,_,_)
         | Avykqw (id2,cid2,mid2,_,rt2,_,_,upasarga2,_,_,_,_) ->
       let  d12 = if id1 > id2 then id1-id2 else id2-id1 in
            if (id1 < id2) && no_boundary_crossing_with_iwi id1 id2 text_type
           (*  && members_of rt2 upasarga2 apAxAna_verbs
            then [ Relation (id1,cid1,mid1,"apAxAnam_upa",id2,cid2,mid2,"18.2",d12)] *)
             && members_of rt2 upasarga2 karwqsamAnAXikaraNa_verbs
            then [ Relation (id1,cid1,mid1,"karwA_upa",id2,cid2,mid2,"27.1",d12)]
            else [ Relation (id1,cid1,mid1,"xeSAXikaraNam_upa",id2,cid2,mid2,"27.2",d12)]
          |_ -> []
          ]

          | "agrawaH" | "aBiwaH" | "anwaH" | "aXoXaH" | "aXoZXaH" | "aXyaXi" | "anwarA"|
             "bahiH" | "nikaRA" | "samayA" | "uBayawaH" | "uparyupari" |
             "pariwaH" | "sarvawaH"  | "ArAw" ->
             match m2 with
              [ Wif (id2,cid2,mid2,_,_,_,_,_,_,_,_,_,_,_,_,_)
              | Kqw (id2,cid2,mid2,_,_,_,_,_,_,_,_,_,_,_,_,_,_)
              | Avykqw (id2,cid2,mid2,_,_,_,_,_,_,_,_,_) ->
       let  d12 = if id1 > id2 then id1-id2 else id2-id1 in
                if (id1 < id2)  && no_boundary_crossing_with_iwi id1 id2 text_type
                then [ Relation (id1,cid1,mid1,"xeSAXikaraNam_upa",id2,cid2,mid2,"27.3",d12)]
                else []
              |_ -> []
              ]
          |_ -> []
          ]
       (* Chk if all the words in upapaxa_aXikaraNa_list are xeSAXikaraNas, else we have to prepare two upapaxa axikaraNa lists: for xeSa and kAla aXikaraNas separately *)
  | _ -> [] 
  ]
;

(*
value rlupapaxa_viSeRaNa m1 m2 text_type = match m1 with
  [ Sup (id1,cid1,mid1,word1,rt1,_,_,lifgam1,viBakwiH1,vacanam1,_)
  | Kqw (id1,cid1,mid1,word1,_,_,_,_,_,_,rt1,_,_,lifgam1,viBakwiH1,vacanam1,_)
  | WaxXiwa (id1,cid1,mid1,word1,rt1,_,_,_,lifgam1,viBakwiH1,vacanam1,_) ->
    match word1 with
       [ "sAXu" | "prawIcI" | "hiwam" | "asAXu" |
         "kuSalam" | "Sam" | "uxac" | "uxIcI" ->
         match m2 with
         [ Sup (id2,cid2,mid2,word2,rt2,_,_,lifgam2,viBakwiH2,vacanam2,_)
         | Kqw (id2,cid2,mid2,word2,_,_,_,_,_,_,rt2,_,_,lifgam2,viBakwiH2,vacanam2,_)
         | WaxXiwa (id2,cid2,mid2,word2,rt2,_,_,_,lifgam2,viBakwiH2,vacanam2,_) ->
       let  d12 = if id1 > id2 then id1-id2 else id2-id1 in
           if  id1 < id2  && (no_boundary_crossing_with_iwi id1 id2) 
           &&  noun_agreement_vibh vacanam1 vacanam2 lifgam1 lifgam2 viBakwiH1 viBakwiH2
           then [ Relation (id1,cid1,mid1,"viSeRaNam_upa",id2,cid2,mid2,"19.1",d12)] 
           else []
         | _ -> []
         ]
       | _ -> match rt1 with
          [ "aByASa" | "aByASA" | "anurakwa" | "anurakwA" | "anya" |
            "anyA" | "Asakwa" | "AsakwA" | "avAcI" | "avAc" | "aXipawi" |
            "Ayukwa" | "AyukwA" | "Binna" | "BinnA" | "ISvara" | "iwara" |
            "iwarA" | "kuSala" | "kuSalA" | "lagna" | "lagnA" | "nipuNa" |
            "paScima" | "paScimA" | "prAcI" | "prasiwa" | "prasUwa" |
            "prasUwA" | "prawiBU" | "pUrva" | "sAkRiNI" | "sAkRin" |
            "sama" | "samA" | "saxqkRI" | "svAminI" | "svAmin" |
            "uwsuka" | "uwsukA" | "vilakRaNa" | "vilakRaNA" | "viprakqRta" |
            "viprakqRtA" | "xAyAxa" | "xUra" | "xUrA" | 
            "samAna" | "samAnA" | "saxqkRA" | "saxqSa" | "saxqSA" | 
            "saxqkRa" | "wulya" | "wulyA" ->
            match m2 with
           [ Sup (id2,cid2,mid2,word2,rt2,_,_,lifgam2,viBakwiH2,vacanam2,_)
           | Kqw (id2,cid2,mid2,word2,_,_,_,_,_,_,rt2,_,_,lifgam2,viBakwiH2,vacanam2,_)
           | WaxXiwa (id2,cid2,mid2,word2,rt2,_,_,_,lifgam2,viBakwiH2,vacanam2,_) ->
       let  d12 = if id1 > id2 then id1-id2 else id2-id1 in
             if  id1 < id2  && (no_boundary_crossing_with_iwi id1 id2) 
              &&  noun_agreement_vibh vacanam1 vacanam2 lifgam1 lifgam2 viBakwiH1 viBakwiH2
              then [ Relation (id1,cid1,mid1,"viSeRaNam_upa",id2,cid2,mid2,"19.2",d12)] 
              else []
           | _ -> []
           ]
          | _ -> []
          ]
       (* Chk if all the words in upapaxa_aXikaraNa_list are xeSAXikaraNas, else we have to prepare two upapaxa axikaraNa lists: for xeSa and kAla aXikaraNas separately *)
    ]
  | _ -> [] 
  ]
;
*)
(* patuwaraH SyAmaH rAmAw aswi *)

value rl_wulanA_binxu m2 m3 text_type viB1 id1 cid1 mid1 rl1 =
       match m2 with
       [ Kqw (id2,cid2,mid2,_,_,_,_,_,_,_,_,_,_,_,viB2,_,_)
       | WaxXiwa (id2,cid2,mid2,_,_,_,_,_,_,viB2,_,_)
       | Sup(id2,cid2,mid2,_,_,_,_,_,viB2,_,_)  -> match m3 with
           [ Kqw (id3,cid3,mid3,_,_,_,_,_,_,_,_,_,_,_,viB3,_,_)
           | WaxXiwa (id3,cid3,mid3,_,_,_,_,_,_,viB3,_,_)
           | Sup(id3,cid3,mid3,_,_,_,_,_,viB3,_,_)  -> 
              let d21 = if id2 > id1 then id2-id1 else id1-id2 in
              if viB3=5 && viB1=viB2
              && no_boundary_crossing_with_iwi id2 id3 text_type
              then [ Relation (id3,cid3,mid3,"wulanA_binxuH",id1,cid1,mid1,rl1,d21)]
              else []
           |_ -> []
           ]
       |_ -> []
       ]
;


value rl_wulanA m1 m2 m3 text_type = match m1 with
   [ WaxXiwa (id1,cid1,mid1,_,_,_,_,wax_prawyayaH,_,viB1,_,_) -> 
       if ((wax_prawyayaH="warap") || (wax_prawyayaH="wamap"))
       then  rl_wulanA_binxu m2 m3 text_type viB1  id1 cid1 mid1 "56.1"
       else []
   | Sup(id1,cid1,mid1,_,rt1,_,_,_,viB1,_,_) -> 
             match rt1 with
                   ["SreRTa" |"SreRTA" | "SreyasI" | "Sreyas" | "aXika" | "kuSala" | "nipuNa" |"vara"
                   | "cawura" | "cawurA" | "parA" | "para" | "uwwama" | "jyAyasI" | "jyAyas" 
                   | "jyeRTa" | "jyeRTA"| "preyas" | "preyasI" | "preRTa" | "preRTA" | "patIyas" 
                   | "patIyasI" | "patiRTa"| "patiRTA" | "laGiyas" | "laGiyasI" | "laGiRTa" 
                   | "laGiRTA" | "garIyas" | "garIyasI" | "gariRTa" | "gariRTA" 
                   | "nexiRTa" | "nexiyas" | "nexiyasI" | "sAXiRTa" | "sAXiRTA" | "sAxIyas" 
                   | "sAXiyasI"| "kaniRTa" | "kaniRTA" | "kanIyas" | "kaniyasI" | "yaviRTa" 
                   | "yaviRTA" | "yavIyas" | "yavIyAn" | "alpiRTa" | "alpiRTA" | "alpIyas" 
                   | "alpIyasI" | "srajiRTa" | "srajiRTA" | "sragvI" | "srajIyas" | "srajIyasI" 
                   | "wvaciRTa" | "wvaciRTA" | "wvacIyas" | "wvacIyasI" -> 
                       			rl_wulanA_binxu m2 m3 text_type  viB1  id1 cid1 mid1 "56.2"
                   | _  -> []
                   ]
   | Wif (id1,cid1,mid1,_,rt1,_,_,upasarga1,_,_,_,_,_,_,_,_) ->
               if (rt1="ric1" && upasarga1="awi") || (rt1="SiR2" && upasarga1="vi")
               then
                 match m2 with
                  [ Kqw (id2,cid2,mid2,_,_,_,_,_,_,_,_,_,_,_,viB2,_,_)
                  | WaxXiwa (id2,cid2,mid2,_,_,_,_,_,_,viB2,_,_)
                  | Sup(id2,cid2,mid2,_,_,_,_,_,viB2,_,_) ->
                        let d12 = if id1 > id2 then id1-id2 else id2-id1 in
                        if viB2=5 
                        then [ Relation (id2,cid2,mid2,"wulanA_binxuH",id1,cid1,mid1,"56.3",d12)]
                        else []
                  |_ -> []
                  ]
               else []
   |_ -> []
   ]
;

(* value rl_avaXiH m1 m2 text_type = match m1 with
     [ Avy (id1,cid1,mid1,word1,_,_,_,_) -> match m2 with
       [ Wif (id2,cid2,mid2,_,_,_,_,_,_,_,_,_,_,_,_,_) -> 
         let d12 = if id1 > id2 then id1-id2 else id2-id1 in
              if    id1 < id2  && (word1="yAvaw" || word1="wAvaw" || word1 = "ewAvaw")
              then [ Relation (id1,cid1,mid1,"avaXi_anwaH",id2,cid2,mid2,"48.1",d12)]
              else []
       | _ -> []
       ]
     | _ -> []
     ]
; *)
(*  rAmeNa saha sIwA vanam gacCawi; bAlAnAm kqwe samyak aswi *)
value rl_saha_vinA_kqwe m1 m2 m3 text_type = match m3 with
  [ Wif (id3,cid3,mid3,word3,rt3,_,_,upasarga3,_,_,_,_,_,_,_,_)
  | Kqw (id3,cid3,mid3,word3,rt3,upasarga3,_,_,_,_,_,_,_,_,_,_,_)
  | Avykqw (id3,cid3,mid3,word3,rt3,_,_,upasarga3,_,_,_,_) -> match m1 with

       [ Sup (id1,cid1,mid1,_,rt1,_,_,_,viBakwiH1,_,_)
       | Kqw (id1,cid1,mid1,_,_,_,_,_,_,_,rt1,_,_,_,viBakwiH1,_,_)
       | WaxXiwa (id1,cid1,mid1,_,rt1,_,_,_,_,viBakwiH1,_,_) ->  
              
       let  d13 = if id1 > id3 then id1-id3 else id3-id1 in
             match viBakwiH1 with
             [ 3 -> if rt3="gam1" && upasarga3 = "sam_Af" then [ Relation (id1,cid1,mid1,"sahArWaH",id3,cid3,mid3,"40.1a",d13)]
                    else if rt3="gam1" && upasarga3 = "sam" then [ Relation (id1,cid1,mid1,"sahArWaH",id3,cid3,mid3,"40.1b",d13)]
                    else if rt3="yuj2" && word3 = "yukwaH" then [ Relation (id1,cid1,mid1,"sahArWaH",id3,cid3,mid3,"40.1c",d13)]
                    else match m2 with
                [ Avy (id2,cid2,mid2,word2,_,_,_,_) -> 
                   let  d12 = if id1 > id2 then id1-id2 else id2-id1 in
                    match word2 with
                    [ "saha" | "sAkam" | "sArXam" | "samam"  ->
                         [ Relation (id1,cid1,mid1,"sahArWaH",id3,cid3,mid3,"40.2a",d13)
                         ; Relation (id2,cid2,mid2,"sahArWa_xyowakaH",id1,cid1,mid1,"40.2b",d12)]
		    | "anwareNa" | "vinA" | "nAnA" | "pqWak" | "qwe" ->
                         [ Relation (id1,cid1,mid1,"vinArWaH",id3,cid3,mid3,"40.2c",d13)
                         ; Relation (id2,cid2,mid2,"vinArWa_xyowakaH",id1,cid1,mid1,"40.2d",d12)]

                    | _ -> []
                    ]
                 | Sup (id2,cid2,mid2,word2,rt2,_,_,_,viBakwiH2,_,_) ->
                   let  d12 = if id1 > id2 then id1-id2 else id2-id1 in
                     if (word2 = "sahiwaH") then
                         [ Relation (id1,cid1,mid1,"sahArWaH",id3,cid3,mid3,"40.3a",d13)
                         ; Relation (id2,cid2,mid2,"sahArWa_xyowakaH",id1,cid1,mid1,"40.3b",d12)]
		     else []
                 | _ -> []
                ]
              | 2 ->  match m2 with
                  [ Avy (id2,cid2,mid2,word2,_,_,_,_) -> 
                    let  d12 = if id1 > id2 then id1-id2 else id2-id1 in
                           match word2 with
		    [ "miWaH" ->
                         [ Relation (id1,cid1,mid1,"sahArWaH",id3,cid3,mid3,"40.4",d13)
                         ; Relation (id2,cid2,mid2,"sahArWa_xyowakaH",id1,cid1,mid1,"40.5",d12)]
                    | _ -> []
                    ]
                   | _ -> []
                   ]
              | 5 ->  match m2 with
                  [ Avy (id2,cid2,mid2,word2,_,_,_,_) -> 
                    let  d12 = if id1 > id2 then id1-id2 else id2-id1 in
                           match word2 with
		    [ "qwe" ->
                         [ Relation (id1,cid1,mid1,"vinArWaH",id3,cid3,mid3,"40.6",d13)
                         ; Relation (id2,cid2,mid2,"vinArWa_xyowakaH",id1,cid1,mid1,"40.7",d12)]
                    | _ -> []
                    ]
                   | _ -> []
                   ]
              | 6 -> 
                    match m2 with 
                    [ Avy (id2,cid2,mid2,word2,_,_,_,_) -> 
       let  d12 = if id1 > id2 then id1-id2 else id2-id1 in
              match word2 with
                      ["kqwe" ->
                         [ Relation (id1,cid1,mid1,"prayojanam",id3,cid3,mid3,"40.8",d13)
                         ; Relation (id2,cid2,mid2,"prayojana_xyowakaH",id1,cid1,mid1,"40.9",d12)]
                      | _ -> []
                      ]
                    | _ -> []
                    ]
               | _ -> []
               ]
      | _ -> []
      ]
  | _ -> []
  ]
;
