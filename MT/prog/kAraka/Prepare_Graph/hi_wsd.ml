open Pada_structure;
open Common;
open Adata;

(* Algo for 'hi' disambiguation
    
 pos(hi) > 3 -- sambanXaH
 X Y 'hi' -> sambanXaH, where X and Y are not wif
 X wif 'hi'  / wif 'hi' --> kAraNa_xyowakaH
 wif 'yax' 'hi' ->  kAraNa_xyowakaH
 wif 'yaxA' 'hi' ->  sambanXaH
 wif Pronoun 'hi' ->  sambanXaH
 wif Noun 'hi' ->  kAraNa_xyowaka *)

value rl_hi m1 m2 m3 text_type = match m1 with
        [ Avy (id1,cid1,mid1,_,rt1,_,_,_) ->
              if rt1 = "hi" then match m3 with
              [ Wif (id3,cid3,mid3,_,_,_,_,_,_,_,_,_,_,_,_,_) 
              | Kqw (id3,cid3,mid3,_,_,_,_,_,_,_,_,_,_,_,_,_,_) ->
                   let kqw = get_kqw_suff m3 in
                   if   (kqw="kwa" || kqw = "kwavawu" || kqw = "wavyaw" || kqw = "anIyar" || kqw = "") (*kqw="" if it is a wif *)
		   then  if (cid3 > 1) 
                         then [] 
                         else let  d13 = if id1 > id3 then id1-id3 else id3-id1 in
		            if (id1 > 3) then [ Relation (id1,cid1,mid1,"saM",id3,cid3,mid3,"50.1",d13)]
		            else if ((id1=next id3) && (id1 < 4)) 
                                 then [ Relation (id1,cid1,mid1,"vAkya:kAraNa_xyo",id3,cid3,mid3,"50.1",d13)]
		                 else match m2 with
                                 [ Sup (id2,cid2,mid2,word2,rt2,pUrvapaxa2,uwwarapaxa2,gen2,viB2,vac2,_) ->
                                    if id1 < id2 then []
                                    else let  d12 = id1-id2 in
                                    if (id2 = previous id1) then
                                       if rt2="yax" && (id1 = 2 || id1 = 3) && (cid2 = 1)
                                       then [ Relation (id1,cid1,mid1,"vAkya:kAraNa_xyo",id3,cid3,mid3,"50.2",d13)]
                                       else if ((pronominal123 rt2) || (rt2="yaxA"))  && (id1 = 2 || id1 = 3) && (cid2 = 1)
                                       then [ Relation (id1,cid1,mid1,"saM",id2,cid2,mid2,"50.3",d12)]
                                       else [ Relation (id1,cid1,mid1,"vAkya:kAraNa_xyo",id3,cid3,mid3,"50.4",d13)]
                                    else []
                                 | Avy (id2,cid2,mid2,_,rt2,_,_,_) ->
                                     if id1 < id2 then []
                                     else let  d12 = id1-id2 in
			             if (id1 = 2 || id1 = 3)
                                     then if (id2 = previous id1) 
                                          then if ((rt2="na") || (rt2="eva")) && (cid2 = 1)
                                               then [ Relation (id1,cid1,mid1,"vAkya:kAraNa_xyo",id3,cid3,mid3,"50.5",d13)]
				               else [ Relation (id1,cid1,mid1,"saM",id2,cid2,mid2,"50.6",d12)]
			                  else []
                                     else []
		                 | Kqw (id2,cid2,mid2,_,_,_,_,_,_,_,_,_,_,_,_,_,_) 
                                 | Wif (id2,cid2,mid2,_,_,_,_,_,_,_,_,_,_,_,_,_) 
                                 | AvywaxXiwa (id2,cid2,mid2,_,_,_,_,_,_)
                                 | WaxXiwa (id2,cid2,mid2,_,_,_,_,_,_,_,_,_) -> 
                                    if id1 < id2 then []
                                    else [ Relation (id1,cid1,mid1,"vAkya:kAraNa_xyo",id3,cid3,mid3,"50.7",d13)]
                                 | Avykqw (id2,cid2,mid2,_,_,_,_,_,_,_,_,_) ->
                                    if id1 < id2 then []
                                    else let  d12 = id1-id2 in
                                    [ Relation (id1,cid1,mid1,"saM",id2,cid2,mid2,"50.8",d12)]
                                 ]
                    else []
	         | _ -> []
                 ]
                 else []
       | _ -> []
       ]

;
