############################################################################
#                                                                          #
#                The Zen Computational Linguistics Toolkit                 #
#                                                                          #
#                               Gérard Huet                                #
#                                                                          #
############################################################################
# Makefile of ZEN computational linguistics toolkit software               #
# V2.3.2 25-12-2010                                   Copyright INRIA 2010 #
############################################################################

# debug by make debug, which calls ocaml -I +camlp4 -I . 
# which loads the "Pidgin ML" syntax by .ocamlinit 

# make clean; make depend; make all
# NB if the native code compiler ocamlopt is not installed, replace make all
# by make allbyte which generates bytecode versions runnable by ocamlrun

# To build the corresponding library: make bcar for the bytecode library
# and make ncar for the nativecode library. make allar build both. make install
# install the libraries in the directory INSTALL_DIR
# This completes the installation/distribution of the core ZEN toolkit

# From Zen Version 2.1, additional modules are provided for the definition of
# mixed automata (aums) and for the corresponding reactive engine (react).
# Various instances are distributed: aum0/react0 for simplistic aums
# (basically dictionaries) aume/reacte for automata with External virtual addresses
# and aumt/reactt for aum transducers with both # Internal and External virtual addresses. 
# The module Regular is a meta-programming tool for macro-generating an Automata functor 
# specified by the user in a specific automaton description source file X.aut. 
# Instanciating Automata with the relevant aum signature yields the user-specific Dispatch 
# module needed by the relevant React.
# See the Zen documentation for details and examples. 

# Internal note of the developing team.
# Extra files needed for development, beyond distributed ones - SITE dir, RESOURCES dir, DOC dir, debug.ml, ENTETE

VERSION=2.3.2
CODE_SOURCES=pidgin.ml gen.ml list2.ml ascii.ml latin.ml word.ml \
zen_lexer.ml transducer.ml zipper.ml bintree.ml share.mli share.ml sharemod.mli \
sharemod.ml trie.ml mini.ml deco.ml lexmap.ml \
minimap.mli minimap.ml tertree.ml minitertree.ml lexicon.ml \
make_lex.ml unglue.ml \
aum0.mli react0.ml \
aume.mli reacte.ml \
aumt.mli reactt.ml \
regular.ml

SPECIFIC_SOURCES=make_english_lexicon.ml make_french_lexicon.ml example_dispatch.ml \
sanskrit_dispatch.ml example_engine.ml sanskrit_engine.ml 
SPECIFIC_AUTOMATA_SOURCES=example.aut sanskrit.aut

ORDERED_SOURCES = gen.ml list2.ml ascii.ml zen_lexer.ml transducer.ml latin.ml word.ml \
zipper.ml bintree.ml share.mli share.ml sharemod.mli sharemod.ml trie.ml mini.ml deco.ml \
lexmap.ml minimap.mli minimap.ml tertree.ml minitertree.ml lexicon.ml make_lex.ml \
unglue.ml aum0.mli react0.ml aume.mli reacte.ml aumt.mli reactt.ml


########### ZEN2 #############
# aum0.mli react0.ml : simplistic aums reduced to dictionaries
# aumt.mli reactt.ml : full structure with Internal and External addresses, no accepting boolean
# regular.ml : meta-programming tools for creating the dispatching module
# example.aut : a simple example of automaton description
# sanskrit.aut : the automaton for Sanskrit segmentation

TEST_SOURCES=unshare.ml terdagify.ml list_iso.ml dagify.ml timeshare.ml test.ml unglue_test.ml 
ML_SOURCES=$(CODE_SOURCES) $(TEST_SOURCES) $(SPECIFIC_SOURCES)
SOURCES=$(ML_SOURCES) $(SPECIFIC_AUTOMATA_SOURCES)

#ifneq ($(MAKECMDGOALS),clean)
#ifneq ($(MAKECMDGOALS),order)
#ifneq ($(MAKECMDGOALS),.order)
#-include .order
#endif
#endif
#endif

INSTALL_DIR = `ocamlc -where`/zen
#INSTALL_DIR = $(HOME)/lib/ocaml/zen

COMPILE=ocamlopt -pp "camlp4rf" -I +camlp4 -c

