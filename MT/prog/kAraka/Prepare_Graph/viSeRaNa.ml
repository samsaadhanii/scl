open Pada_structure;
open Global_var;
open Common;
open Adata;
open ParAjAwi;


value karwqrahiwakarwqsamAnAXikaraNam id1 cid1 mid1 id2 cid2 mid2 rt2 upasarga2 rl1 =
       let  d12 = if id1 > id2 then id1-id2 else id2-id1 in
      if   members_of rt2 upasarga2 karwqsamAnAXikaraNa_verbs
      then [ Relation (id1,cid1,mid1,"karwqrahiwakarwqsamAnAXikaraNam",id2,cid2,mid2, rl1,d12) ] 
      else []
;

value rlkarwqrahiwakarwqsamAnAXikaraNam m1 m2 text_type = match m1 with
    [ Kqw (id1,cid1,mid1,_,_,_,_,_,_,_,_,_,_,_,viBakwiH1,_,_)
    | WaxXiwa (id1,cid1,mid1,_,_,_,_,_,_,viBakwiH1,_,_) ->
        if viBakwiH1 = 1
        then match m2 with
        [ Wif (id2,cid2,mid2,_,rt2,_,_,upasarga2,_,_,lakAraH2,puruRaH2,_,_,_,_) ->
              if    ((puruRaH2="ma"  && wvam_pos.val = 50) || (puruRaH2="u" && aham_pos.val=50))
                 && (lakAraH2="lot" || lakAraH2 = "ASIrlif"|| lakAraH2 = "viXilif" || lakAraH2 = "lat")
                 && wvam_pos.val = 50
              then   karwqrahiwakarwqsamAnAXikaraNam id1 cid1 mid1 id2 cid2 mid2 rt2 upasarga2 "33.1"
              else []
        (*| Kqw (id2,cid2,mid2,_,rt2,upasarga2,_,_,_,_,_,_,_,_,_,_,_,_) *)
        | Avykqw (id2,cid2,mid2,_,rt2,_,_,upasarga2,_,kqw2,_,_) ->
              if kqw2 = "kwvA"
              then   karwqrahiwakarwqsamAnAXikaraNam id1 cid1 mid1 id2 cid2 mid2 rt2 upasarga2 "33.2"
              else []
        | _ -> []
        ]
        else []
    | Sup (id1,cid1,mid1,word1,rt1,pUrvapaxa1,uwwarapaxa1,_,viBakwiH1,_,_) ->
        if viBakwiH1 = 1  (* && pUrvapaxa1="y" ||  uwwarapaxa1="y"  || member_of rt1 guNavacana || member_of rt1 upAXi || member_of rt1 pUraNa || member_of rt1 taddhitaantas -- Do we really need to check these categories? somaH BUwvA, here to which category will somaH belong to? *)
        then match m2 with
        [ Wif (id2,cid2,mid2,_,rt2,_,_,upasarga2,_,_,lakAraH2,puruRaH2,_,_,_,_) ->
              if   ((puruRaH2="ma"  && wvam_pos.val = 50) || (puruRaH2="u" && aham_pos.val=50))
                && (lakAraH2="lot" || lakAraH2 = "ASIrlif"|| lakAraH2 = "viXilif" || lakAraH2 = "lat")
              then   karwqrahiwakarwqsamAnAXikaraNam id1 cid1 mid1 id2 cid2 mid2 rt2 upasarga2 "33.3"
              else []

        (*| Kqw (id2,cid2,mid2,_,rt2,upasarga2,_,_,_,_,_,_,_,_,_,_,_,_) *)

        | Avykqw (id2,cid2,mid2,_,rt2,_,_,upasarga2,_,kqw2,_,_) ->
              if kqw2 = "kwvA"
              then   karwqrahiwakarwqsamAnAXikaraNam id1 cid1 mid1 id2 cid2 mid2 rt2 upasarga2 "33.4"
              else []
        | _ -> []
        ]
        else []
    | _ -> []
    ]
;

