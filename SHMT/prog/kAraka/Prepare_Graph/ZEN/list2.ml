(**************************************************************************)
(*                                                                        *)
(*                 The Zen Computational Linguistics Toolkit              *)
(*                                                                        *)
(*                              Gérard Huet                               *)
(*                                                                        *)
(* ©2002 Institut National de Recherche en Informatique et en Automatique *)
(**************************************************************************)

(* We complement [List] here with a few auxiliary list service functions. *)

(*i module List2 = struct i*)

(* [unstack l r = (rev l) @ r] *)
(* [unstack = List.rev_append] *)
value rec unstack l1 l2 =
  match l1 with
  [ [] -> l2
  | [ a :: l ] -> unstack l [ a :: l2 ]
  ]
;
value non_empty = fun [ [] -> False | _ -> True ]
;

(* Subtraction derivative. *)
(* [subtract : list 'a -> list 'a -> option (list 'a)]              *)
(* [subtract [ c1; ... cN ][ c1; ... cn ] = Some [ cn+1; ... cN ]]  *)
(* otherwise returns [None].                                         *)
value rec subtract input = fun
  [ [] -> Some input
  | [ c :: r ] -> match input with 
     [ [ c' :: r' ] when c'=c -> subtract r' r
     | _ -> None
     ]
  ]
; 

(* Association lists. *)
(* The right way to program [assoc], without exceptions. *)
(* [ass : 'a -> list ('a * 'b) -> option 'b] *)
value ass x = ass_rec 
  where rec ass_rec = fun 
  [ [ (a,u) :: rest ] -> if a=x then Some u else ass_rec rest
  | [] -> None
  ]
;

(* Set operations with lists. *)

exception Twice_the_same_value 
;
value union1 e l = 
  if List.mem e l then l else [ e :: l ]
;

(* Used in ZEN/Lexmap. *)
value union2 e l = 
   if List.mem e l then (raise Twice_the_same_value) else [ e :: l ]
;

(* Terminal recursive union of finite sets represented as lists - does not 
   respect the order of elements in [l1]: [union_f [ 1; 2 ] [] = [ 2; 1 ]]    *)
value rec union_f l1 l2 = 
  match l1 with
    [ [] -> l2
    | [ e :: l ] -> union_f l (union1 e l2)
    ] 
;

(* Same, respecting the order, but not tail-recursive: *)
value union l1 l2 = List.fold_right union1 l1 l2
;
value set_of l = (*i Caution: eta expansion needed for polymorphism i*) 
  let add acc x = if List.mem x acc then acc else [ x :: acc ] in
  List.fold_left add [] l
;

(* [last : list 'a -> 'a ] *)
value rec last = fun 
  [ [] -> raise (Failure "last")
  | [ x ] -> x
  | [ _ :: l ] -> last l
  ]
;

(* [split n l] returns a pair of lists [(prefix, suffix)] such that
   [prefix @ suffix = l] and [List.length prefix = n].  
   Raises [Failure "split"] if [n < 0] or [n > List.length l].  *)
value split n l = aux n l []
  where rec aux n l acc =
  if n = 0 then (List.rev acc, l) else
    match l with
    [ [] -> failwith "split"
    | [ h :: t ] -> aux (n - 1) t [ h :: acc ]
    ]
;
(* [truncate n l] removes from [l] its initial sublist of length [n]. *)
(* [truncate : int -> list 'a -> list 'a]                             *)
value truncate n l =
  try snd (split n l) with [ Failure _ -> failwith "truncate" ]
;
(* [take_prefix n l] returns the first [n] elements of [l] (in the same
   order of occurrence as in [l]).  If [n > List.length l], then it returns
   the whole list [l].  
   Raises [Failure "take_prefix"] if [n < 0] or [n > List.length l].  *)
value take_prefix n l =
  try fst (split n l) with [ Failure _ -> failwith "take_prefix" ]
;
type ranked 'a = list (int * 'a)
;

(* [zip n l] assumes [l] sorted in increasing order of ranks; it returns 
   a partition of [l] as [(l1,l2)] with [l1] maximum such that ranks in [l1]
   are  [< n]. [l1] is reversed, i.e. we enforce the invariant:
   [zip n l = (l1,l2)] such that [l = unstack l1 l2].                      *)
(*                                                                         *)
(* [zip : int -> (ranked 'a) -> ((ranked 'a) * (ranked 'a))]               *)
value zip n = zip_rec [] 
  where rec zip_rec acc l = match l with
  [ [] -> (acc,[])
  | [ ((m,_) as current) :: rest ] -> 
      if m<n then zip_rec [ current :: acc ] rest
      else (acc,l)
  ]
;

(* Coercions between [string] and [list char]. *)
(*                                             *)
(* [explode : string -> list char]             *)
value explode s =
  let rec expl i accu =
    if i < 0 then accu else expl (i - 1) [ s.[i] :: accu ] in
  expl (String.length s - 1) []
;

(* [implode: list char -> string] *)
value implode chars = 
  let buf = Buffer.create 16 in do
  { List.iter (Buffer.add_char buf) chars
  ; Buffer.contents buf
  }
;

(* Process a list with using [pr] for elements and [sep] for separator     *)
(* [process_list_sep : ('a -> unit) -> (unit -> unit) -> list 'a -> unit ] *)
value process_list_sep pr sep =  
  let rec prl = fun
     [ [] -> ()
     | [ s ] -> pr s
     | [ s :: ls ] -> do { pr s; sep (); prl ls }
     ] in
  prl
;

(* Insert in a list of buckets with increasing keys *)
value in_bucket key element buckets = in_rec [] buckets
  where rec in_rec accu buckets = match buckets with 
     [ [] -> unstack accu [ (key,[ element ]) ]
     | [ ((k,l) as bucket) :: rest ] -> 
       if k>key then unstack accu [ (key,[ element ]) :: buckets ]
       else if k=key then unstack accu [ (k,[ element :: l ]) :: buckets ]
       else in_rec [ bucket :: accu ] rest
     ]
;

(*i end; i*)
