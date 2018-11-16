type sup = ( int * int * string * string * string * string * int  * string * string * int)
(*{ id : int
  ; mid : int
  ; word : string
  ; rt : string
  ; compound_hd : string
  ; lifgam : string
  ; viBakwiH : int 
  ; vacanam : string
  ; rel_nm : string
  ; relata_pos : int
  } *)
and wif = ( int * int * string * string * string * string * string * string * string * string * string * string * string * string * string * int)
(*{ id : int  
  ; mid : int   
  ; word : string   
  ; rt : string   
  ; compound_hd : string
  ; upasarga : string
  ; sanAxiH : string
  ; prayogaH : string   
  ; lakAraH : string   
  ; puruRaH : string   
  ; vacanam : string   
  ; paxI : string   
  ; dhatu : string  (* XAwuH *)
  ; gaNaH : string   
  ; rel_nm : string
  ; relata_pos : int
  }*)
and kqw = ( int * int * string * string * string * string * string * string * string * string * string * string * int * string * string * int)
(*{ id : int   
  ; mid : int   
  ; word : string   
  ; rt : string   
  ; upasarga : string
  ; sanAxiH : string   
  ; kqw_prawyayaH : string   
  ; dhatu : string   
  ; gaNaH : string
  ; kqw_pratipadika : string   
  ; compound_hd : string
  ; lifgam : string   
  ; viBakwiH : int   
  ; vacanam : string   
  ; rel_nm : string
  ; relata_pos : int
 }*)
and avy = ( int * int * string * string * string * string * int)
(*{ id : int   
  ; mid : int   
  ; word : string
  ; rt : string   
  ; compound_hd : string
  ; rel_nm : string
  ; relata_pos : int
  }*)
and avywaxXiwa = ( int * int * string * string * string * string  * string * int)
(*{ id : int   
  ; mid : int   
  ; word : string   
  ; rt : string   
  ; compound_hd : string
  ; waxXiwa_prawyayaH : string
  ; rel_nm : string
  ; relata_pos : int
  }*)
and avykqw = ( int * int * string * string * string * string * string * string * string * string * int)
(*{ id : int   
  ; mid : int   
  ; word : string   
  ; rt : string   
  ; compound_hd : string
  ; sanAxiH : string
  ; kqw_prawyayaH : string   
  ; dhatu : string
  ; gaNaH : string   
  ; rel_nm : string
  ; relata_pos : int
  }*)
and waxXiwa = ( int * int * string * string * string * string * string * string * int * string * string * int)
(*{ id : int   
  ; mid : int   
  ; word : string   
  ; rt : string   
  ; compound_hd : string
  ; waxXiwa_rt : string   
  ; waxXiwa_prawyayaH : string   
  ; lifgam : string   
  ; viBakwiH : int   
  ; vacanam : string
  ; rel_nm : string
  ; relata_pos : int
  }*)
and wsd = ( int * int * string * string * string * string)
(* { id : int
   ; mid : int
   ; category : string
   ; ambiguous_val : string
   ; unambiguous_val : string
   ; rule : string
   }*)
;

type morph = 
  [ Sup of sup
  | Wif of wif
  | Kqw  of kqw
  | Avy of avy
  | AvywaxXiwa of avywaxXiwa
  | Avykqw of avykqw
  | WaxXiwa of waxXiwa
  ]
;

type relation =
  [ Relation of wsd ]
;
