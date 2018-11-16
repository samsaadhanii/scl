(**************************************************************************)
(*                                                                        *)
(*                         The Zen/Aum Library                            *)
(*                                                                        *)
(*                              Gérard Huet                               *)
(*                                                                        *)
(* ©2005 Institut National de Recherche en Informatique et en Automatique *)
(**************************************************************************)

(* Engine [sanskrit_engine] using aumt structure with sanskrit.aut. *)

open Aumt; (* Auto *)
open Reactt; (* React *)
open Sanskrit_dispatch; (* Automata *)

module Automata_Aumt = Automata Auto
;
open Automata_Aumt; (* [auto_vect] Disp *)

module Gen_engine
 (Fsm: sig value autos: auto_vect; end) = struct 

  module Phases = Disp Fsm
  ;
  open Phases (* phase, transducer, etc *)
  ;
  module Engine = React Phases
  ;
 end
;

(* Now we may provide the Sanskrit lexicons for the various lexical sorts as a vector *)
(* [auto_vect={epsilon_aum=aum_0; noun=aum_noun; ... prev=aum_prev}] *)
(* in a module [Sanskrit_Aumt]. *)

(* We may then call the properly instanciated functor
[(Gen_engine Sanskrit_Aumt)] in order to get e.g. [Engine.react1]. *)
