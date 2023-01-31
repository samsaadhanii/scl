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



#Remove the saMKyA analysis, since this we find only in the ganita text.
#So for general texts, this may be deleted.

while($in = <STDIN>){
  if($in =~ /<vargaH:saMKyA>/) {
     chomp($in);
     $in =~ s/=/\//;
    ($word,@analysis) = split(/\//, $in);
 
    print $word,"=";
    $ans = "";
    $found = 0;
    foreach ($i=0; $i<=$#analysis;$i++){
       if($analysis[$i] !~ /<vargaH:saMKyA>/) {
         $ans .= "/". $analysis[$i];
         $found = 1;
       }
    }
    if($found) { $ans =~ s/^\///; print $ans,"\n";}
  } else { print $in;}
}
