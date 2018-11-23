(**************************************************************************)
(*                                                                        *)
(*                         The Zen/Aum Library                            *)
(*                                                                        *)
(*                               REGULAR                                  *)
(*                             Benoit Razet                               *)
(*                                                                        *)
(* ©2005 Institut National de Recherche en Informatique et en Automatique *)
(**************************************************************************)
(*i module Regular = struct  i*)

(*i This file defines several modules pertaining to the manipulation
   of regular expressions i*)

(* \subsection {Module Berry\_Sethi} *)

(* First we define a module [Berry_Sethi] implementing the Berry-Sethi 
   algorithm for compiling regular expressions. We provide a data 
   type for representing regular expressions, a type for standard local 
   automata and a function [compile] that takes an initial state, a regular 
   expression, and returns a local automaton representation. *)

module Berry_Sethi : sig 
  
  type regexp 'a = 
    [ One 
    | Symb of 'a     (* ['a] is the type parameter of symbols *)
    | Union of regexp 'a and regexp 'a
    | Conc of regexp 'a and regexp 'a
    | Star of regexp 'a
    | Epsilon of regexp 'a
    | Plus of regexp 'a
    ]
  ; 
  type marked 'a = ('a * int) 
  and local_auto 'a = 
      ( marked 'a
      * list (marked 'a)
      * list (marked 'a * list (marked 'a))
      * list (marked 'a)
      )
  ;
  value compile : marked 'a -> regexp 'a -> local_auto 'a
;
end = struct

(* We describe regular expressions using a type abstracted from a basis 
   alphabet ['a]. This type provides extra constructors such as [Plus],
   useful for practical applications *)  
  type regexp 'a= 
    [ One 
    | Symb of 'a
    | Union of regexp 'a and regexp 'a
    | Conc of regexp 'a and regexp 'a
    | Star of regexp 'a
    | Epsilon of regexp 'a
    | Plus of regexp 'a
    ]
  ;

(* [One], [Symb], [Union], [Conc], and [Star] are the classical operators.
   [Epsilon e] has the meaning of [Union One e] and [Plus e] the meaning of 
   [Union e (Star e)], but treated as an atomic expression. 
   In the following we shall abbreviate ``regular expression'' into regexp. *)

(* Berry-Sethi compilation applies to linear regexps to produce
   a local automaton. Let us recall that a linear regexp has the 
   property that any symbol appears only once in it. This can be made by 
   adding an integer to the symbol making the whole unique in the regexp, thus
   it changes a bit the structure of symbols for linear regexps.
   A local automaton is an automaton in which the guarded symbol of the 
   transition corresponds to the target state of the transition.
   The types for marked symbols and local automata are: *)
  type marked 'a = ('a * int) 
  and local_auto 'a = 
      ( marked 'a (* initial state *)
      * list (marked 'a) (* other states *)
      * list (marked 'a * list (marked 'a)) (* transitions *)
      * list (marked 'a) (* terminal states *)
      )
  ;
  
(* A local automata is structurally represented with four components. 
   The first is the initial state, this shows that we have decided 
   to produce standard local automata.
   The second is for the set of states of the automaton, excluding
   the initial one. 
   The third is the set of transitions: a transition is a state and the list
   of states associated with the transition.
   The forth component is for the set of terminal states. *)

(* Now that we have given the data-structures for representing regexps
   let us give our algorithm to mark a regexp linear.  To get the list
   of symbols from any regexp, reading left to right, we use the
   function: *)
(* [symb_lr : regexp 'a -> list 'a] *)
value symb_lr e = symb [] e
  where rec symb accu = fun
  [ One -> accu
  | Symb s -> [s :: accu]
  | Union e1 e2 | Conc e1 e2 -> 
    symb (symb accu e2) e1
  | Star e | Epsilon e | Plus e -> symb accu e
  ]
;

(* Having computed the resulting list from [symb_lr], we want to append 
   to each symbol a unique number, meaning the number of times we have
   encountered a symbol reading left to right the list, beginning to count
   from 1 except when a symbol is present only once in the list, in which case 
   we count 0. *)

(* [mark_list : list 'a -> list (marked 'a)] *)
value mark_list l = markr [] l
  where rec markr laccu = fun
  [ [] -> []
  | [ x :: l ] -> 
    let count_x = count 1 
                  where rec count sum = fun
                      [ [] -> sum
                      | [y :: l] -> count (if y=x then sum+1 else sum) l
                      ] in
    if List.mem x laccu || List.mem x l (* multiples *)
    then [ (x, count_x laccu) :: markr [x :: laccu] l ]
    else [ (x,0) :: markr laccu l ]
  ]
;

(* The [mark_list] function has a [laccu] list that records symbols present at 
   least twice. *)

(* Now we can define the [mark] function using a function [map_lr]
   that replaces in a regexp, from left to right, its symbols with
    a list of marked symbols (resulting from [mark_list]). *)
(* [mark : regexp 'a -> (regexp (marked 'a) * list (marked 'a))]   *)
value mark e =
  let rec map_lr li = fun
    [ One -> (One, li)
    | Symb s ->
        (Symb (List.hd li), List.tl li)
    | Union e1 e2 ->
        let (e1_m, lj) = map_lr li e1 in
        let (e2_m, lk) = map_lr lj e2 in
        (Union e1_m e2_m, lk)
    | Conc e1 e2 -> 
        let (e1_m, lj) = map_lr li e1 in
        let (e2_m, lk) = map_lr lj e2 in
        (Conc e1_m e2_m, lk)
    | Star e1 -> 
        let (e1_m, lj) = map_lr li e1 in
        (Star e1_m, lj)
    | Epsilon e1 -> 
        let (e1_m, lj) = map_lr li e1 in
        (Epsilon e1_m, lj)
    | Plus e1 -> 
        let (e1_m, lj) = map_lr li e1 in
        (Plus e1_m, lj)
    ] in
  let symbols = symb_lr e in
  let symbols_m = mark_list symbols in
  let (e_m, li) = map_lr symbols_m e in
    (* note [li] must be [[]] *)
  (e_m, symbols_m)
;

(* The list of symbols mapped into the expression is [symbols_m] .
   Note that the first component of a marked symbol is the original one, so
   one can easily recover the original symbol from a marked one. *)

(* By now, we assume our regexps linear and we define the functions of 
   Berry-Sethi compiling. *)
(* It is very useful to get the information whether the empty string belongs
   to the regexp to compute the automaton efficiently.
   We thus present a new type [d_regexp] for discriminating regexps that
   generate or not the empty string. 
   It is almost the same as type [regexp] but with an information encoding
   the discrimination, and this for all sub-constructions of the expression.
   It is represented with a boolean: 
   [True] if the empty string is generated by the regexp, 
   [False] otherwise. *)

type d_regexp 'a = 
  [ DOne 
  | DSymb of 'a 
  | DUnion of bool and d_regexp 'a and d_regexp 'a
  | DConc of bool and d_regexp 'a and d_regexp 'a
  | DStar of d_regexp 'a
  | DEpsilon of d_regexp 'a
  | DPlus of bool and d_regexp 'a 
  ]
;

(* [DOne], [DSymb], [DStar] and [DEpsilon] don't need this boolean because 
   they have the information implicitly. *)

(* We simply extract this information from a regexp in a constant 
   time analyzing the top node of a regexp: *)
(* [delta : d_regexp 'a -> bool] *)
value delta = fun 
  [ DOne -> True
  | DSymb _ -> False
  | DUnion b _ _ | DConc b _ _ -> b
  | DStar _ | DEpsilon _ -> True
  | DPlus b _ -> b    
  ]
;

(* The following algorithm transforms a regexp of type [regexp] 
   into the discriminating one of type [d_regexp]. *)

(* [discr : regexp 'a -> d_regexp 'a] *)
value rec discr = fun
  [ One -> DOne
  | Symb s -> DSymb s
  | Union e1 e2 -> 
      let de1 = discr e1 
      and de2 = discr e2 in
      DUnion (delta de1 || delta de2) de1 de2
  | Conc e1 e2 ->
      let de1 = discr e1 
      and de2 = discr e2 in
      DConc (delta de1 && delta de2) de1 de2
  | Star e -> DStar (discr e)
  | Epsilon e -> DEpsilon (discr e)
  | Plus e -> 
      let de = discr e in
      DPlus (delta de) de
  ]
;

(* The cost of this computation is linear in the size of the regexp. Then
   we give an implementation of the [first] function, that gives the first 
   symbols from a regexp, in linear time : *)
(* [first : list 'a -> d_regexp 'a -> list 'a] *)
value rec first l = fun
  [ DOne -> l
  | DSymb d -> [ d :: l ]
  | DUnion _ e1 e2 -> first (first l e2) e1
  | DConc _ e1 e2 -> 
      let b1 = delta e1 in
      if b1 then first (first l e2) e1 
      else first l e1
  | DStar e | DEpsilon e | DPlus _ e -> first l e 
  ]
;

(* The parameter [l] is for already computed first elements, a partial 
   result.*)
(* A follow set is the list of directly accessible symbols from a given one in
   a regexp, it corresponds to the notion of continuation in the Berry-Sethi
   article. Now we have all the routines to present an implementation of 
   the `F' function from the Berry-Sethi article for computing the set 
   of all follow sets. *)
(* [follow : 'a -> regexp 'a ->  list ('a * list 'a)] *)
value follow initial exp = 
  let rec f1 exp l fol = 
    match exp with
    [ DOne -> fol
    | DSymb d -> [ (d,l) :: fol ]
    | DUnion _ e1 e2 -> 
       let fol2 = f1 e2 l fol in 
       f1 e1 l fol2 
    | DConc _ e1 e2 -> 
       let fol2 = f1 e2 l fol in
       let l1 = if delta e2 then first l e2 else first [] e2 in
       f1 e1 l1 fol2
    | DStar e | DPlus _ e -> 
       let l_res = first l e in 
       f2 e l_res fol
    | DEpsilon e -> f1 e l fol ]
  and f2 exp l fol = (* [(first [] exp)] already in [l] *)
    match exp with
    [ DOne -> fol
    | DSymb d -> [ (d,l) :: fol ]
    | DUnion _ e1 e2 -> 
       let fol2 = f2 e2 l fol in 
       f2 e1 l fol2 
    | DConc _ e1 e2 -> 
       let b1 = delta e1
       and b2 = delta e2 in
       if b1 (* l1 and l2 in l *)
       then if b2 
            then f2 e1 l (f2 e2 l fol) 
            else f1 e1 (first [] e2) (f2 e2 l fol)
       else if b2 
            then f2 e1 (first l e2) (f1 e2 l fol)
            else f1 e1 (first [] e2) (f1 e2 l fol)
    | DStar e | DEpsilon e | DPlus _ e -> f2 e l fol 
    ] in
  let fol_sets = f1 exp [] []
  and initials = first [] exp in
  [ (initial,initials) :: fol_sets ]
;

(* The initial state is a parameter of the function because it is not
   a state derived from symbols of the regexp. Its name must be chosen as
   a fresh symbol, not already occurring in the regexp.
   Because of our implementation of sets with lists we must guarantee not
   returning a list with duplicated elements. This can be done having the
   property that [(first exp)] is already in [l] or not. The computation is
   different in both cases, this is why we have [f1] and [f2].
   We add a link between the initial state and the first states of the regexp. *)
(* *)
(* The function [last] returns the last symbols from a regexp. *)
(* [last : 'a -> d_regexp 'a -> list 'a] *)
value last initial e = 
  let rec last_rec exp l = match exp with
    [ DOne -> l
    | DSymb d -> [ d :: l ]
    | DUnion _ e1 e2 -> 
        let l2 = last_rec e2 l in
        last_rec e1 l2
    | DConc _ e1 e2 -> 
        let b2 = delta e2 in
        if b2 then last_rec e1 (last_rec e2 l)
        else last_rec e2 l
    | DStar e | DEpsilon e | DPlus _ e -> last_rec e l
    ] in
  let l = last_rec e [] in
  if delta e then [ initial :: l ] else l
;

(* We add the initial state to the set of last states if the empty word belongs to the language. *)

(* In terms of the note on ``Local languages and the Berry-Sethi algorithm'' 
   by Jean Berstel and Jean-Eric Pin, we have presented algorithms to compute
   a linear regular expression into a local standard automaton. Adding 
   [Plus e] directly as an operator in the abstract syntax is an optimisation 
   because the equivalent [Conc e (Star e)] duplicates marked symbols
   and thus the number of states of the automaton. *)
(* *)
(* We now present the [compile] function that computes the automaton 
   from a regexp. *)

(* [compile : marked 'a -> regexp 'a -> local_auto 'a] *)
value compile initial exp = 
  let (exp_m, states) = mark exp in 
  let d_exp = discr exp_m in
  let fol = follow initial d_exp 
  and lasts = last initial d_exp in
  (initial, states, fol, lasts)
;

end;

(* This is the end of our Berry-Sethi compilation algorithm. We ensure
   that we have presented an implementation that takes care of
   respecting the theoretical complexity, that is quadratic in
   the number of symbols in the regexp. The proof of the complexity
   is by induction on the regexp structure. *)

(* \subsection{Module Regexp\_system} *)

(* We extend the way to define regexps with a regexp system that allows 
   some degree of sharing, but no recursion. *)

module Regexp_system =  struct

(* We use the structure of regular expressions defined in module [Berry_Sethi]. *)
open Berry_Sethi;

(* We mean by modularity the possibility of naming a regexp which may
postmaster@inria.fr   be used in another regexp as if it were a basic symbol. 
   Now a [Symb] in a regexp can be a name or a symbol from an 
   alphabet and we define a type [mix_symb] for describing this mix. *)

type name = string
and mix_symb 'a = 
    [ Name of name
    | Alph of 'a 
    ]
;

(* Then we define a [system] as a list of names and associated regexp: *)
type system 'a = list (name * regexp (mix_symb 'a))
;

(* We give an algorithm to transform a system into a simple regular expression. *)
(* [flatten : system 'a -> regexp 'a] *)
value flatten sys = 
  let rec flatten_regexp system l = fun
    [ One -> (One,l)
    | Symb (Name s) -> 
      try (* we try to find s in already flattened regexp *)
        let e_flattened = List.assoc s l in 
        (e_flattened, l)
      with [ Not_found -> 
             let rec extract_s = fun 
                 [ [] -> failwith "no extraction"
                 | [ (s2,e) :: sys ] -> if s=s2 then (e,sys) 
                                        else extract_s sys 
                 ] in
             (* knowing that dependencies must be in the rest of system *)
             let (e, new_sys) = extract_s system in
             let (e_flattened, new_l) = flatten_regexp new_sys l e in
             (e_flattened, [ (s,e_flattened) :: new_l]) ]
    | Symb (Alph s) -> (Symb s, l)
    | Union e1 e2 -> 
        let (e1_f,l_left) = flatten_regexp system l e1 in
        let (e2_f,l_right) = flatten_regexp system l_left e2 in
        (Union e1_f e2_f, l_right)
    | Conc e1 e2 -> 
        let (e1_f,l_left) = flatten_regexp system l e1 in
        let (e2_f,l_right) = flatten_regexp system l_left e2 in
        (Conc e1_f e2_f, l_right)
    | Star e ->  
        let (e_f,new_l) = flatten_regexp system l e in
        (Star e_f, new_l)
    | Epsilon e -> 
        let (e_f,new_l) = flatten_regexp system l e in
        (Epsilon e_f, new_l)
    | Plus e -> 
        let (e_f,new_l) = flatten_regexp system l e in
        (Plus e_f, new_l) 
    ] in
  let (e, system) = match sys with
    [ [] -> failwith "empty system!!"
    | [ (_,e) :: system ] -> (e,system) 
    ] in
  let (e_f, _) = flatten_regexp system [] e in 
  e_f
;
end;

(* The parameter [l] of [flatten_regexp] defines the list of regular expressions
   already flattened for a kind of lazy evaluation, it is initialized to 
   the empty list. The parameter [system] 
   represents the list of couple - name and regexp - not yet treated. 
   The function [flatten_regexp], providing a system and a list of expressions 
   already flattened, replaces each symbol that is a name of regular
   expression by the associated one. *)

(* \subsection{The concrete syntax for modular aums} *)

(* A modular aum is a two-level structure: a regexp defined over an
   aum alphabet.  And now we precise the concrete syntax for
   defining modular aums.  It includes a name for the initial state,
   together with the name of the aum which recognizes the empty word, 
   a basic alphabet of symbols represented as lower case strings between 
   delimiters {\bf alphabet} and {\bf end} (corresponding to names of 
   aums), then follows the definition of the regexp as a regexp system,
   between delimiters {\bf automaton} and {\bf end} together with a
   parameter for the name of the module implementing the state
   transitions. *)

module Id = struct
  value name = "Regular";
  value version = "2.3";
end;

module Regular (Ast : Camlp4.Sig.Camlp4Ast) = struct
  module Ast = Ast;
  open Ast;
  module Token = Camlp4.Struct.Token.Make Loc;
  module Lexer = Camlp4.Struct.Lexer.Make Token;
  open Camlp4.Sig;
  module Parser = struct

open Berry_Sethi;
open Regexp_system;

(* Using a standard lexer. *)
module Gram = Camlp4.Struct.Grammar.Static.Make Lexer;

(* We define the entry point of grammar [def_auto]: *)
value def_auto = Gram.Entry.mk "def_auto"
;

(* Here is the definition of the grammatical construction for a concrete
   system of regular expressions. *)
EXTEND Gram
  GLOBAL: def_auto;
  def_auto: 
    [ [ "initial"; init = LIDENT; empty_aum = LIDENT;
        "alphabet"; aums = aum_names ; "end"; 
        "automaton"; module_name = UIDENT; 
        system = rule_list; "end"; `EOI ->
           (empty_aum, init, aums, module_name, system)
      ] 
    ];
  aum_names: 
    [ [ l = LIST1 aum_name SEP ";" -> l ]
    ];
  aum_name:
    [ [ l = LIDENT -> l ]
    ];    
  rule_list:
    [ [ r = LIST1 rule SEP "in" -> r ]
    ];
  rule:
    [ [ "node"; name = UIDENT; "="; e = expreg -> (name, e) ] 
    ];
  expreg:
    [ [ e1 = expreg; "|"; e2 = expreg -> Union e1 e2 ]
    | [ e1 = expreg; "."; e2 = expreg -> Conc e1 e2 ]
    | [ e = expreg; "*" -> Star e
      | e = expreg; "?" -> Epsilon e
      | e = expreg; "+" -> Plus e ]
    | [ n = INT ->
          match int_of_string n with
            [ 1 -> One
            | _ -> failwith "integer not autorized"
            ]
      | name = LIDENT -> Symb (Alph name)
      | name = UIDENT -> Symb (Name name)
      | "("; e = expreg ; ")" -> e ]
    ];
END;

end;

(* N.B. Since we use a pre-defined lexer, one must take care of possible 
   conflicts: ``a*.b'' would be interpreted with the floating-point times
   instead of suffix ``*'' followed by infix ``.''. *)

(* The construction {\tt automaton ... end} is parameterized by a string 
   which will be the name of the module for the resulting automaton. *)

(* \subsection{Example: Sanskrit morphology} *)

(* 
We give a concrete example in the case of Sanskrit morphology. We have various phases
for nominal forms:
\begin{itemize}
\item Noun for declined substantives
\item Iic for beginnings of compounds
\item Ifc for endings of compounds
\end{itemize}
similarly for verbal forms:
\begin{itemize}
\item Root for conjugated forms of roots
\item Pv1 for preverb sequences
\item Auxi for auxiliary verb forms
\item Iiv for periphrastic prefixes 
\end{itemize}
and finally for adverbs and particles:
\begin{itemize}
\item Unde undeclinable forms (infinitives, adverbs, etc.)
\item Abso (absolutives)
\item Pv2 for preverb sequences
\end{itemize}

Pv1 and Pv2 are two occurrences of the language of preverbs, issued from the linearization
of the regular expression defining a Sanskrit sentence as a non-empty sequence of inflected word forms:
   \begin{verbatim}
   initial init epsilon_aum

   alphabet 
     noun ; root; unde; abso; iic; iiv; auxi; ifc; prev
   end

   automaton Disp
     node INVAR = prev.abso | unde in
     node CONJUG = prev? . root in
     node SUBST = iic* .noun | iic+ .ifc in 
     node VERB = CONJUG | iiv.auxi in
     node PHRASE = (SUBST | VERB | INVAR)+
   end
  
   \end{verbatim}

We remark that our language permits a succinct expression to what would be a
  complex regular expression if it had to be flattened. *)

(* \subsection{Module Generate\_ast} *)
 
(* Let us define a module for generating the abstract syntax tree of a program 
   implementing a phase automaton, assuming we provided a name for the
   aum of empty word, a list of aums used in the definition of the automaton, 
   a name for the module associated to the automaton, the phase
   representing the first state of the automaton, the list of phases, the 
   follow sets and the list of terminal states. *)

(* Dummy location needed for the quotation mechanism *)
value _loc = Loc.ghost
;
module Generate_ast : sig

  type aum_name = string 
  and module_name = string
  and phase = (string * int)
  and follows = list (phase * list phase)
  and program = Ast.str_item;
  value gen_ast : aum_name -> list aum_name -> module_name -> 
	phase -> list phase -> follows -> 
	list phase -> program;

  end = struct

(* The implementation consists in encapsulating the structures in the given 
   datatypes and functions, with help of the macro-generating facilities of 
   Camlp4. The reader is advised to skip this section at first reading. *)

  type aum_name = string 
  and module_name = string
  and phase = (string * int)
  and follows = list (phase * list phase)
  and program = Ast.str_item
;

(* To append a number [i] to [name] capitalized, except for the number 0: *)
value convert_uid_int (name,i) =
  let cap = String.capitalize name in
  if i=0 (* the name is used once in the regular expression *)
  then cap else cap ^ string_of_int i
;

(* Generates the type record [auto_vect]. *)
value gen_type_vect phases = 
let f n acc = <:ctyp< $lid:n$ : Auto.auto; $acc$ >> in 
let type_record = List.fold_right f phases <:ctyp<>> in
    <:str_item< type auto_vect = { $type_record$ } >>
; 

(* Generates the type [phase]. *)
value gen_type_phase phases = 
  (* first compute the names of all phases *)
  let list_type = List.map convert_uid_int phases in
  let sslt = List.fold_right (fun x acc -> <:ctyp<$uid:x$ | $acc$>>) list_type <:ctyp<>> in 
  <:str_item< type phase = [ $sslt$ ] >>
;

(* Generates the [transducer] function. *)
value gen_fun_morphism phases =   
  let mc = 
      let process (x,y) acc = 
         <:match_case< $uid: x$ -> Fsm.autos.$lid:y$ | $acc$ >> in
      List.fold_right process phases <:match_case<>> in
  <:str_item< value transducer = fun [ $mc$ ]>>
;

(* Generates the [dispatch] function. *)
value gen_fun_dispatch follows = 
  (* translates a follow *)
  let trad_a_follow (n, ln) acc = 
    let tln = List.fold_right tr ln <:expr< [] >>
        where tr x l = 
           let x' = convert_uid_int x in 
           <:expr< [ $uid:x'$ :: $l$ ] >> in
    <:match_case< $uid:convert_uid_int n$ -> $tln$ | $acc$ >> in
  (* translates follow sets *)
  let match_cases = List.fold_right trad_a_follow follows <:match_case<>> in
  <:str_item< value dispatch = fun [ $match_cases$ ]>>
;
value gen_initial_state initial_phase = 
  <:str_item< value initial = $uid:convert_uid_int initial_phase$ >>
;

(* Generation of the list of terminal states. *)
value gen_fun_terminal l = 
  let the_list = 
    List.fold_right tr l <:expr< [] >> 
    where tr e l =
          let e' = <:expr<$uid: convert_uid_int e$>> in
          <:expr<[ $ e'$ :: $l$ ]>> in
  <:str_item<value terminal phase = List.mem phase $the_list$ >>
;

(* Generates the module with name [module_name] *)
value gen_module empty_aum module_name initial_phase phases
                 follows terminal =
  (* declaration and definition of types and functions *)
  let type_phase = gen_type_phase [ initial_phase :: phases ]
  and fun_morphism = gen_fun_morphism 
    [ (convert_uid_int initial_phase, empty_aum) :: 
        (List.map (fun (x,y) -> (convert_uid_int (x,y),x)) phases) ]
  and fun_dispatch = gen_fun_dispatch follows
  and value_initial = gen_initial_state initial_phase
  and fun_terminal = gen_fun_terminal terminal in 
  let st = <:str_item< $type_phase$;
                       $fun_morphism$;
                       $fun_dispatch$;
                       $value_initial$;
                       $fun_terminal$ >> in
  (* end of decl and def *)
  <:str_item< module $module_name$ =
      functor ( Fsm : sig value autos : auto_vect; end ) -> struct $st$ end>>
;

(* Generates all declarations of the file we want to generate *)
value gen_ast empty_aum aums module_name initial_phase phases
              follows terminal = 
  let type_vect = gen_type_vect [ empty_aum :: aums ] in
  let module_body = 
    gen_module empty_aum module_name initial_phase phases
               follows terminal in
  let module_contents = <:str_item< $type_vect$; $module_body$ >> in
  let automata_functor = 
      <:str_item< module Automata = 
        (* Automata is a functor with parameter module Auto *)
        functor (Auto : sig type auto; end) -> struct $module_contents$ end >> in
  automata_functor
;
end;

(* \subsection{Generating the plug-in module} *)

open Berry_Sethi;
open Parser;

(* Reads on input channel [ch] the phase automaton description, parses it 
   using the entry point [def_auto], calls the Berry-Sethi algorithm, and
   returns the resulting plug-in module as Ocaml abstract syntax. *)
  value parse_implem ?directive_handler _loc strm =
    let (empty_aum, init, aums, module_name, system) =
        Gram.parse def_auto _loc strm in
    let exp = Regexp_system.flatten (List.rev system) 
    and initial_phase = (init,0) in
    let (initial_phase, phases, follows, terminal) = compile initial_phase exp in
    Generate_ast.gen_ast empty_aum aums module_name initial_phase phases follows terminal
  ;
  value parse_interf ?directive_handler _loc _strm = assert False
  ;
end
;
let module M = Camlp4.Register.OCamlParser Id Regular in ()
;

(* For generating the code from a concrete automaton in a file [xxx.aut] one may call: *)
(* [camlp4 pr_r.cmo ./regular.cmo -impl xxx.aut] *)
(* This will pretty-print the result to standard output, where it may be redirected to a file. *)

(*i end; i*)
