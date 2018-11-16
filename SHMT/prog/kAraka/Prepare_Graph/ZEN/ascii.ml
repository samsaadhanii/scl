(**************************************************************************)
(*                                                                        *)
(*                 The Zen Computational Linguistics Toolkit              *)
(*                                                                        *)
(*                              Gérard Huet                               *)
(*                                                                        *)
(* ©2003 Institut National de Recherche en Informatique et en Automatique *)
(**************************************************************************)

(* A very simple encoding scheme : ASCII *)

(*i module Ascii = struct i*)

(* [encode : string -> word] *)
(* [decode : word -> string] *)
value encode string = List.map int_of_char (List2.explode string)
and decode word = List2.implode (List.map char_of_int word)
;

(*i end; i*)
