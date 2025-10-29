SHELL = /bin/bash

include ../paths.sh

install:
	mkdir -p $(HTDOCSDIR)/$(SCL_HTDOCS)/amarakosha; mkdir -p $(CGIDIR)/$(SCL_CGI)/amarakosha/DBM; cp *.pl $(CGIDIR)/$(SCL_CGI)/amarakosha; cp *.sh $(CGIDIR)/$(SCL_CGI)/amarakosha; cp DBM/rules_onto $(CGIDIR)/$(SCL_CGI)/amarakosha/DBM; cp DBM/all_kANdas $(CGIDIR)/$(SCL_CGI)/amarakosha/DBM; cp amara.wx $(CGIDIR)/$(SCL_CGI)/amarakosha; cd web_interface; sh install.sh html  $(HTDOCSDIR)/$(SCL_HTDOCS)/amarakosha; cp -r FAQ $(HTDOCSDIR)/$(SCL_HTDOCS)/amarakosha/; cp interface.cgi $(CGIDIR)/$(SCL_CGI)/amarakosha; chmod +x $(CGIDIR)/$(SCL_CGI)/amarakosha/interface.cgi; cp amarakosha_knowledge_structure.pdf $(HTDOCSDIR)/$(SCL_HTDOCS)/amarakosha; cp logouoh.png $(HTDOCSDIR)/$(SCL_HTDOCS)/amarakosha; cp *.jpg $(HTDOCSDIR)/$(SCL_HTDOCS)/amarakosha
