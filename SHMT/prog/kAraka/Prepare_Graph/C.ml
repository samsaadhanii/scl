open Pada_structure;

value multiple_relations_begin = 26 (* inclusive *)
;
value multiple_relations_end = 51 (* inclusive *)
;
value max_rels = 1000 (* Max relations in a sentence *)
;
value compatible_relations = Array.make max_rels []
;
value inout_rels = Array.make max_rels 0
;
value total_dags_so_far = ref 1
;

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

value intersection l1 l2 = if List.length l1 < List.length l2 
                           then List.filter (fun x -> (List.mem x l1)) l2
                           else List.filter (fun x -> (List.mem x l2)) l1 (* l1 intersection l2 *)
;

value print_relation r = match r with
 [ Relationc (i1,i2,i3,i4,i5)   -> do
    { print_string "("
    ; print_int (i1-1); print_string ","
    ; print_int (i2-1); print_string ","
    ; print_int i3; print_string ","
    ; print_int (i4-1); print_string ","
    ; print_int (i5-1); print_string ")\n"
    }
 ]
;

 value rec print_relation_list rel = fun
  [ [] -> ()
  | [ r :: l ] -> do
      { print_relation (List.nth rel (r-1))
      ; print_relation_list rel l
      }
  ]
;

value print_cost_soln (len,c,l) n count rel = do
  { if len > count
    then do { print_string "Solution:"
            ; print_int n; print_newline ()
            ; print_relation_list rel l
            ; print_string "Cost = "; print_int c
            ; print_string "\n\n"
            }
    else ()
  }
;

value rec print_cost_soln_list n count rel = fun
  [ [] -> ()
  | [ (len,a,l) :: r ] -> do
      { print_cost_soln (len,a,l) n count rel
      ; print_cost_soln_list (n+1) count rel r
      }
  ]
;

value between b a c =
  if (a < b && b < c) || (c < b && b < a) then True else False
;

