SHELL = /bin/sh
include ../../../paths.sh

install:
	mkdir -p $(HTDOCSDIR)/$(SCL_HTDOCS)/morph;mkdir -p $(CGIDIR)/$(SCL_CGI)/morph; cp web_interface/*.html $(HTDOCSDIR)/$(SCL_HTDOCS)/morph; cp web_interface/*.cgi $(CGIDIR)/$(SCL_CGI)/morph; cp web_interface/*.css $(HTDOCSDIR)/$(SCL_HTDOCS)/morph; cp -r web_interface/images $(HTDOCSDIR)/$(SCL_HTDOCS)/morph/; cp web_interface/*.js $(HTDOCSDIR)/$(SCL_HTDOCS)/morph;
#	mkdir -p /tmp/DEMO; chown APACHE_USER_GROUP /tmp/DEMO;ln -sfn /tmp/DEMO DEMO
#	mkdir -p /tmp/DEMO/dot;

.PHONY: all

clean:
	rm -f $(TARGETS)