value rlkarwqsamAnAXikaraNam m1 m2 m3 text_type = match m2 with
    [ Sup (id2,cid2,mid2,word2,rt2,_,uwwarapaxa2,lifgam2,viBakwiH2,vacanam2,_) ->
      (* if pUrvapaxa2="y" || uwwarapaxa2="y"  || member_of rt2 guNavacana 
      guNavacana removed to account for kAkaH kokilaH na Bavawi
      then*)
      match m1 with
      [ Sup (id1,cid1,mid1,word1,rt1,_,_,lifgam1,viBakwiH1,vacanam1,_)
      | Kqw (id1,cid1,mid1,word1,_,_,_,_,_,_,rt1,_,_,lifgam1,viBakwiH1,vacanam1,_)
      | WaxXiwa (id1,cid1,mid1,word1,rt1,_,_,_,lifgam1,viBakwiH1,vacanam1,_) ->
	if (word1 = "san") then []
       else 
       let  d12 = if id1 > id2 then id1-id2 else id2-id1 in
        match m3 with
        [ Wif (id3,cid3,mid3,_,rt3,_,_,upasarga3,_,_,_,puruRaH3,vacanam3,_,_,_) ->
          if   viBakwiH1=viBakwiH2 && vacanam1 = vacanam2 && viBakwiH1 = 1 
               && ((rt1 = "jyowis" && rt2="agni")|| rt2 = "miwra" || (rt1="asmax" && rt2="prakASa"))
               && rt3="BU1" && upasarga3="X" (* to account for jyowiH agniH Bavawi.  saH mama miwram aswi  ahaM prakASaH na BavAmi*)
          then [ Relation (id2,cid2,mid2,"viXeya_viSeRaNam",id1,cid1,mid1,"34.4a",d12)  ]
          else if   (viBakwiH1=viBakwiH2 && viBakwiH1 = 1 && rt1 = "vexa" && rt2="pramANa" && rt3="as2" && upasarga3="X") (* to account for vexAH pramANam aswi *)
          then [ Relation (id2,cid2,mid2,"viXeya_viSeRaNam",id1,cid1,mid1,"34.4b",d12)  ]
          else if (not (vacanam1=vacanam2) && ((rt1="mAsa" && (rt2="xakRiNAyana" || rt2="uwwarAyaNa"))|| (rt2="xArA")))
          then [ Relation (id2,cid2,mid2,"viXeya_viSeRaNam",id1,cid1,mid1,"34.4c",d12)  ]
          else if    (aBihiwa rt1 vacanam1 vacanam3 puruRaH3 || aBihiwa rt2 vacanam2 vacanam3 puruRaH3)
             &&  members_of rt3 upasarga3 karwqsamAnAXikaraNa_verbs
             && viBakwiH1=1
             && viBakwiH2=1 (* || viBakwiH2=6 *)
             (*  viBakwiH2=6 is added to account for ixam mama aswi  5.10.2019*)
(* xevasya ixam sarvam aswi  24th July 2020 
 * viBakwiH2 = 6 is removed, since it overgenerates. E.g in the sentence,
 * wasyAH ABAraNam sarovarasya wate aswi, it analyses sarovarasya as karwqsamAnAXikaraNam *)
              (* &&  viBakwiH1=viBakwiH2 *)
           && ((noun_agreement_vibh vacanam1 vacanam2 lifgam1 lifgam2 viBakwiH1 viBakwiH2) || pronominal12 rt1 || pronominal12 rt2 || (rt3="BU1" && upasarga3="X" && vacanam1 = vacanam2 && viBakwiH1 = viBakwiH2) (* to account for jyowiH agniH Bavawi *)
(* || pronominal12 rt1 *)
           || (lifgam1=lifgam2 || rt1="miwra"))  (* aham prakAsaH na BavAmi *)
           && not (member_of rt1 saMKyeya) (* yogyawA *)
           && (not (viBakwiH2=1 && rt2="kim") || (rt2="kim" && viBakwiH1=viBakwiH2 && vacanam1=vacanam2 && lifgam1=lifgam2))
           (*&& (not (viBakwiH1=1 && rt1="kim") || (rt1="kim" && viBakwiH1=viBakwiH2 && vacanam1=vacanam2 && lifgam1=lifgam2))*)
           (* parIkRA-arWinaH mArge kim aBavaw -- parIkRA-arWinaH should not be karwqsamAnAXikaraNam *)
           && not (rt2 = get_assoc rt1 parAjAwi_list)
           && ((member_of rt2 guNavacana) || member_of rt2 sambanXavAcI || member_of rt2 upAXi || uwwarapaxa2 = "y" || rt1="ewax" || rt1="wax" || member_of rt2 taddhitaantas || member_of rt2 intensifiers_list|| rt2="kim") (* yogyawA  awra SuxXaM jalaM aswi; jalam should not be marked as a viXeya viSeRaNam ; eRA SobanA velA aswi. velA is not a guNavacana*)
           (* && not (pUrva2=uwwara2) || (member_of rt2 guNavacana)) *)
           && not (rt1="kiFciw" || rt1="kiFcana"|| rt1="yAvaw" || rt1="wAvaw" ) (* yogyawA  To stop: kA hAniH Bavawi hAniH is karwqsamAnAXikaraNa of kA
           Earlier kim was also included in the above list. But hAniH as karwqsam is OK. This is similar to sunxara-kANde kim na sunxaram bhavawi *)
           (* && prose_order id1 id2 text_type *)
            && (id1 < id2 || rt1="kim" || text_type = "Sloka")
            (* To handle "samarWaH aswi janaH / janaH samarWaH aswi", we need to have better condition than removing id1 < id2  -- 25 Jul 2020/ 3rd Nov 2020 *)
           && prose_order id2 id3 text_type 
           (* && id2-id1 <= 3   Found an example where this diff is > 3 *)
(* Bhatti kAavya 1.1 shloka *)
	 && not (member_of rt1 intensifiers_list)
         && no_boundary_crossing_with_iwi id2 id3 text_type
         && no_boundary_crossing_with_iwi id1 id2 text_type
         && ((id2=1) || (id2 > id1 )) (* The first word can not be a viXeya viSeRaNa, except cases such as samarWaH aswi janaH *)
         && (not(id2=1) || (id1-id2 < 3 )) (* The first word can not be a viXeya viSeRaNa, except cases such as samarWaH aswi janaH *)
	 (* && (id2 = total_wrds.val -1 || id2 = total_wrds.val-2 || text_type = "Sloka") (* -2 to take into account ca/api etc. *) -- we found examples where more than 2 viXeya viSeRaNas are possible. Hence commented *)
          then [ Relation (id2,cid2,mid2,"viXeya_viSeRaNam",id1,cid1,mid1,"34.1",d12) ]
(* rel is marked with the verb and not with the karwA. This is to ensure that the parse is correct. 
Consider a sent with X Y v1 v2, where X and Y are karwA and karwAsamAnAXikaraNa w.r.t v1 and not wrt v2. And suppose in the final parse X is karwA of v2, then marking a relation of karwAsamAnAXikaraNa between X and Y will be wrong *)
        else if (aBihiwa rt1 vacanam1 vacanam3 puruRaH3 || pronominal12 rt2)
	     && id1 < id2
             && viBakwiH1=1
             && viBakwiH2=1 
             &&  members_of rt3 upasarga3 karwqsamAnAXikaraNa_verbs
             then if (member_of rt1 pUraNa)
             then [ Relation (id2,cid2,mid2,"viXeya_viSeRaNam",id1,cid1,mid1,"34.1a",d12) ]
             else if ((rt1 = "vexa" && rt2 = "pramANa") || (rt1 = "inxriya" && (rt2 = "jihvA"|| rt2 = "wvac"))|| (rt1="saxAcAra" && rt2="Xarma"))
             then [ Relation (id2,cid2,mid2,"viXeya_viSeRaNam",id1,cid1,mid1,"34.1b",d12) ]
             else []
         else []
      | Kqw (id3,cid3,mid3,_,rt3,upasarga3,_,_,_,_,_,_,_,_,_,_,_)
      | Avykqw (id3,cid3,mid3,_,rt3,_,_,upasarga3,_,_,_,_) ->
          if members_of rt3 upasarga3 karwqsamAnAXikaraNa_verbs
           && viBakwiH1=viBakwiH2
           && ((vacanam1=vacanam2) || (rt1="mAsa" && (rt2="xakRiNAyana" || rt2="uwwarAyaNa")))
           && not (member_of rt1 saMKyeya) (* yogyawA *)
           (*&& not (member_of rt1 guNavacana) (* yogyawA *)
           &&  (member_of rt2 guNavacana) (* yogyawA *) *)
           (* && prose_order id1 id2 text_type
            samarWaH aswi janaH / janaH samarWaH aswi -- 25 Jul 2020 *)
            && id1 < id2 
           && prose_order id2 id3 text_type
           (* && id2-id1 <= 3 *)
         && viBakwiH1=1 && no_boundary_crossing_with_iwi id2 id3 text_type
          then [ Relation (id2,cid2,mid2,"viXeya_viSeRaNam",id1,cid1,mid1,"34.2",d12)   ]
        else []
      | _ -> []
      ]
(* Following part is added to account for the karwqsamAnAXikaraNam relation in the case of upapaxa viBakwis 
E.g. grAmasya aXareNa vanam aswi.*)
      | Avy (id1,cid1,mid1,word1,_,_,_,_)
      | AvywaxXiwa (id1,cid1,mid1,word1,_,_,_,_,_) -> match m3 with
        [ Wif (id3,cid3,mid3,_,rt3,_,_,upasarga3,_,_,_,_,_,_,_,_)
        | Kqw (id3,cid3,mid3,_,rt3,upasarga3,_,_,_,_,_,_,_,_,_,_,_)
        | Avykqw (id3,cid3,mid3,_,rt3,_,_,upasarga3,_,_,_,_) ->
       let  d12 = if id1 > id2 then id1-id2 else id2-id1 in
          if members_of rt3 upasarga3 karwqsamAnAXikaraNa_verbs
           && viBakwiH2=1
           && prose_order id1 id2 text_type
           && prose_order id2 id3 text_type
            && id1 < id2 
           (* && id2-id1 <= 3 *)
           && no_boundary_crossing_with_iwi id2 id3 text_type
          then match word1 with
          [ "avaH" | "avaraswAw"| "avarawaH" | "avaswAw" | "aXaH"|
            "aXarAw" | "aXaswAw" | "paraswAw"| "parawaH"| "aXareNa"|
            "paScAw" | "puraH" | "puraswAw"| "purawaH"| "upari"|
            "upariRtAw"| "uwwarA"| "uwwarAhi"| "uwwarAw"| "uwwarawaH"|
            "uwwareNa"| "xakRiNA"| "xakRiNAhi"| "xakRiNAw"| "xakRiNawaH"|
            "xakRiNena" ->
            [ Relation (id2,cid2,mid2,"viXeya_viSeRaNam",id1,cid1,mid1,"34.3",d12) ] 
          | "nAma" -> if members_of rt3 upasarga3 karwqsamAnAXikaraNa_verbs then
                      [ Relation (id2,cid2,mid2,"viXeya_viSeRaNam",id1,cid1,mid1,"34.3a",d12) 
                      ; Relation (id1,cid1,mid1,"karwA_be_verbs",id3,cid3,mid3,"34.3b",d12) ]
		      else []
          |_ -> []
          ]
          else []
        | _ -> []
        ]
      | _ -> []
      ]
      (* else [] *)
  | Kqw (id2,cid2,mid2,word2,_,_,_,_,_,_,rt2,_,_,lifgam2,viBakwiH2,vacanam2,_)
  | WaxXiwa (id2,cid2,mid2,word2,rt2,_,_,_,lifgam2,viBakwiH2,vacanam2,_) ->
      match m1 with
      [ Sup (id1,cid1,mid1,_,rt1,_,_,lifgam1,viBakwiH1,vacanam1,_)
      | Kqw (id1,cid1,mid1,_,_,_,_,_,_,_,rt1,_,_,lifgam1,viBakwiH1,vacanam1,_)
      | WaxXiwa (id1,cid1,mid1,_,rt1,_,_,_,lifgam1,viBakwiH1,vacanam1,_) ->
       let  d12 = if id1 > id2 then id1-id2 else id2-id1 in
        match m3 with
        [ Wif (id3,cid3,mid3,_,rt3,_,_,upasarga3,_,prayogaH3,_,puruRaH3,vacanam3,_,_,_) ->
          if   (viBakwiH1=viBakwiH2 && vacanam1 = vacanam2 && viBakwiH1 = 1 && rt1 = "jyowis" && rt2="agni" && rt3="BU1" && upasarga3="X") (* to account for jyowiH agniH Bavawi *)
          then [ Relation (id2,cid2,mid2,"viXeya_viSeRaNam",id1,cid1,mid1,"34.4a",d12)  ]
          else if   (viBakwiH1=viBakwiH2 && viBakwiH1 = 1 && rt1 = "vexa" && rt2="pramANa" && rt3="as2" && upasarga3="X") (* to account for vexAH pramANam aswi *)
          then [ Relation (id2,cid2,mid2,"viXeya_viSeRaNam",id1,cid1,mid1,"34.4b",d12)  ]
          else if ((vacanam1=vacanam2) || (rt1="mAsa" && (rt2="xakRiNAyana" || rt2="uwwarAyaNa"))|| (rt2="xArA"))
          then [ Relation (id2,cid2,mid2,"viXeya_viSeRaNam",id1,cid1,mid1,"34.4c",d12)  ]
	  else if aBihiwa rt1 vacanam1 vacanam3 puruRaH3
             && members_of rt3 upasarga3 karwqsamAnAXikaraNa_verbs
             && viBakwiH1=viBakwiH2 && prayogaH3 = "karwari"
           && ((noun_agreement_vibh vacanam1 vacanam2 lifgam1 lifgam2 viBakwiH1 viBakwiH2) || pronominal12 rt1 )
(* || pronominal12 rt1 *)
           && not (member_of rt1 saMKyeya) (* yogyawA *)
           (*&& not (member_of rt1 guNavacana) (* yogyawA *)*)
           && not ( rt1="kiFciw" || rt1="kiFcana"|| rt1="yAvaw" || rt1="wAvaw" )  (* kim is removed, since we can have kaH guNavAn aswi *)
           (* && prose_order id1 id2 text_type 
            * samarWaH aswi janaH / janaH samarWaH aswi -- 25 Jul 2020 *)
            && (id1 < id2  || rt1 = "kim")
           && prose_order id2 id3 text_type
           (* && id2-id1 <= 3   found an example where diff is > 3 *)
(* Bhatti kAavya 1.1 shloka *)
         && viBakwiH1=1 && no_boundary_crossing_with_iwi id2 id3 text_type
        then [ Relation (id2,cid2,mid2,"viXeya_viSeRaNam",id1,cid1,mid1,"34.4",d12)  ]
(* rel is marked with the verb and not with the karwA. This is to ensure that the parse is correct. 
Consider a sent with X Y v1 v2, where X and Y are karwA and karwAsamAnAXikaraNa w.r.t v1 and not wrt v2. And suppose in the final parse X is karwA of v2, then marking a relation of karwAsamAnAXikaraNa between X and Y will be wrong *)
        else []
      | Kqw (id3,cid3,mid3,_,rt3,upasarga3,_,_,_,_,_,_,_,_,_,_,_) 
      | Avykqw (id3,cid3,mid3,_,rt3,_,_,upasarga3,_,_,_,_) ->
          if members_of rt3 upasarga3 karwqsamAnAXikaraNa_verbs
	   && not (word2="san")  (* we need to reqrite this adding a condition that the kqw2 is not Sawq_lat *)
           && viBakwiH1=viBakwiH2
           && ((vacanam1=vacanam2) || (rt1="mAsa" && (rt2="xakRiNAyana" || rt2="uwwarAyaNa")))
           && not (member_of rt1 saMKyeya) (* yogyawA *)
           (*&& not (member_of rt1 guNavacana) (* yogyawA *)
           &&  (member_of rt2 guNavacana) (* yogyawA *)*)
           (* && prose_order id1 id2 text_type
            samarWaH aswi janaH / janaH samarWaH aswi -- 25 Jul 2020 *)
            && id1 < id2 
           && prose_order id2 id3 text_type
           (* && id2-id1 <= 3 *)
         && viBakwiH1=1 && no_boundary_crossing_with_iwi id2 id3 text_type
          then [ Relation (id2,cid2,mid2,"viXeya_viSeRaNam",id1,cid1,mid1,"34.5",d12)  ]
        else []
        | _ -> []
        ]
      | Avy (id1,cid1,mid1,word1,_,_,_,_) 
      | AvywaxXiwa (id1,cid1,mid1,word1,_,_,_,_,_) -> 
       let  d12 = if id1 > id2 then id1-id2 else id2-id1 in
       match m3 with
        [ Wif (id3,cid3,mid3,_,rt3,_,_,upasarga3,_,_,_,_,_,_,_,_)
        | Kqw (id3,cid3,mid3,_,rt3,upasarga3,_,_,_,_,_,_,_,_,_,_,_)
        | Avykqw (id3,cid3,mid3,_,rt3,_,_,upasarga3,_,_,_,_) ->
          if members_of rt3 upasarga3 karwqsamAnAXikaraNa_verbs
           && viBakwiH2=1
           && prose_order id1 id2 text_type
           && prose_order id2 id3 text_type
           (* && id2-id1 <= 3 *)
            && id1 < id2 
           && no_boundary_crossing_with_iwi id2 id3 text_type
          then match word1 with
          [ "avaH" | "avaraswAw"| "avarawaH" | "avaswAw" | "aXaH"|
            "aXarAw" | "aXareNa" | "aXaswAw" | "paraswAw"| "parawaH"|
            "paScAw" | "puraH" | "puraswAw"| "purawaH"| "upari"|
            "upariRtAw"| "uwwarA"| "uwwarAhi"| "uwwarAw"| "uwwarawaH"|
            "uwwareNa"| "xakRiNA"| "xakRiNAhi"| "xakRiNAw"| "xakRiNawaH"|
            "xakRiNena" ->
            [ Relation (id2,cid2,mid2,"viXeya_viSeRaNam",id1,cid1,mid1,"34.6",d12) ] 
          |_ -> []
          ]
          else []
        | _ -> []
        ]
      | _ -> []
      ]
  | Avy (id2,cid2,mid2,word2,_,_,_,_)
  | AvywaxXiwa (id2,cid2,mid2,word2,_,_,_,_,_) -> match word2 with
       [ "avaH" | "avaraswAw"| "avarawaH" | "avaswAw" | "aXaH"|
         "aXarAw" | "aXareNa" | "aXaswAw" | "paraswAw"| "parawaH"|
         "paScAw" | "puraH" | "puraswAw"| "purawaH"| "upari"|
         "upariRtAw"| "uwwarA"| "uwwarAhi"| "uwwarAw"| "uwwarawaH"|
         "uwwareNa"| "xakRiNA"| "xakRiNAhi"| "xakRiNAw"| "xakRiNawaH"|
         "xakRiNena" |
         "miWyA" | "anyaWA" ->
          match m1 with
         [ Sup (id1,cid1,mid1,_,rt1,_,_,_,viBakwiH1,_,_)
         | Kqw (id1,cid1,mid1,_,_,_,_,_,_,_,rt1,_,_,_,viBakwiH1,_,_)
         | WaxXiwa (id1,cid1,mid1,_,rt1,_,_,_,_,viBakwiH1,_,_) ->
       let  d12 = if id1 > id2 then id1-id2 else id2-id1 in
           match m3 with
           [ Wif (id3,cid3,mid3,_,rt3,_,_,upasarga3,_,_,_,puruRaH3,_,_,_,_) ->
                if members_of rt3 upasarga3 karwqsamAnAXikaraNa_verbs
              (*&& ((noun_agreement_vibh rt1 vacanam1 vacanam2 lifgam1 lifgam2 viBakwiH1 viBakwiH2) || pronominal12 rt1)  to account for jyowiH agniH Bavawi *)
(* || pronominal12 rt1 *)
              && not (member_of rt1 saMKyeya) (* yogyawA *)
              && prose_order id1 id2 text_type
              && prose_order id2 id3 text_type
            && id1 < id2 
              (* && id2-id1 <= 3 *)
            && viBakwiH1=1 && no_boundary_crossing_with_iwi id2 id3 text_type
           then [ Relation (id2,cid2,mid2,"viXeya_viSeRaNam",id1,cid1,mid1,"34.7",d12) ] 
           else []
(* rel is marked with the verb and not with the karwA. This is to ensure that the parse is correct. 
Consider a sent with X Y v1 v2, where X and Y are karwA and karwAsamAnAXikaraNa w.r.t v1 and not wrt v2. And suppose in the final parse X is karwA of v2, then marking a relation of karwAsamAnAXikaraNa between X and Y will be wrong *)
          | Kqw (id3,cid3,mid3,_,rt3,upasarga3,_,_,_,_,_,_,_,_,_,_,_)
          | Avykqw (id3,cid3,mid3,_,rt3,_,_,upasarga3,_,_,_,_) ->
          if members_of rt3 upasarga3 karwqsamAnAXikaraNa_verbs
           && prose_order id1 id2 text_type
           && prose_order id2 id3 text_type
           (* && id2-id1 <= 3 *)
            && id1 < id2 
           && viBakwiH1=1 && no_boundary_crossing_with_iwi id2 id3 text_type
           then [ Relation (id2,cid2,mid2,"viXeya_viSeRaNam",id1,cid1,mid1,"34.8",d12) ] 
           else []
          |_ -> []
          ]
        |_ -> []
        ]
    |_ -> []
    ]
  | _ -> []
  ]
