#!/usr/bin/env perl

#  Copyright (C) 2002-2006 Sushama Vempati
#  Copyright (C) 2002-2023 Amba Kulkarni (ambapradeep@gmail.com)
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




#$DEBUG=1;
$pra="praWamapaxam";
$dvi="xviwIyapaxam";
$sam="saMhiwapaxam";
$sa="sanXiH";
$sut="sUwram/vArwikam";
$pra1="prakriyA";

sub sandhi{
 my($first,$second)=@_;
 my($ans);
 $ans = "";
 #print "f = $first\n";
 #print "s = $second\n";

 $complete=$first."+".$second;
 ($ans,$ans1,$ans2,$cont)=split(/,/,&apavAdaniyamAH($complete));
 if($DEBUG) { print "ans from apavAda niyama = $ans\n";}
 if($cont == 1){
         #$ans = "";
         if($first =~ /^(.*)(.)$/) {
            $f_rem1 = $1;
            $lf1 = $2;
         } else {$f_rem1 = ""; $lf1 = "";}
         if ($first =~ /^(.*)(..)$/){
             $f_rem2 = $1;
             $lf2 = $2;
         } else {$f_rem2 = ""; $lf2 = "";}
         if($second =~ /^(.)(.*)$/){
            $sf= $1;
            $s_rem = $2;
         } else {$sf = ""; $s_rem = "";}
         $srch_str1 = $lf1.",".$sf;
         $srch_str2 = $lf2.",".$sf;
         if($DEBUG) { print "srch_str1 = ",$srch_str1,"\n";}
         if($DEBUG) { print "srch_str2 = ",$srch_str2,"\n";}
	foreach $rule (@rules) {
    #     if($DEBUG) { print "rule = ",$rule,"\n";}
           if($rule =~ /^$srch_str1,([^,]+),/) {
              $sandhi = $1;
              $rule=~ s/"//;
              @rule2 = split(/,/,$rule);
              @Sakya_uwwara = split(/\//,$sandhi);
              foreach $Sakya_uwwara (@Sakya_uwwara) {
                 $Sakya_uwwara =~ s/ /  /g;
                 $an = $f_rem1. $Sakya_uwwara.$s_rem;
                 $ans=$ans.":".$an;
                 $an1=$rule2[3];#."-sanXiH";
                 $ans1=$ans1.":".$an1;
                 $an2=$rule2[4];
         	 $ans2=$ans2.":".$an2;
              }
            }elsif($rule =~ /^$srch_str2,([^,]+),/) {
                 $sandhi = $1;
	         $rule=~ s/"//;
                 @rule2 = split(/,/,$rule);
                 @Sakya_uwwara = split(/\//,$sandhi);
                 foreach $Sakya_uwwara (@Sakya_uwwara) {
                      $Sakya_uwwara =~ s/ /  /g;
                      $an=$f_rem2.$Sakya_uwwara.$s_rem;
                      $ans=$ans.":".$an;
                      $an1=$rule2[3]; #."-sanXiH";
           	      $ans1=$ans1.":".$an1;
                      $an2=$rule2[4];
                      $ans2=$ans2.":".$an2;
	         }
            }
       }
       if($ans ne "") {
	  $result=$ans.",".$ans1.",".$ans2.",".$pra.",".$dvi.",".$sam.",".$sa.",".$sut.",".$pra1;
       } else {
	  $result=$first.$second.",".$second.",,".$pra.",".$dvi.",".$sam.",".$sa.",".$sut.",".$pra1;
       }
    } else{
    $ans=":".$ans;
    $ans1=":".$ans1."-sanXiH";
    $ans2=":".$ans2;
    $result=$ans.",".$ans1.",".$ans2.",".$pra.",".$dvi.",".$sam.",".$sa.",".$sut.",".$pra1;
    }
$result;
}
1;
