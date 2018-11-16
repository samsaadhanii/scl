(**************************************************************************)
(*                                                                        *)
(*                         The Zen/Aum Library                            *)
(*                                                                        *)
(*                              Gérard Huet                               *)
(*                                                                        *)
(* ©2005 Institut National de Recherche en Informatique et en Automatique *)
(**************************************************************************)

(* The reactive engine - an aum simulator used by transducers. *)
(* This model uses only External transitions.  *)

open Aume.Auto; (* [auto State transition deter choices] *)

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
;
type backtrack =
  [ Choose of phase and input and auto and choices
  | Advance of phase and input and Word.word
  ]
and resumption = list backtrack (* coroutine resumptions *)
;

(* A few service routines. *)

(* [access : phase -> word -> auto ] *)
value access phase = acc (transducer phase) 
   where rec acc state = fun
      [ [] -> Some state
      | [ c :: rest ] -> match state with
        [ State (deter,_) -> match List2.ass c deter with 
                [ Some next_state -> acc next_state rest
                | None -> None 
                ] 
        ]
      ]
;
(* The scheduler gets its phase transitions from dispatch. *)
value schedule phase input v cont =
  let add phase cont = [ Advance phase input v :: cont ] in
  List.fold_right add (dispatch phase) cont (* respects dispatch order *)
; 
value final v = 
  v=[] (* or some end of input marker *)
;

(* The non deterministic reactive engine:
   [phase] is the parsing phase,
   [input] is the input tape represented as a [word],
   [back] is the backtrack stack of type [resumption],
   [state] is the current state of type [auto]. *)
value rec react phase input back state = match state with
  [ State (det,choices) -> 
    (* we try the deterministic space before the non deterministic one *)
    let cont = if choices=[] then back
               else [ Choose phase input state choices :: back ] in
    match input with
       [ [] -> continue cont
       | [ letter :: rest ] -> match List2.ass letter det with
            [ Some next_state -> react phase rest cont next_state
            | None -> continue cont
            ]
       ]
  ]
and choose phase input back state = fun
  [ [] -> continue back 
  | [ (w,v) :: others ] -> 
       let cont = if others=[] then back
                  else [ Choose phase input state others :: back ] in
       match List2.subtract input w with (* try to read [w] on [input] *)
         [ Some tape ->
              if tape = [] (* input finished *) then
                   if terminal phase && final v then cont
                   else continue cont
              else continue (schedule phase tape v cont)
         | None -> continue cont
         ]
  ]
and continue = fun
  [ [] -> []
  | [ resume :: back ] -> match resume with
      [ Choose phase input state choices -> 
            choose phase input back state choices 
      | Advance phase input word -> match access phase word with
             [ Some next_state -> react phase input back next_state
             | None -> continue back 
             ]
      ] 
  ]
;
value init_react sentence = [ Advance initial sentence [] ]
; 
value react1 sentence = continue (init_react sentence)
;
end; 
