#!/usr/bin/env perl

#  Copyright (C) 2018-2022 Amba Kulkarni (ambapradeep@gmail.com)
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

package main;
#use CGI qw/:standard/;

use utf8;

require "../../paths.pl";
require "$GlblVar::SCLINSTALLDIR/cgi_interface.pl";


my $myPATH = "$GlblVar::SCLINSTALLDIR/skt_gen/noun";
  if($GlblVar::LOG eq "true"){
    if (! (-e "$GlblVar::TFPATH")){
        mkdir "$GlblVar::TFPATH" or die "Error creating directory $GlblVar::TFPATH";
    }
      open(TMP1,">>$GlblVar::TFPATH/noun.log") || die "Can't open $GlblVar::TFPATH/noun.log for writing";
    }
    my %param = &get_parameters();
    #      if (param) {
        my $encoding=$param{encoding};
        my $prAwi=$param{prAwi};
        my $gen=$param{gen};
        my $rt=$param{rt};
        my $upasarga=$param{upasarga};
        my $kqw_prawyaya=$param{kqw_prawyaya};
        my $XAwu=$param{XAwu};
        my $gaNa=$param{gaNa};

	# my $cgi = new CGI;
	#print $cgi->header (-charset => 'UTF-8');
	#
	 print "Content-type:text/html;charset:UTF-8\n\n";

        print "<head>\n";
	print "<meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\" />\n";
        print "<script type=\"text/javascript\">\n";
        print "function show(word,encod){\n";
        print "window.open('/cgi-bin/scl/MT/options1.cgi?word='+word+'&outencoding='+encod+'','popUpWindow','height=500,width=400,left=100,top=100,resizable=yes,scrollbars=yes,toolbar=no,menubar=no,location=no,directories=no, status=yes').focus();\n }\n </script>";

        print "</head>\n";

        print "<body onload=\"register_keys()\"> <script src=\"/scl/MT/wz_tooltip.js\" type=\"text/javascript\"></script>\n";

       print `$myPATH/gen_kqwnoun.pl $encoding $prAwi $gen $rt u=$upasarga $kqw_prawyaya $XAwu $gaNa`;

       if($GlblVar::LOG eq "true"){
          print TMP1 "running:","calling gen_kqwnoun.pl from noun generator";
          print TMP1 $ENV{'REMOTE_ADDR'}."\t".$ENV{'HTTP_USER_AGENT'}."\n"."rt:$rt\t"."gen:$gen\t"."encoding:$encoding\t"."prAwi:$prAwi\n##########################\n\n";
       }
       #     }
       if($GlblVar::LOG eq "true"){
          close(TMP1);
       }
