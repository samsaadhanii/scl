#!/usr/bin/env perl

#  Copyright (C) 2010-2019 Amba Kulkarni (ambapradeep@gmail.com)
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

require "../../paths.pl";

package main;
use CGI qw/:standard/;

    if($GlblVar::VERSION eq "SERVER"){
    if (! (-e "$GlblVar::TFPATH")){
        mkdir "$GlblVar::TFPATH" or die "Error creating directory $GlblVar::TFPATH";
    }
      open(TMP1,">>$GlblVar::TFPATH/verb.log") || die "Can't open $GlblVar::TFPATH/verb.log for writing";
    }
      if (param) {

      my $word=param("vb");
      my $prayoga=param("prayoga");
      my $paxI=param("paxI");
      my $prayoga_paxI=param("prayoga-paxI");
      my $upasarga=param("upasarga");
      my $encoding=param("encoding");

      if($prayoga_paxI ne "") {
        ($prayoga,$paxI) = split(/-/,$prayoga_paxI,2);
      }

      $upasarga =~ s/Y/_/g;

      my $cgi = new CGI;
      print $cgi->header (-charset => 'UTF-8');
      print "<head>\n";
      print "<script type=\"text/javascript\">\n";
      print "function show(word,encod){\n";
      print "window.open('/cgi-bin/scl/SHMT/options1.cgi?word='+word+'&outencoding='+encod+'','popUpWindow','height=500,width=400,left=100,top=100,resizable=yes,scrollbars=yes,toolbar=no,menubar=no,location=no,directories=no, status=yes');\n }\n </script>";

      print "</head>\n";
      print "<body onload=\"register_keys()\"> <script src=\"/scl/SHMT/wz_tooltip.js\" type=\"text/javascript\"></script>\n";

      #print "verb generator is being called\n";
      my $result = `$GlblVar::SCLINSTALLDIR/skt_gen/verb/gen_verb.pl $encoding $prayoga $upasarga $word $paxI`;
      print $result;
      if($GlblVar::VERSION eq "SERVER"){
         print TMP1 "running:","calling gen_verb.pl from noun generator";
         print TMP1 $ENV{'REMOTE_ADDR'}."\t".$ENV{'HTTP_USER_AGENT'}."\n"."upasarga:$upasarga\t"."word:$word\t"."prayoga:$prayoga\n#######################\n\n";
      }
      }
      if($GlblVar::VERSION eq "SERVER"){
        close(TMP1);
      }
