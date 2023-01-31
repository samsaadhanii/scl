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


#use utf8;
require "../../paths.pl";
require "$GlblVar::SCLINSTALLDIR/cgi_interface.pl";


my $myPATH = "$GlblVar::SCLINSTALLDIR/skt_gen/compounds";
require "$myPATH/cnvrt2utf.pl";
require "$myPATH/cnvrt2utfr.pl";

use warnings;
#use CGI ':standard';

#my $cgi = new CGI;

#print $cgi->header(-type    => 'text/html',
#                   -charset => 'utf-8');

 print "Content-type:text/html;-expires:60*60*24;charset:UTF-8\n\n";

  my %param = &get_parameters("nodecode");

#if (param) {
  my $encodingpUrvanipAwa = $param{encodingpUrvanipAwa};
  my $avigrahapUrvanipAwa = $param{vigrahapUrvanipAwa};
  my $p1pUrvanipAwa = $param{p1pUrvanipAwa};
  my $p2pUrvanipAwa = $param{p2pUrvanipAwa};
  my $s1pUrvanipAwa = $param{s1pUrvanipAwa};
  my $s2pUrvanipAwa = $param{s2pUrvanipAwa};
  my $samAsaprakArapUrvanipAwa = $param{samAsaprakArapUrvanipAwa};
  my $samAsAnwapUrvanipAwa = $param{samAsAnwapUrvanipAwa};
  my $viXAyakasUwrapUrvanipAwa = $param{viXAyakasUwrapUrvanipAwa};
  my $positionpUrvanipAwa = $param{positionpUrvanipAwa};
  my $sUwrapUrvanipAwa = $param{sUwrapUrvanipAwa};
  my $dividpUrvanipAwa = $param{dividpUrvanipAwa};
  my $anspUrvanipAwa = $param{anspUrvanipAwa};

  $p1utf = &cnvrt2utf($p1pUrvanipAwa);
  $p2utf = &cnvrt2utf($p2pUrvanipAwa);
  $avigraha2utf = &cnvrt2utf($avigrahapUrvanipAwa);

  if ($encodingpUrvanipAwa eq "RMN"){
      $p1utfr = &cnvrt2utfr($p1utf);
      $p2utfr = &cnvrt2utfr($p2utf);
      $sUwrautfr = &cnvrt2utfr($sUwrapUrvanipAwa);
  }

  $dividpUrvanipAwa =~ s/^#output//;
  $dividpUrvanipAwa++;

  print "<table>";
  if ($anspUrvanipAwa eq "No") {$positionpUrvanipAwa = 2;}
  if ($anspUrvanipAwa eq "Yes") {$positionpUrvanipAwa = 1;}

  if ($positionpUrvanipAwa == 1) { 
    if ($encodingpUrvanipAwa eq "RMN"){
      print "<td><font color=\"green\"> pūrvanipātaḥ
  $p1utfr </font></td>";
      print "<td><font color=\"red\">  $sUwrautfr </font></td>";
    } else {
      print "<td><font color=\"green\"> पूर्वनिपातः $p1utf </font></td>";
      print "<td><font color=\"red\">  $sUwrapUrvanipAwa </font></td>";
    }
  }
  elsif ($positionpUrvanipAwa == 2) { 
    if ($encodingpUrvanipAwa eq "RMN"){
      print "<td><font color=\"green\"> pūrvanipātaḥ
 $p2utfr </font></td>";
      print "<td><font color=\"red\">  $sUwrautfr </font></td>";
    } else {
      print "<td><font color=\"green\"> पूर्वनिपातः $p2utf </font></td>";
      print "<td><font color=\"red\">  $sUwrapUrvanipAwa </font></td>";
    }
      # Vigraha vAkya with changed order of components
      $avigrahapUrvanipAwa = $p2pUrvanipAwa;
      if($s2pUrvanipAwa ne "") {$avigrahapUrvanipAwa .= "+".$s2pUrvanipAwa;}
      $avigrahapUrvanipAwa .= " ".$p1pUrvanipAwa;
      if($s1pUrvanipAwa ne "") {$avigrahapUrvanipAwa .= "+".$s1pUrvanipAwa;}
      $avigraha2utf = &cnvrt2utf($avigrahapUrvanipAwa);

      $tmp = $p1pUrvanipAwa;
      $p1pUrvanipAwa = $p2pUrvanipAwa;
      $p2pUrvanipAwa = $tmp;

      $tmp = $s1pUrvanipAwa;
      $s1pUrvanipAwa = $s2pUrvanipAwa;
      $s2pUrvanipAwa = $tmp;
  }
  elsif ($positionpUrvanipAwa eq "0") { 
        print "Can not decide the upasarjana saFjFA. <br>";
        print "Compound can not be formed.<br>";
        print "Exiting ...";
        exit;
  } 
  if ($encodingpUrvanipAwa eq "RMN") {
    my $avigraha2utfr = &cnvrt2utfr($avigraha2utf);
    print "<tr><td><font color=\"blue\">$avigraha2utfr</font></td>";
  } else {
    print "<tr><td><font color=\"blue\">$avigraha2utf</font></td>";
  }

  # Note the chaged order of components
  my $cmd = "$myPATH/aluk.out \"$encodingpUrvanipAwa\" \"$avigrahapUrvanipAwa\" \"$p1pUrvanipAwa\" \"$s1pUrvanipAwa\" \"$p2pUrvanipAwa\" \"$s2pUrvanipAwa\" \"$samAsaprakArapUrvanipAwa\" \"$samAsAnwapUrvanipAwa\" $dividpUrvanipAwa";
  system($cmd);
  #}
