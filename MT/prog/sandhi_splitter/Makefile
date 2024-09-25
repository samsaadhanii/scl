SHELL = /bin/bash

include ../../../paths.sh

install:
	mkdir -p $(HTDOCSDIR)/$(SCL_HTDOCS)/MT/prog/sandhi_splitter;
	mkdir -p $(CGIDIR)/$(SCL_CGI)/MT/prog/sandhi_splitter
	cp web_interface/*.html $(HTDOCSDIR)/$(SCL_HTDOCS)/MT/prog/sandhi_splitter
	cp web_interface/*.cgi $(CGIDIR)/$(SCL_CGI)/MT/prog/sandhi_splitter
	cp copy_field.pl $(CGIDIR)/$(SCL_CGI)/MT/prog/sandhi_splitter
clean: 
	rm -f $(TARGETS)

