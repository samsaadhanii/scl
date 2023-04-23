#!/usr/bin/env perl

#  Copyright (C) 2013-2023 Amba Kulkarni (ambapradeep@gmail.com)
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
use utf8;
use Encode qw/ decode /;

require "../../paths.pl";
require "$GlblVar::SCLINSTALLDIR/cgi_interface.pl";

my $converters_path="$GlblVar::SCLINSTALLDIR/converters";
my $NNCG_path="$GlblVar::SCLINSTALLDIR/NN/CG";
require "$GlblVar::SCLINSTALLDIR/NN/common/style.pl";

      print "Content-type:text/html;charset:UTF-8\n\n";
      print $NN::style_header;
      print $NN::title;

      my %param = &get_parameters();

        my $nne=$param{nne};
        my $type=$param{type};


        print "<center><br>";
        print &clean($nne);
        print "<br><br><br>";

        system("echo '$nne' | $converters_path/utf82iscii.pl | $converters_path/ir_skt | $NNCG_path/nne2diagram.out $type | $converters_path/ri_skt | $converters_path/iscii2utf8.py 1 | $GlblVar::GraphvizDot -Tsvg ");
        print "<br>";

      print $NN::style_tail;


sub clean{

my($str) = @_;
  $str =~ s/</\&lt;/g;
  $str =~ s/>/\&gt;/g;
  $str =~ s/:[0-9]+//g;
 
$str;
}
1;
