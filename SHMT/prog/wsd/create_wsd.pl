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


open(TMP,"<$ARGV[0]") || die "Can't open $ARGV[0] for reading";
$sent = 1;

while($in = <TMP>){
  if($in =~ /rl([0-9]+).clp/) {
     $sent = $1;  
  }  elsif($in =~ /([0-9]+)[ ]+([0-9]+)[ ]+([^ ]+)[ ]+([^ ]+)[ ]+([^ ]+)[ ]*/) {
       $id = $1;
       $mid = $2;
       $feature_name=$3;
#       if($feature eq "viB") { 
          $old_feature = $4; 
          $new_feature = $5;
          $key = $sent.".".$id.".".$mid.".".$old_feature;
          $MSG{$key} = $new_feature;
       #}
       #elsif($feature eq "rt") { 
       #   $old_rt = $4; 
       #   $new_rt = $5;
       #   $key1 = $sent.".".$id.".".$mid.".".$old_rt;
       #   $MSG{$key1} = $new_rt;
       #}
       #print "MSG = $key = ",$MSG{$key},"\n";
  }
}

$/ = "\n\n";
$sent = 1;
while($in = <STDIN>){
 @in = split(/\n/,$in);
  $id = 1;
 foreach $in (@in) {
   @ans = split(/\//,$in);
   $mid = 1;
   foreach $ans (@ans) {
      if ($ans =~ /<viBakwiH:([^>]+)>/){
          $old_vib = $1;
          $key = $sent.".".$id.".".$mid.".".$old_vib;
          if (defined($MSG{$key})) { 
              $ans =~ s/(.*)<viBakwiH:$old_vib>/$1<viBakwiH:$MSG{$key}>/;
          }
      }
      if ($ans =~ /<rt:([^>]+)>/){
          $old_rt = $1;
          $key = $sent.".".$id.".".$mid.".".$old_rt;
          if (defined($MSG{$key})) { 
              $ans =~ s/(.*)<rt:$old_rt>/$1<rt:$MSG{$key}>/;
          }
      }
      #if ($ans =~ /([^<]+)</){
      #    $old_rt = $1;
      #    $key = $sent.".".$id.".".$mid.".".$old_rt;
      #    #print "MSG = $key = ",$MSG{$key},"\n";
      #    if (defined($MSG{$key})) { 
      #        $ans =~ s/^$old_rt</$MSG{$key}</;
      #    }
      #}
      print $ans;
    $mid++;
    print "\/";
   } 
   print "\n";
   $id++;
}
 print "\n";
 $sent++;
}
