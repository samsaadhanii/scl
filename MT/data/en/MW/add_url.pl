#!/usr/bin/perl
#

while($in = <STDIN>){
#	$in =~ s/!CGIDECL/\/cgi-bin\/SKT\/sktdeclin/g;
#	$in =~ s/!CGICONJ/\/cgi-bin\/SKT\/sktconjug/g;
#	$in =~ s/href="([0-9])/href="\/scl\/MT\/data\/en\/MW\/$1/g;
	$in =~ s/href="\/scl/href="\/SCL_HTDOCS/g;
	$in =~ s/href="\/cgi-bin\/SKT/href="\/cgi-bin\/HERITAGE_CGI_DIR/g;
	print $in;
}
