SHELL=/bin/sh

include ./paths.sh

.PHONY: all uninstall

all: 
	cd converters; make
	cd MT; make
	cd skt_gen/compounds; make
	cd skt_gen/Sentence; make
	cp htdocs/index_server.html htdocs/index.html
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
	cd NN; make install
	cp -r dhaatupaatha $(HTDOCSDIR)/$(SCL_HTDOCS)
	cp scl_help.pdf $(HTDOCSDIR)/$(SCL_HTDOCS)
	mkdir -p $(HTDOCSDIR)/$(SCL_HTDOCS)/e-readers
	cp -r e-readers/sankshepa_ramayanam $(HTDOCSDIR)/$(SCL_HTDOCS)/e-readers
	cp -r e-readers/shishu $(HTDOCSDIR)/$(SCL_HTDOCS)/e-readers; cd e-readers/shishu/assets; perl add_url_install.pl < dicturl.json > $(HTDOCSDIR)/$(SCL_HTDOCS)/e-readers/shishu/assets/dicturl.json
	cd e-readers/sbg; make install
	cp -r GOLD_DATA $(HTDOCSDIR)/$(SCL_HTDOCS)

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
