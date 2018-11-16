#!/usr/bin/env perl


require "../../../paths.pl";
use CGI qw/:standard/;

if(param) {
 $pid = param("pid");
 
 my $cgi = new CGI;

$filepath = "$TFPATH/tmp_in$pid/in${pid}_table.csv";
print ("Content-Type:application/x-download\n");
print "Content-Disposition: attachment; filename=$file\n\n";

open FILE, "< $filepath" or die "can't open : $!";
binmode FILE;
local $/ = \10240;
while (<FILE>){
    print $_;
}

    close FILE;
}

