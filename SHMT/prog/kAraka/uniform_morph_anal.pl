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

$SCLINSTALLDIR=$ARGV[0];

require "$SCLINSTALLDIR/SHMT/prog/Normalisation/get_std_spelling_fn.pl";

$sent_count = 1;

$/ = "\n\n";
while($in = <STDIN>){
  $file_nm = $sent_count.".clp";

 open(TMP,">$ARGV[1]/parser_files/$file_nm") || die "Can't open file $ARGV[1]/parser_files/$file_nm";

 #print TMP $head;
  #print TMP "; $in";
     
     $word_count = 1;
     @ana = split(/\n/,$in);
     $sent = "";

     foreach $ana (@ana) {
        @wrd_ana= split(/\t/,$ana);
        $wrd = &get_std_spelling_fn($wrd_ana[3]);
        $w_ana = $wrd_ana[7];
        if($wrd =~ /.*\-([^\-]+)$/) { $uwwarapaxa = $1;} else {$uwwarapaxa = $wrd;}
        if($wrd =~ /^([^\-]+)\-.*/) { $pUrvapaxa = $1;} else {$pUrvapaxa = $wrd;}
        $w_ana =~ s/.*\-//;
        @wrd_ana = split(/\//,$w_ana);
        $ana_count = 1;
        
        foreach $wrd_ana (@wrd_ana) {
         # $wrd_ana =~ s/<level:[1-4]>//g;

          $cat = &get_cat($wrd_ana);

          if($wrd_ana =~ /<upapaxa_cp:/) {
             $wrd_ana =~ s/^([^<]+)<upapaxa_cp:([^>]+)>/$2/;
             if($pUrvapaxa ne $wrd) { $pUrvapaxa .= "-".$1;}
             else { $pUrvapaxa = $1;}
             if($uwwarapaxa ne $wrd) { $uwwarapaxa .= "-".$1;} # ??
             else {$uwwarapaxa = $2;}
          }
          #if($cat eq "waxXiwa") {
          #  $wrd_ana =~ s/<vargaH:nA_([^>]+)>/<waxXiwa_prawyayaH:$1>/;
          #  $wrd_ana =~ s/^([^<]+)</$1<waxXiwa_rt:$1></;
          #}
          if(($cat ne "samAsa") && ($cat ne "ajFAwa")){
            $wrd_ana =~ s/<vargaH:[^>]+>//;

            if(($wrd_ana !~ /<upasarga:/) && (($cat eq "kqw") || ($cat eq "wif") || ($cat eq "avykqw"))){
               if($wrd_ana =~ /^[^<]+</) {
                 $wrd_ana =~ s/^([^<]+)</$1<upasarga:X></;
               } elsif($wrd_ana =~ /^<kqw_vrb_rt/) {
                 $wrd_ana =~ s/^(<kqw_vrb_rt:[^>]+>)</$1<upasarga:X></;
               }
            }
            if(($wrd_ana !~ /<sanAxi_prawyayaH:/) && (($cat eq "kqw") || ($cat eq "wif") || ($cat eq "avykqw"))){
               $wrd_ana =~ s/(<upasarga:[a-zA-Z_]+>)</$1<sanAxi_prawyayaH:X></;
            }
            if(($wrd_ana !~ /<prayogaH:/) && ($cat eq "kqw")){
               $wrd_ana =~ s/(<kqw_prawyayaH:[a-zA-Z_]+>)</$1<prayogaH:karwari></;
            }

            if($cat eq "kqw") {
               $wrd_ana =~ s/^([^<]+)</(kqw_vrb_rt $1)</;
               $wrd_ana =~ s/<kqw_pratipadika:([^>]+)>/(rt $1)(pUrvapaxa $pUrvapaxa)(uwwarapaxa $uwwarapaxa)/g;
            } else { 
                 $wrd_ana =~ s/^([^<]+)</(rt $1)(pUrvapaxa $pUrvapaxa)(uwwarapaxa $uwwarapaxa)</;
            }

            $wrd_ana =~ s/^([^<]+)$//g;
            $wrd_ana =~ s/<([^:]+):([^>]+)>/($1 $2)/g;
            $wrd_ana =~ s/\)\(/\) \(/g;
            $wrd_ana =~ s/\$//g;

            if($wrd_ana =~ /level ([0-9]+)\)(.*)/) { $wrd_ana =~ s/\(level ([0-9]+)\)(.*)/$2(level $1)/;}
            if($wrd_ana !~ /level/) { $wrd_ana =~ s/$/(level 1)/;}

             print TMP "($cat (id $word_count) (mid $ana_count) (word $wrd) $wrd_ana )\n";
             $ana_count++;
          }
        }
          $sent .= " ".$wrd."(".$word_count.")";
            if(($cat ne "samAsa") && ($wrd !~ /-$/)){ $word_count++;}
        }
 $sent_count++;
 print TMP $tail;
 close(TMP);
}

sub get_cat{
  my($in) = @_;
  my($cat);

  $cat = "";
   if($wrd_ana =~ /<vargaH:avy><waxXiwa_prawyayaH:/) {
           $cat="avywaxXiwa";
   }elsif($in =~ /waxXiwa_prawyayaH:/) {
      $cat="waxXiwa";
   } elsif($in =~ /<kqw_vrb_rt:.*<kqw_prawyayaH:/) {
           $cat="kqw";
   } elsif($in =~ /<kqw_prawyayaH:.*<kqw_pratipadika:/) {
           $cat="kqw";
   } elsif($wrd_ana =~ /<vargaH:sa-/) {
           $cat="samAsa";
   } elsif($wrd_ana =~ /<vargaH:(nA|sarva|pUraNam|saMKyeyam|saMKyA)/) {
           $cat="sup";
   } elsif($wrd_ana =~ /<vargaH:avy>.*<kqw_prawyayaH:/) {
           $cat="avykqw";
   } elsif($wrd_ana =~ /<vargaH:avy/) {
           $cat="avy";
   } elsif($wrd_ana =~ /<XAwuH:/) {
           $cat="wif";
   } else {$cat = "ajFAwa";}
$cat;
}
1;
