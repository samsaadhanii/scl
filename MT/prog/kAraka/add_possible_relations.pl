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

open (TMP,"<$ARGV[0]");
while(($in = <TMP>) && ($in ne "\n")){
@flds = split(/ /,$in);
if($REL{$flds[0]} !~ /$flds[5],$flds[3]/) {
   $REL{$flds[0]} .= $flds[5].",".$flds[3];
}
}
close(TMP);

$index = 1;
while($in = <STDIN>){
  chomp($in);
  $REL{$index} =~ s/^#//;
  $REL{$index} =~ s/#/\//g;
  if ($REL{$index} eq "") { $REL{$indx} = "-";}
  print $in,"\t",$REL{$index},"\n";
  $index++;
}
