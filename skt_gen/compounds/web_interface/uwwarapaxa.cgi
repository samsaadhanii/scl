#!/usr/bin/perl

require "../../paths.pl";

my $myPATH = "$GlblVar::SCLINSTALLDIR/skt_gen/compounds";
require "$myPATH/cnvrt2utf.pl";
require "$myPATH/cnvrt2utfr.pl";

use warnings;
use CGI ':standard';

my $cgi = new CGI;

print $cgi->header(-type    => 'text/html',
                   -charset => 'utf-8');

if (param) {
  my $encodinguwwara = param("encodinguwwara");
  my $p1uwwara = param("p1uwwara");
  my $p2uwwara = param("p2uwwara");
  my $samAsAnwauwwara = param("samAsAnwauwwara");
  my $samAsaprakArauwwara = param("samAsaprakArauwwara");
  my $sUwrastruwwara = param("sUwrastruwwara");
  my $uwwarapaxastr = param("uwwarapaxastr");
  my $dividuwwara = param("dividuwwara");
  my $ansuwwara = param("ansuwwara");

  if($ansuwwara eq "No") { $uwwarapaxastr = "";}

  #print "uwwarapaxastr = $uwwarapaxastr\n";
  #print "sUwrastr = $sUwrastruwwara\n";
  #print "samAsAnwa = $samAsAnwauwwara\n";

  my $p2utf = &cnvrt2utf($p2uwwara);
  my $u2utf = &cnvrt2utf($uwwarapaxastr);

  if ($encodinguwwara eq "RMN") {
     $p2utfr = &cnvrt2utf($p2utf);
     $u2utfr = &cnvrt2utf($u2utf);
     $sUwrastrutfr = &cnvrt2utf($sUwrastruwwara);
  }

  $dividuwwara =~ s/#output//;
  $dividuwwara++;

      #print "uwwarapaxastr = $uwwarapaxastr\n";
      if($uwwarapaxastr ne "") {
          if ($encodinguwwara eq "RMN") {
            print " $p2utfr \&gt; $u2utfr <font color=\"red\">$sUwrastrutfr</font><br />";
          } else {
            print " $p2utf \&gt; $u2utf <font color=\"red\">$sUwrastruwwara</font><br />";
          }
          $p2uwwara = $uwwarapaxastr;
      }
      #print "Calling paxakArya with samAsAnwa = $samAsAnwauwwara\n";
      #print "Calling paxakArya with samAsaprakAra = $samAsaprakArauwwara\n";
      $cmd = "$myPATH/paxakArya.out \"$encodinguwwara\" \"$p1uwwara\" \"$p2uwwara\" \"$samAsAnwauwwara\" \"$samAsaprakArauwwara\" $dividuwwara";
      system($cmd);
}
