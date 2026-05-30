open Pada_structure;
open Global_var;
open Common;
open Adata;


(*
sentences with connectives joining a wif with kqw fail, if we have rlsent_kqw_connectives and rlsent_wif_cocnnectives seperately.
For example:  श्यामः विरोधं कर्तुं अचेष्टत किन्तु तस्य वचः कः अपि न श्रुतवान्
failed to parse.
*)

value sent_beginning_connectives id1 cid1 mid1 id2 cid2 mid2 rt2 upasarga2 word1 text_type =
         let d12 = if id1 > id2 then id1-id2 else id2-id1 in
              if no_boundary_crossing_with_iwi id1 id2 text_type || id1=1
              then
	      if id1=1 &&  word1 = "api" && text_type="Prose"
              && no_boundary_crossing_with_iwi id1 id2 text_type
              then [ Relation (id1,cid1,mid1,"sambanXaH",id2,cid2,mid2,"47.1",d12)]
              else if    id1 < id2
              then match word1 with
              [ "yaw" -> if not (members_of rt2 upasarga2 vAkyakarma_verbs)
                         then [ Relation (id1,cid1,mid1,"sambanXaH",id2,cid2,mid2,"47.2",d12)
                              ]
                         else []
              |"prawilomam"
              |"aWa"
              |"aWakim" -> if ((id1 = 1  && text_type="Prose") || (text_type = "Sloka"))  
                            then [ Relation (id1,cid1,mid1,"sambanXaH",id2,cid2,mid2,"47.3",d12) ]
			    else []
              |"iwaH"
              |"evaFca"
              |"vA"
              |"nocew"
              |"anyaWA"
              |"aWavA"
              |"uwa"
              |"uwApi"
              |"uwasviw"
              |"yaxvaw"
              |"waWA"
              |"waxvaw"
              |"waWEva"
              |"waWaHparam"
              |"wawwvawaH"
              |"waxananwaram" -> if (id1 = 1)
			         then  [ Relation (id1,cid1,mid1,"sambanXaH",id2,cid2,mid2,"47.5",d12) ]
			         else []
              | _ -> []
              ]
              else []
              else []
;

value rlsent_beginning_connectives m1 m2 text_type = match m1 with
     [ Avy (id1,cid1,mid1,word1,_,_,_,_) -> match m2 with
         [ Wif (id2,cid2,mid2,_,rt2,_,_,upasarga2,_,_,_,_,_,_,_,_)  ->
           sent_beginning_connectives id1 cid1 mid1 id2 cid2 mid2 rt2 upasarga2 word1 text_type
          | Kqw (id2,cid2,mid2,_,rt2,upasarga2,_,kqw2,_,_,_,_,_,_,viB2,_,_) -> 
                          (* yaWA eweRAM boXaH Bavawi waWA kaScana upAyaH karaNIyaH *)
             if    (kqw2="kwa" || kqw2 = "kwavawu" || kqw2 = "wavyaw" || kqw2 = "anIyar") 
                && viB2=1 
                && finite_verb_in_sentence.val == 50
             then sent_beginning_connectives id1 cid1 mid1 id2 cid2 mid2 rt2 upasarga2 word1 text_type
             else []
          | _ -> []
          ]
     | _ -> []
     ]
; 