;

(* In case there is no 'be' verb, then this function marks karwqsamAnAXikaraNa 
 * Example: saH vExyaH
 * अ-पर्याप्तम् तत् अस्माकम् बलम् भीष्म-अभिरक्षितम्*)

value rlkarwqsamAnAXikarana_noverb m1 m2 text_type = 
        if karwqsamverbs.val = 50
        then
        match m2 with
    [ Sup (id2,cid2,mid2,word2,rt2,_,uwwarapaxa2,_,viBakwiH2,vacanam2,_) ->
      (* if pUrvapaxa2="y" || uwwarapaxa2="y" || member_of rt2 guNavacana 
      guNavacana removed to accound for kAkaH kokilaH na Bavawi
      then*)
      match m1 with
      [ Sup (id1,cid1,mid1,word1,rt1,pUrvapaxa1,uwwarapaxa1,lifgam1,viBakwiH1,vacanam1,_)
      | Kqw (id1,cid1,mid1,word1,_,_,_,_,_,_,rt1,pUrvapaxa1,uwwarapaxa1,lifgam1,viBakwiH1,vacanam1,_)
      | WaxXiwa (id1,cid1,mid1,word1,rt1,pUrvapaxa1,uwwarapaxa1,_,lifgam1,viBakwiH1,vacanam1,_) ->
       let  d12 = if id1 > id2 then id1-id2 else id2-id1 in
          if (   finite_verb_in_sentence.val = 50 
              || finite_verb_in_sentence.val = id1 ) 
          (* The second condition is to handle rAmaH vExyaH *)
          then
           if viBakwiH1=1
             && (viBakwiH2=1 || (viBakwiH2=6 && pronominal123 rt2))
             (*  viBakwiH2=6 is added to account for ixam mama Bavawi  5.10.2019*)
              (* &&  viBakwiH1=viBakwiH2 *)
           (*&& ((noun_agreement_vibh rt1 vacanam1 vacanam2 lifgam1 lifgam2 viBakwiH1 viBakwiH2) || pronominal12 rt1)  to account for jyowiH agniH Bavawi *)
(* || pronominal12 rt1 *)
           && ((vacanam1=vacanam2) || (rt1="mAsa" && (rt2="xakRiNAyana" || rt2="uwwarAyaNa"))|| (rt2="xArA") || (rt1 = "vexa" && rt2="pramANa"))
           && not (member_of rt1 saMKyeya) (* yogyawA *)
           (*&& (not (pronominal123 rt2) || rt2="kim")
              commented; since we can have saH vExyaH *)
           && not (rt2 = get_assoc rt1 parAjAwi_list)
           (*&& not (member_of rt1 guNavacana)*) (* yogyawA *)
           (* && not (pUrva2=uwwara2) || (member_of rt2 guNavacana)) *)
           && not (rt1="kiFciw" || rt1="kiFcana"|| rt1="yAvaw" || rt1="wAvaw" ) (* yogyawA  To stop: kA hAniH Bavawi hAniH is karwqsamAnAXikaraNa of kA
           Earlier kim was also included in the above list. But hAniH as karwqsam is OK. This is similar to sunxara-kANde kim na sunxaram bhavawi *)
           && (*prose_order id1 id2 text_type *)
           id1 < id2 
           (* && id2-id1 <= 3   Found an example where this diff is > 3 *)
(* Bhatti kAavya 1.1 shloka *)
        then [Relation (id2,cid2,mid2,"samAnAXikaraNam",id1,cid1,mid1,"34.9",d12) ]
(* rel is marked with the verb and not with the karwA. This is to ensure that the parse is correct. 
Consider a sent with X Y v1 v2, where X and Y are karwA and karwAsamAnAXikaraNa w.r.t v1 and not wrt v2. And suppose in the final parse X is karwA of v2, then marking a relation of karwAsamAnAXikaraNa between X and Y will be wrong *)
        else []
        else []
(* Following part is added to account for the karmasamAnAXikaraNam relation in the case of upapaxa viBakwis 
E.g. grAmasya aXareNa vanam aswi.*)
      | Avy (id1,cid1,mid1,word1,_,_,_,_)
      | AvywaxXiwa (id1,cid1,mid1,word1,_,_,_,_,_)  ->
       let  d12 = if id1 > id2 then id1-id2 else id2-id1 in
          if (   finite_verb_in_sentence.val = 50 
              || finite_verb_in_sentence.val = id1 ) 
          then if viBakwiH2=1
           && prose_order id1 id2 text_type
           (* && id2-id1 <= 3 *)
          then match word1 with
          [ "avaH" | "avaraswAw"| "avarawaH" | "avaswAw" | "aXaH"|
            "aXarAw" | "aXaswAw" | "paraswAw"| "parawaH"| "aXareNa"|
            "paScAw" | "puraH" | "puraswAw"| "purawaH"| "upari"|
            "upariRtAw"| "uwwarA"| "uwwarAhi"| "uwwarAw"| "uwwarawaH"|
            "uwwareNa"| "xakRiNA"| "xakRiNAhi"| "xakRiNAw"| "xakRiNawaH"|
            "xakRiNena" ->
            [ Relation (id2,cid2,mid2,"samAnAXikaraNam",id1,cid1,mid1,"34.10",d12) ] 
          |_ -> []
          ]
          else []
          else []
      | _ -> []
      ]
      (* else [] *)
  | Kqw (id2,cid2,mid2,_,_,_,_,_,_,_,rt2,_,_,_,viBakwiH2,vacanam2,_)
  | WaxXiwa (id2,cid2,mid2,_,rt2,_,_,_,_,viBakwiH2,vacanam2,_) -> match m1 with
      [ Sup (id1,cid1,mid1,_,rt1,_,_,lifgam1,viBakwiH1,vacanam1,_)
      | Kqw (id1,cid1,mid1,_,_,_,_,_,_,_,rt1,_,_,lifgam1,viBakwiH1,vacanam1,_)
      | WaxXiwa (id1,cid1,mid1,_,rt1,_,_,_,lifgam1,viBakwiH1,vacanam1,_) ->
       let  d12 = if id1 > id2 then id1-id2 else id2-id1 in
          if (   finite_verb_in_sentence.val = 50 
              || finite_verb_in_sentence.val = id1 ) 
          then  if viBakwiH1=viBakwiH2 
           (*&& ((noun_agreement_vibh rt1 vacanam1 vacanam2 lifgam1 lifgam2 viBakwiH1 viBakwiH2) || pronominal12 rt1)  to account for jyowiH agniH Bavawi *)
(* || pronominal12 rt1 *)
           && ((vacanam1=vacanam2) || (rt1="mAsa" && (rt2="xakRiNAyana" || rt2="uwwarAyaNa"))|| (rt2="xArA") || (rt1 = "vexa" && rt2="pramANa"))
           && not (member_of rt1 saMKyeya) (* yogyawA *)
           (*&& not (member_of rt1 guNavacana) (* yogyawA *)*)
           && not (rt1="kim" || rt1="kiFciw" || rt1="kiFcana"|| rt1="yAvaw" || rt1="wAvaw" ) (* yogyawA  To stop: kA hAniH Bavawi hAniH is not karwqsamAnAXikaraNa of kA*)
           && prose_order id1 id2 text_type
           && ( id2 = next id1 || id1 = next id2 )
         && viBakwiH1=1 
        then [ Relation (id2,cid2,mid2,"samAnAXikaraNam",id1,cid1,mid1,"34.11",d12) ] 
(* rel is marked with the verb and not with the karwA. This is to ensure that the parse is correct. 
Consider a sent with X Y v1 v2, where X and Y are karwA and karwAsamAnAXikaraNa w.r.t v1 and not wrt v2. And suppose in the final parse X is karwA of v2, then marking a relation of karwAsamAnAXikaraNa between X and Y will be wrong *)
        else []
        else []
      | Avy (id1,cid1,mid1,word1,_,_,_,_) 
      | AvywaxXiwa (id1,cid1,mid1,word1,_,_,_,_,_) -> 
       let  d12 = if id1 > id2 then id1-id2 else id2-id1 in
          if (   finite_verb_in_sentence.val = 50 
              || finite_verb_in_sentence.val = id1 ) 
          then if   viBakwiH2=1
                 && prose_order id1 id2 text_type
           (* && id2-id1 <= 3 *)
          then match word1 with
          [ "avaH" | "avaraswAw"| "avarawaH" | "avaswAw" | "aXaH"|
            "aXarAw" | "aXareNa" | "aXaswAw" | "paraswAw"| "parawaH"|
            "paScAw" | "puraH" | "puraswAw"| "purawaH"| "upari"|
            "upariRtAw"| "uwwarA"| "uwwarAhi"| "uwwarAw"| "uwwarawaH"|
            "uwwareNa"| "xakRiNA"| "xakRiNAhi"| "xakRiNAw"| "xakRiNawaH"|
            "xakRiNena" ->
            [ Relation (id2,cid2,mid2,"samAnAXikaraNam",id1,cid1,mid1,"34.12",d12) ] 
          |_ -> []
          ]
          else []
          else []
    | _ -> []
    ]
  | Avy (id2,cid2,mid2,word2,_,_,_,_)
  | AvywaxXiwa (id2,cid2,mid2,word2,_,_,_,_,_) -> 
