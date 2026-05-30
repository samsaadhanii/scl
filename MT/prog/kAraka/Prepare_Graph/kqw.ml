open Pada_structure;
open Global_var;
open Common;
open Adata;

(* Verb - Verb Relatiosn *)
(* ;saH prasannaH BUwvA mAwaram avaxaw. 
 ;saH api paramAwmA iva pUrNaH Baviwum icCawi
;   saH prasannaH aBavaw.
;saH(S2) SvewaH(S1) aswi(W).
;vexAH pramANam sanwi.
;vAsaH a-niyawam Bavawi
;neharO asya prawikriyA kA AsIw. *)

value kwvA_lyap id1 cid1 mid1 id2 cid2 mid2 kqw1 text_type rl1 =
       let  d12 = if id1 > id2 then id1-id2 else id2-id1 in
       if    prose_order id1 id2 text_type 
          (*&& no_boundary_crossing_with_iwi id1 id2 text_type 
          BhG 1.20-21 
aWa ... xqRtvA ... waxA .. Aha;  xqRtvA is related to Aha *)
       then if (kqw1="kwvA" || kqw1="lyap")
            then [ Relation (id1,cid1,mid1,"pUrvakAlaH",id2,cid2,mid2,rl1,d12)] 
                  (* samAna karwqkayoH pUrvakAle  rAmaH xugXam pIwvA vanam gacCawi*)  
            else []
      else []
;

(* Verb-verb relations *)
(* rAmaH xugXam pIwvA vanam gacCawi *)
(* assign_assign_prayojana_avykqw *)
value rlpUrvakAla m1 m2 text_type = match m2 with
  [ Wif (id2,cid2,mid2,_,rt2,_,_,_,_,_,_,_,_,_,_,_) ->
     if not (rt2 = "as2") && not (rt2 = "BU1")
     then match m1 with
     [ Avykqw (id1,cid1,mid1,_,_,_,_,_,_,kqw1,_,_) ->
       kwvA_lyap id1 cid1 mid1 id2 cid2 mid2 kqw1 text_type "12.1"
     | _ -> []
     ]
     else []
  | Avykqw (id2,cid2,mid2,_,rt2,_,_,_,_,kqw2,_,_) ->
     if not (rt2 = "as2") && not (rt2 = "BU1")
     then match m1 with
     [ Avykqw (id1,cid1,mid1,_,_,_,_,_,_,kqw1,_,_) ->
         if not (kqw2="kwvA" || kqw2="lyap"|| kqw2 ="wumun") (* Korada Subrahmanyam *)
         then kwvA_lyap id1 cid1 mid1 id2 cid2 mid2 kqw1 text_type "12.2"
             (* samAna karwqkayoH pUrvakAle  rAmaH xugXam pIwvA vanam gacCawi*)  
        else []
     | _ -> []
     ] else []
   | Kqw (id2,cid2,mid2,_,_,_,_,kqw_prawyayaH2,_,_,rt2,_,_,_,viBakwiH2,vacanam2,_) ->
     (* if not (viBakwiH2=7) 
     && not(kqw_prawyayaH2="GaF") (* to avoid relation of jFAwvA with niScaya in niScayaM jFAwvA *)
            (* to avoid relating xqRtvA with pravqwwe in
               aWa vyavasWiwAn xqRtvA XArwarARtrAn kapi-XvajaH.
               pravqwwe Saswra-sampAwe XanuH uxyamya pANdavaH..1.20
               hqRIkeSam waxA vAkyam ixam Aha mahI-pawe. 
               better explanation needed  -- Amba 4th Dec 2018*) *)
     if (kqw_prawyayaH2="kwa" || kqw_prawyayaH2="kwavawu")
     && viBakwiH2=1
    && not (vacanam2="xvi")
    && not (rt2="as2") && not (rt2 = "BU1")
     then match m1 with
     [ Avykqw (id1,cid1,mid1,_,_,_,_,_,_,kqw1,_,_) ->
       kwvA_lyap id1 cid1 mid1 id2 cid2 mid2 kqw1 text_type "12.3"
     | _ -> []
     ]
     else []
   | _ -> []
   ]
