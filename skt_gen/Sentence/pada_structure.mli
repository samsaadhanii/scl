type sup = ( int * string * string * string * string * string * int)
(*{ id : int
  ; rt : string
  ; cat : string
  ; lifgam : string
  ; vacanam : string
  ; rel : string
  ; to_id : int
  } *)
and wif = ( int * string * string * string * string * string * string * int)
(*{ id : int  
  ; upasarga : string
  ; rt : string   
  ; san_suff : string
  ; prayoga : string   
  ; lakAra : string   
  ; rel : string   
  ; to_indx : int   
  }*)
and kqw = ( int *  string * string * string * string * string * string * string * int )
(*{ id : int   
  ; upasarga : string
  ; rt : string   
  ; san_suff : string   
  ; kqw_suff : string 
  ; gen : string   
  ; num : string   
  ; rel : string   
  ; to_indx : int
 }*)
and avy = ( int * string * string * int )
(*{ id : int   
  ; rt : string   
  ; rel : string   
  ; to_indx: int   
  }*)
and avykqw = ( int *  string * string * string *string * string  * int )
(*{ id : int   
  ; upasarga : string
  ; rt : string   
  ; san_suff : string
  ; kqw_suff : string   
  ; rel : string
  ; to_indx : int   
  }*)
and waxXiwa = ( int * string * string * string *string * string * int )
(*{ id : int   
  ; rt : string   
  ; waxXiwa_suff : string   
  ; gen : string   
  ; num : string   
  ; rel : string
  ; to_indx : int
  }*)
and sup_viSeRaNa = ( int * string * string * int )
(*{ id : int   
  ; rt : string   
  ; rel : string   
  ; to_indx: int   
  }*)
and kqw_viSeRaNa = ( int *  string * string * string *string * string  * int )
(*{ id : int   
  ; upasarga : string
  ; rt : string   
  ; san_suff : string
  ; kqw_suff : string   
  ; rel : string
  ; to_indx : int   
  }*)
;

type parse = 
  [ Sup of sup
  | Sup_viSeRaNa of sup_viSeRaNa
  | Wif of wif
  | Kqw  of kqw
  | Kqw_viSeRaNa  of kqw_viSeRaNa
  | Avy of avy
  | Avykqw of avykqw
  | WaxXiwa of waxXiwa
  ]
;
