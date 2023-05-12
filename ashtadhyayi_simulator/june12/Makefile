SHELL = /bin/sh

include ../../paths.sh

.PHONY: all clean

TARGETS = afga_viXi_rule.class change_aRt.class change_output1.class change_output.class check.class console_output.class get_input.class get_SabdarUpa_new.class input_DS.class paxa_DS.class prawyaya_viXi_rule.class regex_check.class rule.class Sandhi_rule.class wripAxI_rule.class

SRC = afga_viXi_rule.java change_aRt.java change_output1.java change_output.java check.java console_output.java get_input.java get_SabdarUpa_new.java input_DS.java paxa_DS.java prawyaya_viXi_rule.java regex_check.java rule.java Sandhi_rule.java wripAxI_rule.java 

all: $(TARGETS)

afga_viXi_rule.class: afga_viXi_rule.java
	$(JAVAPATH) afga_viXi_rule.java

change_aRt.class: change_aRt.java
	$(JAVAPATH) change_aRt.java

change_output1.class: change_output1.java
	$(JAVAPATH) change_output1.java

change_output.class: change_output.java
	$(JAVAPATH) change_output.java

check.class: check.java
	$(JAVAPATH) check.java

console_output.class: console_output.java
	$(JAVAPATH) console_output.java

get_input.class: get_input.java
	$(JAVAPATH) get_input.java

get_SabdarUpa_new.class: get_SabdarUpa_new.java
	$(JAVAPATH) get_SabdarUpa_new.java

input_DS.class: input_DS.java
	$(JAVAPATH) input_DS.java

paxa_DS.class: paxa_DS.java
	$(JAVAPATH) paxa_DS.java

prawyaya_viXi_rule.class: prawyaya_viXi_rule.java
	$(JAVAPATH) prawyaya_viXi_rule.java

regex_check.class: regex_check.java
	$(JAVAPATH) regex_check.java

rule.class: rule.java
	$(JAVAPATH) rule.java

Sandhi_rule.class: Sandhi_rule.java
	$(JAVAPATH) Sandhi_rule.java

wripAxI_rule.class: wripAxI_rule.java
	$(JAVAPATH) wripAxI_rule.java

clean: 
	rm -f $(TARGETS)

install:
	mkdir -p $(HTDOCSDIR)/$(SCL_HTDOCS)/ashtadhyayi_simulator
	mkdir -p $(CGIDIR)/$(SCL_CGI)/ashtadhyayi_simulator
	cp ../web_interface/*.html $(HTDOCSDIR)/$(SCL_HTDOCS)/ashtadhyayi_simulator
	cp ../web_interface/*.cgi $(CGIDIR)/$(SCL_CGI)/ashtadhyayi_simulator
