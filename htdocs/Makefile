SHELL = /bin/bash

include ../paths.sh

install:
	cp *.js $(HTDOCSDIR)/scl; cp -r ../css_files $(HTDOCSDIR)/scl; cp *.cgi $(CGIDIR)/scl; cp -r ../imgs $(HTDOCSDIR)/scl; cp *.html $(HTDOCSDIR)/scl; perl add_url_install.pl < index.html > $(HTDOCSDIR)/scl/index.html; perl add_url_install.pl < index_server.html > $(HTDOCSDIR)/scl/index_server.html; cp -r ../js_files $(HTDOCSDIR)/scl; cd ../js_files; perl add_url_install.pl < callcgiscripts.js > $(HTDOCSDIR)/scl/js_files/callcgiscripts.js; perl add_url_install.pl < transliteration.js > $(HTDOCSDIR)/scl/js_files/transliteration.js; perl add_url_install.pl < verb_gen.js > $(HTDOCSDIR)/scl/js_files/verb_gen.js;

