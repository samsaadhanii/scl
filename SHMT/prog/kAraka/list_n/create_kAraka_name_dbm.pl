#!/usr/bin/env perl

#  Copyright (C) 2002-2018 Amba Kulkarni (ambapradeep@gmail.com)
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

BEGIN {require "../../../../paths.pl";}

use lib $GlblVar::LIB_PERL_PATH;

use GDBM_File;
tie(%LEX,GDBM_File,$ARGV[0],GDBM_WRCREAT,0666) || die "Can't open $ARGV[0] for writing\n";
tie(%LEX1,GDBM_File,$ARGV[1],GDBM_WRCREAT,0666) || die "Can't open $ARGV[1] for writing\n";

while(<STDIN>) {
chomp;
if(/^([^ ]+) ([0-9]+)/){
$num = $2;
$name = $1;
$LEX{$num}=$name;
$LEX1{$name}=$num;
}
}
untie(%LEX);
untie(%LEX1);
