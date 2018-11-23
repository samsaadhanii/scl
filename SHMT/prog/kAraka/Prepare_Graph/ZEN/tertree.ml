(**************************************************************************)
(*                                                                        *)
(*                 The Zen Computational Linguistics Toolkit              *)
(*                                                                        *)
(*                              Gérard Huet                               *)
(*                                                                        *)
(* ©2002 Institut National de Recherche en Informatique et en Automatique *)
(**************************************************************************)

(*i module Tree = struct i*)

(* Trees are ternary trees for use as two-ways tries with zippers.
[Tree (b,l,i,t,r)] at occurrence [u] stores [u] as a word iff [b=True],
and gives access to [t] at occurrence [[ u :: i ]] as a son, having [l] and [r]
as  respectively left stack of elder and right list of younger brothers; 
[Leaf True] at occurrence [u] stores [u] as a word with no descendants;
[Leaf False] is only needed to translate [Trie.empty=Trie (False,[])].   *)

(*i Inspired from Sedgewick. i*)
(*i Currently unused in Sanskrit processing chain excepts for tests. i*)

type tree = 
  [ Tree of (bool * forest * int * tree * forest) 
  | Leaf of bool 
  ]
and forest = list (int * tree)
;

(* Invariant : integers are in increasing order in siblings, no repetition. *)

(* Simple translation of a trie as a tree. *)
value rec trie_to_tree = fun
  [ Trie.Trie (b,arcs) -> match arcs with 
     [ [] -> Leaf b
     | [ (n,t) :: arcs ] -> Tree (b,[],n,trie_to_tree t,List.map f arcs)
       where f (n,t) = (n,trie_to_tree t)
     ]
  ]
;
exception Anomaly
;

(* More sophisticated translation as a balanced tree. *)
value rec balanced = fun
  [ Trie.Trie (b,arcs) -> match arcs with 
     [ [] -> Leaf b
     | _ -> (* bal balances k first arcs of l and stacks them in acc *)
       let rec bal acc l k = (* assert [|l| >= k] *)
          if k=0 then (acc,l)
          else match l with 
            [ [] -> raise Anomaly (* impossible by assertion *)
            | [ (n,t) :: r ] -> bal [ (n,balanced t) :: acc ] r (k-1)
            ] in
       let (stack,rest) = let half = (List.length arcs)/2 in
                          bal [] arcs half in
       match rest with
         [ [] -> raise Anomaly (* [|rest| = |arcs| - half > 0] *)
         | [ (n,t) :: right ] -> 
             Tree (b,stack,n,balanced t,List.map f right)
             where f (n,t) = (n,balanced t)
         ]
     ]
  ]
;

(*i Note : when access, leave corresponding balance from access zipper i*)

type zipper = 
  [ Top 
  | Zip of (bool * forest * int * forest * zipper)
  ]
;

(* [zip_up : tree -> zipper -> tree] *)
value rec zip_up t = fun 
  [ Top -> t 
  | Zip (b,left,n,right,up) -> zip_up (Tree (b,left,n,t,right)) up
  ]
;

(* [tree_of c] builds the filiform [tree] containing [c]. *)
(* [tree_of : word -> trie] *)
value rec tree_of = fun
  [ []            -> Leaf False
  | [ n ]         -> Tree (False,[],n,Leaf True,[])
  | [ n :: rest ] -> Tree (False,[],n,tree_of rest,[])
  ]
;

(* [mem_tree : word -> tree -> bool] *)
value rec mem_tree c = fun
  [ Tree (b,l,n,t,r) -> match c with
    [ [] -> b
    | [ i :: s ] -> 
      let rec memrec l n t r =
         if i=n then mem_tree s t
         else if i<n then match l with 
           [ [] -> False
           | [ (m,u) :: l'] -> memrec l' m u [ (n,t) :: r ]
           ]
         else match r with 
           [ [] -> False
           | [ (m,u) :: r' ] -> memrec [ (n,t) :: l] m u r'
           ] in
      memrec l n t r
    ]
  | Leaf b -> b && c=[]
  ]
;

(* We assume that [enter] used over tries, and that [trees] are not updated. *)
(*                                                                           *)
(* Translates trie in [entries_file] into corresponding tree.                *)
value translate_entries entries_file result_file =
  let entries_trie = (Gen.gobble entries_file : Trie.trie) in
  Gen.dump (balanced entries_trie) result_file
;

(*i TODO - replace tries by trees in index to have faster access.
    NOTE - next to useless in the cgi world. 
    Statistics   English     Sanskrit index (DICO/entries)
    trie         4.5Mb       221Kb
    trie dag     1.1Mb       103Kb
    tree         3.6Mb       180Kb
    tree dag     1.0Mb        96Kb      i*) 

(*i end; i*)

