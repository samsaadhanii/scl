#!/usr/bin/env perl

$color{"N1"} = "#00BFFF";
$color{"N2"} = "#93DB70";
$color{"N3"} = "#40E0D0";
$color{"N4"} = "#B0E2FF";
$color{"N5"} = "#B4FFB4";
$color{"N6"} = "#87CEEB";
$color{"N7"} = "#C6E2EB";
$color{"N8"} = "#6FFFC3";
$color{"NA"} = "#FF99FF";
$color{"KP"} = "#FF3075";
$color{"CP"} = "#FFFF00";

while($in = <STDIN>){
chomp($in);
   $in =~ s/\t(N[1-8])\t/\t$color{$1}\t/;
   $in =~ s/\t(NA)\t/\t$color{$1}\t/;
   $in =~ s/\t(KP)\t/\t$color{$1}\t/;
   $in =~ s/\t(CP)\t/\t$color{$1}\t/;
   print $in,"\n";
}
