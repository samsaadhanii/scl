(**************************************************************************)
(*                                                                        *)
(*                 The Zen Computational Linguistics Toolkit              *)
(*                                                                        *)
(*                              Gérard Huet                               *)
(*                                                                        *)
(* ©2007 Institut National de Recherche en Informatique et en Automatique *)
(**************************************************************************)

(*i Minimization of Lexical Trees as Lexical Dags by bottom-up hashing i*)

(*i module Mini = struct i*)
 
value hash_max = 9689 (* Mersenne 21 *) 
;
module Dag = Share.Share (struct type domain=Trie.trie; 
                                 value size=hash_max; end)
;

(* And now we compress a [trie] into a minimal dag using [share] by a simple 
bottom-up traversal, where the key is computed along by hashing.
For this we define a general bottom-up traversal function, which applies 
a parametric [lookup] function to every node and its associated key. *)

value hash0 = 1 (* linear hash-code parameters *)
and hash1 letter key sum = sum + letter*key
and hash b arcs = (abs (arcs + Gen.dirac b)) mod hash_max

(* Caution - [abs] is needed because possible integer overflow, since otherwise [mod] may 
   return a negative result, leading to error out-of-bound array at execution. *)
;
value traverse lookup = travel
 where rec travel = fun
  [ Trie.Trie (b,arcs) -> 
    let f (tries,span) (n,t) = 
       let (t0,k) = travel t in
       ([ (n,t0) :: tries ],hash1 n k span) in
    let (arcs0,span) = List.fold_left f ([],hash0) arcs in
    let key = hash b span in
    (lookup (Trie.Trie (b,List.rev arcs0)) key, key)
  ]
;

(* Now we make a dag from a trie by recognizing common subtries. *)
value compress = traverse Dag.share
;
value minimize trie = let (dag,_) = compress trie in dag
;
value reset = Dag.reset
;
(*i end; i*)
