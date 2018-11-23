(**************************************************************************)
(*                                                                        *)
(*                 The Zen Computational Linguistics Toolkit              *)
(*                                                                        *)
(*                              Gérard Huet                               *)
(*                                                                        *)
(* ©2002 Institut National de Recherche en Informatique et en Automatique *)
(**************************************************************************)

(*i Lexical Trees *)

(* module Trie = struct i*)

(* Tries store sparse sets of words sharing initial prefixes. *)

type trie = [ Trie of (bool * arcs) ]
and arcs = list (Word.letter * trie)
;

(* [Trie (b,l)] stores the empty word [[]] iff [b], and all the words of 
arcs in [l], while the arc [(n,t)] stores all words [[ n :: c ]] for [c] 
a word stored in [t]. 

Note that letters decorate the [arcs] of the [trie], not its nodes.
For instance, the trie storing the set of words 
[[[1]; [2]; [2; 2]; [2; 3]]] is represented as\\
[ Trie (False,[ (1,Trie (True,[]));
                (2,Trie (True,[ (2,Trie (True,[])); 
                                (3,Trie (True,[])) ])) ]) ].

This example exhibits one invariant of our representation, namely that the
integers in successive sibling nodes are in increasing order.
Thus a top-down left-to-right traversal of the [trie] lists its strings in
lexicographic order. The algorithms below maintain this invariant. 

{\bf Zippers as Trie contexts.} 

Let us show how to add words to a trie in a completely applicative way,
using the notion of a trie zipper.  *)

type zipper = 
  [ Top 
  | Zip of (bool * arcs * Word.letter * arcs * zipper)
  ] 
and edit_state = (zipper * trie)
;

(* An [edit_state] [(z,t0)] stores the editing context as a zipper [z] 
and the current subtrie [t0]. We replace this subtrie by a trie [t] by 
closing the zipper with [zip_up t z] as follows. *)

exception Redundancy
;

(* [zip_up : zipper -> trie -> trie] *)
value rec zip_up z t = match z with
  [ Top -> t 
  | Zip (b,left,n,right,up) -> 
    zip_up up (Trie (b,List2.unstack left [ (n,t) :: right ]))
  ]
; 

(* We need two auxiliary routines. The first one, [zip], was given in module 
   [List2]. Its name stems from the fact that it looks for an element in an 
   a-list while building an editing context in the spirit of a zipper, the
   role of [zip_up] being played by [unstack]. 
   The second routine, given a word [w], returns the singleton filiform trie 
   containing [w] as [trie_of w]. *)

(* [trie_of : word -> trie] *)
value rec trie_of = fun
  [ [] -> Trie (True,[])  
  | [ n :: rest ] -> Trie (False,[ (n,trie_of rest) ])
  ]
;

(* {\bf Insertion and lookup}. 

We are now ready to define the insertion algorithm: *)

(* [enter : trie -> word -> trie] *)
value enter trie = enter_edit (Top,trie)
  where rec enter_edit (z,t) = match t with 
    [ Trie (b,l) -> fun
      [ [] -> if b then raise Redundancy 
              else zip_up z (Trie (True,l)) 
      | [ n :: rest ] -> 
         let (left,right) = List2.zip n l in
         match right with
           [ [] -> zip_up (Zip (b,left,n,[],z)) (trie_of rest) 
           | [ (m,u) :: r ] -> 
             if m=n then enter_edit (Zip (b,left,n,r,z),u) rest 
             else zip_up (Zip (b,left,n,right,z)) (trie_of rest) 
           ]
      ]
    ]
;

(* [contents : trie -> list word] *) 
(* Note that [contents] lists words in lexicographic order. *)
(* It should be used only on small lexicons. *)
value contents = contents_prefix [] 
  where rec contents_prefix pref = fun
    [ Trie (b,l) -> 
      let down = let f l (n,t) = l @ (contents_prefix [ n :: pref ] t) in
                 List.fold_left f [] l in
      if b then [ (List.rev pref) :: down ] else down 
    ]
;

(* [mem : word -> trie -> bool] *)
value rec mem w = fun
  [ Trie (b,l) -> match w with
    [ [] -> b
    | [ n :: r ] -> try mem r (List.assoc n l) 
                    with [ Not_found -> False ]
    ]
  ]
;

(* Tries may be considered as deterministic finite state automata graphs for 
   accepting the (finite) language they represent. This remark is the basis 
   for many lexicon processing libraries. Actually, the [mem] algorithm may be
   seen as an interpreter for such an automaton, taking its state graph as its 
   trie argument, and its input tape as its word one. The boolean information 
   in a trie node indicates whether or not this node represents an accepting 
   state. These automata are not minimal, since while they share initial 
   equivalent states, there is no sharing of accepting paths, for which a 
   refinement of lexical trees into dags is necessary. We shall look at this 
   problem in the next section. First we give the rest of the [Trie] module. *)

value empty = Trie (False,[])
;

(* [next_trie] returns the first element of its [trie] argument. *)
value next_trie = next_rec [] 
  where rec next_rec acc = fun 
    [ Trie (b,l) -> 
      if b then List.rev acc
      else match l with
           [ [] -> failwith "next_trie"
           | [ (n,u) :: _ ] -> next_rec [ n :: acc ] u
           ]
    ]
;

(* [last_trie] returns the last element of its [trie] argument. *)
value last_trie = last_rec [] 
   where rec last_rec acc = fun
     [ Trie (b,l) -> match l with
       [ [] -> if b then List.rev acc else failwith "last_trie"
       | _ -> let (n,u) = List2.last l in
              last_rec [ n :: acc ] u
       ]
     ]
;

(* [size trie] is the number of words stored in [trie]. *)
value rec size = fun
  [ Trie (b,arcs) -> 
     let s = List.fold_left count 0 arcs
             where count n (_,t) = n+size t in
     s+Gen.dirac b
  ]
;

(* {\bf A [trie] iterator}\\ *)

(* [iter : (word -> unit) -> trie -> unit] *)
value iter f t = iter_prefix [] t
  where rec iter_prefix pref = fun
    [ Trie (b,arcs) -> do
       { if b then f (List.rev pref) else ()
       ; let phi (n,u) = iter_prefix [ n :: pref ] u in
         List.iter phi arcs
       } 
    ]
;

(*i end; i*)


