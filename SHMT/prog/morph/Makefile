SHELL = /bin/sh
include ../../../paths.sh

install:
	mkdir -p $(HTDOCSDIR)/scl/morph;mkdir -p $(CGIDIR)/scl/morph; cp web_interface/*.html $(HTDOCSDIR)/scl/morph; cp web_interface/*.cgi $(CGIDIR)/scl/morph; cp web_interface/*.css $(HTDOCSDIR)/scl/morph; cp -pr web_interface/images $(HTDOCSDIR)/scl/morph/; cp web_interface/*.js $(HTDOCSDIR)/scl/morph;
#	mkdir -p /tmp/DEMO; chown APACHE_USER_GROUP /tmp/DEMO;ln -sfn /tmp/DEMO DEMO
#	mkdir -p /tmp/DEMO/dot;

debian_install:
	mkdir -p /tmp/scl/$(HTDOCSDIR)/scl/morph;mkdir -p /tmp/scl/$(CGIDIR)/scl/morph; cp web_interface/*.html /tmp/scl/$(HTDOCSDIR)/scl/morph; cp web_interface/*.cgi /tmp/scl/$(CGIDIR)/scl/morph; cp web_interface/*.css /tmp/scl/$(HTDOCSDIR)/scl/morph; cp -pr web_interface/images /tmp/scl/$(HTDOCSDIR)/scl/morph/;
	mkdir -p /tmp/DEMO; chown $(APACHE_USER_GROUP) /tmp/DEMO;ln -sfn /tmp/DEMO DEMO
	mkdir -p /tmp/DEMO/dot;

.PHONY: all

clean:
	rm -f $(TARGETS)
