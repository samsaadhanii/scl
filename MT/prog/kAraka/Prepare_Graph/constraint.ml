(* Copyright: Amba Kulkarni (2014-2023)                             *)
(* Indian Institute of Advanced Study, Shimla (Nov 2015 - Oct 2017)             *)

(* To add: gam1 can not have both karma and aXikaraNa *)


open List;
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
value multiple_relations_begin=25 (* inclusive *)
(* Two or more aXikaraNa, kAla-aXikaraNa, xeSa-aXikaraNa, pUrvaAlaH, ... are possible 
Ex: ekaxA yaxA .. waxA *)
;
value multiple_relations_end=41 (* inclusive *)
;
value max_rels=600 (* Max relations in a sentence *)
;
value max_wrds=60 (* Max words in a sentence *)
;
(* value rel_wrds=Array.make max_wrds []
; *)
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
 [ Relationc (i1,i2,i3,i4,i5,i6,i7,i8)   -> do
    { print_string "("
    ; print_int (i1-1); print_string ","
    ; print_int (i2-1); print_string ","
    ; print_int (i3-1); print_string ","
    ; if (i4 >= 2000)  && (i4 < 5000) then print_int (i4 - (i4 mod 100)) 
      else if (i4=1009) then print_int 9 
      else if (i4=1080) then print_int 80 
      else if (i4=70) then print_int 39  (* hewuH -> hewu *)
      else if (i4=37) then print_int 36  (* aBexaH -> viSeRaNam *)
      else if (i4=33) then print_int 32  (* sup_samucciwaH -> samucciwaH *)
      else if (i4=35) then print_int 34  (* sup_anyawaraH -> anyawaraH *)
      else if (i4=46) then print_int 45  (* sup_samucciwa_xyowakaH -> samucciwa_xyowakaH *)
      else if (i4=48) then print_int 47  (* sup_anyawara_xyowakaH -> anyawara_xyowakaH *)
      else if (i4=6) then print_int 7  (* karwA_be_verb -> karwA*)
      else if (i4=202) then print_int 7  (* BkarwA -> karwA*)
      else if (i4=203) then print_int 14  (* Bkarma -> karma*)
      else if (i4=8) then print_int 9  (* karwqrahiwakarwqsamAnAXikaraNa -> viXeya_viSeRaNam *)
      else if (i4=40) then print_int 41  (* prayojanam1 -> prayojanam *)
      else if (i4=5006) then print_int 38  (* RaRTIsambaXaH_samAsaH -> RaRTIsambanXaH *)
      else print_int i4
    ; print_string ","
    ; print_int (i5-1); print_string ","
    ; print_int (i6-1); print_string ","
    ; print_int (i7-1); print_string ")\n"
    }
 ]
;

value print_relation_in_dag relations r=
	let rel=List.nth relations (r-1) in
	print_relation rel
;

value join_relations a b1 b c d e1 e f u v1 v w x y1 y z =
    if d=u && e=v 
    then if c >= 2000 && c < 2100
      then if w >= 4000 && w < 4100 then [Relationc (a,b1,b,43,d,e1,e,f);Relationc (u,v1,v,20,x,y1,y,z)]
      else if w >= 4100 && w < 4200 then [Relationc (a,b1,b,43,d,e1,e,f); Relationc (u,v1,v,21,x,y1,y,z)]
      else if w >= 4200 && w < 4300 then [Relationc (a,b1,b,43,d,e1,e,f); Relationc (u,v1,v,7,x,y1,y,z)] 
      else if w >= 4300 && w < 4400 then [Relationc (a,b1,b,43,d,e1,e,f); Relationc (u,v1,v,28,x,y1,y,z)] 
      else if w >= 4400 && w < 4500 then [Relationc (a,b1,b,43,d,e1,e,f); Relationc (u,v1,v,9,x,y1,y,z)] 
      else if w >= 4500 && w < 4600 then [Relationc (a,b1,b,43,d,e1,e,f); Relationc (u,v1,v,24,x,y1,y,z)] 
      else if w=21 && c >= 2000 && c < 2100 then [Relationc (a,b1,b,43,d,e1,e,f)] 
      else []
    (* else if c >= 2100 && c < 2200 then [Relationc (u,v1,v,21,x,y1,y,z)]  *)
    else if c >= 2200 && c < 2300 then [Relationc (u,v1,v,14,x,y1,y,z)] 
    else if c >= 2400 && c < 2500 && w >= 4300 && w < 4400 then [
            Relationc (u,v1,v,95,x,y1,y,z); Relationc(a,b1,b,43,d,e1,e,f)] 
    else if c >= 2600 && c < 2700 then [Relationc (u,v1,v,49,x,y1,y,z)] 
    (* else if c >= 2700 && c < 2800 then [Relationc (u,v1,v,14,x,y,y1,z)]  *)
    (*else if c >= 3100 && c < 3200  && w >= 4300 && w < 4400 then [Relationc (a,b1,b,c,d,e1,e,f);Relationc (u,v1,v,92,x,y1,y,z)]*)
    else if c >= 3200 && c < 3300  && w >= 4300 && w < 4400 then [Relationc (a,b1,b,c,d,e1,e,f);Relationc (u,v1,v,93,x,y1,y,z)] 
    else if c >= 2300 && c < 2400 && w >= 4300 && w < 4400 
    then [Relationc (a,b1,b,c,d,e,e1,f);Relationc (u,v1,v,w,x,y1,y,z)] 
    else if c >= 2900 && c < 3000 && w >= 4300 && w < 4400 
    then [Relationc (u,v1,v,94,x,y1,y,z)] 
    else []
    else []
;

value collapse_upapada_relations relations part_dag a b1 b c d e1 e f=
    loop [] relations part_dag
    where rec loop acc relations=fun
    [ [] -> acc (* if (c >=2000 && c < 2300) || (c >= 2400 && c < 4000) 
(*(c >= 2400)*)
            then if (acc=[]) then []
            else  List.append acc  [Relationc (a,b1,b,0,d,e1,e,f)] 
            (*else [Relationc (a,b1,b,c,d,e1,e,f)] *)
(* We need to handle karma pravacanIya separately *)
            else if (c >= 2300 && c < 2400)
            then acc
            else [] *)
    | [r :: l ] -> let rel=List.nth relations (r-1) in
            match rel with
            [Relationc (u,v1,v,w,x,y1,y,z) -> 
                    let acc1 =
                    if c >= 2000 && c < 4000 && w >= 4000 && w < 5000
                    then join_relations a b1 b c d e e1 f u v1 v w x y1 y z
                    else if c >= 4000 && c < 5000 && w >= 2000 && w < 4000
                    then join_relations u v1 v w x y1 y z a b1 b c d e1 e f
                    else if c >= 2000 &&  c < 2100 && w=21
                    then join_relations a b1 b c d e1 e f u v1 v w x y1 y z
                    else if c=21 && w >= 2000  && w < 2100
                    then join_relations u v1 v w x y1 y z a b1 b c d e1 e f
                    else []
                in  let acc2=if acc1=[] then []
                    (*else if ((c >= 3100 && c < 3300)) -- removed, since now upa_vinA and upa_saha relations are being marked from translation point of view.
                     * Earlier we would group them together with the previous wqwIyA viBakwi word
                    (* else if ((c >= 2000 && c < 2300) || (c >=2400 && c < 4000)) *)
                    then List.append acc1 [Relationc (a,b1,b,0,d,e1,e,f)]  *)
                     (* for saha and vinA grouping *)
                    (*else if (c >=4000)
                    then List.append acc1 [Relationc (u,v1,v,0,x,y1,y,z)] *)
		    else acc1
                in let acc3= List.append acc  acc2 
                in  loop acc3 relations l
            ]
    ]
; 

value lwg_and_collapse relations dag =
    loop [] relations dag
    where rec loop acc relations=fun
    [ [] -> acc 
    | [ r :: l ] ->
           let rel=List.nth relations (r-1) in
            match rel with
            [Relationc (a,b1,b,c,d,e1,e,f) -> 
               if c < 2000 || c > 5000
               then let acc1=if c=91  (* avaXiH  not defined in build_graph.ml! *)
                               then  List.append acc  [Relationc (a,b1,b,0,d,e1,e,f)] 
                               else if c =214
                               then List.append acc  [Relationc (a,b1,b,14,d,e1,e,f)] 
                               else if (c=200) (*gawikarwA -> karwA *)
                               then List.append acc  [Relationc (a,b1,b,7,d,e1,e,f)] 
                               else if (c=201) (*gawikarma -> karma *)
                               then List.append acc  [Relationc (a,b1,b,14,d,e1,e,f)] 
                               else if (c=10) (*muKyakarma -> karma *)
                               then List.append acc  [Relationc (a,b1,b,14,d,e1,e,f)] 
                               else if (c=11) (*gONakarma -> karma *)
                               then List.append acc [Relationc (a,b1,b,14,d,e1,e,f)] 
                               else List.append acc  [rel] 
                    in loop acc1 relations l
               else let acc1=
                    collapse_upapada_relations relations l a b1 b c d e1 e f
                    in let acc2= List.append acc acc1
                    in loop acc2 relations l
            ]
    ]
