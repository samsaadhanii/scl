#!/usr/bin/env perl

#  Copyright (C) 2009-2023 Amba Kulkarni (ambapradeep@gmail.com)
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

BEGIN{require "$ARGV[0]/paths.pl";}

$Data_Path=$ARGV[1];
$Lang=$ARGV[2];

if($ARGV[3] eq "D") { $DEBUG = 1; } else {$DEBUG = 0;}

open(TMP,"$Data_Path/hi/noun.txt") || die "Can't open $Data_Path/hi/noun.txt for reading";
while(<TMP>) {
chomp;
$_ =~ /^([^,]+),([^,]+),([^,]+),([^,]+)/;
$key = $1."_".$2;
$val = $3.":".$4;
$PRATIPADIKAM{$1}=$3;
$NOUN{$key}=$val;
}
close(TMP);

open(TMP,"$Data_Path/hi/pronoun.txt") || die "Can't open pronoun.txt for reading";
while(<TMP>) {
chomp;
$_ =~ /^([^,]+),([^,]+),([^,]+)$/;
$key = $1."_".$2;
$val = $3;
$PRATIPADIKAM{$1}=$val;
$PRONOUN{$key}=$val;
}
close(TMP);
open(TMP,"$Data_Path/hi/tam.txt") || die "Can't open tam.txt for reading";
while(<TMP>) {
chomp;
$_ =~ /^([^,]+),(.*)$/;
$key = $1;
$val = $2;
$TAM{$key}=$val;
}
close(TMP);

open(TMP,"$Data_Path/hi/verb.txt") || die "Can't open verb.tam for reading";
while(<TMP>) {
chomp;
$_ =~ /^([^,]+),([^,]+),([^,]+),v,([^,]+)(,.*)?$/;
$rt = $1;
$paxI = $2;
$transitivity = $3;
$val = $4;
$key = $1."_".$2."_".$3;
$VERB{$key}=$val;
$VERB_RT{$rt}=$val;
}
close(TMP);

open(TMP,"$Data_Path/hi/avy.txt") || die "Can't open avy.txt for reading";
while(<TMP>) {
chomp;
$_ =~ /^([^,]+),avy,(.*)$/;
$key = $1;
$val = $2;
$AVY{$key}=$val;
}
close(TMP);

open(TMP,"$Data_Path/hi/fem_hnd_noun.lst") || die "Can't open fem_hnd_noun.lst for reading";
while(<TMP>) {
chomp;
$key = $_;
$FEM{$key}=1;
}
close(TMP);

$rNOUN = \%NOUN;
$rPRONOUN = \%PRONOUN;
$rTAM = \%TAM;
$rVERB = \%VERB;
$rVERB_RT = \%VERB_RT;
$rAVY = \%AVY;
$rPRATIPADIKAM = \%PRATIPADIKAM;

   $default_lifga = "m";
   $default_vacana = "s";
   $default_puruRa = "a";
   $default_tam = "0";

