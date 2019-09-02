SHELL = /bin/sh

.PHONY: all clean

TARGETS: nneparse.out

all: $(TARGETS)

LIBPATH = /usr/lib
FLEX = lex
CC = gcc
CFLAGS = -L$(LIBPATH) -g -Wall -o

nneparse.out:  nneparse.lex nneparse.y
	lex nneparse.lex
	bison -d -v nneparse.y
	$(CC) $(CFLAGS) nneparse.out -DDEBUG=0 nneparse.tab.c lex.yy.c -ll
	rm lex.yy.c

clean:	
	rm -f $(TARGETS)