match word2 with
       [ "avaH" | "avaraswAw"| "avarawaH" | "avaswAw" | "aXaH"|
         "aXarAw" | "aXareNa" | "aXaswAw" | "paraswAw"| "parawaH"|
         "paScAw" | "puraH" | "puraswAw"| "purawaH"| "upari"|
         "upariRtAw"| "uwwarA"| "uwwarAhi"| "uwwarAw"| "uwwarawaH"|
         "uwwareNa"| "xakRiNA"| "xakRiNAhi"| "xakRiNAw"| "xakRiNawaH"|
         "xakRiNena" | "alam" |
         "miWyA" | "anyaWA" ->
          match m1 with
         [ Sup (id1,cid1,mid1,_,rt1,_,_,_,viBakwiH1,_,_)
         | Kqw (id1,cid1,mid1,_,_,_,_,_,_,_,rt1,_,_,_,viBakwiH1,_,_)
         | WaxXiwa (id1,cid1,mid1,_,rt1,_,_,_,_,viBakwiH1,_,_) ->
       let  d12 = if id1 > id2 then id1-id2 else id2-id1 in
          if (   finite_verb_in_sentence.val = 50 
              || finite_verb_in_sentence.val = id1 ) 
          then  if not (member_of rt1 saMKyeya) (* yogyawA *)
              && prose_order id1 id2 text_type
            && viBakwiH1=1 
           then [ Relation (id2,cid2,mid2,"samAnAXikaraNam",id1,cid1,mid1,"34.13",d12) ] 
           else []
           else []
(* rel is marked with the verb and not with the karwA. This is to ensure that the parse is correct. 
Consider a sent with X Y v1 v2, where X and Y are karwA and karwAsamAnAXikaraNa w.r.t v1 and not wrt v2. And suppose in the final parse X is karwA of v2, then marking a relation of karwAsamAnAXikaraNa between X and Y will be wrong *)
        |_ -> []
        ]
    |_ -> []
    ]
  | _ -> []
  ]
  else []
