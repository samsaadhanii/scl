#!/usr/bin/env perl

while($in = <STDIN>){
chomp($in);
if($in =~ /./) {
   @f = split(/\t/,$in);

   $colorcode = "-";
   if($f[8] =~ /<viBakwiH:([1-8])/) { $colorcode = "@"."N$1";}
   elsif($f[8] =~ /<prayogaH:/) { $colorcode = "@"."KP";}
   elsif($f[8] =~ /<vargaH:avy/) { $colorcode = "@"."NA";}

   print $in,"\t",$colorcode,"\n";
} else { print "\n";}
}
