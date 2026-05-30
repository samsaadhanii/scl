(* Copyright: Amba Kulkarni (2014-2026) 
 * Sanjeev Panchal (2015-2020) *)


(* open Paths; *)
open Scanf;
open Pada_structure; 

open Global_var;
open Morph;
open Constraint;
open Relations;
open ParAjAwi;
open NirXAraNa;
open Adata;
open Common;
open Kaaraka;
open ViBakwi345;
open Sent;
open VIpsA_nirXAraNa_kriyAviSeRaNam;
open Kqw;
open ViSeRaNa;
open SamboXana;
open Upapaxa;
open Default_sambanXaH;
open Sma_mA;
open ShaRTI;
open NAma_iwi_Gataka;
open AXikaraNa;
open Conj_disj;
open VAkyakarma;
open UpamAna;
open Sawi_sapwami;
open Hi_wsd;
open ViSeRaNa;

value all_rules2 = 
[
rlwifkarwA_karma; rlkqwkarwA_karma; rlanaBihiwe; rlapAxAna_wasil; rlAvy_kriyAviSeRaNam_or_aXikaraNam; rlpUrvakAla; rlwumun1; rlwumun2; (*rlkwa_as;*) rlsamAnakAla; rlviSeRaNam; rlavy_viSeRaNam; rlvIpsA; rlsamboXana_xyowakaH; rlnirXAraNam; rlupapaxa_other_rel; rlupapaxa; rlsambanXa1; rlavy_wif_mA; rlavy_wifkqw_special; rl_sma; (*rlavy_sent_connector; *) rl_kAraka_RaRTI1; rl_kAraka_RaRTI2; rl_kAraka_RaRTI3; rlAvykqw_karma; rlevamkarma; rl_last_iwi; rlRaRTIsambanXaH; rlviRayAXikaraNam; rlhewuprayoge; (*rlniwya_sambanXa_avy; rlniwya_sambanXa_sup;  rl_initial_avy;*)  rl_ca; rlsent_beginning_connectives; (*rlparimANa_viSeRaNam;*) rl_exclamatory1; (*rlhewu_sup;*) rlkarwqrahiwakarwqsamAnAXikaraNam; rlafgavikAra;  rl_spl_aXikaraNam; (* rlkarwqsamAnAXikarana_noverb;  This is over-generating  we need more stringent conditions *) rlkriyAviSeRaNam_wqwIyA; rlaXikaraNam; rl_avaXi ]
;

value all_rules3 = [rlkarwqsamAnAXikaraNam; rlkarmasamAnAXikaraNam; rlvAkyakarma; rlvAkyakarma1; (*rlsent_connectives;*) rlupamAna_upameya_sup; rlca_samucciwa; rl_exclamatory2; rl_ca_wif_aBihiwa_karwA_karma; rl_wulanA; rl_nAma; rl_saha_vinA_kqwe; (*rl_wif_kriyA_kriyA; *) rlBAvalakRaNa_sapwamI1; rl_hi; rl_anyawara]
;

value distinct_2 m1 m2 = match m1 with
  [ Wif (id1,_,_,_,_,pUrvapaxa1,_,_,_,_,_,_,_,_,_,_)
  | Kqw (id1,_,_,_,_,_,_,_,_,_,_,pUrvapaxa1,_,_,_,_,_)
  | Avykqw (id1,_,_,_,_,pUrvapaxa1,_,_,_,_,_,_)
  | AvywaxXiwa (id1,_,_,_,_,pUrvapaxa1,_,_,_)
  | Sup (id1,_,_,_,_,pUrvapaxa1,_,_,_,_,_)
  | Avy (id1,_,_,_,_,pUrvapaxa1,_,_)
  | WaxXiwa (id1,_,_,_,_,pUrvapaxa1,_,_,_,_,_,_) -> match m2 with
  	[ Wif (id2,_,_,_,_,pUrvapaxa2,_,_,_,_,_,_,_,_,_,_)
  	| Kqw (id2,_,_,_,_,pUrvapaxa2,_,_,_,_,_,_,_,_,_,_,_)
 	| Avykqw (id2,_,_,_,_,pUrvapaxa2,_,_,_,_,_,_)
 	| AvywaxXiwa (id2,_,_,_,_,pUrvapaxa2,_,_,_)
 	| Sup (id2,_,_,_,_,pUrvapaxa2,_,_,_,_,_)
 	| Avy (id2,_,_,_,_,pUrvapaxa2,_,_)
 	| WaxXiwa (id2,_,_,_,_,_,pUrvapaxa2,_,_,_,_,_) -> 
                if not (id1 = id2) && not (pUrvapaxa1="y") && not (pUrvapaxa2 = "y")
                then True
                else False
        ]
   ]
