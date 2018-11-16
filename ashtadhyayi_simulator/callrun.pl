#!/usr/bin/env perl

use CGI qw/:standard/;

require "../paths.pl";

require "$GlblVar::SCLINSTALLDIR/converters/convert.pl";

$praatipadika = &convert($ARGV[0],$ARGV[1],$GlblVar::SCLINSTALLDIR);
$vibhakti = $ARGV[2];
$lifga = $ARGV[3];
$vacana = $ARGV[4];

chomp($praatipadika);
chomp($vibhakti);
chomp($lifga);
chomp($vacana);
      
      my $cgi = new CGI;
      print $cgi->header ( -charset => 'UTF-8');
      system("cd $GlblVar::SCLINSTALLDIR/ashtadhyayi_simulator/june12; ./run.sh $praatipadika $vibhakti $lifga $vacana");
	
print "</BODY></HTML>";
