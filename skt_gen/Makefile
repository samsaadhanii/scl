SHELL = /bin/bash

include ../paths.sh

install:
	mkdir -p $(HTDOCSDIR)/$(SCL_HTDOCS)/skt_gen/noun;mkdir -p $(CGIDIR)/$(SCL_CGI)/skt_gen/noun; cp noun/web_interface/*.html $(HTDOCSDIR)/$(SCL_HTDOCS)/skt_gen/noun; cp noun/web_interface/*.cgi $(CGIDIR)/$(SCL_CGI)/skt_gen/noun; cp noun/web_interface/*.pl  $(CGIDIR)/$(SCL_CGI)/skt_gen/noun/;
	mkdir -p $(HTDOCSDIR)/$(SCL_HTDOCS)/skt_gen/verb; mkdir -p $(CGIDIR)/$(SCL_CGI)/skt_gen/verb; cp verb/web_interface/*.html $(HTDOCSDIR)/$(SCL_HTDOCS)/skt_gen/verb; cp verb/web_interface/*.pl $(CGIDIR)/$(SCL_CGI)/skt_gen/verb; cp  verb/web_interface/*.cgi $(CGIDIR)/$(SCL_CGI)/skt_gen/verb/
	mkdir -p $(HTDOCSDIR)/$(SCL_HTDOCS)/skt_gen/kqw; mkdir -p $(CGIDIR)/$(SCL_CGI)/skt_gen/kqw; cp kqw/web_interface/*.html $(HTDOCSDIR)/$(SCL_HTDOCS)/skt_gen/kqw; cp kqw/web_interface/*.cgi $(CGIDIR)/$(SCL_CGI)/skt_gen/kqw; cp kqw/web_interface/*.pl $(CGIDIR)/$(SCL_CGI)/skt_gen/kqw
	mkdir -p $(HTDOCSDIR)/$(SCL_HTDOCS)/skt_gen/waxXiwa; mkdir -p $(CGIDIR)/$(SCL_CGI)/skt_gen/waxXiwa; cp waxXiwa/web_interface/*.html $(HTDOCSDIR)/$(SCL_HTDOCS)/skt_gen/waxXiwa; cp waxXiwa/web_interface/*.cgi $(CGIDIR)/$(SCL_CGI)/skt_gen/waxXiwa
	cd Sentence; make install
	cd compounds; make install
