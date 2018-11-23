(**************************************************************************)
(*                                                                        *)
(*                 The Zen Computational Linguistics Toolkit              *)
(*                                                                        *)
(*                              Gérard Huet                               *)
(*                                                                        *)
(* ©2002 Institut National de Recherche en Informatique et en Automatique *)
(**************************************************************************)

(* Minimization of Lexical Maps. *)

module Minimap : functor (Map:sig type inflected; end) 
-> sig type inflected_map= Lexmap.lexmap (list Map.inflected);
       value minimize: inflected_map -> inflected_map; 
       value reset : unit -> unit; end;

