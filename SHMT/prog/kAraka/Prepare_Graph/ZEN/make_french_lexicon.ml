(**************************************************************************)
(*                                                                        *)
(*                 The Zen Computational Linguistics Toolkit              *)
(*                                                                        *)
(*                              Gérard Huet                               *)
(*                                                                        *)
(* ©2003 Institut National de Recherche en Informatique et en Automatique *)
(**************************************************************************)

(*i Module Make_french_lexicon; 
    Use: make_french_lexicon < french.lst > french.rem i*)

(* French words, using Latin encoding. *)

(*i *)
open Make_lex; 
(* i*)

module Make_lexicon = Make_lex Latin
;
Make_lexicon.trie_of_strings ()
;

(*i end; i*)