;

value distinct_3 m1 m2 m3 =   distinct_2 m1 m2 
                           && distinct_2 m1 m3 
                           && distinct_2 m2 m3
;

value kAraka_engine3 morphs text_type =
  loop1 [] morphs 
  where rec loop1 acc1 = fun
       [ [] -> acc1
       | [ m1 :: r1 ] -> 
             let relations_m1 = loop2 [] morphs
             where rec loop2 acc2 = fun
            [ [] -> acc2
            | [ m2 :: r2 ] -> 
                     let relations_m1_m2 = loop3 [] morphs
                     where rec loop3 acc3 = fun
                     [ [] -> if distinct_2 m1 m2  then
                               (*List.fold_left collate acc2 all_rules2 where --> Amba acc2 -> acc3 26th Dec 2025 *)
                               List.fold_left collate acc3 all_rules2 where
                               collate rls rule = match rule m1 m2 text_type with
                               [ [] -> List2.union rls acc3
                               | r -> List.append r rls
                               ]
                             else acc3
                     | [m3 :: r3 ] -> 
                               if distinct_3 m1 m2 m3 then
                                 let relations_m1_m2_m3 = 
                                 List.fold_left collate acc3 all_rules3 where
                                 collate rls rule = match rule m1 m2 m3 text_type with
                                 [ [] -> rls
                                 | r -> List2.union r rls
                                 ] in loop3 (List2.union relations_m1_m2_m3 acc3) r3
                              else loop3 acc3 r3
                    ] in loop2 (List2.union relations_m1_m2 acc2) r2
            ] in loop1 (List2.union relations_m1 acc1) r1
       ] 
;

value rec replace_freq_by_dist acc  = fun
[ [] -> acc
| [Relation (id1,cid1,mid1,rel,id2,cid2,mid2,rl1,dist1) :: s]  -> 
     let dist = if id2 > id1 then id2-id1 else id1-id2 in 
       let acc1 = List.append [Relation(id1,cid1,mid1,rel,id2,cid2,mid2,rl1,dist)] acc in 
           replace_freq_by_dist acc1 s
]
;

value compareincoming m1 m2 =
match m1 with
[ Relation (id1,cid1,mid1,rel,id2,cid2,mid2,rl1,dist1)  -> 
 match m2 with 
 [ Relation (id3,cid3,mid3,rel,id4,cid4,mid4,rl2,dist2)  -> 
     if id1=id3 then compare dist1 dist2 else compare id1 id3 
 ]
]
;

(*
value compareoutgoing m1 m2 =
match m1 with
[ Relation (a1,b1,c1,d1,e1,rl1,dist1)  -> 
 match m2 with 
 [ Relation (a2,b2,c2,d2,e2,rl2,dist2) ->
 if d1=d2 then if e1=e2 then if c1=c2 then compare dist1 dist2 else compare c1 c2 else compare e1 e2 else compare d1 d2
 ]
]
;
*)

