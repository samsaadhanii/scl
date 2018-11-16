SHELL = /bin/bash

include ../paths.sh

install:
	cp -r *.html $(HTDOCSDIR)/scl; cp -p *.js $(HTDOCSDIR)/scl; cp -pr ../css_files $(HTDOCSDIR)/scl; cp -pr ../js_files $(HTDOCSDIR)/scl; cp -pr ../imgs $(HTDOCSDIR)/scl; cp *.cgi $(CGIDIR)/scl

debian_install:
	mkdir -p /tmp/scl$(HTDOCSDIR)/scl
	cp -r *.html /tmp/scl$(HTDOCSDIR)/scl; cp -pr images /tmp/scl$(HTDOCSDIR)/scl; cp -p *.js /tmp/scl$(HTDOCSDIR)/scl; cp *.cgi /tmp/scl/$(CGIDIR)/scl
