SHELL = /bin/sh

TARGETS = gen_table.out

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

#add_snt_mrkr.out: add_snt_mrkr.lex
#	$(run_lex)

gen_table.out: gen_table.lex
	$(run_lex)

.PHONY: all

clean:
	rm -f $(TARGETS)