value best2incoming sorted_lst =
    let dist_sorted_lst = replace_freq_by_dist [] sorted_lst in
    let sorted_lst1 = List.sort compareincoming dist_sorted_lst in  do {
      (*print_string "after compareincoming\n" ;
      List.iter (print_relation stdout) sorted_lst1 ;
      print_string "after best2incoming\n";*)
    loop [] 0 0 0 "" 0 0 0 0 0 sorted_lst1
    where rec loop acc b c d rel f g h dist count = fun
    [ [] ->  (*do { List.iter (print_relation stdout) acc;  *)  acc  (*} *)
    | [Relation (b1,c1,d1,rel1,f1,g1,h1,rl1,dist1) :: s] ->   (* do { print_sint count;  print_sint a1; print_sint b1; print_string c1; print_sint d1; print_string "\n"; *)
                      if b=b1 then 
                        if dist = dist1 then  (* do { print_string "distance same added\n"; *)
                           let acc1 = List.append acc [Relation (b1,c1,d1,rel1,f1,g1,h1,rl1,dist1)] in 
                               loop acc1 b1 c1 d1 rel1 f1 g1 h1 dist1 count s
                           (* } *)
                         else if (   rel1="viSeRaNam" 
                                  || rel1 = "upamAnam"
                                  || rel1 = "viXeya_viSeRaNam" 
                                  || rel1 = "karwA"
                                  || rel1 = "karwA_be_verbs" 
                                  || rel1="aBexaH" 
                                  || rel1 = "samAsaH") then  (* do { print_string "viSeRaNam found\n"; *) (* karwA is added, since typically in prose form karwA is in the beginning, far away from the verb *)
                                let acc1 = List.append acc [Relation (b1,c1,d1,rel1,f1,g1,h1,rl1,dist1)] in 
                                    loop acc1 b1 c1 d1 rel1 f1 g1 h1 dist1 count s
   (* It is possible that RaRTI sambanXaH with immediate next/previous words do not yield the correct answer;
E.G wri-lokajFaH vAlmIkeH nAraxaH vacaH ... here vAlmIkeH can get potentially connected to the previous and the following. But the correct relation is with vacaH. Till we do not know how to stop this, we will allow upto 3 conenctions *)
                         (*else if rel1="RaRTIsambanXaH" then  (* do { print_string "RaRTIsambanXaH found\n"; *)
                                if count < 1 then
                                    let acc1 = List.append acc [Relation (b1,c1,d1,rel1,f1,g1,h1,rl1,dist1)] in 
                                    loop acc1 b1 c1 d1 rel1 f1 g1 h1 dist1 count s
                                else (*do { print_string "skipped"; *) loop acc a1 b1 c1 d1 rel1 e1 f1 g1 h1 0 count s (*}*) *)
                             else if count < 3 then  (* { do print_string "count increased\n"; *)
                                    let acc1 = List.append acc [Relation (b1,c1,d1,rel1,f1,g1,h1,rl1,dist1)] in 
                                    let count1 = count+1 in loop acc1 b1 c1 d1 rel1 f1 g1 h1 dist1 count1 s
                                  (* } *)
                                  else (*do { print_string "skipped"; *) loop acc b1 c1 d1 rel1 f1 g1 h1 0 count s (*}*)
                      else  (*do {  print_string "added\n"; *)
                                 let acc1 = List.append acc [Relation (b1,c1,d1,rel1,f1,g1,h1,rl1,dist1)] in 
                                 loop acc1 b1 c1 d1 rel1 f1 g1 h1 dist1 1 s
                       (*} *)
             (*} *)
     ] 
  }
; 

(*
value best2outgoing sorted_lst =
    let sorted_lst1 = List.sort compareoutgoing sorted_lst in
    loop [] 0 0 "" 0 0 0 0 sorted_lst1
    where rec loop acc a b c d e dist count = fun
    [ [] -> acc
    | [Relation (a1,b1,c1,d1,e1,f1,dist1) :: s] -> 
            if e=e1 then 
               if d = d1 then 
                  if c = c1 then 
                     if b = b1 then 
                       if a = a1 then 
                        if dist = dist1 then 
                           let acc1 = List.append [Relation (a1,b1,c1,d1,e1,f1,dist1)] acc in 
                           loop acc1 a1 b1 c1 d1 e1 dist1 count s
                        else if count < 3 then
                                let acc1 = List.append [Relation (a1,b1,c1,d1,e1,f1,dist1)] acc in 
                                let count1 = count+1 in loop acc1 a1 b1 c1 d1 e1 dist1 count1 s
                             else loop acc a1 b1 c1 d1 e1 dist1 count s
                       else if count < 3 then
                             let acc1 = List.append [Relation (a1,b1,c1,d1,e1,f1,dist1)] acc in 
                             let count1 = count+1 in loop acc1 a1 b1 c1 d1 e1 dist1 count1 s
                          else loop acc a1 b1 c1 d1 e1 dist1 count s
                      else if count < 2 then
                             let acc1 = List.append [Relation (a1,b1,c1,d1,e1,f1,dist1)] acc in 
                             let count1 = count+1 in loop acc1 a1 b1 c1 d1 e1 dist1 count1 s
                          else loop acc a1 b1 c1 d1 e1 dist1 count s
                  else let acc1 = List.append [Relation (a1,b1,c1,d1,e1,f1,dist1)] acc in 
                       loop acc1 a1 b1 c1 d1 e1 dist1 1 s
              else let acc1 = List.append [Relation (a1,b1,c1,d1,e1,f1,dist1)] acc in 
                   loop acc1 a1 b1 c1 d1 e1 dist1 1 s
            else let acc1 = List.append [Relation (a1,b1,c1,d1,e1,f1,dist1)] acc in 
                 loop acc1 a1 b1 c1 d1 e1 dist1 1 s
     ] 
; 

*)

value rec filter_function x count = fun
 [ [] -> count
 | [ Relation(b,c,d,rel,f,g,h,i,j)::s ] -> if b=x then let count1=count+1 in 
                                          filter_function x count1 s 
                                     else filter_function x count s 
 ]
;
value add_rels_per_word rel_lst = 
    loop [] rel_lst where
    rec loop acc = fun
    [ [] -> acc
    | [Relation (b,c,d,rel,f,g,h,i,j) :: s] -> let count = filter_function b 0 rel_lst in
                                         let acc1 = List.append [Relation (b,c,d,rel,f,g,h,i,count)] acc in
					 loop acc1 s
    ]
;

value compare_size m1 m2 =
    match m1 with
    [ Relation (b1,c1,d1,rel1,f1,g1,h1,rl1,dist1)  -> 
       match m2 with 
       [ Relation (b2,c2,d2,rel2,f2,g2,h2,rl2,dist2) ->
           compare dist1 dist2
       ]
    ]
;

value init_relation_encoding_array () =
List.iter assign relations_encodings
where assign (ident,index) = 
relation_array.(index) := ident
;

value init_sentence_feature_variables morphs  = 
 List.iter 
 (fun m -> match m with 
     [ Wif (id,cid,mid,word,rt,_,_,upasarga,_,_,_,_,_,_,_,_) -> 
             do { 
             if (mid = 1 ) then finite_verb_in_sentence.val := id else ();  (* this condition should e strenthened further to see that there is no other sup sanalysis for this word *)
             if (rt = "as2") then aswi_pos.val := id  else ();
             if (rt = "BU1") then aswi_pos.val := id  else ();
             if(total_wrds.val < id) then total_wrds.val := id else ();
             if members_of rt upasarga karwqsamAnAXikaraNa_verbs 
             then karwqsamverbs.val := id else ()
             }
     | WaxXiwa (id,cid,_,_,_,_,_,_,_,_,_,_)
     | Kqw (id,cid,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_)
     | AvywaxXiwa (id,cid,_,_,_,_,_,_,_)-> if (total_wrds.val < id) then total_wrds.val := id else ()
     | Avykqw (id,cid,_,_,_,_,_,_,_,kqw,_,_) -> do {
                 if (total_wrds.val < id) then total_wrds.val := id else ()
                 ;if (kqw="lyap" || kqw="kwvA")  then
                   if kwvA_lyap_pos1.val = 50 then kwvA_lyap_pos1.val := id
                   else if kwvA_lyap_pos2.val = 50 then kwvA_lyap_pos2.val := id
                   else if kwvA_lyap_pos3.val = 50 then kwvA_lyap_pos3.val := id
                   else ()
                   else ()
                 }
     | Sup (id,cid,_,word,rt,_,_,_,_,_,_) -> do {
                 if (total_wrds.val < id) then total_wrds.val := id else ()
                 ;if rt="yax" then yax_pos.val := id else ()
                 ;if rt="yAvaw" then yAvaw_pos.val := id else ()
                 ;if rt="wAvaw" then wAvaw_pos.val := id else ()
                 ;if word="wvam" then wvam_pos.val := id else ()
                 ;if word="aham" then aham_pos.val := id else ()
                 }
     | Avy (id,cid,_,word,_,_,_,_) -> do {
                 if (total_wrds.val < id) then total_wrds.val := id else ()
                ;match word with
          [ "iwi" -> do { (); iwi_pos.val := id;}
          (*| "evam" -> do { (); evam_pos.val := id;}*)
          | "yaxA" -> do { (); yaxA_pos.val := id;}
          | "yaWA" -> do { (); yaWA_pos.val := id;}
          | "waxA" -> do { (); waxA_pos.val := id;}
          | "yawra" -> do { (); yawra_pos.val := id;}
          | "wawra" -> do { (); wawra_pos.val := id;}
          | "yAvaw" -> do { (); yAvaw_pos.val := id;}
          | "wAvaw" -> do { (); wAvaw_pos.val := id;}
          | "yawaH" -> do { (); yawaH_pos.val := id;}
          | "waw" -> do { (); waw_pos.val := id;}
          | "wax" -> do { (); waw_pos.val := id;}
          | "awaH" -> do { (); awaH_pos.val := id;}
          | "wawaH" -> do { (); wawaH_pos.val := id;}
          | "cew" -> do { (); cew_pos.val := id;}
          | "waWA" -> do { (); waWA_pos.val := id;}
          | "aWa" -> do { (); aWa_pos.val := id;}
          | "yaw" -> do { (); yaw_pos.val := id;}
          | "yax" -> do { (); yaw_pos.val := id;}
          | "yasmAw" -> do { (); yasmAw_pos.val := id;}
          | "wasmAw" -> do { (); wasmAw_pos.val := id;}
          | "hi" -> do { (); hi_pos.val := id;}
          | "iva" -> do { (); iva_pos.val := id;}
          (*| "COMMA" -> do { (); manual_boundary1.val := id;} *)
          | _ -> ()
          ] 
          }
     ] 
 ) morphs
;
(* value process morphs text_type tfpath compound_analysis = *)
value process morphs text_type tfpath = 
  let offline_file = tfpath^"graph.txt"  in
  let cho = open_out offline_file in do
  { 			(*List.iter print_morph_id morphs *) (* we print the input for verification *)
    let rel_lst = List.sort_uniq compare (kAraka_engine3 morphs text_type) in
    (* let cpd_lst = List.sort_uniq compare (Build_graph_cpd.compound_engine morphs text_type compound_analysis) in *)
    let cpd_lst = List.sort_uniq compare (Build_graph_cpd.compound_engine morphs text_type) in
    let all_rel_lst = List.append cpd_lst rel_lst in
    let sorted_lst = List.rev (List.sort_uniq compare all_rel_lst) in do {
    			List.iter (print_relation cho) sorted_lst;
     let sorted_lst1 = best2incoming sorted_lst in do {
      			 output_string cho "\nAFTER best2incoming\n";
      			(*List.iter (print_relation cho) sorted_lst1; *)
      let sorted_lst2 = add_rels_per_word sorted_lst1 in
       let sorted_lst3 = List.sort compare_size sorted_lst2 in  do {
         List.iter (print_relation cho) sorted_lst3;
         flush cho;
        close_out cho;
        let tpl_lst = mk_tuple_lst [] sorted_lst3 in 			 (*do {
          			List.iter Constraint.print_relation tpl_lst ; *)
        (*let t1 = Unix.time() in do { *)
        let max_soln = 400 in
        Constraint.solver tpl_lst max_soln text_type
        (*let t2 = Unix.time() in do {
         print_float t2;
         print_float t1
        }
        } *)
          								 (*}*)
       									(*}*)
      									(*}*)
    }
   }
  }
 }