;

value vikArya rt1 rt2 =
       (rt1="suvarNa" && rt2 = "kuNdala")
   ||  (rt1="mqwwikA" && rt2 = "Gata")
   ||  (rt1="SUrpaNaKA" && rt2 = "virUpiwA")
   ||  ((member_of rt1 manuRyasaFjFAvAcI) && (member_of rt2 guNavacana))
;
  
value rlkarmasamAnAXikaraNam m1 m2 m3 text_type = 
    match m2 with
    [ Sup (id2,cid2,mid2,word2,rt2,pUrvapaxa2,uwwarapaxa2,gen2,viB2,vac2,_) ->
      if not (pronominal123 rt2)   && not ( member_of rt2 manuRyasaFjFAvAcI ) (* && 
      ((member_of rt2 guNavacana) || pUrvapaxa2="y" || uwwarapaxa2="y") 
      deleted to allow  xevAn xivOkasaH vaxanwi *)
          then
      match m1 with
      [ Sup (id1,cid1,mid1,word1,rt1,_,_,gen1,viB1,vac1,_)
      | Kqw (id1,cid1,mid1,word1,_,_,_,_,_,_,rt1,_,_,gen1,viB1,vac1,_)
      | WaxXiwa (id1,cid1,mid1,word1,rt1,_,_,_,gen1,viB1,vac1,_) ->
           if no_boundary_crossing_with_iwi id1 id2 text_type 
           && prose_order id1 id2 text_type 
           && not (rt1="kim" ||  rt1="kiFciw" || rt1="kiFcana" || rt1="IxqS" || rt1="kIxqS" || rt1="kIxqSa" || rt1="IxqSa") 
                      (* to avoid kIxqSam vyavahAram as karma, karmasamAnAXikaraNam*)
           && noun_agreement_vibh vac1 vac2 gen1 gen1 viB1 viB2 
           then match m3 with 
            [ Kqw (id3,cid3,mid3,_,rt3,upasarga3,_,prawyayaH3,_,_,_,_,_,_,_,_,_)
            | Avykqw (id3,cid3,mid3,_,rt3,_,_,upasarga3,_,prawyayaH3,_,_) ->
               let  d23 = if id2 > id3 then id2-id3 else id3-id2 in
               if   members_of rt3 upasarga3 karmasamAnAXikaraNa_verbs 
                 && (viB1=2 || ((prawyayaH3="kwa" || prawyayaH3="kwavawu") && viB1=1))
                 && (vikArya rt1 rt2 || not (rt3="kq3"))
               then [ Relation (id2,cid2,mid2,"karmasamAnAXikaraNam",id3,cid3,mid3,"35.1",d23) ]
                (* waxA AyojakAH neharUM sanwuRtaM kqwavanwaH *)
               else []
            | Wif (id3,cid3,mid3,_,rt3,_,_,upasarga3,_,prayogaH3,_,_,_,_,_,_) ->
               let  d23 = if id2 > id3 then id2-id3 else id3-id2 in
               if  members_of rt3 upasarga3 karmasamAnAXikaraNa_verbs
               && (vikArya rt1 rt2 || not (rt3="kq3"))
               && prose_order id1 id2 text_type 
               then if    (prayogaH3="karwari" && viB1=2) || ( prayogaH3="karmaNi" && viB1=1)
                    then [ Relation (id2,cid2,mid2,"karmasamAnAXikaraNam",id3,cid3,mid3,"35.2",d23) ]
                    else []
                   (* to avoid kIxqSam vyavahAram as karma, karmasamAnAXikaraNam*)
               else []
            | _ -> []
            ]
            else []
      | _ -> []
      ] else []
    | Avy (id2,cid2,mid2,_,rt2,_,_,_) -> 
        if rt2="BasmasAwa" then
        match m1 with
        [ Sup (id1,cid1,mid1,_,rt1,_,_,_,_,_,_)
        | Kqw (id1,cid1,mid1,_,_,_,_,_,_,_,rt1,_,_,_,_,_,_)
        | WaxXiwa (id1,cid1,mid1,_,rt1,_,_,_,_,_,_,_) ->
             if no_boundary_crossing_with_iwi id1 id2 text_type && id1 < id2
             then match m3 with 
              [ Kqw (id3,cid3,mid3,_,rt3,upasarga3,_,_,_,_,_,_,_,_,_,_,_)
              | Avykqw (id3,cid3,mid3,_,rt3,_,_,upasarga3,_,_,_,_) ->
       let  d23 = if id2 > id3 then id2-id3 else id3-id2 in
                if rt3="kq3" && prose_order id2 id3 text_type && (vikArya rt1 rt2)
                then [ Relation (id2,cid2,mid2,"karmasamAnAXikaraNam",id3,cid3,mid3,"35.4",d23) ]
                else []
              | Wif (id3,cid3,mid3,_,rt3,_,_,upasarga3,_,prayogaH3,_,_,_,_,_,_) ->
       let  d23 = if id2 > id3 then id2-id3 else id3-id2 in
                if rt3="kq3" && prose_order id2 id3 text_type && (vikArya rt1 rt2)
                then [ Relation (id2,cid2,mid2,"karmasamAnAXikaraNam",id3,cid3,mid3,"35.5",d23) ]
                else []
              | _ -> []
              ]
              else []
        | _ -> []
        ]
        else []
    | Kqw (id2,cid2,mid2,word2,_,_,_,_,_,_,rt2,pUrvapaxa2,uwwarapaxa2,gen2,viB2,vac2,_)
    | WaxXiwa (id2,cid2,mid2,word2,rt2,pUrvapaxa2,uwwarapaxa2,_,gen2,viB2,vac2,_) ->
      if not (pronominal123 rt2) 
      then match m1 with
      [ Sup (id1,cid1,mid1,word1,rt1,_,_,gen1,viB1,vac1,_)
      | Kqw (id1,cid1,mid1,word1,_,_,_,_,_,_,rt1,_,_,gen1,viB1,vac1,_)
      | WaxXiwa (id1,cid1,mid1,word1,rt1,_,_,_,gen1,viB1,vac1,_) ->
           if no_boundary_crossing_with_iwi id1 id2 text_type && id1 < id2
           && not (rt1="kim" ||  rt1="kiFciw" || rt1="kiFcana" || rt1="IxqS" || rt1="kIxqS" || rt1="kIxqSa" || rt1="IxqSa") 
           then match m3 with 
            [ Kqw (id3,cid3,mid3,_,rt3,upasarga3,_,prawyayaH3,_,_,_,_,_,_,_,_,_)
            | Avykqw (id3,cid3,mid3,_,rt3,_,_,upasarga3,_,prawyayaH3,_,_) ->
       let  d23 = if id2 > id3 then id2-id3 else id3-id2 in
            if uwwarapaxa2="y" && sp_uwwarapaxa rt2 word2 gen2 then []
            else if   noun_agreement_vibh vac1 vac2 gen1 gen2 viB1 viB2 
                   && members_of rt3 upasarga3 karmasamAnAXikaraNa_verbs 
                   && (viB1=2 || ((prawyayaH3="kwa" || prawyayaH3="kwavawu") && viB1=1))
                   && ((vikArya rt1 rt2) || not (rt3="kq3"))
                   (* to avoid kIxqSam vyavahAram as karma, karmasamAnAXikaraNam*)
            then [ Relation (id2,cid2,mid2,"karmasamAnAXikaraNam",id3,cid3,mid3,"35.6",d23) ]
             (* waxA AyojakAH neharUM sanwuRtaM kqwavanwaH *)
            else []
            | Wif (id3,cid3,mid3,_,rt3,_,_,upasarga3,_,prayogaH3,_,_,_,_,_,_) ->
       let  d23 = if id2 > id3 then id2-id3 else id3-id2 in
            if   noun_agreement_vibh vac1 vac2 gen1 gen1 viB1 viB2 
            then if members_of rt3 upasarga3 karmasamAnAXikaraNa_verbs
            then if    prayogaH3="karwari" && viB1=2
                   && ((vikArya rt1 rt2) || not (rt3="kq3"))
                 then [ Relation (id2,cid2,mid2,"karmasamAnAXikaraNam",id3,cid3,mid3,"35.7",d23) ]
                 else if prayogaH3="karmaNi" && viB1=1
                   && ((vikArya rt1 rt2) || not (rt3="kq3"))
                 then [ Relation (id2,cid2,mid2,"karmasamAnAXikaraNam",id3,cid3,mid3,"35.8",d23) ]
                 else []
                   (* to avoid kIxqSam vyavahAram as karma, karmasamAnAXikaraNam*)
            else []
            else []
            | _ -> []
            ]
            else []
        | _ -> []
      ] else []
   | _ -> []
   ]
