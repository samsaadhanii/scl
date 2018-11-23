(**************************************************************************)
(*                                                                        *)
(*                 The Zen Computational Linguistics Toolkit              *)
(*                                                                        *)
(*                              Gérard Huet                               *)
(*                                                                        *)
(* ©2002 Institut National de Recherche en Informatique et en Automatique *)
(**************************************************************************)

(*i Minimization by memoization i*)

module Share (Algebra: sig type domain; value size: int; end) = struct

(* [Share] takes as argument a module [Algebra] providing
a type [domain] and an integer value [size], and it defines a
value [share] of the stated type. 
We assume that the elements from the domain are presented with an
integer key bounded by [Algebra.size]. 
That is, [share x k] will assume as precondition that
$0\leq k<Max$ with $Max=$[Algebra.size]. *)

(*i We assume that the elements from the domain have an integer key  
   with key a domain morphism : [x=y -> key(x)=key(y)]. 

   Remark: a non-morphism on (unit*unit) is given by:
   value s x = if x==(0,0) then 0 else 1   
   since s (0,0) = 1; i*)

(* We shall construct the sharing map with the help of a hash table, 
made up of buckets $(k,[e_1; e_2; ... e_n])$ where each element $e_i$
has key $k$. *)

type bucket = list Algebra.domain
;

(* A bucket stores a set e of elements of domain of a given key
   these sets are here implemented as lists 
   invariant : [e = [e_1; ... e_n]] with [e_i=e_j] only if [i=j]. 
   That is, a bucket consists of distinct elements. *)

(* The memory is a hash-table of a given size and of the right bucket type. *)
value memo = Array.make Algebra.size ([] : bucket)
;

(* Resetting the hash-table *)
value reset () = for i=0 to Algebra.size-1 do { memo.(i) := [] }
;

(* We shall use a service function [search], 
such that [search e l] returns the first [y]
in [l] such that [y=e] or or else raises the exception [Not_found].*)

(* Note [search e = List.find (fun x -> x=e)]. *)
value search e = searchrec 
  where rec searchrec = fun
   [ [] -> raise Not_found
   | [ x :: l ] -> if x=e then x else searchrec l
   ]
;

(* Now [share x k], where [k] is the key of [x], looks in k-th bucket [l]
(this is meaningful since we assume that the key fits in the size: 
[0<= k<Algebra.size]) and returns [y] in [l] such that [y=x] if it exists, 
and otherwise returns [x] memorized in the new [k]-th bucket [[ x :: e ]]. 
Since [share] is the only operation on buckets, 
we maintain that such [y] is unique in its bucket when it exists. *)

value share element key = (* assert [0 <= key < Algebra.size] *)
  let bucket = memo.(key) in
  try search element bucket with 
    [ Not_found -> do { memo.(key):=[ element :: bucket ]; element } ]
;

(* Instead of {\sl share} we could have used the name {\sl recall}, 
or {\sl memory}, since either we recall
a previously archived equal element, or else this element is archived for
future recall. It is an associative memory implemented with a hash-code. 
But the hash function is external to the memory, it is given as a key with 
each item . 

It is an interesting property of this modular design that
sharing and archiving are abstracted as a common notion. *)

(* {\bf Algorithm}.
   A recursive structure of type [domain] is {\sl fully shared} if any two 
   distinct subelements have different values.
   If such a structure is traversed in a bottom-up way with systematic 
   memoisation by [share], replacing systematically an element by its memoised 
   equal if possible, then it is reconstructed with full sharing.
   This only assumes that two equal elements have the same key. *)

(*i {\bf Remark }.
   The reconstruction may return an element not structurally equal to
   the traversed value, but congruent to it in some other way.
   For instance, we compress trees as equal dags in tries  but we shall 
   construct automata as shared graphs with reordering of successors 
   in the [build_fsm] morphism from tries to state spaces
   since [fold_left] reverses arcs in the construction of [deter]. i*)

end
;
