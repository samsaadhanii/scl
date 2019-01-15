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



#This module adds <s> and <p> tags to the output and also joins the compounds.

$/ = "\n\n";

while($in = <STDIN>){

  @in = split(/\n/,$in);

  $cmpd = 0;
  $i=0;
  while($i<=$#in){
    @flds = split(/\t/,$in[$i]);
# Join compound components
    
    $k = $i+1; 
    while($cmpd || ($flds[5] =~ /<vargaH:sa\-pU\-pa><level:0>$/)) {
       @next_flds = split(/\t/,$in[$k]);
       for ($j=1;$j<=$#flds;$j++){
         if(($flds[$j] ne "") && ($next_flds[$j] ne "") && ($j != 1) && ($j != 3)){
            $flds[$j] .= "-".$next_flds[$j];
         }
       }
       $in[$i] = join("\t",@flds);
       #print "INTMD i  in $i $in[$i]\n";
       $in[$k] = "";
       if( $next_flds[5] =~ /<vargaH:sa\-pU\-pa><level:0>/) {$cmpd = 1;} 
       else {$cmpd = 0;}
       #print "k cmpd = $k $cmpd\n";
       $k++;
    }
   if($i == $#in) { $flds[4] = ".</a>";}
   $in[$i] = join("\t",@flds);
   $i = $k;
  }

  for ($i=0;$i<=$#in;$i++){
   if($in[$i] ne "") {print $in[$i],"\n";}
  }
  print "\n";
}
