(**************************************************************************)
(*                                                                        *)
(*                 The Zen Computational Linguistics Toolkit              *)
(*                                                                        *)
(*                              Gérard Huet                               *)
(*                                                                        *)
(* ©2007 Institut National de Recherche en Informatique et en Automatique *)
(**************************************************************************)

(* A very simple lexer recognizing 1 character idents and integers 
   and skipping spaces and comments between [%] and eol; 
   used for various transduction tasks with Camlp4 Grammars. 
   It is a copy of ZEN/zen_lexer.ml in order to simplify dependencies. *)

(*i module Min_lexer = struct i*)

open Camlp4.PreCast;
open Format;

  module Loc = Loc;  (* Using the PreCast Loc *)
  module Error = Camlp4.Struct.EmptyError; (* Dummy Error module *)
  module Token = struct
    module Loc = Loc
    ; 
    type t =
      [ KEYWORD of string
      | LETTER of string 
      | INT of int
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
        [ [: `((KEYWORD s, loc) as p); strm :] ->
             if is_kwd s then [: `p; filter is_kwd strm :]
             else failwith ("Undefined token: " ^ s) 
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
      | LETTER s -> sprintf "LETTER %S" s
      | INT i -> sprintf "INT %d" i
      | EOI -> "EOI"
      ]
    ;
    value print ppf x = pp_print_string ppf (to_string x)
    ;
    value match_keyword kwd = fun
      [ KEYWORD kwd' when kwd' = kwd -> True
      | _ -> False
      ]
    ;
    value extract_string = fun
      [ INT i -> string_of_int i
      | LETTER s | KEYWORD s -> s
      | EOI -> "" 
      ]
    ;
  end
  ;

  open Token
  ;

  (* The string buffering machinery. *) (*i ddr + np i*)
  value store buf c = do { Buffer.add_char buf c; buf }
  ;
  value rec number buf =
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
  value next_token_fun =
    let rec next_token =
      parser _bp
      [ [: `'%' ; _ = skip_to_eol; s :] -> next_token s
      | [: `('a'..'z' | 'A'..'Z' | '\192'..'\246' | '\248'..'\255' (*  [| '_'] *) 
             as c) :] -> LETTER (String.make 1 c)
      | [: `('0'..'9' as c); s = number (store (Buffer.create 80) c) :] ->
            INT (int_of_string s)
      | [: `c :] _ep -> KEYWORD (String.make 1 c)
      ] in
    let rec next_token_loc =
      parser bp
      [ [: `' ' | '\n' | '\r' | '\t' | '\026' | '\012'; s :] -> next_token_loc s
      | [: tok = next_token :] ep -> (tok, (bp, ep))
      | [: _ = Stream.empty :] -> (EOI, (bp, succ bp))
      ] in
    next_token_loc
  ;
  value mk () =
    fun init_loc cstrm -> Stream.from 
      (fun _ ->
        let (tok, (bp, ep)) = next_token_fun cstrm in
        let loc = Loc.move `start bp (Loc.move `stop ep init_loc) in
        Some (tok, loc))
  ;

(*i end; i*)