;


value print_cost_soln (len,c,l) n count rel=do
        { (*print_string "len="; print_int len; *)
          if len > count then 
          do { print_string "Solution:"
            ; print_int n; print_newline ()
            ; List.iter print_relation l
            ; print_string "Cost="; print_int c
            ; print_string "\n\n"
            }
    else ()
}
;

  (*expects (int,int,int list) list *)
(* Print only first 100 solutions *)
value rec print_cost_soln_list n count rel=fun
  [ [] -> ()
  | [ (len,a,l) :: r ] -> do
      { (*print_string "n="; print_int n; print_newline() ; *) 
         if (len > count && n < 200) then print_cost_soln (len,a,l) n count rel else ()
       ; print_cost_soln_list (n+1) count rel r
      }
  ]
;

value between b a c =
  if (a < b && b < c) || (c < b && b < a) then True else False
;

value no_direct_cycle m1 m2=match m1 with
    [ Relationc (to_id1,to_cid1,to_mid1,r1,from_id1,from_cid1,from_mid1,dist1) -> match m2 with
      [Relationc (to_id2,to_cid2,to_mid2,r2,from_id2,from_cid2,from_mid2,dist2) -> 

         if (to_id1=from_id2) && (to_mid1=from_mid2) && (from_id1=to_id2) && (from_mid1=to_mid2) && (to_cid1=from_cid2) && (to_cid2=from_cid2)
         then False
         else True
      ]
    ]
;


value distinct m1 m2 = match m1 with
    [ Relationc (to_id1,to_cid1,to_mid1,r1,from_id1,from_cid1,from_mid1,dist1) -> match m2 with
      [Relationc (to_id2,to_cid2,to_mid2,r2,from_id2,from_cid2,from_mid2,dist2) -> 
	(*do {
        print_int to_id1;
        print_string " ";
        print_int to_cid1;
        print_string " ";
        print_int to_mid1;
        print_string " ";
        print_int from_id1;
        print_string " ";
        print_int from_cid1;
        print_string " ";
        print_int from_mid1;
        print_string " ";
        print_int to_id2;
        print_string " ";
        print_int to_cid2;
        print_string " ";
        print_int to_mid2;
        print_string " ";
        print_int from_id2;
        print_string " ";
        print_int from_cid2;
        print_string " ";
        print_int from_mid2;
        print_string " ";
	print_newline(); *)
	if to_id1 = to_id2 && to_cid1 = to_cid2 && to_mid1 = to_mid2  &&
	   from_id1 = from_id2 && from_cid1 = from_cid2 && from_mid1 = from_mid2 
        then False else True
       (*}*)
      ]
    ]
;


value single_morph_per_word m1 m2=match m1 with
    [ Relationc (to_id1,to_cid1,to_mid1,r1,from_id1,from_cid1,from_mid1,dist1) -> match m2 with
      [Relationc (to_id2,to_cid2,to_mid2,r2,from_id2,from_cid2,from_mid2,dist2) -> 
            (* Two morph analyses for a word *)

         if (to_id1=to_id2) && (to_cid1=to_cid2) && not (to_mid1=to_mid2) then  False (*  do { print_int to_id1; print_int to_id2;print_int to_cid1; print_int to_cid2;print_string "C1\n"; False} *)
         else if (to_id1=from_id2) && (to_cid1=from_cid2) && not (to_mid1=from_mid2) then  False (*  do { print_int to_id1; print_int from_id2;print_int to_cid1; print_int from_cid2;print_string "C2\n"; False} *)
         else if (from_id1=from_id2) && (from_cid1=from_cid2) && not (from_mid1=from_mid2) then  False  (* do { print_int from_id1; print_int from_id2; print_int from_cid1; print_int from_cid2; print_string "C3\n"; False} *)
         else if (from_id1=to_id2) && (from_cid1=to_cid2) && not (from_mid1=to_mid2) then  False  (* do { print_int from_id1; print_int to_id2; print_int from_cid1; print_int to_cid2; print_string "C4\n"; False} *)
         else True 
      ]
    ]
;

value single_relation_label m1 m2= match m1 with
    [ Relationc (to_id1,to_cid1,to_mid1,r1,from_id1,from_cid1,from_mid1,dist1) -> match m2 with
      [Relationc (to_id2,to_cid2,to_mid2,r2,from_id2,from_cid2,from_mid2,dist2) -> 
            (* Two incoming arrows (*with diff labels*) except niwya_sambanXaH (=101, & 102) *)
         if    (to_id1=to_id2) && (to_cid1=to_cid2) && (to_mid1=to_mid2) && (from_id1=from_id2) && (from_cid1=from_cid2) && (from_mid1=from_mid2) 
            && not (r1=r2) && not(r1=101) && not(r2=101)
         then False
         else if (to_id1=to_id2) && (to_cid1=to_cid2) && (to_mid1=to_mid2) (*&& not (r1=r2) *)
         && not (r1=101) && not(r2=102) 
         && not (r1=102) && not(r2=101) 
         then False  (*do { print_string "C5"; False}*)
            (* Two outgoing arrows with same label *)
         else if (from_id1=from_id2) && (from_cid1=from_cid2) && (from_mid1=from_mid2) && (r1=r2)
              && ( (r1 < multiple_relations_begin  && not (r1=101))
                  || (r1 > multiple_relations_end && not (r1=102) && not (r1=32) && not (r1=33) && not (r1=34) && not (r1=35)) || (r1=38) || (r1=5006)
                  ) (* niwya sambanXaH (=101,102)*)
         then False (*do { print_string "C9"; False}*)
            (* there can not be another outgoing rel with an upapaxa sambanXa*)
         else if (from_id1=from_id2) && (from_cid1=from_cid2) && (from_mid1=from_mid2) && ((r1 >= 2000  && r1 < 4000) || (r2 >= 2000 && r2 < 4000)) 
         then False  (*do { print_string "C9"; print_int r1; print_int r2;False} *)
         else if  (from_id1=to_id2) && (from_cid1=from_cid2) && (from_mid1=to_mid2) 
               && r1=82 (*vIpsA*) && (r2=101 || r2=102)
              then False  (*do { print_string "C10"; False} *)
         else True  (*do {print_string "C11"; True}*)
      ]
    ]
;

value no_crossing text_type rel m1 m2=match m1 with
    [ Relationc (to_id1,to_cid1,to_mid1,r1,from_id1,from_cid1,from_mid1,dist1) -> match m2 with
      [Relationc (to_id2,to_cid2,to_mid2,r2,from_id2,from_cid2,from_mid2,dist2) -> 
           (* Crossing edges not allowed except niwya_sambanXaH (=101,102) and samucciwa (=32), ananwarakAlaH (=30), upamAna (=79) upamAnaxyowakaH (=80) in some cases*)
           (* Crossing edges allowed even with RaRTI(=38), ViSeRaNa(=36) and aBexaH (=37) *)
         if  (   (    between to_id1 to_id2 from_id2
                   || between from_id1 to_id2 from_id2
                 )
              && (    between to_id2 to_id1 from_id1
                   || between from_id2 to_id1 from_id1
                 )
             )
         (* sup_samucciwaH=33 removed from the following list. It overgenerates.
          * We need at least one example to retain it *)
         (* 33=sup_samucciwaH added to allow the followiing construction:
            बिभेद च पुनः सालान् सप्त एकेन महा-इषुणा गिरिं रसातलं च एव जनयन् प्रत्ययं तदा
          where karaNa and sup_samucciwaH cross *)
             && not (r1=101 || r1=102 || r1=22 || r1=49 || r1=28 || r1=30 || r1=33 || r1=79)
             && not (r2=101 || r2=102 || r2=22 || r2=49 || r2=29 || r2=30 || r2=33 || r2=79)
             && (((not ((r1=36) || (r1=37) || (r1=38) || (r1=9) || (r1=53) ||
                     (r2=36) || (r2=37) || (r2=38) || (r2=9) || (r2=53)))
                    && text_type="Sloka")
                 || (text_type="Prose" && not (r1=9 || r2=9))) 
             && not (r1=6 && r2=40) (* prayojana and karwA crossing allowed. EG wvaM samarWaH asi jFAwum evaMviXaM naraM *)
             && not (r2=6 && r1=40)
             && not (r2=6 && r1=41)
             && not (r1=6 && r2=41)
             (* removed RaRTI, viSeRaNa, aBexa, temporarily *)
         then False else True
             (* let length=List.length rel -1 in
              loop False 0 
              where rec loop acc j=
              if j > length then acc else
               match List.nth rel j with
               [ Relationc (id1,mid1,r,id2,mid2,dist2)  ->
                  if (r=32) &&
                   ((id1=to_id1 && cid1=to_cid1 && mid1=to_mid1 && id2=from_id2 && mid2=from_mid2) ||
                   (id1=from_id2 && cid1=from_cid2 && mid1=from_mid2 && id2=to_id1 && mid2=to_mid1) ||
                   (id1=to_id2 && cid1=to_cid2 && mid1=to_mid2 && id2=from_id1 && mid2=from_mid1) ||
                   (id1=from_id1 && cid1=from_cid1 && mid1=from_mid1 && id2=to_id2 && mid2=to_mid2))
                  then loop True (length+1) 
                  else loop False (j+1) 
               | _  ->  True
               ] 
         else True  *)
      ]
    ]
