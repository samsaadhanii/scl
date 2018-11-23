(**************************************************************************)
(*                                                                        *)
(*                 The Zen Computational Linguistics Toolkit              *)
(*                                                                        *)
(*                              Gérard Huet                               *)
(*                                                                        *)
(* ©2002 Institut National de Recherche en Informatique et en Automatique *)
(**************************************************************************)

(*i module Word = struct i*)

type letter = int
and word = list letter (* word encoded as sequence of natural numbers *)
;

(* We remark that we are not using for our word representations the ML type
of strings (which in OCaml are arrays of characters/bytes). Strings are
convenient for English texts (using the 7-bit low half of ASCII) or other
European languages (using the ISO-LATIN subsets of full ASCII), and they are 
more compact than lists of integers, but basic operations like pattern matching
are awkward, and they limit the size of the alphabet to 256, which is 
insufficient for the treatment of many languages' written representations.
New format standards such as Unicode have complex primitives for their
manipulation, and are better reserved for interface modules than for central
morphological operations. We could have used an abstract type of characters,
leaving to module instantiation their precise definition, but here we
chose the simple solution of using machine integers for their representation, 
which is sufficient for large alphabets (in Ocaml, this limits the alphabet 
size to 1073741823), and to use conversion functions [encode] and [decode] 
between words and strings. 
In the Sanskrit application, we use the first 50 natural numbers as the 
character codes of the Sanskrit phonemes, whereas string translations take 
care of roman diacritics notations, and encodings of {\sl devan\=agar{\=\i}} 
characters. *)

(* [prefix : word -> word -> bool] *)
value rec prefix u v = 
  match u with
    [ [] -> True
    | [ a :: r ] -> match v with
        [ [] -> False
        | [ b :: s ] -> a=b && prefix r s 
        ]
    ]
;

(* Lexicographic ordering on words.  *)
(* [lexico: word -> word -> bool]    *)
value rec lexico l1 l2 = match l1 with
  [ [] -> True
  | [ c1 :: r1 ] -> match l2 with  
      [ [] -> False
      | [ c2 :: r2 ] -> if c2<c1 then False 
                        else if c2=c1 then lexico r1 r2
                             else True
      ]
  ]
;
value length = List.length
and mirror = List.rev
;

(* {\bf Differential words.} *)

(* A {\sl differential word} is a notation permitting to retrieve a word [w]
   from another word [w'] sharing a common prefix. It denotes the minimal 
   path connecting the words in a trie, as a sequence of ups and downs:
   if [d=(n,u)] we go up [n] times and then down along word [u]. *)

type delta = (int * word)  (* differential words *)
;

(* Natural ordering on differential words. *)
value less_diff (n1,w1) (n2,w2) = n1<n2 || (n1=n2) && lexico w1 w2
;

(* We compute the difference between [w] and [w'] as a differential word 
   [diff w w' = (|w1|,w2)] where [w=p.w1] and [w'=p.w2], 
   with maximal common prefix [p].                                      *)

(* [diff : word -> word -> delta]                                       *)
value rec diff w w' = match w with
  [ [] -> (0,w')
  | [ c :: r ] -> match w' with
      [ [] -> (length w,[])
      | [ c' :: r' ] -> if c = c' then diff r r'
                        else (length w,w')
      ]
  ]
;

(* Now [w'] may be retrieved from [w] and [d=diff w w'] as [w'=patch d w]. *)

(* [patch : delta -> word -> word]                                         *)
value patch (n,dw) w = 
  let p = List2.truncate n (mirror w) in
  List2.unstack p dw
;
(*i end; i*)




