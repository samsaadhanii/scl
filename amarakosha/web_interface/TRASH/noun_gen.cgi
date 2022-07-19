#!/usr/bin/env perl

#  Copyright (C) 2010-2022 Amba Kulkarni (ambapradeep@gmail.com)
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

package main;
#use CGI qw/:standard/;

require "../paths.pl";
require "$GlblVar::SCLINSTALLDIR/cgi_interface.pl";

my $myPATH = "$GlblVar::SCLINSTALLDIR/amarakosha";

 if($GlblVar::LOG eq "true"){
    if (! (-e "$GlblVar::TFPATH")){
        mkdir "$GlblVar::TFPATH" or die "Error creating directory $GlblVar::TFPATH";
    }

      open(TMP1,">>$GlblVar::TFPATH/noun.log") || die "Can't open $GlblVar::TFPATH/noun.log for writing";
    }
    my %param = &get_parameters("decode");

    #      if (param) {
    my    $encoding=$param{encoding};
    my    $rt=$param{rt};
    my    $gen=$param{gen};
    my    $jAwi=$param{jAwi};
    my    $level=$param{level};

    #    my $cgi = new CGI;
    #    print $cgi->header (-charset => 'UTF-8');


        print "Content-Type:text/html; charset:UTF-8\n\n";
        print "<html>\n";
	print "<meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\"/>";
        print "<head>\n";
        print "<script type=\"text/javascript\">\n";
        print "function show(word,encod){\n";
        print "window.open('/cgi-bin/scl/MT/options1.cgi?word='+word+'&outencoding='+encod+'','popUpWindow','height=500,width=400,left=100,top=100,resizable=yes,scrollbars=yes,toolbar=no,menubar=no,location=no,directories=no, status=yes').focus();\n }\n </script>";

        print "</head>\n\n";

        print "<body onload=\"register_keys()\"> <script src=\"/scl/MT/wz_tooltip.js\" type=\"text/javascript\"></script>\n";

       print `$myPATH/gen_noun.pl $rt $gen $jAwi $encoding $level`;

       if($GlblVar::LOG eq "true"){
          print TMP1 "running:","calling gen_noun.pl from noun generator";
          print TMP1 $ENV{'REMOTE_ADDR'}."\t".$ENV{'HTTP_USER_AGENT'}."\n"."rt:$rt\t"."gen:$gen\t"."encoding:$encoding\t"."jAwi:$jAwi\n##########################\n\n";
          close(TMP1);
       }
