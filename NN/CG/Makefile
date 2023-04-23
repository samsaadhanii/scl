SHELL = /bin/sh

.PHONY: all clean

TARGETS: nne2diagram.out

all: $(TARGETS)

LIBPATH = /usr/lib
FLEX = lex
CC = gcc
CFLAGS = -L$(LIBPATH) -g -Wall -o

nne2diagram.out:  nne2diagram.lex nne2diagram.y
	lex nne2diagram.lex
	bison -d -v nne2diagram.y
	$(CC) $(CFLAGS) nne2diagram.out -DDEBUG=0 nne2diagram.tab.c lex.yy.c -ll
	rm lex.yy.c

clean: 
	rm -f nne2diagram.out 
