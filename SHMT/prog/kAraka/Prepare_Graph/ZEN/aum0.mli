(**************************************************************************)
(*                                                                        *)
(*                         The Zen/Aum Library                            *)
(*                                                                        *)
(*                              Gérard Huet                               *)
(*                                                                        *)
(* ©2005 Institut National de Recherche en Informatique et en Automatique *)
(**************************************************************************)

(* The auto structure for simplistic aums. This is a very simplified model with 
   deterministic dictionaries; phase transition occurs at accepting states. *)

module Auto : sig

type auto = [ State of (bool * deter) ]
   (* [bool] is [True] for accepting states *)
and deter = list (Word.letter * auto) 
   (* deter is the deterministic structure *)
;
end;
