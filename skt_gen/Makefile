SHELL = /bin/bash

include ../paths.sh

install:
	mkdir -p $(HTDOCSDIR)/$(SCL_HTDOCS)/skt_gen/noun;mkdir -p $(CGIDIR)/$(SCL_CGI)/skt_gen/noun; cp noun/web_interface/*.html $(HTDOCSDIR)/$(SCL_HTDOCS)/skt_gen/noun; cp noun/web_interface/*.cgi $(CGIDIR)/$(SCL_CGI)/skt_gen/noun; cp noun/web_interface/*.pl  $(CGIDIR)/$(SCL_CGI)/skt_gen/noun/;
	mkdir -p $(HTDOCSDIR)/$(SCL_HTDOCS)/skt_gen/verb; mkdir -p $(CGIDIR)/$(SCL_CGI)/skt_gen/verb; cp verb/web_interface/*.html $(HTDOCSDIR)/$(SCL_HTDOCS)/skt_gen/verb; cp verb/web_interface/*.pl $(CGIDIR)/$(SCL_CGI)/skt_gen/verb; cp  verb/web_interface/*.cgi $(CGIDIR)/$(SCL_CGI)/skt_gen/verb/
	mkdir -p $(HTDOCSDIR)/$(SCL_HTDOCS)/skt_gen/kqw; mkdir -p $(CGIDIR)/$(SCL_CGI)/skt_gen/kqw; cp kqw/web_interface/*.html $(HTDOCSDIR)/$(SCL_HTDOCS)/skt_gen/kqw; cp kqw/web_interface/*.cgi $(CGIDIR)/$(SCL_CGI)/skt_gen/kqw; cp kqw/web_interface/*.pl $(CGIDIR)/$(SCL_CGI)/skt_gen/kqw
	mkdir -p $(HTDOCSDIR)/$(SCL_HTDOCS)/skt_gen/waxXiwa; mkdir -p $(CGIDIR)/$(SCL_CGI)/skt_gen/waxXiwa; cp waxXiwa/web_interface/*.html $(HTDOCSDIR)/$(SCL_HTDOCS)/skt_gen/waxXiwa; cp waxXiwa/web_interface/*.cgi $(CGIDIR)/$(SCL_CGI)/skt_gen/waxXiwa
	mkdir -p $(HTDOCSDIR)/$(SCL_HTDOCS)/skt_gen/Sentence; mkdir -p $(CGIDIR)/$(SCL_CGI)/skt_gen/Sentence; cp Sentence/web_interface/index.html $(HTDOCSDIR)/$(SCL_HTDOCS)/skt_gen/Sentence; cp Sentence/web_interface/*.cgi $(CGIDIR)/$(SCL_CGI)/skt_gen/Sentence; cp -r Sentence/web_interface/bootstrap $(HTDOCSDIR)/$(SCL_HTDOCS)/skt_gen/Sentence
	mkdir -p $(HTDOCSDIR)/$(SCL_HTDOCS)/skt_gen/compounds/; mkdir -p $(CGIDIR)/$(SCL_CGI)/skt_gen/compounds; cd compounds/web_interface/js; sh install.sh js $(HTDOCSDIR)/$(SCL_HTDOCS)/skt_gen/compounds; cd ../../../; cp -r compounds/web_interface/css $(HTDOCSDIR)/$(SCL_HTDOCS)/skt_gen/compounds; cp compounds/web_interface/Samasa_Flowchart.jpg $(HTDOCSDIR)/$(SCL_HTDOCS)/skt_gen/compounds/; cp compounds/web_interface/*.cgi $(CGIDIR)/$(SCL_CGI)/skt_gen/compounds; cd compounds/web_interface; sh install.sh html $(HTDOCSDIR)/$(SCL_HTDOCS)/skt_gen/compounds
