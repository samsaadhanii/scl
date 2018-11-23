#!/usr/bin/env perl

require "../paths.pl";

require "$GlblVar::SCLINSTALLDIR/converters/convert.pl";

package main;
use CGI qw/:standard/;
#use CGI::Carp qw(fatalsToBrowser);


      if (param) {
      $encoding=param("encoding");
      $pra=param("praatipadika");
      $vib=param("vibhakti");
      $lifga=param("linga");
      $vac=param("vacana");

      $pid = $$;
      
      $pra=~ s/\r//g;

      chomp($pra);
      chomp($vib);
      chomp($lifga);
      chomp($vac);

      $praatipadika = &convert($encoding,$pra,$GlblVar::SCLINSTALLDIR);

      my $cgi = new CGI;
      print $cgi->header ( -charset => 'UTF-8');
      system("cd $GlblVar::SCLINSTALLDIR/ashtadhyayi_simulator/june12; ./run.sh $praatipadika $vib $lifga $vac");

print "</BODY></HTML>";
}	
