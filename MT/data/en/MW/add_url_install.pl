#!/usr/bin/perl
#
# Heritage_cgi extension is assumed to be .cgi

require "../../../../paths.pl";
while($in = <STDIN>){
	$in =~ s/SCL_HTDOCS/$GlblVar::SCL_HTDOCS/g;
	$in =~ s/HERITAGE_CGI_DIR/$GlblVar::HERITAGE_CGI_DIR/g;
	print $in;
}
