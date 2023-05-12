#!/usr/bin/env perl

#  Copyright (C) 2002-2023 Amba Kulkarni (ambapradeep@gmail.com)
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

  if($GlblVar::LOG eq "true"){
    if (! (-e "$GlblVar::TFPATH")){
        mkdir "$GlblVar::TFPATH" or die "Error creating directory $GlblVar::TFPATH";
    }
    open(TMP1,">>$GlblVar::TFPATH/waxXiwa.log") || die "Can't open $GlblVar::TFPATH/waxXiwa.log for writing";
  }

  my %param = &get_parameters();

      my $encoding=$param{encoding};
      my $word=$param{rt};

     
print "Content-type:text/html;charset:UTF-8\n\n";
      print "<head>\n";
       print "<meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\" />";
      print "<script type=\"text/javascript\">\n";
      print "function show(word,encod){\n";
      print "window.open('/cgi-bin/$GlblVar::SCL_CGI/MT/dict_options.cgi?word='+word+'&outencoding='+encod+'','popUpWindow','height=500,width=400,left=100,top=100,resizable=yes,scrollbars=yes,toolbar=no,menubar=no,location=no,directories=no, status=yes').focus();\n }\n </script>";

      print "</head>\n";
      print "<body onload=\"register_keys()\"> <script src=\"/$GlblVar::SCL_HTDOCS/MT/wz_tooltip.js\" type=\"text/javascript\"></script>\n";

      my $result = `$GlblVar::CGIDIR/$GlblVar::SCL_CGI/skt_gen/waxXiwa/gen_waxXiwa.pl $word $encoding`;
      print $result;
      if($GlblVar::LOG eq "true"){
        print TMP1 "running:","calling gen_waxXiwa.pl from waxXiwa generator";
        print TMP1 $ENV{'REMOTE_ADDR'}."\t".$ENV{'HTTP_USER_AGENT'}."\n"."word:$word\t"."encoding:$encoding\n#######################\n\n";
      }

 if($GlblVar::LOG eq "true"){
      close(TMP1);
 }
