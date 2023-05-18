SHELL = /bin/sh

include ../paths.sh
SUBDIRS = CG parser Type_identifier

.PHONY: $(SUBDIRS)

all: $(SUBDIRS)

$(SUBDIRS):
	$(MAKE) -C $@

install:
	mkdir -p $(HTDOCSDIR)/$(SCL_HTDOCS)/NN/CG; mkdir -p $(CGIDIR)/$(SCL_CGI)/NN/CG; mkdir -p $(TFPATH)/NN/CG; chown $(APACHE_USER_GROUP) $(TFPATH)/NN; chown $(APACHE_USER_GROUP) $(TFPATH)/NN/CG; cd CG/web_interface; sh install.sh html $(HTDOCSDIR)/$(SCL_HTDOCS)/NN/CG; cp *.cgi $(CGIDIR)/$(SCL_CGI)/NN/CG; 
	mkdir -p $(CGIDIR)/$(SCL_CGI)/NN/parser; mkdir -p $(HTDOCSDIR)/$(SCL_HTDOCS)/NN/parser; mkdir -p $(TFPATH)/NN/parser; chown $(APACHE_USER_GROUP) $(TFPATH)/NN/parser; cp parser/web_interface/*.cgi $(CGIDIR)/$(SCL_CGI)/NN/parser; cd parser/web_interface; sh install.sh html $(HTDOCSDIR)/$(SCL_HTDOCS)/NN/parser;
	mkdir -p $(CGIDIR)/$(SCL_CGI)/NN/segmenter; mkdir -p $(HTDOCSDIR)/$(SCL_HTDOCS)/NN/segmenter; mkdir -p $(TFPATH)/NN/segmenter;  chown $(APACHE_USER_GROUP) $(TFPATH)/NN/segmenter; cp segmenter/web_interface/*.cgi $(CGIDIR)/$(SCL_CGI)/NN/segmenter; cd segmenter/web_interface; sh install.sh html $(HTDOCSDIR)/$(SCL_HTDOCS)/NN/segmenter;
	mkdir -p $(CGIDIR)/$(SCL_CGI)/NN/Type_identifier; mkdir -p $(HTDOCSDIR)/$(SCL_HTDOCS)/NN/Type_identifier; mkdir -p $(TFPATH)/NN/Type_identifier;  chown $(APACHE_USER_GROUP) $(TFPATH)/NN/Type_identifier; cp Type_identifier/web_interface/*.cgi $(CGIDIR)/$(SCL_CGI)/NN/Type_identifier; cd Type_identifier/web_interface; sh install.sh html $(HTDOCSDIR)/$(SCL_HTDOCS)/NN/Type_identifier;
	cd $(HTDOCSDIR)/$(SCL_HTDOCS)/NN/CG; ln -sf $(TFPATH)/NN/CG DOT
	cd $(HTDOCSDIR)/$(SCL_HTDOCS)/NN/parser; ln -sf $(TFPATH)/NN/parser DOT
	cd $(HTDOCSDIR)/$(SCL_HTDOCS)/NN/Type_identifier; ln -sf $(TFPATH)/NN/Type_identifier DOT
	cp -r css_files $(HTDOCSDIR)/$(SCL_HTDOCS)/NN
	cp -r js_files $(HTDOCSDIR)/$(SCL_HTDOCS)/NN

clean:
	cd CG; make clean
	cd Type_identifier; make clean
	cd parser; make clean