value chk_compatible m1 m2 = match m1 with
    [ Relationc (to_id1,to_mid1,r1,from_id1,from_mid1) -> match m2 with
      [Relationc (to_id2,to_mid2,r2,from_id2,from_mid2) -> 
            (* Two morph analyses for a word *)
         if (to_id1=to_id2) && not (to_mid1=to_mid2) then False (* do { print_string "C1"; False} *)
         else if (to_id1=from_id2) && not (to_mid1=from_mid2) then False (* do { print_string "C2"; False} *)
         else if (from_id1=from_id2) && not (from_mid1=from_mid2) then False (* do { print_string "C3"; False} *)
         else if (from_id1=to_id2) && not (from_mid1=to_mid2) then False (* do { print_string "C4"; False} *)
         else if from_id2=to_id1 && not (from_mid2=to_mid1)
         then False
         else if from_id1=to_id2 && not (from_mid1=to_mid2)
         then False
         (* else if ((r1=2) || (r2 = 2)) (* niwya_sambanXaH *)
         then if (from_id2=to_id1 && from_mid2 = to_mid1 && to_id2 = from_id1 && to_id2 = from_id1) then False (* no self loop *)
         else if (from_id2=from_id1 && from_mid2 = from_mid1 && to_id2 = to_id1 && to_id2 = to_id1) then False (* no self loop *)
        else True (* in case of niwya sambanXa, following checking not required *) *)
            (* Two incoming arrows with diff labels *)
         else if (to_id1=to_id2) && (to_mid1=to_mid2) && not (r1=r2) 
&& not (r1=2) && not(r2=2) then False (* do { print_string "C5"; False} *)
            (* Two incoming arrows with same label from diff nodes , except samucciwam  now with samucciwa being serialised, there are no more two samucciwas from the same node *)
         else if (to_id1=to_id2) && (to_mid1=to_mid2) && (r1=r2) && not(r1=2) && not (from_id1=from_id2) then False (* do { print_string "C6"; False} *)
            (*incoming arrow and outgoing arrow from two diff morph ids *)
         else if (to_id1=from_id2) && not (to_mid1=from_mid2) then False (* do { print_string "C7"; False} *)
            (*incoming arrow and outgoing arrow from two diff morph ids *)
         else if (to_id2=from_id1) && not (to_mid2=from_mid1) then False (* do { print_string "C8"; False} *)
            (* Two outgoing arrows with same label *)
         else if (from_id1=from_id2) && (from_mid1=from_mid2) && (r1=r2)
              && (r1 < multiple_relations_begin  || r1 > multiple_relations_end )then False (* do { print_string "C9"; False} *)
            (* No cycles of length 2 *)
         else if  (from_id1 = to_id2) && (to_id1 = from_id2)
               && (from_mid1 = to_mid2) && (to_mid1 = from_mid2)
              then False (* do { print_string "C10"; False} *)
           (* Crossing edges not allowed except RaRTI and ViSeRaNa *)
         else if  (  (between to_id1 to_id2 from_id2
                     || between from_id1 to_id2 from_id2)
                   && (between to_id2 to_id1 from_id1
                     || between from_id2 to_id1 from_id1))
                && (* not (r1=32) && not (r1=33)  &&*) not (r1=2) && not(r1=53) && not (r2=53)
                && (* not (r2=32) && not (r2=33)  &&*) not (r2=2) then False (* do { print_string "C11"; print_relation m1; print_relation m2;False} *)
           (* If there is a vAkyakarma-xyowaka, then there can not be a karma *)
         else if (from_id1 = from_id2) && (from_mid1 = from_mid2)
              && r1 = 97 && (r2 = 10 || r2 = 11 || r2 = 12 || r2 = 13)
         then False (* do { print_string "C12"; False} *)
           (* If there is a karma, then there can not be a gONa or muKyakarma *)
         else if (from_id1 = from_id2) && (from_mid1 = from_mid2)
              && (  ((r2 = 10 || r2 = 11) && (r1 = 13))
                 || ((r1 = 10 || r1 = 11) && (r2 = 13)))
         then False (* do { print_string "C13"; False} *)
           (* For every prawiyogi, the other end should be either a sambandha
            or anuyogi *)
         else if (from_id1 = to_id2) && (from_mid1 = to_mid2)
                 &&  (  ((r1 = 3) && not (r2 = 44) && not (r2 = 28) && not(r2=2))
                     || ((r2 = 44) && not (r1 = 3) && not (r1 = 28) && not(r1=2)))
         then False (* do { print_string "C14"; False} *)
         else if (from_id2 = to_id1) && (from_mid2 = to_mid1)
                 && (  ((r2 = 3) && not (r1 = 44) && not (r1 = 28) && not(r1=2))
                    || ((r1 = 44) && not (r2 = 3) && not (r2 = 28) && not(r2=2)))
         then False (* do { print_string "C15"; False} *)
           (* For every vAkyakarma, there should be a vAkyakarmaxyowaka *)
         else if (from_id2 = to_id1) && (from_mid2 = to_mid1)
                 &&  (r1 = 97 && not (r2 = 12))
         then False (* do { print_string "C16"; False} *)
         else if (from_id1 = to_id2) && (from_mid1 = to_mid2)
                 &&  (r1 = 12 && not (r2 = 97))
         then False (* do { print_string "C16"; False} *)
           (* There can not be a samboXya of a verb, which is viSeRaNa/pUrvakAla etc. Only 'iwi' relation with such verbs are allowed. 
              samboXya = 52; vAkyakarama = 12 ; prawiyogi = 3*)
         else if (from_id2 = to_id1) && (from_mid2 = to_mid1)
                && (r2=52) && (r1=12) && not(r1=3)
         then False
         else if (from_id1 = to_id2) && (from_mid1 = to_mid2)
                && (r1=52) && not (r2=12) && not(r2=3)
         then False
         else if from_id2=to_id1 && from_mid2=to_mid1
                && r2=16 && r2=33 (* a RaRTI of a kriyAviSeRaNa is not allowed *)
         then False
         else if from_id1=to_id2 && from_mid1=to_mid2
                && r2=16 && r1=33 (* a RaRTI of a kriyAviSeRaNa is not allowed *)
         then False
         (* karwqsamAnAXikaraNa should be to the right of karwA *)
         else if (from_id2 = from_id1) && (from_mid2 = from_mid1)
                && (r2=7 && r1=8) && (to_id1 < to_id2)
         then False
         else if (from_id2 = from_id1) && (from_mid2 = from_mid1)
                && (r2=8 && r1=7) && (to_id2 < to_id1)
         then False
         (* karmasamAnAXikaraNa should be to the right of karma *)
         else if (from_id2 = from_id1) && (from_mid2 = from_mid1)
                && ((r2=10||r2=11||r2=13) && r1=9) && (to_id1 < to_id2)
         then False
         else if (from_id2 = from_id1) && (from_mid2 = from_mid1)
                && (r2=9 && (r1=10||r1=11||r1=13)) && (to_id2 < to_id1)
         then False
         else True
      ]
    ]
