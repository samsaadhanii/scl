#!/usr/bin/env perl

#  Copyright (C) 2013-2016 Amba Kulkarni (ambapradeep@gmail.com)
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
#use CGI::Carp qw(fatalsToBrowser);


use utf8;
use Encode qw/ decode /;

require "../../paths.pl";
require "$GlblVar::SCLINSTALLDIR/cgi_interface.pl";

my $tmp_path="$GlblVar::TFPATH/NN/CG";
my $converters_path="$GlblVar::SCLINSTALLDIR/converters";
my $NNCG_path="$GlblVar::SCLINSTALLDIR/NN/CG";
my $CG_htdocspath="/$GlblVar::SCL_HTDOCS/NN/CG";

#      my $cgi = new CGI;
#      print $cgi->header (-charset => 'UTF-8');
#      print "<span><font size=\"3px\"><p><b>Instructions:</b> </font></span><br />\n";
#      print "<span>In Conceptual Graph, 'Relations' are shown as oval shaped nodes and 'Concepts' as Rectangle shaped nodes.</span><br/>\n";
#      print "<span>In Compressed Conceptual Graph, 'Concepts' are in Rectangle shaped nodes and 'relations' are shown through arrows.</span><br/>\n";
#      print "<span> If the relation between two concepts is not mentioned explicitly, a default relation \"R\" is shown.</span>;\n";
#      print "</center><br>";

my %param = &get_parameters();
#if (param) {

      print "Content-type:text/html;charset:UTF-8\n\n";
       my $nne=$param{nne};
       my $pid = $$;
       system("mkdir -p $tmp_path/tmp_in$pid");

      system("echo $nne | $converters_path/utf82iscii.pl | $converters_path/ir_skt | $NNCG_path/nne2diagram.out | $converters_path/ri_skt | $converters_path/iscii2utf8.py 1 | $GlblVar::GraphvizDot -Tjpg > $tmp_path/tmp_in$pid/a.jpg");
      $nne =~ s/</\&lt;/g;
      $nne =~ s/>/\&gt;/g;
      print "<center><br>";
      print "$nne<br><br><br>";
      print "<img src=\"$CG_htdocspath/DOT/tmp_in$pid/a.jpg\">\n";
      print "<img src=\"$CG_htdocspath/relation_convention.jpg\">\n";
      print "<br>";
      #print "<a href=\"$CG_htdocspath/test.html\"> Try Another<\/a>";
      #}
