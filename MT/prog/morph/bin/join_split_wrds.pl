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


while($in = <STDIN>){
chomp($in);
@flds = split(/=/,$in,2);
 $flds[0] =~ s/^-(.+)/$1/;
 if($flds[1] eq "") { $flds[1] = $flds[0]; $flds[1] =~ s/(.+)-$/$1/;}
 if($flds[0] =~ /(.+)-$/) { 
    $wrd .= $flds[0]; 
    $ana .= $flds[1]."-";  
 } else { 
  $wrd .= $flds[0]; 
  $ana .= $flds[1];
  $ana =~ s/^[\/]\+//;
  $ana =~ s/[\/]\+$//;
  print $wrd,"\t",$ana,"\n";
  $wrd = "";
  $ana = "";
 }
}
