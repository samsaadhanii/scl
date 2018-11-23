(**************************************************************************)
(*                                                                        *)
(*                 The Zen Computational Linguistics Toolkit              *)
(*                                                                        *)
(*                              Gérard Huet                               *)
(*                                                                        *)
(* ©2002 Institut National de Recherche en Informatique et en Automatique *)
(**************************************************************************)

(*i Minimization of Ternary Trees as Ternary Dags by bottom-up hashing i*)

(*i module Minitertree = struct i*)
 
(* Similarly to [Mini] for tries, we may dagify ternary trees. *)

value hash_max = 9689 (* Mersenne 21 *) 
;
module Dag = Share.Share (struct type domain=Tertree.tree; 
                                 value size=hash_max; end)
;
value hash0 = 1 (* linear hash-code parameters *)
and hash1 letter key sum = sum + letter*key
and hash b arcsl k n arcsr = (arcsl + arcsr + n*k+ Gen.dirac b) mod hash_max;
(*i Caution - replace by (abs (...)) for very big tries to correct
   for int overflow, since mod may return a negative result, leading to
   error out-of-bound array at execution i*)

value leaff = Tertree.Leaf False 
and leaft = Tertree.Leaf True
;
value traverse lookup = travel
 where rec travel = fun
  [ Tertree.Tree(b,fl,n,t,fr) -> 
    let f (trees,span) (n,t) = 
       let (t0,k) = travel t in
       ([ (n,t0) :: trees ],hash1 n k span) in
    let (arcsl,spanl) = List.fold_left f ([],hash0) fl
    and (t1,k1) = travel t
    and (arcsr,spanr) = List.fold_left f ([],hash0) fr in
    let key = hash b spanl k1 n spanr in
    (lookup (Tertree.Tree(b,List.rev arcsl,n,t1,List.rev arcsr)) key, key)
  | Tertree.Leaf b -> if b then (leaft,1) else (leaff,0)
  ]
;

(* Now we make a dag from a trie by recognizing common subtries. *)
value compress = traverse Dag.share
;
value minimize tree = let (dag,_) = compress tree in dag
;
value rec dagify_tree () =
  let lexicon = (input_value stdin : Tertree.tree) in
  let dag = minimize lexicon in 
  output_value stdout dag
;
value reset = Dag.reset
;

(*i value ch = open_in "english.ter.rem";    
    value eng = (input_value ch : Tertree.tree); 
    value dag = Minitertree.minimize eng; 
    value cho = open_out "english.ter.min.rem";
    output_value cho dag; 
    close_out cho; i*)

(*i end; i*)
