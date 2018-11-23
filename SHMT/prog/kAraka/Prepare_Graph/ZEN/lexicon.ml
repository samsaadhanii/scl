(**************************************************************************)
(*                                                                        *)
(*                 The Zen Computational Linguistics Toolkit              *)
(*                                                                        *)
(*                              Gérard Huet                               *)
(*                                                                        *)
(* ©2002 Institut National de Recherche en Informatique et en Automatique *)
(**************************************************************************)

(*i Trie lexicon building for ascii words. i*)

(*i module Lexicon = struct i*)

(* [make_lex] raises [Redundancy] if duplicate elements in its argument. *)

(* [make_lex : list string -> trie] *)
value make_lex = 
  List.fold_left (fun lex c -> Trie.enter lex (Ascii.encode c)) Trie.empty
;

(* [strings_of : trie -> list string] *)
value strings_of t = List.map Ascii.decode (Trie.contents t)
;

(* [strings_of (make_lex l)] gives [l] in lexicographic order. *)
   
assert (strings_of (make_lex [ "a"; "b"; "ab" ]) = [ "a"; "ab"; "b" ])
;

(*i end; i*)

