#!/usr/bin/perl
#

require "../../../../paths.pl";
while($in = <STDIN>){
	$in =~ s/SCL_HTDOCS/$GlblVar::SCL_HTDOCS/g;
	$in =~ s/SCL_CGI/$GlblVar::SCL_CGI/g;
	print $in;
}
