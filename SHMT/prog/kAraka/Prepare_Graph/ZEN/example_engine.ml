(**************************************************************************)
(*                                                                        *)
(*                         The Zen/Aum Library                            *)
(*                                                                        *)
(*                              Gérard Huet                               *)
(*                                                                        *)
(* ©2005 Institut National de Recherche en Informatique et en Automatique *)
(**************************************************************************)

(* Engine [example_engine] using aum0 structure with example.aut *)

open Aum0; (* Auto *)
open React0; (* React *)
open Example_dispatch; (* Automata *)

module Automata_Aum0 = Automata Auto;

open Automata_Aum0; (* [auto_vect] Disp *)

module Gen_engine
 (Fsm: sig value autos: auto_vect; end) = struct 

  module Phases = Disp Fsm
  ;
  open Phases (* phase, transducer, etc *)
  ;
  module Engine = React Phases
  ;
end;

(* Now provide [auto_vect={epsilon_aum=aum_0; a=aum_a; b=aum_b; c=aum_c}] in module [Example_Aum0]
   and call [(Gen_engine Example_Aum0)] in order to get e.g. [Engine.react1] *)
