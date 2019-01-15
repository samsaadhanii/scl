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

#BEGIN{require "$ARGV[0]/paths.pl";}

#use lib $GlblVar::LIB_PERL_PATH;

#use GDBM_File;

#tie(%kAraka_name,GDBM_File,"$ARGV[1]",GDBM_READER,0644) || die "Can't open $ARGV[1] for reading";
#tie(%kAraka_num,GDBM_File,"$ARGV[2]",GDBM_READER,0644) || die "Can't open $ARGV[2] for reading";

open(TMP,"$ARGV[1]/kAraka_names.txt") || die "Can't open $ARGV[1]/kAraka_names.txt for reading";
while(<TMP>) {
chomp;
if(/^([^ ]+) ([0-9]+)/){
$num = $2;
$name = $1;
$kAraka_name{$num}=$name;
$kAraka_num{$name}=$num;
}
}
close(TMP);


#In case of yaxA-waxA, the relation between yaxA and waxA is a 'niwya sambanXaH'.
# But if the relation between yaxA-waxA is marked, then
#  i) the properties of a tree are destroyed
# ii) the relation between yaxA and waxA is not due to any vibhakti marker but is due to the pratipadikas.

# If we do not mark the relation, the two sentences 'yaxA meGaH varRawi' and 'waxA mayUraH nqwyawi' would be two isolated sentences. But yaxA has an AkAnksha of waxA.
# Hence, to get a tree structure from MINION, the constraint solver, we mark the relation between waxA and varRawi as a niwya sambanXa
# and in this we corerct it to the relation between yaxA and waxA as a niwya sambanXa.
$ans = "";
$i=0;

while($in = <STDIN>){
  chomp($in);
  if($in =~ /./) {
      if($in =~ /Cost/){
         $lans = $in."\n";
      }elsif($in !~ /^\(/){
         $ans .= $in."\n";
      } elsif($in =~ /\(/){
         $in =~ /([0-9]+),([0-9]+),([0-9]+),([0-9]+),([0-9]+)/;
         $rel_nm = $3;
         $k_rel_nm[$i] = $kAraka_name{$rel_nm};
         $in[$i] = $in;
         $i++;
      }
  } else {
    for($j=0;$j<=$i;$j++){
#If it is niwya_sambanXaH (pseudo)
       if($k_rel_nm[$j] eq "niwya_sambanXaH") {
         $in[$j] =~ /([0-9]+,[0-9]+),[0-9]+,[0-9]+,[0-9]+/;
# Get main position of verb to which waxA is joined by niwya sambanXaH
         $verb_pos = $1;
         for($k=0;$k<$i;$k++){
            if(($in[$k] =~ /([0-9]+,[0-9]+),[0-9]+,$verb_pos/) &&
               (($k_rel_nm[$k] eq "kAlAXikaraNam") ||
                ($k_rel_nm[$k] eq "xeSAXikaraNam"))) {
               $yaw_pos = $1;
               $in[$j] =~ s/$verb_pos,/$yaw_pos,/;
            }
         }
       }
     }
     for($j=0;$j<$i;$j++){
         if($in[$j]) { $ans .= $in[$j]."\n";}
     }
     $ans .= $lans;
     print $ans,"\n";
     $ans = "";
     $i=0;
  }
 }
 print $ans;