COMPILEI=ocamlc -pp "camlp4rf" -I +camlp4 -c 

LINK=ocamlopt -I +camlp4 
LINKG=ocamlopt -I +camlp4 dynlink.cmxa camlp4lib.cmxa

LINK_BYTE=ocamlc -I +camlp4 
LINK_BYTEG=ocamlc -I +camlp4 dynlink.cma camlp4lib.cma

# NB regular.ml compiled as regular.cmo for meta-programming - regular.cmx unused 
all: timeshare unshare make_english_lexicon make_french_lexicon dagify \
terdagify list_iso test unglue_test.cmx minimap.cmx lexmap.cmx bintree.cmx \
deco.cmx zen_lexer.cmx transducer.cmx sharemod.cmx react0.cmx reactt.cmx reacte.cmx \
regular.cmo #specific_cmx

# specific dispatch and engine modules
specific_cmx: example_dispatch.cmx sanskrit_dispatch.cmx example_engine.cmx \
sanskrit_engine.cmx 

allbyte: timeshare.byte unshare.byte make_english_lexicon.byte \
make_french_lexicon.byte dagify.byte terdagify.byte list_iso.cmo \
test.cmo unglue_test.cmo minimap.cmo lexmap.cmo bintree.cmo deco.cmo \
zen_lexer.cmo transducer.cmo sharemod.cmo react0.cmo reactt.cmo regular.cmo specific_cmo

# specific dispatch and engine modules
specific_cmo: example_dispatch.cmo sanskrit_dispatch.cmo example_engine.cmo \
sanskrit_engine.cmo 

install: zen.cma zen.cmxa zen.a regular.cmo
	if test -d $(INSTALL_DIR); then : ; else mkdir -p $(INSTALL_DIR); fi
	cp $^ $(INSTALL_DIR)
	cp $(filter-out pidgin.%,$(ORDERED_SOURCES:.ml=.cmi)) $(INSTALL_DIR)

uninstall:
	if test -d $(INSTALL_DIR); then rm -rf $(INSTALL_DIR) ; fi

# timing test for sharing
TIMESHARE_NATIF=list2.cmx gen.cmx share.cmx trie.cmx mini.cmx timeshare.cmx 
timeshare: $(TIMESHARE_NATIF)
	$(LINK) unix.cmxa -o $@ $(TIMESHARE_NATIF)
TIMESHARE_BYTE=$(TIMESHARE_NATIF:.cmx=.cmo)
timeshare.byte: $(TIMESHARE_BYTE)
	$(LINK_BYTE) unix.cma -o $@ $(TIMESHARE_BYTE)

# unsharing tries
UNSHARE_NATIF=list2.cmx gen.cmx share.cmx trie.cmx unshare.cmx 
unshare: $(UNSHARE_NATIF)
	$(LINK) -o $@ $(UNSHARE_NATIF)
UNSHARE_BYTE=$(UNSHARE_NATIF:.cmx=.cmo)
unshare.byte: $(UNSHARE_BYTE)
	$(LINK_BYTE) -o $@ $(UNSHARE_BYTE)

# making a listing of word in iso-latin
ISO_NATIF=list2.cmx gen.cmx zen_lexer.cmx transducer.cmx latin.cmx trie.cmx list_iso.cmx
list_iso: $(ISO_NATIF)
	$(LINKG) -o $@ $(ISO_NATIF)
ISO_BYTE=$(ISO_NATIF:.cmx=.cmo)
list_iso.byte: $(ISO_BYTE)
	$(LINK_BYTEG) -o $@ $(ISO_BYTE)

# non-regression tests
test: list2.cmx gen.cmx ascii.cmx word.cmx test.cmx
	$(LINK) list2.cmx gen.cmx ascii.cmx word.cmx test.cmx -o test

debug: pidgin.cmo gen.cmo list2.cmo ascii.cmo word.cmo zipper.cmo bintree.cmo share.cmo \
trie.cmo mini.cmo deco.cmo lexmap.cmo minimap.cmo tertree.cmo minitertree.cmo \
lexicon.cmo unglue.cmo latin.cmo debug.ml
	(cat debug.ml ; cat -) | ocaml -I +camlp4 -I . 

