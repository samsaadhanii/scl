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
    | WaxXiwa (id1,cid1,mid1,_,_,_,_,_,_,viBakwiH1,_,_) 
    | Sup (id1,cid1,mid1,_,_,_,_,_,viBakwiH1,_,_) ->
        if viBakwiH1 = 1
        then match m2 with
        [ Wif (id2,cid2,mid2,_,rt2,_,_,upasarga2,_,_,lakAraH2,puruRaH2,_,_,_,_) ->
              if    ((puruRaH2="ma"  && wvam_pos.val = 50) || (puruRaH2="u" && aham_pos.val=50))
                 && (lakAraH2="lot" || lakAraH2 = "ASIrlif"|| lakAraH2 = "viXilif" || lakAraH2 = "lat")
                 && wvam_pos.val = 50
              then   karwqrahiwakarwqsamAnAXikaraNam id1 cid1 mid1 id2 cid2 mid2 rt2 upasarga2 "33.1"
              else []
        | Avykqw (id2,cid2,mid2,_,rt2,_,_,upasarga2,_,kqw2,_,_) ->
              if kqw2 = "kwvA"
              then   karwqrahiwakarwqsamAnAXikaraNam id1 cid1 mid1 id2 cid2 mid2 rt2 upasarga2 "33.2"
              else []
        | _ -> []
        ]
        else []
    | _ -> []
    ]
;
(* TO Handle 
                                 (*  viBakwiH2=6 is added to account for ixam mama aswi  5.10.2019
                                  * xevasya ixam sarvam aswi  24th July 2020 
                                  * viBakwiH2 = 6 is removed, since it overgenerates. E.g in the sentence,
                                  * wasyAH ABAraNam sarovarasya wate aswi, it analyses sarovarasya as karwqsamAnAXikaraNam *)
*)

