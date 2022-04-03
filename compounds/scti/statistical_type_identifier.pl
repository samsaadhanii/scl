#!/usr/bin/perl

use GDBM_File;

sub statistical_type_identifier
{
 my($splitWrd,$tag,$debug_level) = @_;

 my @tag = ("T6","Bs6","K1","Tn","Di","U","T3","Tp","T7","BvS","Tg","Ds","Bs3","A1","S","Km","T4","Bsmn","Bs7","T2","Tds","T5","K5","K2","Bs5","Bb","d","Bv","K6","Bvp","Bvs","K3","BvU","Tm","T1","BsU","K7","K4","Tdt","Tk","Bsmg","E","Bss","Bs4","DI","BVS","A2");

($pUrva,$uttara) = split(/-/,$splitWrd);

 $pUrva .= "-";

for ($i=0;$i<51;$i++) {

 $TP = 1;
 $P = 1;
 $TU = 1;
 $U = 1;

 $key = $tag[$i]."#".$pUrva;
 if($LEX1{$key}) { $TP = $LEX1{$key};}
 if($LEX2{$pUrva}) { $P = $LEX2{$pUrva};}
 $key = $tag[$i]."#".$uttara;
 if($LEX1{$key}) { $TU = $LEX1{$key};}
 if($LEX2{$uttara}) { $U = $LEX2{$uttara};}
 $prob_pUrva = $TP/$P;
 $prob_uttara = $TU/$U;
 $T = chr($i+65).$tag[$i];
 $prob{$T} = $prob_pUrva * $prob_uttara; 
}

 $i=1;
 foreach $key (sort {$prob{$b} <=> $prob{$a} || $a cmp $b} keys %prob){
  $prob = $prob{$key};
  $key =~ s/^.//;
        print $i,":Rank\t$in\t$key\n";
  $i++;
 }
print "\n";
}
1;