;

(* value text_type arg1 = if arg1="Prose" || arg1="Sloka" then arg1 else failwith "Incorrect Argument\n"
; 
*)

value main () = if (Array.length Sys.argv < 3 ) then do
           { print_string "\n\n"
           ; print_string "Usage: ./build_graph tmp_file_path Prose|Sloka\n\n"
           ; failwith "Parsing aborted\n"
           } 
        else do
           { 
            (*Sys.command("date")
           ;*) 
	     init_relation_encoding_array()
           ; let text_type = Sys.argv.(2)
             and tfpath = Sys.argv.(1)
             (*and compound_analysis = Sys.argv.(3) *)
             and morphs = analyse (Stream.of_channel stdin) in
             do
             {
              init_sentence_feature_variables morphs
             (*; process morphs text_type tfpath compound_analysis *)
             ; process morphs text_type tfpath
             (*; Sys.command("date")*)
             }
           }
;
main()
;



(*  To add to compound.ml *)
(* value handle_sp_compounds id1 cid1 mid1 id2 cid2 mid2 rt1 word1 pUrvapaxa1 uwwarapaxa1 lifgam1 = 

       if uwwarapaxa1="y" then
       let d = if id1 > id2 then id1-id2 else id2-id1 in
       if rt1="pUrvaka" && lifgam1="napuM" 
       then [ Relation (id1,cid1,mid1,"kriyAviSeRaNam",id2,cid2,mid2,"1.1", d)]
       else if rt1="arWa" 
       then [ Relation (id1,cid1,mid1,"prayojanam1",id2,cid2,mid2,"1.5", d)]
       else if rt1="ananwaram" 
       then [ Relation (id1,cid1,mid1,"kAlAXikaraNam",id2,cid2,mid2,"1.6", d)]
       else if word1="-sahiwaH" 
       then [ Relation (id1,cid1,mid1,"sahArWaH",id2,cid2,mid2,"1.6a", d)]
       else if rt1="saxqSa" 
       then [ Relation (id1,cid1,mid1,"viSeRaNam",id2,cid2,mid2,"1.6b", d)]
       else if rt1="safkASa" 
       then [ Relation (id1,cid1,mid1,"viSeRaNam",id2,cid2,mid2,"1.6c", d)]
       else if (rt1="pUrveNa") (* || (rt1="pramuKeH") Why pramuKa?? vasiRTa-pramuKEH niyujyamAnaH -- not kriyAviSeRaNa*)
       then [ Relation (id1,cid1,mid1,"kriyAviSeRaNam",id2,cid2,mid2,"1.2", d)]
       else []
       else []

   (* else if (word1="yaWA") && lifgam1="napuM"
      then [ Relation (id1,cid1,mid1,"kriyAviSeRaNam",id2,cid2,mid2,"1.4", d)] -- Need to handle in new system where components of compound are separated 
      else if word1="kqwe" && compound word1 uwwarapaxa1
      then [ Relation (id1,cid1,mid1,"prayojanam",id2,cid2,mid2,"1.33c", d)]
      else if (pUrvapaxa1="sa") && lifgam1="napuM"
      then [ Relation (id1,cid1,mid1,"kriyAviSeRaNam",id2,cid2,mid2,"1.30c", d)] -- Need to handle in new system where components of compound are separated
         Need example for sa- as a kriyAviSeRaNam (e.g. sa-Axaram)
         sa-Saram cApam - is not a kriyAviSeRaNam 
   *)
; *)

