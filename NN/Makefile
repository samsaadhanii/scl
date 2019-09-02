SHELL = /bin/sh

include ../paths.sh
SUBDIRS = CG parser Type_identifier

.PHONY: $(SUBDIRS)

all: $(SUBDIRS)

$(SUBDIRS):
	$(MAKE) -C $@

install:
	mkdir -p $(HTDOCSDIR)/scl/NN/CG; mkdir -p $(CGIDIR)/scl/NN/CG; mkdir -p $(TFPATH)/NN/CG; chown $(APACHE_USER_GROUP) $(TFPATH)/NN; chown $(APACHE_USER_GROUP) $(TFPATH)/NN/CG; cp CG/web_interface/*.html $(HTDOCSDIR)/scl/NN/CG; cp CG/web_interface/*.cgi $(CGIDIR)/scl/NN/CG; 
	mkdir -p $(CGIDIR)/scl/NN/parser; mkdir -p $(HTDOCSDIR)/scl/NN/parser; mkdir -p $(TFPATH)/NN/parser; chown $(APACHE_USER_GROUP) $(TFPATH)/NN/parser; cp parser/web_interface/*.html $(HTDOCSDIR)/scl/NN/parser; cp parser/web_interface/*.cgi $(CGIDIR)/scl/NN/parser;
	mkdir -p $(CGIDIR)/scl/NN/segmenter; mkdir -p $(HTDOCSDIR)/scl/NN/segmenter; mkdir -p $(TFPATH)/NN/segmenter;  chown $(APACHE_USER_GROUP) $(TFPATH)/NN/segmenter; cp segmenter/web_interface/*.html $(HTDOCSDIR)/scl/NN/segmenter; cp segmenter/web_interface/*.cgi $(CGIDIR)/scl/NN/segmenter;
	mkdir -p $(CGIDIR)/scl/NN/Type_identifier; mkdir -p $(HTDOCSDIR)/scl/NN/Type_identifier; mkdir -p $(TFPATH)/NN/Type_identifier;  chown $(APACHE_USER_GROUP) $(TFPATH)/NN/Type_identifier; cp Type_identifier/web_interface/*.html $(HTDOCSDIR)/scl/NN/Type_identifier; cp Type_identifier/web_interface/*.cgi $(CGIDIR)/scl/NN/Type_identifier;
	cd $(HTDOCSDIR)/scl/NN/CG; ln -sf $(TFPATH)/NN/CG DOT
	cd $(HTDOCSDIR)/scl/NN/parser; ln -sf $(TFPATH)/NN/parser DOT
	cd $(HTDOCSDIR)/scl/NN/Type_identifier; ln -sf $(TFPATH)/NN/Type_identifier DOT
	cp -r css_files $(HTDOCSDIR)/scl/NN
	cp -r js_files $(HTDOCSDIR)/scl/NN

clean:
	cd CG; make clean
	cd Type_identifier; make clean
	cd parser; make clean
