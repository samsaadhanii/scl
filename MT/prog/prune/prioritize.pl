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

#The sawi sapwami reading used to be the 1st one, and in case m/c failed to provide a parse, it used to give wrong translation.
#Hence this reading is moved to the last.
while($in = <STDIN>){
   chomp($in);
   if($in){
    ($word,$analysis) = split(/=/, $in);
    print $word,"=";
    @analysis = split(/\//,$analysis);
    $head = "";
    $tail = "";
    foreach $tmp (@analysis) {
     if($tmp =~ /\$$/) { $tmp =~ s/\$$//;}
     if ($tmp =~ /^[a-zA-Z]+\-[a-zA-Z]+</) { $head .= "/".$tmp;}
     elsif($tmp =~ /viBakwiH:7/) { $tail .= "/". $tmp;}
     elsif($tmp =~ /level:[234]/) { $tail .= "/". $tmp;}
     elsif($tmp =~ /vargaH:sarva/) { $head .= "/". $tmp;}
     elsif($tmp =~ /lakAraH:lat/) { $head .= "/". $tmp;}
     elsif($tmp =~ /level:1/) { $head .= "/". $tmp;}

    }
    if($head && $tail) {
       $head =~ s/^\///;
       $tail =~ s/^\///;
       print $head,"/",$tail;
    } else { print $analysis;}
   } else { print $in;}
   print "\n";
}
