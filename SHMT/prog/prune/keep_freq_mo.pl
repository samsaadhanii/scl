#!/usr/bin/env perl

#  Copyright (C) 2010-2019 Amba Kulkarni (ambapradeep@gmail.com)
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

#BEGIN{require "$ARGV[0]/paths.pl";}

#use lib $GlblVar::LIB_PERL_PATH;

#use GDBM_File;
#tie(%MORPH,GDBM_File,$ARGV[1],GDBM_READER,0444) || die "Can't open $ARGV[1] for reading";
open(TMP,$ARGV[0]) || die "Can't open $ARGV[0] for reading";
while(<TMP>) {
chomp;
$_ =~ /^(.*)=(.*)$/;
$MORPH{$1}=$2;
}
close(TMP);

while($in = <STDIN>){
   chomp($in);
   if($in){
    ($word,$analysis) = split(/=/, $in);
    if($MORPH{$word} ne "") { print $word,"=",$MORPH{$word};}
    else { print $in;}
   }
   print "\n";
}
