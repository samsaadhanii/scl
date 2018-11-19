SHELL = /bin/sh
include ../../../paths.sh

install:
	mkdir -p $(HTDOCSDIR)/scl/morph;mkdir -p $(CGIDIR)/scl/morph; cp web_interface/*.html $(HTDOCSDIR)/scl/morph; cp web_interface/*.cgi $(CGIDIR)/scl/morph; cp web_interface/*.css $(HTDOCSDIR)/scl/morph; cp -r web_interface/images $(HTDOCSDIR)/scl/morph/; cp web_interface/*.js $(HTDOCSDIR)/scl/morph;
#	mkdir -p /tmp/DEMO; chown APACHE_USER_GROUP /tmp/DEMO;ln -sfn /tmp/DEMO DEMO
#	mkdir -p /tmp/DEMO/dot;

.PHONY: all

clean:
	rm -f $(TARGETS)