;

(* Noun Noun relation *)
(* assign_noun_viSeRaNa *)
(* grAmam gacCanwam rAmam SyAmaH paSyawi. *)
(* yogyawA *)
 (* value rlviSeRaNam1 m1 m2 text_type = match m2 with
  [ Sup (id2,cid2,mid2,word2,rt2,pUrvapaxa2,uwwarapaxa2,lifgam2,viBakwiH2,vacanam2,_) 
  | Kqw (id2,cid2,mid2,word2,_,_,_,_,_,_,rt2,pUrvapaxa2,uwwarapaxa2,lifgam2,viBakwiH2,vacanam2,_) -> 
             (* if (member_of rt2 upAXi) then [] else  -- it is possible to have wAn rAkRasAn, wAn puwrAn, wAn AcAryAn, etc *)
                 (*| WaxXiwa (id2,cid2,mid2,word2,rt2,_,uwwarapaxa2,_,lifgam2,viBakwiH2,vacanam2,_) ->   *)
               (*  There is a problem with sentences such as 
               aham Bavanwam anviRyan upAgamam
               I think Head can not be kqw or waxxXiwa 
               Not clear about this. So uncommented kqw and waxXiwa -- Amba 26th Sep 2019

               Uncommented Kqw to handle
               kaH aByupAyaH aswi.
               *)
   match m1 with
      [ Sup (id1,cid1,mid1,word1,rt1,pUrvapaxa1,uwwarapaxa1,lifgam1,viBakwiH1,vacanam1,_) -> 
           let  d12 = if id1 > id2 then id1-id2 else id2-id1 in
           if no_boundary_crossing_except_kwvA id1 id2 text_type
              && (noun_agreement_vibh vacanam1 vacanam2 lifgam1 lifgam2 viBakwiH1 viBakwiH2) 
              &&  prose_order id1 id2 text_type
	      (* && (not ((rt1="arWa" || rt1 = "ananwaram" || word1 = "sahiwaH" || rt1 = "saxqSa" || rt1 = "saFjASa" || rt1 = "pramuKa" || rt1 = "pUrveNa") && (uwwarapaxa1 = "y")))   Why this condition? Need examples. -- arWa is removed, since waw-arWam karma samAcara is possible. *)
	      && (not ((rt1 = "ananwaram" || word1 = "sahiwaH" || rt1 = "saxqSa" || rt1 = "saFjASa" || rt1 = "pramuKa" || word1 = "pUrveNa") && (uwwarapaxa1 = "y")))  
           then if ( member_of rt1 saMKyeya || member_of rt1 pUraNa || member_of rt1 kqxanwas || member_of rt1 taddhitaantas || member_of rt1 guNavacana  ||member_of rt1 sambanXavAcI
                  || pUrvapaxa1="y" || uwwarapaxa1="y" || ((rt1 = "sarva" || rt1 = "sarvA") &&  id1 > id2 && text_type = "Sloka")  || (pronoun3 rt1 ) (* || (pronominal12 rt1)*)
(* pronominal12 rt is added to allow a viSeRaNa for asmax such as prapaSxBiH asmaxBiH -- SBG 1.39 *)

                   (* || (pronoun3 rt1 && (member_of rt2 manuRyasaFjFAvAcI || member_of rt2 sambanXavAcI || member_of rt2 upAXi)) -- ewAn camUm paSya fails *)
                  )
			(* pronoun3 rt1 is removed, since pronoun is preferred as a viSeRya in the absence of a manuRyasaFjFAvAci Sabxa *)
		&& not (rt1 = "kim" && aswi_pos.val < 50)
		&& not (rt2 = "kim")
                && not (member_of rt2 sambanXavAcI) 
                && not (member_of rt2 upAXi) 
                && not (member_of rt1 manuRyasaFjFAvAcI) 
                   (* && (not (pUrvapaxa1="y" || uwwarapaxa1="y"))  || not (member_of uwwarapaxa1 xravyavAcI))  -- problematic with bahuvrIhi compounds *)
                && (not (rt1=rt2) || pUrvapaxa1="y" || uwwarapaxa1="y" || pUrvapaxa2="y" || uwwarapaxa2="y")
                                          (* && not (member_of rt1 sambanXavAcI) 
                                             && not (member_of rt1 upAXi) -- 
                                            Why these two needed? We are allowing only the words in a given lists - saMKyeya, pUraNa, etc. see above *)
                && not (rt2="yukwa") && not (rt2="yukwA")
                                           (* && not (pUrvapaxa1="sa") if the word agrees in g,n,v then mark it as a possible viseRaNam *)
                && not (rt1 = "yax" && rt2 = "wax" && not (viBakwiH1 == 1))
                                           (* yasmAw wasmAw -- not possible, but yaH saH is possible *)
                && not (rt1 = "wax" && lifgam1 = "napuM")
                && not ((rt1 = "ewax" || rt1="wax") && lifgam1 = "napuM" && (rt2="asmax" || rt2 = "yuRmax"))
		&& not (member_of rt2 saMKyeya)
		(* && not (member_of rt2 intensifiers_list) -- awIva can be a viSeRaNa; awIva XanaM aswi *)
		   (* && not (pronoun3 rt2)  && member_of rt1 upAXi; pronoun is always preferred as a viSeRya in the absence of a  prANisaFjFAvAci Sabxa *)
               then if pronoun3 rt1 && uwwarapaxa2="y"
	            then [ Relation (id1,cid1,mid1,"viSeRaNam",id2,cid2,mid2,"17.1b",d12)]
	            else if pronoun3 rt2 && uwwarapaxa1="y"
	                 then [ Relation (id2,cid2,mid2,"viSeRaNam",id1,cid1,mid1,"17.1a",d12)]
	                 else if rt2="yuRmax" 
                              then [ Relation (id1,cid1,mid1,"viSeRaNam",id2,cid2,mid2,"17.1c",d12)]
	                      else if rt1="arWa"  && uwwarapaxa1 = "y" 
                                   then [ Relation (id1,cid1,mid1,"viSeRaNam",id2,cid2,mid2,"17.1d",d12)] 
                                   else if rt2 = get_assoc rt1 parAjAwi_list  (* && not (finite_verb_in_sentence.val = 50 && karwqsamverbs.val = 50) *)
                                        then [ Relation (id1,cid1,mid1,"viSeRaNam",id2,cid2,mid2,"17.2",d12)]
					else []
              else if (((member_of rt1 sambanXavAcI) || (member_of rt1 upAXi)) && (member_of rt2 manuRyasaFjFAvAcI || member_of rt2 named_entity || (rt2="samuxra" && rt1="pawi") || (rt1="kAraka" && rt2="xoRa")))
              	         (*&& not (member_of rt2 saMKyeya || member_of rt2 pUraNa || pronoun3 rt2 ))*)
                       	 (* && not (member_of rt2 guNavacana) ; this condition is not needed. If it is a viSeRaNa, then automatically, the constraint solver will reject 
               		   this solution.  if this condition exists, xaSaraWasya puwraH rAmaH will not be parsed, since is in guNavacana list *)
                  	 (* && not (member_of rt2 sambanXavAcI) Why this condition? counter ex: wava XImawA SiRyeNa xrupaxa-puwreNa *)
                   then [ Relation (id1,cid1,mid1,"aBexaH",id2,cid2,mid2,"17.3a",d12)]
                   else if rt1="miwra" && viBakwiH1=viBakwiH2 && vacanam1=vacanam2 && not ( member_of rt2 saMKyeya || member_of rt2 pUraNa )
                        then [ Relation (id1,cid1,mid1,"aBexaH",id2,cid2,mid2,"17.4a",d12)]
	                else [ Relation (id2,cid2,mid2,"viSeRaNam",id1,cid1,mid1,"17.5a",d12)]
     else []

           (*not (finite_verb_in_sentence.val = 50 && karwqsamverbs.val = 50)
           &&  there can be just kqxanwa such as kwa/kwavawu as well *) 
           (* (id2 > id1 ) *) (* Even in Shlokas, the upAXi should come before the name || text_type = "Sloka"  I think id2 > id1  needs to be modified, look at vayam sarve below *)
           (*&& not (member_of (word2^" "^string_of_int viBakwiH2) kriyAviSeRaNas) (* why is this cond? *)*)
           (* pronoun3 -> pronominal123: mayA avyakwa-mUrwinA from SBG *)
           (* vayam sarve  ayaneRu ca sarveRu*)
           (* Even in Sloka, we can not have a pronoun after the viSeRya e.g. vArwA kA AsIw, here kA can not be viSeRaNa, it should be karwqsamAnAXikaraNam; manaH-sWiwiH kA aBavaw, kA is not a viSeRanam but karwqsamAnAXikaraNam *)
           (* && not (viBakwiH1 = 6) *) (* && (id2 = next id1) *)
           (* Example for viSeRaNa after the viSeRya ? 
            * Hence removed this -- || id2 > id1 *)
           (* && not (finite_verb_in_sentence.val = 50 && karwqsamverbs.val = 50)  -- removed since with kqxanwas, this does not work; e.g. bahUni kAvyAni paTiwAni hariNA ; bahUni is not marked as a viSeRaNam *)
           (*pronominal123 -> pronoun3; need good examples in support of asmax and yuRmax to be adjectives. mayA purA (BhG 3.2), was wrongly parsed as mayA as an adj of purA. To stop this, pronominal123 is changed to pronoun3; Malay  16th Aug 2019*)
           (* pronouns are immediately after the viSeRya e.g. vAkyam ixam *)
           (* && not (rt2="yax") && not (rt2="wax") *) 
           (* Whether to allow yax/wax or not: 
              What are the pros and cons of allowing Vs not allowing?
              We can have vyAkulaH saH, and also ye janAH ...*)
     (*| AvywaxXiwa (id1,cid1,mid1,word1,_,_,uwwarapaxa1,_,_) ->
       if prose_order id1 id2 text_type
       && no_boundary_crossing_except_kwvA id1 id2 text_type
       && (pUrvapaxa1="y" || uwwarapaxa1="y")
       then [ Relation (id1,cid1,mid1,"viSeRaNam",id2,cid2,mid2,"12.3",d12)]
       else [] 
      This introduced a link with every other word in case of wasil prawyaya
      *)
     | WaxXiwa (id1,cid1,mid1,_,rt1,_,_,_,lifgam1,viBakwiH1,vacanam1,_) -> if (member_of rt1 upAXi) then [] else
       let  d12 = if id1 > id2 then id1-id2 else id2-id1 in
       if prose_order id1 id2 text_type
       && not (finite_verb_in_sentence.val = 50 && karwqsamverbs.val = 50)
            && no_boundary_crossing_except_kwvA id1 id2 text_type
        && noun_agreement_vibh vacanam1 vacanam2 lifgam1 lifgam2 viBakwiH1 viBakwiH2
        && not (member_of (word2^" "^string_of_int viBakwiH2) kriyAviSeRaNas) (* Why is this cond? *)
        && not(rt1=rt2) && no_boundary_crossing_except_kwvA id1 id2 text_type
	&& not (rt2 = "kim")
	&& not (rt2 = "ixam")
       then [ Relation (id1,cid1,mid1,"viSeRaNam",id2,cid2,mid2,"17.6",d12)]
       else []
     | Kqw (id1,cid1,mid1,_,_,_,_,kqw_prawyayaH1,_,_,rt1,_,_,lifgam1,viBakwiH1,vacanam1,_) -> 
       (* if (member_of rt1 upAXi) then [] else *)
       let  d12 = if id1 > id2 then id1-id2 else id2-id1 in
       if not (finite_verb_in_sentence.val = 50)
       (*&& not ( karwqsamverbs.val = 50) -- Why this condition? *)
       && no_boundary_crossing_except_kwvA id1 id2 text_type
       && ((viBakwiH1=viBakwiH2 && vacanam1=vacanam2 && niyawalifgam kqw_prawyayaH1)
          || noun_agreement_vibh vacanam1 vacanam2 lifgam1 lifgam2 viBakwiH1 viBakwiH2)
(* When it is Sawq_lat with viB = 1, then it is more likely that it is a kriyAviSeRaNa, linking directly with the wifganwa.
gacCan bAlakaH wqNam spqSawi / bAlakaH gacCan wqNam spqSawi *)
       && not (member_of (word2^" "^string_of_int viBakwiH2) kriyAviSeRaNas) (* Why is this cond? *)
       && not(rt1=rt2) && not(rt2="kim")
       then if (member_of rt1 sambanXavAcI)
            then [ Relation (id1,cid1,mid1,"aBexaH",id2,cid2,mid2,"17.6a",d12)]
            else if (kqw_prawyayaH1="Sawq_lat") && (viBakwiH1 > 1 && viBakwiH1 < 7) (* vasawi papmAwIre rAmaH; with viBakwiH1=7, vasawi would become an adj of pampAwIre *)
                 then [ Relation (id1,cid1,mid1,"viSeRaNam",id2,cid2,mid2,"17.7",d12)]
                 else if prose_order id1 id2 text_type
       		   && not (kqw_prawyayaH1="Sawq_lat")
       		   && not (kqw_prawyayaH1="lyut")
       		   && not (kqw_prawyayaH1="wavyaw")
      		   && not (kqw_prawyayaH1="anIyar")
                then [ Relation (id1,cid1,mid1,"viSeRaNam",id2,cid2,mid2,"17.8",d12)]
                else []
       else []
     | _ -> []
     ]
     
  | _ -> []
  ]
  ;
  *)

 value rlviSeRaNam m1 m2 text_type = match m2 with
  [ Sup (id2,cid2,mid2,word2,rt2,pUrvapaxa2,uwwarapaxa2,lifgam2,viBakwiH2,vacanam2,_) 
  | Kqw (id2,cid2,mid2,word2,_,_,_,_,_,_,rt2,pUrvapaxa2,uwwarapaxa2,lifgam2,viBakwiH2,vacanam2,_) -> 
      match m1 with
       [ Sup (id1,cid1,mid1,word1,rt1,pUrvapaxa1,uwwarapaxa1,lifgam1,viBakwiH1,vacanam1,_) -> 
           let  d12 = if id1 > id2 then id1-id2 else id2-id1 in
           if uwwarapaxa1="y" && sp_uwwarapaxa rt1 word1 lifgam1 then []
           else
           if no_boundary_crossing_except_kwvA id1 id2 text_type
              && (noun_agreement_vibh vacanam1 vacanam2 lifgam1 lifgam2 viBakwiH1 viBakwiH2) 
              &&  prose_order id1 id2 text_type
	      then if rt2="yuRmax" 
                   then if (member_of rt1 sambanXavAcI) || (member_of rt1 upAXi)
                        then [ Relation (id1,cid1,mid1,"aBexaH",id2,cid2,mid2,"17.1a",d12)]
	                else [ Relation (id1,cid1,mid1,"viSeRaNam",id2,cid2,mid2,"17.1b",d12)]
                   else if (rt2="samuxra" && rt1="pawi")
                        then [ Relation (id1,cid1,mid1,"aBexaH",id2,cid2,mid2,"17.2",d12)]
                        else if ((member_of rt1 sambanXavAcI) || (member_of rt1 upAXi)) && ((member_of rt2 manuRyasaFjFAvAcI) || (member_of rt2 named_entity))
                        then [ Relation (id1,cid1,mid1,"aBexaH",id2,cid2,mid2,"17.2a",d12)]
                        else if rt2="AKyAna" && ((rt1="rAmAyaNa")|| (rt1="mahABarawa") || (rt1 = "SAkunwala"))
                             then [ Relation (id1,cid1,mid1,"viSeRaNam",id2,cid2,mid2,"17.3",d12)]
                             else if word2="sAkRikam" && uwwarapaxa2="y"
                                  then [ Relation (id1,cid1,mid1,"viSeRaNam",id2,cid2,mid2,"17.4",d12)]
                                  else if member_of rt2 manuRyasaFjFAvAcI || member_of rt2 named_entity
                                       then if ((member_of rt1 sambanXavAcI) || (member_of rt1 upAXi))
                                            then [ Relation (id1,cid1,mid1,"aBexaH",id2,cid2,mid2,"17.5",d12)]
					    else if (member_of rt1 guNavacana)
                                            then [ Relation (id1,cid1,mid1,"viSeRaNam",id2,cid2,mid2,"17.6",d12)]
					    else []
	                               else if rt1="arWa"  && uwwarapaxa1 = "y" 
                                            then [ Relation (id1,cid1,mid1,"viSeRaNam",id2,cid2,mid2,"17.7",d12)] 
                                            else if (    member_of rt1 saMKyeya || 
                  				    	 member_of rt1 pUraNa || 
                    					 member_of rt1 kqxanwas || 
                    					 member_of rt1 taddhitaantas || 
                    					 member_of rt1 guNavacana  ) && not (member_of rt1 manuRyasaFjFAvAcI)
	                                         then [ Relation (id1,cid1,mid1,"viSeRaNam",id2,cid2,mid2,"17.8",d12)]
                                                 else if (uwwarapaxa1 = "y") && 
                      				      not (rt1 = "ananwaram" || word1 = "sahiwaH" || rt1 = "saxqSa" || rt1 = "pramuKa" || rt1 = "pUrvaka" || rt1="paryanwa") &&
                                                      not (pronoun3 rt2)
	      					      then [ Relation (id1,cid1,mid1,"viSeRaNam",id2,cid2,mid2,"17.9",d12)]
              					      else if ((rt1 = "sarva" || rt1 = "sarvA") &&  id1 > id2 && text_type = "Sloka")
	      					           then [ Relation (id1,cid1,mid1,"viSeRaNam",id2,cid2,mid2,"17.10",d12)]
              						   else if (not (rt2 = "kim" || rt2 = "ixam"|| rt2 = "arWa")) && (pronoun3 rt1)  (*There cannot be a viSeRaNa of kim/ixam/arWa wvam kim-arWam, wvam is not a viSeRaNa of kim-arWam *)
	      							then [ Relation (id1,cid1,mid1,"viSeRaNam",id2,cid2,mid2,"17.11",d12)]
             								 (* else if (not (rt1 = "kim" )) && (aswi_pos.val < 50) && (pronoun3 rt1)  
                      							(* In the presence of aswi, kim cannot be a viSeRaNa; *kim puswakam aswi  -- counter example -- kim puswakam sunxaram aswi  -- This is handled in a separate function rl_kim_aswi *)
	      								then [ Relation (id1,cid1,mid1,"viSeRaNam",id2,cid2,mid2,"17.12",d12)] *)
              							else if rt2 = get_assoc rt1 parAjAwi_list  
              							     then [ Relation (id1,cid1,mid1,"viSeRaNam",id2,cid2,mid2,"17.13",d12)]
              							     else []
                else []
     | WaxXiwa (id1,cid1,mid1,_,rt1,_,_,waxXiwa_prawyayaH1,lifgam1,viBakwiH1,vacanam1,_) -> if (member_of rt1 upAXi) then [] else
       let  d12 = if id1 > id2 then id1-id2 else id2-id1 in
       if prose_order id1 id2 text_type
       && not (finite_verb_in_sentence.val = 50 && karwqsamverbs.val = 50)
            && no_boundary_crossing_except_kwvA id1 id2 text_type
        && noun_agreement_vibh vacanam1 vacanam2 lifgam1 lifgam2 viBakwiH1 viBakwiH2
        && not (member_of (word2^" "^string_of_int viBakwiH2) kriyAviSeRaNas) (* Why is this cond? *)
        && not(rt1=rt2) && no_boundary_crossing_except_kwvA id1 id2 text_type
	&& not (rt2 = "kim")
       then [ Relation (id1,cid1,mid1,"viSeRaNam",id2,cid2,mid2,"17.14",d12)]
       else if (waxXiwa_prawyayaH1 = "mayat")
       then [ Relation (id1,cid1,mid1,"viSeRaNam",id2,cid2,mid2,"17.17",d12)]
       else []
     | Kqw (id1,cid1,mid1,_,_,_,_,kqw_prawyayaH1,_,_,rt1,_,_,lifgam1,viBakwiH1,vacanam1,_) -> 
       (* if (member_of rt1 upAXi) then [] else *)
       let  d12 = if id1 > id2 then id1-id2 else id2-id1 in
       if (not (finite_verb_in_sentence.val = 50) || (kqw_prawyayaH1 = "Sawq_lat"))
       (*&& not ( karwqsamverbs.val = 50) -- Why this condition?  -- Otherwise the kwa verb will be marked as a viSeRaNa in examples such as rAmaH grAmam gawaH. But with kqw suffixes such as Sawq_lat, we should allow them as adjectives. Hence the Sawq_lat is added. If other suffixes are also allowed, we need to add them *)
       && no_boundary_crossing_except_kwvA id1 id2 text_type
       && ((viBakwiH1=viBakwiH2 && vacanam1=vacanam2 && niyawalifgam kqw_prawyayaH1)
          || noun_agreement_vibh vacanam1 vacanam2 lifgam1 lifgam2 viBakwiH1 viBakwiH2)
(* When it is Sawq_lat with viB = 1, then it is more likely that it is a kriyAviSeRaNa, linking directly with the wifganwa.
gacCan bAlakaH wqNam spqSawi / bAlakaH gacCan wqNam spqSawi *)
       && not (member_of (word2^" "^string_of_int viBakwiH2) kriyAviSeRaNas) (* Why is this cond? *)
       && not(rt1=rt2) && not(rt2="kim")
       then if (kqw_prawyayaH1="Sawq_lat") && (viBakwiH1 > 1 && viBakwiH1 < 7) (* vasawi papmAwIre rAmaH; with viBakwiH1=7, vasawi would become an adj of pampAwIre *)
       then [ Relation (id1,cid1,mid1,"viSeRaNam",id2,cid2,mid2,"17.15",d12)]
       else if prose_order id1 id2 text_type
         && not (kqw_prawyayaH1="Sawq_lat")
         && not (kqw_prawyayaH1="lyut")
         && not (kqw_prawyayaH1="wavyaw")
         (* && not (kqw_prawyayaH1="anIyar") -- kIrwanIyA in 2nd shloka of 2nd sarga of RV *)
         && not ((member_of rt2 sambanXavAcI) || (member_of rt2 upAXi))
       then [ Relation (id1,cid1,mid1,"viSeRaNam",id2,cid2,mid2,"17.16",d12)]
       else []
       else []
     | _ -> []
     ]
     
  | _ -> []
  ]
  ;
