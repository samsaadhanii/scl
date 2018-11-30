(**************************************************************************)
(*                                                                        *)
(*                     The Sanskrit Heritage Platform                     *)
(*                                                                        *)
(*                              Gérard Huet                               *)
(*                                                                        *)
(* ©2018 Institut National de Recherche en Informatique et en Automatique *)
(**************************************************************************)

(*i module Transduction = struct i*)

open Camlp4.PreCast; (* MakeGram Loc *)

module Gram = MakeGram Min_lexer 
;
open Min_lexer.Token
;
value transducer trad t =
  try Gram.parse_string trad Loc.ghost t with
  [ Loc.Exc_located loc e -> do
     { Format.eprintf "In string \"%s\", at location %a:@." t Loc.print loc 
     ; raise e
     } 
  ]
;  

(****************************************)
(* Roman with diacritics, TeX encoding  *)
(****************************************)
value tex = Gram.Entry.mk "skt to tex"
and tex_word = Gram.Entry.mk "skt to tex word"
;
EXTEND Gram (* skt to tex *)
  tex:
    [ [ "\""; LETTER "n" -> "\\.n" (* deprecated *)
      | LETTER "f" -> "\\.n" (* recommended *)
      | LETTER "F" -> "f" (* patch for latin *) 
      | "\""; LETTER "s" -> "\\'s" (* deprecated *)
      | LETTER "z" -> "\\'s" (* recommended *)
      | "\""; LETTER "S" -> "\\'S"
      | LETTER "Z" -> "\\'S"
      | "'"; LETTER "a" -> "\\'a"
      | "'"; LETTER "i" -> "{\\'\\i}"
      | "'"; LETTER "u" -> "\\'u"
      | "'"; LETTER "e" -> "\\'e"
      | "'"; LETTER "o" -> "\\'o"
      | LETTER "a"; LETTER "a"; "|"; LETTER "i" -> failwith "Unexpected phantom phoneme"
      | LETTER "a"; LETTER "a"; "|"; LETTER "u" -> failwith "Unexpected phantom phoneme"
      | LETTER "a"; LETTER "a"; "|"; LETTER "a" -> failwith "Unexpected phantom phoneme"
      | LETTER "a"; LETTER "a" -> "\\=a"
      | LETTER "a" -> "a"
      | LETTER "A"; LETTER "A" -> "\\=A"
      | LETTER "A" -> "A"
      | LETTER "i"; LETTER "i" -> "{\\=\\i}"
      | LETTER "i" -> "i"
      | LETTER "I"; LETTER "I" -> "\\=I"
      | LETTER "I" -> "I"
      | LETTER "u"; LETTER "u" -> "\\=u"
      | LETTER "u" -> "u"
      | LETTER "U"; LETTER "U" -> "\\=U"
      | LETTER "U" -> "U"
      | "~"; LETTER "n" -> "\\~n"
      | LETTER "l"; "~"; "~"  -> "\\~l" (* candrabindu *)
      | LETTER "y"; "~"; "~"  -> "\\~y" (* candrabindu *)
      | LETTER "v"; "~"; "~"  -> "\\~v" (* candrabindu *)
      | "+" -> "\\-" (* hyphenation hint *)
      | "$" -> "\\_" (* pra-uga *)
      | "_" -> "\\_" (* hiatus *)
      | "&" -> "\\&" (* reserved *)
      | "-" -> "-" (* prefix *)
      | "'" -> "'" (* avagraha *)
      | "."; "."; "." -> "..." (* ... *)
      | "."; LETTER "t" -> "{\\d t}" 
      | "."; LETTER "d" -> "{\\d d}" 
      | "."; LETTER "s" -> "{\\d s}" 
      | "."; LETTER "S" -> "{\\d S}" 
      | "."; LETTER "n" -> "{\\d n}" 
      | "."; LETTER "r"; LETTER "r" -> "{\\RR}" 
      | "."; LETTER "r" -> "{\\d r}" 
      | "."; LETTER "R" -> "{\\d R}" 
      | "."; LETTER "l"; LETTER "l" -> "{\\LL}" 
      | "."; LETTER "l" -> "{\\d l}" 
      | "."; LETTER "m" -> "{\\d m}" 
      | "."; LETTER "h" -> "{\\d h}" 
      | "."; LETTER "T" -> "{\\d T}" 
      | "."; LETTER "D" -> "{\\d D}" 
      | "#"; i = INT -> "\\(_{" ^ i ^ "}\\)" (* homonyms *)
      | i = LETTER -> i
      | i = INT -> i
    ] ];
  tex_word:
    [ [ w = LIST0 tex; `EOI -> String.concat "" w ] ];
END
;
value skt_to_tex = transducer tex_word
;
(*******************************************************************)
(* Roman with diacritics, HTML decimal encoding for Unicode points *)
(*******************************************************************)
value html_code = Gram.Entry.mk "skt to html code"
and html = Gram.Entry.mk "skt to html"
;
EXTEND Gram (* skt to HTML string *)
  html_code:
    [ [ "\""; LETTER "n" -> "&#7749;"
      | LETTER "f" -> "&#7749;"
      | LETTER "F" -> "f" (* patch for latin *)
      | "\""; LETTER "s" -> "&#347;"
      | LETTER "z" -> "&#347;"
      | "\""; LETTER "S" -> "&#346;"
      | LETTER "Z" -> "&#346;"
      | "\""; LETTER "m" -> "&#7745;" (* candrabindu as m with dot above *)
      | "'"; LETTER "a" -> "a" (* we lose accents *)
      | "'"; LETTER "i" -> "i"
      | "'"; LETTER "u" -> "u"
      | "'"; LETTER "e" -> "e"
      | "'"; LETTER "o" -> "o"
      | LETTER "a"; LETTER "a" -> "&#257;"
      | LETTER "a" -> "a"
      | LETTER "A"; LETTER "A" -> "&#256;"
      | LETTER "A" -> "A"
      | LETTER "i"; LETTER "i" -> "&#299;"
      | LETTER "i" -> "i"
      | LETTER "I"; LETTER "I" -> "&#298;"
      | LETTER "I" -> "I"
      | LETTER "u"; LETTER "u" -> "&#363;"
      | LETTER "u" -> "u"
      | LETTER "U"; LETTER "U" -> "&#362;"
      | LETTER "U" -> "U"
      | "~"; LETTER "n" -> "&#241;"
      | "~"; "~" -> "&#7745;" (* candrabindu  *)
      | "+" -> "" (* "\&#173;" = \&shy; cesure prints - *)
      | "$" -> "_" (* pra-uga *)
      | "_" -> "_" (* hiatus *)
      | "-" -> "-" (* prefix *)
      | "&" -> "&amp;" (* reserved *)
      | "'" -> "'" (* avagraha *)
      | "."; "."; "." -> "..." (* ... *)
      | "."; LETTER "t" -> "&#7789;"
      | "."; LETTER "d" -> "&#7693;"
      | "."; LETTER "s" -> "&#7779;"
      | "."; LETTER "S" -> "&#7778;"
      | "."; LETTER "n" -> "&#7751;"
      | "."; LETTER "r"; LETTER "r" -> "&#7773;"
      | "."; LETTER "r" -> "&#7771;"
      | "."; LETTER "R" -> "&#7770;"
      | "."; LETTER "l"; LETTER "l" -> "&#7737;"
      | "."; LETTER "l" -> "&#7735;"
      | "."; LETTER "m" -> "&#7747;"
      | "."; LETTER "h" -> "&#7717;"
      | "."; LETTER "T" -> "&#7788;"
      | "."; LETTER "D" -> "&#7692;"
      | "#"; i = INT -> "_" ^ i (* homonymy index *)
      | "|"; LETTER "a" -> "|a" (* phantom phoneme *a *)
      | "|"; LETTER "i" -> "|i" (* phantom phoneme *i *)
      | "|"; LETTER "u" -> "|u" (* phantom phoneme *u *)
      | "|"; LETTER "r" -> "|&#7771;" (* phantom phoneme *r *)
      | "["; "-"; "]" -> "[-]" (* amuissement *)
      | i = LETTER -> i 
      | i = INT -> i 
    ] ];
  html:
    [ [ w = LIST0 html_code; `EOI -> String.concat "" w ] ];
