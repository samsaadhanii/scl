open Pada_structure; 
open Bank_lexer; 
module Gram = Camlp4.PreCast.MakeGram Bank_lexer 
;
open Bank_lexer.Token;

value morphs = Gram.Entry.mk "morphs"
;

(* Grammar of morph_analyses coming from sentence *)

EXTEND Gram
  GLOBAL: morphs;
  morphs:
    [ [ l = morph_rec; `EOI -> l
      | l = morph_rec -> failwith "Wrong morph data"
    ] ] ;
  morph_rec:
    [ [ -> []
      | l = morph_rec; t = morph ->  (* left (terminal) recursion essential *)
    l @ [ t ]
    ] ] ;
  morph:
    [ [ s = sup -> Sup s 
      | w = wif -> Wif w 
      | k = kqw -> Kqw k
      | a = avy -> Avy a
      | aw = avywaxXiwa -> AvywaxXiwa aw
      | ak = avykqw -> Avykqw ak
      | w = waxXiwa -> WaxXiwa w
    ] ] ;

  sup:
    [ [ "(sup"; "(id"; i = INT; ")"; 
        "(cid"; c = INT; ")"; 
        "(mid"; m = INT; ")"; 
        "(word"; w = IDENT; ")"; 
        "(rt"; r = IDENT; ")"; 
        "(pUrvapaxa"; cp = IDENT; ")"; 
        "(uwwarapaxa"; cu = IDENT; ")"; 
        "(lifgam"; ling = IDENT; ")"; 
        "(viBakwiH"; vib = INT; ")"; 
        "(vacanam"; vac = IDENT; ")"; 
        "(level"; lev = INT; ")";
    ")" -> 
    (int_of_string i, int_of_string c, int_of_string m,w,r,cp,cu,ling,int_of_string vib,vac,int_of_string lev)
    ] ] ;

  wif:
    [ [ "(wif"; "(id"; i = INT; ")"; 
        "(cid"; c = INT; ")"; 
        "(mid"; m = INT; ")"; 
        "(word"; w = IDENT; ")"; 
        "(rt"; r = IDENT; ")"; 
        "(pUrvapaxa"; cp = IDENT; ")"; 
        "(uwwarapaxa"; cu = IDENT; ")"; 
        "(upasarga"; upa = IDENT; ")"; 
        "(sanAxi_prawyayaH"; san = IDENT; ")"; 
        "(prayogaH"; voice = IDENT; ")"; 
        "(lakAraH"; la = IDENT; ")"; 
        "(puruRaH"; per = IDENT; ")"; 
        "(vacanam"; vac = IDENT; ")"; 
        "(paxI"; padi = IDENT; ")"; 
         (*"(XAwuH"; rtwithiw = IDENT; ")"; *)
        "(gaNaH"; gana = IDENT; ")"; 
        "(level"; lev = INT; ")";
    ")" -> 
    (int_of_string i, int_of_string c,int_of_string m,w,r,cp,cu,upa,san,voice,la,per,vac,padi,gana,int_of_string lev)
    ] ] ;

  kqw:
    [ [ "(kqw"; "(id"; i = INT; ")"; 
        "(cid"; c = INT; ")"; 
        "(mid"; m = INT; ")"; 
        "(word"; w = IDENT; ")"; 
        "(kqw_XAwu"; kqwrt = IDENT; ")"; 
        "(upasarga"; upa = IDENT; ")"; 
        "(sanAxi_prawyayaH"; san = IDENT; ")"; 
        "(kqw_prawyayaH"; kp = IDENT; ")"; 
        "(prayogaH"; p = IDENT; ")"; 
        (*"(XAwuH"; rtwithiw = IDENT; ")"; *)
        "(gaNaH"; gana = IDENT; ")"; 
        "(rt"; r = IDENT; ")"; 
        "(pUrvapaxa"; cp = IDENT; ")"; 
        "(uwwarapaxa"; cu = IDENT; ")"; 
        "(lifgam"; ling = IDENT; ")"; 
        "(viBakwiH"; vib = INT; ")"; 
        "(vacanam"; vac = IDENT; ")"; 
        "(level"; lev = INT; ")";
    ")" -> 
    (int_of_string i, int_of_string c,int_of_string m,w,kqwrt,upa,san,kp,p,gana,r,cp,cu,ling,int_of_string vib,vac,int_of_string lev)
    ] ] ;

  avy:
    [ [ "(avy"; "(id"; i = INT; ")"; 
        "(cid"; c = INT; ")"; 
        "(mid"; m = INT; ")"; 
        "(word"; w = IDENT; ")"; 
        "(rt"; r = IDENT; ")"; 
        "(pUrvapaxa"; cp = IDENT; ")"; 
        "(uwwarapaxa"; cu = IDENT; ")"; 
        "(level"; lev = INT; ")";")" -> 
    (int_of_string i, int_of_string c,int_of_string m,w,r,cp,cu,int_of_string lev)
    ] ] ;

  avywaxXiwa:
    [ [ "(avywaxXiwa"; "(id"; i = INT; ")"; 
               "(cid"; c = INT; ")"; 
               "(mid"; m = INT; ")"; 
               "(word"; w = IDENT; ")"; 
               "(rt"; r = IDENT; ")"; 
               "(pUrvapaxa"; cp = IDENT; ")"; 
               "(uwwarapaxa"; cu = IDENT; ")"; 
               "(waxXiwa_prawyayaH"; taddhita = IDENT; ")"; 
               "(level"; lev = INT; ")";
    ")" -> 
    (int_of_string i, int_of_string c,int_of_string m,w,r,cp,cu,taddhita,int_of_string lev)
    ] ] ;

  avykqw:
    [ [ "(avykqw"; "(id"; i = INT; ")"; 
           "(cid"; c = INT; ")"; 
           "(mid"; m = INT; ")"; 
           "(word"; w = IDENT; ")"; 
           "(rt"; r = IDENT; ")"; 
           "(pUrvapaxa"; cp = IDENT; ")"; 
           "(uwwarapaxa"; cu = IDENT; ")"; 
           "(upasarga"; upa = IDENT; ")";
           "(sanAxi_prawyayaH"; san = IDENT; ")";
           "(kqw_prawyayaH"; kqw = IDENT; ")"; 
           (*"(XAwuH"; rtwithiw = IDENT; ")"; *)
           "(gaNaH"; gana = IDENT; ")"; 
           "(level"; lev = INT; ")";
     ")" -> 
    (int_of_string i, int_of_string c,int_of_string m,w,r,cp,cu,upa,san,kqw,gana,int_of_string lev)
    ] ] ;
  waxXiwa:
    [ [ "(waxXiwa"; "(id"; i = INT; ")"; 
            "(cid"; c = INT; ")"; 
            "(mid"; m = INT; ")"; 
            "(word"; w = IDENT; ")"; 
            "(rt"; r = IDENT; ")"; 
            "(pUrvapaxa"; cp = IDENT; ")"; 
            "(uwwarapaxa"; cu = IDENT; ")"; 
            (*"(waxXiwa_rt"; taddhitart = IDENT; ")"; *)
            "(waxXiwa_prawyayaH"; taddhita = IDENT; ")"; 
            "(lifgam"; ling = IDENT; ")"; 
            "(viBakwiH"; vib = INT; ")"; 
            "(vacanam"; vac = IDENT; ")";
            "(level"; lev = INT; ")";
    ")" -> 
    (int_of_string i, int_of_string c,int_of_string m,w,r,cp,cu,taddhita,ling,int_of_string vib,vac,int_of_string lev)
    ] ] ;
END
;

value analyse strm = let morphs = 
  try Gram.parse morphs Loc.ghost strm with
       [ Loc.Exc_located loc (Error.E msg) -> do
      { output_string stdout "\n\n"
      ; flush stdout 
      ; Format.eprintf "Lexical error: %a in line %a in example \n%!" 
               Error.print msg Loc.print loc 
      ; failwith "Parsing aborted\n"
      }
       | Loc.Exc_located loc (Stream.Error msg) -> do
      { output_string stdout "\n\n"
      ; flush stdout 
      ; Format.eprintf "Syntax error: %s in example \n%!" msg 
      ; failwith "Parsing aborted\n"
      }
       | Loc.Exc_located loc ex -> do
      { output_string stdout "\n"
      ; flush stdout 
      ; Format.eprintf "Fatal error in example \n%!" 
      ; raise ex
      }
       | ex -> raise ex
       ]  in morphs
;
