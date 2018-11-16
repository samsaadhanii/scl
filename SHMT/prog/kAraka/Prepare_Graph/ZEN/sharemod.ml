(**************************************************************************)
(*                                                                        *)
(*                 The Zen Computational Linguistics Toolkit              *)
(*                                                                        *)
(*                              Gérard Huet                               *)
(*                                                                        *)
(* ©2003 Institut National de Recherche en Informatique et en Automatique *)
(**************************************************************************)

(*i Minimizing modulo congruence i*)

module Sharemod (Quotient : sig type domain; 
                                value congr : domain -> domain -> bool; end) 
= struct

(* [Sharemod] takes as argument a module [Quotient] providing a type [domain] 
and a congruence [congr], and it defines a value [canon] mapping an element 
of the quotient to a canonical element. That is, we insure that 
[x=y (mod congr)] implies [canon x = canon y]. *)

value memo = ref ([] : list Quotient.domain);

(* We shall use a service function [search], such that [search e l] returns the
first [y] in [l] such that [y=e] or or else raises the exception [Not_found].*)

(* Note [search e = List.find (fun x -> congr x e)]. *)
value search e = searchrec 
  where rec searchrec = fun
    [ [] -> raise Not_found
    | [ x :: l ] -> if Quotient.congr x e then x else searchrec l
    ];

value canon element = 
  try search element memo.val with 
    [ Not_found -> do { memo.val:=[ element :: memo.val ]; element } ];

(* Note - this is very inefficient for quotients of large cardinality,
since we linearly search in a list of potentially all of its classes.
More efficient implementations come as refinements of this basic functor,
when more structure is known of the quotient, such as an ordering of its 
classes. Also note that the canonical element returned is the first one 
looked up, not necessarily the smallest one in size. Union-find algorithm
may be used if an ordering of the classes is known. *)

end;
