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
## Call this as below
# kqw_gen_json.cgi?rt=gam1_gamL_gawO_BvAxiH&upasarga=-

 print "Access-Control-Allow-Origin: *\n";
 print "Content-type:text/html;-expires:60*60*24;charset:UTF-8\n\n";
        my %param = &get_parameters();

package main;

	my %param = &get_parameters();
	my $word=$param{vb};
	my $upasarga=$param{upasarga};
	my $encoding=$param{encoding};

	$format="JSON";
	$conversion_program = "";
	my @forms= &gen_kqw_forms($word,$upasarga,$conversion_program);
	print @forms;
