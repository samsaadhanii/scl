SHELL=/bin/bash

include ./paths.sh

.PHONY: all uninstall

all: 
	cd converters; make
	cd MT; make
	cd skt_gen/compounds; make
	cd skt_gen/Sentence; make clean; make
	cd ashtadhyayi_simulator/june12; make
	cd NN; make

mar:
	rsync -r mod_mar/MT/ MT/

tel:
	rsync -r mod_tel/MT/ MT/

install:
	rm -rf $(HTDOCSDIR)/$(SCL_HTDOCS)
	rm -rf $(CGIDIR)/$(SCL_CGI)
	cd converters; make install
	cd sandhi; make install
	cd MT; make install
	cd htdocs; make install
	cd skt_gen; make install
	cd transliteration; make install
	cp paths.pl paths.sh cgi_interface.pl $(CGIDIR)/$(SCL_CGI)
	cd ashtadhyayi_simulator/june12; make install
	cd amarakosha; make install
	cp -r kosha_concordance $(HTDOCSDIR)/$(SCL_HTDOCS)
	cd NN; make install
	cd YMK; make install
	mkdir -p $(HTDOCSDIR)/$(SCL_HTDOCS)/Post-editing; cp Post-editing/ViewGraph*.html $(HTDOCSDIR)/$(SCL_HTDOCS)/Post-editing
	mkdir -p $(CGIDIR)/$(SCL_CGI)/Post-editing; cd Post-editing; perl ./add_url_install.pl < ViewGraph.cgi > $(CGIDIR)/$(SCL_CGI)/Post-editing/ViewGraph.cgi; chmod 755 $(CGIDIR)/$(SCL_CGI)/Post-editing/ViewGraph.cgi; cp ViewGraph.py $(CGIDIR)/$(SCL_CGI)/Post-editing/ViewGraph.py; chmod 755 $(CGIDIR)/$(SCL_CGI)/Post-editing/ViewGraph.py; perl ./add_url_install.pl < ViewGraph_Sentno.cgi > $(CGIDIR)/$(SCL_CGI)/Post-editing/ViewGraph_Sentno.cgi; chmod 755 $(CGIDIR)/$(SCL_CGI)/Post-editing/ViewGraph_Sentno.cgi
	cp -r dhaatupaatha $(HTDOCSDIR)/$(SCL_HTDOCS)
	cp scl_help.pdf $(HTDOCSDIR)/$(SCL_HTDOCS)
	mkdir $(HTDOCSDIR)/$(SCL_HTDOCS)/API_DOC; cp API_DOC/API_DOC.pdf $(HTDOCSDIR)/$(SCL_HTDOCS)/API_DOC
	#mkdir -p $(HTDOCSDIR)/$(SCL_HTDOCS)/e-readers
	cp -r e-readers/sankshepa_ramayanam $(HTDOCSDIR)/$(SCL_HTDOCS)/e-readers
	#cp -r e-readers/1000Sents $(HTDOCSDIR)/$(SCL_HTDOCS)/e-readers
	cp -r e-readers/SR_NEW $(HTDOCSDIR)/$(SCL_HTDOCS)/e-readers
	#cp -r e-readers/AH $(HTDOCSDIR)/$(SCL_HTDOCS)/e-readers
	cp -r e-readers/shishu $(HTDOCSDIR)/$(SCL_HTDOCS)/e-readers; cd e-readers/shishu/assets; perl add_url_install.pl < dicturl.json > $(HTDOCSDIR)/$(SCL_HTDOCS)/e-readers/shishu/assets/dicturl.json
	cd e-readers/sbg; make install
	cp -r GOLD_DATA $(HTDOCSDIR)/$(SCL_HTDOCS)
	cp cron.sh $(CGIDIR)/$(SCL_CGI)

install_mar:
	mkdir -p $(CGIDIR)/$(SCL_CGI)/MT/data/mr; cp MT/data/mr/*.txt $(CGIDIR)/$(SCL_CGI)/MT/data/mr
	mkdir -p $(CGIDIR)/$(SCL_CGI)/MT/prog/mar/sent_gen; cp MT/prog/mar/sent_gen/*.pl $(CGIDIR)/$(SCL_CGI)/MT/prog/mar/sent_gen; chmod 755 $(CGIDIR)/$(SCL_CGI)/MT/prog/mar/sent_gen/*.pl
	cp MT/prog/shell/anu_skt_mrt.sh $(CGIDIR)/$(SCL_CGI)/MT/prog/shell ; chmod 755 $(CGIDIR)/$(SCL_CGI)/MT/prog/shell/anu_skt_mrt.sh
	mkdir -p $(CGIDIR)/$(SCL_CGI)/MT/prog/mar/word_gen; cp MT/prog/mar/word_gen/call_gen.pl $(CGIDIR)/$(SCL_CGI)/MT/prog/mar/word_gen/; chmod 755 $(CGIDIR)/$(SCL_CGI)/MT/prog/mar/word_gen/*.pl
	mkdir -p $(CGIDIR)/$(SCL_CGI)/MT/prog/mar/word_gen; cp MT/prog/mar/word_gen/mar_gen.bin $(CGIDIR)/$(SCL_CGI)/MT/prog/mar/word_gen/;
	mkdir -p $(CGIDIR)/$(SCL_CGI)/MT/prog/map/mar/; cp MT/prog/map/mar/*.pl $(CGIDIR)/$(SCL_CGI)/MT/prog/map/mar/; chmod 755 $(CGIDIR)/$(SCL_CGI)/MT/prog/map/mar/*.pl
	mkdir -p $(CGIDIR)/$(SCL_CGI)/MT/prog/map/mar/; cp MT/prog/map/mar/*.py $(CGIDIR)/$(SCL_CGI)/MT/prog/map/mar/; chmod 755 $(CGIDIR)/$(SCL_CGI)/MT/prog/map/mar/*.py

install_server:
	rm -rf $(HTDOCSDIR)/$(SCL_HTDOCS)
	rm -rf $(CGIDIR)/$(SCL_CGI)
	cp htdocs/statcounter.js htdocs/statcounter_dummy.js
	cd sandhi; make install
	cd MT; make install
	cd htdocs; make install
	cd skt_gen; make install
	cd transliteration; make install
	cp paths.pl paths.sh $(CGIDIR)/$(SCL_CGI)
	cd ashtadhyayi_simulator/june12; make install
	cd amarakosha; make install
	cd NN; make install
	cp -r dhaatupaatha $(HTDOCSDIR)/$(SCL_HTDOCS)
	cp scl_help.pdf $(HTDOCSDIR)/$(SCL_HTDOCS)
	mkdir -p $(HTDOCSDIR)/$(SCL_HTDOCS)/e-readers
	cp -r e-readers/sankshepa_ramayanam $(HTDOCSDIR)/$(SCL_HTDOCS)/e-readers
	cd e-readers/sbg; make install
	#cp -r e-readers/shishu $(HTDOCSDIR)/$(SCL_HTDOCS)/e-readers
	cp -r GOLD_DATA $(HTDOCSDIR)/$(SCL_HTDOCS)

uninstall:
	rm -r $(HTDOCSDIR)/$(SCL_HTDOCS) $(CGIDIR)/$(SCL_HTDOCS) $(TFPATH)

clean:	
	cd converters; make clean
	cd MT; make clean
	cd skt_gen/compounds; make clean
	cd skt_gen/Sentence; make clean
	cd ashtadhyayi_simulator/june12; make clean
	cd NN; make clean
