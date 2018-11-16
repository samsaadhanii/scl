(**************************************************************************)
(*                                                                        *)
(*                 The Zen Computational Linguistics Toolkit              *)
(*                                                                        *)
(*                              Gérard Huet                               *)
(*                                                                        *)
(* ©2002 Institut National de Recherche en Informatique et en Automatique *)
(**************************************************************************)

(*i Module Terdagify = struct i*)
(*i Minimization of Ternary Trees as Ternary Dags by bottom-up hashing i*)

(* For instance, we may dagify a [tree] value read on the standard input
stream with [minimize], and write the resulting dag on standard output
by calling [terdagify()], with: *)

value rec terdagify () =
  let lexicon = (input_value stdin : Tertree.tree)
  in let dag = Minitertree.minimize lexicon in output_value stdout dag;

(*i *)
terdagify();
(* i*)

(*i end i*)
