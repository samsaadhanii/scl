SHELL=/bin/sh

include ../../../../paths.sh

#################################################
# Makefile of graph preparatoy program in Ocaml #
#################################################

APATH=./DATA/AkAfkRA
YPATH=./DATA/yogyawA

FILES = build_graph.ml constraint.ml paths.ml relations.ml $(APATH)/aaxikarma_dhaatu.ml $(APATH)/bhaava_kqw.ml $(APATH)/Sabxakarma_dhaatu.ml \
$(APATH)/shakaadi.ml  $(APATH)/shlish_aadi.ml $(APATH)/afgavikaara.ml $(APATH)/akarmaka_dhaatu.ml $(APATH)/amarakosha_jaati.ml \
$(APATH)/apAxAna_dhaatu.ml $(APATH)/buxXyarWa_dhaatu.ml $(APATH)/gawyarWa_dhaatu.ml $(APATH)/karaNa_dhaatu.ml \
$(APATH)/karmasamAnAXikaraNa_dhaatu.ml $(APATH)/karwqsamAnAXikaraNa_dhaatu.ml $(APATH)/kqxanwa.ml $(APATH)/nirXAraNa.ml \
$(APATH)/prawyavasAnArWa_dhaatu.ml $(APATH)/sakarmaka_dhaatu.ml $(APATH)/samboXana_sUcaka.ml $(APATH)/sampraxAna_dhaatu.ml \
$(APATH)/vAkyakarma_dhaatu.ml $(APATH)/viRayAXikaraNa.ml $(APATH)/viRayi.ml $(APATH)/xvikarmaka1_dhaatu.ml $(APATH)/xvikarmaka2_dhaatu.ml \
$(YPATH)/SabxavAci.ml $(YPATH)/animate.ml $(YPATH)/avy_viSeRaNam.ml $(YPATH)/buxXivAci.ml $(YPATH)/guNa_not_guNavacana.ml \
$(YPATH)/guNavacana.ml $(YPATH)/intensifiers.ml $(YPATH)/kAlAXikaraNa.ml $(YPATH)/kAlAXva.ml $(YPATH)/kriyAviSeRaNa.ml \
$(YPATH)/manuRyaparyAya.ml $(YPATH)/manuRyasaFjFAvAcI.ml $(YPATH)/named_entity.ml $(YPATH)/non_RaRTI.ml $(YPATH)/pUraNa.ml \
$(YPATH)/parAjAwi.ml $(YPATH)/saMKyeya.ml $(YPATH)/sambandhavaaci.ml $(YPATH)/upAXi.ml $(YPATH)/upapada6.ml \
$(YPATH)/waxXiwAnwa.ml $(YPATH)/xeSAXikaraNa.ml $(YPATH)/xravyavAcI.ml $(YPATH)/non_neuter_kartaa_dhaatu.ml

INTERFACES = pada_structure.mli
SYNTAX = .ocamlinit
ZEN=$(ZENDIR)
HPATH=./Heritage_ML

all: build_graph

COMPILE=ocamlopt -pp "camlp4r pa_extend.cmo" -I $(ZEN)  -I $(HPATH) -I $(APATH)  -I $(YPATH) -I +camlp4 -c

COMPILEI=ocamlc -pp "camlp4r pa_extend.cmo" -I $(ZEN)  -I $(HPATH) -I $(APATH)  -I $(YPATH) -I +camlp4 -c

LINK=ocamlopt -I $(ZEN) -I +camlp4 dynlink.cmxa camlp4lib.cmxa

ZENSOURCES=gen.ml list2.ml word.ml share.mli share.ml unshare.ml trie.ml \
mini.ml deco.ml lexmap.ml minimap.mli minimap.ml min_lexer.ml

SOURCES= $(INTERFACES) $(FILES) $(HPATH)/min_lexer.ml $(HPATH)/transduction.ml

CORE=$(ZEN)/list2.cmx $(ZEN)/ascii.cmx $(ZEN)/gen.cmx $(ZEN)/trie.cmx $(ZEN)/zen_lexer.cmx

EXECS=$(HPATH)/min_lexer.cmx $(HPATH)/transduction.cmx 

VPATH=$(ZEN) $(HPATH)

