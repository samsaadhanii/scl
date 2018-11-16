(**************************************************************************)
(*                                                                        *)
(*                 The Zen Computational Linguistics Toolkit              *)
(*                                                                        *)
(*                              Gérard Huet                               *)
(*                                                                        *)
(* ©2002 Institut National de Recherche en Informatique et en Automatique *)
(**************************************************************************)

(*i Binary trees and zippers i*)

(*i module Bintree = struct i*)

type bintree = 
  [ Null
  | Bin of (bintree * bintree)
  ]
;

(* Occurrences as boolean lists (binary words). *)
type binocc = list bool
and domain = list binocc
;

(* [binlexico: binocc -> binocc -> bool] *)
value rec binlexico l1 l2 = match l1 with
  [ [] -> True
  | [ b1 :: r1 ] -> match l2 with  
      [ [] -> False
      | [ b2 :: r2 ] -> if b1=b2 then binlexico r1 r2 else b2
      ]
  ]
;

(* [occurs : binocc -> bintree -> bool] *)
value rec occurs occ bt = match occ with
  [ [] -> True
  | [ b :: rest ] -> match bt with
     [ Null -> False
     | Bin (bl,br) -> occurs rest (if b then br else bl) 
     ]
  ]
;

(* [paths : bintree -> domain] *)
value paths = pathrec [] []
  where rec pathrec acc occ = fun
  [ Null -> [ List.rev occ :: acc ]
  | Bin (bl,br) -> let right = pathrec acc [ True :: occ ] br
                   in [ List.rev occ :: pathrec right [ False :: occ ] bl ]
  ]
;

(* Note: [occurs occ t = List.mem occ (paths t)]. We assume [paths t] to be in [binlexico] order. *)

(* [bintree_of1 : binocc -> bintree] *)
value rec bintree_of1 = fun
  [ [] -> Null
  | [ b :: occ ] -> if b then Bin (Null,bintree_of1 occ)
                    else Bin (bintree_of1 occ,Null)
  ]
;

(* {\bf Zippers} *)

(* binary contexts = linear bintree maps *)
type binzip = 
  [ Top
  | Left of (binzip * bintree)
  | Right of (bintree * binzip)
  ]
;

(* [zip_up : binzip -> bintree -> bintree] *)
value rec zip_up z bt = match z with
  [ Top -> bt 
  | Left (up,br) -> zip_up up (Bin (bt,br))
  | Right (bl,up) -> zip_up up (Bin (bl,bt))
  ]
;

(* [extend : bintree -> binocc -> bintree] *)
value extend tree = enter_edit Top tree 
  where rec enter_edit z t occ = match occ with
     [ [] -> zip_up z t
     | [ b :: rest ] -> match t with 
         [ Bin (bl,br) -> if b then enter_edit (Right (bl,z)) br rest
                          else enter_edit (Left (z,br)) bl rest
         | Null -> zip_up z (bintree_of1 occ)
         ]
     ]
;

(* We maintain [ extend t occ = if occurs occ t then t
                    else bintree_of [ occ :: paths t ]]. *)

(* [bintree_of : domain -> bintree] *)
value bintree_of = binrec Null
  where rec binrec acc = fun
  [ [] -> acc
  | [ occ :: dom ] -> binrec (extend acc occ) dom
  ]
;

(* {\bf Invariants}: 
\begin{itemize}
\item{[ paths (bintree_of dom) = {occ | binlexico occ o] with [o] $\in$ [dom}]}
\item{[ bintree_of (paths tree) = tree ]}
\item{[ bintree_of1 occ = bintree_of [occ] ]}
\end{itemize} *)

(*i *)
assert let t1 = bintree_of [[ True; False; True ]; [ False; True ]] in
       let d1 = paths t1 in t1 = bintree_of d1
;
(* i*)

(*i end; i*)


