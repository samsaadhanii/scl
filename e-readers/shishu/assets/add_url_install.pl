#!/usr/bin/perl
#

require "../../../paths.pl";
while($in = <STDIN>){
	$in =~ s/SCL_CGI/$GlblVar::SCL_CGI/g;
	$in =~ s/CGIDIR/$GlblVar::CGIDIR/g;
	print $in;
}
