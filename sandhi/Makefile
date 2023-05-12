SHELL = /bin/bash

include ../paths.sh

install:
	mkdir -p $(HTDOCSDIR)/$(SCL_HTDOCS)/sandhi;mkdir -p $(CGIDIR)/$(SCL_CGI)/sandhi;cp web_interface/*.html $(HTDOCSDIR)/$(SCL_HTDOCS)/sandhi; cp web_interface/*.cgi $(CGIDIR)/$(SCL_CGI)/sandhi;

debian_install:
	mkdir -p /tmp/$(HTDOCSDIR)/sandhi;mkdir -p /tmp/$(CGIDIR)/$(SCL_CGI)/sandhi;cp web_interface/*.html /tmp/$(HTDOCSDIR)/$(SCL_HTDOCS)/sandhi; cp web_interface/*.cgi /tmp/$(CGIDIR)/$(SCL_CGI)/sandhi; cp -p web_interface/*.js /tmp/$(CGIDIR)/$(SCL_CGI)/sandhi
