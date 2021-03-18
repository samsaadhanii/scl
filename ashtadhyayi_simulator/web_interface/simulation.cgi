#!/usr/bin/env perl

use utf8;
use Encode qw/ decode /;

require "../paths.pl";
require "$GlblVar::SCLINSTALLDIR/cgi_interface.pl";

require "$GlblVar::SCLINSTALLDIR/converters/convert.pl";

package main;
#use CGI qw/:standard/;
#use CGI::Carp qw(fatalsToBrowser);

my %param = &get_parameters("decode");

      $encoding=$param{encoding};
      $pra=$param{praatipadika};
      $vib=$param{vibhakti};
      $lifga=$param{linga};
      $vac=$param{vacana};

      #$pid = $$;
      
      $pra=~ s/\r//g;

      chomp($pra);
      chomp($vib);
      chomp($lifga);
      chomp($vac);

      $praatipadika = &convert($encoding,$pra,$GlblVar::SCLINSTALLDIR);

      #my $cgi = new CGI;
      #print $cgi->header ( -charset => 'UTF-8');
      print "Content-type:text/html;charset:UTF-8\n\n";
      print "<head>\n\n";
      print "<meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\"/>\n\n";
      print "</head>\n\n";
      print "<body>\n\n";
      system("cd $GlblVar::SCLINSTALLDIR/ashtadhyayi_simulator/june12; ./run.sh $praatipadika $vib $lifga $vac");

print "</BODY></HTML>";