;

value wumun id1 cid1 mid1 id2 cid2 mid2 rt2 upasarga2 text_type rl1 rl2 rl3 =
      let  d12 = if id1 > id2 then id1-id2 else id2-id1 in
      if prose_order id1 id2 text_type 
      && no_boundary_crossing_with_iwi id1 id2 text_type
      then if (rt2="iR2" || rt2="icCuka") 
           then [ Relation ( id1,cid1,mid1,"wumunkarma",id2,cid2,mid2,rl1,d12)] 
           else if (members_of rt2 upasarga2 shakAxi)
            then [ Relation (id1,cid1,mid1,"wumunkarma",id2,cid2,mid2,rl2,d12)]
            else if not (rt2="as2") then [ Relation (id1,cid1,mid1,"prayojanam1",id2,cid2,mid2,rl3,d12)]
                 else []
      else []
;

(* rAmaH puswakam paTiwum gqham gacCawi 
 rAmaH puswakam paTiwum gacCanwam bAlakam paSyawi. *)
(* rAmaH puswakam paTiwum Saknowi *)
(* SakxqSglA ... 3.4.65 *)

value rlwumun1 m1 m2 text_type = match m1 with
  [ Avykqw (id1,cid1,mid1,_,_,_,_,_,_,kqw1,_,_) -> 
    if kqw1 ="wumun" then match m2 with
    [ Wif (id2,cid2,mid2,_,rt2,_,_,upasarga2,_,_,_,_,_,_,_,_) ->
          wumun id1 cid1 mid1 id2 cid2 mid2 rt2 upasarga2 text_type "13.1" "13.2" "13.3"
    | Avykqw (id2,cid2,mid2,_,rt2,_,_,upasarga2,_,kqw2,_,_) -> 
         if not (kqw2 = "wumun") then
            wumun id1 cid1 mid1 id2 cid2 mid2 rt2 upasarga2 text_type "13.4" "13.5" "13.6"
         else []
    | Kqw (id2,cid2,mid2,_,rt2,upasarga2,_,_,_,_,_,_,uwwarapaxa2,_,viBakwiH2,_,_) ->
          if not (uwwarapaxa2="y") then
          if members_of rt2 upasarga2 shakAxi
          then if viBakwiH2=1
          then wumun id1 cid1 mid1 id2 cid2 mid2 rt2 upasarga2 text_type "13.7" "13.8" "13.9"
	  else []
          else if  not(viBakwiH2=7) && not(rt2="iR2") 
          then  (* to avoid sawi sapwami cases getting a karma *)
          wumun id1 cid1 mid1 id2 cid2 mid2 rt2 upasarga2 text_type "13.10" "13.11" "13.12"
          else []
          else []
    | _ -> []
    ]
    else []
  | _ -> []
  ]
;

(* paryApwivacaneRu alamarWeRu  3.4.66*)
(* rAmaH jFAwum samarWaH aswi *)
(* Only rts: samarWa, Sakwa, paryApwa  in all the linfga, viBakwi and vacana*)
(* also with the avy alam *)
value rlwumun2 m1 m2 text_type = match m2 with
  [ Kqw (id2,cid2,mid2,word2,_,_,_,_,_,_,_,rt2,pUrvapaxa2,uwwarapaxa2,_,_,_) 
  | Sup (id2,cid2,mid2,word2,rt2,pUrvapaxa2,uwwarapaxa2,_,_,_,_) 
  | Avy (id2,cid2,mid2,word2,rt2,pUrvapaxa2,uwwarapaxa2,_) ->
     match m1 with
     [ Avykqw (id1,cid1,mid1,_,_,_,_,_,_,kqw1,_,_) ->
      let  d12 = if id1 > id2 then id1-id2 else id2-id1 in
      if prose_order id1 id2 text_type && kqw1="wumun" 
      && no_boundary_crossing_with_iwi id1 id2 text_type
      then match word2 with
           [ "SakwaH" | "SakwA" | "samarWaH" | "samarWA" | "paryApwaH" | "paryApwA" | "alam" | "a-samarWaH"->
                 [ Relation (id1,cid1,mid1,"prayojanam1",id2,cid2,mid2,"14.1",d12)]
           | _ -> []
           ]
      else []
     | _ -> []
     ]
  | _ -> []
  ]
