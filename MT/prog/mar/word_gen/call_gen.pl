#!/usr/bin/env perl

#  Copyright (C) 2009-2022 Amba Kulkarni (ambapradeep@gmail.com)
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



=head1  call_gen.pl


=head1 DESCRIPTION

This script invokes the Hindi generator.

=head1 EXAMPLES

This is invoked within a shell program after doing the agreement.

=head1 AUTHORS

Amba Kulkarni

ambapradeep@gmail.com

License: GPL

=cut

$MYPATH=$ARGV[0];
$LTPROCBIN=$ARGV[1];
$| = 1;

while($in = <STDIN>){

 chomp($in);
 print $in; # We do not add the field separator \t, since it has already been added by the previous programme agreement.pl

 @f = split(/\t/,$in);

 if($in) {
   my $out = &call_gen($f[14]);
   print $out;
 } 
 print "\n";
}

sub call_gen{
my($in) = @_;


my($out,$str,$ans);
   $out = "";
   $str = "";
   $ans = "";
      $in =~ s/\/$//;
      ($rt,$cat,$gen,$num,$per,$tam) = split(/ /,$in);

      if($rt =~ /^(.*[-_])([^\-]+)$/) { $pUrva = $1; $rt = $2;} else {$pUrva = "";}
      if($rt =~ /\-/) {$rt =~ s/\-/__/g;}
 
      
      ##########################
      if($cat eq "v") {
         $tam =~ s/tam://;
         if ( $tam eq "wa_asa_I" ) {
		print $rt."wa_";
         $str = "asa<cat:$cat><tam:I><gender:$gen><number:$num><person:$per>";
      }
      elsif ($tam eq "Ne_sATI") {
         $str = "$rt<cat:n><cat:v><suff:Ne><parsarg:sATI>";
         
      } else {
               $str = "$rt<cat:$cat><tam:$tam><gender:$gen><number:$num><person:$per>";
             }
      }
      if($cat eq "P") {
         $tam =~ s/tam://;
	 if ($rt eq "mI") { $gen = "any";}
	 elsif ($rt eq "wU") { $gen = "any";}
	 elsif ($rt eq "wo") { $gen = "m";}
	 elsif ($rt eq "wI") { $gen = "f";}
	 elsif ($rt eq "we") { $gen = "n";}
	 #elsif ($rt eq "hA") { $gen = "n";}
         $str = "$rt<cat:$cat><gender:$gen><number:$num><parsarg:$tam>";
      }
      if($cat eq "avy") {
         $tam =~ s/tam://;
         if (($rt eq "nehamI") || ($rt eq "Aja")) {
             $str = "$rt<cat:n><gender:m><number:eka><parsarg:0>";
         } else {
             $str = "$rt<cat:$cat>";
         }
      }
      if($cat eq "n") {
         $tam =~ s/tam://;
         $str = "$rt<cat:$cat><gender:$gen><number:$num><parsarg:$tam>";
      }
	
      $ans = "echo '$str' | $LTPROCBIN -c $MYPATH/MT/prog/mar/word_gen/mar_gen.bin | sed '1,\$s/.*>.//' | sed 's/.\$//' ";
      open (TMP,">>/tmp/xx");
      print TMP $ans,"\n";
      close(TMP);
      $out = `$ans`;
      if ($out =~ /\//) { $out =~ s/\/.*//;} ## This is the case when the word is not found in Mar dix file
      open (TMP,">>/tmp/yy");
      print TMP $out;
      close(TMP);

      $out =~ s/__/-/g;
      $out = $pUrva.$out;
$out;
}
1;