;

value same_root from_id1 from_id2 from_cid1 from_cid2 from_mid1 from_mid2 =
         (from_id1=from_id2) && (from_cid1=from_cid2) && (from_mid1=from_mid2)

;

value outgoing_incompatible_rels rpair = match rpair with
   [(7,201) (* There can not be both gawi karma/BkarwA and karwA simultaneously *)
   |(201,7) 
   |(202,7) 
   |(7,202) 
   |(200,10)  (* There cannot be gawikarwA and karma simultaneously *)
   |(200,11) 
   |(10,200) 
   |(11,200) 
   |(81,10)  (* There cannot be wumunkarma and karma simultaneously *)
   |(81,11) 
   |(81,12) 
   |(81,13) 
   |(81,14) 
   |(10,81) 
   |(11,81) 
   |(12,81) 
   |(13,81) 
   |(14,81) 
   (*  Now that sahAyaka kriyA arrow is from Sak, XqR, etc to the wumun, this condition does not arise  -- 19th July 2023
|(81,7) (*With sahAyaka kriyA, there cannot be a karwA *)
   |(7,81) *)
   |(7,6) (* karWA and karwA_be_verbs *)
   |(6,7)
   |(12,14) (* If there is a vAkyakarma, then there can not be a karma  and muKya karma, but there can be gONa karma*)
   |(14,12)
   |(12,11)
   |(11,12) 
   |(13,12) (* If there is a vAkyakarma, there can not be a karmasamAnAXikaraNa *)
   |(12,13)
   (* |(12,10) *)
  (* |(10,12) *)
   |(14,10)  (* If there is a karma, then there can not be a gONa or muKyakarma *)
   |(14,11)
   |(10,14)
   |(11,14)
   |(15,7) (* If there is a karwA there cannot be a prayojaka karwA simultaneously *)
   |(16,7)
   |(7,15)
   |(7,16)
   |(214,10) (* If there is a iRkarma, there can not be karma, gONakarma, muKyakarma *)
   |(214,11)
   |(214,14)
   |(10,214)
   |(11,214)
   |(14,214)
   |(200,36) (*There cannot be a karwA and viSeRaNa simultaneously; in the case of karwari kqw -- rAmaH vIraH gawaH *)
   |(36,200)
   |(11,19)      (* In the case of brU, occasionally sampraxAna is also allowed.  * But then there can not be a gONa karma * ex: BhG we wAna bravImi BHg 1.7 *)
   |(19,11)
   |(7,8)     (* With karwqrahiwaviXeya_viSeRaNam there can not be karwA *)
   |(8,7) 
   |(13,11)   (* With karmasamAnAXikaraNa there can not be gONa-karma 
               * brU1 and vax1 dhaatus are xvikarmaka, and if there is karmasamaanaadhikarana relation with them, then gONa karma should be absent *)
   |(11,13) -> False
   |(_,_) -> True
   ]
 ; 

 value sequence from_id from_cid from_mid to_id to_cid to_mid =
      (*do { print_string "SEQ\n"; 
           print_int from_id; print_string " "; print_int to_id; print_string "::"; 
           print_int from_cid; print_string " "; print_int to_cid; print_string "::"; 
           print_int from_mid; print_string " "; print_int to_mid; print_string "\n"; *)
           from_id=to_id && from_cid=to_cid && from_mid=to_mid
      (*}*)
;

value not_allowed_sequence_rels rpair = match rpair with
  [ (* a RaRTI/prawiReXaH of a kriyAviSeRaNa or a viSeRaNa is not allowed ; removed aBexa; RaRTI of aBexa is allowed; SriyaH pawiH*)
  (26,38)
  |(26,50)
  |(36,38)
  |(28,36) (* viSeRaNa of sambanXa not allowed *)
  (* |(9,38) inxraH svargasya rAjA aswi. -- RaRTI of viXeya viSeRaNam *)
  |(36,50)
  |(38,26)
  |(50,26)
  |(53,36) (* viSeRaNa of saFjFA not allowed *)
  (*|(38,36) -- removed, since viSeRaNa of RaRTI is possible as in vIrasya rAmasya puwraH *)
  |(50,36)
  |(36,9) 
   (* a viSeRaNa of a viSeRaNa is not allowed *)
  |(36,36)
  (*|(9,36) ?? Why is this condition? We can have eRA SobanA velA aswi *)
  |(9,9)
 (* an aBexa of an aBexa is not allowed *)
  |(37,37)
 (* an viSeRaNa of wIvrawAxarSI is not allowed *)
  |(51,36)
 (* a viSeRaNa of an aBexa is not allowed *)
  |(37,36)
  |(36,37)
  |(37,9)
  |(9,37)
 (* viSeRaNa of gawikarwA not allowed *)
  |(36,200)
 (* samucciwa of samucciwa is not allowed *)
  |(32,32)
  |(33,33)
  |(34,34)
  |(35,35) (* rAmaH sIwA ca lakRmaNaH ca -- here it is not samucciwa of samucciwa, but several samucciwas, just like viSeRaNa *)
(* karwA / karma of a karmasamAnAXikaraNam not allowed *)
  |(13,7)
  |(13,10)
  |(13,11)
  |(13,14)
  |(7,13)
  |(10,13)
  |(11,13)
  |(14,13)
(* karwA / karma of a samAnAXikaraNam not allowed *)
  |(1009,7)
  |(1009,10)
  |(1009,11)
  |(1009,14)
  |(7,1009)
  |(10,1009)
  |(11,1009)
  |(14,1009)
  |(9,7)
  |(9,10)
  |(9,11)
  |(9,14)
  |(7,9)
  |(10,9)
  |(11,9)
  |(14,9)
(* uwprekRA_xyowaka of a karwA/viSeRaNam not allowd *)
  |(7,89)
  |(36,89)
  |(36,79) (* upamAna of viSeRaNa *)
  |(79,79) (* upamAna of upamAna is not allowed *)
(* viSeRaNam of a varwamAna samAnakAla not allowd *)
  |(75,36)
(* viXeya_viSeRaNam/samAnAXikaraNam of a viXeya_viSeRaNam/samAnAXikaraNam not allowed *)
  |(9,1009)
  |(1009,1009)
  |(1009,9)  (*do { print_string "MYF";False }*)
  | (76,36) (* viSeRaNa of sahArWa xyowaka not allowed*)
  (* pUrvakAla of karwA/karma not allowed *)
  | (7,25)
  | (14,25) -> True
  | (_,_) -> False
  ]
 (* a samboXyaH can be only of the root verb  or an embeded verb in iwi clause 
      else if top=47  && not (bottom=13)  then False *)
;

