(**************************************************************************)
(*                                                                        *)
(*                 The Zen Computational Linguistics Toolkit              *)
(*                                                                        *)
(*                              Gérard Huet                               *)
(*                                                                        *)
(* ©2003 Institut National de Recherche en Informatique et en Automatique *)
(**************************************************************************)

(* The ISO-latin encoding scheme *)

(*i module Latin = struct i*)

(* [encode : string -> word] *)
(* [decode : word -> string] *)
value encode string = 
  let iso = Transducer.latin_of_string string in
  List.map int_of_char (List2.explode iso)
and decode word = List2.implode (List.map char_of_int word);

(*i end; i*)
