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

#Remove the xvivacana analysis of a noun, if the total analysis > 5

while($in = <STDIN>){
     chomp($in);
     ($word,$in1) = split(/=/,$in); 
     @analysis = split(/\//, $in1);

    if ($#analysis < 5 ) { print $in,"\n";}
    elsif ($in1 =~ /uBa</) { print $in,"\n"}
    elsif ($word =~ /^\-/) { print $in,"\n";}
    else {
       $ans = "";
       foreach ($i=0; $i<=$#analysis;$i++){
          if($analysis[$i] !~ /<vargaH:nA>.*<vacanam:xvi>/) { $ans .= "/". $analysis[$i]; }
       }
       $ans =~ s/^\///; 
       if($ans eq "") { print $in,"\n";}
       else {print $word,"="; print $ans,"\n";}
    }
}