END
;
value skt_to_html = transducer html
;

(*******************************)
(* Inverse to [Cgi.decode_url] *)
(*******************************)
value url_letter = Gram.Entry.mk "skt to url letter"
and url = Gram.Entry.mk "skt to url"
;
(* Important: accents and avagraha are removed from the input stream *)
(* Should be isomorphic to [code_rawu] *)
EXTEND Gram (* skt to url *)
  url_letter:
    [ [ "\"" -> "%22"
      | "~" -> "%7E"
      | "#"; i = INT -> "%23" ^ i
      | "'" -> "" (* accents and avagraha hidden *)
(*    | "'" {\R} "%27" (* if preserved *) *)
      | "." -> "."
      | "+" -> "" (* "%2B" *)
      | "-" -> "-"
      | " " -> "+"
      | "_" -> "_"
      | "$" -> "%24"
(*i   | "&" {\R} "%26" (* unused *)
      | "%" {\R} "%25"
      | "#" {\R} "%23"
      | "@" {\R} "%40"
      | ":" {\R} "%3A"
      | ";" {\R} "%3B"
      | "?" {\R} "%3F"
      | "=" {\R} "%3D"
      | "/" {\R} "%2F"
      | "," {\R} "%2C" i*)
      | i = LETTER -> i 
    ] ];
  url:
    [ [ w = LIST0 url_letter; `EOI -> String.concat "" w ] ];
END
;
value encode_url = transducer url
;
(*************************************************)
(* Devanagari in Velthuis devnag transliteration *)
(*************************************************)
value dev = Gram.Entry.mk "dev symbol"
and dev_word = Gram.Entry.mk "dev word"
;
EXTEND Gram (* skt to devnag *)
  dev:
    [ [ "\""; LETTER "n" -> "\"n"
      | LETTER "f" -> "\"n"
      | "\""; LETTER "m" -> "/" (* candrabindu *)
      | "\""; LETTER "s" -> "\"s"
      | LETTER "z" -> "\"s"
      | "'"; LETTER "a" -> "a"
      | "'"; LETTER "i" -> "i"
      | "'"; LETTER "u" -> "u"
      | "'"; LETTER "e" -> "e"
      | "'"; LETTER "o" -> "o"
      | LETTER "a"; LETTER "a" -> "aa"
      | LETTER "a" -> "a"
      | LETTER "i"; LETTER "i" -> "ii"
      | LETTER "i" -> "i"
      | LETTER "u"; LETTER "u" -> "uu"
      | LETTER "u" -> "u"
      | "~"; LETTER "n" -> "~n"
      | "~"; "~" -> "/" (* candrabindu *)
      | "+" -> ""
      | "$" -> "$$" (* hiatus *) (* "{}" in devnag 1.6 *)
      | "-" -> "@" (* suffix *)
      | "'" -> ".a" (* avagraha *)
      | "."; LETTER "t" -> ".t" 
      | "."; LETTER "d" -> ".d" 
      | "."; LETTER "s" -> ".s" 
      | "."; LETTER "n" -> ".n" 
      | "."; LETTER "r"; LETTER "r" -> ".R"
      | "."; LETTER "r" -> ".r" 
      | "."; LETTER "l" -> ".l" 
      | "."; LETTER "m" -> ".m" 
      | "."; LETTER "h" -> ".h" 
      | "#"; INT -> "" (* homo index ignored *)
      | i = LETTER -> i
    ] ];
  dev_word:
    [ [ w = LIST0 dev; `EOI -> String.concat "" w ] ];
