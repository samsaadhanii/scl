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

require "../../paths.pl";
require "$GlblVar::SCLINSTALLDIR/cgi_interface.pl";

require "$GlblVar::SCLINSTALLDIR/NN/common/style.pl";
require "$GlblVar::SCLINSTALLDIR/NN/parser/functions.pl";

#  my $cgi = new CGI;
#  print $cgi->header (-charset => 'UTF-8');

  print "Content-type:text/html;charset:UTF-8\n\n";
  print $NN::style_header;
  print $NN::title;

  my %param = &get_parameters();


  #  if (param) {
      $pid=$param{pid};
      $instr=$param{instr};

      $filepath="$GlblVar::TFPATH/NN/parser/tmp_in$pid";
      $filename=$filepath."/out.txt";

      print "<center>";
      print $NN::instructions;
      print "</center>";

      print "<center><div id=\"tables\">\n";
      ($more_choices,$instr) = split(/#/,&print_table($instr,$pid,$filename));
      print "</div></center>\n";

      if(!$more_choices){
         $ans = &get_parsed_string($instr,$filename);
         &NN::tail($ans);
      } else { print "<div id=\"navigation\"></div>";}

  $ans =~ s/\<([.*])\-\^(wva|wA)\>/([.*])\-$1/g;
  $ans;
      print $NN::style_tail;
      #   }
