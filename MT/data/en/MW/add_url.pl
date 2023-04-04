#!/usr/bin/perl
#

while($in = <STDIN>){
#	$in =~ s/!CGIDECL/\/cgi-bin\/SKT\/sktdeclin/g;
#	$in =~ s/!CGICONJ/\/cgi-bin\/SKT\/sktconjug/g;
	$in =~ s/href="([0-9])/href="\/scl\/MT\/data\/en\/MW\/$1/g;
	print $in;
}