;

value rec add_cost acc rels = fun
  [ [] -> acc
  | (*[ (i,Relationc (a1,b1,rel,a2,b2)) :: r ] ->*)
    [i :: r] ->  match List.nth rels (i-1) with
       [ Relationc (a1,b1,rel,a2,b2) -> let res = 
            if rel=2 then 0
             (* Do not count niwya_sambanXaH *)
            else if a2 > a1 then rel * (a2-a1)
            else if rel=53 || rel=54 then rel * (a1-a2)
            else rel * (a1-a2) * 10 
             (* if the kaarakas are to the right, give penalty *)
        in add_cost (acc+res) rels r
       ]
  ]
;

(* Min cost, and largest length *)
value comparecostlength (l1,c1,_) (l2,c2,_) =
    if l1 = l2 then compare c1 c2 else compare l2 l1
;

value print_sint i = do
 { print_int i
 ; print_string ";"
 }
;


(* for every relation, prepare a list of compatible and non-compatible relations among the relations seen so far *)
(* populate_compatible_lists: Relationc list -> unit *)

value populate_compatible_lists rel = 
  let length = List.length rel -1 in do 
   { for i = 0 to length do
     { let reli = List.nth rel i in
       for j = i+1 to length do
        { let relj = List.nth rel j in
          if (chk_compatible reli relj)
          then compatible_relations.(i+1) := List.append [j+1] compatible_relations.(i+1)
          else ()
        }
     }
    
   ; for i = 0 to length do {
      compatible_relations.(i+1) := List.sort compare compatible_relations.(i+1) 
     (* ; print_string "compatible relations for "
     ; print_int i
     ; print_string " = "
     ; List.iter print_sint compatible_relations.(i+1)
     ; print_newline() *)
    }
  }
;

(* Needed only for debugging
*)
value rec print_acc = fun
[[] -> ()
|[(a,b)::xs] -> do { List.iter print_sint a; print_string " => "
                   ; List.iter print_sint b; print_string "\n"
                   ; print_acc xs
                   }
                   
]
;

(* value rec delete_small size acc = fun
[[] -> acc
|[(a,b)::xs] -> if (List.length a >= size)
                then delete_small size (List.append acc [(a,b)]) xs
                else delete_small size acc xs
]
; *)

value rec delete_small size acc = List.filter (fun (a,b) -> (List.length a >= size)) acc
;

(* Compatible_relations.(i) is empty if none of the following relations are incompatible with i, or i is the last relation, making the 'empty' ambiguous.
Instead of empty list, we produce the same relation *)

(* True if a is subset of b else False*)
value subset a b = List.for_all (fun i -> List.mem i b) a
;

value join_dags dag1 dag2 init final = 
(*if dag1 = [] then dag2 else 
   if dag2 = [] then dag1
   else *)  List.rev ( List.fold_left
      (fun x (a,b) ->
          List.fold_left
          ( fun y (c,d) ->  if subset c b then 
                              if not (a=c) then
                                let l1 = List.append a c 
                                and l2 = if b = [] then d
                                        else if d = [] then b
                                        else intersection b d 
                                in if ((List.length l1) > (final-init-2))
                                   then List.append [(l1,l2)] y else y
                              else y
                           else y
         ) x dag2
   ) [] dag1
 )
;

value rec get_initial_dag acc start n = 
   if n = start then 
                let dag = List.rev acc in
                  let dag1 = join_dags dag dag 0 0 in
                  if dag1 = [] then dag else List.append dag dag1
   else let t = compatible_relations.(n) in
        let p = if t = [] then [n] else t in
        let l = List.append acc [([n],p)] in
              get_initial_dag l start (n-1)
            
;

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
          ;*)if (inout_rels.(a) = 0) then inout_rels.(a) := 1
          else if (inout_rels.(a) = 2) then inout_rels.(a) := 3
          else ()
          ;if (inout_rels.(d) = 0) then inout_rels.(d) := 2
          else if (inout_rels.(d) = 1) then inout_rels.(d) := 3
          else ()
          ; populate_inout_rels length xs
          }
    ]
;

