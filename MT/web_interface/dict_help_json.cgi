#!/usr/bin/env perl
#
#  2021-2023 Amba Kulkarni (ambapradeep@gmail.com)
#
#  This program is free software; you can redistribute it and/or
#  modify it under the terms of the GNU General Public License
#  as published by the Free Software Foundation; either
#  version 2 of the License, or (at your option) any later
#  version.
#
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with this program; if not, write to the Free Software
#  Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.


use utf8;
use Encode qw/ decode /;

require "../paths.pl";
require "$GlblVar::CGIDIR/$GlblVar::SCL_CGI/cgi_interface.pl";
require "$GlblVar::CGIDIR/$GlblVar::SCL_CGI/MT/get_dict_entry.pl";

package main;

my %param = &get_parameters("nodecode");

my $word = $param{word};

print "Access-Control-Allow-Origin: *\n";
print "Content-type:text/html;-expires:60*60*24;charset:UTF-8\n\n";

print "[\n";
&call_dict("apte",$word);
&call_dict("mw",$word);
&call_dict("heritage",$word);
print "]\n";


sub call_dict{
	my($dict,$word) = @_;

        print "{\"Word\":\"$word\",\n";
        if($dict eq "apte") {
           print "\"DICT\":\"Apte's Skt-Hnd Dict\",\n";
           $result = &get_dict_entry("apte",$word,"DEV");
	   chomp($result);
           $result =~ s/<\/br>/ /g;
           #$result =~ s/\// /g;
           $result =~ s/\n/ /g;
           $result =~ s/"/'/g;
           print "\"Meaning\":\"$result\"},\n";
        }
        if($dict eq "mw") {
           print "\"DICT\":\"Monier Williams' Skt-Eng Dict\",\n";
           $result = &get_dict_entry("mw",$word,"DEV");
	   chomp($result);
           $result =~ s/\n/ /g;
           $result =~ s/<p>/ /g;
           $result =~ s/<p xmlns="">/ /g;
           $result =~ s/<hr xmlns="">/ /g;
           $result =~ s/<\/p>/ /g;
           $result =~ s/"/'/g;
           $result =~ s/<div [^>]+>//g;
           $result =~ s/<span [^>]+>//g;
           $result =~ s/<\/span>//g;
           $result =~ s/<a [^>]+>//g;
           $result =~ s/<\/a>//g;
           $result =~ s/<\/i>//g;
           $result =~ s/<i>//g;
           $result =~ s/^[ \t]+//g;

           print "\"Meaning\":\"$result\"},\n";
        }
        if($dict eq "heritage") {
           print "\"DICT\":\"Heritage Skt-French Dict\",\n";
           $result = &get_dict_entry("heritage",$word,"DEV");
	   chomp($result);
           $result =~ s/\n/ /g;
           $result =~ s/<p><\/p>/ /g;
           $result =~ s/<br>/ /g;
           $result =~ s/"/'/g;
           print "\"Meaning\":\"$result\"}\n";
        }
	if($dict eq "ccs") {
           print "\"DICT\":\"Cappeller's Skt-Ger Dict\",\n";
           $result = &get_dict_entry("ccs",$word,"DEV");
	   chomp($result);
           $result =~ s/\n/ /g;
           $result =~ s/<p><\/p>/ /g;
           $result =~ s/<br>/ /g;
           $result =~ s/"/'/g;
           print "\"Meaning\":\"$result\"}\n";
        }
}
1;

