SHELL = /bin/sh
include ../../../paths.sh

install:
	mkdir -p $(HTDOCSDIR)/$GlblVar::SCL_HTDOCS/morph;mkdir -p $(CGIDIR)/$GlblVar::SCL_CGI/morph; cp web_interface/*.html $(HTDOCSDIR)/$GlblVar::SCL_HTDOCS/morph; cp web_interface/*.cgi $(CGIDIR)/$GlblVar::SCL_CGI/morph; cp web_interface/*.css $(HTDOCSDIR)/$GlblVar::SCL_HTDOCS/morph; cp -r web_interface/images $(HTDOCSDIR)/$GlblVar::SCL_HTDOCS/morph/; cp web_interface/*.js $(HTDOCSDIR)/$GlblVar::SCL_HTDOCS/morph;
#	mkdir -p /tmp/DEMO; chown APACHE_USER_GROUP /tmp/DEMO;ln -sfn /tmp/DEMO DEMO
#	mkdir -p /tmp/DEMO/dot;

.PHONY: all

clean:
	rm -f $(TARGETS)
