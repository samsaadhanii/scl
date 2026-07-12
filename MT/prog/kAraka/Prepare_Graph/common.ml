open Pada_structure;
open Global_var;
open Adata;
open Afgavikaara;

(* These are different from sarvaadi ga.na of Panini. Here we are looking only for those words for which we seek antecedent Panini's sarvanaamas are morphological in nature *)
value pronoun3 rt = (rt="yax" || rt="wax" || rt="ewax" || rt="ixam" || rt="sarva" || rt="sarvA" || rt="svIya" || rt="svIyA" || rt="kim" || rt="Bavaw" || rt="uBa"|| rt="uBA" || rt="yAvaw" || rt = "wAvaw" || rt = "axas" || rt="kiFciw" || rt="kiFcana" || rt="Awman" || rt="sva" || rt="svA" || rt="anya" || rt = "anyA" || rt="IxqS" || rt="kIxqS" || rt="kIxqSa" || rt = "IxqSa") 
;

value pronominal12 rt = (rt="yuRmax" || rt="asmax")
;

value pronominal123 rt = pronominal12 rt || pronoun3 rt
;

value member_of word trie =
       Trie.mem (Transduction.code_raw_WX word) trie
;

value members_of rt upasarga trie =
       if upasarga = "X" 
       then member_of rt trie
       else member_of (upasarga^"_"^rt) trie
;

value get_assoc key assoc_array =
     try 
	List.assoc key assoc_array
     with [ Not_found -> ""]
;

value previous id = id-1
;

value next id = id+1
;

value prose_order id1 id2 text_type = 
          if text_type="Prose" then id1 < id2 else True
;

value aBihiwa rt vac1 vac2 per =    (vac1=vac2)  
                 && (  (per="ma" && rt = "yuRmax") 
                    || (per="u" && rt = "asmax") 
                    || (per="pra"  
                    && not (rt = "asmax")
                    && not (rt = "yuRmax")
                   )
                )
;
value noun_agreement vac1 vac2 gen1 gen2 =     
                             (vac1=vac2)
                          && (gen1=gen2 || gen1="a" || gen2 = "a")
;
value noun_agreement_vibh vac1 vac2 gen1 gen2 vib1 vib2 =    
                                    (vac1=vac2)
                                 && (vib1=vib2)
                                 && (gen1=gen2 || gen1="a" || gen2="a")

;
value sp_uwwarapaxa rt word lifgam =
       if (rt="pUrvaka" && lifgam="napuM")
         || rt="arWa" 
         || rt="ananwaram" 
         || word="sahiwaH" 
         || rt="saxqSa" 
         || rt="safkASa" 
         || rt="safkASa" 
         || word="pUrveNa" 
       then True else False
;
value no_boundary_crossing2 id1 id2 boundary =
      if boundary < 50 
      then if    (id1 <= boundary && id2 <= boundary) 
              || (id1 >= boundary && id2 >= boundary) 
           then True
           else False
      else True
;

value no_boundary_crossing1 id1 id2 =
        no_boundary_crossing2 id1 id2 wasmAw_pos.val
    &&  no_boundary_crossing2 id1 id2 yawaH_pos.val
    &&  (no_boundary_crossing2 id1 id2 wawra_pos.val || yawra_pos.val = 50)
    &&  (no_boundary_crossing2 id1 id2 waxA_pos.val || yaxA_pos.val = 50)
    &&  (no_boundary_crossing2 id1 id2 waWA_pos.val || yaWA_pos.val = 50)
;

value no_boundary_crossing_kwvA_lyap id1 id2 =
        no_boundary_crossing2 id1 id2 kwvA_lyap_pos1.val 
    &&  no_boundary_crossing2 id1 id2 kwvA_lyap_pos2.val 
    &&  no_boundary_crossing2 id1 id2 kwvA_lyap_pos3.val 
;


value no_boundary_crossing_with_iwi id1 id2 text_type =
  if (id1 = iva_pos.val -1) || (id2 = iva_pos.val -1) then True
  else if text_type="Prose" then
           no_boundary_crossing1 id1 id2
       &&  no_boundary_crossing2 id1 id2 iwi_pos.val 
       (* &&  no_boundary_crossing_kwvA_lyap id1 id2 -- why do you need this?  *)
   else if text_type="Sloka" then
    if  no_boundary_crossing1 id1 id2
    (*&&  no_boundary_crossing_kwvA_lyap id1 id2 -- counter example: आदिश्यते भूधरतां अवेक्ष्य कृष्णेन देह-उद्वहनाय शेषः
*)
   (*In the case of Sloka, we may have a verse starting with yaw and ending with waw, or some words after waw without any verb; as in
yaw SreyaH syAw niSciwaM brUhi waw me ; here there is no crossing, wince yaw waw do not come under crossing*)
   then True 
   else False 
  else True (* text_type does not match ; Should produce error in sch case *)
;

value no_boundary_crossing_except_kwvA id1 id2 text_type =
  if (id1 = iva_pos.val -1) || (id2 = iva_pos.val -1) then True
  else if text_type="Prose" then
           no_boundary_crossing1 id1 id2
       &&  no_boundary_crossing2 id1 id2 iwi_pos.val 
   else if text_type="Sloka" then
    if no_boundary_crossing1 id1 id2
   (*In the case of Sloka, we may have a verse starting with yaw and ending with waw, or some words after waw without any verb; as in
yaw SreyaH syAw niSciwaM brUhi waw me ; here there is no crossing, wince yaw waw do not come under crossing*)
   then True 
   else False 
  else True (* text_type does not match ; Should produce error in such case *)
;

value no_boundary_crossing id1 id2 text_type =
  if (id1 = iva_pos.val -1) || (id2 = iva_pos.val -1) then True
  else if text_type="Prose" then
      no_boundary_crossing1 id1 id2
   && no_boundary_crossing_kwvA_lyap id1 id2
  (* else if text_type="Sloka" then
      no_boundary_crossing1 id1 id2
   In the case of Sloka, we may have a verse starting with yaw and ending with waw, or some words after waw without any verb; as in
yaw SreyaH syAw niSciwaM brUhi waw me
  else False *)
  else True
;

value is_human rt =
  member_of rt upAXi
  || member_of rt sambanXavAcI
  || member_of rt manuRyaparyAya
  || member_of rt manuRyasaFjFAvAcI
;

value rlafgavikAra m1 m2 text_type = match m2 with
   [ Sup (id2,cid2,mid2,_,rt2,_,_,_,_,_,_)
   | Kqw (id2,cid2,mid2,_,_,_,_,_,_,_,rt2,_,_,_,_,_,_)
   | WaxXiwa (id2,cid2,mid2,_,rt2,_,_,_,_,_,_,_) -> 
      match m1 with
      [ Sup (id1,cid1,mid1,_,rt1,_,_,_,viBakwiH1,_,_)
      | Kqw (id1,cid1,mid1,_,_,_,_,_,_,_,rt1,_,_,_,viBakwiH1,_,_)
      | WaxXiwa (id1,cid1,mid1,_,rt1,_,_,_,_,viBakwiH1,_,_) ->
       let  d12 = if id1 > id2 then id1-id2 else id2-id1 in
       if   rt2 = get_assoc rt1 afgavikaara_list 
         && (id1 = previous id2 || id1 = next id2)
         && viBakwiH1 = 3
       then [ Relation (id1,cid1,mid1,"afga_vi",id2,cid2,mid2,"11.1",d12)] 
       else []
      | _ -> []
      ]
   | _ -> []
   ]
;

value niyawalifgam kqw = kqw="lyut" || kqw="GaF"
;

(* Sanjeev: write a note on why do you need all these classification.
   Give justification with Panini's suutra for each of them
   Draw a Venn diagram showing the overlaps among these sets
*)

value verb_type rt upasarga =  
          if members_of rt upasarga akarmaka_verbs then "akarmaka"
          else if members_of rt upasarga xvikarmaka2 then "xvikarmaka2"
          else if members_of rt upasarga xvikarmaka1 then "xvikarmaka1"
          else if members_of rt upasarga gawyarWa_verbs then "gawi"
          else if members_of rt upasarga buxXyarWa_verbs  then "buxXi"
          else if members_of rt upasarga prawyavasAnArWa_verbs then "prawyavasAnArWa"
          else if members_of rt upasarga shabxakarma_verbs then "Sabxakarma"
          else if members_of rt upasarga sakarmaka_verbs then "sakarmaka" else ""
;

open Pada_structure;
open Relations;

value encode rel = try List.assoc rel relations_encodings
           with [ Not_found -> 0 ]
;

value print_relation cho = fun
  [ Relation (i1 , i2 , i3 , i4 , i5 , i6, i7, i8, i9)  -> do
         { output_string cho (string_of_int i1); output_string cho " "
         ; output_string cho (string_of_int i2); output_string cho " "
         ; output_string cho (string_of_int i3); output_string cho " "
         ; output_string cho (string_of_int (encode i4)); output_string cho " "
         ; output_string cho (string_of_int i5); output_string cho " "
         ; output_string cho (string_of_int i6); output_string cho " "
         ; output_string cho (string_of_int i7); output_string cho " "
         ; output_string cho i4; output_string cho " "
         ; output_string cho i8; output_string cho " "
         ; output_string cho (string_of_int i9); output_string cho "\n"
         } (* else ()*)
  ]
;

(* value rec print_relation_list = fun 
  [ [] -> ()
  | [ r :: l ] -> do { print_relation r
             ; print_relation_list l
             }
  ]
;
*)

value mk_tuple r = match r with
   [ Relation (id1,cid1,mid1,rel,id2,cid2,mid2,rl,dist) -> let erel = encode rel in
          if erel >= 4000  && erel < 5000 then [Relationc (id1,cid1,mid1,(erel + id1),id2,cid2,mid2,dist)]
          else if erel >= 2000  && erel < 4000 then [Relationc (id1,cid1,mid1,(erel + id2),id2,cid2,mid2,dist)]
          else [Relationc (id1,cid1,mid1,erel,id2,cid2,mid2,dist)]
   ]
 ;
 
value rec mk_tuple_lst acc = fun
   [ [] -> List.sort_uniq compare acc
   | [r :: l ] -> let tpl = mk_tuple r in
                  let acc1 = tpl@acc in
                  mk_tuple_lst acc1 l
   ]
;

value get_cat m1 = match m1 with
  [ Sup (_,_,_,_,_,_,_,_,_,_,_) -> "sup"
  | Wif (_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_) -> "wif"
  | Kqw (_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_) -> "kqw"
  | WaxXiwa (_,_,_,_,_,_,_,_,_,_,_,_) ->  "waxXiwa"
  | Avy (_,_,_,_,_,_,_,_) -> "avy"
  | Avykqw (_,_,_,_,_,_,_,_,_,_,_,_) -> "avykqw"
  | AvywaxXiwa (_,_,_,_,_,_,_,_,_) -> "avywaxXiwa"
  ]
;

value get_viB m1 = match m1 with
  [ Sup (_,_,_,_,_,_,_,_,viBakwiH1,_,_) 
  | Kqw (_,_,_,_,_,_,_,_,_,_,_,_,_,_,viBakwiH1,_,_) -> viBakwiH1
  | _ -> 0
  ]
;

value get_kqw_suff m1 = match m1 with
  [ Kqw (_,_,_,_,_,_,_,kqw,_,_,_,_,_,_,_,_,_) 
  | Avykqw (_,_,_,_,_,_,_,_,_,kqw,_,_) -> kqw
  | _ -> ""
  ]
;

value get_per m1 = match m1 with
  [ Wif (_,_,_,_,_,_,_,_,_,_,_,per,_,_,_,_) -> per
  | _ -> ""
  ]
;

value get_vac m1 = match m1 with
  [ Wif (_,_,_,_,_,_,_,_,_,_,_,_,vac,_,_,_) -> vac
  | _ -> ""
  ]
;

value get_upasarga m1 = match m1 with
  [ Wif (id,cid,mid,_,rt,_,_,upasarga,_,_,_,_,_,_,_,_) 
  | Kqw (id,cid,mid,_,rt,upasarga,_,_,_,_,_,_,_,_,_,_,_) -> upasarga
  | _ -> ""
  ]
;

value get_rt m1 = match m1 with
  [ Sup (id1,cid1,mid1,word1,rt1,_,_,_,_,_,_) 
  | Wif (id1,cid1,mid1,word1,rt1,_,_,_,_,_,_,_,_,_,_,_)
  | Kqw (id1,cid1,mid1,word1,rt1,_,_,_,_,_,_,_,_,_,_,_,_)
  | WaxXiwa (id1,cid1,mid1,word1,rt1,_,_,_,_,_,_,_) 
  | Avy (id1,cid1,mid1,word1,rt1,_,_,_) 
  | Avykqw (id1,cid1,mid1,word1,rt1,_,_,_,_,_,_,_)
  | AvywaxXiwa (id1,cid1,mid1,word1,rt1,_,_,_,_) -> rt1
  ]
;