value relation_mutual_ayogyataa text_type m1 m2=match m1 with
    [ Relationc (to_id1,to_cid1,to_mid1,r1,from_id1,from_cid1,from_mid1,dist1) -> match m2 with
      [Relationc (to_id2,to_cid2,to_mid2,r2,from_id2,from_cid2,from_mid2,dist2) -> 

(* If there is any kAraka relation, or prayojana or hewu, there can not be viSeRaNa, in case of kqxanwas. 
 * --> prayojana/hewu is possible
 * --> rAmaH piwuH AjFayA vExyaH BUwvA sevAm karowi *)
         (* Allow viRayAXikaraNam;
           xAsyoH vacaneRu mahiRyAH nirAwiSayA SraxXA Bavawi *)
(* need example *)
       (*do { print_string "m1 = "; print_relation m1; print_string "m2 = "; print_relation m2;
print_int r1; print_string " "; print_int r2; print_string "\n";
       print_int to_id2; print_string " "; print_int from_id2; print_string "\n"; *)
       if same_root from_id1 from_id2 from_cid1 from_cid2 from_mid1 from_mid2
              && (  (((r2 > 9 && r2 < 22) || (r2 = 6) || (r2 = 7))  && ((r1=36) || (r1=8) || (r1=9)))
                 || (((r1 > 9 && r1 < 22)  || (r2 = 6) || (r2 = 7)) && ((r2=36) || (r2=8) || (r1=9))))
         then False  (* do { print_string "C13\n"; False} *)

      (* There can not be a samboXya of a verb, which is viSeRaNa/pUrvakAla etc. Only 'iwi' relation with such verbs are allowed. 
              samboXya=48; vAkyakarama=12 ; prawiyogi=3*)
(* need example *)
         else if sequence from_id2 from_cid2 from_mid2 to_id1 to_cid1 to_mid1
                && (r2=48) && not (r1=12)
         then False (* do { print_string "C14\n"; False} *)
         else if sequence from_id1 from_cid1 from_mid1 to_id2 to_cid2 to_mid2
                && (r1=48) && not (r2=12)
         then False (* do { print_string "C15\n"; False} *)
         else if same_root from_id1 from_id2 from_cid1 from_cid2 from_mid1 from_mid2
         then (* do { print_string "C16\n"; *) outgoing_incompatible_rels (r1,r2) (*}*)
         else if sequence from_id1 from_cid1 from_mid1 to_id2 to_cid2 to_mid2 && r2 = 79 && r1 = 36 && ((to_id1 - from_id1 > 1) || (from_id1 - to_id1 > 1))
         then False (*do { print_string "C17\n"; False} *)
         else if sequence from_id2 from_cid2 from_mid2 to_id1 to_cid1 to_mid1  && r1 = 79 && r2 = 36 && ((to_id2 - from_id2) > 1 || (from_id2 - to_id2) > 1)
         then  False (*do { print_string "C18\n"; False} *)
         else if sequence from_id2 from_cid2 from_mid2 to_id1 to_cid1 to_mid1
         then  (*do { print_string "C19\n";  *)
              if (not_allowed_sequence_rels (r1,r2)) 
              then False 
              else if sequence from_id1 from_cid1 from_mid1 to_id2 to_cid2 to_mid2
                   then (*do { print_string "C20\n";  *)
                           not (not_allowed_sequence_rels (r2,r1))
                         (* } *)
	  (* the viSeRaNa of an upamAna should be just before it *)
                 else True  (* do { print_string "RA\n"; True} *)
              (*} *)
         else if sequence from_id1 from_cid1 from_mid1 to_id2 to_cid2 to_mid2
              then not (not_allowed_sequence_rels (r2,r1))
              else True  
      ]
    ]
;


(*value relation_mutual_yogyataa m1 m2=match m1 with
    [ Relationc (to_id1,to_mid1,r1,from_id1,from_mid1,dist1) -> match m2 with
      [Relationc (to_id2,to_mid2,r2,from_id2,from_mid2,dist2) -> 

         if from_id1=to_id2 && from_cid1=to_cid2 && from_mid1=to_mid2
                && r1=25 && not (r2=300) && not (r2=45) (* pUrvakAla is allowed only if either it is directly connected to the main verb, in case there exists another relation then the other relation is either a pratoyogi / anuyogi *)
         then False
         else True
      ]
    ]
;
*)
(*value relation_mutual_expectancy m1 m2 = match m1 with
    [ Relationc (to_id1,to_mid1,r1,from_id1,from_mid1,dist1) -> match m2 with
      [Relationc (to_id2,to_mid2,r2,from_id2,from_mid2,dist1) -> 
         if sequence from_id2 from_mid2 to_id1 to_mid1
         then sequence_rels r1 r2
         else if sequence from_id1 from_mid1 to_id2 to_mid2
         then sequence_rels r2 r1
         else True
      ]
    ]
;*)

(* Needed only for debugging
*)
value print_sint i=do
 { print_int i
 ; print_string ";"
 }
;

value rec print_acc=fun
[[] -> ()
|[(a,b)::xs] -> do { List.iter print_sint a; print_string " => "
                   ; List.iter print_sint b; print_string "\n"
                   ; print_acc xs
                   }
                   
]
;

value rec print_acc_len=fun
[[] -> ()
|[(l,c,a)::xs] -> do { 
                     print_sint l;
                     print_sint c;
                     List.iter print_sint a; print_string " => ";
                     print_acc_len xs
                   }
]
;

value rec print_acc_len_cost=fun
[[] -> ()
|[(l,c,a,b)::xs] -> do { 
                     print_sint l;
                     print_sint c;
                     List.iter print_sint a; print_string " => ";
                     List.iter print_sint b; print_string "\n";
                     print_acc_len_cost xs
                   }
                   
]
;
value chk_compatible text_type rel m1 m2= (*do { print_string "==>";*)
     if distinct m1 m2 then
         single_morph_per_word m1 m2 (*then do { print_string "sm;";*)
          && single_relation_label m1 m2 (*then do { print_string "srl;";*)
          && no_crossing text_type rel m1 m2  (*then do { print_string "nc;";*)
          && relation_mutual_ayogyataa text_type m1 m2  (*then  do { print_string "my;"; True}*)
          && no_direct_cycle m1 m2  (*then  do { print_string "oc;"; True}*)
                (*else do {print_string "MY;"; False}}*)
             (*else do {print_string "NC;"; False}}*)
          (*else do {print_string "SRL;"; False}}*)
       (*else do {print_string "SM;"; False};}*)
      (*&& relation_mutual_yogyataa m1 m2 *)
      (*&& relation_mutual_expectancy m1 m2*)
    else  False
;

value rec add_cost text_type acc rels=fun
  [ [] -> acc
  |  [i :: r] ->  match List.nth rels (i-1) with
       [ Relationc (a1,b1,c1,rel,a2,b2,c2,dist2) -> 
            let dist = if a2 > a1 then a2-a1 else a1-a2 in
            let res=
            if rel=101 then 0
            else if rel=102 then 0
            else if rel=6 then 7 * dist (* karwA_be_verbs -> karwA *)
            else if rel=8 then 9 * dist (* viXeya_viSeRaNam *)
            else if rel=1079 then 79 * dist (* upamAna *)
            else if rel=1009 then 9 * dist (* viXeya_viSeRaNam *)
            else if rel=45 then 0 (* samuccaya_xyowakaH *)
            else if rel=46 then 0 (* sup_samuccaya_xyowakaH *)
            else if rel=47 then 0 (* anyawara_xyowakaH *)
            else if rel=48 then 0 (* sup_anyawara_xyowakaH *)
            else if rel=51 then 0 (* wIvrawAxarSI *)
            else if rel=55 then 0 (* Gataka_xyowakaH *)
           (* avaXiH not yet defined in build_graph.ml  else if rel=91 then 0 (*  avaXiH *) *)
            else if rel=70 then 39 * dist  (* hewuH -> hewu *)
            else if rel=76 then 1 * dist (* sahArWa_xyowakaH *)
            else if rel=77 then 1 * dist (* vinArWa_xyowakaH *)
            else if  rel=78 then 100 (* lyapkarmAXikaraNam ; select this only if there is no other analysis possible *)
            else if rel=79 then 1 * dist (*upamAna *)
            else if rel=80 then 1 * dist (* upamAnaxyowakaH *)
            else if  rel> 80 && rel < 90 then 0 (* upapada-LWG relations *)
            else if rel=92 then 1 * dist (* sahArWaH *)
            else if rel=93 then 1 * dist (* vinArWaH *)
            else if rel >= 2000 && rel < 2100 then 43 * dist (*sanxarBa_binxuH *)
            else if rel >= 2200 && rel < 2300 then 14 * dist (* karma *)
            else if rel >= 2400 && rel < 2500 then 95 * dist  (*ABimuKyam *)
            else if rel >= 2600 && rel < 2700 then 49 * dist (* prawiReXaH *)
            else if rel >= 3200 && rel < 3300 then 93 * dist (*vinArWaH *)
            (*else if rel >= 3100 && rel < 3200 then 92 * dist (*sahArWaH *)*)
            else if rel >= 4000 && rel < 4100 then 20 * dist (* apAxAnam *)
            else if rel >= 4100 && rel < 4200 then 21 * dist (* xeSAXi *)
            else if rel >= 4200 && rel < 4300 then 9 * dist (* viXeya_viSeRaNam *)
            else if rel >= 4300 && rel < 4400 then 28 * dist (* sambanXaH *)
            else if rel >= 4400 && rel < 4500 then 7 * dist (* karwA *)
            else if rel >= 4500 && rel < 4600 then 24 * dist (* aXikaraNa *)
            else if rel = 200  then 7 * dist (* gawi karwA -> karwA *)
            else if rel = 201  then 14 * dist (* gawi karma -> karma *)
            else if rel = 202  then 7 * dist (* BkarwA -> karwA *)
            else if rel = 203  then 14 * dist (* Bkarma -> karma *)
            else if rel >= 205  then (rel-200) * dist (* AvaSyakawA/pariNAma *)
            else if rel = 5006  then 0
            else if a1 > a2 
                 then if rel=32 then 0
                      else if text_type="Prose" && rel=38
                      then rel * dist * 10 (* if the kaarakas or RaRTI are to the right, give penalty *)
                      else rel * dist (* no penalty in case of Sloka *)
                 else rel * dist
        in  add_cost text_type (acc+res) rels r
       ]
  ]
;

value lwg_and_collapse_all_solns text_type rel solns =
        loop [] rel solns
        where rec loop acc rel=fun
        [ [] -> acc
        | [ (len,cost,l)  :: rest ] -> let l1=lwg_and_collapse rel l in do {
                         let len1 = List.length l1 in 
                         let triplet=(len1, cost, l1) in
                         (*let new_acc= if (List.filter (fun (a,b,c) -> if c=l1 then True else False) acc = []) then List.append [triplet] acc *)
                         let new_acc= if (List.filter (fun (a,b,c) -> c=l1) acc = []) then List.append [triplet]  acc
                         else acc in
                         loop new_acc rel rest
		         }
        ]
;

value compare_int i j =
  if i = j then 0
  else if i > j then 1 else -1
;


value compare_pair (a1,b1) (a2,b2) = 
  if a1 = a2 then if b1 = b2 then 0 else if b1 > b2 then 1 else -1
  else if a1 > a2 then 1 else -1
;

(* Min cost, and largest length *)
value comparecostlength (l1,c1,_) (l2,c2,_) =
    if l1=l2 then compare_int c1 c2 else compare_int l2 l1
;

(* Min cost, and largest length *)
value comparecostlength1 (l1,c1,_,_) (l2,c2,_,_) =
    if l1=l2 then compare_int c1 c2 else compare_int l2 l1
;

value print_spair (i,j) =do
 { print_int i
 ; print_string "."
 ; print_int j
 ; print_string ";"
 }
;

value get_wrd_ids rel=match rel with
 [ Relationc (id1,cid1,mid1,rel,id2,cid2,mid2,dist1) -> [(id1,cid1);(id2,cid2)]
 ]
;

(* Remove all incoming and outgoing relations (except viSeRaNa and RaRTI sambanXa) into islands 
   First get the list of words related to each word
   If there is a word which is related to only one other word, it forms an island. 
   Now remove all the relations that are incoming and outgoing from this island.
*)

(*
value incoming_outgoing rel a b =
 match rel with
 [ [] -> False
 | Relationc (id1,id2,id3,id4,id5,dist1) -> if  (id1 < a < id4 && (b > id4 || b < id1)) 
                                        || (id1 < b < id4 && (a > id4 || a < id1))
				      then True else False
 ]
; 
 
value rec remove_incoming_outgoing_rels acc l_bndry r_bndry = 
[ [] -> acc
|[r::s] -> if incoming_outgoing r l_bndry r_bndry 
	   then remove_incoming_outgoing_rels acc l_bndry r_bndry s
	   else remove_incoming_outgoing_rels [acc::r] l_bndry r_bndry s
] 
;

value remove_incoming_outgoing_rels_island acc rel total_wrds =

;

value rec get_rel_wrds  = fun
 [ [] -> ()
 | [Relationc (id1,id2,id3,id4,id5,dist1):: rr]  -> do {
              rel_wrds.(id1) := 
              if not (List.mem id4 rel_wrds.(id1)) 
              then List.append [id4]  rel_wrds.(id1)
              else rel_wrds.(id1)
	      ; print_int id1
	      ; print_string " "
	      ; List.iter print_sint rel_wrds.(id1)
	      ; print_string "\n"
              ; get_rel_wrds rr
              }
 ]
;

*)
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
  let length=List.length rel - 1 in do 
   { for i=0 to length do
     { let reli=List.nth rel i in do
         { 				
                                      (*   print_int i ;print_string " =>" ;print_relation reli ;*)
          let l=get_wrd_ids reli in
            compatible_words.(i+1) :=  List.append l compatible_words.(i+1) 
          				(* a word is compatible with self *)
         ;for j=i+1 to length do
        {   let relj=List.nth rel j in
          do {
           let l=get_wrd_ids relj in
           compatible_words.(j+1) := List.append l compatible_words.(j+1)
          				(* a word is compatible with self *)
          ;if (chk_compatible text_type rel reli relj)
          then  do {
           			(*	 print_int j
           				;print_string " "
           				;print_relation relj ; *)
             compatible_relations.(i+1) := List.append [j+1] compatible_relations.(i+1)
             ;let l=get_wrd_ids relj in
             compatible_words.(i+1) := List.append l compatible_words.(i+1)
             ;let l=get_wrd_ids reli in
               compatible_words.(j+1) :=  List.append l compatible_words.(j+1)
          }
          else ()
          }
        }
       }
     }
    
   ; for i=0 to length do {
      compatible_relations.(i+1) := List.sort_uniq compare_int compatible_relations.(i+1)
      ;compatible_all_words.(i+1) := List.length (List.sort_uniq compare_pair compatible_words.(i+1)) = total_wrds

 (* compatible_all_words.(i+1) is a boolean, it is true if the i+1th word is potentially related to all other words in the sentence.
This condition is added to ensure that the necessary condition that all the words are related is satisfied.
Thus, for ungrammatical sentences such as rAmaH granWam svapiwi, the parser halts here. However, for sentences such as rAmaH annam svapiwi, since potentially annam being in neuter gender can be a kartA for svapiwi, the programme continues. *)
 
     (*; print_string "compatible words for "
     ; print_int (i+1)
     ; print_string "="
     ; List.iter print_spair (List.sort_uniq compare_pair compatible_words.(i+1))
     ; print_newline() 
     ; print_int (List.length (List.sort_uniq compare_pair compatible_words.(i+1)))
     ; print_newline() 
     ; print_int total_wrds
     ; print_newline() 
     ; if compatible_all_words.(i+1) then print_string "YES\n" else print_string "NO\n"
     ; print_string "compatible relations for "
     ; print_int (i+1)
     ; print_string "="
     ; List.iter print_sint compatible_relations.(i+1)
     ; print_newline()  *)
   }
  }
;


(* value rec delete_small size acc=fun
[[] -> acc
|[(a,b)::xs] -> if (List.length a >= size)
                then delete_small size (List.append acc [(a,b)]) xs
                else delete_small size acc xs
]
; *)

value rec delete_small size dag=   let large = List.filter (fun (a,b) -> (List.length a >= size)) dag in 
                                     if large = [] then let size1 = size-1 in delete_small size1 dag 
                                     else large
;

(* Compatible_relations.(i) is empty if none of the following relations are incompatible with i, or i is the last relation, making the 'empty' ambiguous.
Instead of empty list, we produce the same relation *)

(* True if a is subset of b else False*)
value subset a b=List.for_all (fun i -> List.mem i b) a
;

value rec get_first n len acc = fun
  [ [] -> acc
  | [ (l,c,a,b) :: r ] -> (*do { print_int len; *)
                             if n >=0  && l >= len then 
                                let acc1 = List.append acc [(l,c,a,b)]
                                and n1 = n-1 in get_first n1 len acc1 r
		             else acc (*}*)
  ]
;

value rec get_first_n len acc = fun
  [ [] -> acc
  | [ (l,c,a) :: r ] -> if l >= len then 
                                let acc1 =  List.append acc [(l,c,a)]
                                in get_first_n l acc1 r
		             else acc
  ]
;

value cartesian_product_initial_dags dag1 dag2=
  let dag = List.rev ( List.fold_left
               (fun x (a1,b1) ->
                  List.fold_left
                     ( fun y (a2,b2) ->  
                       if subset a2 b1 then 
                          if a1=a2 then y
                          else   let l1= List.append a1 a2
                                 and l2=if b1=[] then b2
                                        else if b2=[] then b1
                                        else intersection b1 b2 in
                                     if (List.mem (l1,l2) y) then y else List.append [(l1,l2)] y
                       else y
                     ) x dag2
                 ) [] dag1
             )  in (*do { print_string "join dags = "
                     ; print_acc dag
                     ;*) dag (*}*)
;

value cartesian_product_dags dag1 dag2 text_type rel=
    let dag = List.rev ( List.fold_left
                        (fun x (len1,c1,a1,b1) ->
                           List.fold_left
                             ( fun y (len2,c2,a2,b2) ->  
                                if subset a2 b1 then 
                                  if a1=a2 then y
                                  else  let l1= List.append a1 a2
                                        and l2=if b1=[] then b2
                                               else if b2=[] then b1
                                               else intersection b1 b2
                                        in let len = len1+len2
					   and cost = c1+c2 (*add_cost text_type 0 rel l1 *) in
                                            if (List.mem (len,cost,l1,l2) y) then y else List.append [(len,cost,l1,l2)] y
                               else y
                             ) x dag2
                        ) [] dag1
                    ) in List.sort comparecostlength1 dag
;

value rec get_initial_dag acc start n=
   if n=start then (*do {
                      print_string "n ="
                     ; print_int n
                     ; print_newline()
                     ; print_string "start ="
                     ; print_int start
                     ; print_string "acc="
                     ; print_acc acc
                     ; print_newline()
                     ;*) let dag=List.rev acc in
                       let dag1=cartesian_product_initial_dags dag dag in
                       let dag2 = if dag1=[] then dag else List.append dag dag1 in dag2
                      (*}*)
                  (*else   do { print_int n
                 ;  if n=0 || compatible_all_words.(n) then True else False
                 ;[] 
                 }*)
   else  (* do {  print_int n
           ; print_newline()
           ; print_string "start="
           ; print_int start
           ; print_newline()
           ; if n=0 || compatible_all_words.(n) then print_string "True" else print_string "False"
           ; print_newline()
         ; *)  if compatible_all_words.(n)
            then let t=compatible_relations.(n) in
                 let p=if t=[] then [n] else t in
                 let l= List.append acc [([n],p)] in
                   get_initial_dag l start (n-1) 
            else get_initial_dag acc start (n-1) 
         (*} *)
;

(* we mark the nodes as root node (2) , leaf node(1) and intermediate node(3) *)
value rec populate_inout_rels length rel =match rel with
    [ [] -> ()
    | [Relationc(a,b1,b,c,d,e1,e,f)::xs] ->  do {
          (*print_string "inout_rels ="
          ; print_int b
          ; print_string "="
          ; print_int inout_rels.(b)
          ; print_string " "
          ; print_int e
          ; print_string "="
          ; print_int inout_rels.(e)
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


(*relsindag is a list of relation numbers in a given dag. 
the mapping function below returns the 5-tuple relation for each rel number in a dag.
So maprel contains the list of 5 tuples in a dag *)

value mycount relid maprel=
    loop 0 maprel
    where rec loop acc=fun
    [ [] ->  acc
    | [Relationc (a,b1,b,c,d,e1,e,f) :: r]  -> if c=relid
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

(* If samucciwa exists, there should be either same number of samucciwa Xyowakas or exactly one samucciwa xyowaka
   If there is no samucciwa, there should not be samucciwa xyowaka *)
    if (group_count > 0) then  
        if  (marker_count = 1 || marker_count = group_count+1) then True else False 
    else if marker_count = 0 then True else False
; 

value samucciwa_anyawara_constraint relations relsindag =
  let maprel=List.map (fun y -> List.nth relations (y-1) ) relsindag in
      let samu_c=mycount 32 maprel
      and sup_samu_c=mycount 33 maprel
      and samu_xyowaka_c=mycount 45 maprel
      and sup_samu_xyowaka_c=mycount 46 maprel
      and anya_c=mycount 34 maprel
      and sup_anya_c=mycount 35 maprel
      and anya_xyowaka_c=mycount 47 maprel
      and sup_anya_xyowaka_c=mycount 48 maprel in
       (*if*)
          ca_vA_compatibility sup_samu_c sup_samu_xyowaka_c
       && ca_vA_compatibility samu_c samu_xyowaka_c
       && ca_vA_compatibility sup_anya_c sup_anya_xyowaka_c
       && ca_vA_compatibility anya_c anya_xyowaka_c
       (*then do { print_string "SATRUE\n"; True} else do { print_string "SAFALSE\n"; False}*)
;

value rec seq_expectancy relations relsindag=
    let maprel=List.map (fun y -> List.nth relations (y-1) ) relsindag in
        loop maprel
        where rec loop=fun
            [ [] -> True (*do { print_string "True\n"; True}*)
            | [ Relationc (a,b1,b,r1,c,d1,d,dist1) :: rest] -> 
                 (*do { print_string "AAA\n"; print_sint a; print_sint b1; print_sint b;print_sint r1; print_sint c; print_sint d1; print_sint d; print_string "\n"; *)
                 match r1 with
                 [ 3 | 4 | 5 | 9 | 13 | 16 | 17 | 52 | 53 | 54 | 55 | (*56 | 57 | 60 |*) 76 |  77 |  (*79 | *) 80 |  42 | 41 | 68 | 69 | 12 |  97 | 32 | 33 | 34 | 35 | 45 | 46 | 47 | 48  | 202 | 203 -> 
(* relaxed condition for 56-57-60 yaxyapi-waWApi - kArya-kAraNA-BAva *)
                  loop1 maprel
                       where rec loop1=fun
                       [ [] -> False (* do { print_string "False\n"; False} *)
                       | [Relationc (x,y1,y,r2,z,t1,t,dist2)::rest1] -> 
                              if not(r1=r2) then
    			        (* do {
                                   print_string "r2=";print_int r2; print_string " ";
                                   print_string "r1=";print_int r1; print_string " ";
                                   print_int a; print_string " ";
                                   print_int b; print_string " ";
                                   print_int c; print_string " ";
                                   print_int d; print_string " ";
                                   print_int x; print_string " ";
                                   print_int y; print_string " ";
                                   print_int z; print_string " ";
                                   print_int t; print_string "\n" ; *)
                               if (z=a && t=b) then 
                                     if (r1 = 3 || r1 = 4 || r1 = 5) then if (r2 = 202 || r2 = 203 || r2 = 24) then loop rest else loop1 rest1 
                                     else if (r1 = 202 || r1 = 203) then if (r2 = 3 || r2 = 4 || r2 = 5) then loop rest else loop1 rest1 
                                     (* rAme vanam gacCawi sIwA anusarawi ; SAswra-sampAwe pravqwwe XanuH uxyamya pANdavaH ixam abravIw *)
                                     else if r1=53 then if r2=52 then loop rest else loop1 rest1
                                     else if r1=54 then if r2=55 then loop rest else loop1 rest1
                                     (*else if r1=60 then if (r2=56|| r2=57) then loop rest else loop1 rest1*)
                                     (* else if r1=92 then if r2=76 then loop rest else loop1 rest1  for sahArWaH sahArWa_xyowaka is not needed *)
                                     (* else if r1=93 then if r2=77 then loop rest else loop1 rest1   for vinArWaH vinArWaH_xyowaka is not needed *)
                                    (* else if r1=79 then if r2=80 then loop rest else loop1 rest1*)
                                     else if r1=41 then if r2=42 then loop rest else loop1 rest1
                                     else if r1=68 then if r2=69 then loop rest else loop1 rest1
                                     else if r1=12 then if r2=97 then loop rest else loop1 rest1
                                     else if r1=6 then if r2=9 then loop rest else loop1 rest1
                                     else loop1 rest1
                               else if (c=x && d=y) then
                                     if (r2 = 3 || r2 = 4 || r2 = 5) then if (r1 = 202 || r1 = 203 || r2 = 24) then loop rest else loop1 rest1 
                                     else if (r2 = 202 || r2 = 203) then if (r1 = 3 || r1 = 4 || r1 = 5) then loop rest else loop1 rest1 
                                     (* rAme vanam gacCawi sIwA anusarawi ; SAswra-sampAwe pravqwwe XanuH uxyamya pANdavaH ixam abravIw *)
                                     else if r1=52 then if r2=53 then loop rest else loop1 rest1
                                     else if r1=55 then if r2=54 then loop rest else loop1 rest1
                                     (*else if r1=56 then if r2=60 then loop rest else loop1 rest1
                                     else if r1=57 then if r2=60 then loop rest else loop1 rest1*)
                                     else if r1=76 then if r2=92 then loop rest else loop1 rest1
                                     else if r1=77 then if r2=93 then loop rest else loop1 rest1  
                                     else if r1=80 then if r2=79 then loop rest else loop1 rest1
                                     else if r1=42 then if r2=41 then loop rest else loop1 rest1
                                     else if r1=69 then if r2=68 then loop rest else loop1 rest1
                                     else if r1=97 then if r2=12 then loop rest else loop1 rest1
                                     else if r1=9 then if r2=6 then loop rest else loop1 rest1
                                     else loop1 rest1 
                               else if (c=z && d=t) then
                                     if r2=32 then if r1=45 then loop rest else loop1 rest1
                                     else if r1=32 then if r2=45 then loop rest else loop1 rest1
                                     else if r2=33 then if r1=46 then loop rest else loop1 rest1
                                     else if r1=33 then if r2=46 then loop rest else loop1 rest1
                                     else if r2=34 then if r1=47 then loop rest else loop1 rest1
                                     else if r1=34 then if r2=47 then loop rest else loop1 rest1
                                     else if r2=35 then if r1=48 then loop rest else loop1 rest1
                                     else if r1=35 then if r2=48 then loop rest else loop1 rest1
                                     else if r2=13 then if (r1=14 || r1=10) then loop rest else loop1 rest1
                                     else if r1=13 then if (r2=14 || r2=10) then loop rest else loop1 rest1
                                     else if r2=17 then if r1=15 then loop rest else loop1 rest1
                                     else if r1=17 then if r1=15 then loop rest else loop1 rest1
                                     else if r2=16 then if r1=15 then loop rest else loop1 rest1
                                     else if r1=16 then if r2=15 then loop rest else loop1 rest1
                                     else if r1=9 then if r2=36 && a > x then loop rest else loop1 rest1 (* viXeya viSeRaNa should always be to the right of viSeRaNa *)
                                     else if r2=9 then if r1=36 && x > a then loop rest else loop1 rest1
                                     else if r1=92 then if (r2=7 || r2 = 14 || r2 = 18) then loop rest else loop1 rest1 (*If there is sahArWa, then there should be either karwA,karma or karaNa relation *)
                                     else if r2=92 then if (r1=7 || r1 = 14 || r1 = 18) then loop rest else loop1 rest1 (*If there is sahArWa, then there should be either karwA,karma or karaNa relation *)
                                     else loop1 rest1 
                                else loop1 rest1   (* } *)
                                else loop1 rest1
                       ]  (*}*)
               |_ -> loop rest
               ] (*}*)
            ]
;

(* Example: yaw-waw:
BuFjawe we wu aGam, pApAH ye pacanwi Awma-kAraNAw 
BuFjawe -> we  ->(102) ye <- pacanwi
*)

value global_compatible text_type relations relsindag =
let maprel=List.map (fun y -> List.nth relations (y-1) ) relsindag in
   loop maprel
   where rec loop=fun
   [ [] -> (* do { print_string "True";*) True
   | [ Relationc (a,b1,b,101,c,d1,d,dist1) :: rest]     (* niwya_sambanXaH *)
   | [ Relationc (a,b1,b,102,c,d1,d,dist1) :: rest] ->   (* niwya_sambanXaH1 *)
                  (*do { print_string "101/102 "; print_int a; print_int b; print_int c; print_string "==>"; *) 
                  loop1 maprel
                  where rec loop1=fun
                     [ [] ->  False (*  do { print_string "failed case 13"; False} *)
                     | [Relationc (x,y1,y,r1,z,t1,t,dist1)::rest1] -> 
                       (* yaw word  2 incoming arrows *)
                       if    x=a && y=b && not (r1=101) && not (r1=102)
                       then (*do { print_string "yaw case ";*) loop2 maprel
                          where rec loop2=fun
                          [ [] -> (*False*) do { print_string "failed case 14"; False}
                          | [Relationc (m,n1,n,r2,o,p,p1,dist2)::rest2] ->  (* waw word *)
                               if    m=c && n=d && not (r2=101) && not (r2=102) && not(o=z && p=t)
                               then loop rest
                               else loop2 rest2
                          ] (*}*)
                       else if  x=c && y=d && not (r1=101) && not (r1=102) (* waw case *)
                       then (*do { print_string "waw case ";*) loop3 maprel
                          where rec loop3=fun
                          [ [] ->  (*False*)  do { print_int r1; print_int x; print_int z; print_string " failed case 15 "; False} 
                          | [Relationc (m,n1,n,r3,o,p1,p,dist2)::rest3] ->  (*yaw word*)
		   	      (*do {print_int r3; print_string " ";print_int m; print_int n; print_string " ";print_int o; print_string "-"; *)
                              (*if    o=a && p=b && not (r3=101) && not (r3=102)*)
                              if    m=a && n=b && not (r3=101) && not (r3=102) 
                                 && not(o=z && p=t)  (*both yaw and waw should not be related t the same verb *)
                              (* then do { print_int r3; print_int m; print_int o; print_string "#";loop rest}*)
                              then loop rest
                              else loop3 rest3 (*}*)
                          ] (*}*)
                       else loop1 rest1
                     ] (*}*)
   | [ Relationc (a,b1,b,r1,c,d1,d,dist1) :: rest] ->
	 (*do { print_string "BBB\n"; print_sint a; print_sint b1; print_sint b; print_sint r1; print_sint c; print_sint d1; print_sint d; print_string "\n";*)
         if r1=9 || (r1 >= 4400 && r1 < 4500) then
                               (* viXeya_viSeRaNam, karwA *)
                               (* karwA, karwA_upa *)
         loop1 maprel
         where rec loop1=fun
                          [ [] -> (* False *)   do { print_string "failed case 5\n"; False}
                          | [Relationc (x,y1,y,r,z,t1,t,dist1)::rest1] -> 
                                                  (*do {
                                                  print_int r; print_string "\n";
                                                  print_int r1; print_string "\n";*)
                               if not ((r=r1) && (x=a) && (y=b) && (z=c) && (t=d))
                               then if (x=c && y=d && (r1 / 100=44 && r=6))
                                 || (x=c && y=d && r=6 && r1=9) (* && (a-x) > 0   removed, since viXeya_viSeRaNam can be to the left. For example samraWaH aswi janaH *)
                                 || (x=c && y=d && r=25 && r1=9)  (* viXeya_viSeRaNam and pUrvakAlaH *)
                               then  loop rest
                               else  loop1 rest1
                               else  loop1 rest1
                          ]

(* For every upapaxa relation there should be another non-upapaxa relation *)
          else if ( r1 >= 2000  && r1 < 4000 ) then
          loop1 maprel
          where rec loop1=fun
                          [ [] -> do { print_string "failed case 6\n"; False}
                          | [Relationc (x,y1,y,r,z,t1,t,dist1)::rest1] -> 
                            if (r>= 4000)  && (r < 5000) 
                                 && ((z=a && t=b) || (x=c && y=d))
                            then loop rest
                            else loop1 rest1
                          ] 
          else if ( r1 >= 4000)  && (r1 < 5000) then
          loop1 maprel
          where rec loop1=fun
                  [ [] -> (*do { print_string "Failed case 7\n";*) False (*} *)
                          | [Relationc (x,y1,y,r,z,t1,t,dist1)::rest1] -> 
                            if  (r < 4000 && r >= 2000) && ((z=a && t=b) || (x=c && y=d) )
                            then loop rest 
                            else loop1 rest1
                          ] 
         else loop rest  (*}*)
   ]
;

value print_pair (a,b) =
  do {print_int a; print_string " "; print_int b; print_string "\n";}
;

value rec build_list rels acc dag = 
    let maprel=List.map (fun a -> List.nth rels (a-1) ) dag in
    loop [] maprel
    where rec loop acc=fun 
    [ [] -> (*do { List.iter print_pair acc;*) acc
    | [ Relationc (a,b1,b,r,c,d1,d,dist1) :: rest] -> let acc1= [(a,b1,c,d1) :: acc]
					  (*in build_list rels acc1 rest*)
					  in loop acc1 rest
    ]
;

value rec chk_cycles key_list v v1 acc =
    (*do { List.iter print_sint key_list;
        print_string "v=";print_int v; print_string "\n";*)
     let acc1=List.filter (fun (k,k1,v,v1) -> if k=v  && k1 = v1 then True else False) acc in
     if acc1=[] then False else loop acc1
     where rec loop=fun
     [[] -> (*do { print_string "chk cycle = False";*) False (*}*)
     | [(k,k1,v,v1)::r] -> do {
		       print_int k; print_string " "; print_int k1; print_string " ";
		       print_int v; print_string " "; print_int v1; print_string "\n";
                    let key_list1= [(k,k1,v,v1) :: key_list] in
                       if List.mem (k,k1,v,v1) key_list then True
                       else if List.mem (v,v1,k,k1) key_list then True
                       else if chk_cycles key_list1 v v1 acc then True
		       else loop r 
		       }
     ]
  (*}*)
;

value no_cycles relations relsindag=(*do
    { List.iter print_sint relsindag; print_string "\n"; *)
      let acc=build_list relations [] relsindag in loop acc
      where rec loop=fun
      [ [] -> (*do { print_string "no cycle "; *) True (*}*)
      |[(k,k1,v,v1)::r] -> let key_list=[(k,k1,v,v1)] in
                         if not (chk_cycles key_list v v1 acc) then loop r else do { print_string "found cycle\n"; False}
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

value rec get_list_length acc rels = fun
  [ [] -> acc
  | [i :: r] ->  match List.nth rels (i-1) with
                 [ Relationc (a1,cb1,b1,rel,a2,cb2,b2,dist1) -> if rel > 102 && rel < 200 then get_list_length acc rels r else get_list_length (acc+1) rels r
                 ]
  ]
;

(*value rec merge_gONa_muKya_karma acc = fun
[  [] -> acc
| [a1,a,b1,b,c1,c,d1,d,e] :: s  -> let mod_c = if c=10 || c=11 then 14 else c in 
                        let acc1 = List.append [(a1,a,b1,b,mod_c,d1,d,e1,e)] acc in merge_gONa_muKya_karma acc1 s
]
;
*)

(* Get dag list of size n from the array of lists relations, where each list corresponds to a relation and associated dags with it. *)

value rec add_length_cost text_type rel acc = fun
   [ [] -> acc
   | [(a,b) :: tl ] -> let cost=add_cost text_type 0 rel a 
                       and len = get_list_length 0 rel a  in
                       let quad=(len, cost, a, b) in
                       let acc1= List.append [quad]  acc in 
                       add_length_cost text_type rel acc1 tl
   ]
;

value rec chk_global_comp text_type rel acc = fun
        [ [] -> acc
        | [(l,c,a,b) :: tl ] ->  (*  do {
                List.iter print_sint a; print_string " BEFORE\n"; *)
                    if samucciwa_anyawara_constraint rel a (*then do { print_string "SA";*)
                    && global_compatible text_type rel a (*then do { print_string "GC";*)
                    && seq_expectancy rel a (*then do { print_string "SE";*)
                    && no_cycles rel a (*then do {print_string "NC";*)
                    then  (*  List.iter print_sint a; print_string " AFTER\n"; *)
                         let acc1= List.append [(l,c,a)] acc in
                         chk_global_comp text_type rel acc1 tl  (*}*)
                    else     chk_global_comp text_type rel acc tl 
                    (*else do { print_string "nc"; chk_global_comp text_type rel acc tl }}
                    else do { print_string "se"; chk_global_comp text_type rel acc tl }}
                    else do { print_string "gc"; chk_global_comp text_type rel acc tl }}
                    else do { print_string "sa"; chk_global_comp text_type rel acc tl}*)
                    (*}*)
       ]
;

value rec construct_dags init final wrdb dags text_type max_soln rel=
   if ( final - init > 0 ) 
   then 
        let mid=(init + final) /2 in
         let dag1=construct_dags init mid wrdb dags text_type max_soln rel in
          let dag2=construct_dags (mid+1) final wrdb dags text_type max_soln rel in  (* do {
             print_int init; print_string " "
            ;print_int mid; print_string " "
            ;print_int final; print_newline()
            ;print_string "dag1= "
            ;print_acc_len_cost dag1
            ;print_string "dag2= "
            ;print_acc_len_cost dag2
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
            ; *) let dag3 =  if dag1 = dag2 then dag1 else cartesian_product_dags dag1 dag2 text_type rel in (* do { 
              print_string "dag3= "
             ;print_acc_len_cost dag3 
             ;*) let dag4=if (inout_rels.(init+1)=3 || init=mid || dag1=[])
             then List.sort_uniq compare_int (List.append dag2 dag3) else dag3 in 
             let dag5=if (inout_rels.(final+1)=3 || final=mid+1 || dag2=[])
             then List.sort_uniq compare_int (List.append dag1 dag4) else dag4 in (* do {
              print_string "dag5= "
            ; print_acc_len_cost dag5
            ;print_newline()
            ; *)  let dag8=if dag5=[] then List.sort_uniq compare_int (List.append dag1 dag2) else dag5 in  (*  do {
             print_string "dag8= "
            ; print_acc_len_cost dag8
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
            ; print_acc_len_cost dag8
            ; print_newline()
            ;*)  let dag9 = get_first max_soln (final-init-4) [] (List.sort comparecostlength1 (List.sort_uniq compare_int dag8)) in   (* do {
             print_string "dag9= "
            ; print_string "size of dag9="
            ; print_int (List.length dag9)
            ; print_newline()
            ; print_acc_len_cost dag9
            ; print_newline() 
            ; *)
            dag9
               (*} } } }*)
   else 
        if init=0 
        then (*do {
         print_string "calling get_initial"
         ; print_newline()
         ;print_int (List.length wrdb)
         ;print_int (List.nth wrdb init)
         ; print_newline()
         ;print_int (List.nth wrdb (init+1))
         ; print_newline()
         ; *) let dag = get_initial_dag [] 0 (List.nth wrdb 1) in
              let dag1 = add_length_cost text_type rel [] dag in dag1
        (*}*)
        else (*do{
        print_string "init = ";
        print_int init;
        print_string "  final = ";
        print_int final;
        print_string " Length wrdb "; 
        print_int (List.length wrdb); 
	print_string "\n"; *)
        if (init = 1) || (init < (List.length wrdb))
        then do { 
             let dag = get_initial_dag [] (List.nth wrdb (init-1)) (List.nth wrdb init) in
             let dag1 = add_length_cost text_type rel [] dag in dag1 
             }
        else []
;


(* To get the total number of words in the sentence
The input is a 8-tuple (a,b1,b,c,d,e1,e,f) with a and d the word numbers, c the relation

Old algo: So we find the largest among all a's and d's to get the total words.
The word numbers start with 1. So the largest word index gives the total words 

New algo: Now since we mark the relations between the compounds as well, we count the words with id and cid both.
Hence the algo is changed from largest -> wrd_count 
*)
(* largest : int * Relationc list -> int *)
(* Deprecated 
value rec largest rslt=fun
[ [] -> rslt
| [Relationc(a,b1,b,c,d,e1,e,f) :: r]  ->
         let intmd =
             if a > rslt
             then if a > d then a else d
             else if d > rslt then d else rslt
             in largest intmd r
]
;
*)

value rec wrd_count acc = fun
[ [] -> List.length acc 
| [Relationc(a,b1,b,c,d,e1,e,f) :: r]  -> 
	if  not (List.mem (a,b1) acc) 
        then let acc = List.append acc [(a,b1)] in
                    if not (List.mem (d,e1) acc) 
                    then let acc1 = List.append acc [(d,e1)] in wrd_count acc1 r
                    else wrd_count acc r
        else if not (List.mem (d,e1) acc) 
             then let acc1 = List.append acc [(d,e1)] in wrd_count acc1 r
             else wrd_count acc r
]
;


value rec wrd_boundaries acc rel_indx wrd_indx comp_indx = fun
[ [] ->  List.append acc  [rel_indx]
| [Relationc(a,b1,b,c,d,e1,e,f)::xs] as t -> (*  do {
        print_string "curr index="
        ;print_int a
        ;print_string " rel index="
        ;print_int rel_indx
        ;print_string " word index="
        ;print_int wrd_indx
        ;print_newline ()
        ;List.iter print_int acc
        ;print_newline ()
        ;*)     if a=wrd_indx 
                then if b1=comp_indx
                     then wrd_boundaries acc (rel_indx+1) wrd_indx comp_indx xs
                     else wrd_boundaries (List.append acc [rel_indx]) (rel_indx) wrd_indx (comp_indx+1) t
                else wrd_boundaries (List.append acc [rel_indx]) (rel_indx) (wrd_indx+1) 1 t
         (*} *)
]
;

(* rel_lst: 5 tuple (to_id,to_mid,rel,from_id,from_mid)
 * text_type: Prose / Sloka *)

(*value solver rel_lst text_type =
   get_rel_wrds rel_lst
;
*)

value solver rel_lst max_soln text_type =
  let total_wrds=( wrd_count [] rel_lst)  in do 
  { 				(*get_rel_wrds rel_lst;*)
     populate_compatible_lists text_type rel_lst total_wrds
    ;flush stdout
    							(* ; print_string "initialise inout_rels="
    								; print_int inout_rels.(1)
    								; print_newline()  *)
    ;populate_inout_rels (List.length rel_lst -1) rel_lst
    ;let wrdb=wrd_boundaries [0] 0 1 1 rel_lst in 				(* do {*)

    								(* List.iter print_int wrdb; *)
      let final=
         if List.length wrdb > total_wrds 
         then List.length wrdb-1 
         else (total_wrds-1) in 	(*			 do {
         				 print_string "final=";
      				  	   print_int final; *)
      let soln=construct_dags 0 final wrdb [] text_type max_soln rel_lst in 
						 (*do { 
                                                   print_string "final = "; print_int final;

     						 print_string "DAGS=" ;
     						print_acc_len_cost soln ;  *)
            let l = get_first max_soln (final-4) []  (List.sort comparecostlength1 soln) in
              (*soln in *) (*do { 
                                                print_string "DAGS=" ;
                                                print_acc_len_cost l ; *)
                     let l1 = chk_global_comp text_type rel_lst [] l in  (*do {
                                                print_string "DAGS1=" ;
                                                print_acc_len l1 ; 
						print_string "\n";*)
                     let collapsed_soln=lwg_and_collapse_all_solns text_type rel_lst l1 in
                     let uniq_collapsed_soln= get_first_n 0 [] (List.sort comparecostlength collapsed_soln) in do {
                       if (List.length uniq_collapsed_soln > 0)
                       then print_string "Total Complete Solutions=" 
                       else print_string "Total Partial Solutions="
                   ; print_int (List.length uniq_collapsed_soln)
                   ; print_newline ()
                   ; print_cost_soln_list 1 0 rel_lst uniq_collapsed_soln
                  } 
                (*}*)
           (*}*)
     (*}*)
 (*}*)
 (*}*)
 }
;

(*main()
;*)