value rec construct_dags init final wrdb dags =  
   if ( final - init > 0 ) 
   then 
        let mid = (init + final) /2 in
        let dag1 = construct_dags init mid wrdb dags in
        let dag2 = construct_dags (mid+1) final wrdb dags in  do {
            print_int init; print_string " "
            ;print_int mid; print_string " "
            ;print_int final; print_newline()
            ;print_string "dag1= "
            ;print_acc dag1
            ;print_string "dag2= "
            ;print_acc dag2
            ; print_newline()
            ; print_string "init mid final = "
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
            ; let dag3 = join_dags dag1 dag2 init final in
             let dag4 = if ((inout_rels.(init+1) = 3 && init=mid)|| dag1 = [])
             then List.append dag2 dag3 else dag3 in
             let dag5 = if ((inout_rels.(final+1) = 3 && final=mid+1)|| dag2 = [])
             then List.append dag1 dag4 else dag4 in 
             let dag6 = if dag5 = [] then List.append dag1 dag2 else dag5 in do {
             print_string "dag6= "
            ; print_acc dag6
            ;print_newline()
            ; print_string "init mid final = "
            ; print_int init
            ; print_string " "
            ; print_int mid
            ; print_string " "
            ; print_int final
            ; print_newline()
            ; print_string "size of dag6 = "
            ; print_int (List.length dag6)
            ; print_newline()
            ; print_acc dag6
            ; print_newline()
            ; let dag7 = delete_small (final-init-1) dag6 in  do {
             print_string "dag7= "
            ; print_string "size of dag7 = "
            ; print_int (List.length dag7)
            ; print_newline()
            ; print_acc dag7
            ; print_newline() 
            ; dag7 
             } 
            }
            }
   else 
        if init = 0 
        then get_initial_dag [] 0 (List.nth wrdb init)
        (*else if init =1
        then get_initial_dag [] (List.nth wrdb (init-1)) (List.nth wrdb init) *)
        else if (init < List.length wrdb)
        then get_initial_dag [] (List.nth wrdb (init-1)) (List.nth wrdb init)
        else []
;

(*relsindag is a list of relation numbers in a given dag. 
the mapping function below returns the 5-tuple relation for each rel number in a dag.
So maprel contains the list of 5 tuples in a dag *)

