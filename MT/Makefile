SHELL = /bin/bash

include ../paths.sh

SUBDIRS = prog/format prog/Normalisation prog/hn/word_gen/test prog/translation prog/kAraka/Prepare_Graph prog/wsd prog/Heritage_morph_interface prog/Discourse

all: $(SUBDIRS)
test: test

$(SUBDIRS):
	$(MAKE) -C $@

install:
	mkdir -p $(HTDOCSDIR)/$(SCL_HTDOCS)/MT; cd web_interface; sh install.sh html $(HTDOCSDIR)/$(SCL_HTDOCS)/MT; sh install.sh js $(HTDOCSDIR)/$(SCL_HTDOCS)/MT; sh install.sh css $(HTDOCSDIR)/$(SCL_HTDOCS)/MT; mkdir -p $(CGIDIR)/$(SCL_CGI)/MT/; cp *.cgi $(CGIDIR)/$(SCL_CGI)/MT/; cp *.pl $(CGIDIR)/$(SCL_CGI)/MT/
	mkdir -p $(TFPATH); chown $(APACHE_USER_GROUP) $(TFPATH); cd $(HTDOCSDIR)/$(SCL_HTDOCS)/MT; ln -sfn $(TFPATH) DEMO
	mkdir -p $(CGIDIR)/$(SCL_CGI)/MT/data/hi; cp data/hi/*.txt $(CGIDIR)/$(SCL_CGI)/MT/data/hi
	mkdir -p $(HTDOCSDIR)/$(SCL_HTDOCS)/MT/data/en/MW; mkdir -p $(HTDOCSDIR)/$(SCL_HTDOCS)/MT/data/hi/Apte_dict; mkdir -p $(HTDOCSDIR)/$(SCL_HTDOCS)/MT/data/de/ccs; mkdir -p $(HTDOCSDIR)/$(SCL_HTDOCS)/MT/data/fr/Heritage; cd data/en/MW/; sh install.sh $(HTDOCSDIR)/$(SCL_HTDOCS)/MT/data/en/MW; cd ../../../; cp -pr data/hi/Apte_dict/*.xml $(HTDOCSDIR)/$(SCL_HTDOCS)/MT/data/hi/Apte_dict; cd data/fr/Heritage; sh install.sh $(HTDOCSDIR)/$(SCL_HTDOCS)/MT/data/fr/Heritage; cd ../../de/ccs; sh install.sh $(HTDOCSDIR)/$(SCL_HTDOCS)/MT/data/de/ccs
	mkdir -p $(CGIDIR)/$(SCL_CGI)/MT/prog/anaphora; cp prog/anaphora/anaphora.pl $(CGIDIR)/$(SCL_CGI)/MT/prog/anaphora/;
	mkdir -p $(CGIDIR)/$(SCL_CGI)/MT/prog/anvaya; cp prog/anvaya/reorder.py $(CGIDIR)/$(SCL_CGI)/MT/prog/anvaya; cp prog/anvaya/*.py $(CGIDIR)/$(SCL_CGI)/MT/prog/anvaya; cp -r prog/anvaya/anytree $(CGIDIR)/$(SCL_CGI)/MT/prog/anvaya; cp prog/anvaya/rel_probs.csv $(CGIDIR)/$(SCL_CGI)/MT/prog/anvaya;
	mkdir -p $(CGIDIR)/$(SCL_CGI)/MT/prog/chunker; cp prog/chunker/lwg.pl $(CGIDIR)/$(SCL_CGI)/MT/prog/chunker;
	mkdir -p $(CGIDIR)/$(SCL_CGI)/MT/prog/Discourse; cp prog/Discourse/*.pl $(CGIDIR)/$(SCL_CGI)/MT/prog/Discourse;cp prog/Discourse/discourse $(CGIDIR)/$(SCL_CGI)/MT/prog/Discourse; cp prog/Discourse/discourse.sh $(CGIDIR)/$(SCL_CGI)/MT/prog/Discourse
	mkdir -p $(CGIDIR)/$(SCL_CGI)/MT/prog/format; cp prog/format/gen_table.out $(CGIDIR)/$(SCL_CGI)/MT/prog/format
	cd prog/Heritage_morph_interface; make install
	cd prog/interface; make install
	cd prog/kAraka; make install
	mkdir -p $(CGIDIR)/$(SCL_CGI)/MT/prog/map; cp prog/map/add_dict_mng.pl $(CGIDIR)/$(SCL_CGI)/MT/prog/map; cp prog/map/lwg_avy_avy.pl $(CGIDIR)/$(SCL_CGI)/MT/prog/map; cp prog/map/causal_verb_handler.py $(CGIDIR)/$(SCL_CGI)/MT/prog/map
	cd prog/morph; make install
	mkdir -p $(CGIDIR)/$(SCL_CGI)/morph_bin; cp  ../morph_bin/* $(CGIDIR)/$(SCL_CGI)/morph_bin;
	mkdir -p $(CGIDIR)/$(SCL_CGI)/MT/prog/Normalisation; cp prog/Normalisation/lwg.out $(CGIDIR)/$(SCL_CGI)/MT/prog/Normalisation; cp prog/Normalisation/get_std_spelling.out $(CGIDIR)/$(SCL_CGI)/MT/prog/Normalisation; cp prog/Normalisation/*.pl $(CGIDIR)/$(SCL_CGI)/MT/prog/Normalisation;
	mkdir -p $(CGIDIR)/$(SCL_CGI)/MT/prog/prune; cp prog/prune/* $(CGIDIR)/$(SCL_CGI)/MT/prog/prune
	mkdir -p $(CGIDIR)/$(SCL_CGI)/MT/prog/reader_generator; cp prog/reader_generator/extract.pl $(CGIDIR)/$(SCL_CGI)/MT/prog/reader_generator; cp prog/reader_generator/csv2json.pl $(CGIDIR)/$(SCL_CGI)/MT/prog/reader_generator;
	cd prog/sandhi_splitter; make install
	mkdir -p $(CGIDIR)/$(SCL_CGI)/MT/prog/hn/sent_gen; cp prog/hn/sent_gen/*.pl $(CGIDIR)/$(SCL_CGI)/MT/prog/hn/sent_gen;
	mkdir -p $(CGIDIR)/$(SCL_CGI)/MT/prog/shell; cp prog/shell/anu_skt_hnd.sh $(CGIDIR)/$(SCL_CGI)/MT/prog/shell
	mkdir -p $(CGIDIR)/$(SCL_CGI)/MT/prog/translation; cp prog/translation/translate.sh $(CGIDIR)/$(SCL_CGI)/MT/prog/translation; cp prog/translation/translate.out $(CGIDIR)/$(SCL_CGI)/MT/prog/translation;
	mkdir -p $(CGIDIR)/$(SCL_CGI)/MT/prog/hn/word_gen/test; cp prog/hn/word_gen/test/new_gen.out $(CGIDIR)/$(SCL_CGI)/MT/prog/hn/word_gen/test;
	mkdir -p $(CGIDIR)/$(SCL_CGI)/MT/prog/Word_order; cp prog/Word_order/*.cgi $(CGIDIR)/$(SCL_CGI)/MT/prog/Word_order
	mkdir -p $(CGIDIR)/$(SCL_CGI)/MT/prog/wsd; cp prog/wsd/wsd_rules.sh $(CGIDIR)/$(SCL_CGI)/MT/prog/wsd; cp prog/wsd/*.pl $(CGIDIR)/$(SCL_CGI)/MT/prog/wsd; cp prog/wsd/wsd $(CGIDIR)/$(SCL_CGI)/MT/prog/wsd;


.PHONY: $(SUBDIRS)
test:
	mkdir test
	mv ../test_data/input.txt .
	../shell/anu_skt_hnd_batch.sh input.txt
	mv tmp_input/DEBUG output
	mv input_trnsltn.html output
	rm *
	diff -r output ../test_data/input

clean:
	cd prog/format; make clean
	cd prog/Normalisation; make clean
	cd prog/hn/word_gen/test; make clean
	cd prog/Heritage_morph_interface; make clean
	cd prog/translation; make clean
	cd prog/kAraka/Prepare_Graph/; make clean
	cd prog/wsd; make clean
