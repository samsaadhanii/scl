type sup = ( int * int *  int * string * string * string * string *string * int  * string * string * int * int )
(*{ sid : int
  ; id : int
  ; cid : int
  ; word : string
  ; rt : string
  ; pUrvapaxa : string
  ; uwwarapaxa : string
  ; lifgam : string
  ; viBakwiH : int 
  ; vacanam : string
  ; rel : string
  ; toid : int
  ; tocid : int
  } *)
and wif = ( int * int * int * string * string * string * string * string *string * string * string * string * string * string * string * string * int * int )
(*{ sid : int  
  ; id : int   
  ; cid : int   
  ; word : string   
  ; rt : string   
  ; pUrvapaxa : string
  ; uwwarapaxa : string
  ; upasarga : string
  ; sanAxi_prawyayaH : string
  ; prayogaH : string   
  ; lakAraH : string   
  ; puruRaH : string   
  ; vacanam : string   
  ; paxI : string   
 (* ; dhatu : string  (* XAwuH *) *)
  ; gaNaH : string
  ; rel : string
  ; toid : int
  ; tocid : int
  }*)
and kqw = ( int * int * int * string * string * string * string * string * string * string * string * string * string * string * int * string * string * int * int )
(*{ sid : int   
  ; id : int   
  ; cid : int   
  ; word : string   
  ; kqw_vb_rt : string   
  ; pUrvapaxa : string
  ; uwwarapaxa : string
  ; upasarga : string
  ; sanAxi_prawyayaH : string   
  ; kqw_prawyayaH : string 
  ; prayogaH : string 
  (*; dhatu : string  *) 
  ; gaNaH : string
  ; rt : string   
  ; lifgam : string   
  ; viBakwiH : int   
  ; vacanam : string   
  ; rel : string
  ; toid : int
  ; tocid : int
 }*)
and avy = (  int * int * int * string * string * string *string * string * int * int)
(*{ sid : int   
  ; id : int   
  ; cid : int   
  ; word : string
  ; rt : string   
  ; pUrvapaxa : string
  ; uwwarapaxa : string
  ; rel : string
  ; tocid : int
  ; tomid : int
  }*)
and avywaxXiwa = (  int * int * int * string * string * string *string * string  * string * int * int )
(*{ sid : int   
  ; id : int   
  ; cid : int   
  ; word : string   
  ; rt : string   
  ; pUrvapaxa : string
  ; uwwarapaxa : string
  ; waxXiwa_prawyayaH : string
  ; rel : string
  ; toid : int
  ; tocid : int
  }*)
and avykqw = ( int * int * int * string *  string *string * string * string * string * string * string * string * int * int )
(*{ sid : int   
  ; id : int   
  ; cid : int   
  ; word : string   
  ; rt : string   
  ; pUrvapaxa : string
  ; uwwarapaxa : string
  ; upasarga : string
  ; sanAxi_prawyayaH : string
  ; kqw_prawyayaH : string   
 (* ; dhatu : string*)
  ; gaNaH : string   
  ; rel : string
  ; toid : int
  ; tocid : int
  }*)
and waxXiwa = (  int * int * int * string * string * string * string * string * string * int * string * string * int * int )
(*{ sid : int   
  ; id : int   
  ; cid : int   
  ; word : string   
  ; rt : string   
  ; pUrvapaxa : string
  ; uwwarapaxa : string
  ; waxXiwa_prawyayaH : string   
  ; lifgam : string   
  ; viBakwiH : int   
  ; vacanam : string
  ; rel : string
  ; toid : int
  ; tocid : int
  }*)
and discrel = ( int * int * int * string * int * int * int * string * int)
(* { to_sid : int
   ; to_id : int
   ; to_cid : int
   ; reltn : string
   ; from_sid : int
   ; from_id : int
   ; from_cid : int
   ; rule : string
   ; dist : int
   }*)
and discrelc = ( int * int  * int * int * int * int * int * int)
(* { to_aid : int
   ; to_id : int
   ; to_cid : int
   ; reltn : int
   ; from_sid : int
   ; from_id : int
   ; from_cid : int
   ; dist : int
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

type discrelation =
  [ Relation of discrel ]
;

type discrelationc =
  [ Relationc of discrelc ]
;
