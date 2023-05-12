SHELL = /bin/bash

include ../paths.sh

install:
	cp *.js $(HTDOCSDIR)/$(SCL_HTDOCS); cp -r ../css_files $(HTDOCSDIR)/$(SCL_HTDOCS); cp *.cgi $(CGIDIR)/$(SCL_CGI); cp -r ../imgs $(HTDOCSDIR)/$(SCL_HTDOCS); cp *.html $(HTDOCSDIR)/$(SCL_HTDOCS); perl add_url_install.pl < index.html > $(HTDOCSDIR)/$(SCL_HTDOCS)/index.html; perl add_url_install.pl < index_server.html > $(HTDOCSDIR)/$(SCL_HTDOCS)/index_server.html; cp -r ../js_files $(HTDOCSDIR)/$(SCL_HTDOCS); cd ../js_files; perl add_url_install.pl < callcgiscripts.js > $(HTDOCSDIR)/$(SCL_HTDOCS)/js_files/callcgiscripts.js; perl add_url_install.pl < transliteration.js > $(HTDOCSDIR)/$(SCL_HTDOCS)/js_files/transliteration.js; perl add_url_install.pl < verb_gen.js > $(HTDOCSDIR)/$(SCL_HTDOCS)/js_files/verb_gen.js;

