SHELL = /bin/sh

TARGETS = translate.out

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

translate.out: translate.lex
	$(run_lex)

.PHONY: all

clean:
	rm -f $(TARGETS)