MAKE_LEXE_NATIF=list2.cmx gen.cmx ascii.cmx word.cmx share.cmx trie.cmx make_lex.cmx \
make_english_lexicon.cmx 
make_english_lexicon: $(MAKE_LEXE_NATIF)
	$(LINK) -o $@ $(MAKE_LEXE_NATIF)
MAKE_LEXE_BYTE=$(MAKE_LEXE_NATIF:.cmx=.cmo)
make_english_lexicon.byte: $(MAKE_LEXE_BYTE)
	$(LINK_BYTE) -o $@ $(MAKE_LEXE_BYTE)

MAKE_LEXF_NATIF=list2.cmx gen.cmx zen_lexer.cmx transducer.cmx latin.cmx word.cmx \
share.cmx trie.cmx make_lex.cmx make_french_lexicon.cmx 
make_french_lexicon: $(MAKE_LEXF_NATIF)
	$(LINKG) -o $@ $(MAKE_LEXF_NATIF)

MAKE_LEXF_BYTE=$(MAKE_LEXF_NATIF:.cmx=.cmo)
make_french_lexicon.byte: $(MAKE_LEXF_BYTE)
	$(LINK_BYTEG) -o $@ $(MAKE_LEXF_BYTE)

DAGIFY_NATIF=list2.cmx gen.cmx word.cmx share.cmx trie.cmx mini.cmx dagify.cmx
dagify: $(DAGIFY_NATIF)
	$(LINK) -o $@ $(DAGIFY_NATIF)
DAGIFY_BYTE=$(DAGIFY_NATIF:.cmx=.cmo)
dagify.byte: $(DAGIFY_BYTE)
	$(LINK_BYTE) -o $@ $(DAGIFY_BYTE)

TERDAGIFY_NATIF=list2.cmx gen.cmx word.cmx share.cmx trie.cmx tertree.cmx \
minitertree.cmx terdagify.cmx
terdagify: $(TERDAGIFY_NATIF)
	$(LINK) -o $@ $(TERDAGIFY_NATIF)
TERDAGIFY_BYTE=$(TERDAGIFY_NATIF:.cmx=.cmo)
terdagify.byte: $(TERDAGIFY_BYTE)
	$(LINK_BYTE) -o $@ $(TERDAGIFY_BYTE)

# macro-generated code 
GEN_CODE=sanskrit_dispatch.ml example_dispatch.ml

# test of make_english_lexicon: build a trie from a list of words, one per line
english.rem: RESOURCES/english.lst make_english_lexicon
	make_english_lexicon < RESOURCES/english.lst > RESOURCES/english.rem

# test for dagify: minimizing the trie of english words
english.min.rem: RESOURCES/english.rem dagify
	dagify < RESOURCES/english.rem > RESOURCES/english.min.rem

# test of make_french_lexicon: build a trie from a list of words, one per line
french.rem: RESOURCES/french.lst make_french_lexicon
	make_french_lexicon < RESOURCES/french.lst > RESOURCES/french.rem

# minimizing the trie of french words
french.min.rem: RESOURCES/french.rem dagify
	dagify < RESOURCES/french.rem > RESOURCES/french.min.rem

french.iso: RESOURCES/french.min.rem list_iso
	list_iso < RESOURCES/french.min.rem > RESOURCES/french.iso

sanskrit.aut:
	echo "sanskrit.aut specified by user"

example.aut:
	echo "example.aut specified by user"

COPYRIGHT:
	echo "COPYRIGHT should not be tampered with"

regular.cmo: regular.ml
	ocamlc -c -w a -pp "camlp4rf" -I +camlp4 regular.ml


COM1="(* Mechanically generated by [print_automaton] from source example.aut    *)"
COM2="(* using the [Regular] module of Benoit Razet with the Camlp4 library     *)"
example_dispatch.ml: COPYRIGHT regular.cmo example.aut
	(cat COPYRIGHT ; echo $(COM1) ; echo $(COM2) ; echo "" ; \
	camlp4 pr_r.cmo ./regular.cmo -impl example.aut) > example_dispatch.ml 
