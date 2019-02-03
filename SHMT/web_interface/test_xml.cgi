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

require "../paths.pl";
package main;
use CGI qw/:standard/;

  if($GlblVar::VERSION eq "SERVER") {
    if (! (-e "$GlblVar::TFPATH")){
        mkdir "$GlblVar::TFPATH" or die "Error creating directory $GlblVar::TFPATH";
    }
    open(TMP1,">>$GlblVar::TFPATH/shmt.log") || die "Can't open $GlblVar::TFPATH/shmt.log for writing";
  }

require "$GlblVar::SCLINSTALLDIR/converters/convert.pl";

      if (param) {
      my $encoding=param("encoding");
      my $sentences=param("text");
      my $splitter=param("splitter");
      my $out_encoding=param("out_encoding");
      #$morph=param("morph");
      my $parse=param("parse");
      my $text_type=param("text_type");


  if($GlblVar::VERSION eq "SERVER") {
      print TMP1 $ENV{'REMOTE_ADDR'}."\t".$ENV{'HTTP_USER_AGENT'}."\n"."encoding:$encoding\t"."sentences:$sentences\t"."splitter:$splitter\t"."out_encoding:$out_encoding\t"."parse:$parse\n#####################\n\n";
  }

      if ($out_encoding eq "Devanagari") { $script = "DEV";}
      if ($out_encoding eq "IAST") { $script = "IAST";}
      if ($splitter eq "None") { $sandhi = "NO"; $morph = "UoHyd";}
      if ($splitter eq "Heritage Splitter") { $sandhi = "YES"; $morph = "GH";}
#      if ($splitter eq "Anusaaraka Splitter") { $sandhi = "YES"; $morph = "UoHyd";}

      $pid = $$;

      $sentences =~ s/\r\n/ /g;
      $sentences =~ s/[\r\n]/ /g;
      $sentences =~ s/ ।/./g;
      $sentences =~ s/[ ]+\|/./g;
      $sentences =~ s/[ ]+([\.!\?])/$1/g;
      $sentences =~ s/:/ः/g;
      $sentences =~ s/\|[ ]+$/./g;
      $sentences =~ s/\.[ ]+$/./g;


      $sentences=&convert($encoding,$sentences,$GlblVar::SCLINSTALLDIR);
      chomp($sentences);

      my $cgi = new CGI;
      if($morph eq "GH") {
         $sentences =~ s/\.//;
         $cmd = "$GlblVar::HERITAGE_CGIURL?lex=SH\&cache=t\&st=t\&us=f\&cp=t\&text=$sentences\&t=WX\&topic=\&mode=g";
         print CGI-> redirect($cmd);
      } else {
         system("mkdir -p $GlblVar::TFPATH/tmp_in$pid");
         open(TMP,">$GlblVar::TFPATH/tmp_in$pid/wor.$pid") || die "Can't open $GlblVar::TFPATH/tmp_in$pid/wor.$pid for writing";
         print TMP $sentences,"\n";
         close(TMP);

         print $cgi->header (-charset => 'UTF-8');
           $sentences = '"'. $sentences  . '"';
           system("$GlblVar::SCLINSTALLDIR/SHMT/prog/shell/callmtshell.pl $GlblVar::TFPATH $GlblVar::SCLINSTALLDIR $GlblVar::GraphvizDot $sentences $encoding $pid $script $sandhi $morph $parse $text_type $GlblVar::LTPROCBIN");
           system("$GlblVar::SCLINSTALLDIR/SHMT/prog/interface/display_output.pl $GlblVar::SCLINSTALLDIR $GlblVar::TFPATH $script $pid");
      }
    }
  if($GlblVar::VERSION eq "SERVER") {
    close(TMP1);
  }
