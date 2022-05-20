# Makefile : New Generator

TARGETS = new_gen.out
all: $(TARGETS)

INCLUDE = ../prog
OBJECTF =  amba_new.o trim.o suffix.o strcp.o function.o RaR.o \
	  form_wor.o ya_form.o subj.o future.o parad.o n_excp.o    \
	  nou_utils.o pro_utils.o verb_utils.o adj_utils.o word_gen.o\
	  fix.o exption.o get_prdtbl_entry.o my_bsrch.o

OBJECTF1 =  amba_eng_intfc.o trim.o suffix.o strcp.o function.o RaR.o \
	  form_wor.o ya_form.o subj.o future.o parad.o n_excp.o    \
	  nou_utils.o pro_utils.o verb_utils.o adj_utils.o word_gen.o\
	  fix.o exption.o get_prdtbl_entry.o my_bsrch.o


new_gen_eng_intfc.out     : ${OBJECTF1}
	   	cc -Wall -g -o new_gen_eng_intfc.out ${OBJECTF1}
new_gen.out     : ${OBJECTF}
	   	cc -Wall -g -o new_gen.out ${OBJECTF}
amba_eng_intfc.o       : ${INCLUDE}/amba_eng_intfc.c ${INCLUDE}/tam.c
	   	cc -Wall -g -c ${INCLUDE}/amba_eng_intfc.c ${INCLUDE}/tam.c
amba_new.o       : ${INCLUDE}/amba_new.c ${INCLUDE}/tam.c
	   	cc -Wall -g -c ${INCLUDE}/amba_new.c ${INCLUDE}/tam.c
fix.o       : ${INCLUDE}/fix.c
	   	cc -Wall -g -c ${INCLUDE}/fix.c
word_gen.o       : ${INCLUDE}/word_gen.c
	   	cc -Wall -g -c ${INCLUDE}/word_gen.c
trim.o      : ${INCLUDE}/trim.c
	   	cc -Wall -g -c ${INCLUDE}/trim.c
suffix.o    : ${INCLUDE}/suffix.c
	   	cc -Wall -g -c ${INCLUDE}/suffix.c
strcp.o     : ${INCLUDE}/strcp.c
	   	cc -Wall -g -c ${INCLUDE}/strcp.c
function.o  : ${INCLUDE}/function.c
	   	cc -Wall -g -c ${INCLUDE}/function.c
RaR.o       : ${INCLUDE}/RaR.c
	   	cc -Wall -g -c ${INCLUDE}/RaR.c
form_wor.o  : ${INCLUDE}/form_wor.c
	   	cc -Wall -g -c ${INCLUDE}/form_wor.c
ya_form.o   : ${INCLUDE}/ya_form.c
	   	cc -Wall -g -c ${INCLUDE}/ya_form.c
subj.o      : ${INCLUDE}/subj.c
	   	cc -Wall -g -c ${INCLUDE}/subj.c
future.o    : ${INCLUDE}/future.c
	   	cc -Wall -g -c ${INCLUDE}/future.c
parad.o     : ${INCLUDE}/parad.c
	   	cc -Wall -g -c ${INCLUDE}/parad.c
n_excp.o    : ${INCLUDE}/n_excp.c
	   	cc -Wall -g -c ${INCLUDE}/n_excp.c
nou_utils.o : ${INCLUDE}/nou_utils.c
	   	cc -Wall -g -c ${INCLUDE}/nou_utils.c
pro_utils.o : ${INCLUDE}/pro_utils.c
	   	cc -Wall -g -c ${INCLUDE}/pro_utils.c
verb_utils.o: ${INCLUDE}/verb_utils.c
	   	cc -Wall -g -c ${INCLUDE}/verb_utils.c
adj_utils.o : ${INCLUDE}/adj_utils.c
	   	cc -Wall -g -c ${INCLUDE}/adj_utils.c
exption.o   : ${INCLUDE}/exption.c
	   	cc -Wall -g -c ${INCLUDE}/exption.c
get_prdtbl_entry.o    : ${INCLUDE}/get_prdtbl_entry.c
	   	cc -Wall -g -c ${INCLUDE}/get_prdtbl_entry.c
my_bsrch.o    : ${INCLUDE}/my_bsrch.c
	   	cc -Wall -g -c ${INCLUDE}/my_bsrch.c

clean:	
		rm -f adj_utils.o amba_new.o exption.o fix.o form_wor.o function.o future.o get_prdtbl_entry.o my_bsrch.o n_excp.o nou_utils.o parad.o pro_utils.o RaR.o strcp.o subj.o suffix.o tam.o trim.o verb_utils.o word_gen.o ya_form.o new_gen.out
