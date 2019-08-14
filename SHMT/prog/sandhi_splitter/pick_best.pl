#!/usr/bin/env perl

#  Copyright (C) 2009-2019 Amba Kulkarni (ambapradeep@gmail.com)
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



$in1 = <STDIN>;
 chomp($in1);
 ($ana1,$wt1) = split(/\t/,$in1);
# print "in1 = $in1\n";
 while($in2 = <STDIN>){
    chomp($in2);
# print "in2 = $in1\n";
    ($ana2,$wt2) = split(/\t/,$in2);
    if($wt2 == 0){ print $in1,"\n";}
    elsif($wt1 == 0){ print $in2,"\n";}
    elsif($wt1 < $wt2) { print $in2,"\n";}
    elsif($wt2 < $wt1) { print $in1,"\n";}
    $in1 = $in2;
    $wt1 = $wt2;
}