(* value rl_compound_T6 m1 m2 text_type = match m2 with
  [ Kqw (id2,cid2,mid2,_,rt2,_,_,_,_,_,_,pUrvapaxa2,uwwarapaxa2,_,_,_,_)
  | Sup (id2,cid2,mid2,_,rt2,pUrvapaxa2,uwwarapaxa2,_,_,_,_)
  | WaxXiwa (id2,cid2,mid2,_,rt2,pUrvapaxa2,uwwarapaxa2,_,_,_,_,_) -> 
     match m1 with
     [ Sup (id1,cid1,mid1,word1,rt1,pUrvapaxa1,uwwarapaxa1,_,_,_,_)
     | Kqw (id1,cid1,mid1,word1,rt1,_,_,_,_,_,_,pUrvapaxa1,uwwarapaxa1,_,_,_,_)
     | WaxXiwa (id1,cid1,mid1,word1,rt1,pUrvapaxa1,uwwarapaxa1,_,_,_,_,_) -> 
	  if (id1 = id2) && (cid2 = next cid1) && (pUrvapaxa1="y") && ((uwwarapaxa2="y") || (pUrvapaxa2="y"))
	  then if not ((rt2="sama") || (rt2 = "saxqRa"))
	       then  [ Relation (id1,cid1,mid1,"samAsaH",id2,cid2,mid2,"200.2",0) ]
	       else  []
	  else []
     |_ -> []
     ]
   | Avykqw (id2,cid2,mid2,word2,_,pUrvapaxa2,_,_,_,_,_,_) ->
        match m1 with
     [ Sup (id1,cid1,mid1,word1,rt1,pUrvapaxa1,uwwarapaxa1,_,_,_,_) ->
          if (word1 = "an-" || word1="a-")
	  then [ Relation (id1,cid1,mid1,"samAsaH",id2,cid2,mid2,"200.3",0) ]
	  else []
     |_ -> []
     ]
   |_ -> []
 ]
;
*)