value global_compatible relations relsindag = 
let maprel = List.map (fun y -> List.nth relations (y-1) ) relsindag in
    loop relations maprel
    where rec loop relations = fun
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
         loop1 relations maprel 
         where rec loop1 relations = fun
         [ [] -> False (* do {print_string "failed case 1"; False}*) (* if there is no sambanXa / anuyogI from the head *)
         | [Relationc (x,y,28,z,t)::rest1]  (* sambanXaH *)
         | [Relationc (x,y,2,z,t)::rest1] -> (* niwya_sambanXaH *)
                  if    (*(z=a && t=b) || *)
                        (x=c && y=d) 
                  then loop2 relations maprel 
                       where rec loop2 relations = fun
                  [ [] -> False (* do { print_string "failed case 2"; False}*) (* If no anuyogI from the head *)
                  | [Relationc (m,n,44,o,p)::rest2] ->  (* anuyogI *)
                        if    (z=m && t=n)
                              (* || (x=o && y=p)*)
                        then loop relations rest  (* prawiyogi,sambanXa,anuyogi sequence found *)
                        else loop2 relations rest2
                  | [Relationc (m,n,r,o,p)::rest2] -> 
                         loop2 relations rest2
                  ]
                  else loop1 relations rest1
         | [Relationc (x,y,44,z,t)::rest1] ->  (* anuyogI *)
                  if    (* (z=a && t=b) || *)
                        (x=c && y=d)
                  then loop relations rest  (* anuyogI-prawiyogI seq found *)
                  else loop1 relations rest1
         | [Relationc (x,y,r,z,t)::rest1] ->
                  loop1 relations rest1
         ]
     (* anuyogI, prawiyogI/sambanXa *)
   | [ Relationc (a,b,44,c,d) :: rest] ->  (* prawiyogI *)
         loop1 relations maprel 
         where rec loop1 relations = fun
                          [ [] -> False (* do { print_string "failed case 3"; False}*) (* sambanXa/anuyogi not found *)
                          | [Relationc (x,y,28,z,t)::rest1]  (* sambanXaH *)
                          | [Relationc (x,y,2,z,t)::rest1] -> (* niwya sambanXaH *)
                                   if  (z=a && t=b) 
                                      (* || (x=c && y=d) *)
                                   then loop2 relations maprel 
                                        where rec loop2 relations = fun
                                   [ [] -> False (* do { print_string "faiiled case 4"; False}*) (* prawiyoggi-sambanXa-anuyogi seq not found *)
                                   | [Relationc (m,n,3,o,p)::rest2] ->  (* anuyogI *)
                                         if  (*(z=m && t=n) || *)
                                             (x=o && y=p) 
                                         then loop relations rest 
                                         else loop2 relations rest2
                                   | [Relationc (m,n,r,o,p)::rest2] -> 
                                         loop2 relations rest2
                                   ]
                                   else loop1 relations rest1
                          | [Relationc (x,y,3,z,t)::rest1] ->  (* anuyogI *)
                                   if    (z=a && t=b) 
                                     (* || (x=c && y=d)) *)
                                   then loop relations rest 
                                   else loop1 relations rest1
                          | [Relationc (x,y,r,z,t)::rest1] ->
                                   loop1 relations rest1
                          ]
   | [ Relationc (a,b,2,c,d) :: rest] ->  
                  loop1 relations maprel 
                  where rec loop1 relations = fun
                     [ [] -> loop2 relations maprel 
                             where rec loop2 relations = fun
                             [ [] -> False (* do { print_string "failed case 13"; False} *)
                             | [Relationc (x,y,r1,z,t)::rest2] -> 
                                (* yaw case  2 incoming arrows *)
                               if    x=a && y=b && not (r1=2)
                               then loop relations rest
                               else loop2 relations rest2
                             ]
     (* With every niwya sambanXa there are two possibilities:
        i) niwya sambanXa is part of prawiyogi-niwya-sambanxa-anuyogi, in which case there can not be an incoming arrow into yaw 
       ii) niwya sambanXa is associated with yaw-waw, in which case there can not be anuyogI,prawiyogI but there is an incoming arrow into yaw *)
                     | [Relationc (x,y,r1,z,t)::rest1] -> 
                         if  (x=a && y=b && not(r1=2)) then  (* case of yaw-waw *)
                                   (* ensure there are no anuyogi/prawiyogis *)
                                   loop2 relations maprel
                                   where rec loop2 relations = fun
                                   [ [] ->  loop1 relations rest1
                                   | [Relationc (m,n,r,o,p)::rest2] -> 
                                         if    m=c && n=d && r=44 (* anuyyogI *)
                                         then False (* do { print_string "failed case 14";False}*)
                                         else if  m=a && n=b && r=3 (* prawiyogI *)
                                         then False (* do { print_string "failed case 15";False}*)
                                         else loop2 relations rest2
                                   ]
                         else if  z=a && t=b && r1=3 then (* prawiyogI *)
                                   loop2 relations maprel
                                   where rec loop2 relations = fun
                                   [ [] ->  False (* do { print_string "failed case 16"; False}*)
                                   | [Relationc (m,n,44,o,p)::rest2] ->  (* anuyogI *)
                                         if   (m=c && n=d)
                                         then loop3 relations maprel
                                              where rec loop3 relations = fun
                                              [ [] -> loop relations rest
                                              | [Relationc (i,j,r3,k,l)::rest3] ->  (* anuyogI *)
                                                    if  a=i && b=j && not(r3=3 || r3=2) then False (* do { print_string "failed case 17";  print_int i; print_int j; print_int r3; print_int k; print_int l;False} *)
                                                       (* there can not be an incoming arrow into yaw *)
                                                    else loop3 relations rest3
                                              ]
                                         else loop2 relations rest2
                                   | [Relationc (m,n,r,o,p)::rest2] ->
                                         if m=c && n=d then False (* do { print_string "failed_case 18"; False}*)  (* No incoming arrow into yaw *)
                                         else loop2 relations rest2
                                   ]
                         else loop1 relations rest1
                     ]
   | [ Relationc (a,b,r1,c,d) :: rest] ->  
         if r1=0 || r1=97 || r1=8 || r1=9 || r1=54 || r1=53 then
                               (* sahakAraka & upapaxaviBakwi *)
                               (* vAkyakarmaxyowaka, vAkyakarma *)
                               (* karwqsamAnAXikaraNam, karwA *)
                               (* karmasamAnAXikaraNam, karma *)
                               (* samucciwa / samuccayaxyowaka *)
         loop1 relations maprel 
         where rec loop1 relations = fun
                          [ [] -> False (* do { print_string "failed case 5"; False } *)
                          | [Relationc (x,y,r,z,t)::rest1] -> 
                            if     (z=a && t=b && ((r=1 && r1=0) || (r1=97 && r=12) || (r1=53 && r=54) || (r1=53 && r=53)))
                                || (z=c && t=d && ((r=7 && r1=8) || (r=13 && r1=9)))
                                || (x=c && y=d && r=53 && r1=54 )  (* samucciwa *)
                            then loop relations rest
                            else if  (z=a && t=b && r1=53 && r=28) (* samucciwa and sambanXa *)
                            then False
                            else loop1 relations rest1
                          ]
        else
         if r1=14 || r1=28 then
    (* prayojakakarwA & karwA both can not be present simultaneously *)
         loop1 relations maprel 
         where rec loop1 relations = fun
                          [ [] -> loop relations rest
                          | [Relationc (x,y,r,z,t)::rest1] -> 
                            if   (z=c && t=d && r1=14 && r=7) (* karwA *)
                              || (x=c && y=d && r1=28 && r=53) (* samucciwa & sambanXa *)
                            then False (* do { print_string "failed case 9"; False}*)
                            else loop1 relations rest1
                          ]
         else loop relations rest
   ]
