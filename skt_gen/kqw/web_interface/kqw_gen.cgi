#!/usr/bin/env perl

#  Copyright (C) 2002-2019 Amba Kulkarni (ambapradeep@gmail.com)
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

package main;
use CGI qw/:standard/;

require "../../paths.pl";

    if($GlblVar::VERSION eq "SERVER"){
    if (! (-e "$GlblVar::TFPATH")){
        mkdir "$GlblVar::TFPATH" or die "Error creating directory $GlblVar::TFPATH";
    }
      open(TMP1,">>$GlblVar::TFPATH/kqw.log") || die "Can't open $GlblVar::TFPATH/kqw.log for writing";
    }
      if (param) {
      my $word=param("vb");
      my $upasarga=param("upasarga");
      my $encoding=param("encoding");

      my $cgi = new CGI;
      print $cgi->header (-charset => 'UTF-8');
      
      print "<head>\n";
      print "<script type=\"text/javascript\">\n";
      print "function show(word,encod){\n";
      print "window.open('/cgi-bin/scl/SHMT/options1.cgi?word='+word+'&outencoding='+encod+'','popUpWindow','height=500,width=400,left=100,top=100,resizable=yes,scrollbars=yes,toolbar=no,menubar=no,location=no,directories=no, status=yes').focus();\n }\n </script>";

      print "</head>\n";
      print "<body onload=\"register_keys()\"> <script src=\"/scl/SHMT/wz_tooltip.js\" type=\"text/javascript\"></script>\n";

      my $result = &getResult("$GlblVar::SCLINSTALLDIR/skt_gen/kqw/gen_kqw.pl $encoding $word $upasarga");
      print $result;
      if($GlblVar::VERSION eq "SERVER"){
         print TMP1 $ENV{'REMOTE_ADDR'}."\t".$ENV{'HTTP_USER_AGENT'}."\n"."word:$word\n#################\n";
      }
     }
      if($GlblVar::VERSION eq "SERVER"){
         close(TMP1);
      }

sub getResult{
        $cmd = $_[0];
        my $result = `$cmd`;
$result;
}
1;

