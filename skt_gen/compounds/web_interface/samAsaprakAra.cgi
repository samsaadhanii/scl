#!/usr/bin/perl

require "../../paths.pl";

my $myPATH = "$GlblVar::SCLINSTALLDIR/skt_gen/compounds";

use warnings;
use CGI ':standard';

my $cgi = new CGI;

print $cgi->header(-type    => 'text/html',
                   -charset => 'utf-8');

if (param) {
  my $encoding = param("encoding");
  my $avigraha = param("vigraha");

  #print "avigraha = $avigraha\n";
  #print "encoding = $encoding\n";
  $avigraha =~ /^([^\+ ]+)\+?([^ ]*) ([^\+ ]+)\+?([^ ]*) \(([1-8].[1-4].[0-9]+)\)/;
  my $p1 = $1; 
  my $s1 = $2; 
  my $p2 = $3; 
  my $s2 = $4; 
  my $sUwra = $5; 

  $avigraha =~ s/ \(([1-8].[1-4].[0-9]+)\)//;

  #print "Calling samAsaprakAra.out";
  my $cmd = "$myPATH/samAsaprakAra.out \"$encoding\" \"$avigraha\" \"$p1\" \"$s1\" \"$p2\" \"$s2\" \"$sUwra\"";
  #print "cmd = $cmd";
  system($cmd);
}
