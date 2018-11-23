(**************************************************************************)
(*                                                                        *)
(*                 The Zen Computational Linguistics Toolkit              *)
(*                                                                        *)
(*                              Gérard Huet                               *)
(*                                                                        *)
(* ©2003 Institut National de Recherche en Informatique et en Automatique *)
(**************************************************************************)

(*i Module Make_english_lexicon; 
    Use: make_english_lexicon < english.lst > english.rem i*)

(* English words, using ASCII encoding *)

open Make_lex
;
module Make_lexicon = Make_lex Ascii
;
Make_lexicon.trie_of_strings ()
;
(*i end; i*)
