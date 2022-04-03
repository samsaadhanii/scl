#!/usr/bin/perl -W
#use strict;
#use warnings;
#use Shell;
use CGI;
use CGI qw( :standard );
use LWP::Simple qw/!head/;
print CGI::header('-type'=>'text/html', '-expires'=>60*60*24, '-charset' => 'UTF-8');

my $comp_input=param('scparse');
my $encod=param('encoding');

open(FCONV,">/tmp/FCONVIN$$");
print FCONV "$comp_input\n";
close(FCONV);

#print $encod;
if($encod eq "Unicode"){
system("../converters/utf82iscii.pl < /tmp/FCONVIN$$|../converters/ir > /tmp/FCONV$$");
}elsif($encod eq "WX"){
system("/bin/echo $comp_input > /tmp/FCONV$$");
}

system("../converters/ri_skt < /tmp/FCONV$$|../converters/iscii2utf8.py 1 > /tmp/in_dev");
open(INP,"</tmp/in_dev");
$input=<INP>;
print "<font size=4><center><p style=\"background-color:red;color:white;\">$input</p> <\/center></font>";
close(INP);

my $path="/home/pankajvyas/public_html/SCP/consti_parse/cgi";

#system("/bin/sh /home/anil/public_html/SCP/cgi/bin/rund.sh < /tmp/FCONV$$");

system("/usr/bin/perl $path/eval_new.pl $path/bigram_full.dbm $path/unigram_full.dbm /tmp/output < /tmp/FCONV$$ >/tmp/consti_log");

system("../converters/ri_skt < /tmp/output|../converters/iscii2utf8.py 1 > /tmp/out_dev");

open(OUT,"</tmp/out_dev")||die"output file not found";
$output=<OUT>;
$output =~ s/</\&lt\;/g;
$output =~ s/>/\&gt\;/g;
print "<center><p style=\"font-size:20px;\";>$output</p><\/center><br>";
close(OUT);

#system("/bin/cat /tmp/output");






#print "Over!!!!Anil";
