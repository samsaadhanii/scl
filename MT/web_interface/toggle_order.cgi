#!/usr/bin/env perl

#  Copyright (C) 2002-2023 Amba Kulkarni (ambapradeep@gmail.com)
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
require "../paths.pl";
require "$GlblVar::SCLINSTALLDIR/cgi_interface.pl";

  my %param = &get_parameters();

  my $script=$param{out_encoding};
  my $pid=$param{pid};
  my $sentences=$param{sentences};
  my $order=$param{order};

  print "Content-type:text/html;-expires:60*60*24;charset:UTF-8\n\n";
   
  system("$GlblVar::SCLINSTALLDIR/MT/prog/interface/display_output.pl $GlblVar::SCLINSTALLDIR $GlblVar::TFPATH $script $pid $sentences $order");
  system("$GlblVar::SCLINSTALLDIR/MT/prog/interface/print_table_bottom_menu.pl $pid $sentences $GlblVar::TFPATH $script $order");
