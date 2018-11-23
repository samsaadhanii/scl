(**************************************************************************)
(*                                                                        *)
(*                 The Zen Computational Linguistics Toolkit              *)
(*                                                                        *)
(*                              Gérard Huet                               *)
(*                                                                        *)
(* ©2002 Institut National de Recherche en Informatique et en Automatique *)
(**************************************************************************)

(*i Minimization of Lexical Maps i*)

module Minimap (Map:sig type inflected; end) = struct

(* Minimization of lexmaps of inflected forms as dags by bottom-up hashing. *)
(*i This specialisation of lexmaps for sharing is needed because functors
   do not accept polymorphic arguments at present. i*)

type inflected_map = Lexmap.lexmap (list Map.inflected); 

(* Use Mersenne 21 = 9689 for small dictionaries. *)  
value hash_max = 216091 (* Mersenne 31 *)
;
module Inflected = struct type domain=inflected_map; value size=hash_max; end
;
module Memo = Share.Share Inflected
;

(* Bottom-up traversal with lookup computing a [key < hash_max]. *)
value hash0 = 0
and hash1 letter key sum = sum + letter*key
(*i NB abs necessary because overflow of int creates negative modulo i*)
and hash i arcs = (abs (arcs + List.length i)) mod hash_max
;
value traverse_map lookup = travel 
 where rec travel = fun
  [ Deco.Deco (i,arcs) ->
    let f (tries,span) (n,t) = 
       let (t0,k) = travel t in
       ([ (n,t0) :: tries ],hash1 n k span) in
    let (arcs0,span) = List.fold_left f ([],hash0) arcs in
    let key = hash i span in
    (lookup (Deco.Deco (i,List.rev arcs0)) key, key)
  ]
;

(* Make a dag of [inflected_map] by recognizing common substructures. *)
value compress_map = traverse_map Memo.share
;
value minimize map = let (dag,_) = compress_map map in dag
;
value reset = Memo.reset
;
end;
