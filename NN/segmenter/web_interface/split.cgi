#!/usr/bin/perl

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
use warnings;

use utf8;
#use CGI qw( :standard );

require "../../paths.pl";
require "$GlblVar::SCLINSTALLDIR/cgi_interface.pl";
require "$GlblVar::SCLINSTALLDIR/converters/convert.pl";
require "$GlblVar::SCLINSTALLDIR/NN/common/style.pl";

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

        $textwx=&convert($encoding,$text,$GlblVar::SCLINSTALLDIR);
        $textutf = `echo $textwx | $GlblVar::SCLINSTALLDIR/converters/ri_skt | $GlblVar::SCLINSTALLDIR/converters/iscii2utf8.py 1`;


        print "<center>";
        print "<span>To see the sandhi rule, place the 
        cursor on the hyphen '-'.<br /> <span>\"Parse\", will take you 
        to the interactive interface for constituency parseing.</span> 
        <br /></center><ul class=\"list-inline\"><center>";
        #$output = `$GlblVar::SCLINSTALLDIR/NN/segmenter/skt_splitter_server.pl; echo $textwx | $GlblVar::SCLINSTALLDIR/NN/segmenter/split_samAsa_greedy.pl | $GlblVar::SCLINSTALLDIR/converters/ri_skt |$GlblVar::SCLINSTALLDIR/converters/iscii2utf8.py 1 | $GlblVar::SCLINSTALLDIR/NN/segmenter/format.pl`;
        $output = `$GlblVar::SCLINSTALLDIR/NN/segmenter/skt_splitter_server.pl; echo $textwx | $GlblVar::SCLINSTALLDIR/NN/segmenter/split_samAsa_greedy.pl | $GlblVar::SCLINSTALLDIR/converters/ri_skt |$GlblVar::SCLINSTALLDIR/converters/iscii2utf8.py 1 | $GlblVar::SCLINSTALLDIR/NN/segmenter/format.pl`;
       print "<font color=\"red\">$textutf</font>";
       print "$output";
        print "<font color=\"black\">";
       print "</center>";

       #      }
      print $NN::style_tail;