(*

Why do we need parimANa viSeRaNa seperately? 
value rlparimANa_viSeRaNam m1 m2 text_type = match m1 with
  [ Sup (id1,cid1,mid1,word1,rt1,_,uwwarapaxa1,lifgam1,viBakwiH1,vacanam1,_)
  | Kqw (id1,cid1,mid1,word1,_,_,_,_,_,_,rt1,_,uwwarapaxa1,lifgam1,viBakwiH1,vacanam1,_)
  | WaxXiwa (id1,cid1,mid1,word1,rt1,_,uwwarapaxa1,_,lifgam1,viBakwiH1,vacanam1,_) -> 
   match m2 with
      [ Sup (id2,cid2,mid2,word2,rt2,_,uwwarapaxa2,lifgam2,viBakwiH2,vacanam2,_) ->
       let  d12 = if id1 > id2 then id1-id2 else id2-id1 in
       if id2=next id1
       && (noun_agreement_vibh vacanam1 vacanam2 lifgam1 lifgam2 viBakwiH1 viBakwiH2) 
       && ( rt2="sarva" || member_of rt2 saMKyeya )
       then [ Relation (id2,cid2,mid2,"parimANa_viSeRaNam",id1,cid1,mid1,"12.6",d12)]
       else []
      | _ -> []
      ]
  | _ -> []
  ]
  ;
*)
(* yogyawA *)
value rlavy_viSeRaNam m1 m2 text_type = match m2 with
  [ Sup (id2,cid2,mid2,_,rt2,_,_,lifgam2,viBakwiH2,vacanam2,_)
  | Kqw (id2,cid2,mid2,_,_,_,_,_,_,_,rt2,_,_,lifgam2,viBakwiH2,vacanam2,_)
  | WaxXiwa (id2,cid2,mid2,_,rt2,_,_,_,lifgam2,viBakwiH2,vacanam2,_) -> 
     match m1 with
     [ Avy (id1,cid1,mid1,word1,_,pUrvapaxa1,uwwarapaxa1,_) ->
       let  d12 = if id1 > id2 then id1-id2 else id2-id1 in
       (*if id1=previous id2 && member_of word1 avy_viSeRaNam_list*)
             (*  changed to id1 < id2 for handling kimapi safkRipwam SAswram *)
       if word1="iva" &&  (uwwarapaxa1="n") && id1 = previous id2
       then [ Relation (id1,cid1,mid1,"upamAnam_rahiwa_upamAna_xyowakaH",id2,cid2,mid2,"18.1",d12)]
       else
       if id1 < id2 && member_of word1 avy_viSeRaNam_list
       then [ Relation (id1,cid1,mid1,"viSeRaNam",id2,cid2,mid2,"18.2",d12)]
       else if id1 < id2 && member_of word1 intensifiers_list
       then [ Relation (id1,cid1,mid1,"wIvrawAxarSI",id2,cid2,mid2,"18.2a",d12)]
       else if id1=previous id2 && member_of word1 intensifiers_list && not (pronominal123 rt2)
       && member_of rt2 guNavacana (* Once it is intensifier, we need not check if it is a guNavacana or not 
       This is not true. We may have param simhaH ... samarWaH na aswi, where paraM is not wIvrawAxarSI *)
       then [ Relation (id1,cid1,mid1,"wIvrawAxarSI",id2,cid2,mid2,"18.3",d12)]
(* This relation is added since it is an exception to the constraint that a kriyAviSeRaNa or a viSeRaNa can not have a viSeRaNa.
E.g. saH awIva vegena XAvawI / saH awIva sunxaram bAlakam paSyawi *)
       else []
     | Sup (id1,cid1,mid1,_,rt1,_,_,lifgam1,viBakwiH1,vacanam1,_) ->
       let  d12 = if id1 > id2 then id1-id2 else id2-id1 in
        if id1=previous id2 && member_of rt1 intensifiers_list && not (pronominal123 rt2)
       && (noun_agreement_vibh vacanam1 vacanam2 lifgam1 lifgam2 viBakwiH1 viBakwiH2) 
       (* && member_of rt2 guNavacana   --  Once it is intensifier, we need not check if it is a guNavacana or not  - not necessarily ??  mahaw SUlam; here SUlam is not a guNavacana *)
       then [ Relation (id1,cid1,mid1,"wIvrawAxarSI",id2,cid2,mid2,"18.4",d12)]
       else []
(* kevala is not an avy *)
     | _ -> []
     ]
  | _ -> []
  ]
  ;

