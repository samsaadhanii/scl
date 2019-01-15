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


#BEGIN {require "$ARGV[0]/paths.pl";}

#use lib $GlblVar::LIB_PERL_PATH;

#use GDBM_File;
#tie(%LEX,GDBM_File,$ARGV[1],GDBM_READ,0644) || die "Can't open $ARGV[1] for reading";
#tie(%RK,GDBM_File,$ARGV[2],GDBM_READ,0644) || die "Can't open $ARGV[2] for reading";

open(TMP,$ARGV[1]) || die "Can't open $ARGV[1] for reading";
while($in = <TMP>) {
chomp($in);
 ($gaNa,$XAwu,$dummy1,$paxI,$Heritage_rt,$SaMsAXanI_rt) = split(/\t/,$in);
 if($Heritage_rt ne "-") {
  @f = split(/,/,$Heritage_rt);
  foreach $f (@f) {
    if($f =~ /\(([a-zA-Z]+)\)/) { $gaNa = $1; $f =~ s/\([a-zA-Z]+\)//;}
    $key = $f."_".$paxI;
    $value = $SaMsAXanI_rt."_".$XAwu."_".$gaNa;
    if($LEX{$key} eq "") { $LEX{$key} = $value;}
    else { $LEX{$key} .= "#".$value;}
  }
 }
}
close(TMP);

open(TMP,$ARGV[2]) || die "Can't open $ARGV[2] for reading";
while(<TMP>) {
chomp;
$RK{$_}=1;
}


%sarva = ('yaw',1,'wax',1,'kim',1,'ixam',1,'yax',1,'asmax',1,'yuRmax',1,'Bavaw',1,'sarva',1,'Awman',1,'anya',1,'uwwara',1,'uBa',1,'ewAvaw',1,'apara',1,'ewax',1,'axas',1);

%saMKyeyam = ('cawur',1,'wri',1,'xvi',1,'eka',1,'paFcan',1,'koti',1,'wriMSaw',1,'aRtan',1,'sahasra',1);

open(TMP,"<$ARGV[3]");
while($in = <TMP>){
   chomp($in);
   ($rt, $fem) = split(/\t/,$in); 
   $fem{$rt} = $fem;
}
close(TMP);

open(TMP,"<$ARGV[4]");
while($in = <TMP>){
   chomp($in);
   ($G_rt, $A_rt) = split(/\t/,$in); 
   $A_rt{$G_rt} = $A_rt;
}
close(TMP);

while($in = <STDIN>){
  chomp($in);
  if($in) {
   ($no,$pretag,$sword,$word,$posttag,$ana) = split(/\t/,$in);
   print $no,"\t",$pretag,"\t",$sword,"\t",$word,"\t",$posttag,"\t";
   @ana = split(/\//,$ana);
   $ans = "";
   foreach $ana (@ana) {
    if($ana =~ /^([^<]+)</) {
       $rt = $1;
       if(($rt =~ /\-/) && ($ana !~ /kqw/)) { $ana =~ s/#[0-9]+//;}
    }
    if($ana =~ /^([^<]+).*<lifgam:swrI>/){
       $rt = $1;
       if($fem{$rt}) { $ana =~ s/$rt</$fem{$rt}</;}
    }
    elsif($ana =~ /^([^<]+)/){
       $rt = $1;
       if($A_rt{$rt}) { 
          $ana =~ s/$rt</$A_rt{$rt}</;
        }
    }
    if($ana =~ /^([^<]+).*/){
       $rt = $1;
       if($sarva{$rt}){
          $ana =~ s/^$rt<vargaH:nA>/$rt<vargaH:sarva>/;
       }
       if($saMKyeyam{$rt}){
          $ana =~ s/^$rt<vargaH:nA>/$rt<vargaH:saMKyeyam>/;
       }
       if(($rt eq "xviwIya") || ($rt eq "wqwIya")) {
          $ana =~ s/^$rt<vargaH:nA>/$rt<vargaH:pUraNam>/;
       }
    }
    if($ana =~ /^([^<]+)<upasarga:[^>]+>.*<prayogaH:([^>]+)><lakAraH:[^>]+><puruRaH:[^>]+><vacanam:[^>]+><paxI:([^>]+)><gaNaH:([^>]+)>/){
	   $rt = $1;
           $px = $2;
           $p = $3;
           $g = $4;
           if($px eq "karwari") {
             if($p eq "parasmEpaxI") { $p = "pa.pa";}
             if($p eq "AwmanepaxI") { $p = "A.pa";}
             $key = $rt."_".$p;
             $val = $LEX{$key};
           } else { 
             $p = "pa.pa";
             $key = $rt."_".$p;
             $val = $LEX{$key};
             $p = "A.pa";
             $key = $rt."_".$p;
             if ($val eq "") {$val = $LEX{$key};}
             else { $val .=  "#". $LEX{$key};}
           }
           #if($rt =~ /_/) { $rt =~ /^(.*)_([^_]+)/; $pref = $1; $rt = $2;}
           #else { $pref = "";$key = $rt;}
           #if ($pref eq "A") { $pref = "Af";}
           @val = split(/#/,$val);
           $found = 0;
           $tans = "";
           foreach $val (@val) {
                 $val =~ /(.+)_(.+)_(.+)/; 
                 $A_rt = $1;
                 $XAwuH = $2;
                 $gaNaH = $3;
                  if (($g eq "X") || ($gaNaH eq $g)) {
                    $tana = $ana;
                    $tana =~ s/<gaNaH:[^>]+>//;
                    $tana =~ s/^[^<]+(<upasarga:[^>]+>.*<prayogaH:[^>]+><lakAraH:[^>]+><puruRaH:[^>]+><vacanam:[^>]+>(<paxI:[^>]+>)?)/${A_rt}$1<XAwuH:$XAwuH><gaNaH:$gaNaH>/;
                    $tans .= "/".$tana;
                    $found = 1;
                  } else {} #skip this mapping
         }
         $tans =~ s/^\///;
         $ana = $tans;
         if ($found == 0)  { 
             $A_rt = $rt; $A_rt =~ s/#.*/1/;
             $ana =~ s/<gaNaH:[^>]+>//;
             $ana =~ s/^[^<]+(<upasarga:[^>]+>.*<prayogaH:[^>]+><lakAraH:[^>]+><puruRaH:[^>]+><vacanam:[^>]+>(<paxI:[^>]+>)?)/${A_rt}$1<XAwuH:$XAwuH><gaNaH:$gaNaH>/;
         }
    } elsif($ana =~ /^([^<]+)(.*)<kqw_prawyayaH:[^>]+>/){
	   $rt = $1;
           if($rt =~ /\-/) { 
              $rt =~ /^(.*)\-([^\-]+)/; 
              $pUrva = $1; 
              $o_key = $2;
           } else { $pUrva = "";$o_key = $rt;}
           $ana =~ s/<upasarga:A>/<upasarga:Af>/;
           if ($ana =~ /<upasarga:X>/) { $upa = "";}
           elsif ($ana =~ /<upasarga:([^>]+)>/) { $upa = $1;}
           if($upa ne "") {
              $ana =~ s/<kqw_pratipadika:([^>]+)(#[1-9])?/<kqw_pratipadika:${upa}_$1/g;
              $kp = $1;
              $kp = $upa."_".$kp;
           } else {
              $ana =~ s/<kqw_pratipadika:([^>]+)(#[1-9])?/<kqw_pratipadika:$1/g;
              $kp = $1;
           }
           $key = $o_key . "_pa.pa"; #We need to handle both A.pa and pa.pa
           $val = $LEX{$key};
           $key =~ s/_pa/_A/;
           $val1 = $LEX{$key};
           $val2 = $val."#".$val1;
           $val2 =~ s/^#//;
           $val2 =~ s/#$//;
           @val = split(/#/,$val2);
           $found = 0;
           $tans = "";
           foreach $val (@val) {
                $val =~ /(.+)_(.+)_(.+)/; 
                $A_rt = $1;
                $XAwuH = $2;
                $gaNaH = $3;
                $tana = $ana;
                $tana =~ s/<gaNaH:[^>]+>//;
                if($pUrva ne "") { $A_rt = $pUrva."-".$A_rt;}
            if($RK{$kp}) {
               $tana =~ s/^[^<]+(<upasarga:[^>]+>.*<kqw_prawyayaH:[^>]+>)//;
               $tana =~ s/<kqw_pratipadika:([^>]+)>/$1/g;
            } else {
               $tana =~ s/^[^<]+(<upasarga:[^>]+>.*<kqw_prawyayaH:[^>]+>)/${A_rt}$1<XAwuH:$XAwuH><gaNaH:$gaNaH>/;
            }
               $tans .= "/".$tana;
               $found = 1;
             }
             $tans =~ s/^\///;
             $ana  = $tans;
           if ($found == 0) { 
               $A_rt = $o_key; 
               $A_rt =~ s/#.*/1/; 
               $XAwuH=$o_key; 
               $XAwuH =~ s/1//;
               $gaNaH="BvAxiH";
               $ana =~ s/<gaNaH:[^>]+>//;
               if($pUrva ne "") { $A_rt = $pUrva."-".$A_rt;}
            if($RK{$kp}) {
               $ana =~ s/^[^<]+(<upasarga:[^>]+>.*<kqw_prawyayaH:[^>]+>)//;
               $ana =~ s/<kqw_pratipadika:([^>]+)>/$1/g;
            } else {
               $ana =~ s/^[^<]+(<upasarga:[^>]+>.*<kqw_prawyayaH:[^>]+>)/${A_rt}$1<XAwuH:$XAwuH><gaNaH:$gaNaH>/;
            }
         }
   }
   $ana =~ s/#[1-9]</</;
   $ans .= $ana."/";
  }
  $ans =~ s/\/$//;
  print $ans,"\t",$ans,"\t",$ans,"\n";
 } else { printf "\n";}
}
#close(TMP);
