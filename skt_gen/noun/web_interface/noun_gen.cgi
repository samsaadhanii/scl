#!/usr/bin/env perl

#  Copyright (C) 2010-2023 Amba Kulkarni (ambapradeep@gmail.com)
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
require "$GlblVar::CGIDIR/$GlblVar::SCL_CGI/cgi_interface.pl";
require "$GlblVar::CGIDIR/$GlblVar::SCL_CGI/converters/convert2WX_subroutines.pl";
require "$GlblVar::CGIDIR/$GlblVar::SCL_CGI/skt_gen/noun/noun_gen_subroutines.pl";
require "$GlblVar::SCLINSTALLDIR/MT/prog/Normalisation/get_std_spelling_fn.pl";

#
###################  Main function #################
#
#
## Call json as below
# noun_gen.cgi?rt=rAma&gen=puM&jAwi=nA&level=1&mode=json&encoding=WX&outencoding=Unicode
# gen: napuM, puM, swrI, a
# jawi: nA, sarva, saMKyeyam, saMkyA, pUraNam
# level: 1,2,3,4
# mode: json
# encoding: WX, SLP, VH, KH, IAST, Unicode, Itrans
# outencoding: Unicode, IAST

package main;

        my $format = "web";
	my %param = &get_parameters();
	my $encoding=$param{encoding};
	my $outencoding=$param{outencoding};
	my $rt=$param{rt};
	my $gen=$param{gen};
	my $jAwi=$param{jAwi};
	my $level=$param{level};
        
        if($param{mode} eq "json") { $format = "JSON";}

        if($format eq "web") {
           &open_log($GlblVar::LOG, $GlblVar::TFPATH);
   	   &print_header();
        }

         if($format eq "JSON") {
           print "Access-Control-Allow-Origin: *\n";
           print "Content-type:text/html;-expires:60*60*24;charset:UTF-8\n\n";
         }

	$rt_wx = &convert($encoding,$rt);
	$rt_new = &get_std_spelling_fn($rt_wx);

	if ($outencoding eq "IAST") {
	 $conversion_program = "$GlblVar::CGIDIR/$GlblVar::SCL_CGI/converters/wx2utf8roman.out";
	} else {
	 $conversion_program = "$GlblVar::CGIDIR/$GlblVar::SCL_CGI/converters/ri_skt | $GlblVar::CGIDIR/$GlblVar::SCL_CGI/converters/iscii2utf8.py 1";
	}

	my @forms= &gen_noun_forms($rt_new,$jAwi,$gen,$level,$format,$conversion_program,$outencoding);
	print @forms;
		
        if($format eq "web") {
	   &register_log_and_close($GlblVar::LOG,$rt,$gen,$encoding,$jAwi,%ENV);
        }

