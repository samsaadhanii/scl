SHELL = /bin/sh

include ../paths.sh

install:
	mkdir -p $(HTDOCSDIR)/$(SCL_HTDOCS)/amarakosha; mkdir -p $(CGIDIR)/$(SCL_CGI)/amarakosha; cd web_interface; sh install.sh html  $(HTDOCSDIR)/$(SCL_HTDOCS)/amarakosha; cp -r FAQ $(HTDOCSDIR)/$(SCL_HTDOCS)/amarakosha/; perl add_url_install.pl < interface.cgi > $(CGIDIR)/$(SCL_CGI)/amarakosha/interface.cgi; chmod +x $(CGIDIR)/$(SCL_CGI)/amarakosha/interface.cgi; cp amarakosha_knowledge_structure.pdf $(HTDOCSDIR)/$(SCL_HTDOCS)/amarakosha; cp logouoh.png $(HTDOCSDIR)/$(SCL_HTDOCS)/amarakosha;
