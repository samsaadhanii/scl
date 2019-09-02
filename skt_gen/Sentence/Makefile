SHELL=/bin/sh

include ../../paths.sh

FILES = sentence_generator.ml paths.ml
INTERFACES = pada_structure.mli
SYNTAX = .ocamlinit
ZEN=$(ZENDIR)
HPATH=../../SHMT/prog/kAraka/Prepare_Graph/Heritage_ML

all: sentence_generator scan_input.out
#all: scan_input.out

LIBPATH = /usr/lib
FLEX = lex
CC = gcc
CFLAGS = -L$(LIBPATH) -g -Wall -o

COMPILE=ocamlopt -pp "camlp4r pa_extend.cmo" -I $(ZEN)  -I $(HPATH) -I +camlp4 -c

COMPILEI=ocamlc -pp "camlp4r pa_extend.cmo" -I $(ZEN)  -I $(HPATH) -I +camlp4 -c

LINK=ocamlopt -I $(ZEN) -I +camlp4 dynlink.cmxa camlp4lib.cmxa

ZENSOURCES=gen.ml list2.ml word.ml share.mli share.ml unshare.ml trie.ml \
mini.ml deco.ml lexmap.ml minimap.mli minimap.ml

SOURCES= $(INTERFACES) $(FILES) $(HPATH)/transduction.ml $(HPATH)/min_lexer.ml

CORE=$(ZEN)/list2.cmx $(ZEN)/ascii.cmx $(ZEN)/gen.cmx $(ZEN)/trie.cmx

EXECS=$(HPATH)/min_lexer.cmx $(HPATH)/transduction.cmx

VPATH=$(ZEN) $(HPATH)

sentence_generator: pada_structure.cmi bank_lexer.cmx min_lexer.cmx transduction.cmx sentence_generator.cmx paths.cmx
	$(LINK) bank_lexer.cmx unix.cmxa $(CORE) $(EXECS) str.cmxa paths.cmx sentence_generator.cmx -o sentence_generator

scan_input.out: scan_input.lex
	lex -B --warn scan_input.lex
	$(CC) $(CFLAGS) scan_input.out lex.yy.c -ll
	rm lex.yy.c

.depend depend:: $(SOURCES)
	> .depend.new
	for i in $(ZENSOURCES); do \
	ocamldep -pp camlp4rf -I $(ZEN) -I . $(ZEN)/$$i >> .depend.new ; done
	for i in $(SOURCES); do \
	ocamldep -pp camlp4rf -I $(ZEN) -I . $$i >> .depend.new ; done
	mv .depend.new .depend
.SUFFIXES: .ml .mli .cmx .cmo .cmi

.ml.cmo:
	$(COMPILEI) $<

.mli.cmi:
	$(COMPILEI) $<

.ml.cmx:
	$(COMPILE) $<

include .depend

clean:
	rm -f *.cmo *.cmi *.cmx *.ppi *.ppo *.o scan_input.out
