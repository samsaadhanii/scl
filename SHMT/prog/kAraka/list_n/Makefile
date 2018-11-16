SHELL = /bin/sh

TARGETS = kAraka_name
 
all: $(TARGETS)

kAraka_name: ../Prepare_Graph/DATA/AkAfkRA/relations.txt
	rm -f ../gdbm_n/kAraka_name.gdbm ../gdbm_n/kAraka_num.gdbm
	mkdir -p ../gdbm_n
	./create_kAraka_name_dbm.pl ../gdbm_n/kAraka_name.gdbm  ../gdbm_n/kAraka_num.gdbm < ../Prepare_Graph/DATA/AkAfkRA/relations.txt
	../../../../converters/ri_skt < ../Prepare_Graph/DATA/AkAfkRA/relations.txt | ../../../../converters/iscii2utf8.py 1 > kAraka_names_dev.txt
	../../../../converters/wx2utf8roman.out < ../Prepare_Graph/DATA/AkAfkRA/relations.txt > kAraka_names_roman.txt
	./create_kAraka_name_dev.pl ../gdbm_n/kAraka_name_dev.gdbm < kAraka_names_dev.txt
	./create_kAraka_name_dev.pl ../gdbm_n/kAraka_name_roman.gdbm < kAraka_names_roman.txt
	chmod 644 ../gdbm_n/kAraka_name.gdbm ../gdbm_n/kAraka_num.gdbm  ../gdbm_n/kAraka_name_dev.gdbm ../gdbm_n/kAraka_name_roman.gdbm

.PHONY: all

clean:
	rm -f $(TARGETS)
