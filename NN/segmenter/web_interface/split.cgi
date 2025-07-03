#!/usr/bin/perl

#  Copyright (C) 2014-2025 Amba Kulkarni (ambapradeep@gmail.com)
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
use warnings;

use utf8;
#use CGI qw( :standard );

require "../../paths.pl";
$myPATH="$GlblVar::CGIDIR/$GlblVar::SCL_CGI";
require "$myPATH/cgi_interface.pl";
require "$myPATH/converters/convert.pl";
require "$myPATH/NN/common/style.pl";

system("mkdir -p $GlblVar::TFPATH");

#my $cgi = new CGI;
#      print $cgi->header (-charset => 'UTF-8');
      print "Content-type:text/html;-expires:60*60*24;charset:UTF-8\n\n";

      print $NN::style_header;
      print $NN::title;
      

      my %param = &get_parameters();
#      if (param) {
        my $text=$param{nne};
        my $encoding=$param{encoding};

        $textwx=&convert($encoding,$text,"$GlblVar::CGIDIR/$GlblVar::SCL_CGI");
        $textutf = `echo $textwx | $myPATH/converters/ri_skt | $myPATH/converters/iscii2utf8.py 1`;


        print "<center>";
        print "<span>To see the sandhi rule, place the 
        cursor on the hyphen '-'.<br /> <span>\"Parse\", will take you 
        to the interactive interface for constituency parseing.</span> 
        <br /></center><ul class=\"list-inline\"><center>";
        #$output = `$myPATH/NN/segmenter/skt_splitter_server.pl; echo $textwx | $myPATH/NN/segmenter/split_samAsa_greedy.pl | $myPATH/converters/ri_skt |$myPATH/converters/iscii2utf8.py 1 | $myPATH/NN/segmenter/format.pl`;
        $output = `$myPATH/NN/segmenter/skt_splitter_server.pl; echo $textwx | $myPATH/NN/segmenter/split_samAsa_greedy.pl | $myPATH/converters/ri_skt |$myPATH/converters/iscii2utf8.py 1 | $myPATH/NN/segmenter/format.pl`;
       print "<font color=\"red\">$textutf</font>";
       print "$output";
        print "<font color=\"black\">";
       print "</center>";

       #      }
      print $NN::style_tail;