END
;
value skt_to_dev = transducer dev_word
;
(****************************************)
(* Greek and math symbols, TeX encoding *)
(****************************************)
value texmath = Gram.Entry.mk "math in tex"
and texmath_word = Gram.Entry.mk "math in tex word"
;
EXTEND Gram (* Greek and Math to TeX *)
  texmath:
    [ [ LETTER "a" -> "\\alpha"
      | LETTER "b" -> "\\beta"
      | LETTER "c" -> "\\gamma"
      | LETTER "C" -> "\\Gamma"
      | LETTER "d" -> "\\delta"
      | LETTER "D" -> "\\Delta"
      | LETTER "e" -> "\\epsilon"
      | LETTER "f" -> "\\phi"
      | LETTER "F" -> "\\Phi"
      | LETTER "g" -> "\\psi"
      | LETTER "G" -> "\\Psi"
      | LETTER "h" -> "\\theta"
      | LETTER "H" -> "\\Theta"
      | LETTER "i" -> "\\iota"
      | LETTER "k" -> "\\kappa"
      | LETTER "K" -> "{\\rm K}"
      | LETTER "l" -> "\\lambda"
      | LETTER "L" -> "\\Lambda"
      | LETTER "m" -> "\\mu"
      | LETTER "n" -> "\\nu"
      | LETTER "o" -> " o"
      | LETTER "O" -> "{\\rm O}"
      | LETTER "p" -> "\\pi"
      | LETTER "P" -> "\\Pi"
      | LETTER "q" -> "\\chi"
      | LETTER "r" -> "\\rho"
      | LETTER "s" -> "\\sigma"
      | LETTER "S" -> "\\Sigma"
      | LETTER "t" -> "\\tau"
      | LETTER "u" -> "\\upsilon"
      | LETTER "U" -> "\\Upsilon"
      | LETTER "v" -> "\\varsigma"
      | LETTER "w" -> "\\omega"
      | LETTER "W" -> "\\Omega"
      | LETTER "x" -> "\\xi"
      | LETTER "X" -> "\\Xi"
      | LETTER "y" -> "\\eta"
      | LETTER "z" -> "\\zeta"
      | LETTER "Z" -> "{\\rm Z}"
      | "*" -> "{\\times}"
      | "+" -> "+"
      | "@" -> "{}^{\\circ}" (* degree *)
      | "'" -> "'"
      | "|" -> "{\\mid}"
      | "!" -> "\\!"
      | "~" -> "{\\sim}"
(*i   | "^" -> "^" i*)
      | "=" -> "="
      | ","   -> ", "
      | i = INT -> i
    ] ];
  texmath_word:
    [ [ w = LIST0 texmath; `EOI -> String.concat "" w ] ];
END
;
value math_to_tex = transducer texmath_word
;
(*****************************************)
(* Greek and math symbols, HTML encoding *)
(*****************************************)
value htmlmath = Gram.Entry.mk "math in html"
and htmlmath_word = Gram.Entry.mk "math in html word"
;
EXTEND Gram (* greek and math to html *)
  htmlmath:
    [ [ LETTER "a" -> "&#945;" (* "\&alpha;"   *)
      | LETTER "b" -> "&#946;" (* "\&beta;"    *)
      | LETTER "c" -> "&#947;" (* "\&gamma;"   *)
      | LETTER "C" -> "&#915;" (* "\&Gamma;"   *)
      | LETTER "d" -> "&#948;" (* "\&delta;"   *)
      | LETTER "D" -> "&#916;" (* "\&Delta;"   *)
      | LETTER "e" -> "&#949;" (* "\&epsilon;" *)
      | LETTER "f" -> "&#966;" (* "\&phi;"     *)
      | LETTER "F" -> "&#934;" (* "\&Phi;"     *)
      | LETTER "g" -> "&#968;" (* "\&psi;"     *)
      | LETTER "G" -> "&#936;" (* "\&Psi;"     *)
      | LETTER "h" -> "&#952;" (* "\&theta;"   *)
      | LETTER "H" -> "&#920;" (* "\&Theta;"   *)
      | LETTER "i" -> "&#953;" (* "\&iota;"    *)
      | LETTER "k" -> "&#954;" (* "\&kappa;"   *)
      | LETTER "K" -> "&#922;" (* "\&Kappa;"   *)
      | LETTER "l" -> "&#955;" (* "\&lambda;"  *)
      | LETTER "L" -> "&#923;" (* "\&Lambda;"  *)
      | LETTER "m" -> "&#956;" (* "\&mu;"      *)
      | LETTER "n" -> "&#957;" (* "\&nu;"      *)
      | LETTER "o" -> "&#959;" (* "\&omicron;" *)
      | LETTER "O" -> "&#927;" (* "\&Omicron;" *)
      | LETTER "p" -> "&#960;" (* "\&pi;"      *)
      | LETTER "P" -> "&#960;" (* "\&Pi;"      *)
      | LETTER "q" -> "&#967;" (* "\&chi;"     *)
      | LETTER "r" -> "&#961;" (* "\&rho;"     *)
      | LETTER "s" -> "&#963;" (* "\&sigma;"   *)
      | LETTER "S" -> "&#931;" (* "\&Sigma;"   *)
      | LETTER "t" -> "&#964;" (* "\&tau;"     *)
      | LETTER "u" -> "&#965;" (* "\&upsilon;" *)
      | LETTER "U" -> "&#933;" (* "\&Upsilon;" *)
      | LETTER "v" -> "&#962;" (* "\&sigmaf"   *)
      | LETTER "w" -> "&#969;" (* "\&omega;"   *)
      | LETTER "W" -> "&#937;" (* "\&Omega;"   *)
      | LETTER "x" -> "&#958;" (* "\&xi;"      *)
      | LETTER "X" -> "&#926;" (* "\&Xi;"      *)
      | LETTER "y" -> "&#951;" (* "\&eta;"     *)
      | LETTER "z" -> "&#950;" (* "\&zeta;"    *)
      | LETTER "Z" -> "&#918;" (* "\&Zeta;"    *)
      | "*" -> "&#215;"        (* "\&times;"   *)
      | "+" -> "+"
      | "@" -> "&#176;"        (* "\&deg;"     *)
      | "'" -> "&#8242;"       (* "\&prime;"   *)
      | "|" -> "|"
      | "!" -> "!"
      | "~" -> "~" 
(*i   | "^" {\R} "^" i*)
      | "=" -> "="
      | "," -> ", "
      | i = INT -> i
    ] ];
  htmlmath_word:
    [ [ w = LIST0 htmlmath; `EOI -> String.concat "" w ] ];