# Now provide example_aum0.ml loading the aum0 recognizers for a,b,c; link it with 
# example_dispatch and example_engine and call (Gen_engine Example_Aum0) to get Engine.react1

sanskrit_dispatch.ml: COPYRIGHT regular.cmo sanskrit.aut
	(cat COPYRIGHT ; echo \
	$(COM1) ; echo \
	$(COM2) ; echo "" ; \
	camlp4 pr_r.cmo ./regular.cmo -impl sanskrit.aut) > sanskrit_dispatch.ml 
# Now provide sanskrit_aumt.ml loading the aumt segmenters for noun, etc; link it with 
# sanskrit_dispatch and sanskrit_engine and call (Gen_engine Sanskrit_Aumt) to get Engine.react1

# development RESOURCES omitted for size, SITE included, no extra directory structure
zen.tar: $(SOURCES) debug.ml Makefile DOC ENTETE README COPYRIGHT LICENSE 
	tar cvf - $(SOURCES) debug.ml Makefile DOC ENTETE README COPYRIGHT LICENSE SITE .ocamlinit .depend > zen.tar

tar: zen.tar

# distribution tarball
distr:
	tar cvf - $(SOURCES) Makefile DOC/zen.pdf README COPYRIGHT LICENSE .ocamlinit .depend | (mkdir ZEN_$(VERSION); cd ZEN_$(VERSION); tar xf -)
	tar cf zen_$(VERSION).tar ZEN_$(VERSION)

# depot
depot:
	tar cvf - $(SOURCES) Makefile DOC/zen.pdf README COPYRIGHT LICENSE .ocamlinit .depend | (mkdir ZEN_$(VERSION); cd ZEN_$(VERSION); tar xf -)

docu:
	cd DOC; make doc

.depend depend:: $(ML_SOURCES) # remove dependence on sources for development
	> .depend.new
	for i in $(ML_SOURCES); do \
	ocamldep -pp camlp4rf -I . $$i >> .depend.new ; \
	done
	mv .depend.new .depend

# uses ocamldsort to print the list of sources in dependency order 
dsort.txt: $(CODE_SOURCES)
	ocamldsort -mli -pp camlp4rf $(CODE_SOURCES) > dsort.txt
	ls -f `cat dsort.txt` | grep .mli >> dsort.txt # sorting mli's after ml's

oug: dsort.txt
	oug.x -I +camlp4 -pp camlp4rf `cat dsort.txt`
# builds the dependency graph as a dot file oug-weight.png
oug.weight: dsort.txt
	oug.x -I +camlp4 -pp camlp4rf `cat dsort.txt` --weight-dot oug-weight.dot
	scp oug-weight.dot yquem: # since graphviz not installed, we use yquem to build the png file
	ssh yquem "dot -Tpng -o oug-weight.png oug-weight.dot"
	scp yquem:oug-weight.png .

clean:
	rm -f *.cmo *.cmi *.cmx *.ppi *.ppo *.o *.cma *.a *.cmxa *~ .order 
	-rm -f dagify list_iso make_french_lexicon make_english_lexicon terdagify test timeshare unshare $(GEN_CODE)

.SUFFIXES: .ml .mli .cmx .cmo .cmi

.ml.cmo:
	$(COMPILEI) $<

.mli.cmi:
	$(COMPILEI) $<

.ml.cmx:
	$(COMPILE) $<

%.cma : $(filter-out %.mli, $(ORDERED_SOURCES:.ml=.cmo))
	$(LINK_BYTE) -a -o $@ $^

%.a %.cmxa : $(filter-out %.mli, $(ORDERED_SOURCES:.ml=.cmx))
	$(LINK) -a -o $(basename $@).cmxa  $^

ncar : zen.a zen.cmxa

bcar : zen.cma

allar: ncar bcar

#order: $(filter-out %.mli pidgin.%,$(ML_SOURCES:.ml=.cmo))
#
#.order:
#	$(MAKE) clean
#	-rm -f .order
#	$(MAKE) order | sed -e '/\.ml/!d;s/^.* \(.*\.ml\).*$$/\1/' | xargs echo -n | sed -e 's/.*/ORDERED_SOURCES = \0/' > .order
#

include .depend
