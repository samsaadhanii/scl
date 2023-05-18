SHELL = /bin/sh

include ../paths.sh

SUBDIRS = prog/format prog/Normalisation prog/hn/word_gen/test prog/Heritage_morph_interface prog/translation prog/kAraka/Prepare_Graph prog/wsd

all: $(SUBDIRS)
test: test

$(SUBDIRS):
	$(MAKE) -C $@

install:
	mkdir -p $(HTDOCSDIR)/$(SCL_HTDOCS)/MT; mkdir -p $(CGIDIR)/$(SCL_CGI)/MT/prog/interface; cd web_interface; sh install.sh html $(HTDOCSDIR)/$(SCL_HTDOCS)/MT; sh install.sh js $(HTDOCSDIR)/$(SCL_HTDOCS)/MT; sh install.sh css $(HTDOCSDIR)/$(SCL_HTDOCS)/MT; cd ../; cp prog/interface/anu_help.html $(HTDOCSDIR)/$(SCL_HTDOCS)/MT/; cp prog/interface/about.html $(HTDOCSDIR)/$(SCL_HTDOCS)/MT/; cp web_interface/*.cgi $(CGIDIR)/$(SCL_CGI)/MT; cp web_interface/*.pl $(CGIDIR)/$(SCL_CGI)/MT; cp prog/interface/show_graph.cgi $(CGIDIR)/$(SCL_CGI)/MT/prog/interface; cp prog/interface/show_top_parses.cgi $(CGIDIR)/$(SCL_CGI)/MT/prog/interface; cp prog/interface/show_selected_parse.cgi $(CGIDIR)/$(SCL_CGI)/MT/prog/interface; cp prog/interface/call_parser_summary.cgi $(CGIDIR)/$(SCL_CGI)/MT/prog/interface
	mkdir -p $(HTDOCSDIR)/$(SCL_HTDOCS)/morph;mkdir -p $(CGIDIR)/$(SCL_CGI)/morph; cp prog/morph/web_interface/*.html $(HTDOCSDIR)/$(SCL_HTDOCS)/morph; cp prog/morph/web_interface/*.cgi $(CGIDIR)/$(SCL_CGI)/morph; cp prog/morph/web_interface/*.css $(HTDOCSDIR)/$(SCL_HTDOCS)/morph
	mkdir -p $(HTDOCSDIR)/$(SCL_HTDOCS)/sandhi_splitter;mkdir -p $(CGIDIR)/$(SCL_CGI)/sandhi_splitter; cp prog/sandhi_splitter/web_interface/*.html $(HTDOCSDIR)/$(SCL_HTDOCS)/sandhi_splitter; cp prog/sandhi_splitter/web_interface/*.cgi $(CGIDIR)/$(SCL_CGI)/sandhi_splitter;
	mkdir -p $(CGIDIR)/$(SCL_CGI)/MT/prog/Word_order; cp prog/Word_order/*.cgi $(CGIDIR)/$(SCL_CGI)/MT/prog/Word_order
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
