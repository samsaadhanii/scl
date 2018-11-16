(**************************************************************************)
(*                                                                        *)
(*                 The Zen Computational Linguistics Toolkit              *)
(*                                                                        *)
(*                              Gérard Huet                               *)
(*                                                                        *)
(* ©2002 Institut National de Recherche en Informatique et en Automatique *)
(**************************************************************************)

(*i Minimization of Lexical Trees as Lexical Dags by bottom-up hashing. i*)

(* For instance, we may dagify a [trie] value read on the standard input
stream with [minimize], and write the resulting dag on standard output
by calling [dagify()], with: *)

value rec dagify () =
  let lexicon = (input_value stdin : Trie.trie) in
  let dag = Mini.minimize lexicon in
  output_value stdout dag
;

(*i Main *)
dagify ()
;
(* i*)