build_graph: pada_structure.cmi bank_lexer.cmx ascii.cmx trie.cmx min_lexer.cmx transduction.cmx constraint.cmx build_graph.cmx paths.cmx relations.cmx $(APATH)/aaxikarma_dhaatu.cmx $(APATH)/bhaava_kqw.cmx $(APATH)/Sabxakarma_dhaatu.cmx \
$(APATH)/shakaadi.cmx  $(APATH)/shlish_aadi.cmx $(APATH)/afgavikaara.cmx $(APATH)/akarmaka_dhaatu.cmx $(APATH)/amarakosha_jaati.cmx \
$(APATH)/apAxAna_dhaatu.cmx $(APATH)/buxXyarWa_dhaatu.cmx $(APATH)/gawyarWa_dhaatu.cmx $(APATH)/karaNa_dhaatu.cmx \
$(APATH)/karmasamAnAXikaraNa_dhaatu.cmx $(APATH)/karwqsamAnAXikaraNa_dhaatu.cmx $(APATH)/kqxanwa.cmx $(APATH)/nirXAraNa.cmx \
$(APATH)/prawyavasAnArWa_dhaatu.cmx $(APATH)/sakarmaka_dhaatu.cmx $(APATH)/samboXana_sUcaka.cmx $(APATH)/sampraxAna_dhaatu.cmx \
$(APATH)/vAkyakarma_dhaatu.cmx $(APATH)/viRayAXikaraNa.cmx $(APATH)/viRayi.cmx $(APATH)/xvikarmaka1_dhaatu.cmx $(APATH)/xvikarmaka2_dhaatu.cmx \
$(YPATH)/SabxavAci.cmx $(YPATH)/animate.cmx $(YPATH)/avy_viSeRaNam.cmx $(YPATH)/buxXivAci.cmx $(YPATH)/guNa_not_guNavacana.cmx \
$(YPATH)/guNavacana.cmx $(YPATH)/intensifiers.cmx $(YPATH)/kAlAXikaraNa.cmx $(YPATH)/kAlAXva.cmx $(YPATH)/kriyAviSeRaNa.cmx \
$(YPATH)/manuRyaparyAya.cmx $(YPATH)/manuRyasaFjFAvAcI.cmx $(YPATH)/named_entity.cmx $(YPATH)/non_RaRTI.cmx $(YPATH)/pUraNa.cmx \
$(YPATH)/parAjAwi.cmx $(YPATH)/saMKyeya.cmx $(YPATH)/sambandhavaaci.cmx $(YPATH)/upAXi.cmx $(YPATH)/upapada6.cmx \
$(YPATH)/waxXiwAnwa.cmx $(YPATH)/xeSAXikaraNa.cmx $(YPATH)/xravyavAcI.cmx $(YPATH)/non_neuter_kartaa_dhaatu.cmx
	$(LINK) unix.cmxa bank_lexer.cmx $(CORE) $(EXECS) constraint.cmx paths.cmx relations.cmx $(APATH)/aaxikarma_dhaatu.cmx $(APATH)/bhaava_kqw.cmx \
$(APATH)/Sabxakarma_dhaatu.cmx $(APATH)/shakaadi.cmx  $(APATH)/shlish_aadi.cmx $(APATH)/afgavikaara.cmx $(APATH)/akarmaka_dhaatu.cmx $(APATH)/amarakosha_jaati.cmx \
$(APATH)/apAxAna_dhaatu.cmx $(APATH)/buxXyarWa_dhaatu.cmx $(APATH)/gawyarWa_dhaatu.cmx $(APATH)/karaNa_dhaatu.cmx \
$(APATH)/karmasamAnAXikaraNa_dhaatu.cmx $(APATH)/karwqsamAnAXikaraNa_dhaatu.cmx $(APATH)/kqxanwa.cmx $(APATH)/nirXAraNa.cmx \
$(APATH)/prawyavasAnArWa_dhaatu.cmx $(APATH)/sakarmaka_dhaatu.cmx $(APATH)/samboXana_sUcaka.cmx $(APATH)/sampraxAna_dhaatu.cmx \
$(APATH)/vAkyakarma_dhaatu.cmx $(APATH)/viRayAXikaraNa.cmx $(APATH)/viRayi.cmx $(APATH)/xvikarmaka1_dhaatu.cmx $(APATH)/xvikarmaka2_dhaatu.cmx \
$(YPATH)/SabxavAci.cmx $(YPATH)/animate.cmx $(YPATH)/avy_viSeRaNam.cmx $(YPATH)/buxXivAci.cmx $(YPATH)/guNa_not_guNavacana.cmx \
$(YPATH)/guNavacana.cmx $(YPATH)/intensifiers.cmx $(YPATH)/kAlAXikaraNa.cmx $(YPATH)/kAlAXva.cmx $(YPATH)/kriyAviSeRaNa.cmx \
$(YPATH)/manuRyaparyAya.cmx $(YPATH)/manuRyasaFjFAvAcI.cmx $(YPATH)/named_entity.cmx $(YPATH)/non_RaRTI.cmx $(YPATH)/pUraNa.cmx \
$(YPATH)/parAjAwi.cmx $(YPATH)/saMKyeya.cmx $(YPATH)/sambandhavaaci.cmx $(YPATH)/upAXi.cmx $(YPATH)/upapada6.cmx \
$(YPATH)/waxXiwAnwa.cmx $(YPATH)/xeSAXikaraNa.cmx $(YPATH)/xravyavAcI.cmx  $(YPATH)/non_neuter_kartaa_dhaatu.cmx build_graph.cmx -o build_graph 
	#cd $(APATH); ./extract.sh

debug: ascii.cmo trie.cmo debug.ml
	(cat debug.ml; cat -) | ocaml -I +camlp4 -I . -I $(ZEN)

.depend depend:: $(SOURCES)
	> .depend.new
	for i in $(ZENSOURCES); do \
	ocamldep -pp camlp4rf -I $(ZEN) -I . $(ZEN)/$$i >> .depend.new ; done
	for i in $(SOURCES); do \
	 ocamldep -pp camlp4rf -I $(ZEN) -I . -I $(APATH)  -I $(YPATH)  $$i >> .depend.new ; done
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
	rm -f *.cmo *.cmi *.cmx *.ppi *.ppo *.o $(APATH)/*.cmo $(APATH)/*cmi $(APATH)/*.cmx $(YPATH)/*cmi $(YPATH)/*.cmx 