END
;
value math_to_html = transducer htmlmath_word
;
(**********************************************************************)
(* Numeric code encoding, for devanagari sorting and other processing *)
(**********************************************************************)
value lower = Gram.Entry.mk "lower case as letter VH"
and word = Gram.Entry.mk "word VH"
and wx = Gram.Entry.mk "letter WX"
and wordwx = Gram.Entry.mk "word WX"
and kh = Gram.Entry.mk "letter KH"
and wordkh = Gram.Entry.mk "word KH"
and sl = Gram.Entry.mk "letter SL"
and wordsl = Gram.Entry.mk "word SL"
;
EXTEND Gram (* skt to nat *)
  lower: (* removes accents, keeps initial quote as avagraha *)
    [ [ LETTER "f" -> 21 
      | "\""; LETTER "n" -> 21 (* compat Velthuis *)
      | LETTER "z" -> 46 (* ziva *)
      | "\""; LETTER "s" -> 46 (* compat Velthuis *)
      | LETTER "G" -> 21 (* compat KH *)(* inconsistent with upper *)
      | LETTER "M" -> 14
      | LETTER "H" -> 16
      | LETTER "R" -> 7
      | LETTER "S" -> 47
      | "\""; LETTER "m" -> 15 (* compat Velthuis *)
      | "~"; "~" -> 15 (* candrabindu *)
      | "~"; LETTER "n" -> 26
(* OBS | "+"; c=lower -> c (* prevent hyphenation in TeX *) *)
      | "-" -> 0  (* notation for affixing *)
      | "+" -> -10 (* notation for compounding *) 
      | "&" -> -1 (* \& = alternate avagraha preserved - legacy *)
      | "_" -> 50 (* sentential hiatus *) 
      | "'"; LETTER "a"; LETTER "a" -> 2 (* accented vowels - accent is lost *)
      | "'"; LETTER "a"; LETTER "i" -> 11
      | "'"; LETTER "a"; LETTER "u" -> 13
      | "'"; LETTER "a"; "$" -> 1 (* pr'a-uga *) 
      | "'"; LETTER "a" -> 1 
      | "'"; LETTER "i" -> 3
      | "'"; LETTER "u" -> 5
      | "'"; LETTER "e" -> 10
      | "'"; LETTER "o"; "$" -> 12 (* g'o-agra *) 
      | "'"; LETTER "o" -> 12
      | "'" -> -1  (* avagraha *) 
      | "."; "."; "."; c=lower -> c
      | "."; LETTER "t"; LETTER "h" -> 28
      | "."; LETTER "t" -> 27
      | "."; LETTER "d"; LETTER "h" -> 30
      | "."; LETTER "d" -> 29
      | "."; LETTER "s" -> 47
      | "."; LETTER "n" -> 31
      | "."; LETTER "r"; LETTER "r" -> 8
      | "."; LETTER "r" -> 7
      | "."; LETTER "l" -> 9
      | "."; LETTER "m" -> 14
      | "."; LETTER "h" -> 16
      | ":" -> 16 (* alternate notation for vigraha *)
      | LETTER "a"; LETTER "a"; "|"; LETTER "a" -> -3 (* *a *)
      | LETTER "a"; LETTER "a"; "|"; LETTER "i" -> -4 (* *i *)  
      | LETTER "a"; LETTER "a"; "|"; LETTER "u" -> -5 (* *u *)
      | LETTER "a"; LETTER "a"; "|"; LETTER "A" -> -9 (* *a *)
      | LETTER "a"; LETTER "a"; "|"; LETTER "I" -> -7 (* *i *)
      | LETTER "a"; LETTER "a"; "|"; LETTER "U" -> -8 (* *u *)
      | LETTER "a"; LETTER "a"; "|"; LETTER "r" -> -6 (* *r *)
      | LETTER "a"; LETTER "a" -> 2
      | LETTER "a"; LETTER "i" -> 11
      | LETTER "a"; LETTER "u" -> 13
      | LETTER "a"; "$" -> 1 (* pra-ucya *) 
      | LETTER "a" -> 1
      | LETTER "i"; LETTER "i" -> 4
      | LETTER "i" -> 3
      | LETTER "u"; LETTER "u" -> 6
      | LETTER "u" -> 5
      | LETTER "e" -> 10
      | LETTER "o"; "$" -> 12 (* go-agraa *) 
      | LETTER "o" -> 12
      | LETTER "k"; LETTER "h" -> 18
      | LETTER "k" -> 17
      | LETTER "g"; LETTER "h" -> 20
      | LETTER "g" -> 19
      | LETTER "c"; LETTER "h" -> 23
      | LETTER "c" -> 22
      | LETTER "j"; LETTER "h" -> 25
      | LETTER "j" -> 24
      | LETTER "t"; LETTER "h" -> 33
      | LETTER "t" -> 32
      | LETTER "d"; LETTER "h" -> 35
      | LETTER "d" -> 34
      | LETTER "p"; LETTER "h" -> 38
      | LETTER "p" -> 37
      | LETTER "b"; LETTER "h" -> 40
      | LETTER "b" -> 39
      | LETTER "n" -> 36
      | LETTER "m" -> 41
      | LETTER "y" -> 42
      | LETTER "r" -> 43
      | LETTER "l" -> 44
      | LETTER "v" -> 45
      | LETTER "w" -> 45 (* alternate v rather than raising Stream error *)
      | LETTER "s" -> 48 
      | LETTER "h" -> 49
      | "#"; i = INT -> 50+int_of_string i (* 0 *) 
      | "["; "-"; "]" -> -2 (* amuissement *)
(*   Special codes 
     code 50 hiatus Canon.decode [50] = "_" 
     codes 51 to 59 - 9 homonymy indexes 
     code -1 -> "'" (* avagraha *)
     code -2 -> "[-]" (* amuissement *)
     code -3 -> "aa|a" (* sandhi of aa and a *)
     code -4 -> "aa|i" (* sandhi of aa and i *)
     code -5 -> "aa|u" (* sandhi of aa and u *)
     code -6 -> "aa|r" (* sandhi of aa and .r *)
     code -7 -> "aa|I" (* sandhi of aa and ii *)
     code -8 -> "aa|U" (* sandhi of aa and uu *)
     code -9 -> "aa|A" (* sandhi of aa and aa *)
     codes 101 to 149 reserved for upper case encodings in [Canon.decode_ref]
     codes 124, 149, 249 used for variants resp. j' of j 24 and h',h'' of h 49 
           in [Int_sandhi]  *)
    ] ];
  word:
    [ [ w = LIST0 lower; `EOI -> w ] ]; 
  wx:
    [ [ LETTER "a" -> 1
      | LETTER "A" -> 2 
      | LETTER "i" -> 3
      | LETTER "I" -> 4
      | LETTER "u" -> 5
      | LETTER "U" -> 6
      | LETTER "q" -> 7
      | LETTER "Q" -> 8
      | LETTER "L" -> 9
      | LETTER "e" -> 10
      | LETTER "E" -> 11
      | LETTER "o" -> 12
      | LETTER "O" -> 13 
      | LETTER "M" -> 14
      | LETTER "z" -> 15 (* candrabindu *)
      | LETTER "H" -> 16
      | LETTER "k" -> 17
      | LETTER "K" -> 18 
      | LETTER "g" -> 19
      | LETTER "G" -> 20 
      | LETTER "f" -> 21
      | LETTER "c" -> 22
      | LETTER "C" -> 23
      | LETTER "j" -> 24
      | LETTER "J" -> 25 
      | LETTER "F" -> 26
      | LETTER "t" -> 27 
      | LETTER "T" -> 28
      | LETTER "d" -> 29
      | LETTER "D" -> 30 
      | LETTER "N" -> 31 
      | LETTER "w" -> 32
      | LETTER "W" -> 33
      | LETTER "x" -> 34
      | LETTER "X" -> 35
      | LETTER "n" -> 36
      | LETTER "p" -> 37
      | LETTER "P" -> 38
      | LETTER "b" -> 39
      | LETTER "B" -> 40
      | LETTER "m" -> 41
      | LETTER "y" -> 42
      | LETTER "r" -> 43
      | LETTER "l" -> 44
      | LETTER "v" -> 45
      | LETTER "S" -> 46
      | LETTER "R" -> 47
      | LETTER "s" -> 48
      | LETTER "h" -> 49
     (* | "-" -> 0  (* notation for affixing *)  Commented by Amba *)
      | "+" -> -10 (* notation for compounding *)
      | "_" -> 50 (* sentential hiatus *)
      | LETTER "Z" -> -1 (* avagraha *)
     (* | "#"; i = INT -> 50+int_of_string i (* 0 *) Commented by Amba  *)
      | "-" -> 51 (* used in compounds to separate the components  AMBA *)
      | "#"; i = INT -> 51+int_of_string i (* 0  AMBA *)
      | i = INT -> 51+int_of_string i (* 0  AMBA *)

    ] ];
  wordwx:
    [ [ w = LIST0 wx; `EOI -> w ] ];
  kh:
    [ [ LETTER "A" -> 2 
      | LETTER "i" -> 3
      | LETTER "I" -> 4
      | LETTER "u" -> 5
      | LETTER "U" -> 6
      | LETTER "R"; LETTER "R" -> 8
      | LETTER "R" -> 7
      | LETTER "L" -> 9
      | LETTER "e" -> 10
      | LETTER "a";  LETTER "i" -> 11
      | LETTER "o" -> 12
      | LETTER "a";  LETTER "u" -> 13
      | LETTER "a" -> 1
      | LETTER "M" -> 14
        (* candrabindu absent *)
      | LETTER "H" -> 16
      | LETTER "k"; LETTER "h" -> 18
      | LETTER "k" -> 17
      | LETTER "g"; LETTER "h" -> 20
      | LETTER "g" -> 19
      | LETTER "G" -> 21
      | LETTER "c"; LETTER "h" -> 23
      | LETTER "c" -> 22
      | LETTER "j"; LETTER "h" -> 25
      | LETTER "j" -> 24
      | LETTER "J" -> 26
      | LETTER "T"; LETTER "h" -> 28
      | LETTER "T" -> 27 
      | LETTER "D"; LETTER "h" -> 30
      | LETTER "D" -> 29
      | LETTER "N" -> 31
      | LETTER "t"; LETTER "h" -> 33
      | LETTER "t" -> 32 
      | LETTER "d"; LETTER "h" -> 35
      | LETTER "d" -> 34
      | LETTER "n" -> 36
      | LETTER "p"; LETTER "h" -> 38
      | LETTER "p" -> 37
      | LETTER "b"; LETTER "h" -> 40
      | LETTER "b" -> 39
      | LETTER "m" -> 41
      | LETTER "y" -> 42
      | LETTER "r" -> 43
      | LETTER "l" -> 44
      | LETTER "v" -> 45
      | LETTER "z" -> 46
      | LETTER "S" -> 47
      | LETTER "s" -> 48
      | LETTER "h" -> 49
      | "'"  -> -1  (* avagraha *)
      | "-" -> 0  (* notation for affixing *)
      | "+" -> -10 (* notation for compounding *)
      | "_" -> 50 (* sentential hiatus *) 
      (* avagraha missing *)
      | "#"; i = INT -> 50+int_of_string i (* 0 *) 
    ] ];
  wordkh:
    [ [ w = LIST0 kh; `EOI -> w ] ];
  sl:
    [ [ LETTER "a" -> 1
      | LETTER "A" -> 2 
      | LETTER "i" -> 3
      | LETTER "I" -> 4
      | LETTER "u" -> 5
      | LETTER "U" -> 6
      | LETTER "f" -> 7
      | LETTER "F" -> 8
      | LETTER "x" -> 9
      | LETTER "e" -> 10
      | LETTER "E" -> 11
      | LETTER "o" -> 12
      | LETTER "O" -> 13
      | LETTER "M" -> 14
      | "~" -> 15
      | LETTER "H" -> 16
      | LETTER "k" -> 17
      | LETTER "K" -> 18
      | LETTER "g" -> 19
      | LETTER "G" -> 20
      | LETTER "N" -> 21
      | LETTER "c" -> 22
      | LETTER "C" -> 23
      | LETTER "j" -> 24
      | LETTER "J" -> 25
      | LETTER "Y" -> 26
      | LETTER "w" -> 27 
      | LETTER "W" -> 28
      | LETTER "q" -> 29
      | LETTER "Q" -> 30
      | LETTER "R" -> 31
      | LETTER "t" -> 32
      | LETTER "T" -> 33
      | LETTER "d" -> 34
      | LETTER "D" -> 35
      | LETTER "n" -> 36
      | LETTER "p" -> 37
      | LETTER "P" -> 38
      | LETTER "b" -> 39
      | LETTER "B" -> 40
      | LETTER "m" -> 41
      | LETTER "y" -> 42
      | LETTER "r" -> 43
      | LETTER "l" -> 44
      | LETTER "v" -> 45
      | LETTER "S" -> 46
      | LETTER "z" -> 47
      | LETTER "s" -> 48
      | LETTER "h" -> 49
      | "'"  -> -1 (* avagraha *)
      | "-" -> 0  (* notation for affixing *)
      | "+" -> -10 (* notation for compounding *)
      | "_" -> 50 (* sentential hiatus *) 
      | "#"; i = INT -> 50+int_of_string i (* 0 *) 
    ] ];
  wordsl:
    [ [ w = LIST0 sl; OPT "."; `EOI -> w ] ];
END
;
value code_raw s = (* VH transliteration *)
  try Gram.parse_string word Loc.ghost s
  with
  [ Loc.Exc_located loc e -> do
     { Format.eprintf "\nIn string \"%s\", at location %s :\n%!"
                      s (Loc.to_string loc)
     ; raise e
     } 
  ] 
and code_raw_WX s = 
  try Gram.parse_string wordwx Loc.ghost s
  with
  [ Loc.Exc_located loc e -> do
     { Format.eprintf "\nIn string \"%s\", at location %s :\n%!"
                      s (Loc.to_string loc)
     ; raise e
     } 
  ] 
and code_raw_KH s = 
  try Gram.parse_string wordkh Loc.ghost s
  with
  [ Loc.Exc_located loc e -> do
     { Format.eprintf "\nIn string \"%s\", at location %s :\n%!"
                      s (Loc.to_string loc)
     ; raise e
     } 
  ] 
and code_raw_SL s = 
  try Gram.parse_string wordsl Loc.ghost s
  with
  [ Loc.Exc_located loc e -> do
     { Format.eprintf "\nIn string \"%s\", at location %s :\n%!"
                      s (Loc.to_string loc)
     ; raise e
     } 
  ] 
;
(**************************************************************************)
(* The following gives codes to proper names, starting with upper letters *)
(**************************************************************************)
value upper_lower = Gram.Entry.mk "upper case"
and wordu = Gram.Entry.mk "wordu"
;
EXTEND Gram (* skt to nat *)
  upper_lower:
    [ [ "\""; LETTER "S" -> 146
      | LETTER "Z" -> 146
      | LETTER "A"; LETTER "A" -> 102
      | LETTER "A"; LETTER "i" -> 111
      | LETTER "A"; LETTER "u" -> 113
      | LETTER "A" -> 101
      | LETTER "I"; LETTER "I" -> 104
      | LETTER "I" -> 103
      | LETTER "U"; LETTER "U" -> 106
      | LETTER "U" -> 105
      | "."; LETTER "S" -> 147
      | "."; LETTER "R" -> 107
      | "."; LETTER "T"; LETTER "h" -> 128
      | "."; LETTER "T" -> 127
      | "."; LETTER "D"; LETTER "h" -> 130
      | "."; LETTER "D" -> 129
      | LETTER "E" -> 110
      | LETTER "O" -> 112
      | LETTER "K"; LETTER "h" -> 118
      | LETTER "K" -> 117
      | LETTER "G"; LETTER "h" -> 120
      | LETTER "G" -> 119
      | LETTER "C"; LETTER "h" -> 123
      | LETTER "C" -> 122
      | LETTER "J"; LETTER "h" -> 125
      | LETTER "J" -> 124
      | LETTER "T"; LETTER "h" -> 133
      | LETTER "T" -> 132
      | LETTER "D"; LETTER "h" -> 135
      | LETTER "D" -> 134
      | LETTER "N" -> 136
      | LETTER "P"; LETTER "h" -> 138
      | LETTER "P" -> 137
      | LETTER "B"; LETTER "h" -> 140
      | LETTER "B" -> 139
      | LETTER "M" -> 141
      | LETTER "Y" -> 142
      | LETTER "R" -> 143
      | LETTER "L" -> 144
      | LETTER "V" -> 145
      | LETTER "S" -> 148
      | LETTER "H" -> 149 
(* duplication with lower necessary in order to get proper sharing of prefix *)
      | "\""; LETTER "n" -> 21
      | LETTER "f" -> 21
      | "\""; LETTER "s" -> 46
      | LETTER "z" -> 46
      | "~"; LETTER "n" -> 26
      | "~"; "~" -> 15
      | "+"; c=upper_lower -> c
      | "-" -> 0
      | "_" -> 50 (* hiatus *)
      | "$"; c=upper_lower -> c (* word hiatus for VH trans pra-uga *)
      | "'"; c=upper_lower -> c
      | "."; "."; "."; c=upper_lower -> c
      | "."; LETTER "t"; LETTER "h" -> 28
      | "."; LETTER "t" -> 27
      | "."; LETTER "d"; LETTER "h" -> 30
      | "."; LETTER "d" -> 29
      | "."; LETTER "s" -> 47
      | "."; LETTER "n" -> 31
      | "."; LETTER "r"; LETTER "r" -> 8
      | "."; LETTER "r" -> 7
      | "."; LETTER "l" -> 9
      | "."; LETTER "m" -> 14
      | "."; LETTER "h" -> 16
      | LETTER "a"; LETTER "a" -> 2
      | LETTER "a"; LETTER "i" -> 11
      | LETTER "a"; LETTER "u" -> 13
      | LETTER "a" -> 1
      | LETTER "i"; LETTER "i" -> 4
      | LETTER "i" -> 3
      | LETTER "u"; LETTER "u" -> 6
      | LETTER "u" -> 5
      | LETTER "e" -> 10
      | LETTER "o" -> 12
      | LETTER "k"; LETTER "h" -> 18
      | LETTER "k" -> 17
      | LETTER "g"; LETTER "h" -> 20
      | LETTER "g" -> 19
      | LETTER "c"; LETTER "h" -> 23
      | LETTER "c" -> 22
      | LETTER "j"; LETTER "h" -> 25
      | LETTER "j" -> 24
      | LETTER "t"; LETTER "h" -> 33
      | LETTER "t" -> 32
      | LETTER "d"; LETTER "h" -> 35
      | LETTER "d" -> 34
      | LETTER "p"; LETTER "h" -> 38
      | LETTER "p" -> 37
      | LETTER "b"; LETTER "h" -> 40
      | LETTER "b" -> 39
      | LETTER "n" -> 36
      | LETTER "m" -> 41
      | LETTER "y" -> 42
      | LETTER "r" -> 43
      | LETTER "l" -> 44
      | LETTER "v" -> 45
      | LETTER "s" -> 48
      | LETTER "h" -> 49
      | "#"; i = INT -> 50+int_of_string i
    ] ];
  wordu:
    [ [ w = LIST0 upper_lower; `EOI -> w ] ];
END
;
(* Similar to [code_raw] but accepts upper letters. *)
value code_rawu s = 
  try Gram.parse_string wordu Loc.ghost s with
  [ Loc.Exc_located loc e -> do
     { Format.eprintf "\nIn string \"%s\", at location %s :\n%!"
                      s (Loc.to_string loc)
     ; raise e
     } 
  ] 
;

(******************************************************)
(* Simplified mapping for matching without diacritics *)
(******************************************************)
value simplified = Gram.Entry.mk "simplified"
and wordd = Gram.Entry.mk "wordd"
;
EXTEND Gram (* skt to nat *)
  simplified:
    [ [ "\""; LETTER "S" -> 148
      | LETTER "Z" -> 148
      | LETTER "A"; LETTER "A" -> 101
      | LETTER "A"; LETTER "i" -> 111
      | LETTER "A"; LETTER "u" -> 113
      | LETTER "A" -> 101
      | LETTER "I"; LETTER "I" -> 103
      | LETTER "I" -> 103
      | LETTER "U"; LETTER "U" -> 105
      | LETTER "U" -> 105
      | "."; LETTER "S" -> 148
      | "."; LETTER "R" -> 143
      | "."; LETTER "T"; LETTER "h" -> 132
      | "."; LETTER "T" -> 132
      | "."; LETTER "D"; LETTER "h" -> 134
      | "."; LETTER "D" -> 134
      | LETTER "E" -> 110
      | LETTER "O" -> 112
      | LETTER "K"; LETTER "h" -> 117
      | LETTER "K" -> 117
      | LETTER "G"; LETTER "h" -> 119
      | LETTER "G" -> 119
      | LETTER "C"; LETTER "h" -> 122
      | LETTER "C" -> 122
      | LETTER "J"; LETTER "h" -> 124
      | LETTER "J" -> 124
      | LETTER "T"; LETTER "h" -> 132
      | LETTER "T" -> 132
      | LETTER "D"; LETTER "h" -> 134
      | LETTER "D" -> 134
      | LETTER "N" -> 136
      | LETTER "P"; LETTER "h" -> 137
      | LETTER "P" -> 137
      | LETTER "B"; LETTER "h" -> 139
      | LETTER "B" -> 139
      | LETTER "M" -> 141
      | LETTER "Y" -> 142
      | LETTER "R" -> 143
      | LETTER "L" -> 144
      | LETTER "V" -> 145
      | LETTER "S"; LETTER "h" -> 148
      | LETTER "S" -> 148
      | LETTER "H" -> 149 
(* duplication with lower necessary in order to get proper sharing of prefix *)
      | "\""; LETTER "m" -> 15 
      | "\""; LETTER "n" -> 36
      | LETTER "f" -> 36
      | "\""; LETTER "s" -> 48
      | LETTER "z" -> 48
      | "~"; LETTER "n" -> 36
      | "~"; "~" -> 15
      | "+"; c=upper_lower -> c
      | "-" -> 0
      | "_" -> 50 (* hiatus *)
      | "$"; c=upper_lower -> c (* word hiatus for VH trans pra-uga *)
      | "'"; c=upper_lower -> c
      | "."; "."; "."; c=upper_lower -> c
      | "."; LETTER "t"; LETTER "h" -> 32
      | "."; LETTER "t" -> 32
      | "."; LETTER "d"; LETTER "h" -> 34
      | "."; LETTER "d" -> 34
      | "."; LETTER "s" -> 48
      | "."; LETTER "n" -> 36
      | "."; LETTER "r"; LETTER "r" -> 43
      | "."; LETTER "r" -> 43
      | "."; LETTER "l" -> 44
      | "."; LETTER "m" -> 41 
      | "."; LETTER "h" -> 49
      | LETTER "a"; LETTER "a" -> 1
      | LETTER "a"; LETTER "i" -> 11
      | LETTER "a"; LETTER "u" -> 13
      | LETTER "a" -> 1
      | LETTER "i"; LETTER "i" -> 3
      | LETTER "i" -> 3
      | LETTER "u"; LETTER "u" -> 5
      | LETTER "u" -> 5
      | LETTER "e" -> 10
      | LETTER "o"; LETTER "u" -> 5 (* Vishnou *)
      | LETTER "o" -> 12
      | LETTER "k"; LETTER "h" -> 17
      | LETTER "k" -> 17
      | LETTER "g"; LETTER "h" -> 19
      | LETTER "g" -> 19
      | LETTER "c"; LETTER "h" -> 48 (* Vichnou , Krichna *)
      | LETTER "c" -> 22
      | LETTER "j"; LETTER "h" -> 24
      | LETTER "j" -> 24
      | LETTER "t"; LETTER "h" -> 32
      | LETTER "t" -> 32
      | LETTER "d"; LETTER "h" -> 34
      | LETTER "d" -> 34
      | LETTER "p"; LETTER "h" -> 37
      | LETTER "p" -> 37
      | LETTER "b"; LETTER "h" -> 39
      | LETTER "b" -> 39
      | LETTER "n" -> 36
      | LETTER "m" -> 41
      | LETTER "y" -> 42
      | LETTER "r"; LETTER "i"; LETTER "i"  -> 43 (* consistency with: *)
      | LETTER "r"; LETTER "i" -> 43              (* Krishna *)
      | LETTER "r"; LETTER "u"; LETTER "u"  -> 43 (* consistency with: *)
      | LETTER "r"; LETTER "u" -> 43              (* vikruti *)
      | LETTER "r" -> 43
      | LETTER "l" -> 44
      | LETTER "v" -> 45
      | LETTER "s"; LETTER "h" -> 48
      | LETTER "s" -> 48
      | LETTER "h" -> 49
    ] ];
  wordd:
    [ [ w = LIST0 simplified; `EOI -> w 
      | w = LIST0 simplified; "#"; INT; `EOI -> w (* homo index ignored *)
    ] ];
END
;
(* Similar to [code_skt_ref] but simplified (no diacritics) *)
value code_rawd s = 
  try Gram.parse_string wordd Loc.ghost s with
  [ Loc.Exc_located loc e -> do
     { Format.eprintf "\nIn string \"%s\", at location %s :\n%!"
                      s (Loc.to_string loc)
     ; raise e
     } 
  ] 
;

(*i end; i*)