;

(*
gawaH AsIw -> gawaH can be a karwA. Why do we need sahAyaka kryA?
value rlkwa_as m1 m2 text_type = 
  match m2 with
  [ Wif (id2,cid2,mid2,_,rt2,_,_,_,_,_,_,_,_,_,_,_) ->
     match m1 with
     [ Kqw (id1,cid1,mid1,_,_,_,_,kqw1,_,_,_,_,_,_,_,_,_) ->
      let  d12 = if id1 > id2 then id1-id2 else id2-id1 in
       if    prose_order id1 id2 text_type 
          && rt2="as1" 
          && (kqw1="kwa"|| kqw1="kwavawu") 
          && no_boundary_crossing_with_iwi id1 id2 text_type
       then [ Relation (id2,cid2,mid2,"sahAyakakriyA",id1,cid1,mid1,"15.1",d12)]
       else []
     | _ -> []
     ]
  | _ -> []
  ]
;
*)

value samAna_ananwarakAla id1 cid1 mid1 id2 cid2 mid2 text_type kqw1 viBakwiH1 vacanam1 vacanam2 rl1 rl2 =
     let  d12 = if id1 > id2 then id1-id2 else id2-id1 in
     if     prose_order id1 id2 text_type 
        && no_boundary_crossing_with_iwi id1 id2 text_type
        && viBakwiH1=1 && vacanam1 = vacanam2
     then if (kqw1="Sawq_lat" || kqw1="SAnac_lat") 
     then [ Relation (id1,cid1,mid1,"varwamAnasamAnakAlaH",id2,cid2,mid2, rl1,d12)]
     else if (kqw1="Sawq_lqt" || kqw1="SAnac_lqt") 
     then [ Relation (id1,cid1,mid1,"ananwarakAlaH",id2,cid2,mid2, rl2,d12)]
     else []
     else []
;

(* assign_samAnakAlikawvam *)
(* rAmaH grAmam gacCan wqNam spqSawi. *)
value rlsamAnakAla m1 m2 text_type = match m1 with
  [ Kqw (id1,cid1,mid1,word1,_,_,_,kqw1,_,_,_,pu1,uw1,_,viBakwiH1,vacanam1,_) -> 
        if not(pu1="y" || uw1="y") then
	match m2 with
       [ Wif (id2,cid2,mid2,_,_,_,_,_,_,_,_,_,vacanam2,_,_,_) ->
          samAna_ananwarakAla id1 cid1 mid1 id2 cid2 mid2 text_type kqw1 viBakwiH1 vacanam1 vacanam2 "16.1" "16.2"
       | Kqw (id2,cid2,mid2,word2,_,_,_,kqw2,_,_,_,pu2,uw2,_,viBakwiH2,vacanam2,_) ->
            if   not(pu2="y" || uw2="y")
             &&  not (viBakwiH2 = 8) &&  (kqw2 = "kwa" || kqw2 = "kwavawu" || kqw2 = "aNiyar" || kqw2 = "wavyaw") 
(* && finite_verb_in_sentence.val == 50  -- This is commented, because in the case of AgacCan, there are both finite verb analysis as well as kqw analysis, and due to this condition, the samAna kAla was not marked for it. *)
            then samAna_ananwarakAla id1 cid1 mid1 id2 cid2 mid2 text_type kqw1 viBakwiH1 vacanam1 vacanam2 "16.3" "16.4"
            else []
       |_ -> []
       ] else []
  | _ -> []
  ]
;


