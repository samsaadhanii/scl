#!/usr/bin/env perl
#
#
#  Copyright (C) 2010-2013 Karunakar
#  2014-2021 Amba Kulkarni (ambapradeep@gmail.com)
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
require "$GlblVar::SCLINSTALLDIR/cgi_interface.pl";

package main;

#use CGI qw/:standard/;

#my $cgi = new CGI;
#print $cgi->header (-charset => 'UTF-8');

#@params = param;

 print "Content-type:text/html;charset:UTF-8\n\n";

my %param = &get_parameters("nodecode");

my $dic_name = $param{dic};
my $word = $param{word};
my $outencoding = $param{outencoding};
my $word_wx = "";

$Files_Path = "$GlblVar::SCLINSTALLDIR/SHMT/data";

chomp $word;
# converting word utf8 to wx to get filename
if ($outencoding eq "DEV") {
  $word_wx = `echo $word | $GlblVar::SCLINSTALLDIR/converters/utf82wx.sh $GlblVar::SCLINSTALLDIR`;
  chomp($word_wx);
  $sword = $word;
}elsif($outencoding eq "IAST"){
  $word_wx = `echo $word | $GlblVar::SCLINSTALLDIR/converters/utf8roman2wx.out`;
  chomp($word_wx);
  $sword = `echo $word_wx | $GlblVar::SCLINSTALLDIR/converters/wx2utf8.sh $GlblVar::SCLINSTALLDIR`;
  chomp($sword);
}

#grep the 1st character in a word;
$word_wx =~ /^(.)/;
$l = $1;
#forming file name using dic_name and Word
chomp $dic_name;
if($dic_name eq "apte"){
	$filename = "$Files_Path/hi/Apte_dict/$l.xml";
}
elsif($dic_name eq "heritage"){
	$l = &get_Heritage_Index($word_wx);
	if($l eq "") {
           print "\n$sword not found in ";
           print "Heritage Sanskrit-French dictionary\n";
        } else {
	   $filename = "$Files_Path/fr/Heritage/$l.html";
        }
}
elsif($dic_name eq "mw"){
	$filename = "$Files_Path/en/MW/$l.new.html";
}

if($sword ne ""){
   if($dic_name ne "amara") {
	  open(TMP,"$filename") || die print "$filename does not exist";
   }
}
         if($dic_name  eq "amara"){
	    system("$GlblVar::SCLINSTALLDIR/amarakosha/relations.sh NULL 'paryAyavAcI' $word_wx DEV $GlblVar::SCLINSTALLDIR");
	    $found = 1;
	 }
	 elsif($dic_name  eq "apte"){
		$found = &apte_result($sword); #finding word in apt xml files
	 }
	 elsif($dic_name  eq "mw"){
		$found = &mw_result($sword); #finding word in mw files
	 }
	 elsif($dic_name  eq "heritage"){
		$found = &heritage_result($word_wx); #finding word in Heritage files
	 }
close(TMP);

if (!$found){
 print "\n$sword not found in ";
 if($dic_name eq "apte") {
    print "Apte's Sanskrit-Hindi dictionary\n";
 }
 if($dic_name eq "mw") {
    print "Monier-William's Sanskrit-English dictionary\n";
 }
 if($dic_name eq "heritage") {
    print "Heritage Sanskrit-French dictionary\n";
 }
}

sub apte_result{
	my($sword) = @_;
my $result = "";
        my $found = 0;
	$/ = "</lexhead>";
		while($in = <TMP>){
			$lexcount = 0;
				if($in =~ /<prAwipaxikam>$sword<\/prAwipaxikam>/ or $in =~ /<root>$sword<\/root>/ ){
					$result = &get_exact_data($in);
					$result =~ s/<segmenthd>/<div style=\"background:green;\">segmenthd<\/div>/g;
					$result =~ s/<subsegmenthd>/<div style=\"background:green;\">subsegmenthd<\/div>/g;
					$result =~ s/<sense no?=\"([0-9]+)\">/<br\/>$1. /g;
					$result =~ s/<citation>/(/g;
					$result =~ s/<\/citation>/)/g;
					$result =~ s/<\/?[a-z]+>//g;
					$result  =~ s/>$sword</><span style=\"background:yellow;\">$sword<\/span></g;
					print "<div style=\"border:1px solid #2175bc;text-align:justify; margin-top:10px;\"><div id=\"apte\">Apte-Dictionary</div>$result</div><br/>";
        				$found = 1;
				}
		   }
$found;
}	
1;

sub get_exact_data{
my $result = "";
	my $line = $_[0];
	@lines = split(/<segmenthd>/,$line);
	foreach $lines (@lines){
		if($lines =~ /<prAwipaxikam>$sword<\/prAwipaxikam>/ or $lines =~ /<root>$sword<\/root>/ ){
                        $lines =~ s/<jAwi>[^<]+<\/jAwi>//g;
                        $lines =~ s/<upAXi>[^<]+<\/upAXi>//g;
                        $lines =~ s/<kind_of>[^<]+<\/kind_of>//g;
			$result .= $lines;
		}
	}
$result;
}
1;
#getting mw result

