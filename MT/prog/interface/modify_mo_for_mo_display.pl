#!/usr/bin/env perl

#  Copyright (C) 2009-2023 Amba Kulkarni (ambapradeep@gmail.com)
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

$SCLINSTALLDIR = $ARGV[0];

require "$SCLINSTALLDIR/MT/prog/interface/modify_mo_fn.pl";

while($in = <STDIN>){
 chomp $in;
 $in = &modify_mo($in);
 # $in =~ s/<kqw_XAwu:([^>]+)>< upasarga:([^>]+)>/$2_$1/g;
 #$in =~ s/<kqw_XAwu:([^>]+)>/$1/g;

 $in =~ s/^[^\/]+<level:0>//;
 $in =~ s/\/[^\/]+<level:0>//g;
# $in =~ s/^[^<]+<level:4>//;
# $in =~ s/\/[^<]+<level:4>//g;
 print "$in\n";
}
