(**************************************************************************)
(*                                                                        *)
(*                         The Zen/Aum Library                            *)
(*                                                                        *)
(*                              Gérard Huet                               *)
(*                                                                        *)
(* ©2005 Institut National de Recherche en Informatique et en Automatique *)
(**************************************************************************)

(* The auto structure: model with both External and Internal transitions. *)

module Auto : sig

type continuation = (Word.word * Word.word)
and transition = 
  [ External of (Word.word * continuation)
  | Internal of (Word.word * Word.delta)
  ]
;

(* An internal transition [Internal(w,d)] recognizes [w] on the input tape
   and jumps to the state relatively addressed by [d].
   An external transition [External(w,c)] recognizes [w] on the input tape
   and executes the continuation [c]. 
   A continuation [(u,v)] stores words [u] as output parameter 
   and [v] as access parameter in the next phase transducer. 

   The role of the continuation [(u,v)] depends on the application at hand. 
   Typically, in a segmentation application, [u] will indicate some suffix 
   of a word of the current phase language (the maximal suffix of a word 
   which may be affected by a phonetic change), while [v] will indicate the 
   minimal prefix of a word in the next phase language which provokes the 
   phonetic change. Thus, in the Sanskrit application, where segmentation
   does the analysis of euphony transformation, the transition
   [External(w,(u,v))] will correspond to the sandhi rule [(rev u)|v -> w]. *)

type auto = [ State of (deter * choices) ]
and deter = list (Word.letter * auto) 
   (* deter is the deterministic structure *)
and choices = list transition;

(* NB. In realistic applications, [State] should carry a boolean for acceptance *)

end
;

