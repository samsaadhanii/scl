type sup = ( int * int * int * string * string * string * string *string * int  * string * int )
(*{ id : int
  ; cid : int
  ; mid : int
  ; word : string
  ; rt : string
  ; pUrvapaxa : string
  ; uwwarapaxa : string
  ; lifgam : string
  ; viBakwiH : int 
  ; vacanam : string
  ; level : int
  } *)
and wif = ( int * int * int * string * string * string * string * string *string * string * string * string * string * string * string * int )
(*{ id : int  
  ; cid : int   
  ; mid : int   
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
  ; level : int
  }*)
and kqw = ( int * int * int * string * string *  string *string *string * string * string * string * string * string * string * int * string * int )
(*{ id : int   
  ; cid : int   
  ; mid : int   
  ; word : string   
  ; kqw_vb_rt : string   
  ; upasarga : string
  ; sanAxi_prawyayaH : string   
  ; kqw_prawyayaH : string 
  ; prayogaH : string 
  (*; dhatu : string  *) 
  ; gaNaH : string
  ; rt : string   
  ; pUrvapaxa : string
  ; uwwarapaxa : string
  ; lifgam : string   
  ; viBakwiH : int   
  ; vacanam : string   
  ; level : int
 }*)
and avy = ( int * int * int * string * string * string *string * int )
(*{ id : int   
  ; cid : int   
  ; mid : int   
  ; word : string
  ; rt : string   
  ; pUrvapaxa : string
  ; uwwarapaxa : string
  ; level : int
  }*)
and avywaxXiwa = ( int * int * int * string * string * string *string * string  * int )
(*{ id : int   
  ; cid : int   
  ; mid : int   
  ; word : string   
  ; rt : string   
  ; pUrvapaxa : string
  ; uwwarapaxa : string
  ; waxXiwa_prawyayaH : string
  ; level : int
  }*)
and avykqw = ( int * int * int * string *  string *string * string * string * string * string * string * int )
(*{ id : int   
  ; cid : int   
  ; mid : int   
  ; word : string   
  ; rt : string   
  ; pUrvapaxa : string
  ; uwwarapaxa : string
  ; upasarga : string
  ; sanAxi_prawyayaH : string
  ; kqw_prawyayaH : string   
 (* ; dhatu : string*)
  ; gaNaH : string   
  ; level : int   
  }*)
and waxXiwa = (  int * int * int * string * string * string * string * string * string * int * string * int )
(*{ id : int   
  ; cid : int   
  ; mid : int   
  ; word : string   
  ; rt : string   
  ; pUrvapaxa : string
  ; uwwarapaxa : string
  ; waxXiwa_prawyayaH : string   
  ; lifgam : string   
  ; viBakwiH : int   
  ; vacanam : string
  ; level : int
  }*)
and rel = ( int * int * int * string * int * int * int * string * int)
(* { to_id : int
   ; to_cid : int
   ; to_mid : int
   ; reltn : string
   ; from_id : int
   ; from_cid : int
   ; from_mid : int
   ; rule : string
   ; dist : int
   }*)
and relc = ( int * int * int  * int * int * int * int * int)
(* { to_id : int
   ; to_cid : int
   ; to_mid : int
   ; reltn : int
   ; from_id : int
   ; from_cid : int
   ; from_mid : int
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

type relation =
  [ Relation of rel ]
;

type relationc =
  [ Relationc of relc ]
;
