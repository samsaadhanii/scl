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
#$DEVELOP = "2.0";


use utf8;
use strict;
#use warnings;
require "../paths.pl";
require "$GlblVar::SCLINSTALLDIR/cgi_interface.pl";
require "$GlblVar::SCLINSTALLDIR/converters/convert.pl";

## Usage for json: 
## http://sanskrit.uohyd.ac.in/cgi-bin/scl/sandhi_splitter/sandhi_splitter.cgi?word=rAmAlayaH&encoding=WX&outencoding=D&mode=word&disp_mode=json
## encoding: WX/VH/SLP/IAST/Itrans/Unicode
## outencoding: D/I
## mode: sent/word


  my %param = &get_parameters();

if($GlblVar::LOG eq "true") {
    if (! (-e "$GlblVar::TFPATH")){
        mkdir "$GlblVar::TFPATH" or die "Error creating directory $GlblVar::TFPATH";
    }   
   open(TMP1,">>$GlblVar::TFPATH/sandhi_splitter.log") || die "Can't open $GlblVar::TFPATH/sandhi_splitter.log for writing";
}

my $word;
my $encoding;
my $sandhi_splitter_out;
my $sentences;
my $cmd;
my $Hscript;
my $out_encoding;
my $out_converter;
my $t; 
my $st;
my $mode;
my $disp_mode;
my $error;

$disp_mode = "web";


  $word = $param{word};
  $encoding=$param{encoding};
  $out_encoding=$param{outencoding};
  $mode=$param{mode};
  if (defined ($param{disp_mode}) && ($param{disp_mode} eq "json")) { $disp_mode = "json";}

  if ($out_encoding eq "D") { $Hscript = "deva";}
  if ($out_encoding eq "I") { $Hscript = "roma";}

if ($out_encoding eq "I") {$out_converter="$GlblVar::SCLINSTALLDIR/converters/wx2utf8roman.out";}
  if ($out_encoding eq "D") {$out_converter="$GlblVar::SCLINSTALLDIR/converters/wx2utf8.sh $GlblVar::SCLINSTALLDIR";}

  if($encoding eq "Itrans"|| $encoding eq "IAST" || $encoding eq "Unicode") {
     $word=&convert($encoding,$word,$GlblVar::SCLINSTALLDIR);
  }
   #Since Heritage encode.ml fails on these schemes.

  if ($mode eq "sent") { $st = "t";}
  elsif ($mode eq "word") { $st = "f";}

  if($GlblVar::LOG eq "true"){
     print TMP1 $ENV{'REMOTE_ADDR'}."\t".$ENV{'HTTP_USER_AGENT'}."\n"."encoding:$encoding\t"."word:$word\n";
  }

## Heritage splitter needs the terminal anusvAra to be m
    if ($encoding eq "WX") { $t = "WX"; if ($word =~ /M$/) { $word =~ s/M$/m/;}}
    elsif ($encoding eq "VH") { $t = "VH"; if ($word =~ /\/.m$/) { $word =~ s/\/.m$/m/;}}
    elsif ($encoding eq "KH") { $t = "KH"; if ($word =~ /M$/) { $word =~ s/M$/m/;}}
    elsif ($encoding eq "SLP") { $t = "SL"; if ($word =~ /M$/) { $word =~ s/M$/m/;}}
    elsif ($encoding eq "IAST") { $t = "WX"; if ($word =~ /M$/) { $word =~ s/M$/m/;}}
    elsif ($encoding eq "Unicode") { $t = "WX"; if ($word =~ /M$/) { $word =~ s/M$/m/;}}
    elsif ($encoding eq "Itrans") { $t = "WX"; if ($word =~ /M$/) { $word =~ s/M$/m/;}}

    $cmd = "QUERY_STRING=\"lex=MW\&cache=f\&st=$st\&us=f\&font=$Hscript\&cp=t\&text=$word\&t=$t\&topic=\&mode=s&pipeline=t&fmode=w\" $GlblVar::CGIDIR/$GlblVar::HERITAGE_CGI";
    my $ans = `$cmd`;
    if($ans =~ /error/) { $ans = "No Output Found"; $error = 1;} else {$error = 0;}

  if($disp_mode eq "web"){
      print "Content-type:text/html;-expires:60*60*24;charset:UTF-8\n\n";
      print "<div id='finalout' style='border-style:solid; border-width:1px;padding:10px;color:blue;font-size:14px;height:200px'>";
      if ($error == 0) {

          $ans = `echo "$ans" | $out_converter | tail -1 | perl -p -e 's/.*://; s/}//;'`;
	  print $ans;
          print "<br />";
          print "<br />";
          print "<br />";
          print "Click <a href=\"/cgi-bin/$GlblVar::HERITAGE_Graph_CGI?lex=MW\&cache=f\&st=$st\&us=f\&font=$Hscript\&cp=t\&text=$word\&t=$t\&topic=\&mode=g&pipeline=f\">here</a> to see all possible solutions.";
          print "</div><br />";
      } else {
         print $ans;
         print "</div><br />";
      }
    } else {
      print "Access-Control-Allow-Origin: *\n";
      print "Content-type:text/html;-expires:60*60*24;charset:UTF-8\n\n";
      if($error == 0) {
         $ans = `echo "$ans" | tail -1 | sed 's/input/\@input/' | sed 's/segmentation/\@segmentation/' | $out_converter`;
      }
         $ans =~ s/input:/input: "/;
	 $ans =~ s/input/"input"/;
         $ans =~ s/segmentation/"segmentation"/;
         $ans =~ s/,/",/;
         $ans =~ s/\[/["/;
         $ans =~ s/\]/"]/;
         print $ans;
    }
if($GlblVar::LOG eq "true"){
   close(TMP1);
}

