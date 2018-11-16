############################################################################
#                                                                          #
#                The Zen Computational Linguistics Toolkit                 #
#                                                                          #
#                               Gérard Huet                                #
#                                                                          #
############################################################################
# Makefile of ZEN computational linguistics toolkit documentation          #
# V2.3.2 24-12-2010                                   Copyright INRIA 2010 #
############################################################################

#NOWEB=ocamlweb --old-fullpage -p "\usepackage{url} \usepackage{graphicx}"
NOWEB=ocamlweb -p "\usepackage{url} \usepackage{graphicx}"
OCAMLWEB=../../DOC/OCAMLWEB

TEX=intro.tex gen.tex list2.tex word.tex zipper.tex bintree.tex trie.tex lexicon.tex make_lex.tex share.tex mini.tex dagify.tex tertree.tex deco.tex lexmap.tex minimap.tex english.tex french.tex sanskrit.tex unglue.tex coroutines.tex biblio.tex supplements.tex zen.tex

DOC=zen.ps zen.pdf zen.html

MAIN=../pidgin.ml gen.tex ../gen.ml list2.tex ../list2.ml word.tex ../word.ml \
zipper.tex ../zipper.ml bintree.tex ../bintree.ml trie.tex ../trie.ml ascii.tex \
../ascii.ml lexicon.tex ../lexicon.ml make_lex.tex ../make_lex.ml share.tex \
../share.mli ../share.ml mini.tex ../mini.ml dagify.tex ../dagify.ml \
../make_english_lexicon.ml english.tex ../zen_lexer.ml ../transducer.ml \
../latin.ml french.tex ../make_french_lexicon.ml sanskrit.tex tertree.tex \
../tertree.ml ../minitertree.ml deco.tex ../deco.ml lexmap.tex ../lexmap.ml \
minimap.tex ../minimap.mli ../minimap.ml unglue.tex ../unglue.ml \
../unglue_test.ml coroutines.tex \
intro_aum0.tex ../aum0.mli react0.tex ../react0.ml aumt.tex ../aumt.mli \
reactt.tex ../reactt.ml regular.tex ../regular.ml linking.tex \
../sanskrit_engine.ml conclusion.tex biblio.tex 

ZEN=intro.tex $(MAIN)

doc: tex # html 
 
tex: 
	$(NOWEB) --noweb $(ZEN) -o zen.tex
	pdflatex zen
#	dvips -Pwww -f zen.dvi > zen.ps
#	ps2pdf zen.ps

html: # fails because includegraphics
	$(NOWEB) --noweb --html --hevea-option "-I $(OCAMLWEB)" $(ZEN) -o zen.html



