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


use utf8;
require "../../paths.pl";
require "$GlblVar::SCLINSTALLDIR/cgi_interface.pl";

my $myPATH = "$GlblVar::SCLINSTALLDIR/skt_gen/compounds";
require "$myPATH/cnvrt2utfr.pl";

use warnings;
#use CGI ':standard';

#my $cgi = new CGI;

#print $cgi->header(-type    => 'text/html',
#                   -charset => 'utf-8');

print "Content-type:text/html;-expires:60*60*24;charset:UTF-8\n\n";
my %param = &get_parameters();

#if (param) {
  my $encodingaluk = $param{encodingaluk};
  my $avigrahaaluk = $param{vigrahaaluk};
  my $p1aluk = $param{p1aluk};
  my $p2aluk = $param{p2aluk};
  my $s1aluk = $param{s1aluk};
  my $s2aluk = $param{s2aluk};
  my $samAsaprakAraaluk = $param{samAsaprakAraaluk};
  my $samAsAnwaaluk = $param{samAsAnwaaluk};
  my $alukviBARA = $param{alukviBARA};
  my $dividaluk = $param{dividaluk};
  my $ansaluk = $param{ansaluk};
  
 # aluk = 2: viBARA; aluk + no aluk
 # aluk = 1: aluk
 # aluk = 0: no aluk

  $dividaluk =~ s/#output//;
  $dividaluk++;

  if ($ansaluk eq "No") {$alukviBARA = "0";}

  if ($alukviBARA ne "0") { #do aluk kArya
    if ($ansaluk ne "NULL") {
       if($encodingaluk eq "RMN") {
         my $sUwrautfr = &cnvrt2utfr($sUwraaluk);
         print "<font color = \"red\"> $sUwrautfr </font> <br/>";
       } else {
         print "<font color = \"red\"> $sUwraaluk </font> <br/>";
       }
    }
      $cmd = "$myPATH/alukkArya.out \"$encodingaluk\" \"$p1aluk\" \"$s1aluk\" \"$p2aluk\" \"$s2aluk\"";
      system($cmd);
  }
  if ($alukviBARA ne "1") {  # Do non-aluk kArya
      $cmd = "$myPATH/nonalukkArya.out \"$encodingaluk\" \"$p1aluk\" \"$s1aluk\" \"$p2aluk\" \"$s2aluk\" \"$samAsAnwaaluk\" \"$samAsaprakAraaluk\" $dividaluk";
      system($cmd);
  }
  #}