value rlkarwqsamAnAXikaraNam m1 m2 m3 text_type = match m2 with
    [ Sup (id2,cid2,mid2,word2,rt2,_,uwwarapaxa2,lifgam2,viBakwiH2,vacanam2,_)
    | Kqw (id2,cid2,mid2,word2,_,_,_,_,_,_,rt2,_,uwwarapaxa2,lifgam2,viBakwiH2,vacanam2,_)
    | WaxXiwa (id2,cid2,mid2,word2,rt2,_,uwwarapaxa2,_,lifgam2,viBakwiH2,vacanam2,_) ->
      match m1 with
      [ Sup (id1,cid1,mid1,word1,rt1,_,_,lifgam1,viBakwiH1,vacanam1,_)
      | Kqw (id1,cid1,mid1,word1,_,_,_,_,_,_,rt1,_,_,lifgam1,viBakwiH1,vacanam1,_)
      | WaxXiwa (id1,cid1,mid1,word1,rt1,_,_,_,lifgam1,viBakwiH1,vacanam1,_) ->
	if (word1 = "san") then []
        else let  d12 = if id1 > id2 then id1-id2 else id2-id1 in
        match m3 with
        [ Wif (id3,cid3,mid3,_,rt3,_,_,upasarga3,_,_,_,_,_,_,_,_)
        | Kqw (id3,cid3,mid3,_,rt3,upasarga3,_,_,_,_,_,_,_,_,_,_,_)
        | Avykqw (id3,cid3,mid3,_,rt3,_,_,upasarga3,_,_,_,_) ->
          let cat = get_cat m3 
          and vac = get_vac m3
          and per = get_per m3 in
          if not ( members_of rt3 upasarga3 karwqsamAnAXikaraNa_verbs) then []			(* the verb should have an rxpectancy for viXeya viSeRaNa *)
          else if not (viBakwiH1=viBakwiH2 && viBakwiH1 = 1) then []				(* viBaktis should be same *)
          else if  cat="wif" && not ( aBihiwa rt1 vacanam1 vac per || aBihiwa rt2 vacanam2 vac per) then []   (* There should be agreement with at least one *)
          else if not (vacanam1 = vacanam2)			(* vacana diff - exceptional cases *)
               then  if    rt1 = "vexa" && rt2="pramANa"        (* vexAH pramANam aswi *)
                       && rt3="as2" && upasarga3="X"
                    then [ Relation (id2,cid2,mid2,"vi_viSe",id1,cid1,mid1,"34.4b",d12)  ]
                              (* else if (not (vacanam1=vacanam2) && ((rt1="mAsa" && (rt2="xakRiNAyana" || rt2="uwwarAyaNa"))|| (rt2="xArA")))
                                 then [ Relation (id2,cid2,mid2,"viXeya_viSeRaNam",id1,cid1,mid1,"34.4c",d12)  ]  -- Need examples *)
                    else []
               else if not (lifgam1 = lifgam2) 			(* lifga diff exceptional cases *)
                    then if (  (rt1 = "jyowis" && rt2="agni")	(* jyowiH agniH Bavawi *)	
                             ||(rt1="asmax" && rt2="prakASa")	(* ahaM prakASaH na BavAmi *)
                             ||(rt1="inxriya" && rt2="jihvA")	(*  *)
                             ||(rt1="inxriya" && rt2="wvac")	(*  *)
                             || rt2 = "miwra" )			(* saH mama miwram aswi. *)
                         then [ Relation (id2,cid2,mid2,"vi_viSe",id1,cid1,mid1,"34.4a",d12)  ]
                         else []
                    else if (noun_agreement_vibh vacanam1 vacanam2 lifgam1 lifgam2 viBakwiH1 viBakwiH2) 
                           && prose_order id2 id3 text_type 
                           && no_boundary_crossing_with_iwi id2 id3 text_type
                           && no_boundary_crossing_with_iwi id1 id2 text_type
                           && not (rt2 = get_assoc rt1 parAjAwi_list)
                           && not (rt1="kiFciw" || rt1="kiFcana"|| rt1="yAvaw" || rt1="wAvaw" )
	                   && not (member_of rt1 intensifiers_list)
                           && (   member_of rt2 guNavacana 
                               || member_of rt2 sambanXavAcI 
                               || member_of rt2 saMKyeya         (* we paFcAH sanwi *)
                               || member_of rt2 pUraNa
                               || member_of rt2 intensifiers_list
                               || member_of rt2 taddhitaantas 
                               || member_of rt2 upAXi 
                               || uwwarapaxa2 = "y" 
                               || rt1="ewax" || rt1="wax"
                               || (rt1="saxAcAra" && rt2="Xarma")  (* not guNavacana/... *)
                               || rt2="kim" )
                                  (* awra SuxXaM jalaM aswi; jalam should not be marked as a viXeya viSeRaNam ; eRA SobanA velA aswi. velA is not a guNavacana *)
                           && ((id2=1) || (id2 > id1 )) 
                                  (* The first word can not be a viXeya viSeRaNa, 
                                     except cases such as samarWaH aswi janaH, and janaH samarWaH aswi are OK, but not samarWaH janaH aswi.  *)
	                          (* && (id2 = total_wrds.val -1 || id2 = total_wrds.val-2 || text_type = "Sloka") 
                                   * -2 to take into account ca/api etc. 
                                   * we found examples where more than 2 viXeya viSeRaNas are possible. Hence commented *)
                        then [ Relation (id2,cid2,mid2,"vi_viSe",id1,cid1,mid1,"34.1",d12) ]
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
           && no_boundary_crossing_with_iwi id2 id3 text_type
           then match word1 with					(* saH puraswAw aswi *)
           [ "avaH" | "avaraswAw"| "avarawaH" | "avaswAw" | "aXaH"|
            "aXarAw" | "aXaswAw" | "paraswAw"| "parawaH"| "aXareNa"|
            "paScAw" | "puraH" | "puraswAw"| "purawaH"| "upari"|
            "upariRtAw"| "uwwarA"| "uwwarAhi"| "uwwarAw"| "uwwarawaH"|
            "uwwareNa"| "xakRiNA"| "xakRiNAhi"| "xakRiNAw"| "xakRiNawaH"|
            "xakRiNena" ->
                      [ Relation (id2,cid2,mid2,"vi_viSe",id1,cid1,mid1,"34.3",d12) ] 
           | "nAma" -> if members_of rt3 upasarga3 karwqsamAnAXikaraNa_verbs then	(* mama nAma rAmaH aswi *)
                      [ Relation (id2,cid2,mid2,"vi_viSe",id1,cid1,mid1,"34.3a",d12) 
                      ; Relation (id1,cid1,mid1,"karwA_be_verbs",id3,cid3,mid3,"34.3b",d12) ]
		      else []
           |_ -> []
           ]
           else []
        | _ -> []
        ]
      | _ -> []
      ]
  | _ -> []
  ]
;

(* In case there is no 'be' verb, then this function marks karwqsamAnAXikaraNa 
 * Example: saH vExyaH
 * अ-पर्याप्तम् तत् अस्माकम् बलम् भीष्म-अभिरक्षितम्*)
