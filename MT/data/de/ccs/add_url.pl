#!/usr/bin/perl
#

while($in = <STDIN>){
#	$in =~ s/!CGIDECL/\/cgi-bin\/SKT\/sktdeclin/g;
#	$in =~ s/!CGICONJ/\/cgi-bin\/SKT\/sktconjug/g;
#	$in =~ s/href="([0-9])/href="\/scl\/MT\/data\/de\/css\/$1/g;
#	$in =~ s/href="\/cgi-bin\/scl/href="\/scl/g;
#	$in =~ s/scl\/MT\/data\/de\/ccs/SCL_HTDOCS\/MT\/data\/de\/ccs/g;
#	$in =~ s/cgi-bin\/SKT/cgi-bin\/HERITAGE_CGI_DIR/g;
	$in =~ s/\/cgi-bin\/HERITAGE_CGI_DIR\/sktdeclin/\/cgi-bin\/HERITAGE_CGI_DIR\/sktdeclin.cgi/g;
	$in =~ s/\/cgi-bin\/HERITAGE_CGI_DIR\/sktconjug/\/cgi-bin\/HERITAGE_CGI_DIR\/sktconjug.cgi/g;
	print $in;
}
