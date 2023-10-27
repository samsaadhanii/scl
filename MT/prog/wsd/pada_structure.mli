type sup = ( int * int * string * string * string * string * string * int  * string * string * int * int)
(*{ id : int
  ; cid : int
  ; word : string
  ; rt : string
  ; pUrvapaxa : string
  ; uwwarapaxa : string
  ; lifgam : string
  ; viBakwiH : int 
  ; vacanam : string
  ; rel_nm : string
  ; relata_pos_id : int
  ; relata_pos_cid : int
  } *)
and wif = ( int * int * string * string * string * string * string * string * string * string * string * string * string * string * string * int * int)
(*{ id : int  
  ; cid : int   
  ; word : string   
  ; rt : string   
  ; pUrvapaxa : string
  ; uwwarapaxa : string
  ; upasarga : string
  ; sanAxiH : string
  ; prayogaH : string   
  ; lakAraH : string   
  ; puruRaH : string   
  ; vacanam : string   
  ; paxI : string   
  (*; dhatu : string  (* XAwuH *) *)
  ; gaNaH : string   
  ; rel_nm : string
  ; relata_pos_id : int
  ; relata_pos_cid : int
  }*)
and kqw = ( int * int * string * string * string * string * string * string * string * string * string * string * string * int * string * string * int * int)
(*{ id : int   
  ; cid : int   
  ; word : string   
  ; rt : string   
  ; upasarga : string
  ; sanAxiH : string   
  ; kqw_prawyayaH : string   
  ; dhatu : string   
  ; gaNaH : string
  ; kqw_pratipadika : string   
  ; pUrvapaxa : string
  ; uwwarapaxa : string
  ; lifgam : string   
  ; viBakwiH : int   
  ; vacanam : string   
  ; rel_nm : string
  ; relata_pos_id : int
  ; relata_pos_cid : int
 }*)
and avy = ( int * int * string * string * string * string * string * int * int)
(*{ id : int   
  ; cid : int   
  ; word : string
  ; rt : string   
  ; pUrvapaxa : string
  ; uwwarapaxa : string
  ; rel_nm : string
  ; relata_pos_id : int
  ; relata_pos_cid : int
  }*)
and avywaxXiwa = ( int * int * string * string * string * string * string  * string * int * int)
(*{ id : int   
  ; cid : int   
  ; word : string   
  ; rt : string   
  ; pUrvapaxa : string
  ; uwwarapaxa : string
  ; waxXiwa_prawyayaH : string
  ; rel_nm : string
  ; relata_pos_id : int
  ; relata_pos_cid : int
  }*)
and avykqw = ( int * int * string * string * string * string * string * string * string * string * string * string * int * int)
(*{ id : int   
  ; cid : int   
  ; word : string   
  ; rt : string   
  ; pUrvapaxa : string
  ; uwwarapaxa : string
  ; upasarga : string
  ; sanAxiH : string
  ; kqw_prawyayaH : string   
  ; dhatu : string
  ; gaNaH : string   
  ; rel_nm : string
  ; relata_pos_id : int
  ; relata_pos_cid : int
  }*)
and waxXiwa = ( int * int * string * string * string * string * string * string * int * string * string * int * int)
(*{ id : int   
  ; cid : int   
  ; word : string   
  ; rt : string   
  ; pUrvapaxa : string
  ; uwwarapaxa : string
  (*; waxXiwa_rt : string   *)
  ; waxXiwa_prawyayaH : string   
  ; lifgam : string   
  ; viBakwiH : int   
  ; vacanam : string
  ; rel_nm : string
  ; relata_pos_id : int
  ; relata_pos_cid : int
  }*)
and wsd = ( int * int * string * string * string * string)
(* { id : int
   ; cid : int
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
