#!/usr/bin/env perl

while($in = <STDIN>){
chomp($in);
@in_arr = split(/\t/,$in);
$cnt = $#in_arr;
$tmp = $in_arr[$cnt-1];
$tmp=~ s/\/.*//;
print $in,"\t",$tmp,"\t\n";
}
