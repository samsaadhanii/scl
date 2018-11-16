SHELL = /bin/sh

include ../paths.sh

install:
	mkdir -p $(HTDOCSDIR)/scl/amarakosha; mkdir -p $(CGIDIR)/scl/amarakosha; cp web_interface/*.html $(HTDOCSDIR)/scl/amarakosha; cp -r web_interface/FAQ $(HTDOCSDIR)/scl/amarakosha/; cp -r web_interface/*.cgi $(CGIDIR)/scl/amarakosha; cp web_interface/amarakosha_knowledge_structure.pdf $(HTDOCSDIR)/scl/amarakosha; cp web_interface/logouoh.png $(HTDOCSDIR)/scl/amarakosha; cp web_interface/about.html $(HTDOCSDIR)/scl/amarakosha; 
	mkdir -p $(TFPATH)/AMARA_DOT; chown $(APACHE_USER_GROUP) $(TFPATH)/AMARA_DOT; cd $(HTDOCSDIR)/scl/amarakosha; ln -sfn $(TFPATH)/AMARA_DOT DOT

debian_install:
	mkdir -p /tmp/scl/$(HTDOCSDIR)/scl/amarakosha; mkdir -p /tmp//scl$(CGIDIR)/scl/amarakosha; cp web_interface/*.html /tmp/scl/$(HTDOCSDIR)/scl/amarakosha; cp -r web_interface/js /tmp/scl/$(HTDOCSDIR)/scl/amarakosha;  cp -r web_interface/FAQ /tmp/scl/$(HTDOCSDIR)/scl/amarakosha/; cp -r web_interface/*.cgi /tmp/scl/$(CGIDIR)/scl/amarakosha; cp web_interface/amarakosha_knowledge_structure.pdf /tmp/scl/$(HTDOCSDIR)/scl/amarakosha; cp web_interface/logouoh.png /tmp/scl/$(HTDOCSDIR)/scl/amarakosha; cp web_interface/about.html /tmp/scl/$(HTDOCSDIR)/scl/amarakosha; cp web_interface/*.js /tmp/scl/$(HTDOCSDIR)/scl/amarakosha;
	mkdir -p $(TFPATH)/AMARA_DOT; chown $(APACHE_USER_GROUP) $(TFPATH)/AMARA_DOT; cd $(HTDOCSDIR)/scl/amarakosha; ln -sf $(TFPATH)/AMARA_DOT DOT
