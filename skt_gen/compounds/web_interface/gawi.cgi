#!/usr/bin/env perl
#
#
#  Copyright (C) 2012-2023 Amba Kulkarni (ambapradeep@gmail.com)
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
require "../../paths.pl";
require "$GlblVar::SCLINSTALLDIR/cgi_interface.pl";


$myPATH="$GlblVar::SCLINSTALLDIR/skt_gen/compounds";
require "$myPATH/cnvrt2utf.pl";
require "$myPATH/cnvrt2utfr.pl";

use warnings;
#use CGI ':standard';

#my $cgi = new CGI;

#print $cgi->header(-type    => 'text/html',
#                   -charset => 'utf-8');

print "Content-type:text/html;-expires:60*60*24;charset:UTF-8\n\n";

my %param = &get_parameters();

#if (param) {
  my $encodinggawi = $param{encodinggawi};
  my $avigrahagawi = $param{vigrahagawi};
  my $p1gawi = $param{p1gawi};
  my $p2gawi = $param{p2gawi};
  my $s1gawi = $param{s1gawi};
  my $s2gawi = $param{s2gawi};
  my $samAsaprakAragawi = $param{samAsaprakAragawi};
  my $samAsAnwagawi = $param{samAsAnwagawi};
  my $viXAyakasUwragawi = $param{viXAyakasUwragawi};
  my $positiongawi = $param{positiongawi};
  my $gawisUwragawi = $param{gawisUwra};
  my $ansgawi = $param{ansgawi};

  my $p1utf = &cnvrt2utf($p1gawi);
  my $p2utf = &cnvrt2utf($p2gawi);
  my $avigraha2utf = &cnvrt2utf($avigrahagawi);

  if ($encodinggawi eq "RMN") {
    $p1utfr = &cnvrt2utfr($p1utf);
    $p2utfr = &cnvrt2utfr($p2utf);
    $avigraha2utfr = &cnvrt2utfr($avigraha2utf);
    $gawisUwrautfr = &cnvrt2utfr($gawisUwra);
  }

  print "<table>\n";
  print "<tr>";
  if ($encodinggawi eq "RMN") {
    print "<td> <font color=\"blue\">$avigraha2utfr </font></td>\n";
  } else {
    print "<td> <font color=\"blue\">$avigraha2utf </font></td>\n";
  }

  if ($ansgawi eq "No") {$positiongawi = 3 - $positiongawi;} # 1 -> 2; 2 -> 1
  if ($positiongawi == 3) { $positiongawi = 0;}

  if ($positiongawi == 1) { 
      if ($encodinggawi eq "DVNG") {
        print "<td><font color=\"green\">गति  संज्ञा : $p1utf <rfont></td>";
        print "<td> <font color=\"red\">$gawisUwra </font></td>\n";
      } else {
        print "<td><font color=\"green\"> gati  saṃjñā : $p1utfr <font></td>";
        print "<td> <font color=\"red\">$gawisUwrautfr </font></td>\n";
      }
  } elsif ($positiongawi == 2) { 
      if ($encodinggawi eq "DVNG") {
        print "<td><font color=\"green\">गति  संज्ञा : $p2utf <font></td>";
        print "<td> <font color=\"red\">$gawisUwra </font></td>\n";
      } else {
        print "<td><font color=\"green\"> gati  saṃjñā : $p2utfr <font></td>";
        print "<td> <font color=\"red\">$gawisUwrautfr </font></td>\n";
      }
      # vigraha vAkya with changed order
      $avigrahagawi = $p2gawi;
      if($s2gawi ne "") {$avigrahagawi .= "+".$s2gawi;}
      $avigrahagawi .= " ".$p1gawi;
      if($s1gawi ne "") {$avigrahagawi .= "+".$s1gawi;}
  } elsif ($positiongawi == 0) {
        print "Can not decide the upasarjana saFjFA. <br>";
        print "Compound can not be formed.<br>";
        print "Exiting ...";
        exit;
  } 

       print "<td><form name=\"f3\" method=\"post\" />\n
       <input type=\"hidden\" name=\"encodingupasarjana\" id=\"encodingupasarjana\" value=\"$encodinggawi\" />\n
       <input type=\"hidden\" name=\"vigrahaupasarjana\" id=\"vigrahaupasarjana\" value=\"$avigrahagawi\" />\n
       <input type=\"hidden\" name=\"p1upasarjana\" id=\"p1upasarjana\" value=\"$p1gawi\" />\n
       <input type=\"hidden\" name=\"p2upasarjana\" id=\"p2upasarjana\" value=\"$p2gawi\" />\n
       <input type=\"hidden\" name=\"s1upasarjana\" id=\"s1upasarjana\" value=\"$s1gawi\" />\n
       <input type=\"hidden\" name=\"s2upasarjana\" id=\"s2upasarjana\" value=\"$s2gawi\" />\n
       <input type=\"hidden\" name=\"samAsaprakAraupasarjana\" id=\"samAsaprakAraupasarjana\" value=\"$samAsaprakAragawi\" />\n
       <input type=\"hidden\" name=\"samAsAnwaupasarjana\" id=\"samAsAnwaupasarjana\" value=\"$samAsAnwagawi\" />\n
       <input type=\"hidden\" name=\"viXAyakasUwraupasarjana\" id=\"viXAyakasUwraupasarjana\" value=\"$viXAyakasUwragawi\" />\n
       <input type=\"hidden\" name=\"positionupasarjana\" id=\"positionupasarjana\" value=\"$positiongawi\" />\n
       <input type=\"hidden\" name=\"dividupasarjana\" id=\"dividupasarjana\" value=\"#output4\" />\n";
       if ($encodinggawi eq "DVNG") {
         print "<input type=\"submit\" name=\"ansupasarjana\" value=\"उपसर्जन संज्ञा निर्धारण\" id=\"ansupasarjana\" onclick=\"return upasarjanaNullcgi()\" />\n";
       } else {
         print "<input type=\"submit\" name=\"ansupasarjana\" value= \"upasarjana saṃjñā nirdhāraṇa\" id=\"ansupasarjana\" onclick=\"return upasarjanaNullcgi()\" />\n";
       }
     print "</form></td></tr></table>";
     #}
