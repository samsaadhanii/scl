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


$prev_wrd = "";
$prev_ana = "";
while($ana = <STDIN>){
  chomp($ana);
     if($ana =~ /<kqw_prawyayaH:Namul>/) {
        @analysis = split(/\//, $ana);
        $found = 0; 
        $ans = "";
        foreach ($i=0; $i<=$#analysis;$i++){
            if($analysis[$i] =~ /<kqw_prawyayaH:Namul>/) {
               if(($prev_ana =~ /$analysis[$i]\//) || ($prev_ana =~ /$analysis[$i]$/)){ 
                   $ans .= "/".$analysis[$i]; 
                   $found = 1;
               }
            }
        }
        if(!$found) { print $ana;} else {$ans =~ s/^\///; print $ans;}
     } else { print $ana;}
 $prev_wrd = $wrd;
 $prev_ana = $ana;
 print "\n";
}
