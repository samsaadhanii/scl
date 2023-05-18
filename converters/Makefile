SHELL = /bin/sh

include ../paths.sh

.PHONY: all clean

TARGETS = ir ri ri_skt ir_skt itrans_ra.out logical_itrans.out rm__between_vowels.out kyoto_ra.out wx2utf8roman.out add_vowel_sep.out ra_itrans.out ra_kyoto.out wx2slp.out slp2wx.out velthuis-wx.out wx-velthuis.out utf8roman2wx.out wx-filename.out

SRC = ir.lex ir_skt.lex iscii2utf8.py itrans-iscii.sh itrans_ra.lex kyoto_ra.lex logical_itrans.lex Makefile ri.lex ri_skt.lex rm__between_vowels.lex slp2wx.lex utf82iscii.pl utf82wx.sh velthuis-wx.lex wx2utf8.sh convert.pl wx-velthuis.lex utf8roman2wx.lex wx2utf8roman.lex iso2utf.sh itrans-iscii.sh utf82wx.sh utf8d2r.sh wx2utf8.sh wxHindi-utf8.sh utf8roman2wx.lex add_vowel_sep.lex ra_itrans.lex w2slp.lex slp2wx.lex velthuis-wx.lex wx-velthuis.lex

LIBPATH = /usr/lib

all: $(TARGETS)
FLEX = lex
CC = gcc
CFLAGS = -L$(LIBPATH) -g -Wall -o

define run_lex
$(FLEX) $^
$(CC) $(CFLAGS) $@ lex.yy.c -ll
rm lex.yy.c
endef

install:
	mkdir -p $(CGIDIR)/$(SCL_CGI)/converters
	cp *.out $(CGIDIR)/$(SCL_CGI)/converters
	cp *.pl $(CGIDIR)/$(SCL_CGI)/converters
	perl add_url_install.pl < convert2WX_subroutines.pl > $(CGIDIR)/$(SCL_CGI)/converters/convert2WX_subroutines.pl
	cp *.sh $(CGIDIR)/$(SCL_CGI)/converters
	cp *.py $(CGIDIR)/$(SCL_CGI)/converters
	cp ir ir_skt ri ri_skt $(CGIDIR)/$(SCL_CGI)/converters


add_vowel_sep.out: add_vowel_sep.lex
	$(run_lex)

ir: ir.lex
	$(run_lex)

ra_itrans.out: ra_itrans.lex
	$(run_lex)

ri: ri.lex
	$(run_lex)

ri_skt: ri_skt.lex
	$(run_lex)

ir_skt: ir_skt.lex
	$(run_lex)

itrans_ra.out: itrans_ra.lex
	$(run_lex)

logical_itrans.out: logical_itrans.lex
	$(run_lex)

rm__between_vowels.out: rm__between_vowels.lex
	$(run_lex)

kyoto_ra.out: kyoto_ra.lex
	$(run_lex)

ra_kyoto.out: ra_kyoto.lex
	$(run_lex)

wx2utf8roman.out: wx2utf8roman.lex
	$(run_lex)

wx2slp.out: wx2slp.lex
	$(run_lex)

slp2wx.out: slp2wx.lex
	$(run_lex)

velthuis-wx.out: velthuis-wx.lex
	$(run_lex)

wx-velthuis.out: wx-velthuis.lex
	$(run_lex)

wx-filename.out: wx-filename.lex
	$(run_lex)

utf8roman2wx.out: utf8roman2wx.lex
	$(run_lex)

distrib:
	cd ../; tar -cvzf /tmp/a.tgz -C converters $(SRC); mkdir /tmp/converters; cd /tmp/converters; tar -xvzf /tmp/a.tgz; cd ../; tar -cvzf converters.tgz converters; rm a.tgz
	cp /tmp/converters.tgz .

clean: 
	rm -f $(TARGETS)

