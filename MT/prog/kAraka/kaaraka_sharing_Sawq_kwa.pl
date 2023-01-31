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

#BEGIN{require "$ARGV[0]/paths.pl";}

#use lib $GlblVar::LIB_PERL_PATH;

#use GDBM_File;

#require "$GlblVar::SCLINSTALLDIR/MT/prog/interface/modify_mo_fn.pl";

#tie(%kAraka_name,GDBM_File,"$ARGV[2]/kAraka_name.gdbm",GDBM_READER,0644) || die "Can't open $ARGV[2]/kAraka_name.gdbm for reading";
#tie(%kAraka_num,GDBM_File,"$ARGV[2]/kAraka_num.gdbm",GDBM_READER,0644) || die "Can't open $ARGV[2]/kAraka_num.gdbm for reading";

open(TMP,"$ARGV[2]/kAraka_names.txt") || die "Can't open $ARGV[2]/kAraka_name.txt for reading";
while(<TMP>) {
chomp;
if(/^([^ ]+) ([0-9]+)/){
$num = $2;
$name = $1;
$kAraka_name{$num}=$name;
$kAraka_num{$name}=$num;
}
}
close(TMP);
$/ = "\n\n";
open(IN, "<$ARGV[1]") || die "Can't open $ARGV[1] for reading";
while($in = <IN>){
      @in = split(/\n/,$in);
      foreach $in (@in) {
          @flds = split(/\t/,$in);
          if(($flds[0] =~ /^([0-9]+)।([0-9]+)।([0-9]+)/) || ( $flds[0] =~ /^([0-9]+).([0-9]+).([0-9]+)/)){
           $p_no = $1;
           $s_no = $2; 
           $w_no_one = $3; 
           $w_no = $3-1; 
           $indx = $p_no.".".$s_no.".".$w_no;
           $tmp = $flds[6];
           if($tmp =~ /\-/) {
              $tmp =~ s/स\-पू\-प/स_पू_प/g;
              $tmp =~ s/स\-पू\-प/स_पू_प/g;
              $tmp =~ s/sa\-puu\-pa/sa_puu_pa/g;
              $tmp =~ s/sa\-puu\-pa/sa_puu_pa/g;
              @tmp = split(/-/,$tmp);
              $tmp = "";
              for ($i=0;$i< $#tmp; $i++) {
               $tmp[$i] =~ s/<.*//;
               $tmp .= "-" . $tmp[$i];
              }
              $tmp .= "-" . $tmp[$#tmp];
              $tmp =~ s/^\-//;
           }
           if( $tmp =~ /^(.*)\-/) { $samAsa_pUrvapaxa = $1; $tmp =~ s/^(.*)\-//;} else { $samAsa_pUrvapaxa = "";}
           @ana = split(/\//,$tmp);
           for ($i=0;$i <= $#ana; $i++) {
               $mindx = $indx.".".$i;
               if($samAsa_pUrvapaxa) { $ana[$i] = $samAsa_pUrvapaxa."-".$ana[$i];}
               $mana = &modify_mo($ana[$i]);
	       $mana =~ s/}{/}\\n{/g;
               $word{$mindx} = $mana."($w_no_one)";
               if($ana[$i] =~ /^([^<]+).*<(विभक्तिः|vibhaktiḥ|vibhakti\.h):([1-8])>/){
                $wcolor{$mindx} = $color{"N".$3};
             }
             elsif($ana[$i] =~ /^([^<]+).*<(कृत्_प्रत्ययः|kṛt_pratyayaḥ|k\.rt_pratyaya\.h)/){
                $wcolor{$mindx} = $color{"NA"};
             }
             elsif($ana[$i] =~ /^([^<]+).*<(लकारः|lakāraḥ|lakaara\.h):/){
                $wcolor{$mindx} = $color{"KP"};
             }
           }
           if($tot_words[$s_no] < $w_no) { $tot_words[$s_no] = $w_no;}
          }
      }
}
close(IN);

$/ = "\n";
$ans = "";
$i=0;

while($in = <STDIN>){
  chomp($in);
  if($in =~ /./) {
      if($in =~ /Cost/){
         $lans = $in."\n";
      }elsif($in !~ /^\(/){
         $ans .= $in."\n";
      } elsif($in =~ /\(/){
         $in =~ /([0-9]+),([0-9]+),([0-9]+),([0-9]+),([0-9]+)/;
         $rel_nm = $3;
         $k_rel_nm[$i] = $kAraka_name{$rel_nm};
         $in[$i] = $in;
         $i++;
      }
  } else {
    for($j=$i-1;$j>=0;$j--){
      if($k_rel_nm[$j] eq "viSeRaNam") {
         $in[$j] =~ /([0-9]+),([0-9]+),([0-9]+),([0-9]+),([0-9]+)/;
         $relata1= $1.".".$2;
         $rel = 100+$kAraka_num{"karwA"};
         $indx1 = "1.1.".$relata1;
         if($word{$indx1} =~ /kqw_prawyayaH:Sawq;/){
            $tmp = $in[$j];
            $tmp =~ s/([0-9]+),([0-9]+),([0-9]+),([0-9]+),([0-9]+)/$4,$5,$rel,$1,$2/;
            $in[$j] .= "\n".$tmp;
         }
       }
     if($k_rel_nm[$j] eq "samAnakAlaH") {
        $in[$j] =~ /([0-9]+),([0-9]+),([0-9]+),([0-9]+),([0-9]+)/;
        $main_verb = $4.".".$5;
        $main_verb1 = $4.",".$5;
        $Sawqverb = $1.",".$2;
        $indx1 = "1.1.".$main_verb;
        $rel = 100+$kAraka_num{"karwA"};
        if($word{$indx1} =~ /{karwari;/){
        $rel1 = "karwA";
        } elsif($word{$indx1} =~ /{karmaNi;/){
           $rel1 = "karma";
        } elsif($word{$indx1} =~ /{kqw_prawyayaH:kwa;/){
           $rel1 = "karma";
        }
        for($k=$i-1;$k>=0;$k--){
          if($k_rel_nm[$k] eq $rel1) {
             if($in[$k] =~ /([0-9]+),([0-9]+),([0-9]+),$main_verb1/){
                $karwA = $1.",".$2;
                $tmp = "(".$karwA.",".$rel.",".$Sawqverb.")";
                $in[$k] .= "\n".$tmp;
             }
          } 
        }
     }
   }
     for($j=0;$j<$i;$j++){
         $ans .= $in[$j]."\n";
     }
     $ans .= $lans;
     print $ans,"\n";
     $ans = "";
     $i=0;
  }
 }
 print $ans;
