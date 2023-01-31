#!/usr/bin/env perl

#  Copyright (C) 2014-2023 Amba Kulkarni (ambapradeep@gmail.com)
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
use Encode qw/ decode /;

require "../../paths.pl";
require "$GlblVar::SCLINSTALLDIR/cgi_interface.pl";
require "$GlblVar::SCLINSTALLDIR/converters/convert.pl";
require "$GlblVar::SCLINSTALLDIR/NN/common/style.pl";
require "$GlblVar::SCLINSTALLDIR/NN/parser/functions.pl";

#     my $cgi = new CGI;
#     print $cgi->header (-charset => 'UTF-8');

     print "Content-type:text/html;charset:UTF-8\n\n";
     print $NN::style_header;
     print $NN::title;

     my %param = &get_parameters();

     #     if (param) {
        $text=$param{text};
        $encoding=$param{encoding};
        $pid = $$;

        system("mkdir -p $GlblVar::TFPATH/NN/parser");
        $text=&convert($encoding,$text,$GlblVar::SCLINSTALLDIR);
        chomp($text);
        $text = &get_canonical_form($text);

        $filepath="$GlblVar::TFPATH/NN/parser/tmp_in$pid";
        system("mkdir -p $filepath");
     
        #system("echo $text | $GlblVar::SCLINSTALLDIR/NN/parser/nneparse.out | $GlblVar::SCLINSTALLDIR/converters/wx2utf8.sh > $filepath/out.txt");
        system("echo $text | $GlblVar::SCLINSTALLDIR/NN/parser/prepare_parse_table.pl | $GlblVar::SCLINSTALLDIR/converters/ri_skt | $GlblVar::SCLINSTALLDIR/converters/iscii2utf8.py 1 > $filepath/out.txt");

   	print "<center>";
	print $NN::instructions;
	print "</center>";

        print "<center><div id=\"tables\"><table><tr><td>\n";
        $rel = "";
        $filename = $filepath."/out.txt";
        ($more_choices,$rel) = split(/#/,&print_table($rel,$pid,$filename));
        print "</td></tr></table></div></center>\n";

        if(!$more_choices){
           $ans = &get_parsed_string($rel,$filename);
           #system("cd $filepath; $GlblVar::SCLINSTALLDIR/NN/parser/mk_tree.out < in > in.tex; xelatex in.tex > /dev/null;");
           #&tail($ans,"tmp_in$pid/in.pdf");
           &NN::tail($ans);
          } else { print "<div id=\"navigation\"></div>";}
	  #  }
      print "<br />";
      print $NN::style_tail;

sub get_canonical_form{
my ($text) = @_;
   $text =~ s/([^-])vaw\-/$1-vaw-/g;
   $text =~ s/prawiyogika\-/niRTa-prawiyogiwA-nirUpaka-/g;
   $text =~ s/anuyogika\-/niRTa-anuyogiwA-nirUpaka-/g;
   $text =~ s/aXikaraNaka\-/niRTa-aXikaraNawA-nirUpaka-/g;
   $text =~ s/viRayaka\-/niRTa-viRayawA-nirUpaka-/g;
   $text =~ s/viRayika\-/niRTa-viRayiwA-nirUpaka-/g;
   $text =~ s/vyApyaka\-/niRTa-vyApyawA-nirUpaka-/g;
   $text =~ s/viSeRyaka\-/niRTa-viSeRyawA-nirUpaka-/g;
   $text =~ s/viSeRaNaka\-/niRTa-viSeRaNawA-nirUpaka-/g;
   $text =~ s/kAryaka\-/niRTa-kAryawA-nirUpaka-/g;
   $text =~ s/kAraNaka\-/niRTa-kAraNawA-nirUpaka-/g;
   $text =~ s/Xarmaka\-/niRTa-XarmawA-nirUpaka-/g;
   $text =~ s/Xarmika\-/niRTa-XarmiwA-nirUpaka-/g;
   $text =~ s/lakRyaka\-/niRTa-lakRyawA-nirUpaka-/g;
   $text =~ s/lakRaNaka\-/niRTa-lakRaNawA-nirUpaka-/g;
   $text =~ s/saMsargaka\-/niRTa-saMsargawA-nirUpaka-/g;
   $text =~ s/saMsargika\-/niRTa-saMsargiwA-nirUpaka-/g;
   $text =~ s/viSeRyika\-/niRTa-viSeRyiwA-nirUpaka-/g;
   $text =~ s/prakAraka\-/niRTa-prakArawA-nirUpaka-/g;
   $text =~ s/prakArika\-/niRTa-prakAriwA-nirUpaka-/g;
   $text =~ s/puwraka\-/niRTa-puwrawva-nirUpaka-/g;
   $text =~ s/piwqka\-/niRTa-piwqwva-nirUpaka-/g;
   $text =~ s/prayojyaka\-/niRTa-prayojyawA-nirUpaka-/g;
   $text =~ s/sAXyaka\-/niRTa-sAXyawA-nirUpaka-/g;
   $text =~ s/boXyaka\-/niRTa-boXyawA-nirUpaka-/g;
   $text =~ s/sambanXaka\-/niRTa-sambanXawA-nirUpaka-/g;
   $text =~ s/sambanXika\-/niRTa-sambanXiwA-nirUpaka-/g;
   $text =~ s/saMbanXaka\-/niRTa-saMbanXawA-nirUpaka-/g;
   $text =~ s/sambanXika\-/niRTa-sambanXiwA-nirUpaka-/g;
   $text =~ s/avayavaka\-/niRTa-avayavawA-nirUpaka-/g;
   $text =~ s/avayavika\-/niRTa-avayaviwA-nirUpaka-/g;
   $text =~ s/hewuka\-/niRTa-hewuwA-nirUpaka-/g;
   $text =~ s/pakRaka\-/niRTa-pakRawA-nirUpaka-/g;
   $text =~ s/vqwwika\-/niRTa-vqwwiwA-nirUpaka-/g;
   $text =~ s/wAka\-/wA-nirUpaka-/g;
   $text =~ s/\-sambanXa\-/sambanXa-/g;
   $text =~ s/\-a\-/-a/g;
   $text =~ s/\-an\-/-an/g;
   #$text =~ s/wvam$/-^wvam/g;
   #$text =~ s/wva\-/-^wva-/g;
   #$text =~ s/wA\-/-^wA-/g;
   #$text =~ s/wA$/-^wA/g;
   $text =~ s/I-BUwa\-/IBUwa-/g;
   $text =~ s/I-kqwa\-/Ikqwa-/g;
   $text =~ s/(i|I)\-Axi/yAxi/g;
   $text =~ s/(u|U)\-Axi/vAxi/g;
   $text =~ s/(q|Q)\-Axi/rAxi/g;
   $text =~ s/(a|A)\-Axi/Axi/g;
   $text =~ s/wASAli\-/wA-SAli-/g;
   $text =~ s/wASAlI\-/wA-SAlI-/g;
   $text =~ s/wASAlinI\-/wA-SAlinI-/g;
   $text =~ s/\-\^wvA/wvA/g;
   $text =~ s/awyanwa-aBAva/awyanwABAva/g;
   $text =~ s/anyonya-aBAva/anyonyABAva/g;
   $text =~ s/prAk-aBAva/prAgaBAva/g;
   $text =~ s/samAna-aXikaraNa/samAnAXikaraNa/g;

   $text =~ s/(aXikaraNa|AXAra|AXeya|prawiyogi|anuyogi|hewu|kArya|kAraNa|karaNa|viSeRya|viSeRaNa|prakAra|saMsarga|saMsargi|viRaya|viRayi|avacCexaka|avacCexya|avacCinna|lakRya|lakRaNa|nirUpya|nirUpaka|nirUpiwa|sva|svAmi|vyApya|vyApaka|sAXya|sAXaka|prawibaXya|prawibanXaka|ASraya|ASrayi|vqwwi|saw|janya|janaka)\-\^wvam$/$1wvam/g;
   $text =~ s/(aXikaraNa|AXAra|AXeya|prawiyogi|anuyogi|hewu|kArya|kAraNa|karaNa|viSeRya|viSeRaNa|prakAra|saMsarga|saMsargi|viRaya|viRayi|avacCexaka|avacCexya|avacCinna|lakRya|lakRaNa|nirUpya|nirUpaka|nirUpiwa|sva|svAmi|vyApya|vyApaka|sAXya|sAXaka|prawibaXya|prawibanXaka|ASraya|ASrayi|vqwwi|saw|janya|janaka)\-\^wva/$1wva/g;
   $text =~ s/(aXikaraNa|AXAra|AXeya|prawiyogi|anuyogi|hewu|kArya|kAraNa|karaNa|viSeRya|viSeRaNa|prakAra|saMsarga|saMsargi|viRaya|viRayi|avacCexaka|avacCexya|avacCinna|lakRya|lakRaNa|nirUpya|nirUpaka|nirUpiwa|sva|svAmi|vyApya|vyApaka|sAXya|sAXaka|prawibaXya|prawibanXaka|ASraya|ASrayi|vqwwi|saw|janya|janaka)\-\^wA$/$1wA/g;
   $text =~ s/(aXikaraNa|AXAra|AXeya|prawiyogi|anuyogi|hewu|kArya|kAraNa|karaNa|viSeRya|viSeRaNa|prakAra|saMsarga|saMsargi|viRaya|viRayi|avacCexaka|avacCexya|avacCinna|lakRya|lakRaNa|nirUpya|nirUpaka|nirUpiwa|sva|svAmi|vyApya|vyApaka|sAXya|sAXaka|prawibaXya|prawibanXaka|ASraya|ASrayi|vqwwi|saw|janya|janaka)\-\^wA/$1wA/g;
   
   
$text;
}
1;
