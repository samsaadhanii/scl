(**************************************************************************)
(*                                                                        *)
(*                 The Zen Computational Linguistics Toolkit              *)
(*                                                                        *)
(*                              Gérard Huet                               *)
(*                                                                        *)
(* ©2002 Institut National de Recherche en Informatique et en Automatique *)
(**************************************************************************)

(* Unshares a dag as a trie - pipe from stdin to stdout *)
(*i Make: make unshare.cmx; ocamlopt unshare.cmx -o unshare *)
(* Use: unshare <trie.rem >bigtrie.rem  i*)

module Unshare = struct

(*i *)
open Trie;
(* i*)

value rec copy = fun
  [ Trie.Trie (b,l) -> Trie.Trie (b,List.map copy1 l) ]
and copy1 (n,t) = (n,copy t);

value unshare () = 
  let shared = (input_value stdin : Trie.trie) in
  output_value stdout (copy shared);

unshare ();

end; 
