#!/usr/bin/env perl

#  Copyright (C) 2009-2023 Amba Kulkarni (ambapradeep@gmail.com)
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
require "../../paths.pl";
require "$GlblVar::SCLINSTALLDIR/cgi_interface.pl";

package main;
#use CGI qw/:standard/;

my %param = &get_parameters();

      $texts_input=$param{texts};
      print "Content-type:text/html;-expires:60*60*24;charset:UTF-8\n\n";

      $analysis = `echo "$texts_input" |$GlblVar::SCLINSTALLDIR/converters/utf82iscii.pl | $GlblVar::SCLINSTALLDIR/converters/ir_skt | $GlblVar::SCLINSTALLDIR/skt_gen/Sentence/scan_input.out | $GlblVar::SCLINSTALLDIR/skt_gen/Sentence/sentence_generator | $GlblVar::SCLINSTALLDIR/converters/ri_skt | $GlblVar::SCLINSTALLDIR/converters/iscii2utf8.py 1`;
      #$analysis = `echo "$texts_input" |$GlblVar::SCLINSTALLDIR/converters/utf82iscii.pl | $GlblVar::SCLINSTALLDIR/converters/ir_skt | $GlblVar::SCLINSTALLDIR/skt_gen/Sentence/scan_input.out | $GlblVar::SCLINSTALLDIR/skt_gen/Sentence/sentence_generator `;
#print $analysis;

       #print "<table class=\"table table-bordered\">";

       #print "</table></div>";
       print "<div class=\"well well-lg\">
         <strong><h4><font color='red'>$analysis</font></h4></strong>
       </div>";
       #  }
