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

$SCLINSTALLDIR=$ARGV[0];

require "$SCLINSTALLDIR/MT/prog/interface/modify_mo_fn.pl";

$| = 1;
while($in = <STDIN>){

chomp $in;

if($in =~ /./) {
 #while($in =~ /([a-zA-Z]+)<vargaH:sapUpa><lifgam:(napuM|puM|swrI)><level:0>/) {
 # $in =~ s/\-([a-zA-Z]+<vargaH:sapUpa><lifgam:[^>]+><level:0>\/)*([a-zA-Z]+)<vargaH:sapUpa><lifgam:[^>]+><level:0>\$/-$2/g;
 # $in =~ s/\t([a-zA-Z]+<vargaH:sapUpa><lifgam:[^>]+><level:0>\/)*([a-zA-Z]+)<vargaH:sapUpa><lifgam:[^>]+><level:0>\$/\t$2-/g;
 # $in =~ s/\-([a-zA-Z]+<vargaH:sapUpa><lifgam:[^>]+><level:0>\/)*([a-zA-Z]+)<vargaH:sapUpa><lifgam:[^>]+><level:0>/-$2/g;
 # $in =~ s/\t([a-zA-Z]+<vargaH:sapUpa><lifgam:[^>]+><level:0>\/)*([a-zA-Z]+)<vargaH:sapUpa><lifgam:[^>]+><level:0>/\t$2-/g;
 #}


@in = split(/\t/,$in);

 for($i=0;$i<$#in;$i++){
   $in = &modify_mo($in[$i]);
   $in = &clean_other_info($in);
   $in =~ s/ZZ/--/g;
   print $in,"\t";
 }
   $in = &modify_mo($in[$#in]);
   $in = &clean_other_info($in);
   print $in,"\n";
 } else { print "\n";}
}


sub clean_other_info {
my ($in) = @_;

$in =~ s/<vargaH:nA>//g;
$in =~ s/<vargaH:sarvanAma>//g;
$in =~ s/<vargaH:pUraNam>//g;
$in =~ s/<vargaH:safKyA>//g;
$in =~ s/<vargaH:safKeya>//g;
$in =~ s/<vargaH:sapUpa>//g;
$in =~ s/<vargaH:SaUPa[^>]+>//g;
$in =~ s/\(([^<]+)<upasarga:([^>]+)>/\($2_$1/g;

$in;
}
1;
