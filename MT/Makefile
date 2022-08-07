SHELL = /bin/sh

include ../paths.sh

SUBDIRS = prog/format prog/Normalisation prog/hn/word_gen/test prog/sandhi_splitter prog/Heritage_morph_interface prog/translation prog/kAraka/Prepare_Graph prog/wsd

all: $(SUBDIRS)
test: test

$(SUBDIRS):
	$(MAKE) -C $@

install:
	mkdir -p $(HTDOCSDIR)/scl/MT; mkdir -p $(CGIDIR)/scl/MT/prog/interface; cp web_interface/*.html $(HTDOCSDIR)/scl/MT; cp web_interface/*.js $(HTDOCSDIR)/scl/MT; cp web_interface/*.css $(HTDOCSDIR)/scl/MT; cp prog/interface/anu_help.html $(HTDOCSDIR)/scl/MT/; cp prog/interface/about.html $(HTDOCSDIR)/scl/MT/; cp web_interface/*.cgi $(CGIDIR)/scl/MT; cp web_interface/*.pl $(CGIDIR)/scl/MT; cp prog/interface/show_graph.cgi $(CGIDIR)/scl/MT/prog/interface; cp prog/interface/show_top_parses.cgi $(CGIDIR)/scl/MT/prog/interface; cp prog/interface/show_selected_parse.cgi $(CGIDIR)/scl/MT/prog/interface; cp prog/interface/call_parser_summary.cgi $(CGIDIR)/scl/MT/prog/interface
	mkdir -p $(HTDOCSDIR)/scl/morph;mkdir -p $(CGIDIR)/scl/morph; cp prog/morph/web_interface/*.html $(HTDOCSDIR)/scl/morph; cp prog/morph/web_interface/*.cgi $(CGIDIR)/scl/morph; cp prog/morph/web_interface/*.css $(HTDOCSDIR)/scl/morph
	mkdir -p $(HTDOCSDIR)/scl/sandhi_splitter;mkdir -p $(CGIDIR)/scl/sandhi_splitter; cp prog/sandhi_splitter/web_interface/*.html $(HTDOCSDIR)/scl/sandhi_splitter; cp prog/sandhi_splitter/web_interface/*.cgi $(CGIDIR)/scl/sandhi_splitter;
	mkdir -p $(CGIDIR)/scl/MT/prog/Word_order; cp prog/Word_order/*.cgi $(CGIDIR)/scl/MT/prog/Word_order
	mkdir -p $(TFPATH); chown $(APACHE_USER_GROUP) $(TFPATH); cd $(HTDOCSDIR)/scl/MT; ln -sfn $(TFPATH) DEMO

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
	cd prog/sandhi_splitter; make clean
	cd prog/Heritage_morph_interface; make clean
	cd prog/translation; make clean
	cd prog/kAraka/Prepare_Graph/; make clean
	cd prog/wsd; make clean
