SHELL = /bin/sh

TARGETS = lwg.out get_std_spelling.out

LIBPATH = /usr/lib

all: $(TARGETS)
FLEX = lex
CC = gcc
CFLAGS = -L$(LIBPATH) -Wall -g -o

define run_lex
$(FLEX) $^
$(CC) $(CFLAGS) $@ lex.yy.c -ll
rm lex.yy.c
endef

lwg.out: lwg.lex
	$(run_lex)

get_std_spelling.out: get_std_spelling.c
	$(CC) -g -Wall get_std_spelling.c -o get_std_spelling.out

.PHONY: all clean

clean:
	rm -f $(TARGETS)
