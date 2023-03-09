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



=head1 hindi_idio_karma_ko.pl

=head1 DESCRIPTION

This function handles the idiosynchrotic behaviour of Hindi 'ko'.

=head1 EXAMPLES

This is called within an agreement module. It is not an independent function.

=head1 AUTHORS

Amba Kulkarni

ambapradeep@gmail.com

License: GPL

=cut
sub handle_hindi_idio_karma_ko{
my($j,$k,$verb_pos,$dvikarmaka,$karma_lifgam,$karma_rt,$karwA_rt,$karwA_lifgam);
#handle ko in karma
#

  for($j=1;$j<=$#wrd_ana+1;$j++){
      $var_nm = "wrd_ana_flds_".$j;

#If the word is karma
 if(
   (${$var_nm}[$morph_kaaraka_anal] =~ /<rel_nm:karma><relata_pos:([0-9\.]+)>/)
|| (${$var_nm}[$morph_kaaraka_anal] =~ /<rel_nm:muKyakarma><relata_pos:([0-9\.]+)>/)){
         $verb_pos = $1;
	 $karma_rt = &get_rt_gen(${$var_nm}[$morph_kaaraka_anal]);

         $karwA_rt = "jana,puM"; #If nothing is given, it is assumed that karwA is 3rd person masc, human
         for($k=1;$k<=$#wrd_ana+1;$k++){
             $new_var_nm = "wrd_ana_flds_".$k;
              if(${$new_var_nm}[$morph_kaaraka_anal] =~ /<rel_nm:karwA><relata_pos:$verb_pos>/){
	          $karwA_rt = &get_rt_gen(${$new_var_nm}[$morph_kaaraka_anal]);
              }
         }

#If the ontologial class of karma is higher than that of the karwA, then retain the karma viBakwi 'ko' , else 0.
	 #print STDERR $karwA_rt,"\n";
	 #print STDERR $karma_rt,"\n";
	 #print STDERR &onto_cat($karma_rt),"\n";
	 #print STDERR &onto_cat($karwA_rt),"\n";
         if( &onto_cat($karwA_rt) > &onto_cat($karma_rt)) 
	      { $karma_vibh = 0; }
	 else { $karma_vibh = "ko";}

        if($karma_vibh eq "0") {
           ${$var_nm}[$ana_fld_for_calling_gen_after_lwg] =~ s/^([^ ]+) ([^ ]+) ([^ ]+) ([^ ]+) ([^ ]+) ko/$1 $2 $3 $4 $5 $karma_vibh/;
           ${$var_nm}[$ana_fld_for_calling_gen_after_lwg_karwari] =~ s/^([^ ]+) ([^ ]+) ([^ ]+) ([^ ]+) ([^ ]+) ko/$1 $2 $3 $4 $5 $karma_vibh/;
        }
     }
   }

}
1;

  sub get_rt_gen {
    my($morph_anal) = @_;
    my($rt);

       $rt = "";
       #print STDERR $morph_anal,"\n";
       if($morph_anal =~ /<kqw_pratipadika:([^>]+)>.*<lifgam:([^>]+)/){
	   $rt = $1.",".$2;
        } elsif($morph_anal =~ /<rt:([^>]+).*<lifgam:([^>]+)/){
           $rt = $1.",".$2;
       }
       $rt =~ s/.*-//;
       #print STDERR $rt,"\n";
       $rt;
   }
  1;
