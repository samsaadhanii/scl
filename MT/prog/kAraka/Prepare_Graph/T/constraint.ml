(* Copyright: Amba Kulkarni (2014-2022)                             *)
(* Indian Institute of Advanced Study, Shimla (2015-17)             *)

(* To add: gam1 can not have both karma and aXikaraNa *)
open Hashtbl;
open Pada_structure;

open Bank_lexer;
module Gram=Camlp4.PreCast.MakeGram Bank_lexer
;
open Bank_lexer.Token
;
(*value relations=Gram.Entry.mk "relations"
;
*)
value multiple_relations_begin=21 (* inclusive *)
(* Two or more aXikaraNa, kAla-aXikaraNa, xeSa-aXikaraNa, pUrvaAlaH, ... are possible 
Ex: ekaxA yaxA .. waxA *)
;
value multiple_relations_end=41 (* inclusive *)
;
value max_rels=300 (* Max relations in a sentence *)
;
value compatible_relations=Array.make max_rels []
;
value compatible_words=Array.make max_rels []
;
value compatible_all_words=Array.make max_rels False
;
value inout_rels=Array.make max_rels 0
;
value total_dags_so_far=ref 1
;
(* Grammar of morph_analyses coming from sentence *)
(*
EXTEND Gram
  GLOBAL: relations;
  relations:
    [ [ l=rel_rec; `EOI -> l
      | l=rel_rec -> failwith "Wrong relation data"
    ] ] ;
  rel_rec:
    [ [ -> []
      | l=rel_rec; t=relationc ->  (* left (terminal) recursion essential *)
  l @ [ t ]
    ] ] ;
  relationc:
    [ [ r=relc -> Relationc r
    ] ] ;

  relc:
    [ [  i1=INT;
   m1=INT;
   rel=INT;
   i2=INT;
   m2=INT ->
  (int_of_string i1,int_of_string m1,int_of_string rel,int_of_string i2,int_of_string m2)
    ] ] ;

END
;
*)
(* value analyse strm=let relations =
  try Gram.parse relations Loc.ghost strm with
  [ Loc.Exc_located loc (Error.E msg) -> do
     { output_string stdout "\n\n"
     ; flush stdout
     ; Format.eprintf "Lexical error: %a in line %a in example \n%!"
                      Error.print msg Loc.print loc
     ; failwith "Parsing aborted\n"
     }
  | Loc.Exc_located loc (Stream.Error msg) -> do
     { output_string stdout "\n\n"
     ; flush stdout
     ; Format.eprintf "Syntax error: %s in example \n%!" msg
     ; failwith "Parsing aborted\n"
     }
  | Loc.Exc_located loc ex -> do
     { output_string stdout "\n"
     ; flush stdout
     ; Format.eprintf "Fatal error in example \n%!"
     ; raise ex
     }
  | ex -> raise ex
  ]  in relations
;
*)

(*
   Input: A Graph represented as a list of edges (relations) represented
          as quintuples (id1,mid1,rel,id2,mid2), where 'rel' is the label
          on the edge from the node 'id2,mid2' to the node 'id1,mid1'.
   Output: Labeled, directed acyclic graphs (DAGS) ordered on cost, satisfying
           the constraints, where a DAG is a set of compatible edges.

   Constraints are described in chk_compatible function.
   Cost function is defined in add_cost.

   1. Relations are indexed starting from 1
   2. For each relation a list of compatible_relations is populated
      compatible_relations.(i) contains the indices of all the relations, from i+1 onwards that are compatible with relation i.
   3. We split the words into two halves, and build all possible dags for each of the havles, and then join the dags so constructed 
      by checking the compatibility.
*)

value intersection l1 l2=if List.length l1 < List.length l2 
                           then List.filter (fun x -> (List.mem x l1)) l2
                           else List.filter (fun x -> (List.mem x l2)) l1 (* l1 intersection l2 *)
;

value print_relation r=match r with
 [ Relationc (i1,i2,i3,i4,i5)   -> do
    { print_string "("
    ; print_int (i1-1); print_string ","
    ; print_int (i2-1); print_string ","
    ; if (i3 >= 2000) then print_int (i3 - (i3 mod 100)) 
      else if (i3=1009) then print_int 9 
      else if (i3=1079) then print_int 79 
      else if (i3=70) then print_int 34  (* hewuH -> hewu *)
      else if (i3=33) then print_int 32  (* aBexaH -> viSeRaNam *)
      else if (i3=61) then print_int 60  (* sup_samucciwaH -> samucciwaH *)
      else if (i3=63) then print_int 62  (* sup_anyawaraH -> anyawaraH *)
      else if (i3=65) then print_int 64  (* sup_samucciwa_xyowakaH -> samucciwa_xyowakaH *)
      else if (i3=67) then print_int 66  (* sup_anyawara_xyowakaH -> anyawara_xyowakaH *)
      else if (i3=6) then print_int 7  (* karwA_be_verb -> karwA*)
      else if (i3=8) then print_int 9  (* karwqrahiwakarwqsamAnAXikaraNa -> viXeya_viSeRaNam *)
      (* else if (i3=64) || (i3=65) (* samuccayaxyowaka,sup_samuccayaxyowaka *)
      then print_int 1
      else if (i3=66) || (i3=67) (* anyawaraxyowaka,sup_anyawaraxyowaka *)
      then print_int 1 *)
      else print_int i3
    ; print_string ","
    ; print_int (i4-1); print_string ","
    ; print_int (i5-1); print_string ")\n"
    }
 ]
;

value print_relation_in_dag relations r=
	let rel=List.nth relations (r-1) in
	print_relation rel
;

value join_relations a b c d e u v w x y =
    if d=u && e=v 
    then if c >= 2000 && c < 2100
      then if w >= 4000 && w < 4100 then [Relationc (a,b,42,d,e);Relationc (u,v,20,x,y)]
      else if w >= 4100 && w < 4200 then [Relationc (a,b,42,d,e); Relationc (u,v,21,x,y)]
      else if w >= 4200 && w < 4300 then [Relationc (a,b,42,d,e); Relationc (u,v,7,x,y)] 
      else if w >= 4300 && w < 4400 then [Relationc (a,b,42,d,e); Relationc (u,v,28,x,y)] 
      else if w >= 4400 && w < 4500 then [Relationc (a,b,42,d,e); Relationc (u,v,9,x,y)] 
      else if w >= 4500 && w < 4600 then [Relationc (a,b,42,d,e); Relationc (u,v,25,x,y)] 
      else if w=21 && c >= 2000 && c < 2100 then [Relationc (a,b,42,d,e)] 
      else []
    (* else if c >= 2100 && c < 2200 then [Relationc (u,v,21,x,y)]  *)
    else if c >= 2200 && c < 2300 then [Relationc (u,v,14,x,y)] 
    else if c >= 2400 && c < 2500 && w >= 4300 && w < 4400 then [
            Relationc (u,v,95,x,y); Relationc(a,b,42,d,e)] 
    else if c >= 2600 && c < 2700 then [Relationc (u,v,49,x,y)] 
    (* else if c >= 2700 && c < 2800 then [Relationc (u,v,14,x,y)]  *)
    (*else if c >= 3100 && c < 3200  && w >= 4300 && w < 4400 then [Relationc (a,b,c,d,e);Relationc (u,v,92,x,y)]*)
    else if c >= 3200 && c < 3300  && w >= 4300 && w < 4400 then [Relationc (a,b,c,d,e);Relationc (u,v,93,x,y)] 
    else if c >= 2300 && c < 2400 && w >= 4300 && w < 4400 
    then [Relationc (a,b,c,d,e);Relationc (u,v,w,x,y)] 
    else if c >= 2900 && c < 3000 && w >= 4300 && w < 4400 
    then [Relationc (u,v,94,x,y)] 
    else []
    else []
;

value collapse_upapada_relations relations part_dag a b c d e=
    loop [] relations part_dag
    where rec loop acc relations=fun
    [ [] -> acc (* if (c >=2000 && c < 2300) || (c >= 2400 && c < 4000) 
(*(c >= 2400)*)
            then if not (acc=[])
            then List.append acc [Relationc (a,b,0,d,e)] 
            else []
            (*else [Relationc (a,b,c,d,e)] *)
(* We need to handle karma pravacanIya separately *)
            else if (c >= 2300 && c < 2400)
            then acc
            else [] *)
    | [r :: l ] -> let rel=List.nth relations (r-1) in
            match rel with
            [Relationc (u,v,w,x,y) -> 
                    let acc1 =
                    if c >= 2000 && c < 4000 && w >= 4000
                    then join_relations a b c d e u v w x y
                    else if c >= 4000 && w >=2000 && w < 4000
                    then join_relations u v w x y a b c d e 
                    else if c >= 2000 &&  c < 2100 && w=21
                    then join_relations a b c d e u v w x y
                    else if c=21 && w >= 2000  && w < 2100
                    then join_relations u v w x y a b c d e
                    else []
                in  let acc2=if acc1=[] then []
                    (*else if ((c >= 3100 && c < 3300)) -- removed, since now upa_vinA and upa_saha relations are being marked from translation point of view.
                     * Earlier we would group them together with the previous wqwIyA viBakwi word
                    (* else if ((c >= 2000 && c < 2300) || (c >=2400 && c < 4000)) *)
                    then List.append acc1 [Relationc (a,b,0,d,e)]  *)
                     (* for saha and vinA grouping *)
                    (*else if (c >=4000)
                    then List.append acc1 [Relationc (u,v,0,x,y)] *)
		    else acc1
                in let acc3=List.append acc acc2 
                in  loop acc3 relations l
            ]
    ]
; 

value lwg_and_collapse relations dag =
    loop [] relations dag
    where rec loop acc relations=fun
    [ [] -> acc
    | [r :: l ] ->
           let rel=List.nth relations (r-1) in
            match rel with
            [Relationc (a,b,c,d,e) -> 
               if c < 2000
               then let acc1=if c=91  (* avaXiH  not defined in build_graph.ml! *)
                               then List.append acc [Relationc (a,b,0,d,e)] 
                               else if c =214
                               then List.append acc [Relationc (a,b,14,d,e)] 
                               else if (c=200) (*gawikarwA -> karwA *)
                               then List.append acc [Relationc (a,b,7,d,e)] 
                               else if (c=201) (*gawikarma -> karma *)
                               then List.append acc [Relationc (a,b,14,d,e)] 
                               else List.append acc [rel] 
                    in loop acc1 relations l
               else let acc1=
                    collapse_upapada_relations relations l a b c d e
                    in let acc2=List.append acc acc1
                    in loop acc2 relations l
            ]
    ]
;


value print_cost_soln (len,c,l) n count rel=do
        { (*print_string "len="; print_int len; *)
          if len > count then 
          do { print_string "Solution:"
            ; print_int n; print_newline ()
            (*; let l1=lwg_and_collapse rel l in *)
            ; List.iter print_relation l
            ; print_string "Cost="; print_int c
            ; print_string "\n\n"
            }
    else ()
}
;

(*  OLD
 value print_cost_soln (len,c,l) n count rel=do
  { if len > count
    then do { print_string "Solution:"
            ; print_int n; print_newline ()
            ; let l1=lwg_and_collapse rel l in
              List.iter print_relation l1
            ; print_string "Cost="; print_int c
            ; print_string "\n\n"
            }
    else ()
  }
;
*)

 
  (*expects (int,int,int list) list *)
value rec print_cost_soln_list n count rel=fun
  [ [] -> ()
  | [ (len,a,l) :: r ] -> do
          { (*print_string "n="; print_int n; print_newline()
      ; *)print_cost_soln (len,a,l) n count rel
      ; print_cost_soln_list (n+1) count rel r
      }
  ]
;

value between b a c =
  if (a < b && b < c) || (c < b && b < a) then True else False
;

value single_morph_per_word m1 m2=match m1 with
    [ Relationc (to_id1,to_mid1,r1,from_id1,from_mid1) -> match m2 with
      [Relationc (to_id2,to_mid2,r2,from_id2,from_mid2) -> 
            (* Two morph analyses for a word *)

         if (to_id1=to_id2) && not (to_mid1=to_mid2) then False (* do { print_string "C1"; False} *)
         else if (to_id1=from_id2) && not (to_mid1=from_mid2) then False (* do { print_string "C2"; False} *)
         else if (from_id1=from_id2) && not (from_mid1=from_mid2) then False (* do { print_string "C3"; False} *)
         else if (from_id1=to_id2) && not (from_mid1=to_mid2) then False (* do { print_string "C4"; False} *)
         else True
      ]
    ]
;
         (* else if ((r1=2) || (r2=2)) (* niwya_sambanXaH *)
         then if (from_id2=to_id1 && from_mid2=to_mid1 && to_id2=from_id1 && to_id2=from_id1) then False (* no self loop *)
         else if (from_id2=from_id1 && from_mid2=from_mid1 && to_id2=to_id1 && to_id2=to_id1) then False (* no self loop *)
        else True (* in case of niwya sambanXa, following checking not required *) *)

value single_relation_label m1 m2=match m1 with
    [ Relationc (to_id1,to_mid1,r1,from_id1,from_mid1) -> match m2 with
      [Relationc (to_id2,to_mid2,r2,from_id2,from_mid2) -> 
            (* Two incoming arrows (*with diff labels*) except niwya_sambanXaH (=2) *)
         if (to_id1=to_id2) && (to_mid1=to_mid2) (*&& not (r1=r2) *)
         && not (r1=2) && not(r2=2) 
         && not (r1=90) && not(r2=90) 
         then False (* do { print_string "C5"; False} *)
         				(* else if (to_id1=to_id2) && (to_mid1=to_mid2) 
              				&& (r1=r2) && not(r1=2) && not(r1=90) 
              				&& not (from_id1=from_id2) 
         				then False (* do { print_string "C6"; False} *) 
				        The above condition covers this , thus redundant *)
            (* Two outgoing arrows with same label *)
         else if (from_id1=from_id2) && (from_mid1=from_mid2) && (r1=r2)
              && ( (r1 < multiple_relations_begin  && not (r1=2))
                  || (r1 > multiple_relations_end && not (r1=90) && not (r1=60) && not (r1=61) && not (r1=62) && not (r1=63))
                  ) (* niwya sambanXaH *)
         then False (* do { print_string "C9"; False}*)
         (*  viXeya viSeRaNam is now not marked wit hthe verb but with the noun
          * else if (from_id1=from_id2) && (from_mid1=from_mid2) && (r1=9 && r2 / 100=44) then False
         else if (from_id1=from_id2) && (from_mid1=from_mid2) && (r2=9 && r1 / 100=44) then False *)
         else if (from_id1=from_id2) && (from_mid1=from_mid2) && ((r1 >= 2000  && r1 < 4000) || (r2 >= 2000 && r2 < 4000)) (* there can not be another outgoing rel with an upapaxa sambanXa*)
         then False  (*do { print_string "C9"; print_int r1; print_int r2;False} *)
         else if  (from_id1=to_id2) && (from_mid1=to_mid2) 
               && r1=82 (*vIpsA*) && (r2=2 || r2=90)
              then False (* do { print_string "C10"; False} *)
       (*  else if  (from_id1=to_id2) && (to_id1=from_id2)
               && (from_mid1=to_mid2) && (to_mid1=from_mid2)
              then False (* do { print_string "C10"; False} *)
              (* no self loop *) 
           covered under no_cycles *)
         else True
      ]
    ]
;

value no_crossing text_type rel m1 m2=match m1 with
    [ Relationc (to_id1,to_mid1,r1,from_id1,from_mid1) -> match m2 with
      [Relationc (to_id2,to_mid2,r2,from_id2,from_mid2) -> 
           (* Crossing edges not allowed except niwya_sambanXaH (=2) and samucciwa (=53) , upamAnaxyowakaH (=80) in some cases*)
           (* Crossing edges allowed even with RaRTI(=35), ViSeRaNa(=32) and aBexaH (=33) *)
         if  (   (    between to_id1 to_id2 from_id2
                   || between from_id1 to_id2 from_id2
                 )
              && (    between to_id2 to_id1 from_id1
                   || between from_id2 to_id1 from_id1
                 )
             )
         (* sup_samucciwaH=61 removed from the following list. It overgenerates.
          * We need at least one example to retain it *)
             && not (r1=2 || r1=90 || r1=22 || r1=47 || r1=29 || r1=30)
             && not (r2=2 || r2=90 || r2=22 || r2=47 || r2=29 || r2=30)
             && (((not ((r1=32) || (r1=33) || (r1=35) || (r1=80) ||
                     (r2=32) || (r2=33) || (r2=35) || (r2=80) ))
                    && text_type="Sloka")
                 || text_type="Prose")
             (* removed RaRTI, viSeRaNa, aBexa, temporarily *)
         then False else True
             (* let length=List.length rel -1 in
              loop False 0 
              where rec loop acc j=
              if j > length then acc else
               match List.nth rel j with
               [ Relationc (id1,mid1,r,id2,mid2)  ->
                  if (r=32) &&
                   ((id1=to_id1 && mid1=to_mid1 && id2=from_id2 && mid2=from_mid2) ||
                   (id1=from_id2 && mid1=from_mid2 && id2=to_id1 && mid2=to_mid1) ||
                   (id1=to_id2 && mid1=to_mid2 && id2=from_id1 && mid2=from_mid1) ||
                   (id1=from_id1 && mid1=from_mid1 && id2=to_id2 && mid2=to_mid2))
                  then loop True (length+1) 
                  else loop False (j+1) 
               | _  ->  True
               ] 
         else True  *)
      ]
    ]
;

(* The following conditions do not take care of the situation where
 there is only one relation with the node being a root node
 *)
value relation_mutual_expectancy text_type m1 m2=match m1 with
    [ Relationc (to_id1,to_mid1,r1,from_id1,from_mid1) -> match m2 with
      [Relationc (to_id2,to_mid2,r2,from_id2,from_mid2) -> 
              (* There can not be both gawi karma and gawi karwA simultaneously *)
         if (from_id1=from_id2) && (from_mid1=from_mid2)
              && ( (r1=200 && r2=201)
                 ||( r2=200 && r1=201))
         then False (* do { print_string "C12"; False} *)
           (* If there is a vAkyakarma, then there can not be a karma  but there can be gONa / muKya karma*)
         else if (from_id1=from_id2) && (from_mid1=from_mid2)
              && ( (r1=13 && (r2=14 || r2=11 || r2=12))
                 ||( r2=13 && (r1=14 || r1=11 || r1=12)))
         then False (* do { print_string "C12"; False} *)
           (* If there is a iRkarma, there can not be karma, gONakarma, muKyakarma *)
         else if (from_id1=from_id2) && (from_mid1=from_mid2)
              && ( (r1=214 && (r2=14 || r2=11 || r2=12))
                 ||( r2=214 && (r1=14 || r1=11 || r1=12)))
         then False (* do { print_string "C12"; False} *)
         (* In the case of brU, occasionally sampraxAna is also allowed.
          * But then there can not be a gONa karma
          * ex: BhG we wAna bravImi BHg 1.7 *)
         else if (from_id1=from_id2) && (from_mid1=from_mid2)
              && ( (r1=19 && r2=12)
                 ||( r2=19 && r1=12))
         then False (* do { print_string "C12"; False} *)
           (* If there is a karma, then there can not be a gONa or muKyakarma *)
           (* If there is a karma, then there can not be a gONa or muKyakarma *)
         else if (from_id1=from_id2) && (from_mid1=from_mid2)
              && (  ((r2=11 || r2=12) && (r1=14))
                 || ((r1=11 || r1=12) && (r2=14)))
         then False (* do { print_string "C13"; False} *)
(* If there is any kAraka relation, or prayojana or hewu, there can not be viSeRaNa, in case of kqxanwas. 
 * --> prayojana/hewu is possible
 * --> rAmaH piwuH AjFayA vExyaH BUwvA sevAm karowi *)
         (* Allow viRayAXikaraNam;
           xAsyoH vacaneRu mahiRyAH nirAwiSayA SraxXA Bavawi *)
(* need example *)
         else if (from_id1=from_id2) && (from_mid1=from_mid2)
              && (  ((r2 > 9 && r2 < 22) && ((r1=32) || (r1=8) || (r1=9)))
                 || ((r1 > 9 && r1 < 22) && ((r2=32) || (r2=8) || (r1=9))))
         then False (* do { print_string "C13"; False} *)
 (* There can not be more than one samucciwa for a verb 
  * Why this condition?
  * We can have a sentence such as
  * wvam pAsi meXasi moxase ca *)
       (*  else if (from_id1=from_id2) && (from_mid1=from_mid2)
              && (  (r2=60 && r1=60)
                 || (r1=60 && r2=60)
                 || (r2=62 && r1=62)
                 || (r1=62 && r2=62)
                 )
         then False  (*do { print_string "C13"; False} *) *)
           (* For every prawiyogi, the other end should be either a sambandha
            or anuyogi  or niwya_sambanXa or niwya_sambanXa1 *)
         else if (from_id1=to_id2) && (from_mid1=to_mid2)
                 &&  (  ((r1=3) && not (r2=44) && not (r2=28) && not(r2=2) && not(r2=90))
                     || ((r2=44) && not (r1=3) && not (r1=28) && not(r1=2) && not(r2=90)))
         then False  (* do { print_string "C14"; False} *)
         else if (from_id2=to_id1) && (from_mid2=to_mid1)
                 && (  ((r2=3) && not (r1=44) && not (r1=28) && not(r1=2) && not(r2=90))
                    || ((r1=44) && not (r2=3) && not (r2=28) && not(r2=2) && not(r2=90)))
         then False (* do { print_string "C15"; False} *)
         (* For every nAma1 -- counterpart of prawiyogi, there should be nAma2  -- counterpart of anuyogi,
          * nAma1=52; nAma2 -- 53*)
         else if (from_id1=to_id2) && (from_mid1=to_mid2)
                 &&  (  ((r1=52) && not (r2=53))
                     || ((r2=53) && not (r1=52)))
         then False  (* do { print_string "C14"; False} *)
         else if (from_id2=to_id1) && (from_mid2=to_mid1)
                 && (  ((r2=52) && not (r1=53))
                    || ((r1=53) && not (r2=52)))
         then False (* do { print_string "C15"; False} *)
         (* sahArWaH, sahArWa_xyowakaH *)
         else if (from_id1=to_id2) && (from_mid1=to_mid2)
                 &&  (  ((r1=76) && not (r2=92))
                     || ((r2=92) && not (r1=76)))
         then False  (* do { print_string "C14"; False} *)
         else if (from_id2=to_id1) && (from_mid2=to_mid1)
                 && (  ((r2=76) && not (r1=92))
                    || ((r1=92) && not (r2=76)))
         then False (* do { print_string "C15"; False} *)
         (* vinArWaH, vinArWa_xyowakaH *)
         else if (from_id1=to_id2) && (from_mid1=to_mid2)
                 &&  (  ((r1=77) && not (r2=93))
                     || ((r2=93) && not (r1=77)))
         then False  (* do { print_string "C14"; False} *)
         else if (from_id2=to_id1) && (from_mid2=to_mid1)
                 && (  ((r2=77) && not (r1=93))
                    || ((r1=93) && not (r2=77)))
         then False (* do { print_string "C15"; False} *)
         (* For every upamAna, there should be upamAna_xyowakaH *)
         else if (from_id1=to_id2) && (from_mid1=to_mid2)
                 && ( ((r2=79) && not (r1=80)) ||
                      ((r1=80) && not (r2=79)))
         then False  (* do { print_string "C14"; False} *)
         else if (from_id2=to_id1) && (from_mid2=to_mid1)
                 &&  (((r1=79) && not (r2=80)) ||
                      ((r2=80) && not (r1=79)))
         then False (* do { print_string "C15"; False} *)
         (* prayojanam_xyowakaH should have prayojanam *)
         else if (from_id1=to_id2) && (from_mid1=to_mid2)
                 &&  ((r1=40) && not (r2=41))
         then False  (* do { print_string "C14"; False} *)
         else if (from_id2=to_id1) && (from_mid2=to_mid1)
                 &&  ((r2=40) && not (r1=41))
         then False (* do { print_string "C15"; False} *)
           (* For every outgoing vAkyakarma, there should be an incoming vAkyakarmaxyowaka and no other relation should pair with either vAkyakarma or vAkyakarmaxyowaka*)
         else if (from_id2=to_id1) && (from_mid2=to_mid1)
                 &&  (r1=13 && not (r2=97))
         then False (* do { print_string "C16"; False} *)
         else if (from_id1=to_id2) && (from_mid1=to_mid2)
                 &&  (r1=97 && not (r2=13))
         then False (* do { print_string "C16"; False} *)
           (* There can not be a samboXya of a verb, which is viSeRaNa/pUrvakAla etc. Only 'iwi' relation with such verbs are allowed. 
              samboXya=47; vAkyakarama=13 ; prawiyogi=3*)
(* need example *)
         else if (from_id2=to_id1) && (from_mid2=to_mid1)
                 &&  (r1=53 && not (r2=52))
         then False (* do { print_string "C16"; False} *)
         else if (from_id1=to_id2) && (from_mid1=to_mid2)
                 &&  (r1=52 && not (r2=53))
         then False (* do { print_string "C16"; False} *)
         else if (from_id2=to_id1) && (from_mid2=to_mid1)
                && (r2=47) && (r1=13) && not(r1=3)
         then False
         else if (from_id1=to_id2) && (from_mid1=to_mid2)
                && (r1=47) && not (r2=13) && not(r2=3)
         then False
         (* viXeya_viSeRaNam should be to the right of karwA *)
         (*else if (from_id2=from_id1) && (from_mid2=from_mid1)
                && (r2=9 && r1=7) && (text_type="Prose") && (to_id2 > to_id1)
         then False
         else if (from_id2=from_id1) && (from_mid2=from_mid1)
                && (r2=7 && r1=9) && (text_type="Prose") && (to_id2 < to_id1)
         then False *)
         (*else if (from_id2=from_id1) && (from_mid2=from_mid1)
                && (r2=9 && r1 >= 4200 && r1 / 100=42) && ((to_id1 - to_id2 > 3) || (to_id1 < to_id2 ))
         then False
         else if (from_id2=from_id1) && (from_mid2=from_mid1)
                && ((r2 / 100=44) && r1=7) && (to_id1 < to_id2)
         then False
         else if (from_id2=from_id1) && (from_mid2=from_mid1)
                && (r2=7 && (r1 / 100=44)) && (to_id2 < to_id1)
         then False
         else if (from_id2=from_id1) && (from_mid2=from_mid1)
                && (r1=9 &&  r2 >= 4200 && r2 / 100=42) && ((to_id2 - to_id1 > 3) || (to_id2 < to_id1 ))
         then False *)
         (* With viXeya_viSeRaNam/samAnAXikaraNa there can not be karma,karaNa,sampraxAna,apAxAna 
          * Now this condition is difficult to implement, since the viXeya viSeRaNam is no longer linked to a verb 
          * 
         else if (from_id2=from_id1) && (from_mid2=from_mid1)
                && ((r2=9 || r2=1009) && (r1=11 || r1=12 || r1=14 || r1=15 || r1=16 || r1=18 || r1=19 || r1=20))
         then False
         else if (from_id2=from_id1) && (from_mid2=from_mid1)
                && ((r1=9 || r1=1009)&& (r2=11 || r2=12 || r2=14 || r2=15 || r2=16|| r2=18||r2=19||r2=20))
         then False
          *)
         (* With karwqrahiwaviXeya_viSeRaNam there can not be karwA *)
         else if (from_id2=from_id1) && (from_mid2=from_mid1)
                && r2=8 && r1=7
         then False
         else if (from_id2=from_id1) && (from_mid2=from_mid1)
                && r1=8 && r2=7
         then False
         (* With karmasamAnAXikaraNa there can not be gONa-karma 
          * brU1 and vax1 dhaatus are xvikarmaka, and if there is karmasamaanaadhikarana relation with them, then gONa karma should be absent *)
         else if (from_id2=from_id1) && (from_mid2=from_mid1)
                && r2=10 && r1 =12 
         then False
         else if (from_id2=from_id1) && (from_mid2=from_mid1)
                && r1=10 && r2 =12 
         then False
         (* karmasamAnAXikaraNa should be to the right of karma 
          * The order info is taken care by build_graph.ml
          * Constraint programme should not look at the order again 
         else if (from_id2=from_id1) && (from_mid2=from_mid1)
                && ((r2=11||r2=12||r2=14) && r1=10) && (to_id1 < to_id2)
         then False
         else if (from_id2=from_id1) && (from_mid2=from_mid1)
                && (r2=10 && (r1=11||r1=12||r1=14)) && (to_id2 < to_id1)
         then False *)
         else True
      ]
    ]
;

value relation_mutual_yogyataa m1 m2=match m1 with
    [ Relationc (to_id1,to_mid1,r1,from_id1,from_mid1) -> match m2 with
      [Relationc (to_id2,to_mid2,r2,from_id2,from_mid2) -> 
         if from_id2=to_id1 && from_mid2=to_mid1
                && (r1=26 || r1=32) && (r2=35 || r2=49) (* a RaRTI/prawiReXaH of a kriyAviSeRaNa or a viSeRaNa is not allowed ; removed aBexa; RaRTI of aBexa is allowed; SriyaH pawiH*)
         then False
         else if from_id1=to_id2 && from_mid1=to_mid2
                && (r2=26 || r2=32) && (r1=35 || r1=49) (* a RaRTI/prawiReXaH of a kriyAviSeRaNa or a viSeRaNa is not allowed ; removed aBexa; RaRTI of aBexa is allowed; SriyaH pawiH*) 
         then False
         else if from_id1=to_id2 && from_mid1=to_mid2
                && (r2=32||r2=9) && (r1=32|| r1=9) (* a viSeRaNa of a viSeRaNa is not allowed *)
         then False
         else if from_id2=to_id1 && from_mid2=to_mid1
                && (r2=32||r2=9) && (r1=32||r1=9) (* a viSeRaNa of a viSeRaNa is not allowed *)
         then False
         else if from_id1=to_id2 && from_mid1=to_mid2
                && r2=33 && r1=33 (* an aBexa of an aBexa is not allowed *)
         then False
         else if from_id2=to_id1 && from_mid2=to_mid1
                && r2=33 && r1=33 (* an aBexa of an aBexa is not allowed *)
         then False
         else if (   from_id1=to_id2 && from_mid1=to_mid2
                  || from_id2=to_id1 && from_mid2=to_mid1 )
              && (r2=r1) 
              && (r2=60|| r2=61||r2=62||r2=63) (* a samucciwa of a samucciwa is not allowed *)
         then False
         (*else if from_id1=to_id2 && from_mid1=to_mid2
                && r2=33 && r1=32 (* an aBexa of a viSeRaNa is not allowed *)
         then False
         else if from_id2=to_id1 && from_mid2=to_mid1
                && r2=32 && r1=33 (* an aBexa of a viSeRaNa is not allowed *)
         then False 
         wava XImawA SiRyeNa xrupaxa-puwreNa; here viSeRaNa of aBexa is allowed*)
         else if from_id1=to_id2 && from_mid1=to_mid2
                && (r2=32||r2=9) && r1=33 (* a viSeRaNa of an aBexa is not allowed *)
         then False
         else if from_id2=to_id1 && from_mid2=to_mid1
                && r2=33 && (r1=32||r2=9) (* a viSeRaNa of an aBexa is not allowed *)
         then False
         else if from_id2=to_id1 && from_mid2=to_mid1
                && r2=47  && not (r1=13) (* a samboXyaH can be only of the root verb  or an embeded verb in iwi clause *)
         then False
         else if from_id1=to_id2 && from_mid1=to_mid2
                && r1=47 && not (r2=13) (* a samboXyaH can be only of the root verb  or an embeded verb in iwi clause *)
         then False
         else if from_id2=to_id1 && from_mid2=to_mid1
                && r1=10 && (r2=7||r2=11||r2=12||r2=14) (* karwA / karma of a karmasamAnAXikaraNam not allowed *)
         then False
         else if from_id1=to_id2 && from_mid1=to_mid2
                && r2=10 && (r1=7 || r1=11||r1=12||r1=14) (* karwA / karma of a karmasamAnAXikaraNam not allowed *)
         then False
         else if from_id2=to_id1 && from_mid2=to_mid1
                && (r1=1009) && (r2=7||r2=11||r2=12||r2=14) (* karwA / karma of a samAnAXikaraNam not allowed *)
         then False
         else if from_id1=to_id2 && from_mid1=to_mid2
                && (r2=9 || r2=1009) && (r1=7 || r1=11||r1=12||r1=14) (* karwA / karma of a viXeya_viSeRaNam or samAnAXikaraNam not allowed *)
         then False
         else if from_id2=to_id1 && from_mid2=to_mid1
                && (r2=1009) && (r1=7||r1=11||r1=12||r1=14) (* samAnAXikaraNam of karwA / karma not allowed *)
         then False
         else if from_id1=to_id2 && from_mid1=to_mid2
                && (r1=1009) && (r2=7 || r1=11||r1=12||r1=14) (* samAnAXikaraNam of a karwA/karma not allowed *)
         then False
         else if from_id2=to_id1 && from_mid2=to_mid1
                && (r1=9 || r1=1009) && (r2=9 || r2=1009) (* viXeya_viSeRaNam/samAnAXikaraNam of a viXeya_viSeRaNam/samAnAXikaraNam not allowed *)
         then False
         (*else if from_id1=to_id2 && from_mid1=to_mid2
                && r2=60 && r1=9 (* samucciwa of viXeya_viSeRaNam is not allowed 
                Counter example: BavanwaH jAnanwi yaw mama puwrAH SAswra-vimuKAH avivekinaH ca sanwi  *)
         then False 
         else if from_id2=to_id1 && from_mid2=to_mid1
                && (r2=9 || r2=1009) && r1=60 (* samucciwa of viXeya_viSeRaNam/samAnAXikaraNam is not allowed *)
         then False *)
        (* else if from_id2=to_id1 && from_mid2=to_mid1
                && (r2 < 53) && r1=53 && abs (from_id1 - to_id2) < abs (from_id2 -to_id2) (* In case of samucciwa verbs, the kaaraka should be of the closest verb *)
         then False
         else if from_id1=to_id2 && from_mid1=to_mid2
                && (r1 < 53) && r2=53 && abs (from_id2-to_id1) < abs (from_id1-to_id1)(* In case of samucciwa verbs, the kaaraka should be of the closest verb *)
         then False *)
      (*   else if from_id2=to_id1 && from_mid2=to_mid1
                && r2=43 && not (r1=20) (* aBexa with only karwA is allowed *)
         then False
         else if from_id1=to_id2 && from_mid1=to_mid2
                && r1=43 && not (r2=20) (* aBexa with only karwA is allowed *)
         then False 
        aBexa of other relations also exist. E.g. aham rAjAnam xaSaraWam paSyAmi *)
         else if from_id1=to_id2 && from_mid1=to_mid2
                && r1=24 && not (r2=3) && not (r2=44) (* pUrvakAla is allowed only if either it is directly connected to the main verb, in case there exists another relation then the other relation is either a pratoyogi / anuyogi *)
         then False
         else True
      ]
    ]
;

value chk_compatible text_type rel m1 m2=
         single_morph_per_word m1 m2
      && single_relation_label m1 m2
      && no_crossing text_type rel m1 m2 
      && relation_mutual_expectancy text_type m1 m2 
      && relation_mutual_yogyataa m1 m2 
;

value rec add_cost text_type acc rels=fun
  [ [] -> acc
  |  [i :: r] ->  match List.nth rels (i-1) with
       [ Relationc (a1,b1,rel,a2,b2) -> let res=
            if rel=2 then 0
            else if rel=8 then 9 (* viXeya_viSeRaNam *)
            else if rel=51 then 0 (* wIvrawAxarSI *)
            else if rel=1079 then 79 (* upamAna *)
            else if rel=64 then 0 (* samuccaya_xyowakaH *)
            else if rel=65 then 0 (* sup_samuccaya_xyowakaH *)
            else if rel=66 then 0 (* anyawara_xyowakaH *)
            else if rel=67 then 0 (* sup_anyawara_xyowakaH *)
            else if rel=55 then 0 (* Gataka_xyowakaH *)
            else if rel=91 then 0 (*  avaXiH *)
             (*else if  rel=35 then 35*) (* RaRTI *)
         (*   else if  rel=42 then 42 (* viSeRaNam *) *)
            (*else if  rel=33 then 0 *) (* aBexa *)
            else if  rel> 80 && rel < 90 then 0 (* upapada-LWG relations *)
            else if  rel= 78 then 100 (* lyapkarmAXikaraNam ; select this only if there is no other analysis possible *)
          (*  else if rel=53 then 2 * (a2-a1) (*niwya_sambanXaH *)
            else if rel=52 then 3 * (a2-a1) (*prawiyogI *) *)
            else if rel=1009 then 9 * (a2-a1) (* viXeya_viSeRaNam *)
            else if rel=79 then 1 * (a2-a1) (*upamAna *)
            else if rel=80 then 1 * (a2-a1) (* upamAnaxyowakaH *)
            else if rel=76 then 1 * (a2-a1) (* sahArWa_xyowakaH *)
            else if rel=92 then 1 * (a2-a1) (* sahArWaH *)
            else if rel=77 then 1 * (a2-a1) (* vinArWa_xyowakaH *)
            else if rel=93 then 1 * (a2-a1) (* vinArWaH *)
            else if rel >= 2000 && rel < 2100 then 42 * (a2-a1) (*sanxarBa_binxuH *)
            else if rel >= 2200 && rel < 2300 then 14 * (a2-a1) (* karma *)
            else if rel >= 2400 && rel < 2500 then 95 * (a2-a1)  (*ABimuKyam *)
            else if rel >= 2600 && rel < 2700 then 49 * (a2-a1) (* prawiReXaH *)
            else if rel >= 3200 && rel < 3300 then 93 * (a2-a1) (*vinArWaH *)
            (*else if rel >= 3100 && rel < 3200 then 92 * (a2-a1) (*sahArWaH *)*)
            else if rel >= 4000 && rel < 4100 then 20 * (a2-a1) (* apAxAnam *)
            else if rel >= 4100 && rel < 4200 then 21 * (a2-a1) (* xeSAXi *)
            else if rel >= 4200 && rel < 4300 then 9 * (a2-a1) (* viXeya_viSeRaNam *)
            else if rel >= 4300 && rel < 4400 then 28 * (a2-a1) (* sambanXaH *)
            else if rel >= 4400 && rel < 4500 then 7 * (a2-a1) (* karwA *)
            else if rel >= 4500 && rel < 4600 then 25 * (a2-a1) (* aXikaraNa *)
            (*else if  rel=64 ||rel=65 || rel=91
                 ||  rel=66 ||rel=67 
                 (* special case of LWG ;
                  * Do not group them together, but treat the cost as 0;
                  * cost is treated as zero in add_cost function *)
            then 0 *)
            (* else rel * (a2-a1) *)
            else if a1 > a2 
                 then if rel=60 then 0
                      else if text_type="Prose" && rel=35
                      then rel * (a1-a2) * 10 (* if the kaarakas or RaRTI are to the right, give penalty *)
                      else rel * (a1-a2) (* no penalty in case of Sloka *)
                 else rel * (a2-a1)
        in add_cost text_type (acc+res) rels r
       ]
  ]
;

value lwg_and_collapse_all_solns text_type rel solns =
        loop [] rel solns
        where rec loop acc rel=fun
        [ [] -> acc
        | [ (len,cost,l)  :: r ] -> let l1=lwg_and_collapse rel l in
                         let len1 =List.length l1 in
                         let triplet=(len1, cost, l1) in
                         let new_acc=List.append [triplet] acc in
                         loop new_acc rel r
        ]
;


(* Min cost, and largest length *)
value comparecostlength (l1,c1,_) (l2,c2,_) =
    if l1=l2 then compare c1 c2 else compare l2 l1
;

value print_sint i=do
 { print_int i
 ; print_string ";"
 }
;

value get_wrd_ids rel=match rel with
 [ Relationc (id1,id2,id3,id4,id5) -> [id1;id4]
 ]
;

(* for every relation, prepare a list of compatible and non-compatible relations among the relations seen so far *)
(* populate_compatible_lists: Relationc list -> unit *)

(* algo:
   for each relation R between a and b,
    -- mark a,b as a set of compatible words corresponding to relation R
    -- if R compatible with some other relation S between c and d,
    -- then mark c,d as compatible words corresponding to relation R
    -- if R is compatible with S, then add S in the list of compatible relations for R
*)
value populate_compatible_lists text_type rel total_wrds=
  let length=List.length rel -1 in do 
   { for i=0 to length do
     { let reli=List.nth rel i in  do
         { (* print_int i
           ;print_string "=>"
           ;print_relation reli 
          ;*) let l=get_wrd_ids reli in
           compatible_words.(i+1) := List.append l compatible_words.(i+1)
          (* a word is compatible with self *)
         ;for j=i+1 to length do
        { let relj=List.nth rel j in
          do {
           let l=get_wrd_ids relj in
           compatible_words.(j+1) := List.append l compatible_words.(j+1)
          (* a word is compatible with self *)
          ;if (chk_compatible text_type rel reli relj)
          then do {
           (* print_int j
           ;print_string " "
           ;print_relation relj 
           ; *) compatible_relations.(i+1) := List.append [j+1] compatible_relations.(i+1)
             ;let l=get_wrd_ids relj in
             compatible_words.(i+1) := List.append l compatible_words.(i+1)
             ;let l=get_wrd_ids reli in
             compatible_words.(j+1) := List.append l compatible_words.(j+1)
          }
          else ()
          } 
        }
     }
     }
    
   ; for i=0 to length do {
      compatible_relations.(i+1) := List.sort_uniq compare compatible_relations.(i+1)
      ;compatible_all_words.(i+1) := List.length (List.sort_uniq compare compatible_words.(i+1))=total_wrds

 (* compatible_all_words.(i+1) is a boolean, it is true if the i+1th word is potentially related to all other words in the sentence.
This condition is added to ensure that the necessary condition that all the words are related is satisfied.
Thus, for ungrammatical sentences such as rAmaH granWam svapiwi, the parser halts here. However, for sentences such as rAmaH annam svapiwi, since potentially annam being in neuter gender can be a kartA for svapiwi, the programme continues. *)
 
    (* ; print_string "compatible words for "
     ; print_int (i+1)
     ; print_string "="
     ; List.iter print_sint (List.sort_uniq compare compatible_words.(i+1))
     ; print_newline() 
     ; print_int (List.length (List.sort_uniq compare compatible_words.(i+1)))
     ; print_newline() 
     ; print_int total_wrds
     ; print_newline() 
    ; print_string "compatible relations for "
     ; print_int (i+1)
     ; print_string "="
     ; List.iter print_sint compatible_relations.(i+1)
     ; print_newline() 
    *)
   }
  }
;

(* Needed only for debugging
*)
value rec print_acc=fun
[[] -> ()
|[(a,b)::xs] -> do { List.iter print_sint a; print_string " => "
                   ; List.iter print_sint b; print_string "\n"
                   ; print_acc xs
                   }
                   
]
;

(* value rec delete_small size acc=fun
[[] -> acc
|[(a,b)::xs] -> if (List.length a >= size)
                then delete_small size (List.append acc [(a,b)]) xs
                else delete_small size acc xs
]
; *)

value rec delete_small size acc=List.filter (fun (a,b) -> (List.length a >= size)) acc
;

(* Compatible_relations.(i) is empty if none of the following relations are incompatible with i, or i is the last relation, making the 'empty' ambiguous.
Instead of empty list, we produce the same relation *)

(* True if a is subset of b else False*)
value subset a b=List.for_all (fun i -> List.mem i b) a
;

value join_dags dag1 dag2 init final=
(*if dag1=[] then dag2 else 
   if dag2=[] then dag1
   else *)  List.rev ( List.fold_left
      (fun x (a,b) ->
          List.fold_left
          ( fun y (c,d) ->  if subset c b then 
                              if not (a=c) then
                                let l1=List.append a c 
                                and l2=if b=[] then d
                                        else if d=[] then b
                                        else intersection b d 
                                in if ((List.length l1) > (final-init-2))
                                   then List.append [(l1,l2)] y else y
                              else y
                           else y
         ) x dag2
   ) [] dag1
 )
;

value rec get_initial_dag acc start n=
   if n=start then do {
                     (* print_string "n ="
                     ; print_int n
                     ; print_newline()
                     ; print_string "start ="
                     ; print_int start
                     ; print_string "acc="
                     ; print_acc acc
                     ; print_newline()
                     ;*) let dag=List.rev acc in
                     let dag1=join_dags dag dag 0 0 in
                      if dag1=[] then dag else List.append dag dag1
                 } 
                (* else do { print_int n
                 ; if n=0 || compatible_all_words.(n) then print_string "True" else print_string "False"
                ;[]
                } *)
   else  do { (* print_int n
           ; print_newline()
           ; print_string "start="
           ; print_int start
           ; print_newline()
           ; if n=0 || compatible_all_words.(n) then print_string "True" else print_string "False"
           ; print_newline()
         ; *)  if compatible_all_words.(n)
            then let t=compatible_relations.(n) in
                 let p=if t=[] then [n] else t in
                 let l=List.append acc [([n],p)] in
                   get_initial_dag l start (n-1)
            else get_initial_dag acc start (n-1)
         } 
            
;

(* we mark the nodes as root node (2) , leaf node(1) and intermediate node(3) *)
value rec populate_inout_rels length rel =match rel with
    [ [] -> ()
    | [Relationc(a,b,c,d,e)::xs] ->  do {
          (*print_string "inout_rels ="
          ; print_int a
          ; print_string "="
          ; print_int inout_rels.(a)
          ; print_string " "
          ; print_int d
          ; print_string "="
          ; print_int inout_rels.(d)
          ; print_newline()
          ;*)
          if (inout_rels.(a)=0) then inout_rels.(a) := 1
          else if (inout_rels.(a)=2) then inout_rels.(a) := 3
          else ()
          ;if (inout_rels.(d)=0) then inout_rels.(d) := 2
          else if (inout_rels.(d)=1) then inout_rels.(d) := 3
          else ()
          ; populate_inout_rels length xs
          }
    ]
;

value rec construct_dags init final wrdb dags= 
   if ( final - init > 0 ) 
   then 
        let mid=(init + final) /2 in
        let dag1=construct_dags init mid wrdb dags in
        let dag2=construct_dags (mid+1) final wrdb dags in  do {
            (* print_int init; print_string " "
            ;print_int mid; print_string " "
            ;print_int final; print_newline()
            ;print_string "dag1= "
            ;print_acc dag1
            ;print_string "dag2= "
            ;print_acc dag2
            ; print_newline()
            ; print_string "init mid final="
            ; print_int init
            ; print_string " "
            ; print_int mid
            ; print_string " "
            ; print_int final
            ; print_newline()
            ; print_string "inout_rels"
            ; print_int inout_rels.(init+1)
            ; print_string " "
            ; print_int inout_rels.(mid+1)
            ; print_newline() 
            ; *) let dag3=join_dags dag1 dag2 init final in
             (* do { print_string "dag3= "
             ;print_acc dag3 
            ; *) let dag4=if (inout_rels.(init+1)=3 || init=mid || dag1=[])
             then List.append dag2 dag3 else dag3 in
             let dag5=if (inout_rels.(final+1)=3 || final=mid+1 || dag2=[])
             then List.append dag1 dag4 else dag4 in
             let dag7=if ((inout_rels.(mid+1)=3) && not (dag1=[]) && not (dag2=[])&& not(init=mid) && not (final=mid+1))
             then let dag6=List.append dag1 dag5 in 
                       List.append dag2 dag6 else dag5 in do {
            
             (* print_string "dag5= "
            ; print_acc dag5
            ;print_newline()
            ;print_string "dag7= "
            ; print_acc dag7
            ;print_newline()
            ; *) let dag8=if dag7=[] then List.append dag1 dag2 else dag7 in do {
            (* print_string "dag8= "
            ; print_acc dag8
            ;print_newline()
            ; print_string "init mid final="
            ; print_int init
            ; print_string " "
            ; print_int mid
            ; print_string " "
            ; print_int final
            ; print_newline()
            ; print_string "size of dag8="
            ; print_int (List.length dag8)
            ; print_newline()
            ; print_acc dag8
            ; print_newline()
            ;*) let dag9=delete_small (final-init-1) dag8 in (*do {
             print_string "dag9= "
            ; print_string "size of dag9="
            ; print_int (List.length dag9)
            ; print_newline()
            ; print_acc dag9
            ; print_newline() 
            ;*) dag9 
             (*} *)
            }
            }
            }
   else 
        if init=0 
        then do {
        (* print_string "calling get_initial"
         ; print_newline()
         ;print_int (List.nth wrdb init)
         ; print_newline()
         ;print_int (List.nth wrdb (init+1))
         ; print_newline()
         ; *) get_initial_dag [] 0 (List.nth wrdb 1)
        }
        (*else if init =1
        then get_initial_dag [] (List.nth wrdb (init-1)) (List.nth wrdb init) *)
        else if init < List.length wrdb && not (init=1)
        then do {
       (* print_int init
       ; print_newline()
       ; *) get_initial_dag [] (List.nth wrdb (init-1)) (List.nth wrdb init)
       }
        else []
;

(*relsindag is a list of relation numbers in a given dag. 
the mapping function below returns the 5-tuple relation for each rel number in a dag.
So maprel contains the list of 5 tuples in a dag *)

value mycount relid maprel=
    loop 0 maprel
    where rec loop acc=fun
    [ [] ->  acc
    | [Relationc (a,b,c,d,e) :: r]  -> if c=relid
                                       then loop (acc+1) r
                                       else loop acc r
    ]
;

(* The number of ca/vA is one less than the number of sups or wifs
 * or =1 *)
(* value ca_vA_compatibility group_count marker_count =
     if (group_count=0 && marker_count=0)
     || (group_count=1 && (group_count=marker_count))
     || (group_count > 1 && (   (group_count=marker_count -1)
                             || (marker_count=1)))
     then True else False
; *)

value ca_vA_compatibility group_count marker_count =

    group_count=0 || group_count=marker_count-1 || marker_count=1 
; 

value samucciwa_anyawara_constraint relations relsindag =
  let maprel=List.map (fun y -> List.nth relations (y-1) ) relsindag in
      let samu_c=mycount 60 maprel
      and sup_samu_c=mycount 61 maprel
      and samu_xyowaka_c=mycount 64 maprel
      and sup_samu_xyowaka_c=mycount 65 maprel
      and anya_c=mycount 62 maprel
      and sup_anya_c=mycount 63 maprel
      and anya_xyowaka_c=mycount 66 maprel
      and sup_anya_xyowaka_c=mycount 67 maprel in
          ca_vA_compatibility sup_samu_c sup_samu_xyowaka_c
       && ca_vA_compatibility samu_c samu_xyowaka_c
       && ca_vA_compatibility sup_anya_c sup_anya_xyowaka_c
       && ca_vA_compatibility anya_c anya_xyowaka_c
   (* if ca_vA_compatibility sup_samu_c sup_samu_xyowaka_c
      && ca_vA_compatibility samu_c samu_xyowaka_c
      && ca_vA_compatibility sup_anya_c sup_anya_xyowaka_c
      && ca_vA_compatibility anya_c anya_xyowaka_c
      then True  else False *)
;

value global_compatible text_type relations relsindag=
let maprel=List.map (fun y -> List.nth relations (y-1) ) relsindag in
    loop maprel
    where rec loop=fun
            [ [] -> True
     (* prawiyogI, anuyogI/sambanXa 
        There are two cases: 
          Either only prawiyogI, anuyogI as in the case of yaw, kinwu, paranwu, aWa, etc.
             A <-3-- B <-44-- C 
          Or there are prawiyogI, sambanXaH/niwya sambanXaH and anuyogI as in the case of yaxi/warhi etc.
          A <-3-- B <-2/28-- C <-44-- D 
         For every PrawiyogI, chk there is optionally a (niwya)sambanXa followed by an anuyogI
         For every anuyogI, chk there is optionally a (niwya)sambanXa and a prawiyogI
         *)
    | [ Relationc (a,b,3,c,d) :: rest] ->  (* prawiyogI*)
         loop1 maprel 
         where rec loop1=fun
         [ [] -> False (* do {print_string "failed case 1"; False}*) (* if there is no sambanXa / anuyogI from the head *)
         | [Relationc (x,y,28,z,t)::rest1]  (* sambanXaH *)
         | [Relationc (x,y,90,z,t)::rest1]  (* niwya_sambanXaH1 *)
         | [Relationc (x,y,2,z,t)::rest1] -> (* niwya_sambanXaH *)
                  if    (*(z=a && t=b) || *)
                        (x=c && y=d) 
                  then loop2 maprel 
                       where rec loop2=fun
                  [ [] -> False (* do { print_string "failed case 2"; False}*) (* If no anuyogI from the head *)
                  | [Relationc (m,n,44,o,p)::rest2] ->  (* anuyogI *)
                        if    (z=m && t=n)
                              (* || (x=o && y=p)*)
                        then loop rest  (* prawiyogi,sambanXa,anuyogi sequence found *)
                        else loop2 rest2
                  | [Relationc (m,n,r,o,p)::rest2] -> 
                         loop2 rest2
                  ]
                  else loop1 rest1
         | [Relationc (x,y,44,z,t)::rest1] ->  (* anuyogI *)
                  if    (* (z=a && t=b) || *)
                        (x=c && y=d)
                  then loop rest  (* anuyogI-prawiyogI seq found *)
                  else loop1 rest1
         | [Relationc (x,y,r,z,t)::rest1] ->
                  loop1 rest1
         ]
     (* anuyogI, prawiyogI/sambanXa *)
   | [ Relationc (a,b,44,c,d) :: rest] ->  (* anuyogI *)
         loop1 maprel 
         where rec loop1=fun
                          [ [] -> False (* do { print_string "failed case 3"; False}*) (* sambanXa/anuyogi not found *)
                          | [Relationc (x,y,28,z,t)::rest1]  (* sambanXaH *)
                          | [Relationc (x,y,90,z,t)::rest1]  (* niwya sambanXaH1 *)
                          | [Relationc (x,y,2,z,t)::rest1] -> (* niwya sambanXaH *)
                                   if  (z=a && t=b) 
                                      (* || (x=c && y=d) *)
                                   then loop2 maprel 
                                        where rec loop2=fun
                                   [ [] -> False (* do { print_string "failed case 4"; False}*) (* prawiyoggi-sambanXa-anuyogi seq not found *)
                                   | [Relationc (m,n,3,o,p)::rest2] ->  (* anuyogI *)
                                         if  (*(z=m && t=n) || *)
                                             (x=o && y=p) 
                                         then loop rest 
                                         else loop2 rest2
                                   | [Relationc (m,n,r,o,p)::rest2] -> 
                                         loop2 rest2
                                   ]
                                   else loop1 rest1
                          | [Relationc (x,y,3,z,t)::rest1] ->  (* anuyogI *)
                                   if    (z=a && t=b) 
                                     (* || (x=c && y=d)) *)
                                   then loop rest 
                                   else loop1 rest1
                          | [Relationc (x,y,r,z,t)::rest1] ->
                                   loop1 rest1
                          ]
   | [ Relationc (a,b,53,c,d) :: rest] ->  (* nAma2 -- anuyogI *)
         loop1 maprel 
         where rec loop1=fun
                          [ [] -> False (* do { print_string "failed case 3"; False}*) (* sambanXa/anuyogi not found *)
                          | [Relationc (x,y,52,z,t)::rest1] ->  (* anuyogI *)
                                   if  (z=a && t=b)
                                   then loop rest 
                                   else loop1 rest1
                          | [Relationc (x,y,r,z,t)::rest1] ->
                                   loop1 rest1
                          ]
    | [ Relationc (a,b,52,c,d) :: rest] ->  (* nAma1 -- prawiyogI*)
         loop1 maprel 
         where rec loop1=fun
         [ [] -> False (* do {print_string "failed case 1"; False}*) (* if there is no sambanXa / anuyogI from the head *)
         | [Relationc (x,y,53,z,t)::rest1] ->  (* nAma2 -- anuyogI *)
                  if    (x=c && y=d)
                  then loop rest  (* anuyogI-prawiyogI seq found *)
                  else loop1 rest1
         | [Relationc (x,y,r,z,t)::rest1] ->
                  loop1 rest1
         ]
   | [ Relationc (a,b,90,c,d) :: rest]     (* niwya_sambanXaH1 *)
   | [ Relationc (a,b,2,c,d) :: rest] ->   (* niwya_sambanXaH *)
                  loop1 maprel 
                  where rec loop1=fun
                     [ [] -> loop2 maprel 
                             where rec loop2=fun
                             [ [] -> False (* do { print_string "failed case 13"; False} *)
                             | [Relationc (x,y,r1,z,t)::rest2] -> 
                                (* yaw case  2 incoming arrows *)
                               if    x=a && y=b && not (r1=2) && not (r1=90)
                               then loop rest
                               else loop2 rest2
                             ]
     (* With every niwya sambanXa there are two possibilities:
        i) niwya sambanXa is part of prawiyogi-niwya-sambanxa-anuyogi, in which case there can not be an incoming arrow into yaw 
       ii) niwya sambanXa is associated with yaw-waw, in which case there can not be anuyogI,prawiyogI but there is an incoming arrow into yaw , other than vIpsA *)
                     | [Relationc (x,y,r1,z,t)::rest1] -> 
                         if  (x=a && y=b && not(r1=2) && not(r1=90)) then  (* case of yaw-waw *)
                                   (* ensure there are no anuyogi/prawiyogis *)
                                   loop2 maprel
                                   where rec loop2=fun
                                   [ [] ->  loop1 rest1
                                   | [Relationc (m,n,r,o,p)::rest2] -> 
                                         if    m=c && n=d && r=44 (* anuyogI *)
                                         then False (* do { print_string "failed case 14";False}*)
                                         else if  m=a && n=b && r=3 (* prawiyogI *)
                                         then False (* do { print_string "failed case 15";False}*)
                                         else if z=o && t=p && m=c && d=n (* && not (r=2) && not(r=90) && not (r=32) && not (r=35) *)
                                         (* if there is a niwya sambanXa a,b,R,c,d, then (a,b) and (c,d) should not be related to the same head *)
                                         then False 
                                         else if m=c && d=n && (r=32 || r=35 || r=9) then
                                   		loop3 maprel
                               		        where rec loop3=fun
                                                [ [] ->  loop2 rest2
                                                | [Relationc (h,i,r3,j,k)::rest3] -> 
                                                     if h=o && i=p && z=j && k=t then False
                                                     else loop3 rest3
                                                ]
                                         else loop2 rest2
                                   ]
                         else if  z=a && t=b && r1=3 then (* prawiyogI *)
                                   loop2 maprel
                                   where rec loop2=fun
                                   [ [] ->  False (* do { print_string "failed case 16"; False}*)
                                   | [Relationc (m,n,44,o,p)::rest2] ->  (* anuyogI *)
                                         if   (m=c && n=d)
                                         then loop3 maprel
                                              where rec loop3=fun
                                              [ [] -> loop rest
                                              | [Relationc (i,j,r3,k,l)::rest3] ->  (* anuyogI *)
                                                    if  a=i && b=j && not(r3=3 || r3=2 || r3=90) then False (* do { print_string "failed case 17";  print_int i; print_int j; print_int r3; print_int k; print_int l;False} *)
                                                       (* there can not be an incoming arrow into yaw *)
                                                    else loop3 rest3
                                              ]
                                         else loop2 rest2
                                   | [Relationc (m,n,r,o,p)::rest2] ->
                                         if m=c && n=d then False (* do { print_string "failed_case 18"; False}*)  (* No incoming arrow into yaw *)
                                         else loop2 rest2
                                   ]
                         else loop1 rest1
                     ]
   | [ Relationc (a,b,r1,c,d) :: rest] ->
         if r1=97 || r1=13  then
                               (* vAkyakarmaxyowaka, vAkyakarma *)
         loop1 maprel 
         where rec loop1=fun
                          [ [] -> False (* do { print_string "failed case 5\n"; False} *)
                          | [Relationc (x,y,r,z,t)::rest1] -> 
                                if   (z=a && t=b && r1=13 && r=97)
				  || (x=c && y=d && r1=97 && r=13)
                                then  loop rest
                                else if ( z=c && t=d && r1=13
                                      && (r=11 || r=12 || r=14)) (* karma *)
                                 (* vAkyakarmaxyowaka & karma both can not be present simultaneously *)
                                then False
                                else  loop1 rest1
                          ]
         else if r1=9 || (r1 >= 4400 && r1 < 4500) || r1=6  then
                               (* viXeya_viSeRaNam, karwA *)
                               (* karwA, karwA_upa *)
         loop1 maprel 
         where rec loop1=fun
                          [ [] -> False   (*do { print_string "failed case 5\n"; False}*)
                          | [Relationc (x,y,r,z,t)::rest1] -> 
                                                  (*do {
                                                  print_int r; print_string "\n";
                                                  print_int r1; print_string "\n";*)
                                          if not ((r=r1) && (x=a) && (y=b) && (z=c) && (t=d)) then 
                                (*if (z=c && t=d && (r / 100=44 && r1=9))
                                then False
                                else if (x=c && y=d && (r1 / 100=44 && r=9))
                                then False 
                                else *)if (z=a && t=b && (r / 100=44 && r1=6))
                                 || (x=c && y=d && (r1 / 100=44 && r=6))
                                 || (x=c && y=d && r=6 && r1=9) (* && (a-x) > 0   removed, since viXeya_viSeRaNam can be to the left. For example samraWaH aswi janaH *)
                                 || (z=a && t=b && r1=6 && r=9) (* && (a-x) > 0   removed, since viXeya_viSeRaNam can be to the left. For example samraWaH aswi janaH *)

(*  Why should there be distinction between Prose and Sloka with regards to viXeya_viSeRaNam?
 *     After all this is related to uxxeSya and viXeya, typically uxxeSya comes before viXeya.
 ---> Because of constructions such as 'aprayAwam balam waw BIRma-aBirakRiwam'
 We need to think over such constructions. So still the following is commented 

                           *     || (z=c && t=d && r=7 && r1=9 && text_type="Prose" && (a-x) > 0) 
                                 || (z=c && t=d && r=7 && r1=9 && text_type="Sloka")  *)
                                 || (x=c && y=d && r=24 && r1=9)  (* viXeya_viSeRaNam and pUrvakAlaH *)
                               then  loop rest
                               else  loop1 rest1
                               else  loop1 rest1
                               (*}*)
                          ]
         else if r1=10 then
                               (* karmasamAnAXikaraNam, karma *)
         loop1 maprel 
         where rec loop1=fun
                          [ [] -> False (* do { print_string "failed case 5\n"; False} *)
                          | [Relationc (x,y,r,z,t)::rest1] -> 
                                if (z=c && t=d && (r=14 || r=11 || r=12))
                               then  loop rest
                               else  loop1 rest1
                          ]
         else if r1=76 then
                               (* sahArWaH -92 & sahArWa_xyowaka -76 *)
         loop1 maprel 
         where rec loop1=fun
                          [ [] -> False (* do { print_string "failed case 5\n"; False} *)
                          | [Relationc (x,y,r,z,t)::rest1] -> 
                                if (x=c && y=d && r=92)
                               then  loop rest
                               else  loop1 rest1
                          ]
         else if r1=92 then
                               (* sahArWaH -92 & sahArWa_xyowaka -76 *)
         loop1 maprel 
         where rec loop1=fun
                          [ [] -> False (* do { print_string "failed case 5\n"; False} *)
                          | [Relationc (x,y,r,z,t)::rest1] -> 
                                if (z=a && t=b && r=76)
                               then  loop rest
                               else  loop1 rest1
                          ]
         else if r1=3 || r1=4 || r1=5 then (* BAvalakRaNasapwamI / karwA or karma *)
         loop1 maprel 
         where rec loop1=fun
                  [ [] -> False (* do { print_string "failed case 5\n"; False} *)
                  | [Relationc (x,y,r,z,t)::rest1] -> 
                          if z=a && t=b && (r=14 || r=7)  (* karwq or karma and BAvalakRaNasapwamI *)
                          then  loop rest
                          else  loop1 rest1
                  ]


                  (* We can have 60 without 64, since more samuccayas are allowed with only one samuccayaxyowaka. But if there is 64, then 60 is necessary *)
         else if r1=64 || r1=65 || r1=66 || r1=67 || r1=55 then
         loop1 maprel 
         where rec loop1=fun
                 [ [] -> False (*do { print_string "failed case 5a\n"; False}*)
                  | [Relationc (x,y,r,z,t)::rest1] ->  
                          if    ((x=c && y=d) || (z=c && t=d))
                             && (( r=60 && r1=64 )  (* samucciwa *)
                               ||  ( r=62 && r1=66 )  (* samucciwa *)
                               ||  ( r=63 && r1=67 ) (* samucciwa *)
                               ||  ( r=61 && r1=65 ) (* checked with mAlA sIwA ca vanam gacCawi *)
                               ||  ( r=39 && r1=55 )) (* Gataka Gataka_xyowakaH *)
                               (* samucciwa *)
                          then 
                                  (*print_int r1; print_int c; print_int r; print_int z; print_string "\n";*)
                                  loop rest
                          else loop1 rest1
                  ]
         (* else if r1=60 || r1=61 || r1=62 || r1=63 then
         loop1 maprel 
         where rec loop1=fun
                  [ [] -> False  (*do { print_string "failed case 5\n"; False} *)
                  | [Relationc (x,y,r,z,t)::rest1] ->
                          if    (z=a && t=b) || (z=c && t=d)
                             && (( r1=60 && r=64 )  (* samucciwa *)
                               ||  ( r1=61 && r=65 )  (* samucciwa *)
                               ||  ( r1=62 && r=66 )  (* samucciwa *)
                               ||  ( r1=63 && r=67 ))  (* samucciwa *)
                          then  loop rest
                          else  loop1 rest1
                  ] *)
         (* else if r1=60 || r1=62 (* This needs to be understood; the subroutine is not at all clear *)
              then loop2 maprel 
                    where rec loop2=fun
                          [ [] -> False  (* do { print_string "failed case 5a\n"; False} *)
                          | [Relationc (x,y,r,z,t)::rest2] -> 
			    if (z=c) && (t=d) && (r < 50)
                            then loop3 maprel
                                 where rec loop3=fun
                                      [ [] ->  False (* do { print_string "failed case 5b\n"; False} *)
                                      | [Relationc (x,y,r,z,t)::rest3] -> 
                                            if (z=a && t=b) && 
                                               (   (r=64 && r1=60)
                                                || (r=66 && r1=62))
                                            then loop rest
                                            else loop3 rest3
                                      ]
		            else if (z=a) && (t=b) && (r < 46) && (x < c)  then False
                            else loop2 rest2
                         ] *)
        else if r1=15 || r1=7 || r1=16  then
    (* prayojakakarwA & karwA both can not be present simultaneously *)
         loop1 maprel 
         where rec loop1=fun
                          [ [] -> loop rest
                          | [Relationc (x,y,r,z,t)::rest1] -> 
                            if   (z=c && t=d && r1=15 && r=7) (* karwA  & prayojakakarwA*)
                              || (z=c && t=d && r1=16 && r=7) (* karwA  & prayojyakarwA*)
                              || (z=c && t=d && r=16 && r1=7) (* karwA  & prayojyakarwA*)
                              || (z=c && t=d && r=15 && r1=7) (* karwA  & prayojakakarwA*)
    (* karwA_upa & karwA both can not be present simultaneously *)
                            then False  (* do { print_string "failed case 9"; False} *)
                            else loop1 rest1
                          ]
(* For every upapaxa relation there should be another non-upapaxa relation *)
          (* else if r1 >= 2000 then
          loop1 maprel 
          where rec loop1=fun
                          [ [] -> False
                          | [Relationc (x,y,r,z,t)::rest1] -> 
                            if  (r < 2000)
                                && ((z=a && t=b) || (x=c && y=d) )
                            then loop1 rest1 
                            else if (r>= 2000) 
                                 && ((z=a && t=b) || (x=c && y=d))
                            then loop rest 
                            else loop1 rest1
                          ]  *)
           else if ( r1 >= 2000  && r1 < 4000 ) then
          loop1 maprel 
          where rec loop1=fun
                          [ [] -> False
                          | [Relationc (x,y,r,z,t)::rest1] -> 
                            if  (r < 4000)
                                && ((z=a && t=b) || (x=c && y=d) )
                            then loop rest 
                            else if (r>= 4000) 
                                 && ((z=a && t=b) || (x=c && y=d))
                            then loop rest
                            else loop1 rest1
                          ] 
           else if ( r1 >= 4000 ) then
          loop1 maprel 
          where rec loop1=fun
                  [ [] -> False
                          | [Relationc (x,y,r,z,t)::rest1] -> 
                            if  (r < 2000)
                                && ((z=a && t=b) || (x=c && y=d) )
                            then loop rest 
                            else if (r>= 2000 && r < 4000) 
                                 && ((z=a && t=b) || (x=c && y=d))
                            then loop rest 
                            else loop1 rest1
                          ] 
         else loop rest
   ]
;

value print_pair (a,b) =
  do {print_int a; print_string " "; print_int b; print_string "\n";}
;

value build_list rels dag =
let maprel=List.map (fun y -> List.nth rels (y-1) ) dag in
    loop [] maprel
    where rec loop acc=fun
    [ [] -> (*do { List.iter print_pair acc;*) acc
    | [ Relationc (a,b,r,c,d) :: rest] -> let acc1=[(a,c) :: acc]
					  in loop acc1 rest
    ]
;

value rec chk_cycles key_list v acc =
    (*do { List.iter print_sint key_list;
        print_string "v=";print_int v; print_string "\n";*)
     let acc1= List.filter (fun (k1,v1) -> if k1=v then True else False) acc in
     if acc1=[] then False else loop acc1
     where rec loop=fun
     [[] -> False
     | [(k1,v1)::r] -> let key_list1=[k1 :: key_list] in
                       if List.mem v1 key_list then True
                       else if chk_cycles key_list1 v1 acc then True
		       else loop r
     ]
 (* }*)
;

value no_cycles relations relsindag=(*do 
    { List.iter print_sint relsindag; print_string "\n"; *)
      let acc=build_list relations relsindag in loop acc
      where rec loop=fun
      [ [] -> True
      |[(k,v)::r] -> let key_list=[k] in 
                         if not (chk_cycles key_list v acc) then loop r else False
      ]
(* } *)
;

value rec print_dag=fun
        [ [] -> ()
        | [(a,b,c)::tl] -> do { print_int a; print_int b; List.iter print_int c;
                          print_string "\n";
                          print_dag tl;}
        ]
;

(* Get dag list of size n from the array of lists relations, where each list corresponds to a relation and associated dags with it. *)

value rec get_dag_list text_type rel acc=fun
        [ [] -> acc
        | [hd :: tl ] -> (* do {
                List.iter print_sint hd; print_string "\n";*)
                    if samucciwa_anyawara_constraint rel hd
                    && global_compatible text_type rel hd
                   && no_cycles rel hd
                      then do {
                        (*      List.iter print_sint hd; print_string "\n";*)
                         let cost=add_cost text_type 0 rel hd in
                         let len =List.length hd in
                         let triplet=(len, cost, hd) in
                         let res1=List.append [triplet] acc in
                         get_dag_list text_type rel res1 tl }
                    else get_dag_list text_type rel acc tl  (*}*)
       ]
;

(* To get the total number of words in the sentence
The input is a quintuple (a,b,c,d,e) with a and d the word numbers, c the relation
So we find the largest among all a's and d's to get the total words.
The word numbers start with 1. So the largest word index gives the total words *)
(* largest : int * Relationc list -> int *)

value rec largest rslt=fun
[ [] -> rslt
| [Relationc(a,b,c,d,e) :: r]  ->
         let intmd =
             if a > rslt
             then if a > d then a else d
             else if d > rslt then d else rslt
             in largest intmd r
]
;

value rec wrd_boundaries acc rel_indx wrd_indx rel =match rel with
[ [] -> List.append acc  [rel_indx]
| [Relationc(a,b,c,d,e)::xs] as t -> (*  do {
        print_string "curr index="
        ;print_int a
        ;print_string " rel index="
        ;print_int rel_indx
        ;print_string " word index="
        ;print_int wrd_indx
        ;print_newline ()
        ;List.iter print_int acc
        ;print_newline ()
        ;*)  if a=wrd_indx then
              (* if not (c=2 )
              then  *) wrd_boundaries acc (rel_indx+1) wrd_indx xs
              (* else  wrd_boundaries (List.append acc [rel_indx]) (rel_indx+1) (wrd_indx) xs  *)
             else wrd_boundaries (List.append acc [rel_indx]) (rel_indx) (wrd_indx+1) t
         (*} *)
]
;

(* rel_lst: 5 tuple (to_id,to_mid,rel,from_id.from_mid)
 * text_type: Prose / Sloka *)

value solver rel_lst text_type =
  let total_wrds=(largest 0 rel_lst) in do
  { populate_compatible_lists text_type rel_lst total_wrds
    (*; print_string "initialise inout_rels="
    ; print_int inout_rels.(1)
    ; print_newline() *)
    ;populate_inout_rels (List.length rel_lst -1) rel_lst
    ; let wrdb=wrd_boundaries [0] 0 1 rel_lst in (* do {*)
    (* List.iter print_int wrdb; *)
    let final=
         if List.length wrdb > total_wrds 
         then List.length wrdb-1 
         else (total_wrds-1) in (* do {*)
         (*print_string "final="
       ; print_int final
    ; *) let dags=construct_dags 0 final wrdb [] in (* do { *)
     (*print_string "DAGS=" 
     ;print_acc dags 
     ;*)let dagsj=List.fold_left ( fun y (a,b) -> 
           (* if (List.length a=total_wrds-1) *)
            if (List.length a >= total_wrds-5) 
            then [a::y]
            else y) [] dags in 
     (*do  print_acc dags 
    ; let soln= List.sort_uniq comparecostlength (get_dag_list text_type rel_lst [] dagsj) in do
    ; *)let soln= List.sort comparecostlength (get_dag_list text_type rel_lst [] dagsj) in (*do
       { *)(*print_string "1.minion\n"
       ; *)let l=List.filter 
              (fun (x,y,z) -> if x=total_wrds-1 then True else False ) 
              soln in
              if (List.length l > 0)
              then do
              { (* print_string "Total dags="
              ; print_int total_dags_so_far.val
              ; print_newline () ; *)
              (*;  print_int total_wrds
              ; print_int (List.length l) 
              ; *) let collapsed_soln=lwg_and_collapse_all_solns text_type rel_lst l in
                (*let uniq_collapsed_soln=List.sort_uniq comparecostlength collapsed_soln in do *)
                let uniq_collapsed_soln=List.sort comparecostlength collapsed_soln in do {
                print_string "Total Complete Solutions="
              ; print_int (List.length uniq_collapsed_soln)
              ; print_newline ()
              (*; print_int (List.length soln)
              ; print_newline () *)
              ; print_cost_soln_list 1 (total_wrds-2) rel_lst uniq_collapsed_soln
                }
              (*; print_cost_soln_list 1 (total_wrds-2) rel_lst soln*)
              }
              else do { 
              let l=List.filter 
              (fun (x,y,z) -> if x=total_wrds-1 then False else True ) 
              soln in
              if (List.length l > 0)
              then
                let collapsed_soln=lwg_and_collapse_all_solns text_type rel_lst l in
                let uniq_collapsed_soln=List.sort comparecostlength collapsed_soln in do {
              print_string "Total Partial Solutions="
              ; print_int (List.length uniq_collapsed_soln)
              (*;let psols=(List.length soln - List.length l)
               in print_int psols *)
              ; print_newline ()
              ; print_cost_soln_list 1 (total_wrds-3) rel_lst uniq_collapsed_soln
              (*; print_cost_soln_list 1 0 rel_lst soln
               * TO MODIFY according to new parameter types *)
              } else ()
     } (*} *)
 (*}*)
 (*}*)
 (*}*)
 }
;

(*main()
;*)
