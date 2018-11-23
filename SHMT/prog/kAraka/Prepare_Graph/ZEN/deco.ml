(**************************************************************************)
(*                                                                        *)
(*                 The Zen Computational Linguistics Toolkit              *)
(*                                                                        *)
(*                              Gérard Huet                               *)
(*                                                                        *)
(* ©2002 Institut National de Recherche en Informatique et en Automatique *)
(**************************************************************************)

(*i Decorated Lexical Trees i*)

(*i module Deco = struct i*)

(* Same as [Trie], except that info carries a list.
   A [deco] associates to a [word] a non-empty list of attributes. *)

(* Tries storing decorated words. *)
type deco 'a = [ Deco of (list 'a * darcs 'a) ]
and darcs 'a = list (Word.letter * deco 'a)
;

(* Invariant: integers are in increasing order in darcs, no repetition. *)

 (* The zipper type is adapted in the obvious way, and algorithm [zip_up] is unchanged. *)

type zipd 'a = 
  [ Top 
  | Zip of ((list 'a) * (darcs 'a) * Word.letter * (darcs 'a) * (zipd 'a))
  ]
;

(* [zip_up : (zipd 'a) -> (deco 'a) -> (deco 'a)] *)
value rec zip_up z t = match z with
  [ Top -> t 
  | Zip (i,left,n,right,up) -> 
        zip_up up (Deco (i,List2.unstack left [ (n,t) :: right ]))
  ]
;

(* Function [trie_of] becomes [deco_of], taking as extra argument
the information associated with the singleton trie it constructs. *)
(* [deco_of i w] builds the filiform [deco] containing [w] with info [i]. *)

(* [deco_of : (list 'a) -> word -> (deco 'a)] *)
value deco_of i = decrec
  where rec decrec = fun
    [ [] -> Deco (i,[])  
    | [ n :: rest ] -> Deco ([],[ (n,decrec rest) ])
    ]
;

(* Note how the empty list [[]] codes absence of information.
We generalize algorithm [enter] into [add], which
unions new information to previous one: *)

(* [add : (deco 'a) -> word -> (list 'a) -> (deco 'a)] *)
value add deco word i = enter_edit Top deco word
  where rec enter_edit z d = fun
     [ [] -> match d with [ Deco (j,l) -> zip_up z (Deco (List2.union i j,l)) ]
     | [ n :: rest ] -> match d with 
         [ Deco (j,l) -> let (left,right) = List2.zip n l in
                         match right with
           [ [] -> zip_up (Zip (j,left,n,[],z)) (deco_of i rest) 
           | [ (m,u) :: r ] -> 
             if m=n then enter_edit (Zip (j,left,n,r,z)) u rest 
             else zip_up (Zip (j,left,n,right,z)) (deco_of i rest) 
           ]
         ]
     ]
;
(* [add1 : (deco 'a) -> word -> 'a -> (deco 'a)] *)
(* fast version, takes info as list with possible repetitions *)
value add1 deco word i = enter_edit Top deco word
  where rec enter_edit z d = fun
     [ [] -> match d with [ Deco (j,l) -> zip_up z (Deco ([ i :: j ],l)) ]
     | [ n :: rest ] -> match d with 
         [ Deco (j,l) -> let (left,right) = List2.zip n l in
                         match right with
           [ [] -> zip_up (Zip (j,left,n,[],z)) (deco_of [ i ] rest) 
           | [ (m,u) :: r ] -> 
             if m=n then enter_edit (Zip (j,left,n,r,z)) u rest 
             else zip_up (Zip (j,left,n,right,z)) (deco_of [ i ] rest) 
           ]
         ]
     ]
;
value empty = Deco ([],[])
;

(* Invariant: [contents] returns words in lexicographic order. *)
(* [contents : deco 'a -> list (word * list 'a)] *) 
(*i note: eta-expansion below necessary for polymorphism generalisation. i*)
value contents t = contents_prefix [] t
  where rec contents_prefix pref = fun
    [ Deco (i,l) -> 
      let down = let f l (n,t) = l @ (contents_prefix [ n :: pref ] t) in
                 List.fold_left f [] l in
      if i=[] then down else [ (Word.mirror pref,i) :: down ] 
    ]
;

(* [iter : (word -> 'a -> unit) -> (deco 'a) -> unit] *)
value iter f t = iter_prefix [] t
  where rec iter_prefix pref = fun
    [ Deco (i,l) -> do
       { List.iter (f (Word.mirror pref)) i (* no action if [i=[]] *)
       ; let phi (n,u) = iter_prefix [ n :: pref ] u in
         List.iter phi l
       } 
    ]
;

(* [iter : (word -> (list 'a) -> unit) -> (deco 'a) -> unit] *)
value iter_list f t = iter_prefix [] t
  where rec iter_prefix pref = fun
    [ Deco (i,l) -> do
       { f (Word.mirror pref) i 
       ; let phi (n,u) = iter_prefix [ n :: pref ] u in
         List.iter phi l
       } 
    ]
;

(* [fold : ('a -> word -> (list 'b) -> 'a) -> 'a -> (deco 'b) -> 'a] *)
value fold f x t = iter_prefix [] x t
  where rec iter_prefix pref x = fun
    [ Deco (i,l) ->
      let accu = if i=[] then x else (f x (Word.mirror pref) i)
      and g x (n,t) = iter_prefix [ n :: pref ] x t in
      List.fold_left g accu l 
    ]
;

(* [assoc : word -> (deco 'a) -> (list 'a)] *)
value rec assoc c = fun
  [ Deco (i,arcs) -> match c with
    [ [] -> i
    | [ n :: r ] -> try assoc r (List.assoc n arcs)
                    with [ Not_found -> [] ]
    ]
  ]
;

(* [next t] returns the first element of [deco t] with non-empty info. *)
value next t = next_rec [] t
  where rec next_rec pref = fun 
    [ Deco (i,arcs) -> 
      if i=[] then match arcs with
         [ [] -> raise (Failure "next_deco")
         | [ (n,u) :: _ ] -> next_rec [ n :: pref ] u
         ]                   
      else Word.mirror pref
    ]
;

(* [last t] returns the last element of [deco t]. *)
value last t = last_rec [] t
   where rec last_rec acc = fun
     [ Deco (i,l) -> match l with
       [ [] -> Word.mirror acc 
       | _ -> let (m,u) = List2.last l in
              last_rec [ m :: acc ] u
       ]
     ]
;

(* Now the forgetful functor: [forget_deco : (deco 'a) -> trie] *)
value rec forget_deco = fun
  [ Deco (i,l) -> 
    Trie.Trie (List2.non_empty i, List.map (fun (n,t) -> (n,forget_deco t)) l)
  ]
;
value trie_of = forget_deco
;
(*i end; i*)
