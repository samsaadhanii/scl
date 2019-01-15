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



$sent_count = 1;

$/ = "\n\n";
while($in = <STDIN>){
    #  print "SENT = $in END";
  $file_nm = "rl".$sent_count.".clp";
  open(TMP,">$ARGV[0]/wsd_files/$file_nm") || die "Can't open file $ARGV[0]/wsd_files/$file_nm";

     $word_count = 1;
     @ana = split(/\n/,$in);
     $sent = "";

     foreach $ana (@ana) {
        $ana =~ s/.*\$-//;
        @wrd_ana = split(/\//,$ana);
        $ana_count = 1;
        
        $cat = "ajFAwa";
        foreach $wrd_ana (@wrd_ana) {
          $wrd_ana =~ s/<level:[1-4]>//g;

          if($wrd_ana =~ /<waxXiwa_prawyayaH.*waxXiwa_rt/) {
              $cat="waxXiwa";
              $sent .= "(waxXiwa ";
          } elsif($wrd_ana =~ /<waxXiwa_prawyayaH.*/) {
              $cat="waxXiwa";
              $sent .= "(waxXiwa ";
          } elsif($wrd_ana =~ /<kqw_prawyayaH.*<lifgam/) {
              $cat="kqw";
              $sent .= "(kqw ";
          } elsif($wrd_ana =~ /<kqw_prawyayaH.*<XAwuH/) {
              $cat="kqw";
              $sent .= "(avykqw ";
          } elsif($wrd_ana =~ /<vargaH:sa-/) {
              $cat="samAsa";
              $sent .= "(sup ";
          } elsif($wrd_ana =~ /<vargaH:(nA|sarva|pUraNam|saMKyeyam|saMKyA)/) {
              $cat="sup";
              $sent .= "(sup ";
          } elsif($wrd_ana =~ /<vargaH:avy><waxXiwa_prawyayaH:/) {
              $cat="avywaxXiwa";
              $sent .= "(avywaxXiwa ";
         # } elsif($wrd_ana =~ /<vargaH:avy><kqw_prawyayaH:/) {
         #     $cat="avykqw";
         #     $sent .= "(avykqw ";
          } elsif($wrd_ana =~ /<vargaH:avy/) {
              $cat="avy";
              $sent .= "(avy ";
          } elsif($wrd_ana =~ /<XAwuH:/) {
              $cat="wif";
              $sent .= "(wif ";
          } else {$cat = "ajFAwa";}

          if(($cat ne "samAsa") && ($cat ne "ajFAwa")){
              $wrd_ana =~ s/<vargaH:[^>]+>//;
          }

          $wrd_ana =~ /<rt:([^>]+)>/;
          $t = $1;
          if($t =~ /.*\-([^\-]+)$/) { $compound_hd = $1;} 
          else {$compound_hd = $t;}
          $wrd_ana =~ s/<rt:([^>]+)>/<rt:$t><compound_hd:$compound_hd>/;

           if(($wrd_ana !~ /<upasarga:/) && (($cat eq "kqw") || ($cat eq "wif") || ($cat eq "avykqw"))){
               $wrd_ana =~ s/(<compound_hd:[^>]+>)</$1<upasarga:X></;
            }
            if(($wrd_ana !~ /<sanAxi_prawyayaH:/) && (($cat eq "kqw") || ($cat eq "wif") || ($cat eq "avykqw"))){
               $wrd_ana =~ s/(<upasarga:[a-zA-Z_]+>)</$1<sanAxi_prawyayaH:X></;
            }

          $wrd_ana =~ s/^([^<]+)$//g;
          $wrd_ana =~ s/<([^:]+):([^>]+)>/($1 $2)/g;
          $wrd_ana =~ s/<([^:]+):>//g;
          $wrd_ana =~ s/\$//g;

        $sent .= "(id $word_count) ";
        $sent .= "(mid $ana_count) ";
        $sent .= " ".$wrd_ana.")\n";
        if(($cat ne "samAsa") && ($cat ne "ajFAwa")){ $ana_count++;}
      }
          if(($cat ne "samAsa") && ($cat ne "ajFAwa")){ $word_count++;}
      }
      $sent_count++;
      print TMP "$sent\n";
      close(TMP);
}
