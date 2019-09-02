SHELL=/bin/sh

include ./paths.sh

.PHONY: all uninstall

all: 
	cd converters; make
	cd SHMT; make
	cd skt_gen/compounds; make
	cd skt_gen/Sentence; make
	cp htdocs/index_server.html htdocs/index.html
	cd ashtadhyayi_simulator/june12; make
	cd NN; make

install:
	rm -rf $(HTDOCSDIR)/scl
	rm -rf $(CGIDIR)/scl
	cd sandhi; make install
	cd SHMT; make install
	cd htdocs; make install
	cd skt_gen; make install
	cd transliteration; make install
	cp paths.pl paths.sh $(CGIDIR)/scl
	cd ashtadhyayi_simulator/june12; make install
	cd amarakosha; make install
	cd NN; make install
	cp -r dhaatupaatha $(HTDOCSDIR)/scl
	cp scl_help.pdf $(HTDOCSDIR)/scl
	mkdir -p $(HTDOCSDIR)/scl/e-readers
	cp -r e-readers/sankshepa_ramayanam $(HTDOCSDIR)/scl/e-readers
	cd e-readers/sbg; make install
	cp -r GOLD_DATA $(HTDOCSDIR)/scl

install_server:
	rm -rf $(HTDOCSDIR)/scl
	rm -rf $(CGIDIR)/scl
	cp htdocs/statcounter.js htdocs/statcounter_dummy.js
	cd sandhi; make install
	cd SHMT; make install
	cd htdocs; make install
	cd skt_gen; make install
	cd transliteration; make install
	cp paths.pl paths.sh $(CGIDIR)/scl
	cd ashtadhyayi_simulator/june12; make install
	cd amarakosha; make install
	cd NN; make install
	cp -r dhaatupaatha $(HTDOCSDIR)/scl
	cp scl_help.pdf $(HTDOCSDIR)/scl
	mkdir -p $(HTDOCSDIR)/scl/e-readers
	cp -r e-readers/sankshepa_ramayanam $(HTDOCSDIR)/scl/e-readers
	cd e-readers/sbg; make install
	cp -r e-readers/shishu $(HTDOCSDIR)/scl/e-readers
	cp -r GOLD_DATA $(HTDOCSDIR)/scl

uninstall:
	rm -r $(HTDOCSDIR)/scl $(CGIDIR)/scl $(TFPATH)

clean:	
	cd converters; make clean
	cd SHMT; make clean
	cd skt_gen/compounds; make clean
	cd skt_gen/Sentence; make clean
	cd ashtadhyayi_simulator/june12; make clean
	cd NN; make clean
