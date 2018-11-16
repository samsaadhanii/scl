(**************************************************************************)
(*                                                                        *)
(*                         The Zen/Aum Library                            *)
(*                                                                        *)
(*                              Gérard Huet                               *)
(*                                                                        *)
(* ©2005 Institut National de Recherche en Informatique et en Automatique *)
(**************************************************************************)

(* The reactive engine - an aum simulator used by transducers. *)
(* This model uses both External and Internal transitions.  *)

open Aumt.Auto; (* [auto State transition External Internal deter choices] *)

module React
  (Disp: sig 
        type phase;
        value transducer : phase -> auto;
        value initial : phase;
        value terminal : phase -> bool;
        value dispatch : phase -> list phase;
        end) = struct

open Disp
;
type input = Word.word 
and output = list (phase * Word.word)
;

(* Access stack in the deterministic part of the automaton. *)
type stack = list (Word.letter * auto)
;
type backtrack =
  [ Choose of phase and input and output and auto and stack and choices
  | Advance of phase and input and output and Word.word
  ]
and resumption = list backtrack (* coroutine resumptions *)
;

(* A few service routines. *)

(* [advance : int -> word -> word]                             *)
(* [advance n [ a1; ... aN ] = [ ap; ... aN ]] where [p = N-n] *)
(* precondition: [n <= N = |w| ]  exception: [Guard].          *)
exception Guard
;
value rec advance n w = if n = 0 then w else match w with
  [ [] -> raise Guard
  | [ _ :: tl ] -> advance (n-1) tl
  ]
; 

(* [access : phase -> word -> ( auto * stack )] *)
value access phase = acc (transducer phase) []
   where rec acc state stack = fun
      [ [] -> Some (state,stack)
      | [ c :: rest ] -> match state with
        [ State (deter,_) -> match List2.ass c deter with 
                [ Some next_state -> acc next_state [ (c,state) :: stack ] rest
                | None -> None 
                ] 
        ]
      ]
;

(* The scheduler gets its phase transitions from dispatch. *)
value schedule phase input output w cont =
  let add phase cont = [ Advance phase input output w :: cont ] in
  List.fold_right add (dispatch phase) cont (* respects dispatch order *)
; 
value rec pop n state stack =
  if n=0 then (state,stack)
  else match stack with 
     [ [] -> raise (Failure "Wrong Internal jump")
     | [ (_,st) :: rest ] -> pop (n-1) st rest
     ]
and push w state stack = match w with
     [ [] -> (state,stack)
     | [ c :: rest ] -> match state with
       [ State (deter,_) -> 
         push rest (List.assoc c deter) [ (c,state) :: stack ]
       ]
     ]
;
value jump (n,w) state stack = 
  let (state0,stack0) = pop n state stack in
  push w state0 stack0
;
value extract stack (_,(u,_)) = 
  List.fold_left unstack u stack
    where unstack acc (c,_) = [ c :: acc ]
;
value final v = 
  v=[] (* or some end of input marker *)
;

(* The non deterministic reactive engine:                                    *)
(* [phase] is the parsing phase,                                             *)
(* [input] is the input tape represented as a [word],                        *)
(* [output] is the current result of type [output],                          *)
(* [back] is the backtrack stack of type [resumption],                       *)
(* [stack] is the current reverse access path in the deterministic part and  *)
(* [state] is the current state of type [auto].                              *)
value rec react phase input output back stack state = match state with
  [ State (det,choices) -> 
    (* we try the deterministic space before the non deterministic one *)
    let cont = if choices=[] then back
               else [ Choose phase input output state stack choices :: back ] in
    match input with
       [ [] -> continue cont
       | [ letter :: rest ] -> match List2.ass letter det with
              [ Some next_state -> 
                  let next_stack = [ (letter,state) :: stack ] in
                  react phase rest output cont next_stack next_state      
              | None -> continue cont
	      ]
       ] 
  ]
and choose phase input output back state stack = fun
  [ [] -> continue back 
  | [ External((w,(u,v)) as rule) :: others ] -> 
       let cont = if others=[] then back
                  else [ Choose phase input output state stack others :: back ] in
       match List2.subtract input w with (* try to read [w] on [input] *)
         [ Some tape ->
              let out = [ (phase,extract stack rule) :: output ] in
              if tape = [] (* input finished *) then
                    if terminal phase && final v then Some (out,cont)
                    else continue cont
              else continue (schedule phase tape out (Word.mirror v) cont)
         | None -> continue cont 
         ]
   | [ Internal(w,delta) :: others ] -> 
       let cont = if others=[] then back
                  else [ Choose phase input output state stack others :: back ] in
       match List2.subtract input w with (* try to read [w] on [input] *)
         [ Some tape ->
              let (next_state,next_stack) = jump delta state stack in
              react phase tape output cont next_stack next_state
         | None -> continue cont
         ]
  ]
and continue = fun
  [ [] -> None
  | [ resume :: back ] -> match resume with
      [ Choose phase input output state stack choices -> 
          choose phase input output back state stack choices 
      | Advance phase input output word -> match access phase word with
             [ Some (next_state,next_stack) ->
               react phase input output back next_stack next_state 
             | None -> continue back 
             ]
      ] 
  ]
;
value init_react sentence = [ Advance initial sentence [] [] ]
; 
value react1 sentence = continue (init_react sentence)
;
end; 
