SHELL = /bin/sh

TARGETS = kAraka_name
 
all: $(TARGETS)

kAraka_name: ../Prepare_Graph/DATA/AkAfkRA/relations.txt
	../../../../converters/ri_skt < ../Prepare_Graph/DATA/AkAfkRA/relations.txt | ../../../../converters/iscii2utf8.py 1 > kAraka_names_dev.txt
	../../../../converters/wx2utf8roman.out < ../Prepare_Graph/DATA/AkAfkRA/relations.txt > kAraka_names_roman.txt

.PHONY: all