sub mw_result{
	my($sword) = @_;
        my $found = 0;
	while($in = <TMP>){
		if($in =~ /<span class=\"Deva\">$sword<\/span>/ and $count == 0 and $in =~ /^<xml>/){
 		    	  $in =~ s/<span class=\"Deva\">$sword<\/span>/<span class=\"Deva\" style=\"background:yellow;\">$sword<\/span>/g;;
       			  print "<div style=\"border:1px solid #2175bc;text-align:justify;margin-top:10px;\"><div id=\"mw\">MW</div>$in";
               		  $count =1;
                          $found = 1;
      		}
       		elsif($count == 1 and $in !~/<\/xml>/){
        		 print "$in";
     		}
        	elsif($count == 1 and $in =~ /<\/xml>/){
        		$count = 0;
        		print "</div>";
       		}
	}
$found;
}
1;

sub heritage_result{
	my($word_wx) = @_;
        my $found = 0;
	$w = `echo $word_wx | $GlblVar::SCLINSTALLDIR/converters/wx-velthuis.out`;
	chomp($w);
	$w =~ s/[ \t\n]//g;
	#print "w = $w###\n";
	$/ = "<span class=\"deva\" lang=\"sa\">";
	while($in = <TMP>){
		if($in =~ /<a class=\"navy\" name=\"$w\">/){
       			  print "<div style=\"border:1px solid #2175bc;text-align:justify;margin-top:10px;\"><div id=\"heritage\">Heritage</div>$in";
                          $found = 1;
      		}
	}
$found;
}

