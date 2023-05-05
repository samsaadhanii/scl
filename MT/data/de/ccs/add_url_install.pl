#!/usr/bin/perl
#

require "../../../../paths.pl";
while($in = <STDIN>){
	$in =~ s/SCL_HTDOCS/$GlblVar::SCL_HTDOCS/g;
	$in =~ s/HERITAGE_CGI_DIR/$GlblVar::HERITAGE_CGI_DIR/g;
	print $in;
}
