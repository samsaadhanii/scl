#!/usr/bin/env perl

#  Copyright (C) 2010-2019 Amba Kulkarni (ambapradeep@gmail.com)
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

  for($j=1;$j<=$#wrd_ana+1;$j++){
      $var_nm = "wrd_ana_flds_".$j;

      $dvikarmaka = 0;
      $karma_lifgam = "puM";
#If the word is karma
      if(${$var_nm}[$morph_kaaraka_anal] =~ /<rel_nm:karma><relata_pos:([0-9]+)>/){
         $verb_pos = $1;
         if(${$var_nm}[$ana_fld_for_calling_gen_after_lwg] =~ /^[^ _]+_[^ ]+ [^ ]+ [^ ]+ [^ ]+ [^ ]+/){
         for($k=1;$k<=$#wrd_ana+1;$k++){
             $t_var_nm = "wrd_ana_flds_".$k;
             if(($j != $k) && (${$t_var_nm}[$morph_kaaraka_anal] =~ /<rel_nm:karma><relata_pos:$verb_pos>/)){
                 $dvikarmaka = 1;
             }
         }
	 if(${$var_nm}[$morph_kaaraka_anal] =~ /<kqw_pratipadika:([^>]+)>.*<lifgam:([^>]+)/){
	     $karma_rt = $1.",".$2;
             $karma_lifgam = $2;
	 } elsif(${$var_nm}[$morph_kaaraka_anal] =~ /^([^<]+).*<lifgam:([^>]+)/){
             $karma_rt = $1.",".$2;
             $karma_rt =~ s/.*-//;
             $karma_lifgam = $2;
         }
         $karwA_rt = "jana,puM"; #If nothing is given, it is assumed that karwA is 3rd person masc, human
         $karwA_lifgam = "puM"; #If nothing is given, it is assumed that karwA is 3rd person masc, human
         for($k=1;$k<=$#wrd_ana+1;$k++){
           $new_var_nm = "wrd_ana_flds_".$k;
           if(${$new_var_nm}[$morph_kaaraka_anal] =~ /<rel_nm:karwA><relata_pos:$verb_pos>/){
	     if(${$new_var_nm}[$morph_kaaraka_anal] =~ /<kqw_pratipadika:([^>]+)>.*<lifgam:([^>]+)/){
	        $karwA_rt = $1.",".$2;
                $karwA_rt =~ s/.*-//;
             } elsif(${$new_var_nm}[$morph_kaaraka_anal] =~ /^([^<]+).*<lifgam:([^>]+)/){
                   $karwA_rt = $1.",".$2;
                }
             }
         }
         if(!$dvikarmaka && (
           ($karma_lifgam eq "napuM") &&
           (&onto_cat($karwA_rt) != &onto_cat($karma_rt)))
           || 
           (&onto_cat($karwA_rt) > &onto_cat($karma_rt))
           ) { 
              $karma_vibh = 0; 
         }else {$karma_vibh = "ko";}
#If the ontologial class of karma is higher than that of the karwA, then retain the karma viBakwi 'ko' , else 0.
#The onltological hirarchy is reflected in the lifgam. SajIva have puM and swrI gender. So if karma is in napuM, we are marking the karma vibhakti as 0. This needs to be investigated further.
        if($karma_vibh eq "0") {
           ${$var_nm}[$ana_fld_for_calling_gen_after_lwg] =~ s/^([^ ]+) ([^ ]+) ([^ ]+) ([^ ]+) ([^ ]+) ko/$1 $2 $3 $4 $5 $karma_vibh/;
           $new_var_nm = "wrd_ana_flds_".$verb_pos;
#What is the justification of following aBihiwa_karma assignment?
           #if(${$new_var_nm}[$morph_kaaraka_anal] =~ /<rel_nm:>/){
           #   ${$new_var_nm}[$morph_kaaraka_anal] =~ s/<rel_nm:><relata_pos:>/<rel_nm:aBihiwa_karma><relata_pos:$j>/;
           #}
        }
      }
     }
   }
}
1;
