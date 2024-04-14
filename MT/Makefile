SHELL = /bin/sh

include ../paths.sh

SUBDIRS = prog/format prog/Normalisation prog/hn/word_gen/test prog/Heritage_morph_interface prog/translation prog/kAraka/Prepare_Graph prog/wsd

all: $(SUBDIRS)
test: test

$(SUBDIRS):
	$(MAKE) -C $@

install:
	mkdir -p $(HTDOCSDIR)/$(SCL_HTDOCS)/MT; mkdir -p $(CGIDIR)/$(SCL_CGI)/MT/prog/interface; cd web_interface; sh install.sh html $(HTDOCSDIR)/$(SCL_HTDOCS)/MT; sh install.sh js $(HTDOCSDIR)/$(SCL_HTDOCS)/MT; sh install.sh css $(HTDOCSDIR)/$(SCL_HTDOCS)/MT; cd ../; cp prog/interface/anu_help.html $(HTDOCSDIR)/$(SCL_HTDOCS)/MT/; cp prog/interface/about.html $(HTDOCSDIR)/$(SCL_HTDOCS)/MT/; cp web_interface/*.cgi $(CGIDIR)/$(SCL_CGI)/MT; cp web_interface/*.pl $(CGIDIR)/$(SCL_CGI)/MT; cp prog/interface/show_graph.cgi $(CGIDIR)/$(SCL_CGI)/MT/prog/interface; cp prog/interface/show_top_parses.cgi $(CGIDIR)/$(SCL_CGI)/MT/prog/interface; cp prog/interface/show_selected_parse.cgi $(CGIDIR)/$(SCL_CGI)/MT/prog/interface; cp prog/interface/call_parser_summary.cgi $(CGIDIR)/$(SCL_CGI)/MT/prog/interface; cp prog/interface/display_output.pl $(CGIDIR)/$(SCL_CGI)/MT/prog/interface; cp prog/interface/print_table_bottom_menu.pl $(CGIDIR)/$(SCL_CGI)/MT/prog/interface;
	mkdir -p $(HTDOCSDIR)/$(SCL_HTDOCS)/MT/prog/morph; mkdir -p $(CGIDIR)/$(SCL_CGI)/MT/prog/morph/local_analysis; mkdir -p $(CGIDIR)/$(SCL_CGI)/MT/prog/morph/bin; cp prog/morph/web_interface/*.html $(HTDOCSDIR)/$(SCL_HTDOCS)/MT/prog/morph; cp prog/morph/web_interface/*.cgi $(CGIDIR)/$(SCL_CGI)/MT/prog/morph; cp prog/morph/web_interface/*.css $(HTDOCSDIR)/$(SCL_HTDOCS)/MT/prog/morph; cp prog/morph/*.sh $(CGIDIR)/$(SCL_CGI)/MT/prog/morph; cp prog/morph/local_analysis/add_mo_local.pl $(CGIDIR)/$(SCL_CGI)/MT/prog/morph/local_analysis; cp prog/morph/local_analysis/*.txt $(CGIDIR)/$(SCL_CGI)/MT/prog/morph/local_analysis; cp prog/morph/bin/*.pl $(CGIDIR)/$(SCL_CGI)/MT/prog/morph/bin; cp prog/morph/web_interface/scripts.pl $(CGIDIR)/$(SCL_CGI)/MT/prog/morph/; cp prog/morph/rUDa_kqw.txt $(CGIDIR)/$(SCL_CGI)/MT/prog/morph/
	mkdir -p $(CGIDIR)/$(SCL_CGI)/morph_bin; cp  ../morph_bin/* $(CGIDIR)/$(SCL_CGI)/morph_bin;
	mkdir -p $(CGIDIR)/$(SCL_CGI)/MT/prog/Heritage_morph_interface; cp prog/Heritage_morph_interface/Heritage2anusaaraka_morph.sh $(CGIDIR)/$(SCL_CGI)/MT/prog/Heritage_morph_interface; cp prog/Heritage_morph_interface/Heritage_anusaaraka_morph.out $(CGIDIR)/$(SCL_CGI)/MT/prog/Heritage_morph_interface; cp prog/Heritage_morph_interface/*.pl $(CGIDIR)/$(SCL_CGI)/MT/prog/Heritage_morph_interface; cp prog/Heritage_morph_interface/*.txt $(CGIDIR)/$(SCL_CGI)/MT/prog/Heritage_morph_interface;
	mkdir -p $(CGIDIR)/$(SCL_CGI)/MT/prog/prune; cp prog/prune/* $(CGIDIR)/$(SCL_CGI)/MT/prog/prune
	mkdir -p $(CGIDIR)/$(SCL_CGI)/MT/prog/kAraka/Prepare_Graph/DATA/AkAfkRA; mkdir -p $(CGIDIR)/$(SCL_CGI)/MT/prog/kAraka/list_n; cp prog/kAraka/shabdabodha.sh $(CGIDIR)/$(SCL_CGI)/MT/prog/kAraka/; cp prog/kAraka/Prepare_Graph/build_graph $(CGIDIR)/$(SCL_CGI)/MT/prog/kAraka/Prepare_Graph; cp prog/kAraka/uniform_morph_anal.pl $(CGIDIR)/$(SCL_CGI)/MT/prog/kAraka/; cp prog/kAraka/kaaraka_sharing.pl $(CGIDIR)/$(SCL_CGI)/MT/prog/kAraka/; cp prog/kAraka/add_best_parse_output.pl $(CGIDIR)/$(SCL_CGI)/MT/prog/kAraka/; cp prog/kAraka/add_abhihita_info.pl $(CGIDIR)/$(SCL_CGI)/MT/prog/kAraka/; cp prog/kAraka/add_possible_relations.pl $(CGIDIR)/$(SCL_CGI)/MT/prog/kAraka/; cp prog/kAraka/handle_no_parse.pl $(CGIDIR)/$(SCL_CGI)/MT/prog/kAraka/; cp prog/kAraka/mk_summary.pl $(CGIDIR)/$(SCL_CGI)/MT/prog/kAraka/; cp prog/kAraka/draw_graph.pl $(CGIDIR)/$(SCL_CGI)/MT/prog/kAraka/; cp prog/kAraka/Prepare_Graph/DATA/AkAfkRA/relations.txt $(CGIDIR)/$(SCL_CGI)/MT/prog/kAraka/Prepare_Graph/DATA/AkAfkRA; cp prog/kAraka/list_n/kAraka_names_*.txt $(CGIDIR)/$(SCL_CGI)/MT/prog/kAraka/list_n/
	mkdir -p $(CGIDIR)/$(SCL_CGI)/MT/prog/anaphora; cp prog/anaphora/anaphora.pl $(CGIDIR)/$(SCL_CGI)/MT/prog/anaphora/;
	mkdir -p $(CGIDIR)/$(SCL_CGI)/MT/prog/wsd; cp prog/wsd/wsd_rules.sh $(CGIDIR)/$(SCL_CGI)/MT/prog/wsd; cp prog/wsd/*.pl $(CGIDIR)/$(SCL_CGI)/MT/prog/wsd; cp prog/wsd/wsd $(CGIDIR)/$(SCL_CGI)/MT/prog/wsd;
	mkdir -p $(CGIDIR)/$(SCL_CGI)/MT/prog/chunker; cp prog/chunker/lwg.pl $(CGIDIR)/$(SCL_CGI)/MT/prog/chunker;
	mkdir -p $(CGIDIR)/$(SCL_CGI)/MT/prog/interface; cp prog/interface/add_colorcode.pl $(CGIDIR)/$(SCL_CGI)/MT/prog/interface; cp prog/interface/modify_mo_*.pl $(CGIDIR)/$(SCL_CGI)/MT/prog/interface; cp prog/interface/get_anvaya_order_html.pl $(CGIDIR)/$(SCL_CGI)/MT/prog/interface; cp prog/interface/get_anvaya_shloka_translation.pl $(CGIDIR)/$(SCL_CGI)/MT/prog/interface; 
	mkdir -p $(CGIDIR)/$(SCL_CGI)/MT/prog/map; cp prog/map/add_dict_mng.pl $(CGIDIR)/$(SCL_CGI)/MT/prog/map; cp prog/map/lwg_avy_avy.pl $(CGIDIR)/$(SCL_CGI)/MT/prog/map; cp prog/map/causal_verb_handler.py $(CGIDIR)/$(SCL_CGI)/MT/prog/map
	mkdir -p $(CGIDIR)/$(SCL_CGI)/MT/prog/hn/sent_gen; cp prog/hn/sent_gen/agreement.pl $(CGIDIR)/$(SCL_CGI)/MT/prog/hn/sent_gen; cp prog/hn/sent_gen/*.pl $(CGIDIR)/$(SCL_CGI)/MT/prog/hn/sent_gen;
	mkdir -p $(CGIDIR)/$(SCL_CGI)/MT/prog/hn/word_gen/test; cp prog/hn/word_gen/test/new_gen.out $(CGIDIR)/$(SCL_CGI)/MT/prog/hn/word_gen/test;
	mkdir -p $(CGIDIR)/$(SCL_CGI)/MT/prog/translation; cp prog/translation/translate.sh $(CGIDIR)/$(SCL_CGI)/MT/prog/translation; cp prog/translation/translate.out $(CGIDIR)/$(SCL_CGI)/MT/prog/translation;
	mkdir -p $(CGIDIR)/$(SCL_CGI)/MT/prog/reader_generator; cp prog/reader_generator/extract.pl $(CGIDIR)/$(SCL_CGI)/MT/prog/reader_generator;
	mkdir -p $(HTDOCSDIR)/$(SCL_HTDOCS)/MT/prog/sandhi_splitter;mkdir -p $(CGIDIR)/$(SCL_CGI)/MT/prog/sandhi_splitter; cp prog/sandhi_splitter/web_interface/*.html $(HTDOCSDIR)/$(SCL_HTDOCS)/MT/prog/sandhi_splitter; cp prog/sandhi_splitter/web_interface/*.cgi $(CGIDIR)/$(SCL_CGI)/MT/prog/sandhi_splitter; cp prog/sandhi_splitter/copy_field.pl $(CGIDIR)/$(SCL_CGI)/MT/prog/sandhi_splitter
	mkdir -p $(CGIDIR)/$(SCL_CGI)/MT/prog/anvaya; cp prog/anvaya/reorder.py $(CGIDIR)/$(SCL_CGI)/MT/prog/anvaya; cp prog/anvaya/*.py $(CGIDIR)/$(SCL_CGI)/MT/prog/anvaya; cp -r prog/anvaya/anytree $(CGIDIR)/$(SCL_CGI)/MT/prog/anvaya; cp prog/anvaya/rel_probs.csv $(CGIDIR)/$(SCL_CGI)/MT/prog/anvaya;
	mkdir -p $(CGIDIR)/$(SCL_CGI)/MT/prog/Word_order; cp prog/Word_order/*.cgi $(CGIDIR)/$(SCL_CGI)/MT/prog/Word_order
	mkdir -p $(CGIDIR)/$(SCL_CGI)/MT/prog/Normalisation; cp prog/Normalisation/lwg.out $(CGIDIR)/$(SCL_CGI)/MT/prog/Normalisation; cp prog/Normalisation/get_std_spelling.out $(CGIDIR)/$(SCL_CGI)/MT/prog/Normalisation; cp prog/Normalisation/*.pl $(CGIDIR)/$(SCL_CGI)/MT/prog/Normalisation;
	mkdir -p $(CGIDIR)/$(SCL_CGI)/MT/prog/format; cp prog/format/gen_table.out $(CGIDIR)/$(SCL_CGI)/MT/prog/format
	mkdir -p $(CGIDIR)/$(SCL_CGI)/MT/prog/Discourse; cp prog/Discourse/discourse_analysis.pl $(CGIDIR)/$(SCL_CGI)/MT/prog/Discourse
	mkdir -p $(CGIDIR)/$(SCL_CGI)/MT/prog/shell; cp prog/shell/anu_skt_hnd.sh $(CGIDIR)/$(SCL_CGI)/MT/prog/shell
	mkdir -p $(CGIDIR)/$(SCL_CGI)/MT/data/hi; cp data/hi/*.txt $(CGIDIR)/$(SCL_CGI)/MT/data/hi
	mkdir -p $(TFPATH); chown $(APACHE_USER_GROUP) $(TFPATH); cd $(HTDOCSDIR)/$(SCL_HTDOCS)/MT; ln -sfn $(TFPATH) DEMO
	mkdir -p $(HTDOCSDIR)/$(SCL_HTDOCS)/MT/data/en/MW; mkdir -p $(HTDOCSDIR)/$(SCL_HTDOCS)/MT/data/hi/Apte_dict; mkdir -p $(HTDOCSDIR)/$(SCL_HTDOCS)/MT/data/de/ccs; mkdir -p $(HTDOCSDIR)/$(SCL_HTDOCS)/MT/data/fr/Heritage; cd data/en/MW/; sh install.sh $(HTDOCSDIR)/$(SCL_HTDOCS)/MT/data/en/MW; cd ../../../; cp -pr data/hi/Apte_dict/*.xml $(HTDOCSDIR)/$(SCL_HTDOCS)/MT/data/hi/Apte_dict; cd data/fr/Heritage; sh install.sh $(HTDOCSDIR)/$(SCL_HTDOCS)/MT/data/fr/Heritage; cd ../../de/ccs; sh install.sh $(HTDOCSDIR)/$(SCL_HTDOCS)/MT/data/de/ccs

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
