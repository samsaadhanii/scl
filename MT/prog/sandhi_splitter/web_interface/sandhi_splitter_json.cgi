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
require "../paths.pl";
require "$GlblVar::SCLINSTALLDIR/cgi_interface.pl";
require "$GlblVar::SCLINSTALLDIR/converters/convert.pl";


use strict;
use warnings;

 print "Content-type:text/html;-expires:60*60*24;charset:UTF-8\n\n";

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
my $sentences;

#if (param){
  $word = $param{word};
  $encoding=$param{encoding};
  $out_encoding=$param{out_encoding};

  if ($out_encoding eq "D") { $Hscript = "deva";}
  if ($out_encoding eq "I") { $Hscript = "roma";}

  $sentences=&convert($encoding,$word,$GlblVar::SCLINSTALLDIR);
  chomp($sentences);

  if($GlblVar::LOG eq "true"){
     print TMP1 $ENV{'REMOTE_ADDR'}."\t".$ENV{'HTTP_USER_AGENT'}."\n"."encoding:$encoding\t"."word:$word\n";
  }

    $cmd = "QUERY_STRING=\"lex=MW\&cache=f\&st=t\&us=f\&font=$Hscript\&cp=t\&text=$sentences\&t=WX\&topic=\&mode=s&pipeline=t&fmode=w\" $GlblVar::CGIDIR/$GlblVar::HERITAGE_CGI";
    system("$cmd");

if($GlblVar::LOG eq "true"){
   close(TMP1);
}