(* saH prajApawi-samaH SrImAn aswi *)
(* value rlsamAsa_upamAna m1 m2 m3 text_type = match m2 with
   [ Sup (id2,cid2,mid2,word2,rt2,_,uwwarapaxa2,lifgam2,viBakwiH2,vacanam2,_) ->
       if (cid2 > 1) && (uwwarapaxa2 = "y")
       && ((rt2 = "sama") || (rt2 = "saxqSa"))
     then  match m3 with
     [ Sup (id3,cid3,mid3,word3,rt3,_,uwwarapaxa3,lifgam3,viBakwiH3,vacanam3,_) -> 
       let  d23 = if id2 > id3 then id2-id3 else id3-id2 in
       if noun_agreement_vibh vacanam2 vacanam3 lifgam2 lifgam3 viBakwiH2 viBakwiH3
       then  match m1 with
       [ Sup (id1,cid1,mid1,word1,rt1,pUrvapaxa1,_,_,_,_,_) -> 
            if (id1 = id2) && (cid1 = previous cid2)  && (pUrvapaxa1 = "y")
            then [ Relation (id1,cid1,mid1,"upamAnam",id3,cid3,mid3,"18.1a",d23)
                 ; Relation (id2,cid2,mid2,"upamAna_xyowakaH",id1,cid1,mid1,"18.1b",0)
                 ]
            else []
       | _ -> []
       ] else []
     | _ -> []
     ]  else []
   | _ -> []
   ]
;
*)
