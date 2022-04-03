rm ../bin/*.gdbm
./create_dbm.pl ../bin/dict_gen.gdbm < default_gen.txt
./create_samaasa_dbm.pl ../bin/samasa_rules.gdbm < samasa_rules.txt
./create_dbm_pronoun.pl ../bin/pronoun_forms.gdbm < pronoun_forms.txt
./create_dbm_bahu_pronoun.pl ../bin/bahu_pron.gdbm < bahuvrIhi_pronoun.txt 
./create_dbm_fem_viSeRaNa.pl ../bin/fem_viSeRaNa.gdbm < fem_viSeRaNa.txt
./create_dbm_num.pl ../bin/num.gdbm < num.txt
./create_dbm_excp_ex.pl ../bin/excp_ex.gdbm < excp_ex.txt
./create_dbm_pUrvapaxa.pl ../bin/pUrvapaxa_rt_gen.gdbm < pUrvapaxa_rt_gen.txt
./create_dbm_pUrvapaxa.pl ../bin/uwwarapaxa_rt_gen.gdbm < uwwarapaxa_rt_gen.txt
