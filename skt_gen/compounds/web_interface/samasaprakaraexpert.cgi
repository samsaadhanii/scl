#!/usr/bin/perl

require "../../paths.pl";

my $myPATH = "$GlblVar::SCLINSTALLDIR/skt_gen/compounds";
require "$GlblVar::SCLINSTALLDIR/converters/convert.pl";

use warnings;
use CGI ':standard';

my $cgi = new CGI;

print $cgi->header(-type    => 'text/html',
                   -charset => 'utf-8');

if (param) {
  my $input_encoding = param("input_encoding");
  my $output_encoding = param("output_encoding");
  my $p1 = param("pratipadika1");
  my $s1 = param("pratyaya1");
  my $p2 = param("pratipadika2");
  my $s2 = param("pratyaya2");
  my $viXAyakasUwra = param("viXAyakasUwra");

  $p1wx=&convert($input_encoding,$p1,$GlblVar::SCLINSTALLDIR);
  $p2wx=&convert($input_encoding,$p2,$GlblVar::SCLINSTALLDIR);
  my $avigraha = $p1wx."+".$s1." ".$p2wx."+".$s2;
  #print "samAsaprakAra cgi avigraha = $avigraha\n";

  my $cmd = "$myPATH/samAsaprakAra.out \"$output_encoding\" \"$avigraha\" \"$p1wx\" \"$s1\" \"$p2wx\" \"$s2\" \"$viXAyakasUwra\"";
  system($cmd);
}

