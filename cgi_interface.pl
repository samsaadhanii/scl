#!/usr/bin/env perl

# The following code has been added by me to handle the CGI interface
# Earlier CGI.pm was being used. But since this has been removed from the Core Perl, I have removed CGI.pm from all the cgi programmes and included this file (cgi_interface.pl) to take care of input methods through cgi.
#
# 27th Sep 2019
#

use Encode qw/ decode /;

sub get_parameters {
	my($decode) = @_;

 my ($buffer, @pairs, $pair, $name, $value, %FORM);

# Read in text
 
$ENV{'REQUEST_METHOD'} =~ tr/a-z/A-Z/;

if ($ENV{'REQUEST_METHOD'} eq "POST") {
   read(STDIN, $buffer, $ENV{'CONTENT_LENGTH'});
} else {
   $buffer = $ENV{'QUERY_STRING'};
}

# Split information into name/value pairs
@pairs = split(/&/, $buffer);

foreach $pair (@pairs) {
   ($name, $value) = split(/=/, $pair);
   $value =~ tr/+/ /;
   $value =~ s/%(..)/pack("C", hex($1))/eg;
   if($decode eq "decode") { $FORM{$name} = decode('UTF-8', $value);}
   else {$FORM{$name} = $value;}
}
%FORM;
}
1;
