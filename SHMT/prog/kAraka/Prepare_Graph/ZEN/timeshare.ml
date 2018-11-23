(**************************************************************************)
(*                                                                        *)
(*                 The Zen Computational Linguistics Toolkit              *)
(*                                                                        *)
(*                              Gérard Huet                               *)
(*                                                                        *)
(* ©2002 Institut National de Recherche en Informatique et en Automatique *)
(**************************************************************************)

(*i Shares a trie read on stdin as a dag and reports time on stdout *)
(* make timeshare.cmx 
ocamlopt unix.cmxa mylist.cmx share.cmx trie.cmx timeshare.cmx -o timeshare i*)

module Timeshare = struct

(*i *)
open Gen;
open Trie;
open Mini;
(* i*)

(* histogram building function: takes a list of naturals l and construct
   the list of (n,ln) where ln is the number of n's in l *)
value print_histo l = 
   let count n = count_rec 1 
     where rec count_rec k = fun
        [ [] -> (k,[])
        | [ m :: r ] -> if m=n then count_rec (k+1) r
                        else (k,[ m :: r ])
        ] in
   let rec process acc = fun
     [ [] -> List.rev acc
     | [ n :: l ] -> let (c,r) = count n l in process [ (n,c) :: acc ] r
     ] in
   let print_hist = print_hist_rec 0 
     where rec print_hist_rec k l = match l with
        [ [] -> ()
        | [ (i,n) :: r ] -> 
            if i = k then do { for j=1 to n do { print_string "*" }
                             ; print_newline() 
                             ; print_hist_rec (k+1) r
                             }
                     else do { print_string "-\n"
                             ; print_hist_rec (k+1) l
                             }
        ] in
   let sl = List.sort (fun x y -> x-y) l in 
   print_hist (process [] sl)
;
value timeshare () = 
  let trie = (input_value stdin : Trie.trie) in 
  let {Unix.tms_utime=utime; Unix.tms_stime=stime} = Unix.times () in
  let _ = Mini.minimize trie in 
  let {Unix.tms_utime=utime'; Unix.tms_stime=stime'} = Unix.times () in
      do { print_float (utime'-.utime)
         ; print_string " user time\n"
         ; print_float (stime'-.stime)
         ; print_string " system time\n"
         ; print_int (Trie.size trie)
         ; print_string " entries\n"
         ; print_histo (List.map List.length (Array.to_list Mini.Dag.memo))
         }
;
timeshare ()
;

(*i 
value make_share () = 
  let trie = (input_value stdin : trie) in
  Gen.dump (minimize trie) "mini.rem"
;
make_share ()
; i*)

end;

(*i Times are in seconds *)

(* Statistics (on machine petrus in 2002)
[avec hash_max = 9689]

timeshare <entriesbig.rem (* all entries *) 
0.09 user time 0 system time 11503 entries 219K -> 103K 
0.08 [avec hash_max = 8000]
0.11 [avec hash_max = 2000]

timeshare <entries1big.rem (* first half *)
0.05 user time 0 system time 5953 entries

timeshare <entries2big.rem (* second half *)
0.04 user time 0 system time 5554 entries

timeshare <flexedbig.rem (* all inflected forms from decls *)
0.37 user time 0.01 system time 119668 entries 1631K -> 140K

timeshare <flexed.rem
0.33 user time 0.00 system time
Sharing an already shared structure ought to be
significantly faster than sharing its unshared version because = 
uses == for optimization. 

timeshare <flexedbig.rem (* all inflected forms from derived *)
0.3 user time 170246 entries 2228K -> 159K [OLD]

English :  1923517 Jan 28 13:00 /win/Home/Linguistique/English/word.lst  
           4490719 Feb  2 16:12 english.rem  trie 4.5Mb
           1095749 Feb  2 16:36 mini.rem     dag  1.1Mb
avec dans trie.ml value hash_max = 40000;
timeshare < english.rem  1.75 user time 0.01 system time 173528 entries

i*)


