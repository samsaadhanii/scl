#!/usr/bin/env perl
#
#
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
require "../../paths.pl";
$myPATH = "$GlblVar::CGIDIR/$GlblVar::SCL_CGI";
require "$myPATH/cgi_interface.pl";


my $compPATH = "$myPATH/skt_gen/compounds";
require "$myPATH/converters/convert.pl";

use warnings;
#use CGI ':standard';

#my $cgi = new CGI;

#print $cgi->header(-type    => 'text/html',
#                   -charset => 'utf-8');

 print "Content-type:text/html;-expires:60*60*24;charset:UTF-8\n\n";

  my %param = &get_parameters();

#if (param) {
  my $input_encoding = $param{input_encoding};
  my $output_encoding = $param{output_encoding};
  my $p1 = $param{pratipadika1};
  my $s1 = $param{pratyaya1};
  my $p2 = $param{pratipadika2};
  my $s2 = $param{pratyaya2};
  my $viXAyakasUwra = $param{viXAyakasUwra};

  $p1wx=&convert($input_encoding,$p1,"$GlblVar::CGIDIR/$GlblVar::SCL_CGI");
  $p2wx=&convert($input_encoding,$p2,"$GlblVar::CGIDIR/$GlblVar::SCL_CGI");
  my $avigraha = $p1wx."+".$s1." ".$p2wx."+".$s2;
  #print "samAsaprakAra cgi avigraha = $avigraha\n";

  my $cmd = "$compPATH/samAsaprakAra.out \"$output_encoding\" \"$avigraha\" \"$p1wx\" \"$s1\" \"$p2wx\" \"$s2\" \"$viXAyakasUwra\"";
  system($cmd);
  #}

