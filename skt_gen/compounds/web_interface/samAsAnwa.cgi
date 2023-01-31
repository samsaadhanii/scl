#!/usr/bin/env perl

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


$| = 1;

#use utf8;
require "../../paths.pl";
require "$GlblVar::SCLINSTALLDIR/cgi_interface.pl";


my $myPATH = "$GlblVar::SCLINSTALLDIR/skt_gen/compounds/";

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
  my $encodingsamAsAnwa = $param{encodingsamAsAnwa};
  my $avigrahasamAsAnwa = $param{vigrahasamAsAnwa};
  my $p1samAsAnwa = $param{p1samAsAnwa};
  my $p2samAsAnwa = $param{p2samAsAnwa};
  my $s1samAsAnwa = $param{s1samAsAnwa};
  my $s2samAsAnwa = $param{s2samAsAnwa};
  my $viXAyakasUwrasamAsAnwa = $param{viXAyakasUwrasamAsAnwa};
  my $samAsaprakArasamAsAnwa = $param{samAsaprakArasamAsAnwa};
  my $samAsAnwa = $param{samAsAnwa};
  my $sUwrasamAsAnwa = $param{sUwrasamAsAnwa};
  my $anssamAsAnwa = $param{anssamAsAnwa};

 if ($anssamAsAnwa eq "No") {$samAsAnwa = ""; $sUwrasamAsAnwa = "";}

  my $avigraha_utf = &cnvrt2utf($avigrahasamAsAnwa);
  my $samAsAnwa_utf = &cnvrt2utf($samAsAnwa);

  if ($encodingsamAsAnwa eq "RMN") {
     $avigraha_utfr = &cnvrt2utfr($avigraha_utf);
     $samAsAnwa_utfr = &cnvrt2utfr($samAsAnwa);
     $sUwra_utfr = &cnvrt2utfr($sUwrasamAsAnwa);
  }

      print "<table>";
      print "<tr>";

      if ($encodingsamAsAnwa eq "RMN") {
        print "<td> <font color=\"blue\">$avigraha_utfr</font></td>";
      } else {
        print "<td> <font color=\"blue\">$avigraha_utf</font></td>";
      }

      if($samAsAnwa eq "") {
        if ($encodingsamAsAnwa eq "RMN") {
            print "<td><font color=\"green\"> samāsāntapratyayaḥ   -- </font></td>";
        } else {
            print "<td><font color=\"green\">समासान्तप्रत्ययः   -- </font></td>";
        }
      } else {
        if ($encodingsamAsAnwa eq "RMN") {
            print "<td><font color=\"green\"> samāsāntapratyayaḥ  $samAsAnwa_utfr </font></td>";
        } else {
            print "<td><font color=\"green\">समासान्तप्रत्ययः $samAsAnwa_utf </font></td>";
        }
      }
      if ($encodingsamAsAnwa eq "RMN") {
        print "<td><font color=\"red\">$sUwra_utfr </font></td>";
      } else {
        print "<td><font color=\"red\">$sUwrasamAsAnwa </font></td>";
      }
      print "</tr>";
      print "<tr>";
      if ($encodingsamAsAnwa eq "RMN") {
        print "<td> <font color=\"blue\">$avigraha_utfr ";
      } else {
        print "<td> <font color=\"blue\">$avigraha_utf ";
      }

      if($samAsAnwa ne "") {
          if ($encodingsamAsAnwa eq "RMN") {
            print " $samAsAnwa_utfr </font></td>";
          } else {
            print " $samAsAnwa_utf </font></td>";
          }
      } else { print "</font></td>";}

      if ($encodingsamAsAnwa eq "RMN"){
        print "<td><font color=\"green\"> prātipadikasaṃjñā </font></td>";
        print "<td><font color=\"red\"> kṛttaddhitasamāsāśca 1.2.46 </font></td>";
      } else {
        print "<td><font color=\"green\"> प्रातिपदिकसंज्ञा</font></td>";
        print "<td><font color=\"red\"> कृत्तद्धितसमासाश्च 1.2.46</font></td>";
      }
      my $cmd = "$myPATH/upasarjana.out \"$encodingsamAsAnwa\" \"$avigrahasamAsAnwa\" \"$p1samAsAnwa\" \"$s1samAsAnwa\" \"$p2samAsAnwa\" \"$s2samAsAnwa\" \"$viXAyakasUwrasamAsAnwa\" \"$samAsaprakArasamAsAnwa\" \"$samAsAnwa\"";
      system($cmd);
      #}
