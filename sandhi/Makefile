SHELL = /bin/bash

include ../paths.sh

install:
	mkdir -p $(HTDOCSDIR)/scl/sandhi;mkdir -p $(CGIDIR)/scl/sandhi;cp web_interface/*.html $(HTDOCSDIR)/scl/sandhi; cp web_interface/*.cgi $(CGIDIR)/scl/sandhi; cp web_interface/*.js $(HTDOCSDIR)/scl/sandhi; cp web_interface/info.html $(HTDOCSDIR)/scl/sandhi

debian_install:
	mkdir -p /tmp/scl$(HTDOCSDIR)/scl/sandhi;mkdir -p /tmp/scl$(CGIDIR)/scl/sandhi;cp web_interface/*.html /tmp/scl$(HTDOCSDIR)/scl/sandhi; cp web_interface/*.cgi /tmp/scl$(CGIDIR)/scl/sandhi; cp -p web_interface/*.js /tmp/scl$(CGIDIR)/scl/sandhi
