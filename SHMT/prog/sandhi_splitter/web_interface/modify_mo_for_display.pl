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



$| = 1;
while($in = <STDIN>){
chomp $in;
 $in =~ s/^\^//;
 $in =~ s/\$$//;
 ($wrd,$ana) = split(/\//,$in,2);
 print $wrd,"=";
 $in = $ana;
#print "in = $in\n";
 while($in =~ /([a-zA-Z]+)<vargaH:sa\-pU\-pa><lifgam:(napuM|puM|swrI)><level:0>/) {
  $in =~ s/\-([a-zA-Z]+<vargaH:sa\-pU\-pa><lifgam:[^>]+><level:0>\/)*([a-zA-Z]+)<vargaH:sa\-pU\-pa><lifgam:[^>]+><level:0>\$/-$2/g;
  $in =~ s/^([a-zA-Z]+<vargaH:sa\-pU\-pa><lifgam:[^>]+><level:0>\/)*([a-zA-Z]+)<vargaH:sa\-pU\-pa><lifgam:[^>]+><level:0>\$/$2/g;
  $in =~ s/\-([a-zA-Z]+<vargaH:sa\-pU\-pa><lifgam:[^>]+><level:0>\/)*([a-zA-Z]+)<vargaH:sa\-pU\-pa><lifgam:[^>]+><level:0>/-$2/g;
  $in =~ s/^([a-zA-Z]+<vargaH:sa\-pU\-pa><lifgam:[^>]+><level:0>\/)*([a-zA-Z]+)<vargaH:sa\-pU\-pa><lifgam:[^>]+><level:0>/$2/g;
 }

#print "in1 = $in\n";
 if($in) {
  @ansj = split(/\//, $in);
  $in =~ s/></;/g;
  $in =~ s/</{/g;
  $in =~ s/>/}/g;
  $in =~ s/vargaH:avy;level/avya;level/g;
  $in =~ s/vargaH:avy;/;/g;
  $in =~ s/vargaH:avy/avya/g;
  $in =~ s/kqw_pratipadika:[^;]+//g;
  $in =~ s/vargaH:[^;]+//g;
  $in =~ s/;vacanam:1/;eka/g;
  $in =~ s/;vacanam:2/;xvi/g;
  $in =~ s/;vacanam:3/;bahu/g;
  $in =~ s/;lifgam:a/;}{/g;
  $in =~ s/;lifgam:([^;]+)/;$1}{/g;
  $in =~ s/;viBakwiH:/;/g;
  $in =~ s/;gaNaH:/;/g;
  $in =~ s/;paxI:/;/g;
  $in =~ s/;XAwuH:/;/g;
  $in =~ s/kqw_prawyayaH:([^;]+)/$1/g;
  $in =~ s/;prawyayaH:([^;]+)/;$1/g;
  $in =~ s/;waxXiwa_prawyayaH:([^;]+)/;$1}{/g;
  $in =~ s/{prayogaH:([^;]+)/{$1/g;
  $in =~ s/;puruRaH:([^;]+)/;$1/g;
  $in =~ s/;lakAraH:([^;]+)/;$1/g;
  $in =~ s/rel_nm:[^;]*//g;
  $in =~ s/relata_pos:[0-9]*//g;
  $in =~ s/level:[0-9]//g;
  $in =~ s/;;+/;/g;
  $in =~ s/{;/{/g;
  $in =~ s/{}//g;
  $in =~ s/;}/}/g;
  $in =~ s/\$//g;
  $in =~ s/{p;s;a}/<p><s><a>/g;
  $in =~ s/{s;a}/<s><a>/g;
  $in =~ s/{\/a;\/s;\/p}/<\/a><\/s><\/p>/g;
  $in =~ s/{\/a;\/s}/<\/a><\/s>/g;
  $in =~ s/{p;s}/<p><s>/g;
  $in =~ s/{\/s;\/p}/<\/s><\/p>/g;
  $in =~ s/{a}/<a>/g;
  $in =~ s/{\/a}/<\/a>/g;
  $in =~ s/\/\t/\t/g;
  print $in;
 }
  print "\n";
}
