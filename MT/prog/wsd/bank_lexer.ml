(**************************************************************************)
(*                                                                        *)
(*                     The Sanskrit Heritage Platform                     *)
(*                                                                        *)
(*                              Gérard Huet                               *)
(*                                                                        *)
(* ©2015 Institut National de Recherche en Informatique et en Automatique *)
(**************************************************************************)

(* A simple lexer recognizing idents formed from ASCII letters and integers 
   and skipping spaces and comments between % and eol. 
   Used by [Parse_tree] and [Reader]. *)

module Bank_lexer = struct

open Camlp4.PreCast;
open Format;

module Loc = Loc (* Using the PreCast Loc *)
;
module Error = struct
  type t = string
  ;
  exception E of t
  ;
  value to_string x = x
  ;
  value print = Format.pp_print_string
  ;
  end
;
module Token = struct
  module Loc = Loc
  ; 
  type t =
    [ KEYWORD of string
    | IDENT of string 
    | TEXT of string 
    | INT of int
    | INTS of int
    | EOI
    ]
  ;
  module Error = Error
  ;
  module Filter = struct
    type token_filter = Camlp4.Sig.stream_filter t Loc.t
    ;
    type t = string -> bool
    ;
    value mk is_kwd = is_kwd
    ;
    value rec filter is_kwd = parser
        [ [: `((KEYWORD s, loc) as p); strm :] -> [: `p; filter is_kwd strm :]
(* PB        [if is_kwd s then [: `p; filter is_kwd strm :]
              else failwith ("Undefined token: " ^ s)]      *)
        | [: `x; s :] -> [: `x; filter is_kwd s :]
        | [: :] -> [: :] 
        ]
    ;
    value define_filter _ _ = ()
    ;
    value keyword_added _ _ _ = ()
    ;
    value keyword_removed _ _ = ()
    ;
    end
  ;
  value to_string = fun
    [ KEYWORD s -> sprintf "KEYWORD %S" s
    | IDENT s -> sprintf "IDENT %S" s
    | TEXT s -> sprintf "TEXT %S" s
    | INT i -> sprintf "INT %d" i
    | INTS i -> sprintf "INT %d" i
    | EOI -> "EOI"
    ]
  ;
  value print ppf x = pp_print_string ppf (to_string x)
  ;
  value match_keyword kwd = fun
    [ KEYWORD kwd' -> kwd' = kwd
    | _ -> False
    ]
  ;
  value extract_string = fun
    [ INT i -> string_of_int i
    | INTS i -> string_of_int i
    | IDENT s | KEYWORD s | TEXT s -> s
    | EOI -> "" 
    ]
  ;
end
;

open Token
;

(* The string buffering machinery - ddr + np *)
value store buf c = do { Buffer.add_char buf c; buf }
;
value rec base_number len =
  parser
  [ [: a = number len :] -> a ]
and number buf =
  parser
  [ [: `('0'..'9' as c); s :] -> number (store buf c) s
  | [: :] -> Buffer.contents buf
  ]
  ;
value rec skip_to_eol =
  parser
  [ [: `'\n' | '\026' | '\012'; s :] -> ()
  | [: `c ; s :] -> skip_to_eol s
  ]
;
value ident_char =
  parser
  [ [: `('a'..'z' | 'A'..'Z' | '.' | '"' | '~' | '\'' | '_' | '-' | '(' as c) :] 
     -> c ]
;
value rec ident2 buff =
  parser
  [ [: c = ident_char; s :] -> ident2 (store buff c) s
  | [: `('0'..'9' as c); s :] -> ident2 (store buff c) s
  | [: :] -> Buffer.contents buff
  ]
;
value rec text buff =
  parser
  [ [: `'}' :] -> Buffer.contents buff
  | [: `'{'; buff = text_buff (store buff '{'); s :] -> 
                   text (store buff '}') s
  | [: `c; s :] -> text (store buff c) s
  ]
and text_buff buff =
  parser
  [ [: `'}' :] -> buff
  | [: `'{'; buff = text_buff (store buff '{'); s :] -> 
                   text_buff (store buff '}') s
  | [: `c; s :] -> text_buff (store buff c) s 
  ]
;
value next_token_fun =
  let rec next_token buff =
    parser _bp
    [ [: `'{'; t = text buff :] -> TEXT t
    | [: `('1'..'9' as c); s = number (store buff c) :] -> INT (int_of_string s)
    | [: `'0'; s = base_number (store buff '0') :] -> INT (int_of_string s)
    | [: c = ident_char; s = ident2 (store buff c) :] -> 
      if s = "(sup" then KEYWORD "(sup" else 
      if s = "(id" then KEYWORD "(id" else
      if s = "(cid" then KEYWORD "(cid" else
      if s = "(word" then KEYWORD "(word" else
      if s = "(rt" then KEYWORD "(rt" else 
      if s = "(pUrvapaxa" then KEYWORD "(pUrvapaxa" else 
      if s = "(uwwarapaxa" then KEYWORD "(uwwarapaxa" else 
      if s = "(wif" then KEYWORD "(wif" else 
      if s = "(kqw" then KEYWORD "(kqw" else 
      if s = "(avy" then KEYWORD "(avy" else 
      if s = "(avykqw" then KEYWORD "(avykqw" else 
      if s = "(avywaxXiwa" then KEYWORD "(avywaxXiwa" else 
      if s = "(waxXiwa" then KEYWORD "(waxXiwa" else 
      if s = "(waxXiwa_rt" then KEYWORD "(waxXiwa_rt" else 
      if s = "(waxXiwa_prawyayaH" then KEYWORD "(waxXiwa_prawyayaH" else 
      if s = "(avywaxXiwa" then KEYWORD "(avywaxXiwa" else 
      if s = "(kqw_pratipadika" then KEYWORD "(kqw_pratipadika" else 
      if s = "(kqw_prawyayaH" then KEYWORD "(kqw_prawyayaH" else 
      if s = "(prayogaH" then KEYWORD "(prayogaH" else 
      if s = "(lakAraH" then KEYWORD "(lakAraH" else 
      if s = "(puruRaH" then KEYWORD "(puruRaH" else 
      if s = "(vacanam" then KEYWORD "(vacanam" else 
      if s = "(paxI" then KEYWORD "(paxI" else 
      if s = "(XAwuH" then KEYWORD "(XAwuH" else 
      if s = "(gaNaH" then KEYWORD "(gaNaH" else 
      if s = "(sanAxi_prawyayaH" then KEYWORD "(sanAxi_prawyayaH" else 
      if s = "(upasarga" then KEYWORD "(upasarga" else 
      if s = "(lifgam" then KEYWORD "(lifgam" else 
      if s = "(viBakwiH" then KEYWORD "(viBakwiH" else 
      if s = "(vacanam" then KEYWORD "(vacanam" else  
      if s = "(level" then KEYWORD "(level" else
      if s = "(rel_nm" then KEYWORD "(rel_nm" else
      if s = "(relata_pos_id" then KEYWORD "(relata_pos_id" else
      if s = "(relata_pos_cid" then KEYWORD "(relata_pos_cid" 
      else IDENT s
    | [: `c :] _ep -> KEYWORD (String.make 1 c)
    ] in
  let rec next_token_loc =
      parser bp
      [ [: `'%' ; _ = skip_to_eol; s :] -> next_token_loc s
      | [: `' ' | '\n' | '\r' | '\t' | '\026' | '\012'; s :] -> next_token_loc s
      | [: tok = next_token (Buffer.create 80) :] ep -> (tok, (bp, ep))
      | [: _ = Stream.empty :] -> (EOI, (bp, succ bp)) 
      ] in
  next_token_loc
  ;
value mk () =
  let err loc msg = Loc.raise loc (Token.Error.E msg) in
  fun init_loc cstrm -> Stream.from lexer
  where lexer _ = 
    try let (tok, (bp, ep)) = next_token_fun cstrm in
        let loc = Loc.move `start bp (Loc.move `stop ep init_loc) in
        Some (tok, loc)
    with [ Stream.Error str ->
            let bp = Stream.count cstrm in
            let loc = Loc.move `start bp (Loc.move `stop (bp+1) init_loc) in 
            err loc str ]
;
end;
