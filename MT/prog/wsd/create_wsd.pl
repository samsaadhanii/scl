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


open(TMP,"<$ARGV[0]") || die "Can't open $ARGV[0] for reading";
$sent = 1;

while($in = <TMP>){
  if($in =~ /([0-9]+)[ ]+([0-9]+)[ ]+([^ ]+)[ ]+([^ ]+)[ ]+([^ ]+)[ ]*/) {
       $id = $1;
       $cid = $2;
       $feature_name=$3;
       $old_feature = $4; 
       $new_feature = $5;
       $key = $id.".".$cid.".".$old_feature;
       $MSG{$key} = $new_feature;
  }
}

$/ = "\n\n";
while($in = <STDIN>){
 @in = split(/\n/,$in);
 foreach $ans (@in) {
      if ($ans =~ /<word:\.>/) { print "-\n";}
      else {
        $ans =~ /<id:([^>]+)>/;
        $id = $1;
        $ans =~ /<cid:([^>]+)>/;
        $cid = $1;
        if ($ans =~ /<viBakwiH:([^>]+)>/){
            $old_vib = $1;
            $key = $id.".".$cid.".".$old_vib;
            if (defined($MSG{$key})) { 
                $ans =~ s/(.*)<viBakwiH:$old_vib>/$1<viBakwiH:$MSG{$key}>/;
            }
        }
        if ($ans =~ /<rt:([^>]+)>/){
            $old_rt = $1;
            $key = $id.".".$cid.".".$old_rt;
            if (defined($MSG{$key})) { 
                $ans =~ s/(.*)<rt:$old_rt>/$1<rt:$MSG{$key}>/;
            }
        }
        if ($ans =~ /<kqw_prawyayaH:([^>]+)>/){
            $old_prawyaya = $1;
            $key = $id.".".$cid.".".$old_prawyaya;
            if (defined($MSG{$key})) { 
                $ans =~ s/(.*)<kqw_prawyayaH:$old_prawyaya>/$1<kqw_prawyayaH:$MSG{$key}>/;
            }
        }
        print $ans,"\n";
    }
 }
}
