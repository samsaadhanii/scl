(**************************************************************************)
(*                                                                        *)
(*                         The Sanskrit Library                           *)
(*                                                                        *)
(*                              Gérard Huet                               *)
(*                                                                        *)
(* ©2000 Institut National de Recherche en Informatique et en Automatique *)
(**************************************************************************)

(* debugging context building *)

#load "list2.cmo"; 
#load "gen.cmo"; 
#load "ascii.cmo"; 
#load "word.cmo"; 
#load "zipper.cmo"; 
#load "bintree.cmo";    
#load "share.cmo";    
#load "trie.cmo";    
#load "mini.cmo";    
#load "deco.cmo";    
#load "lexmap.cmo";    
#load "minimap.cmo";    
#load "tertree.cmo";    
#load "minitertree.cmo"; 
#load "lexicon.cmo";    
#load "unglue.cmo";    

open List;
open List2;
open Gen;
open Word;
open Zipper;
open Share;
open Trie;
open Deco;
open Lexmap;
open Minimap;
open Tertree;
open Minitertree;

#use "unglue_test.ml"; 

(* For french processing do:
#load "string2.cmo"; 
#load "lexer.cmo"; 
#load "transducer.cmo"; 
#load "latin.cmo"; 
open String2;
open Lexer;
open Transducer;
open Latin;
*)
