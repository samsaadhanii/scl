SHELL = /bin/sh

.PHONY: all clean

TARGETS = get_std_spelling.out

all: get_std_spelling.out

get_std_spelling.out: get_std_spelling.c
	gcc -g -Wall -o get_std_spelling.out get_std_spelling.c

clean:
	rm -f $(TARGETS)
