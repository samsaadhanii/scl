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

sub add_ki{
 my($j,$verb_pos,$hnd_verb,$karma_found);

 #print $hnd_verb;

  $karma_found = 0;
  for($j=1;$j<=$#wrd_ana+1;$j++){
       $var_nm = "wrd_ana_flds_".$j;

       #If the word is karwA, and

	   #print "##Var_nm:|$var_nm:|${$var_nm}[$morph_kaaraka_anal]|\n";
      if(${$var_nm}[$morph_kaaraka_anal] =~ /<rel_nm:karma><relata_pos:([0-9\.]+)>/){
         $verb_pos = $1;
        $new_var_nm = "wrd_ana_flds_".$verb_pos;
         $karma_found = 1;
	 $karma_pos=$j;
          $new_var_nm = "wrd_ana_flds_".$verb_pos;
		  # print "###|$new_var_nm|$ana_fld_for_calling_gen_after_lwg|\n";
# If the verb has yA tam
		  #     if(${$new_var_nm}[$ana_fld_for_calling_gen_after_lwg] =~ /yA$/) {
# Then change the viBakwi to ne, if the verb is not from exceptional verb list
	  #Also now verb is no longer in agreement with the karwA, and hence remove the aBihiwa_karwA info.
	  ${$new_var_nm}[$ana_fld_for_calling_gen_after_lwg] =~ /^([^ ]+) ([^ ]+) ([^ ]+) ([^ ]+) ([^ ]+) /;
             $tel_verb = $1;
			 #print "|tel_verb|\n";
			 #print "####|$tel_verb| ${$new_var_nm}[$ana_fld_for_calling_gen_after_lwg]|\n";
             ${$new_var_nm}[$ana_fld_for_calling_gen_after_lwg+1] =~ /^([^ ]+) ([^ ]+) ([^ ]+) ([^ ]+) ([^ ]+) /;
             if($EXCPT_KI{$tel_verb} == 1) {
                 ${$var_nm}[$ana_fld_for_calling_gen_after_lwg] =~ s/^([^ ]+) ([^ ]+) ([^ ]+) ([^ ]+) ([^ ]+) ni/$1 $2 $3 $4 $5 ki/;
                 ${$var_nm}[$ana_fld_for_calling_gen_after_lwg+1] =~ s/^([^ ]+) ([^ ]+) ([^ ]+) ([^ ]+) ([^ ]+) ni/$1 $2 $3 $4 $5 ki/;
             }
          }
  }
}
1;