while($tmpin = <STDIN>){

  chomp($tmpin);
  $ans = "";
  if ($tmpin =~ /./) {
    @f = split(/\t/,$tmpin);
    $word = $f[1];
    $kAraka = $f[7];
    $in = $f[10];

    $in =~ s/\/.*//;
    $in =~ s/></;/g;
    $in =~ s/</{/g;
    $in =~ s/>/}/g;


      $cat = &get_cat($in);
      if($cat eq "P") {

        ($rt,$lifga,$viBakwi,$vacana,$rel) = split(/:/, &get_noun_features($in));

       $key = $rt."_".$lifga;
       $map_rt = &get_dict_mng($key, $rPRONOUN);
       if($map_rt =~ /(.*):(.*)/) { $map_rt = $1; $hn_lifga = &get_skt_hn_lifga($2);}
       $map_viBakwi = &get_dict_mng($viBakwi, $rTAM);

       $hn_lifga = &get_hn_P_lifga($map_rt,$lifga);
       $hn_vacana = &get_hn_vacana($vacana);
       $hn_puruRa = &get_hn_purURa_sarvanAma($rt);
       $ans = "$map_rt $cat $hn_lifga $hn_vacana $hn_puruRa $map_viBakwi";

      } elsif($cat eq "kqw_noun") {

       ($rt, $kqw, $XAwu, $gaNa, $kqw_pratipadika, $lifgam, $viBakwi, $vacana,$rel) = 
        split(/:/, &get_kqw_noun_features($in));

	#	print "rt = $rt\n";
       $key = $kqw_pratipadika."_".$lifgam;

       $map_rt = &get_dict_mng($key, $rNOUN);
       if($NOUN{$key} ne "") {
	       #If the word is rUDa kqxanwa
          $cat = "n";

          $map_viBakwi = &get_dict_mng($viBakwi, $rTAM);

	  #print "map_viBakwi = $map_viBakwi\n";
          if($map_rt =~ /(.*):(.*)/) { $map_rt = $1; $hn_lifga = &get_skt_hn_lifga($2);}
         # $hn_lifga = &get_hn_lifga($map_rt,$lifgam);
          $hn_vacana = &get_hn_vacana($vacana);

          $ans = "$map_rt $cat $hn_lifga $hn_vacana $default_puruRa $map_viBakwi";
       } else {
	       #The word is not rUDa kqxanwa, and hence its meaning is compositional
         $cat = "v";

         $map_rt = &get_dict_mng($rt, $rVERB_RT);
	 #print "rt = $rt\n";
	 #print "map_rt = $map_rt\n";
         $map_kqw = &get_dict_mng($kqw, $rTAM);

         $hn_lifga = &get_skt_hn_lifga($lifgam);
         $hn_vacana = &get_hn_vacana($vacana);

         $ans =  "$map_rt $cat $hn_lifga $hn_vacana $default_puruRa $map_kqw";
      }
      } elsif($cat eq "waxXiwa_noun") {
      
       ($rt, $waxXiwa_prawyaya, $lifgam, $viBakwi, $vacana, $rel) = 
        split(/:/, &get_waxXiwa_noun_features($in));
      
       $key = $rt."_".$lifga;
       $map_rt = &get_dict_mng($key, $rNOUN);
       $map_waxXiwa = &get_dict_mng($waxXiwa_prawyaya, $rTAM);
       $rt .= $map_waxXiwa;
       $hn_lifga = &get_skt_hn_lifga($lifgam);
       $hn_vacana = &get_hn_vacana($vacana);
       $map_viBakwi = &get_dict_mng($viBakwi, $rTAM);
       $infl_map_waxXiwa = &get_inflected_waxXiwa($map_waxXiwa, $hn_lifga, $map_viBakwi);
       $ans =  "$map_rt n $hn_lifga $hn_vacana $default_puruRa $infl_map_waxXiwa";
      } elsif($cat eq "n") {

        ($rt,$lifga,$viBakwi,$vacana,$rel) = split(/:/, &get_noun_features($in));
	#print "rt = $rt\n";
	#print "rel = $rel\n";
	if (($rel eq "karwqsamAnAXikaraNam") || ($rel eq "viSeRaNam") || ($rel eq "aBexaH")) {
           $key = $rt."_vi";
           $map_rt = &get_dict_mng($key, $rNOUN);
	   if ($map_rt eq $key) {
               $key = $rt."_".$lifga;
               $map_rt = &get_dict_mng($key, $rNOUN);
	   }
       } else {
           $key = $rt."_".$lifga;
           $map_rt = &get_dict_mng($key, $rNOUN);
       }

       $map_viBakwi = &get_dict_mng($viBakwi, $rTAM);
      
       if($map_rt =~ /(.*):(.*)/) { $map_rt = $1; $hn_lifga = &get_skt_hn_lifga($2);}
       #$hn_lifga = &get_hn_lifga($map_rt,$lifga);
       $hn_vacana = &get_hn_vacana($vacana);
       $ans = "$map_rt $cat $hn_lifga $hn_vacana $default_puruRa $map_viBakwi";

       #print "ans = $ans\n";
      } elsif($cat eq "kqw_avy") {
        ($rt,$kqw,$XAwu,$gaNa,$rel) = (split/:/, &get_kqw_avy_features($in));

	#print "rt = $rt\n";
       $map_rt = &get_dict_mng($rt, $rVERB_RT);
       $map_kqw = &get_dict_mng($kqw, $rTAM);

       #print "map_rt = $map_rt\n";
       #print "map_kqw = $map_kqw\n";

       $cat = "v";
       $ans = "$map_rt $cat $default_lifga $default_vacana $default_puruRa $map_kqw";

      } elsif($cat eq "waxXiwa_avy") {

       ($rt, $waxXiwa, $lifga,$rel) =  split(/:/, &get_waxXiwa_avy_features($in));
       #print "rt = $rt waxXiwa = $waxXiwa lifga = $lifga\n";

       if($lifga eq "avy") {
          $map_rt = &get_dict_mng($rt, $rAVY);
       } else {
          $key = $rt."_".$lifga;
          $map_rt = &get_dict_mng($key, $rNOUN);
       }

       $map_waxXiwa = &get_dict_mng($waxXiwa, $rTAM);
      
       if($map_rt =~ /(.*):(.*)/) { $map_rt = $1; $hn_lifga = &get_skt_hn_lifga($2);}

       #$hn_lifga = &et_hn_lifga($map_rt,$lifga);
       $hn_cat = "n"; # The category of the rt word is n, while the resultant is an avy
       $ans = "$map_rt $hn_cat $hn_lifga $default_vacana $default_puruRa $map_waxXiwa";
# Commented the previous line, since in case of vixyAlaya n NW NW NW se, machine produced vixyAlayaeyegA_se. Here 'se' corresponds to waxXiwa_prawyayaH:wasil

      } elsif($cat eq "avy"){

          ($rt,$rel) = split(/:/,&get_avy_feature($in));
	  #print "rt = ", $rt,"\n";

          $map_rt = &get_dict_mng($rt, $rAVY);
	  #print "map_rt = ", $map_rt,"\n";
          $ans = "$map_rt avy NW NW NW NW";

      } elsif($cat eq "v") {

       ($rt,$prayoga,$lakAra,$purURa,$vacana,$paxI,$XAwu,$gaNa,$rel) = 
          split(/:/, &get_verb_features($in));
       
	  # If karma is absent in a sentence, then the verb is assumed 
	  # to be akarmaka
	  if($kAraka =~ /sakarmaka/) { $transitivity = "sk";}
	  else {$transitivity = "ak";}


	  # In the case of karwari prayoga,
	  # if an entry that matches with both paxI and transitivity is found, we use that entry
	  # if such an entry is not found and the transitivity is akarmaka, then we search for an entry with sakarmaka in the dictionary, assuming that the sentence has an ellipsis of a karma.
	  # In case no such entry is found in the dictionary, we produce the same Skt verb as the output.
	  # In such cases, we need to add the corresponding entry in to the dictionary.
	  if ($prayoga =~ /karwari/) {
     	      $key = $rt."_".$paxI."_".$transitivity;
	      $map_rt = &get_dict_mng($key, $rVERB);
	      #print "key = $key\n";
	      if($map_rt eq $key) { # mng not found
		      if ($transitivity eq "ak") { 
	#This happens only if the sentence does not have a karma, and the verb is only sakarmaka
 	                  $key = $rt."_".$paxI."_sk";
	                  $map_rt = &get_dict_mng($key, $rVERB);
		      }
                      if ($map_rt eq $key) { $map_rt = $rt;}
	      }
	  } else { # karmaNi / BAve
	  #In the case of karmaNi / BAve prayoga, we do not have any information of paxI of the verb from the output.
	  #Hence in such cases, we search for both the pp and ap entry in the dictionary.
	  # And produce both the meanings in the output.
     	      $key1 = $rt."_pp_".$transitivity;
	      $rt_pp = &get_dict_mng($key1, $rVERB);
     	      $key2 = $rt."_ap_".$transitivity;
	      $rt_ap = &get_dict_mng($key2, $rVERB);
	      if($rt_pp ne $key1) { 
		      $map_rt = $rt_pp;
		      if (($rt_ap ne $key2)  && ($rt_ap ne $rt_pp)) {$map_rt .= $rt_pp."/".$rt_ap;}
	      } elsif ($rt_ap ne $key2) {$map_rt = $rt_ap;} else {$map_rt = $rt;}
	      # If the transitivity is ak, it is possible that the sentence does not have a karma.
	      # So we check if the dict has a corresponding entry with sk.
	      if (($map_rt eq $rt)  && ($transitivity eq "ak")) {
     	         $key1 = $rt."_pp_sk";
	         $rt_pp = &get_dict_mng($key1, $rVERB);
     	         $key2 = $rt."_ap_sk";
	         $rt_ap = &get_dict_mng($key2, $rVERB);
	         if($rt_pp ne $key1) { 
		      $map_rt = $rt_pp;
		      if (($rt_ap ne $key2)  && ($rt_ap ne $rt_pp))
		         {$map_rt .= $rt_pp."/".$rt_ap;}
	         } else {$map_rt = $rt_ap;}
	      }
	  }

       $pra_lakAra = $prayoga."_".$lakAra;
       $map_lakAra = &get_dict_mng($pra_lakAra, $rTAM);

       $hn_purURa = &get_hn_purURa($purURa);
       $hn_vacana = &get_hn_vacana($vacana);

       $ans = "$map_rt $cat $default_lifga $hn_vacana $hn_purURa $map_lakAra";

   } else {
       # This is to handle the words unrecognised by morph
       $map_rt = $word;
       $map_rt =~ s/^\-//;
       if($map_rt eq ".") { 
         $ans = "$map_rt avy NW NW NW NW";
       } else {
         $cat = "n";
         $ans =  "$map_rt $cat $default_lifga $default_vacana $default_puruRa $default_tam";
       }
    }
  } # Do for each analysis
     print $tmpin,"\t",$ans,"\n";
} # End while