;

(* Get dag list of size n from the array of lists relations, where each list corresponds to a relation and associated dags with it. *)

value rec get_dag_list rel acc = fun
   [ [] -> acc
   | [hd :: tl ] -> if global_compatible rel hd
                    then  
                         let cost = add_cost 0 rel hd in
                         let len  = List.length hd in
                         let triplet = (len, cost, hd) in
                         let res1 = List.append [triplet] acc in
                         get_dag_list rel res1 tl
                    else get_dag_list rel acc tl
  ]
;

(* To get the total number of words in the sentence
The input is a quintuple (a,b,c,d,e) with a and d the word numbers, c the relation
So we find the largest among all a's and d's to get the total words.
The word numbers start with 1. So the largest word index gives the total words *)
(* largest : int * Relationc list -> int *)

value rec largest rslt = fun
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
[ [] -> List.append acc [rel_indx]
| [Relationc(a,b,c,d,e)::xs] as t ->  (* do {
        print_string "curr index = "
        ;print_int a
        ;print_string " rel index = "
        ;print_int rel_indx
        ;print_string " word index = "
        ;print_int wrd_indx
        ;print_newline ()
        ;List.iter print_int acc
        ;print_newline ()
        ; *) if a = wrd_indx then
              (* if not (c = 2 )
              then  *) wrd_boundaries acc (rel_indx+1) wrd_indx xs
              (* else  wrd_boundaries (List.append acc [rel_indx]) (rel_indx+1) (wrd_indx) xs  *)
             else wrd_boundaries (List.append acc [rel_indx]) (rel_indx) (wrd_indx+1) t
        (* } *)
]
;

value constraint_solver relations =
  let total_wrds = (largest 0 relations) in do
  { populate_compatible_lists relations
    (*; print_string "initialise inout_rels = "
    ; print_int inout_rels.(1)
    ; print_newline()*)
    ;populate_inout_rels (List.length relations -1) relations
    ; let wrdb = wrd_boundaries [] 0 1 relations in do {
    (*List.iter print_int wrdb;*)
    let final = 
         if List.length wrdb >= total_wrds 
         then (List.length wrdb -1) 
         else (total_wrds-1) in
    let dags = construct_dags 0 final wrdb [] in do {
     (*print_string "DAGS=" 
     ;print_acc dags 
     ;*)let dagsj = List.fold_left ( fun y (a,b) -> 
            if (List.length a = total_wrds-1) 
            then [a::y]
            else y) [] dags in 
    let soln =  List.sort comparecostlength (get_dag_list relations [] dagsj) in do
       { print_string "1.minion\n"
       ; let l = List.filter 
              (fun (x,y,z) -> if x = total_wrds-1 then True else False ) 
              soln in
              if (List.length l > 0)
              then do
              { print_string "Total dags = "
              ; print_int total_dags_so_far.val
              ; print_newline ()
              ; print_string "Total Complete Solutions="
              ; print_int (List.length l)
              ; print_newline ()
              ; print_cost_soln_list 1 (total_wrds-2) relations soln
              }
              else do
              { print_string "Total Partial Solutions="
              ;let psols = (List.length soln - List.length l)
               in print_int psols
              ; print_newline ()
              ; print_cost_soln_list 1 0 relations soln
              }
   } 
 }
 }
 }
;
