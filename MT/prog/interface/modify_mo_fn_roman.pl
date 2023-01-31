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



sub modify_mo{
 my($in) = @_;
 if($in) {
    if($in =~ /^([^<>]+\-)/) {
    $pUrvapaxa = $1;
  } else {
    $pUrvapaxa = "";
  }
 # print "pUrvapaxa=",$pUrvapaxa,"</br>";
#  print "in1=",$in,"</br>";
  $in =~ s/^<torḍ:[^>]+>//g;
  $in =~ s/^([^\/]+>)(<kṛt_praṭipaḍika:[a-zA-Z]+>)(<[^\/]+>)/$pUrvapaxa$2$3($1)/;
  $in =~ s/\/([^\/]+>)(<kṛt_praṭipaḍika:[a-zA-Z]+>)(<[^\/]+>)/\/$pUrvapaxa$2$3($1)/g;

  $in =~ s/<vargaḥ:avy>/ avya/g;
  $in =~ s/<kṛt_praṭipaḍika:([^>]+)>/$1/g;
  $in =~ s/<vargaḥ:saṃkhyeyam>/ saṃkhyeyam/g;
  $in =~ s/<vargaḥ:saṃkhyA>/ saṃkhyā/g;
  $in =~ s/<vargaḥ:sarva>/ sarvanāma/g;
  $in =~ s/<vargaḥ:nA_[^>]+>/<vargaḥ:nā>/g;

  $in =~ s/<vargaḥ:[^>]+>//g;
  $in =~ s/<kṛt_praṭipaḍika:[^>]+//g;
  $in =~ s/<kṛt_dhātu:[^>]+//g;
  $in =~ s/<liṅgam:a>/ /g;
  $in =~ s/<liṅgam:([^>]+)>/ $1/g;
  $in =~ s/<vibhaktiḥ:([^>]+)>/ $1/g;
  $in =~ s/<torḍ:[^>]+>//g;
  $in =~ s/<gaṇaḥ:([^>]+)>/ $1/g;
  $in =~ s/<gaṇaḥ:([^>]*)>/ /g;
  $in =~ s/<padī:([^>]+)>/ $1/g;
  $in =~ s/<dhātuḥ:([^>]+)>/ /g;
  $in =~ s/<pratyayaḥ:([^>]+)/ $1/g;
  $in =~ s/<taddhita_pratyayaḥ:([^>]+)/ $1/g;
  $in =~ s/<kṛt_pratyayaḥ:([^>]+)/ $1/g;
  $in =~ s/<sanādi_pratyayaḥ:ṇic/ Nijanta/g;
  $in =~ s/<sanādi_pratyayaḥ:([^>]+)/ $1anta/g;
  $in =~ s/<prayogaḥ:([^>]+)>/ $1/g;
  $in =~ s/<puruṣaḥ:([^>]+)>/ $1/g;
  $in =~ s/<lakāraḥ:([^>]+)>/ $1/g;
  $in =~ s/<vacanam:([^>]+)>/ $1/g;
  $in =~ s/<rel_nm:[^>]*>//g;
  $in =~ s/<relaṭa_pos:[0-9]*>//g;
  if ($in !~ /<upasarga:X>/) {
    $in =~ s/\/([^<]+-)?([^\-<]+)<upasarga:([a-zA-Z_]+)>/\/$1$3_$2/g;
    $in =~ s/^([^<]+-)?([^\-<]+)<upasarga:([a-zA-Z_]+)>/$1$3_$2/g;
  } else { $in =~ s/<upasarga:X>//;}
  $in =~ s/\/([^<]+)<upapada_cp:([^>]+)>/\/$1-$2/g;
  $in =~ s/^([^<]+)<upapada_cp:([^>]+)>/$1-$2/g;
  $in =~ s/ [ ]+/ /g;
  $in =~ s/\$//g;
  $in =~ s/{TITLE}/<TITLE>/g;
  $in =~ s/{\/TITLE}/<\/TITLE>/g;
  $in =~ s/\/\t/\t/g;
  $in;
 }
}
1;
