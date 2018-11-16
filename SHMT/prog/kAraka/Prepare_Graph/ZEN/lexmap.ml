(**************************************************************************)
(*                                                                        *)
(*                 The Zen Computational Linguistics Toolkit              *)
(*                                                                        *)
(*                              Gérard Huet                               *)
(*                                                                        *)
(* ©2002 Institut National de Recherche en Informatique et en Automatique *)
(**************************************************************************)

(*i Lexical Maps i*)

(*i module Lexmap = struct i*)

(* A specialisation of Deco, with info localised to the current word.  *)
type inverse 'a = (Word.delta * 'a)  
and inv_map 'a = list (inverse 'a)
;

(* Such inverse relations may be used as decorations of special lexical trees
called lexical maps. *)

open Deco;

type lexmap 'a = deco (inverse 'a)
;

(* Typically, if word [w] is stored in a [lexmap] at a node whose decoration
carries [(d,r)], this represents the fact that [w] is the image by relation 
[r] of [w'=patch d w]. Such a [lexmap] is thus a representation of the image 
by [r] of a source lexicon. This representation is invertible, while preserving
maximally the sharing of prefixes, and thus being amenable to sharing. *)

(* Here ['a] is [list morphs]. When word [w] has info [[... (delta,l) ...]] 
with [delta=diff w w'] it tells that [R w' w] for every morph relation [R] 
in [l] where [w'=patch delta w]. *)

value single (d,i) = (d,[ i ])
;

(* [add_inv : (inverse 'a) -> (inv_map (list 'a)) -> (inv_map (list 'a))] *)
value rec add_inv ((delta,flex) as i) = fun
  [ [] -> [ single i ]
  | [ (d,lflex) :: l ] as infos -> 
      if d = delta then [ (d,List2.union1 flex lflex) :: l ]
      else if Word.less_diff d delta then [ (d,lflex) :: add_inv i l ] 
                                     else [ single i :: infos ]
  ]
;

(* [add_inv2 : (inverse 'a) -> (inv_map (list 'a)) -> (inv_map (list 'a))] *)
   
(* Similar to [add_inv] but raises the exception [List2.Twice_the_same_value] 
   when trying to add twice the same decoration for a same word with the same [delta]. *)
value rec add_inv2 ((delta,flex) as i) = fun
    [ [] -> [ single i ]
    | [ (d,lflex) :: l ] as infos -> 
	if d = delta then [ (d,List2.union2 flex lflex) :: l ]
	else if Word.less_diff d delta then [ (d,lflex) :: add_inv i l ] 
        else [ single i :: infos ]
    ]
;

(* [addl: (lexmap (list 'a)) -> word -> (inverse 'a) -> (lexmap (list 'a))] *)
value addl lexmap word i = enter_edit Top lexmap word
  where rec enter_edit z d = fun
  [ [] -> match d with [ Deco (j,l) -> zip_up z (Deco (add_inv i j,l)) ]
  | [ n :: rest ] -> 
      match d with 
      [ Deco (j,l) -> 
        let (left,right) = List2.zip n l in
        match right with
        [ [] -> zip_up (Zip (j,left,n,[],z)) (deco_of [ single i ] rest) 
	| [ (m,u) :: r ] -> 
          if m=n then enter_edit (Zip (j,left,n,r,z)) u rest 
          else zip_up (Zip (j,left,n,right,z)) (deco_of [ single i ] rest) 
	]
      ]
  ]
;
exception Duplication 
;

(* [addl2: (lexmap (list 'a)) -> word -> (inverse 'a) -> (lexmap (list 'a))] *)
value addl2 lexmap word i = 
  try enter_edit Top lexmap word
      where rec enter_edit z d = fun
      [ [] -> match d with [ Deco (j,l) -> zip_up z (Deco (add_inv2 i j,l)) ]
      | [ n :: rest ] -> 
          match d with 
          [ Deco (j,l) -> 
            let (left,right) = List2.zip n l in
	    match right with
            [ [] -> zip_up (Zip (j,left,n,[],z)) (deco_of [ single i ] rest) 
	    | [ (m,u) :: r ] -> 
              if m=n then enter_edit (Zip (j,left,n,r,z)) u rest 
              else zip_up (Zip (j,left,n,right,z)) (deco_of [ single i ] rest) 
	    ]
          ]
      ]
  with [ List2.Twice_the_same_value -> raise Duplication ] 
;

(*i end; i*)
