#!/usr/bin/env perl

#  Copyright (C) 2012-2025 Amba Kulkarni (ambapradeep@gmail.com)
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
$myPATH="$GlblVar::CGIDIR/$GlblVar::SCL_CGI";
require "$myPATH/cgi_interface.pl";

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
              $my_converter="$myPATH/converters/wx2utf8roman.out";
          } elsif ($outscript eq "DEV"){
              $my_converter="$myPATH/converters/wx2utf8.sh $myPATH";
          }
	  my $fn = $dirname;
          $fn =~ s/.*tmp_//;

	  #system("cut -f1-6 $dirname/*.out.before_parse | $myPATH/MT/prog/kAraka/add_best_parse_output.pl $myPATH/MT/prog/kAraka/Prepare_Graph/DATA/AkAfkRA/relations.txt $dirname/parser_files/parseop_new.txt | $myPATH/MT/prog/kAraka/add_abhihita_info.pl |  $myPATH/MT/prog/kAraka/add_possible_relations.pl $dirname/parser_files/graph.txt  > $dirname/$fn.out");
	  system("cut -f1-6 $dirname/*.out.before_parse | $myPATH/MT/prog/kAraka/add_best_parse_output.pl $myPATH/MT/prog/kAraka/Prepare_Graph/DATA/AkAfkRA/relations.txt $dirname/parser_files/parseop_new.txt | $myPATH/MT/prog/kAraka/add_abhihita_info.pl |  $myPATH/MT/prog/kAraka/add_possible_relations.pl $dirname/parser_files/graph.txt | $myPATH/MT/prog/reader_generator/extract.pl | $myPATH/MT/prog/kAraka/draw_graph.pl $GlblVar::GraphvizDot $dirname ");

	  #my $lang = "hi";
	  #my $morph = "UoHyd";
	  #my $parse = "AVAILABLE";
	  #my $text_type = "Prose";
	 # 
	 # my $cmd = "$myPATH/MT/prog/shell/anu_skt_hnd.sh $myPATH $dirname/$fn $GlblVar::TFPATH $lang $outscript $morph $parse $text_type 2>> $dirname/err$fn";
         # system($cmd);

          print "<img src=\"/$GlblVar::SCL_HTDOCS/MT/DEMO/tmp_$fn/${sentnum}.svg\" width=\"\" height=\"\" kddalt=\"graph for parse number 1\">\n";
