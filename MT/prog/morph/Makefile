SHELL = /bin/sh

include ../../../paths.sh

install:
	mkdir -p $(HTDOCSDIR)/$(SCL_HTDOCS)/MT/prog/morph
	mkdir -p $(CGIDIR)/$(SCL_CGI)/MT/prog/morph/local_analysis
	mkdir -p $(CGIDIR)/$(SCL_CGI)/MT/prog/morph/bin
	cp web_interface/*.html $(HTDOCSDIR)/$(SCL_HTDOCS)/MT/prog/morph
	cp web_interface/*.cgi $(CGIDIR)/$(SCL_CGI)/MT/prog/morph
	cp web_interface/*.css $(HTDOCSDIR)/$(SCL_HTDOCS)/MT/prog/morph
	cp web_interface/scripts.pl $(CGIDIR)/$(SCL_CGI)/MT/prog/morph/
	cp local_analysis/add_mo_local.pl $(CGIDIR)/$(SCL_CGI)/MT/prog/morph/local_analysis
	cp local_analysis/*.txt $(CGIDIR)/$(SCL_CGI)/MT/prog/morph/local_analysis
	cp bin/*.pl $(CGIDIR)/$(SCL_CGI)/MT/prog/morph/bin
	cp *.sh $(CGIDIR)/$(SCL_CGI)/MT/prog/morph
	cp rUDa_kqw.txt $(CGIDIR)/$(SCL_CGI)/MT/prog/morph/
clean: 
	rm -f $(TARGETS)

