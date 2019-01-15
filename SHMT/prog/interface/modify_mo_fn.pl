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




sub modify_mo{
 my($in) = @_;
 
 if($in) {
  #$in =~ s/^([^\/]+)(>[a-zA-Z]+)(<[^\/]+>)/<\@a \@mouseover="\@Tip($1)">$2<\/\@a>$3/;
  #$in =~ s/\/([^\/]+)(>[a-zA-Z]+)(<[^\/]+>)/\/<\@a \@mouseover="\@Tip($1)">$2<\/\@a>$3/;
  $in =~ s/^([^\/]+>)([a-zA-Z]+)(<[^\/]+>)/$2$3($1)/;
  $in =~ s/\/([^\/]+>)([a-zA-Z]+)(<[^\/]+>)/\/$2$3($1)/g;

  if($in =~ /^<word:([^>]+\-)/) {
    $pUrvapaxa = $1;
    $in =~ s/^<word:[^>]+>//g;
  } elsif($in =~ /^([^><]+\-)/) {
    $pUrvapaxa = $1;
  } else {
    $pUrvapaxa = "";
  }

  #if($in =~ /^([^>]+\-).*</) {
  #  $pUrvapaxa = $1;
  #  $in =~ s/^$pUrvapaxa//;
  #} else {
  #  $pUrvapaxa = "";
  #}

  $in =~ s/^([^\/]+>)(<kqw_pratipadika:[a-zA-Z]+>)(<[^\/]+>)/$pUrvapaxa$2$3($1)/;
  $in =~ s/\/([^\/]+>)(<kqw_pratipadika:[a-zA-Z]+>)(<[^\/]+>)/\/$pUrvapaxa$2$3($1)/g;

  $in =~ s/<vargaH:avy>/ avya/g;
  $in =~ s/<kqw_pratipadika:([^>]+)>/$1/g;
  #$in =~ s/<kqw_vrb_rt:[^>]+>//g;
  $in =~ s/<vargaH:saMKyeyam>/ saMKyeyam/g;
  $in =~ s/<vargaH:saMKyA>/ saMKyA/g;
  $in =~ s/<vargaH:sarva>/ sarvanAma/g;
  $in =~ s/<vargaH:nA_[^>]+>/<vargaH:nA>/g;
  $in =~ s/<lifgam:a>/ /g;
  $in =~ s/<lifgam:([^>]+)>/ $1/g;
  $in =~ s/<viBakwiH:([^>]+)>/ $1/g;
  $in =~ s/<paxI:([^>]+)>/ $1/g;
  $in =~ s/<prawyayaH:([^>]+)>/ $1/g;
  $in =~ s/<waxXiwa_prawyayaH:([^>]+)>/ $1/g;
  $in =~ s/<kqw_prawyayaH:([^>]+)>/ $1/g;
  $in =~ s/<sanAxi_prawyayaH:Nic>/ Nijanwa/g;
  $in =~ s/<sanAxi_prawyayaH:([^>]+)>/ $1anwa/g;
  $in =~ s/<prayogaH:([^>]+)>/ $1/g;
  $in =~ s/<puruRaH:([^>]+)>/ $1/g;
  $in =~ s/<lakAraH:([^>]+)>/ $1/g;
  $in =~ s/<vacanam:([^>]+)>/ $1/g;
  $in =~ s/<rel_nm:([^>]*)>//g;
  $in =~ s/<relata_pos:[0-9]*>//g;
  if ($in !~ /<upasarga:X>/ ) {
    $in =~ s/\/([^<]+-)?([^\-<]+)<upasarga:([a-zA-Z_]+)>/\/$1$3_$2/g;
    $in =~ s/^([^<]+-)?([^\-<]+)<upasarga:([a-zA-Z_]+)>/$1$3_$2/g;
  } else { $in =~ s/<upasarga:X>//;}
  #$in =~ s/<upapaxa_cp:([^>]+)>/-$1/g;
  $in =~ s/\/([^<]+)<upapaxa_cp:([^>]+)>/\/$1-$2/g;
  $in =~ s/^([^<]+)<upapaxa_cp:([^>]+)>/$1-$2/g;
  $in =~ s/ [ ]+/ /g;
  $in =~ s/\$//g;
#  $in =~ s/Y/</g;
#  $in =~ s/Z/>/g;
  $in =~ s/{TITLE}/<TITLE>/g;
  $in =~ s/{\/TITLE}/<\/TITLE>/g;
  $in =~ s/\/\t/\t/g;
  $in;
 }
}
1;
