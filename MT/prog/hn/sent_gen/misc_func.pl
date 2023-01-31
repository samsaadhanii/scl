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


=head1 misc_func.pl


=head1 DESCRIPTION

As the name implies this file contains all the miscelleneous functions needed by other functions in this directory of agreement module.

=head1 EXAMPLES

The functions are invoked internally by other modules.

=head1 AUTHORS

Amba Kulkarni

ambapradeep@gmail.com

License: GPL

=cut
sub print_array{
   my($out_device,$title,$fld1,$fld2,$fld3,$fld4) = @_;
   my($j,$k);
   if($title ne "") { print $out_device "---------\n",$title,"\n---------\n";}
   for($j=1;$j<=$#wrd_ana+1;$j++){
       $var_nm = "wrd_ana_flds_".$j;
      for($k=0;$k<=$flds;$k++){
          if(($title ne "") && ($k == $fld1 || $k == $fld2 || $k == $fld3 || $k == $fld4)){
              print $out_device ${$var_nm}[$k],"\t";
          } elsif($title eq "") { print $out_device ${$var_nm}[$k],"\t";}
      }
      print $out_device "\n";
   }
 }
1;

sub get_hn_lifga{
 my($wrd,$lifga) = @_;

 $wrd = &std_hindi_spelling($wrd);
 if($FEM{$wrd}) { $lifga = "f";}
 elsif($lifga eq "napuM") { $lifga = "m";}
 elsif($lifga eq "puM") { $lifga = "m";}
 elsif($lifga eq "swrI") { $lifga = "f";}
 elsif($lifga eq "a") { $lifga = "m";}

$lifga;
}
1;

#sub get_hn_num{
# my($num) = @_;
#
# if($num eq "eka") { $num = "s";}
# else { $num = "p";}
#
#$num;
#}
#1;

sub std_hindi_spelling{
my($in) = @_;

$in =~ s/f([kKgGf])/M$1/g;
$in =~ s/F([cCjJF])/M$1/g;
$in =~ s/N([tTdDN])/M$1/g;
$in =~ s/n([wWxXn])/M$1/g;
$in =~ s/m([pPbBm])/M$1/g;
$in =~ s/m$/M/g;
$in =~ s/m(\b)/M$1/g;
$in;
}
1;

sub onto_cat{
my($in) = @_;

if($HMN{$in}) { #print "$in human\n"; 
   return 3;
} elsif($ANMT{$in}) { #print "$in animate\n"; 
   return 2;
}elsif($INANMT{$in}) { #print "$in inanimate\n"; 
   return 1;
} else {return 3; } # In case the word is not found in the dict, it is assumed to be human 
}
1;
