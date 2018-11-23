(**************************************************************************)
(*                                                                        *)
(*                         The Zen/Aum Library                            *)
(*                                                                        *)
(*                              Gérard Huet                               *)
(*                                                                        *)
(* ©2005 Institut National de Recherche en Informatique et en Automatique *)
(**************************************************************************)

(* The reactive engine - an aum interpreter.
   Simplistic model with just deterministic transitions and no loops. 
   Phase transition occurs at accepting states and jump to initial states 
   of next phases. *)

open Aum0.Auto; (* auto State deter *)

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

(* Access stack in the deterministic part of the automaton: *)
type stack = list (Word.letter * auto)
;
type backtrack =
  [ Advance of phase and input ]
and resumption = list backtrack (* coroutine resumptions *)
;

(* The scheduler gets its phase transitions from dispatch. *)
value schedule phase input cont =
  let add phase cont = [ Advance phase input :: cont ] in
  List.fold_right add (dispatch phase) cont (* respects dispatch order *)
; 

(* The reactive engine:
   [phase] is the parsing phase,
   [input] is the input tape represented as a [word],
   [back] is the backtrack stack of type [resumption]. *)
value rec react phase input back = fun
  [ State (b,det) -> 
    let deter cont = match input with
      [ [] -> continue cont
      | [ letter :: rest ] -> 
        let opt_state = try Some (List.assoc letter det) with
                        [ Not_found -> None ] in
        match opt_state with
        [ Some s -> react phase rest cont s  
	| None -> continue cont
	]
      ] in
    if b then 
      if input=[] then 
        if terminal phase then Some back (* solution found *)
        else continue back
      else let cont = schedule phase input back in
           deter cont
    else deter back
  ]
and continue = fun
  [ [] -> None
  | [ resume :: back ] -> match resume with
      [ Advance phase input -> 
         react phase input back (transducer phase)
      ]
  ]
;
value init_react sentence = [ Advance initial sentence ]
; 
value react1 sentence = continue (init_react sentence)
;

(* Computing multiplicities *)
value multiplicity sentence = 
  count 0 (init_react sentence)
  where rec count n c =
    match continue c with
    [ Some next -> count (n+1) next
    | None -> n
    ]
;
end; 
