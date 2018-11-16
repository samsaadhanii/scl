(**************************************************************************)
(*                                                                        *)
(*                 The Zen Computational Linguistics Toolkit              *)
(*                                                                        *)
(*                              Gérard Huet                               *)
(*                                                                        *)
(* ©2002 Institut National de Recherche en Informatique et en Automatique *)
(**************************************************************************)

(* This module contains various utilities of general use. *)

(*i module Gen = struct i*)

value dirac b = if b then 1 else 0
;
value optional f = fun [ None -> () | Some d -> f d ]
;
value active = fun [ None -> False | Some _ -> True ]
;

(* Dump value [v] on [file]. *)
value dump v file = 
  let cho = open_out file in do { output_value cho v; close_out cho }
;

(* Retrieve value dumped on [file]; its type should be given in a cast. *)
value gobble file = 
  let chi = open_in file in
  let v = input_value chi in do { close_in chi; v }
;

(* UNIX touch. *)
value touch file = close_out (open_out file)
;

value notify_error message = 
  do { output_string stderr message; flush stderr }
;
(*i end; i*)
