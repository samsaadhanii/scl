#!/usr/bin/perl
#

while($in = <STDIN>){
	$in =~ s/!CGIDECL/\/cgi-bin\/SKT\/sktdeclin/g;
	$in =~ s/!CGICONJ/\/cgi-bin\/SKT\/sktconjug/g;
	print $in;
}
