#!/usr/bin/env perl

#  Copyright (C) 2010-2023 Amba Kulkarni (ambapradeep@gmail.com)
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

require "$SCLINSTALLDIR/MT/prog/Normalisation/get_std_spelling_fn.pl";


$/ = "\n\n";
while($in = <STDIN>){

     @ana = split(/\n/,$in);
     $sent = "";

     foreach $ana (@ana) {
        $ana_count = 1;
        @wrd_ana= split(/\t/,$ana);
        ($wrd_id,$comp_id) = split(/\./,$wrd_ana[0]);
        $wrd = &get_std_spelling_fn($wrd_ana[1]);
	if($wrd eq ",") { $wrd = "COMMA";}
        $w_ana = $wrd_ana[5];
        if($wrd =~ /.*\-$/) { $pUrvapaxa = "y";} else {$pUrvapaxa = "n";}
        if($wrd =~ /^\-.*/) { $uwwarapaxa = "y";} else {$uwwarapaxa = "n";}
        if($w_ana eq "") {
           print  "(avy (id $wrd_id) (cid $comp_id) (mid $ana_count) (word $wrd) (rt $wrd) (pUrvapaxa $pUrvapaxa) (uwwarapaxa $uwwarapaxa) (level 1) )\n";
        } else {
          @w_ana = split(/\//,$w_ana);
          $ana_count = 1;
        
        foreach $wrd_ana (@w_ana) {
          #if (($pUrvapaxa eq "y") || ($uwwarapaxa eq "y")) {$cat = "samAsa";}
          #else { $cat = &get_cat($wrd_ana);}
          $cat = &get_cat($wrd_ana);

          if($wrd_ana =~ /<upapaxa_cp:/) {
             $wrd_ana =~ s/^([^<]+)<upapaxa_cp:([^>]+)>/$2/;
          }

          #if(($cat ne "samAsa") && ($cat ne "ajFAwa")){
          if($cat ne "ajFAwa"){
            $wrd_ana =~ s/<vargaH:[^>]+>//;
	    $wrd_ana =~ s/,/COMMA/g;

            if(($wrd_ana !~ /<upasarga:/) && (($cat eq "kqw") || ($cat eq "wif") || ($cat eq "avykqw"))){
               if($wrd_ana =~ /^[^<]+</) {
                 $wrd_ana =~ s/^([^<]+)</$1<upasarga:X></;
               } elsif($wrd_ana =~ /^<kqw_XAwu/) {
                 $wrd_ana =~ s/^(<kqw_XAwu:[^>]+>)</$1<upasarga:X></;
               }
            }
            if(($wrd_ana !~ /<sanAxi_prawyayaH:/) && (($cat eq "kqw") || ($cat eq "wif") || ($cat eq "avykqw"))){
               $wrd_ana =~ s/(<upasarga:[a-zA-Z_]+>)</$1<sanAxi_prawyayaH:X></;
            }
            if(($wrd_ana !~ /<prayogaH:/) && ($cat eq "kqw")){
               $wrd_ana =~ s/(<kqw_prawyayaH:[a-zA-Z_]+>)</$1<prayogaH:karwari></;
            }

            if($cat eq "kqw") {
               $wrd_ana =~ s/^([^<]+)</(kqw_XAwu $1)</;
               $wrd_ana =~ s/<kqw_pratipadika:([^>]+)>/(rt $1)(pUrvapaxa $pUrvapaxa)(uwwarapaxa $uwwarapaxa)/g;
            } else { 
                 $wrd_ana =~ s/^([^<]+)</(rt $1)(pUrvapaxa $pUrvapaxa)(uwwarapaxa $uwwarapaxa)</;
            }
	   

	    if($pUrvapaxa eq "y") { $wrd_ana =~ s/<level:([0-4])>/<lifgam:a><viBakwiH:0><vacanam:a><level:$1>/;}
            $wrd_ana =~ s/^([^<]+)$//g;
            $wrd_ana =~ s/<([^:]+):([^>]+)>/($1 $2)/g;
            $wrd_ana =~ s/\)\(/\) \(/g;
            $wrd_ana =~ s/\$//g;

            if($wrd_ana =~ /level ([0-9]+)\)(.*)/) { $wrd_ana =~ s/\(level ([0-9]+)\)(.*)/$2(level $1)/;}
            if($wrd_ana !~ /level/) { $wrd_ana =~ s/$/(level 1)/;}

             print  "($cat (id $wrd_id) (cid $comp_id) (mid $ana_count) (word $wrd) $wrd_ana )\n";
             $ana_count++;
          }
        }
      }
          $sent .= " ".$wrd."(".$word_id.")";
        }
}

sub get_cat{
  my($in) = @_;
  my($cat);

   $cat = "";
   #if($in =~ /<vargaH:sapUp/) {
   #        $cat="samAsa";
   #}els
   if($in =~ /<vargaH:avy><waxXiwa_prawyayaH:/) {
           $cat="avywaxXiwa";
   }elsif($in =~ /waxXiwa_prawyayaH:/) {
      $cat="waxXiwa";
   } elsif($in =~ /<kqw_XAwu:.*<kqw_prawyayaH:/) {
           $cat="kqw";
   } elsif($in =~ /<kqw_prawyayaH:.*<kqw_pratipadika:/) {
           $cat="kqw";
   } elsif($in =~ /<vargaH:sapUpa/) {
           $cat="sup";
   } elsif($in =~ /<vargaH:(nA|sarva|pUraNam|saMKyeyam|saMKyA)/) {
           $cat="sup";
   } elsif($in =~ /<vargaH:avy>.*<kqw_prawyayaH:/) {
           $cat="avykqw";
   } elsif($in =~ /<vargaH:avy/) {
           $cat="avy";
   } elsif($in =~ /<vargaH:PUNCT/) {
           $cat="avy";
   } elsif($in =~ /<XAwuH:/) {
           $cat="wif";
   } elsif($in eq "") {
           $cat="avy";   # To handle unrecognised/OOV words
   } else {$cat = "ajFAwa";}
$cat;
}
1;
