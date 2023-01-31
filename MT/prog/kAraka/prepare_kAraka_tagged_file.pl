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

$field1 = $ARGV[0];
$field2 = $ARGV[1];

$/ = "\n\n";
while($in = <STDIN>){
  $sent = "";
  @in = split(/\n/,$in);
  for ($i=0;$i<=$#in;$i++) {
      chomp($in[$i]);
      @fields = split(/\t/,$in[$i]);
      $sent .= " ".$fields[$field1];      
  }
  print "SENT:$sent\n";
  print "ANALYSIS:\n";
  for ($i=0;$i<=$#in;$i++) {
    $num = $i+1;
    @fields = split(/\t/,$in[$i]);
    $fields[$field2] =~ s/aBihiwa_.*//;
    if($fields[$field2] ne "") {
       print $num,"\t",$fields[$field1],"\t",$fields[$field2],"\n";
    } else { 
       print $num,"\t",$fields[$field1],"\n";
    }
  }
  print "\n";
}
