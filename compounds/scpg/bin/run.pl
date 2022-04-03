#!/usr/bin/perl
use Cwd;

$path= cwd();
system("/usr/bin/perl $path/gen_para_new.pl $path $path/samasa_rules.gdbm $path/dict_gen.gdbm $path/bahu_pron.gdbm $path/fem_viSeRaNa.gdbm $path/num.gdbm $path/pronoun_forms.gdbm $path/excp_ex.gdbm $path/pUrvapaxa_rt_gen.gdbm < $ARGV[0]" );