(* This needs to be rewritten *)
(* value rlkarwqsamAnAXikarana_noverb m1 m2 text_type = 
    if karwqsamverbs.val = 50
    then match m2 with
    [ Sup (id2,cid2,mid2,word2,rt2,_,uwwarapaxa2,_,viBakwiH2,vacanam2,_) ->
      match m1 with
      [ Sup (id1,cid1,mid1,word1,rt1,pUrvapaxa1,uwwarapaxa1,lifgam1,viBakwiH1,vacanam1,_)
      | Kqw (id1,cid1,mid1,word1,_,_,_,_,_,_,rt1,pUrvapaxa1,uwwarapaxa1,lifgam1,viBakwiH1,vacanam1,_)
      | WaxXiwa (id1,cid1,mid1,word1,rt1,pUrvapaxa1,uwwarapaxa1,_,lifgam1,viBakwiH1,vacanam1,_) ->
       let  d12 = if id1 > id2 then id1-id2 else id2-id1 in
          if (   finite_verb_in_sentence.val = 50 
              || finite_verb_in_sentence.val = id1 ) 
          (* The second condition is to handle rAmaH vExyaH ; where rAmaH is analysed as a verb!*)
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

*)
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
               then [ Relation (id2,cid2,mid2,"karma_sa",id3,cid3,mid3,"35.1",d23) ]
                (* waxA AyojakAH neharUM sanwuRtaM kqwavanwaH *)
               else []
            | Wif (id3,cid3,mid3,_,rt3,_,_,upasarga3,_,prayogaH3,_,_,_,_,_,_) ->
               let  d23 = if id2 > id3 then id2-id3 else id3-id2 in
               if    members_of rt3 upasarga3 karmasamAnAXikaraNa_verbs
                 && (vikArya rt1 rt2 || not (rt3="kq3"))
               then if    (prayogaH3="karwari" && viB1=2) || ( prayogaH3="karmaNi" && viB1=1)
                    then [ Relation (id2,cid2,mid2,"karma_sa",id3,cid3,mid3,"35.2",d23) ]
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
              [ Kqw (id3,cid3,mid3,_,rt3,_,_,_,_,_,_,_,_,_,_,_,_)
              | Avykqw (id3,cid3,mid3,_,rt3,_,_,_,_,_,_,_) 
              | Wif (id3,cid3,mid3,_,rt3,_,_,_,_,_,_,_,_,_,_,_) ->
                let  d23 = if id2 > id3 then id2-id3 else id3-id2 in
                if rt3="kq3" && prose_order id2 id3 text_type && (vikArya rt1 rt2)
                then [ Relation (id2,cid2,mid2,"karma_sa",id3,cid3,mid3,"35.4",d23) ]
                else []
              | _ -> []
              ]
              else []
        | _ -> []
        ]
        else []
    | Kqw (id2,cid2,mid2,word2,_,_,_,_,_,_,rt2,pUrvapaxa2,uwwarapaxa2,gen2,viB2,vac2,_)
    | WaxXiwa (id2,cid2,mid2,word2,rt2,pUrvapaxa2,uwwarapaxa2,_,gen2,viB2,vac2,_) ->
      if uwwarapaxa2="y" && sp_uwwarapaxa rt2 word2 gen2 then []
      else if not (pronominal123 rt2) 
      then match m1 with
      [ Sup (id1,cid1,mid1,word1,rt1,_,_,gen1,viB1,vac1,_)
      | Kqw (id1,cid1,mid1,word1,_,_,_,_,_,_,rt1,_,_,gen1,viB1,vac1,_)
      | WaxXiwa (id1,cid1,mid1,word1,rt1,_,_,_,gen1,viB1,vac1,_) ->
           if    no_boundary_crossing_with_iwi id1 id2 text_type && id1 < id2
              && noun_agreement_vibh vac1 vac2 gen1 gen2 viB1 viB2 
              && not (rt1="kim" ||  rt1="kiFciw" || rt1="kiFcana" || rt1="IxqS" || rt1="kIxqS" || rt1="kIxqSa" || rt1="IxqSa") 
           then match m3 with 
            [ Kqw (id3,cid3,mid3,_,rt3,upasarga3,_,prawyayaH3,_,_,_,_,_,_,_,_,_)
            | Avykqw (id3,cid3,mid3,_,rt3,_,_,upasarga3,_,prawyayaH3,_,_) ->
                let  d23 = if id2 > id3 then id2-id3 else id3-id2 in
                 if    members_of rt3 upasarga3 karmasamAnAXikaraNa_verbs 
                   && ((vikArya rt1 rt2) || not (rt3="kq3"))
                   && (viB1=2 || ((prawyayaH3="kwa" || prawyayaH3="kwavawu") && viB1=1))
                then [ Relation (id2,cid2,mid2,"karma_sa",id3,cid3,mid3,"35.6",d23) ]
                else []
            | Wif (id3,cid3,mid3,_,rt3,_,_,upasarga3,_,prayogaH3,_,_,_,_,_,_) ->
                let  d23 = if id2 > id3 then id2-id3 else id3-id2 in
                if   members_of rt3 upasarga3 karmasamAnAXikaraNa_verbs
                   && ((vikArya rt1 rt2) || not (rt3="kq3"))
                   && ((prayogaH3="karwari" && viB1=2) || (prayogaH3="karmaNi" && viB1=1))
                then [ Relation (id2,cid2,mid2,"karma_sa",id3,cid3,mid3,"35.7",d23) ]
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

 value rlviSeRaNam m1 m2 text_type = match m2 with
  [ Sup (id2,cid2,mid2,word2,rt2,pUrvapaxa2,uwwarapaxa2,lifgam2,viBakwiH2,vacanam2,_) 
  | Kqw (id2,cid2,mid2,word2,_,_,_,_,_,_,rt2,pUrvapaxa2,uwwarapaxa2,lifgam2,viBakwiH2,vacanam2,_) -> 
      match m1 with
       [ Sup (id1,cid1,mid1,word1,rt1,pUrvapaxa1,uwwarapaxa1,lifgam1,viBakwiH1,vacanam1,_) -> 
           let  d12 = if id1 > id2 then id1-id2 else id2-id1 in
           if uwwarapaxa1="y" && sp_uwwarapaxa rt1 word1 lifgam1 then []
           else if    no_boundary_crossing_except_kwvA id1 id2 text_type
                   && (noun_agreement_vibh vacanam1 vacanam2 lifgam1 lifgam2 viBakwiH1 viBakwiH2) 
                   &&  prose_order id1 id2 text_type
	        then if rt2="yuRmax" && (member_of rt1 sambanXavAcI) || (member_of rt1 upAXi)
                     then [ Relation (id1,cid1,mid1,"aBexaH",id2,cid2,mid2,"17.1a",d12)]
                     else if (rt2="samuxra" && rt1="pawi")
                          then [ Relation (id1,cid1,mid1,"aBexaH",id2,cid2,mid2,"17.2",d12)]
                          else if ((member_of rt1 sambanXavAcI) || (member_of rt1 upAXi)) && ((member_of rt2 manuRyasaFjFAvAcI) || (member_of rt2 named_entity))
                               then [ Relation (id1,cid1,mid1,"aBexaH",id2,cid2,mid2,"17.2a",d12)]
                               else if ( member_of rt1 saMKyeya || 
                  	         	 member_of rt1 pUraNa || 
                    			 member_of rt1 kqxanwas || 
                    			 member_of rt1 taddhitaantas || 
                    			 member_of rt1 guNavacana  ) && not (member_of rt1 manuRyasaFjFAvAcI)
                                    then [ Relation (id1,cid1,mid1,"viSe",id2,cid2,mid2,"17.6",d12)]
              			    else if rt2 = get_assoc rt1 parAjAwi_list  
                                         then [ Relation (id1,cid1,mid1,"viSe",id2,cid2,mid2,"17.6",d12)]
                                         else if word2="sAkRikam" && uwwarapaxa2="y"
                                              then [ Relation (id1,cid1,mid1,"viSe",id2,cid2,mid2,"17.4",d12)]
	                                      else if uwwarapaxa1= "y" then match rt1 with
                                                   ["arWa" -> [ Relation (id1,cid1,mid1,"viSe",id2,cid2,mid2,"17.7",d12)] 
                                                   | "ananwaram" | "sahiwa" | "saxqSa" | "pramuKa" | "pUrvaka" | "paryanwa" -> []
                                                   | "sarva" | "sarvA" -> if id1 > id2 && text_type = "Sloka"
	      					                          then [ Relation (id1,cid1,mid1,"viSe",id2,cid2,mid2,"17.10",d12)]
						            		  else []
                                                   | _ ->  if pronoun3 rt1 && (not (rt2 = "kim" || rt2 = "ixam"|| rt2 = "arWa"|| rt2 = "wAvaw"))
                                                             (*There cannot be a viSeRaNa of kim/ixam/arWa wvam kim-arWam, wvam is not a viSeRaNa of kim-arWam *)
	      					           then [ Relation (id1,cid1,mid1,"viSe",id2,cid2,mid2,"17.11",d12)]
						           else []
                                                   ]
                			           else []
               else []
     | WaxXiwa (id1,cid1,mid1,_,rt1,_,_,waxXiwa_prawyayaH1,lifgam1,viBakwiH1,vacanam1,_) -> if (member_of rt1 upAXi) then [] else
       let  d12 = if id1 > id2 then id1-id2 else id2-id1 in
       if   prose_order id1 id2 text_type
         && noun_agreement_vibh vacanam1 vacanam2 lifgam1 lifgam2 viBakwiH1 viBakwiH2
         && no_boundary_crossing_except_kwvA id1 id2 text_type
 	 && not (rt2 = "kim")
       then [ Relation (id1,cid1,mid1,"viSe",id2,cid2,mid2,"17.14",d12)]
       else if (waxXiwa_prawyayaH1 = "mayat")
            then [ Relation (id1,cid1,mid1,"viSe",id2,cid2,mid2,"17.17",d12)]
            else []
     | Kqw (id1,cid1,mid1,_,_,_,_,kqw_prawyayaH1,_,_,rt1,_,_,lifgam1,viBakwiH1,vacanam1,_) -> 
       let  d12 = if id1 > id2 then id1-id2 else id2-id1 in
       if   (not (finite_verb_in_sentence.val = 50) || (kqw_prawyayaH1 = "Sawq_lat"))
          && no_boundary_crossing_except_kwvA id1 id2 text_type
          && (   (viBakwiH1=viBakwiH2 && vacanam1=vacanam2 && niyawalifgam kqw_prawyayaH1)
              || noun_agreement_vibh vacanam1 vacanam2 lifgam1 lifgam2 viBakwiH1 viBakwiH2)
       then if (kqw_prawyayaH1="Sawq_lat") && (viBakwiH1 > 1 && viBakwiH1 < 7) (* vasawi papmAwIre rAmaH; with viBakwiH1=7, vasawi would become an adj of pampAwIre *)
            then [ Relation (id1,cid1,mid1,"viSe",id2,cid2,mid2,"17.15",d12)]
            else if    prose_order id1 id2 text_type
                    && not (kqw_prawyayaH1="Sawq_lat")
                    && not (kqw_prawyayaH1="lyut")
                    && not (kqw_prawyayaH1="wavyaw")
                    && not ((member_of rt2 sambanXavAcI) || (member_of rt2 upAXi))
                 then [ Relation (id1,cid1,mid1,"viSe",id2,cid2,mid2,"17.16",d12)]
                 else []
       else []
     | _ -> []
     ]
     
  | _ -> []
  ]
  ;
(* yogyawA *)
value rlavy_viSeRaNam m1 m2 text_type = match m2 with
  [ Sup (id2,cid2,mid2,_,rt2,_,_,lifgam2,viBakwiH2,vacanam2,_)
  | Kqw (id2,cid2,mid2,_,_,_,_,_,_,_,rt2,_,_,lifgam2,viBakwiH2,vacanam2,_)
  | WaxXiwa (id2,cid2,mid2,_,rt2,_,_,_,lifgam2,viBakwiH2,vacanam2,_) -> 
     match m1 with
     [ Avy (id1,cid1,mid1,word1,_,pUrvapaxa1,uwwarapaxa1,_) ->
       let  d12 = if id1 > id2 then id1-id2 else id2-id1 in
       if word1="iva" &&  (uwwarapaxa1="n") && id1 = previous id2
       then [ Relation (id1,cid1,mid1,"upamAnam_rahiwa_upamAna_xyowakaH",id2,cid2,mid2,"18.1",d12)]
       else if id1 < id2 && member_of word1 avy_viSeRaNam_list
            then [ Relation (id1,cid1,mid1,"viSe",id2,cid2,mid2,"18.2",d12)]
            else if id1=previous id2 && member_of word1 intensifiers_list
                 then [ Relation (id1,cid1,mid1,"wIvrawA",id2,cid2,mid2,"18.2a",d12)]
                 else []
     | Sup (id1,cid1,mid1,_,rt1,_,_,lifgam1,viBakwiH1,vacanam1,_) ->
       let  d12 = if id1 > id2 then id1-id2 else id2-id1 in
        if    id1=previous id2 && member_of rt1 intensifiers_list && not (pronominal123 rt2)
           && (noun_agreement_vibh vacanam1 vacanam2 lifgam1 lifgam2 viBakwiH1 viBakwiH2) 
       then [ Relation (id1,cid1,mid1,"wIvrawA",id2,cid2,mid2,"18.4",d12)]
       else []
     | _ -> []
     ]
  | _ -> []
  ]
  ;

