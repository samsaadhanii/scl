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
  my $encodingpUrva = $param{encodingpUrva};
  my $p1pUrva = $param{p1pUrva};
  my $p2pUrva = $param{p2pUrva};
  my $samAsaprakArapUrva = $param{samAsaprakArapUrva};
  my $samAsAnwapUrva = $param{samAsAnwapUrva};
  my $strmodpUrva = $param{strmodpUrva};
  my $strunmodpUrva = $param{strunmodpUrva};
  my $sUwrastrpUrva = $param{sUwrastrpUrva};
  my $dividpUrva = $param{dividpUrva};
  my $anspUrva = $param{anspUrva};
  
# print "samAsAnwa = $samAsAnwapUrva <br />";
  $dividpUrva =~ s/#output//;
  $dividpUrva++;

  if($anspUrva eq "No") { 
     $pUrvapaxastr = $strunmodpUrva;
  } else { 
     $pUrvapaxastr = $strmodpUrva;
  }

  #print "pUrvapaxa str = $pUrvapaxastr";

  my $p1utf = &cnvrt2utf($p1pUrva);
  my $pUrvapaxautf = &cnvrt2utf($pUrvapaxastr);

  if ($encodingpUrva eq "RMN") {
     $p1utfr = &cnvrt2utfr($p1utf);
     $pUrvapaxautfr = &cnvrt2utfr($pUrvapaxautf);
     $sUwrastrutf = &cnvrt2utfr($sUwrastrpUrva);
  }

  if ($anspUrva eq "Yes") {
      if ($encodingpUrva eq "RMN") {
        print "<font color=\"blue\">$p1utfr -&gt; $pUrvapaxautfr</font> <font color=\"red\">$sUwrastrutf</font>";
      } else {
        print "<font color=\"blue\">$p1utf -&gt; $pUrvapaxautf</font> <font color=\"red\">$sUwrastrpUrva</font>";
      }
#  } else {
#      if ($encodingpUrva eq "RMN") {
#       print " There is no pūrvapadaviśiṣṭakārya\n";
#      } else {
#       print " पूर्वपदविशिष्टकार्यम् नास्ति\n";
#      }
  }
      $p1pUrva = $pUrvapaxastr;
      $cmd = "$myPATH/uwwarapaxa.out \"$encodingpUrva\" \"$p1pUrva\" \"$p2pUrva\" \"$samAsAnwapUrva\" \"$samAsaprakArapUrva\" $dividpUrva";
      system($cmd);
      #}
