#!/usr/bin/env perl

#  Copyright (C) 2010-2025 Amba Kulkarni (ambapradeep@gmail.com)
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
$myPATH="$GlblVar::CGIDIR/$GlblVar::SCL_CGI";
require "$myPATH/cgi_interface.pl";
require "$myPATH/skt_gen/kqw/kqw_gen_subroutines.pl";


#Usage:
#https://sanskrit.uohyd.ac.in/cgi-bin/scl/skt_gen/kqw/kqw_gen.cgi?vb=gam1_gamLz_BvAxiH_gawO&upasarga=-&encoding=WX&outencoding=Devanagari&mode=json
#
###################  Main function #################
#
#package main;

	my $format="web";
	my %param = &get_parameters();
        my $vb=$param{vb};
        my $upasarga=$param{upasarga};
        my $encoding=$param{encoding};
        my $outencoding=$param{outencoding};
        if($param{mode} eq "json") { $format = "JSON";}
        #if($param{outencoding} eq "IAST") { $outencoding = "IAST";} else { $outencoding = "Devanagari";}

	if($format eq "web") {
           &open_log($GlblVar::LOG, $GlblVar::TFPATH);
	   &print_header();
        }

         if($format eq "JSON") {
           print "Access-Control-Allow-Origin: *\n";
           print "Content-type:text/html;-expires:60*60*24;charset:UTF-8\n\n";
         }

	if ($outencoding eq "IAST") {
	 $conversion_program = "$myPATH/converters/wx2utf8roman.out";
	} else {
	 $conversion_program = "$myPATH/converters/ri_skt | $myPATH/converters/iscii2utf8.py 1";
	}

	my @forms= &gen_kqw_forms($vb,$upasarga,$format,$conversion_program,$outencoding);
	print @forms;
		
	if($format eq "web") {
	   &register_log_and_close($GlblVar::LOG,$vb,$upasarga,$encoding,%ENV);
        }
