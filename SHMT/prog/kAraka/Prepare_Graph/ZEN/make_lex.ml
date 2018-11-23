(**************************************************************************)
(*                                                                        *)
(*                 The Zen Computational Linguistics Toolkit              *)
(*                                                                        *)
(*                              Gérard Huet                               *)
(*                                                                        *)
(* ©2002 Institut National de Recherche en Informatique et en Automatique *)
(**************************************************************************)

(* Trie lexicon building from text file containing lists of words *)

module Make_lex (Encoding: sig 
  value encode : string -> Word.word;
  value decode : Word.word -> string; end) = struct

value lexicon = ref Trie.empty
;
value trie_of_strings =
  let lexicon = ref Trie.empty in process_strings 
    where rec process_strings () =
       try while True do 
         { let str = read_line () in 
           lexicon.val:=Trie.enter lexicon.val (Encoding.encode str) 
         }
       with [ End_of_file -> output_value stdout lexicon.val 
            | Trie.Redundancy -> output_string stderr "Fatal error: duplicated word\n"
            ]
;
end
;