close(TMP_N);
close(TMP_V);
close(TMP_P);
close(TMP_A);
close(TMP_T);

untie(%FEM);
untie(%NOUN);
untie(%PRONOUN);
untie(%TAM);
untie(%AVY);
untie(%VERB);


sub get_hn_lifga{
 my($wrd,$lifga) = @_;

 if($FEM{$wrd}) { $lifga = "f";}
 elsif($lifga eq "napuM") { $lifga = "m";}
 elsif($lifga eq "puM") { $lifga = "m";}
 elsif($lifga eq "swrI") { $lifga = "f";}
 elsif($lifga eq "a") { $lifga = "m";}
 else { $lifga = "m";} # Default value, in case of any error

$lifga;
}
1;

sub get_skt_hn_lifga{
 my($lifga) = @_;

 if($lifga eq "napuM") { $lifga = "m";}
 elsif($lifga eq "puM") { $lifga = "m";}
 elsif($lifga eq "swrI") { $lifga = "f";}
 elsif($lifga eq "a") { $lifga = "m";}
 else { $lifga = "m";} # Default value, in case of any error

$lifga;
}
1;

sub get_hn_P_lifga{
 my($wrd,$lifga) = @_;

 if($lifga eq "napuM") { $lifga = "m";}
 elsif($lifga eq "puM") { $lifga = "m";}
 elsif($lifga eq "swrI") { $lifga = "f";}
 elsif($lifga eq "a") { $lifga = "m";}

$lifga;
}
1;