# Following code corresponds to the Ocaml code ML/Chapters.ml
sub get_Heritage_Index {
	my ($w) = @_;
	my $index = "";
	if($w =~ /^a[kKgGfcCjJFtTdDNwW]/) { $index = "1";}
	elsif($w =~ /^a[xX]/) { $index = "2";}
	elsif($w =~ /^an[aAiI]/) { $index = "2";}
	elsif($w =~ /^an[^aAiI]/) { $index = "3";}
	elsif($w =~ /^a[pPb]/) { $index = "4";}
	elsif($w =~ /^a[Bmy]/) { $index = "5";}
	elsif($w =~ /^a[rl]/) { $index = "6";}
	elsif($w =~ /^a[vSR]/) { $index = "7";}
	elsif($w =~ /^as[aAiIuUqeEoOkKgGfcCjJFtTdDN]/) { $index = "7";}
	elsif($w =~ /^as[wWxXnpPbBmyrlvSRsh]/) { $index = "8";}
	elsif($w =~ /^ah/) { $index = "8";}
	elsif($w =~ /^ah/) { $index = "8";}
	elsif($w =~ /^A[MkKgGfcCjJFtTdDNwWxXnpPbB]/) { $index = "9";}
	elsif($w =~ /^A[myrlvSRsh]/) { $index = "10";}
	elsif ($w =~ /^i/) { $index = "11";}
	elsif ($w =~ /^I/) { $index = "12";}
	elsif ($w =~ /^u[MkKgGfcCjJFtTdDN]/) { $index = "13";}
	elsif ($w =~ /^u[wWxXn]/) { $index = "14";}
	elsif ($w =~ /^u[pPbBmyrlvS]/) { $index = "15";}
	elsif ($w =~ /^u[Rsh]/) { $index = "16";}
	elsif ($w =~ /^[qQLeEoO]/) { $index = "17";}
	elsif ($w =~ /^ka[kKgGfcCjJFtTdDNwWxX]/) { $index = "18";}
	elsif ($w =~ /^ka[npPbBmyrlvSRsh]/) { $index = "19";}
	elsif ($w =~ /^kA[kKgGfcCjJFtTdDNwWxXnpPbBm]/) { $index = "20";}
	elsif ($w =~ /^kA[yrlvSRsh]/) { $index = "21";}
	elsif ($w =~ /^k[iIuU]/) { $index = "21";}
	elsif ($w =~ /^k[qQLeEoOMkKgGfcCjJFtTdDNwWxXnpPbBmyrlv]/) { $index = "22";}
	elsif ($w =~ /^k[SRsh]/) { $index = "23";}
	elsif ($w =~ /^K/) { $index = "23";}
	elsif ($w =~ /^g[aAiIuU]/) { $index = "24";}
	elsif ($w =~ /^g[^aAiIuU]/) { $index = "25";}
	elsif ($w =~ /^[Gf]/) { $index = "25";}
	elsif ($w =~ /^[cC]/) { $index = "26";}
	elsif ($w =~ /^j/) { $index = "27";}
	elsif ($w =~ /^[JFtTdDN]/) { $index = "28";}
	elsif ($w =~ /^wa/) { $index = "28";}
	elsif ($w =~ /^w[AiIuU]/) { $index = "29";}
	elsif ($w =~ /^w[^aAiIuU]/) { $index = "30";}
	elsif ($w =~ /^x[aA]/) { $index = "31";}
	elsif ($w =~ /^x[iIuUqQL]/) { $index = "32";}
	elsif ($w =~ /^xe[kKgGfcCjJFtTdDNwWxXnpPbBmyrlv]/) { $index = "33";}
	elsif ($w =~ /^X/) { $index = "34";}
	elsif ($w =~ /^na/) { $index = "34";}
	elsif ($w =~ /^nA/) { $index = "35";}
	elsif ($w =~ /^ni/) { $index = "36";}
	elsif ($w =~ /^nI/) { $index = "37";}
	elsif ($w =~ /^pa[kKgGfcCjJFtTdDNwWxXnpPbBmy]/) { $index = "38";}
	elsif ($w =~ /^pa[rlvSRsh]/) { $index = "39";}
	elsif ($w =~ /^pA/) { $index = "40";}
	elsif ($w =~ /^p[iIuUeE]/) { $index = "41";}
	elsif ($w =~ /^p[oOkKgGfcCjJFtTdDNwWxXnpPbBmy]/) { $index = "42";}
	elsif ($w =~ /^pra[kKgGfcCjJFtTdDN]/) { $index = "43";}
	elsif ($w =~ /^pra[wWxXnpP]/) { $index = "43";}
	elsif ($w =~ /^pra[bBmyrlvSRsh]/) { $index = "44";}
	elsif ($w =~ /^pr[^a]/) { $index = "45";}
	elsif ($w =~ /^p[lvSRsh]/) { $index = "45";}
	elsif ($w =~ /^P/) { $index = "45";}
	elsif ($w =~ /^ba[kKgGfcCjJFtTdDNwWxXnpPbBmyr]/) { $index = "45";}
	elsif ($w =~ /^ba[lvSRsh]/) { $index = "46";}
	elsif ($w =~ /^B[aAiIuUqQ]/) { $index = "47";}
	elsif ($w =~ /^B[^aAiIuUqQ]/) { $index = "48";}
	elsif ($w =~ /^ma[kKgGfcCjJFtTdDNwWxX]/) { $index = "48";}
	elsif ($w =~ /^ma[npPbBmy]/) { $index = "49";}
	elsif ($w =~ /^ma[rlvSRsh]/) { $index = "50";}
	elsif ($w =~ /^mA/) { $index = "50";}
	elsif ($w =~ /^m[iIu]/) { $index = "51";}
	elsif ($w =~ /^mU/) { $index = "52";}
	elsif ($w =~ /^y/) { $index = "53";}
	elsif ($w =~ /^r[aAiIuUqQLeE]/) { $index = "54";}
	elsif ($w =~ /^r[^aAiIuUqQLeE]/) { $index = "55";}
	elsif ($w =~ /^la[kKgGfcCjJFtTdDNwWxXnpPbB]/) { $index = "55";}
	elsif ($w =~ /^la[myrlvSRsh]/) { $index = "56";}
	elsif ($w =~ /^l[^a]/) { $index = "56";}
	elsif ($w =~ /^va/) { $index = "57";}
	elsif ($w =~ /^vA/) { $index = "58";}
	elsif ($w =~ /^vi[^pPbBmyrlvSRsh]/) { $index = "59";}
	elsif ($w =~ /^vi[pPbBmyrlvS]/) { $index = "60";}
	elsif ($w =~ /^vi[Rsh]/) { $index = "61";}
	elsif ($w =~ /^v[IuU]/) { $index = "61";}
	elsif ($w =~ /^v[qQeEoOkKgGfcCjJFtTdDNwWxXnpPbBmyrlvSRsh]/) { $index = "62";}
	elsif ($w =~ /^S[aAiI]/) { $index = "63";}
	elsif ($w =~ /^S[^aAiI]/) { $index = "64";}
	elsif ($w =~ /^R/) { $index = "65";}
	elsif ($w =~ /^sa[^npPbBmyrlvSRsh]/) { $index = "66";}
	elsif ($w =~ /^san/) { $index = "67";}
	elsif ($w =~ /^sa[pPbBmy]/) { $index = "68";}
	elsif ($w =~ /^sa[rlvSRsh]/) { $index = "69";}
	elsif ($w =~ /^s[Ai]/) { $index = "69";}
	elsif ($w =~ /^sI/) { $index = "70";}
	elsif ($w =~ /^su[^rlvSRsh]/) { $index = "70";}
	elsif ($w =~ /^su[rlvSRsh]/) { $index = "71";}
	elsif ($w =~ /^s[UqQLeEoOkKgGfcCjJFtTdDNwWxX]/) { $index = "71";}
	elsif ($w =~ /^s[npPbBmyrlvSRsh]/) { $index = "72";}
	elsif ($w =~ /^h/) { $index = "73";}
	$index;
}
