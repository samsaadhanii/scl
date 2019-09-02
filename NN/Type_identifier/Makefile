SHELL = /bin/sh

.PHONY: all clean

TARGETS: typeidentifier.out

all: $(TARGETS)

LIBPATH = /usr/lib
FLEX = lex
CC = gcc
CFLAGS = -L$(LIBPATH) -g -Wall -o

typeidentifier.out:  typeidentifier.lex typeidentifier.y
	lex typeidentifier.lex
	bison -d -v typeidentifier.y
	$(CC) $(CFLAGS) typeidentifier.out -DDEBUG=0 typeidentifier.tab.c lex.yy.c -ll
	rm lex.yy.c

clean:
	rm -f $(TARGETS)