sub get_hn_purURa{
 my($purURa) = @_;

 if($purURa eq "u") { $purURa = "u";}
 elsif($purURa eq "ma") { $purURa = "m";}
 elsif($purURa eq "pra") { $purURa = "a";}

$purURa;
}
1;

sub get_hn_purURa_sarvanAma{
 my($rt) = @_;

 my($purURa) = "";

 if($rt eq "asmax") { $purURa = "u";}
 elsif($rt eq "yuRmax") { $purURa = "m";}
 else { $purURa = "a";}

$purURa;
}
1;

sub get_hn_vacana{
 my($vacana) = @_;

# if($vacana eq "1") { $vacana = "s";}
# elsif($vacana eq "2") { $vacana = "p";}
# elsif($vacana eq "3") { $vacana = "p";}
 if($vacana eq "eka") { $vacana = "s";}
 else { $vacana = "p";}

$vacana;
}
1;


sub get_hn_cat{
 my($cat) = @_;

 if($cat eq "nA") { $cat = "n";}
 if($cat eq "saMKyeyam") { $cat = "n";}
 if($cat eq "pUraNam") { $cat = "n";}

$cat;
}
1;

sub clean{
my($in) = @_;
#This cleans the dictionary entry removing all the meanings joined by '^' and the extra comments in {}.
      if($in =~ /:/) {
         $in =~ s/\^.*:/:/;
      } else {
         $in =~ s/\^.*//;
      }
      $in =~ s/\{.*\}//;
$in;
}
1;


