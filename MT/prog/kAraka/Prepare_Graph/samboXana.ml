open Pada_structure;
open Common;
open Adata;

value rl_exclamatory1 m1 m2 text_type = match m1 with
   [ Avy (id1,cid1,mid1,_,word1,_,_,_) ->  match m2 with
         [ Wif (id2,cid2,mid2,_,_,_,_,_,_,_,_,_,_,_,_,_)
         | Kqw (id2,cid2,mid2,_,_,_,_,_,_,_,_,_,_,_,_,_,_) -> 
         let d12 = if id1 > id2 then id1-id2 else id2-id1 in
              if id1 < id2
              && no_boundary_crossing_with_iwi id1 id2 text_type
              &&   word1="aho" 
              then [ Relation (id1,cid1,mid1,"sambanXaH",id2,cid2,mid2,"54.1",d12) 
                   ]
              else []
         |_ -> []
         ]
      |_ -> []
      ]
;


value rl_exclamatory2 m1 m2 m3 text_type = match m1 with
   [ Avy (id1,cid1,mid1,_,word1,_,_,_) ->  match m2 with
      [ Avy (id2,cid2,mid2,_,word2,_,_,_) -> match m3 with
         [ Wif (id3,cid3,mid3,_,_,_,_,_,_,_,_,_,_,_,_,_)
         | Kqw (id3,cid3,mid3,_,_,_,_,_,_,_,_,_,_,_,_,_,_) -> 
         let d12 = if id1 > id2 then id1-id2 else id2-id1 in
          let d23 = if id2 > id3 then id2-id3 else id3-id2 in
              if id1 = previous id2 && id2 < id3
              && no_boundary_crossing_with_iwi id2 id3 text_type
              &&   ((word1="hA" && word2="hanwa") || 
                  (word1="aho" && word2="bawa") ||
                  (word1="ayi" && word2="Bo") ||
                  (word1="eva" && word2="ca")) 
         (*||
                  (word1="ca" && word2="eva")) 
              How can eva connect to a word after it?
              In prose form it is impossible. and even in Shloka form I can not think of any example *)
              then [ Relation (id1,cid1,mid1,"sambanXaH",id2,cid2,mid2,"55.2",d12) 
                   ; Relation (id2,cid2,mid2,"sambanXaH",id3,cid3,mid3,"55.3",d23) 
                   ]
              else []
         |_ -> []
         ]
      |_ -> []
      ]
   |_ -> []
   ]
;
(* ayi Bo Rama mAma uxXara *)
(* value rlsambanXa2 m1 m2 text_type = match m2 with
  [ Avy (id2,cid2,mid2,word2,_,_,_,_) ->
   match m1 with
     [ Avy (id1,cid1,mid1,word1,_,_,_,_) ->
       let  d12 = if id1 > id2 then id1-id2 else id2-id1 in
    if (id1=previous id2)
       && (member_of word1 samboXana_sUcaka)
       && (member_of word2 samboXana_sUcaka)
       && (not (word1=word2))
       then [ Relation (id1,cid1,mid1,"sambanXaH",id2,cid2,mid2,"28.1",d12)]
       else []
 
     | _ -> []
     ]
  | _ -> []
  ]
  ; *)
value rlsamboXana_xyowakaH m1 m2 text_type = match m2 with
  [ Sup (id2,cid2,mid2,_,_,_,_,_,viBakwiH2,_,_)
  | Kqw (id2,cid2,mid2,_,_,_,_,_,_,_,_,_,_,_,viBakwiH2,_,_)
  | WaxXiwa (id2,cid2,mid2,_,_,_,_,_,_,viBakwiH2,_,_) -> 
   match m1 with
     [ Avy (id1,cid1,mid1,word1,_,_,_,_) ->
       let  d12 = if id1 > id2 then id1-id2 else id2-id1 in
    if  id1=previous id2 
      && member_of word1 samboXana_sUcaka
      && viBakwiH2=8
       then [ Relation (id1,cid1,mid1,"samboXana_xyowakaH",id2,cid2,mid2,"19.1",d12)]
       else []
     | _ -> []
     ]
  (*| Wif (id2,cid2,mid2,_,rt2,_,_,_,_,_,_,_,_,_,_,_) ->
    match m1 with
     [ Avy (id1,cid1,mid1,word1,_,_,_,_) ->
       let  d12 = if id1 > id2 then id1-id2 else id2-id1 in
        if  member_of word1 samboXana_sUcaka
       then [ Relation (id1,cid1,mid1,"sambanXaH",id2,cid2,mid2,"14.2",d12)]
       else []
     | _ -> []
     ] *)
  | _ -> []
  ]
  ;
