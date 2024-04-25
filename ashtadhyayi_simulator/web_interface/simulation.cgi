#!/usr/bin/env perl

use utf8;
use Encode qw/ decode /;

require "../paths.pl";
$myPATH = "$GlblVar::CGIDIR/$GlblVar::SCL_CGI";
require "$myPATH/cgi_interface.pl";

require "$myPATH/converters/convert.pl";

package main;

my %param = &get_parameters("decode");

      $encoding=$param{encoding};
      $pra=$param{praatipadika};
      $vib=$param{vibhakti};
      $lifga=$param{linga};
      $vac=$param{vacana};

      $pra=~ s/\r//g;

#      chomp($pra);
#      chomp($vib);
#      chomp($lifga);
#      chomp($vac);

      $praatipadika = &convert($encoding,$pra,$myPATH);
	chomp($praatipadika);

      print "Content-type:text/html;charset:UTF-8\n\n";
      print "<head>\n\n";
      print "<meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\"/>\n\n";
      print "</head>\n\n";
      print "<body>\n\n";
      system("cd $myPATH/ashtadhyayi_simulator/; ./run.sh $praatipadika $vib $lifga $vac");

print "</BODY></HTML>";

