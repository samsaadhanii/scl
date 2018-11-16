SHELL = /bin/sh

.PHONY: all clean

TARGETS: S1.dbm S2.dbm S3.dbm S4.dbm

all: $(TARGETS)

S1.dbm: create_dbm.sh samAsa_rules.txt create_dbm_for_new_rules.pl
	./create_dbm.sh

clean: S1.dbm S2.dbm S3.dbm S4.dbm
	rm *.dbm
