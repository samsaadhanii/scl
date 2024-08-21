SHELL = /bin/sh

include ../../../paths.sh

LIBPATH = /usr/lib

all: Heritage_anusaaraka_morph.out

Heritage_anusaaraka_morph.out: Heritage_anusaaraka_morph.lex
	lex Heritage_anusaaraka_morph.lex
	gcc -g -L$(LIBPATH) -Wall -Wextra -o Heritage_anusaaraka_morph.out lex.yy.c -ll
	rm lex.yy.c

install:
	mkdir -p $(CGIDIR)/$(SCL_CGI)/MT/prog/Heritage_morph_interface
	cp Heritage2anusaaraka_morph.sh $(CGIDIR)/$(SCL_CGI)/MT/prog/Heritage_morph_interface
	cp Heritage_anusaaraka_morph.out $(CGIDIR)/$(SCL_CGI)/MT/prog/Heritage_morph_interface
	cp *.pl $(CGIDIR)/$(SCL_CGI)/MT/prog/Heritage_morph_interface
	cp *.txt $(CGIDIR)/$(SCL_CGI)/MT/prog/Heritage_morph_interface
clean: 
	rm -f $(TARGETS)
