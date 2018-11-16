(**************************************************************************)
(*                                                                        *)
(*                 The Zen Computational Linguistics Toolkit              *)
(*                                                                        *)
(*                              Gérard Huet                               *)
(*                                                                        *)
(* ©2002 Institut National de Recherche en Informatique et en Automatique *)
(**************************************************************************)

(*i Fake ml source file, used for printing ML code with Ocamlweb look i*)

(*
The core language has types, values, and exceptions. 
Thus, [1] is a value of predefined type [int], whereas 
["CL"] is a [string]. 
Pairs of values inhabit the corresponding product type. Thus:
[(1,"CL") : (int * string)]. 
Recursive type declarations create new types,
whose values are inductively built from the associated constructors. 
Thus the Boolean type could be declared
as a sum by: *)
type bool = [True | False];

(* Parametric types give rise to polymorphism.
Thus if [x] is of type [t] and [l] is of type 
[(list t)], we construct the list adding [x] to [l]
as [[x :: l]]. The empty list is [[]], of (polymorphic) type
[(list 'a)]. Although the language is strongly typed, explicit type
specification is rarely needed from the designer, since principal types
may be inferred mechanically.

The language is functional in the sense that functions are first class
objects. Thus the doubling integer function may be written as
[fun x -> x+x], and it has type [int -> int]. It may be associated
to the name [double] by declaring: *)
value double = fun x -> x+x;

(* Equivalently we could write: *)
value double x = x+x;

(* Its application to value [n]
is written as [(double n)] or even [double n] when there is no
ambiguity. Application associates to the left, and thus [f x y] stands
for [((f x) y)]. 
Recursive functional values are declared with the keyword [rec].
Thus we may define factorial as: *)

value rec fact n = if n=0 then 1 else n*(fact (n-1));

(* Functions may be defined by pattern matching. Thus the first projection of
pairs could be defined by: *)
value fst = fun [ (x,y) -> x ];

(* or equivalently (since there is only one pattern in this case) by: *)
value fst (x,y) = x;

(* Pattern-matching is also usable in [match] expressions which generalize
case analysis,
such as: [match l with [ [] -> True | _ -> False ]], which
tests whether list [l] is empty, using underscore as catch-all
pattern.

Evaluation is strict, which means that [x] is evaluated before
[f] in the evaluation of [(f x)]. The [let] expressions allow the
sharing of sub-computations. Thus
[let x = fact 10 in x+x] will compute [fact 10] first, 
and only once. 
An equivalent postfix [where] notation may be used as well. Thus
the conditional expression [if b then e1 else e2] is equivalent to: *)

(* [ choose b where choose = fun [ True -> e1 | False -> e2]; ] *)

(* Exceptions are declared with the type of their parameters, like in: *)
exception Failure of string;

(* An exceptional value may be raised, like in:
[raise (Failure "div 0")] and handled by a [try] switch on
exception patterns, such as: *)

(* [ try expression with [ Failure s -> ... ]; ] *)

(* Other imperative constructs may be used, such as 
references, mutable arrays, while loops and I/O commands,
but we shall seldom need them.
%If [x] has been declared as a [ref int], it may be assigned
%by an instruction such as [x.val:=0]. 
Sequences of instructions are
evaluated in left to right regime in [do] expressions, such as:
[do {e1; ... en}]. 

ML is a {\sl modular} language,
in the sense that sequences of type, value
and exception declarations may be packed in a structural unit called a
[module], amenable to separate treatment. 
Modules have types themselves, called {\sl signatures}. Parametric
modules are called {\sl functors}. The algorithms presented in this paper
will use in essential ways 
this modularity structure, but the syntax ought to be self-evident.
Finally, comments are enclosed within starred parens like: *)

value s = "This is a string"; (* This is a comment *)

(* Readers not acquainted with programming languages may think of ML
definitions as recursive
equations over inductively defined algebras. Most of them are simple
primitive recursive functionals. The more complex recursions of our
automata coroutines will be shown to be well-founded by 
a combination of lexicographic and multiset orderings.

Pidgin ML definitions may actually be directly executed as 
Objective Caml programs \cite{ocaml},
under the so-called revised syntax \cite{camlp4}. 
The following development may thus 
be used as the reference implementation of a core
computational linguistics platform, dealing with lexical, phonemic and
morphological aspects. 
*)

