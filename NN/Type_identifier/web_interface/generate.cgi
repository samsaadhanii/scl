#!/usr/bin/env perl

#  Copyright (C) 2013-2023 Amba Kulkarni (ambapradeep@gmail.com)
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
#use CGI::Carp qw(fatalsToBrowser);

use utf8;

require "../../paths.pl";
require "$GlblVar::SCLINSTALLDIR/cgi_interface.pl";

my $converters_path="$GlblVar::SCLINSTALLDIR/converters";
my $NNtype_path="$GlblVar::SCLINSTALLDIR/NN/Type_identifier";

require "$GlblVar::SCLINSTALLDIR/NN/common/style.pl";
require "$GlblVar::SCLINSTALLDIR/NN/Type_identifier/generate_samAsa_const_parse.pl";

my $pid = $$;

#      my $cgi = new CGI;
#      print $cgi->header (-charset => 'UTF-8');
      print "Content-type:text/html;-expires:60*60*24;charset:UTF-8\n\n";

	print $NN::style_header;
	print $NN::title;

	my %param = &get_parameters();

	#      if (param) {
        my $nne=$param{nne};
        my $pid = $$;

        print "<center>";
        my $samAsa = `echo '$nne' | $converters_path/utf82iscii.pl | $converters_path/ir_skt | $NNtype_path/typeidentifier.out $type | $converters_path/ri_skt | $converters_path/iscii2utf8.py 1`;
        my $dot = &get_dot($samAsa);
        print $samAsa,"<br />";
        system ("echo '$dot' | dot -Tsvg;");

        print "</center><br />";
	#}
	print $style_tail;
