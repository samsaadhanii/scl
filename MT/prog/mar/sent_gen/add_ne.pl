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


=head1 add_ne.pl

This function add_ne()  adds 'ne' parasarga to the karwA.

=head1 DESCRIPTION

Hindi has an idiosynchrosy. It has an ergative suffix 'ne' with the past tense of the verb form. Most of the transitive verbs take this 'ne' with a few exceptional verbs such as 'le'.

=head1 EXAMPLES

This function is a part of the Hindi generation module.

=head1 AUTHORS

Amba Kulkarni

ambapradeep@gmail.com

License: GPL

=cut

sub add_ne{
 my($j,$verb_pos,$hnd_verb,$karwA_found);

print $hnd_verb;

  $karwA_found = 0;
  for($j=1;$j<=$#wrd_ana+1;$j++){
       $var_nm = "wrd_ana_flds_".$j;

       #If the word is karwA, and

      if(${$var_nm}[$morph_kaaraka_anal] =~ /<rel_nm:karwA><relata_pos:([0-9\.]+)>/){
         $verb_pos = $1;
         $karwA_found = 1;
          $new_var_nm = "wrd_ana_flds_".$verb_pos;
# If the verb has yA tam
          if(${$new_var_nm}[$ana_fld_for_calling_gen_after_lwg] =~ /yA$/) {
# Then change the viBakwi to ne, if the verb is not from exceptional verb list
#Also now verb is no longer in agreement with the karwA, and hence remove the aBihiwa_karwA info.
             ${$new_var_nm}[$ana_fld_for_calling_gen_after_lwg] =~ /^([^ ]+) ([^ ]+) ([^ ]+) ([^ ]+) ([^ ]+) yA/;
             ${$new_var_nm}[$ana_fld_for_calling_gen_after_lwg+1] =~ /^([^ ]+) ([^ ]+) ([^ ]+) ([^ ]+) ([^ ]+) yA/;
             $hnd_verb = $1;
             if($EXCPT_NE{$hnd_verb} != 1) {
                 ${$var_nm}[$ana_fld_for_calling_gen_after_lwg] =~ s/^([^ ]+) ([^ ]+) ([^ ]+) ([^ ]+) ([^ ]+) 0/$1 $2 $3 $4 $5 ne/;
                 ${$var_nm}[$ana_fld_for_calling_gen_after_lwg+1] =~ s/^([^ ]+) ([^ ]+) ([^ ]+) ([^ ]+) ([^ ]+) 0/$1 $2 $3 $4 $5 ne/;
           
                 $karma_pos = -1;
                 for($k=1;$k<=$#wrd_ana+1;$k++){
                    $tmp_var_nm = "wrd_ana_flds_".$k;
                    if(${$tmp_var_nm}[$morph_kaaraka_anal] =~ /<rel_nm:karma><relata_pos:$verb_pos>/){
		    $karma_pos = $k;
                    }
                }

                 if ($karma_pos != -1) {
                     $karma_nm = "wrd_ana_flds_".$karma_pos;
                     if (${$karma_nm}[$ana_fld_for_calling_gen_after_lwg] =~ /^([^ ]+) ([^ ]+) ([^ ]+) ([^ ]+) ([^ ]+) 0/){
# rAmaH Palam aKAxaw
                        ${$new_var_nm}[$morph_kaaraka_anal] =~ s/<rel_nm:aBihiwa_karwA><relata_pos:[0-9\.]+>/<rel_nm:aBihiwa_karma><relata_pos:$karma_pos>/;
                     }
                     else {
			   ${$new_var_nm}[$morph_kaaraka_anal] =~ s/<rel_nm:aBihiwa_karwA><relata_pos:[0-9\.]+>/<rel_nm:><relata_pos:>/;
                           ${$new_var_nm}[$ana_fld_for_calling_gen_after_lwg] =~ s/^([^ ]+) ([^ ]+) ([^ ]+) ([^ ]+) ([^ ]+) /$1 $2 m s $5 /;
                           ${$new_var_nm}[$ana_fld_for_calling_gen_after_lwg+1] =~ s/^([^ ]+) ([^ ]+) ([^ ]+) ([^ ]+) ([^ ]+) /$1 $2 m s $5 /;
# ramaH mohanam awAdayaw
                     }
                 } else {
                     ${$new_var_nm}[$morph_kaaraka_anal] =~ s/<rel_nm:aBihiwa_karwA><relata_pos:[0-9\.]+>/<rel_nm:><relata_pos:>/;
                     ${$new_var_nm}[$ana_fld_for_calling_gen_after_lwg] =~ s/^([^ ]+) ([^ ]+) ([^ ]+) ([^ ]+) ([^ ]+) /$1 $2 m s $5 /;
                     ${$new_var_nm}[$ana_fld_for_calling_gen_after_lwg+1] =~ s/^([^ ]+) ([^ ]+) ([^ ]+) ([^ ]+) ([^ ]+) /$1 $2 m s $5 /;
# rAmaH aKAxaw
		 }
             }
          }
      }
  }

  # If there is no karwA in the sentence then to mark the agreement with the karma, in case the karma has 0 vibhkati (which is decided by the later rules)
  #  Palam aKAxam / rotikAm aKAxam / mohanam awAdayam/ Palam aKAxaH / rotikAm aKAxaH / mohanam awAdayaH
      $karma_pos = -1;
      for($k=1;$k<=$#wrd_ana+1;$k++){
          $tmp_var_nm = "wrd_ana_flds_".$k;
          if(${$tmp_var_nm}[$morph_kaaraka_anal] =~ /<rel_nm:karma><relata_pos:([0-9\.]+)>/){
	    $verb_pos = $1;
	    $karma_pos = $k;
          }
      }

  $verb_var_nm = "wrd_ana_flds_".$verb_pos;
# If the verb has yA tam
  if(${$verb_var_nm}[$ana_fld_for_calling_gen_after_lwg] =~ /yA$/) {
    if($karwA_found == 0) {
     for($j=1;$j<=$#wrd_ana+1;$j++){
         $var_nm = "wrd_ana_flds_".$j;
	      if((${$var_nm}[$morph_kaaraka_anal] =~ /<rel_nm:karwA><relata_pos:([0-9\.]+)>/) || (${$var_nm}[$morph_kaaraka_anal] =~ /puruRaH:u/) || (${$var_nm}[$morph_kaaraka_anal] =~ /puruRaH:ma/)){
	     if ($karma_pos != -1) {
		     	 	     ${$var_nm}[$morph_kaaraka_anal] =~ s/<rel_nm:><relata_pos:>/<rel_nm:aBihiwa_karma><relata_pos:$karma_pos>/;
	     }
	    } 
	  }
  }
 }
}
1;
