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

#This programme removes all the sup analysis of yaw, if there is no waw in the sentence.
# This is necessary to deal with the ambiguity of yaw - as an avy verses a subant

$/ = "\n\n";

while($in = <STDIN>){
 chomp($in);
 if($in) {
 @in = split(/\n/,$in);
 for ($k=0;$k <=$#in; $k++) {
    $in[$k] =~ s/\$//;
    $in[$k] =~ s/=/\//;
    ($word,@analysis) = split(/\//, $in[$k]);

    print $word,"=";
 
     my $ans = "";
     if ($word eq "yaw") {
        foreach ($i=0; $i<=$#analysis;$i++){
         if ($analysis[$i] =~ /yax<vargaH:sarva/) {
             $found = 0;
             foreach ($j=0; $j<=$#in; $j++){
               if($j != $k) {
                  if ($in[$j] =~ /wax<vargaH:sarva/) { 
                      $found = 1;
                  }
               }
             }
             if($found) { if($i>0) { $ans .= "/";} $ans .= $analysis[$i];}
          } else { if($i>0) { $ans .= "/";} $ans .= $analysis[$i];}
        }
     }
     if ($ans eq "") { $ans = join ("/",@analysis);}
     print $ans, "\n";
  }
 }
# print "\n";
}
