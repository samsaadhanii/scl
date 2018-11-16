(**************************************************************************)
(*                                                                        *)
(*                 The Zen Computational Linguistics Toolkit              *)
(*                                                                        *)
(*                              Gérard Huet                               *)
(*                                                                        *)
(* ©2003 Institut National de Recherche en Informatique et en Automatique *)
(**************************************************************************)

(* Printing a lexicon using ISO-latin encoding scheme *)

(*i module List_iso = struct i*)

value print_iso_latin chi cho =
   let lexicon = (input_value chi : Trie.trie) in
   let write_word w = do { output_string cho (Latin.decode w)
                         ; output_string cho "\n" 
                         } in
   Trie.iter write_word lexicon; 

print_iso_latin stdin stdout;

(*i end; i*)
