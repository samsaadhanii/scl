SHELL = /bin/sh

include ../paths.sh

SUBDIRS = prog/format prog/Normalisation prog/hnd_gen/test prog/sandhi_splitter prog/Heritage_morph_interface prog/translation prog/kAraka/Prepare_Graph prog/wsd

all: $(SUBDIRS)
test: test

$(SUBDIRS):
	$(MAKE) -C $@

install:
	mkdir -p $(HTDOCSDIR)/scl/SHMT; mkdir -p $(CGIDIR)/scl/SHMT/prog/interface; cp web_interface/*.html $(HTDOCSDIR)/scl/SHMT; cp web_interface/*.js $(HTDOCSDIR)/scl/SHMT; cp web_interface/*.css $(HTDOCSDIR)/scl/SHMT; cp prog/interface/anu_help.html $(HTDOCSDIR)/scl/SHMT/; cp prog/interface/about.html $(HTDOCSDIR)/scl/SHMT/; cp web_interface/*.cgi $(CGIDIR)/scl/SHMT; cp prog/interface/show_graph.cgi $(CGIDIR)/scl/SHMT/prog/interface; cp prog/interface/show_top_parses.cgi $(CGIDIR)/scl/SHMT/prog/interface; cp prog/interface/show_selected_parse.cgi $(CGIDIR)/scl/SHMT/prog/interface; cp prog/interface/call_parser_summary.cgi $(CGIDIR)/scl/SHMT/prog/interface
	mkdir -p $(HTDOCSDIR)/scl/morph;mkdir -p $(CGIDIR)/scl/morph; cp prog/morph/web_interface/*.html $(HTDOCSDIR)/scl/morph; cp prog/morph/web_interface/*.cgi $(CGIDIR)/scl/morph; cp prog/morph/web_interface/*.css $(HTDOCSDIR)/scl/morph
	mkdir -p $(HTDOCSDIR)/scl/sandhi_splitter;mkdir -p $(CGIDIR)/scl/sandhi_splitter; cp prog/sandhi_splitter/web_interface/*.html $(HTDOCSDIR)/scl/sandhi_splitter; cp prog/sandhi_splitter/web_interface/*.cgi $(CGIDIR)/scl/sandhi_splitter;
	mkdir -p $(CGIDIR)/scl/SHMT/prog/Word_order; cp prog/Word_order/*.cgi $(CGIDIR)/scl/SHMT/prog/Word_order
	mkdir -p $(TFPATH); chown $(APACHE_USER_GROUP) $(TFPATH); cd $(HTDOCSDIR)/scl/SHMT; ln -sfn $(TFPATH) DEMO
	mkdir -p $(TFPATH)/dot; chown $(APACHE_USER_GROUP) $(TFPATH)/dot

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
	cd prog/hnd_gen/test; make clean
	cd prog/sandhi_splitter; make clean
	cd prog/Heritage_morph_interface; make clean
	cd prog/translation; make clean
	cd prog/kAraka/Prepare_Graph/; make clean
	cd prog/wsd; make clean
