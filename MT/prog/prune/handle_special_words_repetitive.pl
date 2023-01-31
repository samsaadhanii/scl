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

#This function handles special words such as vAram vAram which when repeated are avyays.
$in = <STDIN>;
chomp($in);
($prev_wrd,$prev_ana) = split(/=/,$in);

while($in = <STDIN>){
chomp($in);
($wrd,$ana) = split(/=/,$in);
if(($prev_wrd eq $wrd) && ($prev_wrd eq "vAram")){
    $prev_ana = "vAraM<vargaH:avy><level:1>"; 
    $ana = "vAraM<vargaH:avy><level:1>"; 
}
if($prev_wrd) { 
   print $prev_wrd,"=",$prev_ana,"\n";
} else { print "\n";}
$prev_wrd = $wrd;
$prev_ana = $ana;
}
if($prev_wrd) { 
   print $prev_wrd,"=",$prev_ana,"\n";
}# else { print "\n";}
