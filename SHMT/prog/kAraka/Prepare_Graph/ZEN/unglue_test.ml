(**************************************************************************)
(*                                                                        *)
(*                 The Zen Computational Linguistics Toolkit              *)
(*                                                                        *)
(*                              Gérard Huet                               *)
(*                                                                        *)
(* ©2002 Institut National de Recherche en Informatique et en Automatique *)
(**************************************************************************)

(*i *)
open Unglue;
(* i*)

(* The unglueing process is complete, relatively to the lexicon: if the input 
sentence may be obtained by glueing words from the lexicon, [unglue sentence]
will return one possible solution. For instance, assuming the sentence is 
in French Childish Scatology: *)

module Childtalk = struct
value lexicon = Lexicon.make_lex ["boudin";"caca";"pipi"];
end
;
module Childish = Unglue Childtalk
;

(* Now, calling [Childish.unglue] on the encoding of the string 
["pipicacaboudin"] produces a pair [(sol,cont)] where the reverse of [sol] is 
a list of words which, if they are themselves reversed and decoded, 
yields the expected sequence [["pipi"; "caca"; "boudin"]]. *)

(*i test *)
assert match Childish.unglue (Ascii.encode "pipicacaboudin") with 
  [ Some (sol,_) -> List.map Ascii.decode sol = ["niduob"; "acac"; "ipip"]
  | None -> failwith "Error"
  ]
;
(* i*)

match Childish.unglue (Ascii.encode "pipicacaboudin") with
  [ Some (sol,_) -> Childish.print_out sol
  | None -> failwith "Error"
  ]
;

(* We recover as expected: \verb:pipi caca boudin:.     *)
(*                                                      *)
(* Another example, this time American street talk:     *)

module Streettalk = struct
value lexicon = Lexicon.make_lex["a"; "brick"; "fuck"; "shit"; "truck"];
end
;
module Slang = Unglue Streettalk
;

match Slang.unglue (Ascii.encode "fuckatruckshitabrick") with 
  [ Some (sol,cont) -> Slang.print_out sol
  | None -> failwith "Error"
  ]
;

(* We get as expected: \verb:fuck a truck shit a brick:.                  *)
(*                                                                        *)
(* Of course there may be several solutions to the unglueing problem, 
and this is the rationale of the [cont] component, which is a [resumption]. 
For instance, in the previous example, [cont] is empty, indicating
that the solution [sol] is unique.                                        *)
(*                                                                        *)
(* We saw above that we could use the process [backtrack] in coroutine with
the printer [print_out] within the [unglue_all] enumerator.               *)
(*                                                                        *)
(* Let us test this segmenter to solve an English charade (borrowed from
``Palindroms and Anagrams'', Howard W. Bergerson, Dover 1973).            *)

module Short = struct
  value lexicon = Lexicon.make_lex 
    ["able"; "am"; "amiable"; "get"; "her"; "i"; "to"; "together"]
  ;
  end
;
module Charade = Unglue Short
;
Charade.unglue_all (Ascii.encode "amiabletogether")
;

(* We get 4 solutions to the charade, printed as a quatrain polisson:
\begin{verbatim}
 Solution 1 : amiable together
 Solution 2 : amiable to get her
 Solution 3 : am i able together
 Solution 4 : am i able to get her 
\end{verbatim}
*) 
(*i *)
module Bigger = struct
  value lexicon = Lexicon.make_lex ["hiss";"caress";"pursuit";"or";"astound";"o";"roc";
   "cobras";"his";"scares";"spur";"suitor";"as";"to";"undo";"rococo";"bras"];
  end
;
module Charade2 = Unglue Bigger
;
Charade2.unglue_all (Ascii.encode "hisscaresspursuitorastoundorococobras")
;
(* We get 8 solutions i*)

(* Unglueing is what is needed to segment a language like Chinese. Realistic
segmenters for Chinese have actually been built using such finite-state 
lexicon driven methods, refined by stochastic weightings \cite{sproat}.

Several combinatorial problems map to variants of unglueing. For instance,
over a one-letter alphabet, we get the Fr{\otrema}benius problem of finding
partitions of integers into given denominations (except that we get
permutations since here the order of coins matters). 
Here is how to give the change in pennies, nickels and dimes: *)

value rec unary = fun [ 0 -> "" | n -> "|" ^ (unary (n-1)) ]
;

(* The coins are the words of this arithmetic language: *)
value penny = unary 1 and nickel = unary 5 and dime = unary 10
;
module Coins = struct         
  value lexicon = Lexicon.make_lex [penny; nickel; dime];
  end
;
module Frobenius = Unglue Coins
;
value change n = Frobenius.unglue_all (Ascii.encode (unary n))
;
change 17
;

(* This returns the 80 ways of changing 17 with our coins:
\begin{verbatim}
 Solution 1 : |||||||||| ||||| | | 
...
 Solution 80 : | | | | | | | | | | | | | | | | |
\end{verbatim}

Now we try phonemic segmentation in phonetic French. *)

module Phonetic = struct
value lexicon = Lexicon.make_lex ["gal";"aman";"de";"la";"rene";"ala";
"tour";"magn";"a";"nime";"galaman";"l";"arene";"magnanime"];
end
;
module Puzzle = Unglue Phonetic
;
Puzzle.unglue_all (Ascii.encode "galamandelarenealatourmagnanime")
;

(* Here we get 36 solutions, among which we find the two classic verses:
\begin{verbatim}
Solution 25 : gal aman de la rene ala tour magnanime
Solution 10 : galaman de l arene a la tour magn a nime
\end{verbatim}
*)

(* One last exemple, in Latin. *)

module Latin = struct
value lexicon = Lexicon.make_lex ["collectam";"ex";"ilio";"pubem";"exilio"];
end
;
module Virgil = Unglue Latin
;
Virgil.unglue_all (Ascii.encode "collectamexiliopubem")
;

(* Here the good solution is 
\begin{verbatim}
 Solution 1 : collectam exilio pubem
\end{verbatim}
(a people gathered for exile) and {\sl not}
\begin{verbatim}
 Solution 2 : collectam ex ilio pubem
\end{verbatim}
(a people gathered from Troy) as Donat interpreted Virgil's Aeneid,
incurring the criticism of his fellow grammarian Servius
([Borrowed from Alberto Manguel, A History of Reading.]) *)
 
