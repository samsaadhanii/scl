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


sub get_std_spelling_fn{
my($in) = @_;

$in =~ s/M([kKgGf])/f$1/g;
$in =~ s/M([cCjJF])/F$1/g;
$in =~ s/M([tTdDN])/N$1/g;
$in =~ s/M([wWxXn])/n$1/g;
$in =~ s/M([pPbBm])/m$1/g;
$in =~ s/M$/m/g;
$in =~ s/ms$/Ms/;
$in =~ s/zS/MS/g;
#$in =~ s/x$/w/g; THIS IS A WRONG RULE.
$in =~ s/rww([aeiouAEIOUqQ])/rw$1/g;
$in =~ s/M(\b)/m$1/g;

$in;
}
1;
