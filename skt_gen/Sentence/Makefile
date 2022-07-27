SHELL=/bin/sh

include ../../paths.sh


APATH=../../MT/prog/kAraka/Prepare_Graph/DATA/AkAfkRA
DPATH=data

FILES = sentence_generator.ml paths.ml $(APATH)/karaNa_dhaatu.ml $(APATH)/sampraxAna_dhaatu.ml $(APATH)/apAxAna_dhaatu.ml $(APATH)/sakarmaka_dhaatu.ml $(APATH)/xvikarmaka1_dhaatu.ml $(APATH)/xvikarmaka2_dhaatu.ml $(APATH)/aaxikarma_dhaatu.ml $(APATH)/gawyarWa_dhaatu.ml $(APATH)/Sabxakarma_dhaatu.ml $(APATH)/buxXyarWa_dhaatu.ml $(APATH)/prawyavasAnArWa_dhaatu.ml $(APATH)/shakaadi.ml $(APATH)/shlish_aadi.ml $(APATH)/akarmaka_dhaatu.ml $(APATH)/vAkyakarma_dhaatu.ml $(DPATH)/noun_puM.ml $(DPATH)/noun_napuM.ml $(DPATH)/noun_swrI.ml
INTERFACES = pada_structure.mli
SYNTAX = .ocamlinit
ZEN=$(ZENDIR)
HPATH=../../MT/prog/kAraka/Prepare_Graph/Heritage_ML

all: sentence_generator scan_input.out
#all: scan_input.out

LIBPATH = /usr/lib
FLEX = lex
CC = gcc
CFLAGS = -L$(LIBPATH) -g -Wall -o

COMPILE=ocamlopt -pp "camlp4r pa_extend.cmo" -I $(ZEN)  -I $(HPATH) -I $(APATH) -I $(DPATH) -I +camlp4 -c

COMPILEI=ocamlc -pp "camlp4r pa_extend.cmo" -I $(ZEN)  -I $(HPATH) -I $(APATH) -I $(DPATH) -I +camlp4 -c

LINK=ocamlopt -I $(ZEN) -I +camlp4 dynlink.cmxa camlp4lib.cmxa

ZENSOURCES=gen.ml list2.ml word.ml share.mli share.ml unshare.ml trie.ml \
mini.ml deco.ml lexmap.ml minimap.mli minimap.ml

SOURCES= $(INTERFACES) $(FILES) $(HPATH)/transduction.ml $(HPATH)/min_lexer.ml

CORE=$(ZEN)/list2.cmx $(ZEN)/ascii.cmx $(ZEN)/gen.cmx $(ZEN)/trie.cmx

EXECS=$(HPATH)/min_lexer.cmx $(HPATH)/transduction.cmx

VPATH=$(ZEN) $(HPATH)

sentence_generator: pada_structure.cmi bank_lexer.cmx min_lexer.cmx paths.cmx  $(APATH)/karaNa_dhaatu.cmx $(APATH)/sampraxAna_dhaatu.cmx $(APATH)/apAxAna_dhaatu.cmx $(APATH)/sakarmaka_dhaatu.cmx $(APATH)/xvikarmaka1_dhaatu.cmx $(APATH)/xvikarmaka2_dhaatu.cmx $(APATH)/aaxikarma_dhaatu.cmx $(APATH)/gawyarWa_dhaatu.cmx $(APATH)/Sabxakarma_dhaatu.cmx $(APATH)/buxXyarWa_dhaatu.cmx $(APATH)/prawyavasAnArWa_dhaatu.cmx $(APATH)/shakaadi.cmx $(APATH)/shlish_aadi.cmx $(APATH)/akarmaka_dhaatu.cmx $(APATH)/vAkyakarma_dhaatu.cmx $(DPATH)/noun_puM.cmx $(DPATH)/noun_napuM.cmx $(DPATH)/noun_swrI.cmx sentence_generator.cmx
	$(LINK) bank_lexer.cmx unix.cmxa $(CORE) $(EXECS) str.cmxa paths.cmx $(APATH)/karaNa_dhaatu.cmx $(APATH)/sampraxAna_dhaatu.cmx $(APATH)/apAxAna_dhaatu.cmx $(APATH)/sakarmaka_dhaatu.cmx $(APATH)/xvikarmaka1_dhaatu.cmx $(APATH)/xvikarmaka2_dhaatu.cmx $(APATH)/aaxikarma_dhaatu.cmx $(APATH)/gawyarWa_dhaatu.cmx $(APATH)/Sabxakarma_dhaatu.cmx $(APATH)/buxXyarWa_dhaatu.cmx $(APATH)/prawyavasAnArWa_dhaatu.cmx $(APATH)/shakaadi.cmx $(APATH)/shlish_aadi.cmx $(APATH)/akarmaka_dhaatu.cmx $(APATH)/vAkyakarma_dhaatu.cmx $(DPATH)/noun_puM.cmx $(DPATH)/noun_napuM.cmx $(DPATH)/noun_swrI.cmx sentence_generator.cmx -o sentence_generator

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
