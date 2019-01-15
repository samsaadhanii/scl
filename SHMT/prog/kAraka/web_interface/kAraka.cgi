#!/usr/bin/env perl

#  Copyright (C) 2002-2019 Amba Kulkarni (ambapradeep@gmail.com)
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

require "../../paths.pl";
$CSSLOC = "/scl/SHMT/";
$CGILOC = "/cgi-bin/scl/SHMT/";


use CGI qw/:standard/;
#use CGI::Carp qw(fatalsToBrowser);

 if($GlblVar::VERSION eq "SERVER") {
    if (! (-e "$TFPATH")){
        mkdir "$TFPATH" or die "Error creating directory $TFPATH";
    }
    open(TMP1,">>$TFPATH/parser.log") || die "Can't open $TFPATH/parser.log for writing";
 }
      if (param) {
      $encoding=param("encoding");
      $sentences=param("text");
      $preprocess=param("sandhi");
      $out_encoding=param("out_encoding");
      $parse=param("parse");
      $text_type=param("text_type");

   if($GlblVar::VERSION eq "SERVER"){
      print TMP1 $ENV{'REMOTE_ADDR'}."\t".$ENV{'HTTP_USER_AGENT'}."\n"."encoding:$encoding\t"."sentences:$sentences\t"."preprocess:$preprocess\t"."out_encoding:$out_encoding\t"."parse:$parse\n#########################\n";
   }
      if ($out_encoding eq "Devanagari") { $script = "DEV";}
      if ($out_encoding eq "IAST") { $script = "IAST";}
      if ($out_encoding eq "Velthuis") { $script = "VH";}

      if ($preprocess eq "None") { $sandhi = "NO"; $morph = "UoHyd";}
      if ($preprocess eq "Heritage Splitter") { $sandhi = "YES"; $morph = "GH";}
      if ($preprocess eq "Anusaaraka Splitter") { $sandhi = "YES"; $morph = "UoHyd";}


      $pid = $$;

      $sentences =~ s/\r//g;
      $sentences =~ s/\n/#/g;
      $sentences =~ s/ ।/./g;
      $sentences =~ s/[ ]+\|/./g;
      $sentences =~ s/[ ]+([\.!\?])/$1/g;
      $sentences =~ s/:/ः/g;
      $sentences =~ s/\|[ ]+$/./g;
      $sentences =~ s/\.[ ]+$/./g;

      system("mkdir -p $TFPATH/tmp_in$pid");
      open(TMP,">$TFPATH/tmp_in$pid/wor.$pid") || die "Can't open $TFPATH/tmp_in$pid/wor.$pid for writing";
      print TMP $sentences,"\n";
      close(TMP);

      $sentences = '"'. $sentences  . '"';


      my $cgi = new CGI;
      print $cgi->header (-charset => 'UTF-8');
      
      system("$GlblVar::SCLINSTALLDIR/SHMT/prog/kAraka/call_kAraka_shell.pl $GlblVar::SCLINSTALLDIR $TFPATH $sentences $encoding $pid $script $sandhi $morph $parse $text_type NOECHO D");
      print "<?xml version=\"1.0\" encoding=\"UTF-8\" ?>\n";
      print "<html><head><title>Anusaaraka</title>\n";
      print "<META HTTP-EQUIV=\"Content-Type\" CONTENT=\"text/html; charset=UTF-8\" />\n";
      print "<link href=\"$CSSLOC/Sanskrit_style.css\" type=\"text/css\" rel=\"stylesheet\" />\n";
      print "<link href=\"$CSSLOC/Sanskrit_hindi.css\" type=\"text/css\" rel=\"stylesheet\" />\n";
      print "<script src=\"$CSSLOC/script.js\" type=\"text/javascript\"></script>\n";
      print "<script src=\"$CSSLOC/Sanskrit_hindi.js\" type=\"text/javascript\"></script>\n";
      print "<script src=\"$CSSLOC/toggle.js\" type=\"text/javascript\"></script>\n";
print "<script type=\"text/javascript\">\n";
      print "function show(dict,word){\n";
      print "window.open('http://$CGILOC/options1.cgi?'word='+word+'&outencoding='+encod+'','popUpWindow','height=500,width=400,left=100,top=100,resizable=yes,scrollbars=yes,toolbar=no,menubar=no,location=no,directories=no, status=yes');\n }\n </script>";

      print "</head>";
      print "<body onload=\"register_keys()\"> <script src=\"wz_tooltip.js\" type=\"text/javascript\"></script>"; 
      print "<!-- Main division starts here -->\n";
      print "<div id=\"main-division\" style=\"width:100%;margin-top:5px; border-style:none;border-width:1px;position:relative;height:490px;\">\n";
      print "<div id=\"anusaaraka-output\" style=\"width:99%;min-height:320px; margin-left:5px;margin-right:5px;border-style:solid;border-width:1px; overflow:auto; position:absolute; margin-top:30px;border-color:#C0C0C0;\">\n";
      print "To view the Parsed Tree, place the cursor on the Sentence ID.&nbsp; &nbsp;";
      print "Use Show/Hide Rows to get analysis at different levels.\n";
      print "<div id=\"skt-title\" style=\"height:25px;background-color:gray;color:#FFFFFF;font-size:15px;width:100%;\"><center> वाक्यविश्लेषणम्</center></div> \n";
      print "<script type=\"text/javascript\">\n";
      print "function show(dict,word){\n";
      print "window.open('/cgi-bin/scl/SHMT/options1.cgi?'word='+word+'','popUpWindow','height=500,width=400,left=100,top=100,resizable=yes,scrollbars=yes,toolbar=no,menubar=no,location=no,directories=no, status=yes'); }\n";
      print "</script>\n";
      system("cat $TFPATH/in${pid}.html");
      print "</div><div style=\"height:100px\"></div></body></html>";
      }
   if($GlblVar::VERSION eq "SERVER"){
      close(TMP1);
   }
