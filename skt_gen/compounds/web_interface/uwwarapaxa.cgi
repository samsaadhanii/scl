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


my $myPATH = "$GlblVar::SCLINSTALLDIR/skt_gen/compounds";
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
  my $encodinguwwara = $param{encodinguwwara};
  my $p1uwwara = $param{p1uwwara};
  my $p2uwwara = $param{p2uwwara};
  my $samAsAnwauwwara = $param{samAsAnwauwwara};
  my $samAsaprakArauwwara = $param{samAsaprakArauwwara};
  my $sUwrastruwwara = $param{sUwrastruwwara};
  my $uwwarapaxastr = $param{uwwarapaxastr};
  my $dividuwwara = $param{dividuwwara};
  my $ansuwwara = $param{ansuwwara};

  if($ansuwwara eq "No") { $uwwarapaxastr = "";}

  #print "uwwarapaxastr = $uwwarapaxastr\n";
  #print "sUwrastr = $sUwrastruwwara\n";
  #print "samAsAnwa = $samAsAnwauwwara\n";

  my $p2utf = &cnvrt2utf($p2uwwara);
  my $u2utf = &cnvrt2utf($uwwarapaxastr);

  if ($encodinguwwara eq "RMN") {
     $p2utfr = &cnvrt2utf($p2utf);
     $u2utfr = &cnvrt2utf($u2utf);
     $sUwrastrutfr = &cnvrt2utf($sUwrastruwwara);
  }

  $dividuwwara =~ s/#output//;
  $dividuwwara++;

      #print "uwwarapaxastr = $uwwarapaxastr\n";
      if($uwwarapaxastr ne "") {
          if ($encodinguwwara eq "RMN") {
            print " $p2utfr \&gt; $u2utfr <font color=\"red\">$sUwrastrutfr</font><br />";
          } else {
            print " $p2utf \&gt; $u2utf <font color=\"red\">$sUwrastruwwara</font><br />";
          }
          $p2uwwara = $uwwarapaxastr;
      }
      #print "Calling paxakArya with samAsAnwa = $samAsAnwauwwara\n";
      #print "Calling paxakArya with samAsaprakAra = $samAsaprakArauwwara\n";
      $cmd = "$myPATH/paxakArya.out \"$encodinguwwara\" \"$p1uwwara\" \"$p2uwwara\" \"$samAsAnwauwwara\" \"$samAsaprakArauwwara\" $dividuwwara";
      system($cmd);
      #}
