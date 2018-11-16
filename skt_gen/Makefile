SHELL = /bin/bash

include ../paths.sh

install:
	mkdir -p $(HTDOCSDIR)/scl/skt_gen/noun;mkdir -p $(CGIDIR)/scl/skt_gen/noun;cp noun/web_interface/*.html $(HTDOCSDIR)/scl/skt_gen/noun; cp noun/web_interface/*.cgi $(CGIDIR)/scl/skt_gen/noun
	mkdir -p $(HTDOCSDIR)/scl/skt_gen/verb; mkdir -p $(CGIDIR)/scl/skt_gen/verb; cp verb/web_interface/*.html $(HTDOCSDIR)/scl/skt_gen/verb; cp verb/web_interface/*.cgi $(CGIDIR)/scl/skt_gen/verb
	mkdir -p $(HTDOCSDIR)/scl/skt_gen/kqw; mkdir -p $(CGIDIR)/scl/skt_gen/kqw; cp kqw/web_interface/*.html $(HTDOCSDIR)/scl/skt_gen/kqw; cp kqw/web_interface/*.cgi $(CGIDIR)/scl/skt_gen/kqw
	mkdir -p $(HTDOCSDIR)/scl/skt_gen/waxXiwa; mkdir -p $(CGIDIR)/scl/skt_gen/waxXiwa; cp waxXiwa/web_interface/*.html $(HTDOCSDIR)/scl/skt_gen/waxXiwa; cp waxXiwa/web_interface/*.cgi $(CGIDIR)/scl/skt_gen/waxXiwa
	mkdir -p $(HTDOCSDIR)/scl/skt_gen/Sentence; mkdir -p $(CGIDIR)/scl/skt_gen/Sentence; cp Sentence/web_interface/index.html $(HTDOCSDIR)/scl/skt_gen/Sentence; cp Sentence/web_interface/*.cgi $(CGIDIR)/scl/skt_gen/Sentence; cp -r Sentence/web_interface/bootstrap $(HTDOCSDIR)/scl/skt_gen/Sentence
	mkdir -p $(HTDOCSDIR)/scl/skt_gen/compounds/; mkdir -p $(CGIDIR)/scl/skt_gen/compounds; cp compounds/web_interface/*.html $(HTDOCSDIR)/scl/skt_gen/compounds; cp -r compounds/web_interface/js $(HTDOCSDIR)/scl/skt_gen/compounds; cp -r compounds/web_interface/css $(HTDOCSDIR)/scl/skt_gen/compounds; cp compounds/web_interface/*.cgi $(CGIDIR)/scl/skt_gen/compounds; cp compounds/web_interface/Samasa_Flowchart.jpg $(HTDOCSDIR)/scl/skt_gen/compounds/

debian_install:
	mkdir -p /tmp/scl/$(HTDOCSDIR)/scl/skt_gen/noun;mkdir -p /tmp/scl/$(CGIDIR)/scl/skt_gen/noun;cp noun/web_interface/*.html /tmp/scl/$(HTDOCSDIR)/scl/skt_gen/noun; cp noun/web_interface/*.cgi /tmp/scl/$(CGIDIR)/scl/skt_gen/noun; cp noun/web_interface/*.js /tmp/scl/$(HTDOCSDIR)/scl/skt_gen/noun
	mkdir -p /tmp/scl/$(HTDOCSDIR)/scl/skt_gen/verb; mkdir -p /tmp/scl/$(CGIDIR)/scl/skt_gen/verb; cp verb/web_interface/*.html /tmp/scl/$(HTDOCSDIR)/scl/skt_gen/verb; cp verb/web_interface/*.cgi /tmp/scl/$(CGIDIR)/scl/skt_gen/verb; cp verb/web_interface/*.js /tmp/scl/$(HTDOCSDIR)/scl/skt_gen/verb
	mkdir -p /tmp/scl/$(HTDOCSDIR)/scl/skt_gen/kqw; mkdir -p /tmp/scl/$(CGIDIR)/scl/skt_gen/kqw; cp kqw/web_interface/*.html /tmp/scl/$(HTDOCSDIR)/scl/skt_gen/kqw; cp kqw/web_interface/*.cgi /tmp/scl/$(CGIDIR)/scl/skt_gen/kqw; cp kqw/web_interface/*.js /tmp/scl/$(HTDOCSDIR)/scl/skt_gen/kqw
	mkdir -p /tmp/scl/$(HTDOCSDIR)/scl/skt_gen/waxXiwa; mkdir -p /tmp/scl/$(CGIDIR)/scl/skt_gen/waxXiwa; cp waxXiwa/web_interface/*.html /tmp/scl/$(HTDOCSDIR)/scl/skt_gen/waxXiwa; cp waxXiwa/web_interface/*.cgi /tmp/scl/$(CGIDIR)/scl/skt_gen/waxXiwa; cp waxXiwa/web_interface/*.js /tmp/scl/$(HTDOCSDIR)/scl/skt_gen/waxXiwa
	cp htdocs/generators*.html /tmp/scl/$(HTDOCSDIR)/scl/skt_gen/
	cp htdocs/*.css /tmp/scl/$(HTDOCSDIR)/scl/skt_gen/
	cp htdocs/*.js /tmp/scl/$(HTDOCSDIR)/scl/skt_gen/
	cp htdocs/gen.html /tmp/scl/$(HTDOCSDIR)/scl/skt_gen/
	cp htdocs/table.html /tmp/scl/$(HTDOCSDIR)/scl/skt_gen/
