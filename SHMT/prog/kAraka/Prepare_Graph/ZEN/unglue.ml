(**************************************************************************)
(*                                                                        *)
(*                 The Zen Computational Linguistics Toolkit              *)
(*                                                                        *)
(*                              Gérard Huet                               *)
(*                                                                        *)
(* ©2002 Institut National de Recherche en Informatique et en Automatique *)
(**************************************************************************)

(* The unglueing problem is the simplest case of juncture
analysis, namely when there are no non-trivial juncture rules, and 
segmentation consists just in retrieving the words of a sentence
glued together in one long string of characters (or phonemes). 

We shall show that the corresponding transducer may be defined as a simple
navigation in the lexical tree state space, but now with a measure of
non-determinism. The unglueing transducer is a lexicon morphism. *)

module Unglue (Lexicon: sig value lexicon : Trie.trie; end) = struct

type input = Word.word       (* input sentence as a word    *)
and output = list Word.word  (* output is sequence of words *)
;
type backtrack = (input * output)
and resumption = list backtrack  (* coroutine resumptions *)
;

(* Now we define our unglueing reactive engine as a recursive process which
navigates directly on the (flexed) lexicon trie 
(typically the compressed trie resulting from the Dag module considered above).
The reactive engine takes as arguments the (remaining) input, the (partially 
constructed) list of words returned as output, a backtrack stack whose items 
are [(input,output)] pairs, the path [occ] in the state graph stacking (the 
reverse of) the current common prefix of the candidate words, and finally the 
current [trie] node as its current state. When the state is accepting, we push 
it on the [backtrack] stack, because we want to favor possible longer words, 
and so we continue reading the input until either we exhaust the input, or the 
next input character is inconsistent with the lexicon data. *)

value rec react input output back occ = fun
  [ Trie.Trie (b,arcs) -> 
      let continue cont = match input with
         [ [] -> backtrack cont
         | [ letter :: rest ] -> 
           let opt_state = try Some (List.assoc letter arcs) with
                           [ Not_found -> None ] in
           match opt_state with
           [ Some s -> react rest output cont [ letter :: occ ] s  
	   | None -> backtrack cont
	   ]
         ] in
      if b then 
         let pushout = [ occ :: output ] in
         if input=[] then Some (pushout,back)  (* solution found *)
         else let pushback = [ (input,pushout) :: back ] in
              (* we first try the longest possible matching word *)
              continue pushback
      else continue back
  ]
and backtrack = fun
  [ [] -> None
  | [ (input,output) :: back ] -> react input output back [] Lexicon.lexicon
  ]
;

(* Now, unglueing a sentence is just calling the reactive engine from the
appropriate initial backtrack situation: *)

value unglue sentence = backtrack [ (sentence,[]) ]
;
(*i Notes
  1. The returned value in case of success is [pushout = [occn; ... ; occ1]] 
     with occi the reversed of word wi; back is the continuation for more sols
  2. We use assoc rather than List2.zip so no assumption of order on arcs.
     If order is enforced we may optimise by
     [value assoc n l = let (_,l2) = zip n l in
        match l2 with [ [] -> failwith "Not_found" | [ x :: _ ] -> x ];]
     But maybe it is better to order nodes by decreasing frequency with priority association lists
i*)

value print_out solution = List.iter pr (Word.mirror solution)
  where pr word = print_string (Ascii.decode (Word.mirror word) ^ " ")
;

(* [resume : resumption -> int -> resumption] *)
value resume cont n = match backtrack cont with
  [ Some (output,resumption) -> do
     { print_string "\n Solution "
     ; print_int n
     ; print_string " : " 
     ; print_out output
     ; Some resumption
     }
  | _ -> None
]
;
value unglue_first sentence = (* similar to unglue *) 
  resume [ (sentence,[]) ] 1
;
value unglue_all sentence = restore [ (sentence,[]) ] 1
  where rec restore cont n = match resume cont n with
  [ Some resumption -> restore resumption (n+1)
  | None -> print_string (if n=1 then " No solution found\n" else "\n")
  ]
;

end;

