#!/usr/bin/env perl

#  Copyright (C) 2012-2023 Amba Kulkarni (ambapradeep@gmail.com)
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
package main;
#use CGI qw/:standard/;
#use CGI::Carp qw(fatalsToBrowser);

require "../../../paths.pl";
require "$GlblVar::SCLINSTALLDIR/cgi_interface.pl";

print "Content-type:text/html;-expires:60*60*24;charset:UTF-8\n\n";

my %param = &get_parameters();

          my $dirname=$param{filename};
          my $sentnum=$param{sentnum};
          my $start=$param{start};
          my $outscript=$param{outscript};
          my $my_converter;

          print "<head>\n";
          print "</head>\n<body>";
          print "<div id=\"imgitems\" class=\"parsetrees\">\n<center>\n<ul id=\"trees\">\n";


          if ($outscript eq "IAST" ){
              $my_converter="$GlblVar::SCLINSTALLDIR/converters/wx2utf8roman.out";
          } elsif ($outscript eq "DEV"){
              $my_converter="$GlblVar::SCLINSTALLDIR/converters/wx2utf8.sh $GlblVar::SCLINSTALLDIR";
          }
	  my $fn = $dirname;
          $fn =~ s/.*tmp_//;

	  system("cut -f1-6 $dirname/*.out.before_parse | $GlblVar::SCLINSTALLDIR/MT/prog/kAraka/add_best_parse_output.pl $GlblVar::SCLINSTALLDIR/MT/prog/kAraka/Prepare_Graph/DATA/AkAfkRA/relations.txt $dirname/parser_files/parseop_new.txt | $GlblVar::SCLINSTALLDIR/MT/prog/kAraka/add_abhihita_info.pl |  $GlblVar::SCLINSTALLDIR/MT/prog/kAraka/add_possible_relations.pl $dirname/parser_files/graph.txt  > $dirname/$fn.out");

	  my $lang = "hi";
	  my $morph = "UoHyd";
	  my $parse = "AVAILABLE";
	  my $text_type = "Prose";
	  
	  my $cmd = "$GlblVar::SCLINSTALLDIR/MT/prog/shell/anu_skt_hnd.sh $GlblVar::CGIDIR/$GlblVar:SCL_CGI $dirname/$fn $GlblVar::TFPATH $lang $outscript $morph $parse $text_type 2>> $dirname/err$fn";
          system($cmd);

          print "<img src=\"/$GlblVar::SCL_HTDOCS/MT/DEMO/tmp_$fn/${sentnum}.svg\" width=\"\" height=\"\" kddalt=\"graph for parse number 1\">\n";
