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
require "$GlblVar::CGIDIR/$GlblVar::SCL_CGI/skt_gen/kqw/kqw_gen_subroutines.pl";

#
###################  Main function #################
#
package main;

	my %param = &get_parameters();
        my $word=$param{vb};
        my $upasarga=$param{upasarga};
        my $encoding=$param{encoding};

        &open_log($GlblVar::LOG, $GlblVar::TFPATH);
	&print_header();

        #print "<script>\n";
        #print "function generate_noun_forms(prAwi,lifga,$encoding,$out_encoding){\n";
        #print "  window.open('/cgi-bin/$GlblVar::SCL_CGI/skt_gen/noun/noun_gen_web.cgi?encoding=$encoding&rt='+prAwi+'&gen='+lifga+'&jAwi='nA'&level=1&outencoding=out_encoding'+'','popUpWindow','height=500,width=400,left=100,top=100,resizable=yes,scrollbars=yes,toolbar=yes,menubar=no,location=no,directories=no, status=yes').focus();\n";
        #print "}\n";
        #print "</script>\n";

	if ($encoding eq "IAST") {
	 $conversion_program = "$GlblVar::CGIDIR/$GlblVar::SCL_CGI/converters/wx2utf8roman.out";
	} else {
	 $conversion_program = "$GlblVar::CGIDIR/$GlblVar::SCL_CGI/converters/ri_skt | $GlblVar::CGIDIR/$GlblVar::SCL_CGI/converters/iscii2utf8.py 1";
	}

	$format="web";
	my @forms= &gen_kqw_forms($word,$upasarga,$format,$conversion_program,$encoding);
	print @forms;
		
	&register_log_and_close($GlblVar::LOG,$word,$upasarga,$encoding,%ENV);
