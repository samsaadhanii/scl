SHELL = /bin/bash

.PHONY: all clean

TARGETS: aluk.out upasarjana.out samAsaprakAra.out samAsAnwa.out alukkArya.out nonalukkArya.out uwwarapaxa.out paxakArya.out

all: $(TARGETS)

LIBPATH = /usr/lib
FLEX = lex 
CC = gcc
CFLAGS = -L$(LIBPATH) -g -Wall -o

aluk.out: aluk.lex cnvrtutfd2r.c cnvrtwx2utf.c fgetword.c
	lex -B -v --warn aluk.lex
	$(CC) $(CFLAGS) aluk.out cnvrtutfd2r.c cnvrtwx2utf.c fgetword.c lex.yy.c -ll
	rm lex.yy.c
upasarjana.out: upasarjana.lex gawi.lex cnvrtwx2utf.c cnvrtutfd2r.c fgetword.c
	lex -B -v --warn -Pgawi gawi.lex
	lex -B -v --warn upasarjana.lex
	$(CC) $(CFLAGS) upasarjana.out cnvrtwx2utf.c cnvrtutfd2r.c fgetword.c lex.gawi.c lex.yy.c -ll
	rm lex.yy.c lex.gawi.c
samAsAnwa.out: samAsAnwa.lex cnvrtwx2utf.c cnvrtutfd2r.c fgetword.c
	lex -B -v --warn samAsAnwa.lex
	$(CC) $(CFLAGS) samAsAnwa.out cnvrtwx2utf.c cnvrtutfd2r.c fgetword.c lex.yy.c -ll
	rm lex.yy.c
samAsaprakAra.out: samAsaprakAra.lex fgetword.c cnvrtwx2utf.c cnvrtutfd2r.c
	lex -B -v --warn samAsaprakAra.lex
	$(CC) $(CFLAGS) samAsaprakAra.out cnvrtwx2utf.c cnvrtutfd2r.c fgetword.c lex.yy.c -ll
	rm lex.yy.c
uwwarapaxa.out: uwwarapaxa.lex cnvrtutfd2r.c fgetword.c
	lex -B -v --warn uwwarapaxa.lex
	$(CC) $(CFLAGS) uwwarapaxa.out cnvrtutfd2r.c fgetword.c lex.yy.c -ll
	rm lex.yy.c
alukkArya.out:alukkArya.c prAwipaxika.lex get_sandhied_word.c fgetword.c cnvrtwx2utf.c cnvrtutfd2r.c
	lex -B -v --warn -PprAwipaxika prAwipaxika.lex
	$(CC) $(CFLAGS) alukkArya.out alukkArya.c get_sandhied_word.c fgetword.c cnvrtwx2utf.c cnvrtutfd2r.c lex.prAwipaxika.c -ll
	rm lex.prAwipaxika.c
nonalukkArya.out:nonalukkArya.c pUrvapaxa.lex prAwipaxika.lex cnvrtwx2utf.c cnvrtutfd2r.c fgetword.c
	lex -B -v --warn -PpUrvapaxa pUrvapaxa.lex
	lex -B -v --warn -PprAwipaxika prAwipaxika.lex
	$(CC) $(CFLAGS) nonalukkArya.out nonalukkArya.c cnvrtwx2utf.c cnvrtutfd2r.c fgetword.c lex.pUrvapaxa.c lex.prAwipaxika.c -ll
	rm lex.pUrvapaxa.c lex.prAwipaxika.c
paxakArya.out:paxakArya.lex cnvrtwx2utf.c fgetword.c get_sandhied_word.c cnvrtutfd2r.c
	lex -B -v --warn paxakArya.lex
	$(CC) $(CFLAGS) paxakArya.out cnvrtwx2utf.c cnvrtutfd2r.c fgetword.c get_sandhied_word.c lex.yy.c -ll
	rm lex.yy.c

install:
	source ../../spec.sh
	mkdir -p $(HTDOCSDIR)/$(SCL_HTDOCS)/skt_gen/compounds;mkdir -p $(CGIDIR)/$(SCL_CGI)/skt_gen/compounds;cd web_interface; sh install.sh html $(HTDOCSDIR)/$(SCL_HTDOCS)/skt_gen/compounds; cp web_interface/*.cgi $(CGIDIR)/$(SCL_CGI)/skt_gen/compounds;

clean:	
	rm -f alukkArya.out aluk.out nonalukkArya.out paxakArya.out samAsAnwa.out samAsaprakAra.out upasarjana.out uwwarapaxa.out
