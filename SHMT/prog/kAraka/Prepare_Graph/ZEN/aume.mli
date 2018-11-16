(**************************************************************************)
(*                                                                        *)
(*                         The Zen/Aum Library                            *)
(*                                                                        *)
(*                              Gérard Huet                               *)
(*                                                                        *)
(* ©2005 Institut National de Recherche en Informatique et en Automatique *)
(**************************************************************************)

(* The auto structure: model with only External transitions, no output. *)

module Auto : sig

type transition = (Word.word * Word.word)
and choices = list transition;

(* An external transition [(w,v)] recognizes [w] on the input tape
   and jumps to the state of name [v] in the next phase automaton. *)

type auto = [ State of (deter * choices) ]
and deter = list (Word.letter * auto); 
   (* deter is the deterministic structure *)

(* State(d,c) is accepting iff c is not empty *)
end;

