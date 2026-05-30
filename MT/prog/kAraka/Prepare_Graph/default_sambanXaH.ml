open Pada_structure;
open Common;
open Adata;

(* rAmaH eva vanam gacCawi. 
   rAmaH api gacCawi.
   We need to prepare a list of avyayas from avayayakosha  *)

value rlsambanXa1 m1 m2 text_type = match m2 with
  [ Avy (id2,cid2,mid2,_,rt2,_,_,_) ->
       match rt2 with 
       [
       "aWaca"|"eva"|"wu"|"nu"|"ha"|"cEva"|"Kalu"|"vE"|"api"|"iwoZpi"|"yaxvA"|"yaxi" | "warhi" | "paranwu" | "kinwu" | "apiwu"| "awaH" | "wawaH" | "COMMA"|"," -> match m1 with
             (* iva removed *)
        [ Wif (id1,cid1,mid1,word1,_,_,_,_,_,_,_,_,_,_,_,_)
        | Kqw (id1,cid1,mid1,word1,_,_,_,_,_,_,_,_,_,_,_,_,_)
        | Avykqw (id1,cid1,mid1,word1,_,_,_,_,_,_,_,_)
        | AvywaxXiwa (id1,cid1,mid1,word1,_,_,_,_,_)
        | Avy (id1,cid1,mid1,word1,_,_,_,_)
        | WaxXiwa (id1,cid1,mid1,word1,_,_,_,_,_,_,_,_) -> 
         let  d12 = if id1 > id2 then id1-id2 else id2-id1 in
             if (rt2="aWaca" || rt2 = "iwoZpi" || rt2 = "yaxvA"|| rt2 = "yaxi"||rt2="warhi"||rt2="paranwu"||rt2="kinwu"||rt2="apiwu"||rt2="awaH"||rt2="wawaH") 
                 then if (id1 > id2) 
                      then [ Relation (id2,cid2,mid2,"sambanXaH",id1,cid1,mid1,"35.9",d12)]
		      else []
                 else if (id1 = previous id2)
                 then [ Relation (id2,cid2,mid2,"sambanXaH",id1,cid1,mid1,"35.10",d12)]
		 else []
       | Sup (id1,cid1,mid1,word1,rt1,_,_,_,viBakwiH1,_,_) ->
         let  d12 = if id1 > id2 then id1-id2 else id2-id1 in
         if     not(viBakwiH1=8) && id1 = previous id2  && (not (rt2 = "api") || id2 > 1 ) (* if id2 = 1 & word2 = api - Question type;  id2 > 1; word2 = api, then sambanXa with verb -- conjunction with previous sentence *)
         then [ Relation (id2,cid2,mid2,"sambanXaH",id1,cid1,mid1,"35.11",d12)]
         else []
       ]
     | _ -> []
     ]
  | Sup (id2,cid2,mid2,word2,rt2,_,_,_,viB2,vac2,_) ->
        match m1 with
        [ Sup (id1,cid1,mid1,_,rt1,_,_,_,viB1,vac1,_) ->
       let  d12 = if id1 > id2 then id1-id2 else id2-id1 in
                if viB1 = 5 && rt2 = "Baya" && id1 = previous id2  
                then [ Relation (id1,cid1,mid1,"apAxAnam",id2,cid2,mid2,"35.11",d12)]
                (* else if viB1 = 7 && ((vac1 = "xvi" && vac2 = "eka") || vac1 = "bahu" ) && rt1 = "wax"
                then [ Relation (id1,cid1,mid1,"viSeRaNam",id2,cid2,mid2,"27.11",d12)] 
        I think this should be treated as nirXAraNam rather than viSeRaNam
                wayoH ekA nArI; una (xo nArIoM) meM se eka nArI *) 
                else []

        | _ -> []
        ]
    | _ -> []
  ]
;


