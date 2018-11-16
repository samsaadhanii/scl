(**************************************************************************)
(*                                                                        *)
(*                 The Zen Computational Linguistics Toolkit              *)
(*                                                                        *)
(*                              Gérard Huet                               *)
(*                                                                        *)
(* ©2003 Institut National de Recherche en Informatique et en Automatique *)
(**************************************************************************)

(*i module Test = struct i*)

open Word;

(* test for lexico *)
assert let w1=Ascii.encode "accelerateur" 
       and w2=Ascii.encode "acceleration"
       in lexico w1 w2 && lexico w1 w1;

(* test for diff/patch *)
assert let w1=Ascii.encode "accelerer" and w2=Ascii.encode "acceleration"
       in let d12 = diff w1 w2 and d21 = diff w2 w1
       in patch d12 w1 = w2 && patch d21 w2 = w1;

(*i end; i*)




