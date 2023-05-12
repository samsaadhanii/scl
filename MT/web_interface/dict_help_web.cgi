#!/usr/bin/env perl
#
#
#  Copyright (C) 2010-2013 Karunakar
#  2014-2023 Amba Kulkarni (ambapradeep@gmail.com)
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

print "Content-type:text/html;charset:UTF-8\n\n";

my %param = &get_parameters("nodecode");

my $dic_name = $param{dic};
my $word = $param{word};
my $outencoding = $param{outencoding};

if ($dic_name eq "apte") {
	$dic_long_name = "Apte's Sanskrit Hindi Dictionary\n";
}
elsif ($dic_name eq "mw") {
	$dic_long_name = "Monier William's Sanskrit English Dictionary\n";
}
elsif ($dic_name eq "heritage") {
	$dic_long_name = "Heritage Sanskrit French Dictionary\n";
}
elsif ($dic_name eq "ccs") {
	$dic_long_name = "Cappeller's Sanskrit German Dictionary\n";
}


#$dic_name="apte";
#$word="rAma";
#$encoding="WX";
$result = &get_dict_entry($dic_name,$word,$outencoding);
#print "result = $result";

if($dic_name eq "apte") {
     $result  =~ s/>$sword</><span style=\"background:yellow;\">$sword<\/span></g;
     print "<div style=\"border:1px solid #2175bc;text-align:justify; margin-top:10px;\"><div id=\"$dic_name\">$dic_long_name</div>$result</div><br/>";
}

if($dic_name eq "mw") {
 		    	  $result =~ s/<span class=\"Deva\">$sword<\/span>/<span class=\"Deva\" style=\"background:yellow;\">$sword<\/span>/g;;
       			  print "<div style=\"border:1px solid #2175bc;text-align:justify;margin-top:10px;\"><div id=\"$dic_name\">$dic_long_name</div>$result";
}

if($dic_name eq "heritage") {
			$w = `echo $sword | $GlblVar::SCLINSTALLDIR/converters/utf82wx.sh $GlblVar::SCLINSTALLDIR | $GlblVar::SCLINSTALLDIR/converters/wx-velthuis.out`;
        chomp($w);
        $w =~ s/[ \t\n]//g;
		          if($result =~ /<a class=\"navy\" name=\"$w#/){
       			  print "<div style=\"border:1px solid #2175bc;text-align:justify;margin-top:10px;\"><div id=\"$dic_name\">$dic_long_name</div>$result";
       		} elsif($result =~ /<a class=\"navy\" name=\"$w\"/){
       			  print "<div style=\"border:1px solid #2175bc;text-align:justify;margin-top:10px;\"><div id=\"$dic_name\">$dic_long_name</div>$result";
       		}
}

if($dic_name eq "ccs") {
 	$result =~ s/<span class=\"Deva\">$sword<\/span>/<span class=\"Deva\" style=\"background:yellow;\">$sword<\/span>/g;;
     print "<div style=\"border:1px solid #2175bc;text-align:justify; margin-top:10px;\"><div id=\"$dic_name\">$dic_long_name</div>$result</div><br/>";
}
1;