sub get_cat{

my($in) = @_;

my $cat  = "";
   if($in =~ /vargaH:sarva/){ $cat = "P";}

   elsif($in =~ /vargaH:avy;.*kqw_prawyayaH:/){ $cat = "kqw_avy";}
   elsif($in =~ /kqw_prawyayaH/){ $cat = "kqw_noun";}

   elsif($in =~ /vargaH:nA;waxXiwa_prawyayaH:([^;]+;lifga)/){ $cat = "waxXiwa_noun";}
   elsif($in =~ /vargaH:nA;waxXiwa_prawyayaH:([^;]+)/){ $cat = "n";}
   elsif($in =~ /vargaH:avy;waxXiwa_prawyayaH:([^;]+)/){ $cat = "waxXiwa_avy";}

   elsif($in =~ /vargaH:avy/){ $cat = "avy"; } 

   elsif($in =~ /lakAraH:([^;]+)/){ $cat = "v"; }

   elsif($in =~ /vargaH:(nA|saMKyeyam|pUraNam)/){ $cat = "n";}
   $cat;
}
1;

sub get_noun_features{
my($in) = @_;
my $ans = "";
  if($in =~ /^.*rt:([^;]+).*lifgam:([^;]+).*viBakwiH:([^;]+).*vacanam:([^;]+).*rel_nm:([^;]*;)/){
     $ans = join(":",$1,$2,$3,$4,$5);
  } elsif($in =~ /^.*rt:([^;]+).*lifgam:([^;]+).*viBakwiH:([^;]+).*vacanam:([^;]+)/){
     $ans = join(":",$1,$2,$3,$4,"");
  }
  #print "ans NF = $ans\n";
$ans;
}
1;

sub get_kqw_avy_features{
my($in) = @_;

my $ans = "";
if($in =~ /^.*rt:([^;]+).*vargaH:avy;.*kqw_prawyayaH:([^;]+);XAwuH:([^;]+);gaNaH:([^;]+).*rel_nm:([^;]*;)/){
     $rt = $1;
     $kqw_prawyayaH = $2;
     $XAwu = $3;
     $gaNa = $4;
     $rel = $5;
     $in =~ s/upasarga:X;//;
     if ($in =~ /upasarga:([^;]+)/) { $rt = $1."_".$rt;}
     if ($in =~ /sanAxi_prawyayaH:([^;]+)/) { $rt = $rt."_".$1;}
 $ans = join(":",$rt,$kqw_prawyayaH,$XAwu,$gaNa,$rel);
}
$ans;
}
1;

sub get_verb_features{
my($in) = @_;
my $ans = "";

    if($in =~ /^.*rt:([^;]+).*prayogaH:([^;]+);lakAraH:([^;]+);puruRaH:([^;]+);vacanam:([^;]+);.*paxI:([^;]+);.*XAwuH:([^;]+);gaNaH:([^;]+)/){

     $rt = $1;
     $prayoga = $2;
     $lakAra = $3;
     $puruRa = $4;
     $vacana = $5;
     $paxI = $6;
     $XAwu = $7;
     $gaNa = $7;
     $in =~ s/upasarga:X;//;
     if($paxI eq "parasmEpaxI") { $paxI = "pp";} else {$paxI = "ap";}
     if ($in =~ /upasarga:([^;]+)/) { $rt = $1."_".$rt;}
     if ($in =~ /sanAxi_prawyayaH:([^;]+)/) { $rt = $rt."_".$1;}
     $ans = join(":",$rt,$prayoga,$lakAra,$puruRa,$vacana,$paxI,$XAwu,$gaNa);
    }
$ans;
}
1;

