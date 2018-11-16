#!/usr/bin/perl

require "../../paths.pl";
my $myPATH ="$GlblVar::HTDOCSDIR/scl/skt_gen/compounds";

use warnings;
use CGI ':standard';

my $cgi = new CGI;

print $cgi->header(-type    => 'text/html',
                   -charset => 'utf-8');

if (param) {
  my $expert = param("expert");

  if(! (-e "$GlblVar::TFPATH")) { system("mkdir -p $GlblVar::TFPATH");}
  &display_index($expert);

}

sub display_index {
 my ($expert) = @_;
    if ($expert eq "No") {
       system ("cat $myPATH/index_dev.html");
    }

    if ($expert eq "Yes") {
       system ("cat $myPATH/expert.html");
    }
}
1;
