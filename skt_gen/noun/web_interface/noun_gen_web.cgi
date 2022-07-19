#!/usr/bin/env perl

#  Copyright (C) 2010-2022 Amba Kulkarni (ambapradeep@gmail.com)
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
require "$GlblVar::CGIDIR/scl/cgi_interface.pl";
require "$GlblVar::CGIDIR/scl/skt_gen/noun/noun_gen_subroutines.pl";

my @vacanam = ("eka","xvi","bahu");

#
###################  Main function #################
#
package main;

	my %param = &get_parameters();
	my $encoding=$param{encoding};
	my $outencoding=$param{outencoding};
	my $rt=$param{rt};
	my $gen=$param{gen};
	my $jAwi=$param{jAwi};
	my $level=$param{level};

        &open_log($GlblVar::LOG, $GlblVar::TFPATH);
	&print_header();

	$rt_wx = &convert($encoding,$rt);

	if ($outencoding eq "IAST") {
	 $conversion_program = "$GlblVar::CGIDIR/scl/converters/wx2utf8roman.out";
	} else {
	 $conversion_program = "$GlblVar::CGIDIR/scl/converters/ri_skt | $GlblVar::CGIDIR/scl/converters/iscii2utf8.py 1";
	}

	$format="web";
	my @forms= &gen_noun_forms($rt_wx,$jAwi,$gen,$level,$format,$conversion_program,$outencoding);
	print @forms;
		
	&register_log_and_close($GlblVar::LOG,$rt,$gen,$encoding,$jAwi,%ENV);
