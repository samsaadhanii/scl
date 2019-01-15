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
#$DEVELOP = "2.0";


require "../paths.pl";

use strict;
use warnings;
use CGI qw( :standard );

if($GlblVar::VERSION eq "SERVER") {
    if (! (-e "$GlblVar::TFPATH")){
        mkdir "$GlblVar::TFPATH" or die "Error creating directory $GlblVar::TFPATH";
    }
   open(TMP1,">>$GlblVar::TFPATH/sandhi_splitter.log") || die "Can't open $GlblVar::TFPATH/sandhi_splitter.log for writing";
}

print header(-type=>"text/html" , -charset=>"utf-8");

my $word;
my $encoding;
my $sandhi_type;
my $sandhi_splitter_out;
if (param){
  $word = param('word');
  $encoding=param("encoding");
  $sandhi_type=param("sandhi_type");
  if($GlblVar::VERSION eq "SERVER"){
     print TMP1 $ENV{'REMOTE_ADDR'}."\t".$ENV{'HTTP_USER_AGENT'}."\n"."encoding:$encoding\t"."word:$word\t"."sandhi_type:$sandhi_type\n";
  }
}

system("$GlblVar::SCLINSTALLDIR/SHMT/prog/sandhi_splitter/web_interface/callsandhi_splitter.pl $GlblVar::SCLINSTALLDIR $encoding $word $sandhi_type $$");

if(-z "$GlblVar::TFPATH/seg_$$/full_output") {
 print "<br><center> No Sandhi Splits for the given word</center> </br>";
} else {
print "<div id='finalout' style='border-style:solid; border-width:1px;padding:10px;color:blue;font-size:14px;height:200px'>";
print `/bin/cat $GlblVar::TFPATH/seg_$$/most_probable_output_utf.txt`;
print "<script type=\"text/javascript\"> \n function toggleMe(a){ \n var e=document.getElementById(a); \n if(!e)return true; \n if(e.style.display==\"none\"){ \n e.style.display=\"block\";document.getElementById(\"more\").style.display=\"none\"; document.getElementById(\"less\").style.display=\"block\";\n } \n else{ \n e.style.display=\"none\";document.getElementById(\"less\").style.display=\"none\"; document.getElementById(\"more\").style.display=\"block\"; \n } \n return true; \n } \n </script>\n";

print "<input type=\"button\" onclick=\"return toggleMe('para1')\" value=\"More\" id=\"more\"> <input type=\"button\" onclick=\"return toggleMe('para1')\" value=\"Less\" id=\"less\" style=\"display:none;\" > <div id=\"para1\" style=\"display:none; height:15px; border-style:none;border-width:1px;\"> \n";
print `/bin/cat $GlblVar::TFPATH/seg_$$/all_possible_outputs.txt`;
print "</div><br />";
}

if($GlblVar::VERSION eq "SERVER"){
   close(TMP1);
}
