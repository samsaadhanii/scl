open Pada_structure;
open Common;
open Global_var;
open Adata;

(* rAmaH eva vanam gacCawi. 
   rAmaH api gacCawi.
   We need to prepare a list of avyayas from avayayakosha  *)

value rlsambanXa1 m1 m2 text_type = match m2 with
  [ Avy (id2,cid2,mid2,_,rt2,_,_,_) ->
         match m1 with
       [ Sup (id1,cid1,mid1,word1,_,_,_,_,_,_,_)
       | Wif (id1,cid1,mid1,word1,_,_,_,_,_,_,_,_,_,_,_,_) 
       | Kqw (id1,cid1,mid1,word1,_,_,_,_,_,_,_,_,_,_,_,_,_)
       | WaxXiwa (id1,cid1,mid1,word1,_,_,_,_,_,_,_,_) 
       | Avy (id1,cid1,mid1,word1,_,_,_,_)
       | Avykqw (id1,cid1,mid1,word1,_,_,_,_,_,_,_,_)
       | AvywaxXiwa (id1,cid1,mid1,word1,_,_,_,_,_) ->
             let  d12 = if id1 > id2 then id1-id2 else id2-id1 
             and  cat = get_cat m1 in 
             match rt2 with 
             [ "eva"|"wu"|"nu"|"ha"|"cEva"|"Kalu"|"vE" ->
                 if   (id1 = previous id2)
                   && ( not (cat = "sup") ||  (get_viB m1 < 8))
                   && not (cat= "wif")
                 then [ Relation (id2,cid2,mid2,"saM",id1,cid1,mid1,"35.10",d12)]
		 else [] 
             | "api" ->
                   if (cat= "wif") && id1 = 1
                   then [ Relation (id2,cid2,mid2,"saM",id1,cid1,mid1,"35.10",d12)]
                   else if (id1 = previous id2)
                        && ( not (cat = "sup") ||  (get_viB m1 < 8))
                        && not (cat= "wif")
                       then [ Relation (id2,cid2,mid2,"saM",id1,cid1,mid1,"35.10",d12)]
		       else [] 
             | "aWaca" | "iwoZpi"|"yaxvA"|"yaxi" | "warhi" | "paranwu" | "kinwu" | "apiwu"| "awaH" | "wawaH" ->
                 if (id1 > id2) && get_cat m1 = "wif"
                 then [ Relation (id2,cid2,mid2,"saM",id1,cid1,mid1,"35.9",d12)]
		 else []
             | "yaw" -> 
                  let rt2 = get_rt m2
                  and upasarga2 = get_upasarga m2
                  and kqw2 = get_kqw_suff m2 
                  and vib2 = get_viB m2 in
                    match cat with
                    [ "wif" -> if (id1 < id2) && not (members_of rt2 upasarga2 vAkyakarma_verbs)
                               then [ Relation (id1,cid1,mid1,"saM",id2,cid2,mid2,"47.2",d12) ]
                               else  []
                    | "kqw" -> if    (kqw2="kwa" || kqw2 = "kwavawu" || kqw2 = "wavyaw" || kqw2 = "anIyar")
                                  && finite_verb_in_sentence.val == 50
                                  && vib2 = 1
                               then [ Relation (id1,cid1,mid1,"saM",id2,cid2,mid2,"47.2",d12) ]
                               else []
                    | _ -> []
                    ]
             |"prawilomam" |"aWa" |"aWakim" -> 
                  if ((id1 = 1  && text_type="Prose") || (text_type = "Sloka")) 
                  then match cat with
                       [ "wif" -> [ Relation (id1,cid1,mid1,"saM",id2,cid2,mid2,"47.3",d12) ]
                       | "kqw" -> let kqw2 = get_kqw_suff m2 
                                  and vib = get_viB m2 in
                                  if   (kqw2="kwa" || kqw2 = "kwavawu" || kqw2 = "wavyaw" || kqw2 = "anIyar")
                                    && finite_verb_in_sentence.val == 50 && vib=1
                                  then [ Relation (id1,cid1,mid1,"saM",id2,cid2,mid2,"47.2",d12) ]
                                  else []
                       | _ -> []
                       ]
                  else []
             |"iwaH" |"evaFca" |"vA" |"nocew" |"anyaWA" |"aWavA" |"uwa" |"uwApi" |"uwasviw" 
             |"yaxvaw" |"waWA" |"waxvaw" |"waWEva" |"waWaHparam" |"wawwvawaH" |"waxananwaram" -> 
                  if (id1 = 1)
                  then match cat with
                       [ "wif" -> [ Relation (id1,cid1,mid1,"saM",id2,cid2,mid2,"47.4",d12) ]
                       | "kqw" -> let kqw = get_kqw_suff m2 
                                  and vib = get_viB m2 in
                                  if   (kqw="kwa" || kqw = "kwavawu" || kqw = "wavyaw" || kqw = "anIyar")
                                    && finite_verb_in_sentence.val == 50 && vib=1
                                  then [ Relation (id1,cid1,mid1,"saM",id2,cid2,mid2,"47.2",d12) ]
                                  else []
                       | _ -> []
                       ]
                  else []
             | _ -> []
             ]
       ]
  | Sup (id2,cid2,mid2,word2,rt2,_,_,_,viB2,vac2,_) ->
        match m1 with
       [ Sup (id1,cid1,mid1,_,rt1,_,_,_,viB1,vac1,_) ->
          let  d12 = if id1 > id2 then id1-id2 else id2-id1 in
                if viB1 = 5 && rt2 = "Baya" && id1 = previous id2  
                then [ Relation (id1,cid1,mid1,"apA",id2,cid2,mid2,"35.11",d12)]
                else []

       | _ -> []
       ]
  | _ -> []
  ]
;