sub get_kqw_noun_features{
my($in) = @_;

my $ans = "";

  if($in =~ /^.*rt:([^;]+).*kqw_prawyayaH:([^;]+);.*XAwuH:([^;]+);gaNaH:([^;]+).*kqw_pratipadika:([^;]+).*lifgam:([^;]+).*viBakwiH:([^;]+).*vacanam:([^;}]+).*rel_nm:([^;]*;)/){

     $rt = $1;
     $kqw_prawyayaH = $2;
     $XAwu = $3;
     $gaNa = $4;
     $kqw_prAwipaxika = $5;
     $lifgam = $6;
     $viB = $7;
     $vacana = $8;
     $rel = $9;
     if($in =~ /kqw_prawyayaH:([^;]+);prayogaH:([^;]+)/) {
        $kqw_prawyayaH = $1."_".$2;
      }
      if ($kqw_prawyayaH eq "lyut") {
	      $kqw_prawyayaH = "lyut_".$viB;
      }
     $in =~ s/upasarga:X;//;
  if ($in =~ /upasarga:([^;]+)/) { $rt = $1."_".$rt;}
  if ($in =~ /sanAxi_prawyayaH:([^;]+)/) { $rt = $rt."_".$1;}
  #print "rt = $rt\n";
  $ans = join(":",$rt,$kqw_prawyayaH,$XAwu,$gaNa,$kqw_prAwipaxika,$lifgam,$viB,$vacana,$rel);
  }
$ans;
}
1;

sub get_waxXiwa_noun_features{
my($in) = @_;

my $ans = "";

  if($in =~ /^.*rt:([^;]+).*waxXiwa_prawyayaH:([^;]+);.*lifgam:([^;]+).*viBakwiH:([^;]+).*vacanam:([^;}]+).*rel_nm:([^;]*;)/){

     $rt = $1;
     $waxXiwa_prawyayaH = $2;
     $lifgam = $3;
     $viB = $4;
     $vacana = $5;
     $rel = $6;
  $ans = join(":",$rt,$waxXiwa_prawyayaH,$lifgam,$viB,$vacana,$rel);
  }
$ans;
}
1;

sub get_waxXiwa_avy_features{
my($in) = @_;

my $ans = "";

  if($in =~ /^.*rt:([^;]+).*vargaH:avy;waxXiwa_prawyayaH:([^;]+);lifgam:([^;]+).*rel_nm:([^;]*;)/){
     $ans = join(":",$1,$2,$3);
  }
  elsif($in =~ /^.*rt:([^;]+).*vargaH:avy;waxXiwa_prawyayaH:([^;]+).*rel_nm:([^;]*;)/){
     $ans = join(":",$1,$2,"avy",$3);
  }
$ans;
}
1;

sub get_avy_feature{
my($in) = @_;
my($rt);
my $ans = "";

  if($in =~ /^.*rt:([^;]+).*vargaH:avy.*rel_nm:([^;]*;)/){
     $ans = join(":",$1,$2);
  }
$ans;
}
1;

sub get_dict_mng{
my($rt,$rdatabase) = @_;
my $ans = $rt;
       
       if($$rdatabase{$rt} ne "") {
          $ans = &clean($$rdatabase{$rt});
	  #print "ans = $ans\n";
       } elsif($rt =~ /_Nic/) {
           $rt =~ s/_Nic//;
           $hnd_rt = &clean($$rdatabase{$rt});
             ## Before calling the causative handler, we need to disambiguate Nic with verbs in curaxi gaNa. If they are in svArWa, we need not call the causative handler.
## For example, rAmaH puswakam corayawi Versus rAmaH mohanena puswakam corayawi.
## In the first example, it is not Nic while in the second it is.
	     chomp($hnd_rt);
	     $ans = `/usr/bin/env python3 $GlblVar::SCLINSTALLDIR/MT/prog/map/causal_verb_handler.py $hnd_rt`;
           chomp($ans);
          } else {
		  #if($rt =~ /1_/) { $rt =~ s/1_/_/;} 
		  #$rt =~ s/X_//; # In case of upasargas
#This has been added to take care of Names that are not to be translated.
          $ans = $rt;
	  $ans =~ s/_puM//; 
	  $ans =~ s/_napuM//; 
	  $ans =~ s/_swrI//; 
       }
$ans;
}
1;

sub get_inflected_waxXiwa{
  my ($map_waxXiwa, $hn_lifga, $map_viBakwi) = @_;

  my $ans = $map_waxXiwa;
  if ($map_waxXiwa eq "vAlA") {
     if($hn_lifga eq "f") { $ans = "vAlI";}
        elsif (($hn_lifga eq "m") && ($map_viBakwi ne "0")) { $ans = "vAle";}
  }
$ans;
}
1;
