SHELL = /bin/sh

include ../paths.sh

install:
	mkdir -p $(HTDOCSDIR)/scl/amarakosha; mkdir -p $(CGIDIR)/scl/amarakosha; cd web_interface; sh install.sh html  $(HTDOCSDIR)/scl/amarakosha; cp -r FAQ $(HTDOCSDIR)/scl/amarakosha/; perl add_url_install.pl < interface.cgi > $(CGIDIR)/scl/amarakosha/interface.cgi; cp amarakosha_knowledge_structure.pdf $(HTDOCSDIR)/scl/amarakosha; cp logouoh.png $(HTDOCSDIR)/scl/amarakosha;
