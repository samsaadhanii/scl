#!/usr/bin/env perl

#  Copyright (C) 2012-2019 Amba Kulkarni (ambapradeep@gmail.com)
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
use CGI qw/:standard/;
#use CGI::Carp qw(fatalsToBrowser);
require "../../../paths.pl";

          if (param) {
            my $filename=param("filename");
            my $sentnum=param("sentnum");
            my $start=param("start");
            my $outscript=param("outscript");

open(TMP,"<$filename/parser_files/parseop_new.txt") || die "Can't open $filename/parser_files/parseop_new.txt for reading";

$sent_found = 0;
$i=0;
$parse_nos="";
while($in = <TMP>){
  chomp($in);
  if($in =~ /./) {
      if($in =~ /Solution:([0-9]+)/) { $parse_nos .= "#".$1;}
  }
}
close(TMP);

          my $cgi = new CGI;
          print $cgi->header (-charset => 'UTF-8');
          print "<head>\n";
          print "</head>\n<body>";
          print "<div id=\"imgitems\" class=\"parsetrees\">\n<center>\n<ul id=\"trees\">\n";
          $parse_nos =~ s/^#//;
          @parse_nos = split(/#/,$parse_nos);

          foreach $i (@parse_nos) {
            if($i != 1) {
              system("$GlblVar::SCLINSTALLDIR/SHMT/prog/kAraka/prepare_dot_files.sh $GlblVar::SCLINSTALLDIR $GlblVar::GraphvizDot $outscript $sentnum mk_kAraka_help.pl $SCLINSTALLDIR $filename/parser_files/morph$sentnum.out $filename/parser_files/parseop1.txt $filename $i");
            }
            system("$GlblVar::GraphvizDot -Tsvg -o$filename/${sentnum}.$i.svg $filename/${sentnum}.$i.dot");
             $filename =~ s/^$GlblVar::TFPATH//;
             print "<img src=\"/scl/SHMT/DEMO/$filename/${sentnum}.$i.svg\" width=\"\" height=\"\" kddalt=\"graph for parse number $i\">\n";
          }
}
