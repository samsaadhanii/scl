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
require "$GlblVar::SCLINSTALLDIR/cgi_interface.pl";

package main;

    my %param = &get_parameters();

      my $word=$param{vb};
      my $prayoga_paxI=$param{prayoga_paxI};
      my $upasarga=$param{upasarga};
      my $encoding=$param{encoding};
      my $outencoding=$param{outencoding};

      if($prayoga_paxI =~ /\-/) {
        ($prayoga,$paxI) = split(/-/,$prayoga_paxI,2);
      } else {$prayoga = $prayoga_paxI;}

      $upasarga =~ s/Y/_/g;

      my $result = `$GlblVar::CGIDIR/$GlblVar::SCL_CGI/skt_gen/verb/gen_verb.pl $encoding $outencoding $prayoga $upasarga $word $paxI json`;
      print $result;
