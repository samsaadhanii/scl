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

#
###################  Main function #################
#
## Call this as below
# noun_gen_json.cgi?rt=rAma&gen=puM&jAwi=nA&level=1
# gen: napuM, puM, swrI, a
# jawi: nA, sarva, saMKyeyam, saMkyA, pUraNam
# level: 1,2,3,4

print "Access-Control-Allow-Origin: *\n";
 print "Content-type:text/html;-expires:60*60*24;charset:UTF-8\n\n";
        my %param = &get_parameters();

package main;

	my %param = &get_parameters();
	my $rt=$param{rt};
	my $gen=$param{gen};
	my $jAwi=$param{jAwi};
	my $level=$param{level};

	$format="JSON";
	$conversion_program = "";
	$outencoding="";
	my @forms= &gen_noun_forms($rt,$jAwi,$gen,$level,$format,$conversion_program,$outencoding);
	print @forms;
