SHELL = /bin/sh

LIBPATH = /usr/lib

all: Heritage_anusaaraka_morph.out rm_noun_after_ifc_temp_fix.out

Heritage_anusaaraka_morph.out: Heritage_anusaaraka_morph.lex
	lex Heritage_anusaaraka_morph.lex
	gcc -g -L$(LIBPATH) -Wall -Wextra -o Heritage_anusaaraka_morph.out lex.yy.c -ll
	rm lex.yy.c
rm_noun_after_ifc_temp_fix.out: rm_noun_after_ifc_temp_fix.lex
	lex rm_noun_after_ifc_temp_fix.lex
	gcc -g -L$(LIBPATH) -Wall -Wextra -o rm_noun_after_ifc_temp_fix.out lex.yy.c -ll
	rm lex.yy.c
clean:	
	rm -f Heritage_anusaaraka_morph.out
