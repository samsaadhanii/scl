#!/usr/bin/env perl

#  Copyright (C) 2010-2023 Amba Kulkarni (ambapradeep@gmail.com)
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

package main;
#use CGI qw/:standard/;

    if($GlblVar::LOG eq "true"){
    if (! (-e "$GlblVar::TFPATH")){
        mkdir "$GlblVar::TFPATH" or die "Error creating directory $GlblVar::TFPATH";
    }
      open(TMP1,">>$GlblVar::TFPATH/verb.log") || die "Can't open $GlblVar::TFPATH/verb.log for writing";
    }
    my %param = &get_parameters();

      my $word=$param{vb};
      my $prayoga_paxI=$param{prayoga_paxI};
      my $upasarga=$param{upasarga};
      my $encoding=$param{encoding};
      my $outencoding=$param{outencoding};

      if($outencoding eq "") { $outencoding="UTF8";}

      if($prayoga_paxI =~ /\-/) {
        ($prayoga,$paxI) = split(/-/,$prayoga_paxI,2);
      } else {$prayoga = $prayoga_paxI; $paxI="-";}

      $upasarga =~ s/Y/_/g;

      print "Content-type:text/html;-expires:60*60*24;charset:UTF-8\n\n";
      print "<head>\n";
      print "<meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\" />";
      print "<script type=\"text/javascript\">\n";
      print "function show(word,encod){\n";
      print "window.open('/cgi-bin/$GlblVar::SCL_CGI/MT/dict_options.cgi?word='+word+'&outencoding='+encod+'','popUpWindow','height=500,width=400,left=100,top=100,resizable=yes,scrollbars=yes,toolbar=no,menubar=no,location=no,directories=no, status=yes');\n }\n </script>";

      print "</head>\n";
      print "<body onload=\"register_keys()\"> <script src=\"/$GlblVar::SCL_HTDOCS/MT/wz_tooltip.js\" type=\"text/javascript\"></script>\n";

      my $result = `$GlblVar::CGIDIR/$GlblVar::SCL_CGI/skt_gen/verb/gen_verb.pl $encoding $outencoding $prayoga $upasarga $word $paxI web`;
      print $result;
      if($GlblVar::LOG eq "true"){
         print TMP1 "running:","calling gen_verb.pl from verb generator";
         print TMP1 $ENV{'REMOTE_ADDR'}."\t".$ENV{'HTTP_USER_AGENT'}."\n"."upasarga:$upasarga\t"."word:$word\t"."prayoga:$prayoga\n#######################\n\n";
      }
      #      }
      if($GlblVar::LOG eq "true"){
        close(TMP1);
      }
