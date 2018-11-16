(**************************************************************************)
(*                                                                        *)
(*                 The Zen Computational Linguistics Toolkit              *)
(*                                                                        *)
(*                              Gérard Huet                               *)
(*                                                                        *)
(* ©2006 Institut National de Recherche en Informatique et en Automatique *)
(**************************************************************************)

(*i module Transducer = struct i*)

(*i *)
open Zen_lexer; (* open before PreCast *)
open Camlp4.PreCast; (* MakeGram Loc *)
(* i*)

module Gram = MakeGram Zen_lexer; 

open Zen_lexer.Token;

value transducer trad t =
  try Gram.parse_string trad Loc.ghost t
  with
  [ Loc.Exc_located loc e -> do
     { print_string "\n\n%!"
     ; Format.eprintf "In string \"%s\", at location %a:@." 
                      t Loc.print loc 
     ; raise e
     } 
  ]
;

(* French with accents. *)
value french = Gram.Entry.mk "french encoding"
;
value french_word = Gram.Entry.mk "french word encoding"
;
EXTEND Gram (* french to code *)
  french:
    [ [ LETTER "a"; "^" -> "â"
      | LETTER "a"; "`" -> "à"
      | LETTER "a" -> "a"
      | LETTER "e"; "'" -> "é"
      | LETTER "e"; "`" -> "è"
      | LETTER "e"; "^" -> "ê"
      | LETTER "e"; "\"" -> "ë"
      | LETTER "e" -> "e"
      | LETTER "i"; "^" -> "î"
      | LETTER "i"; "\"" -> "ï"
      | LETTER "i" -> "i"
      | LETTER "o"; "^" -> "ô"
      | LETTER "o" -> "o"
      | LETTER "u"; "`" -> "ù"
      | LETTER "u"; "^" -> "û"
      | LETTER "u"; "\"" -> "ü"
      | LETTER "y"; "\"" -> "y\"" (* oulipo *)
      | LETTER "u" -> "u"
      | LETTER "c"; "/"  -> "ç"
      | LETTER "c" -> "c"
      | "-" -> "-"
      | "." -> "."
      | "'" -> "'" (* aujourd'hui *)
      | l = LETTER -> l
      ] ];
  french_word:
    [ [ w = LIST0 french; `EOI -> String.concat "" w ] ];
END
;
value latin_of_string = transducer french_word
;

(*i end; i*)

