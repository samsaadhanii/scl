#!/usr/bin/env perl

$morph_kaaraka_anal = 6;

while($in = <STDIN>){
chomp($in);
if($in =~ /./) {
   @f = split(/\t/,$in);

   $colorcode = "-";
   if($f[$morph_kaaraka_anal] =~ /<viBakwiH:([1-8])/) { $colorcode = "@"."N$1";}
   elsif($f[$morph_kaaraka_anal] =~ /<prayogaH:/) { $colorcode = "@"."KP";}
   elsif($f[$morph_kaaraka_anal] =~ /<vargaH:avy/) { $colorcode = "@"."NA";}
   elsif($f[$morph_kaaraka_anal] =~ /<vargaH:sapUpa/) { $colorcode = "@"."CP";}
   elsif($f[$morph_kaaraka_anal] =~ /^\-$/) { $colorcode = "@"."FS";}

   print $in,"\t",$colorcode,"\n";
} else { print "\n";}
}
