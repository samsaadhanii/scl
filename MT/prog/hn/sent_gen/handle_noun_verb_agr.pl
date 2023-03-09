#!/usr/bin/env perl

#  Copyright (C) 2009-2023 Amba Kulkarni (ambapradeep@gmail.com)
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



=head1 handle_noun_verb_agreement.pl


=head1 DESCRIPTION

This function finds the unmarked argument in a sentence and marks the agreement with the verb.

=head1 EXAMPLES

invoked within the agreement module.


=head1 AUTHORS

Amba Kulkarni

ambapradeep@gmail.com

License: GPL

=cut
sub copy_abhihita_gen_num_to_verb{
##### copy gender of the abhihita to the verb ####
##################################################

my($j,$abhihita_lifgam,$abhihita_pos);

  for($j=1;$j<=$#wrd_ana+1;$j++){
     $var_nm = "wrd_ana_flds_".$j;
     $abhihita_lifgam = "m";
     $abhihita_pos = -1;

# If the word has verb analysis
     if(${$var_nm}[$morph_kaaraka_anal] =~ /<rel_nm:aBihiwa_(karwA|karma)><relata_pos:([0-9\.]+)>/){
        $abhihita_pos = $2;
        $new_var_nm = "wrd_ana_flds_".$abhihita_pos;
        if (${$new_var_nm}[$ana_fld_for_calling_gen_after_lwg] =~ /^[^ ]+ [^ ]+ ([^ ]+) ([^ ]+)/){
           $abhihita_lifgam = $1;
           $abhihita_vacanam = $2;
        }

	# Now the head is the noun closest to the verb. Hence we get the lifgam and vacanam. But if there is another noun 'samucciwa' with this noun, then the vacanam and lifgam should be changed as follows.
	# vacanam will always be plural. (Since Hindi does not have xvi-vacana)
	# lifgam will be swrI if all the sup-samucciwas are fem else masc.
	#

	for ($i=1;$i< $#wrd_ana+1; $i++) {
        $tmp_var_nm = "wrd_ana_flds_".$i;
	if (${$tmp_var_nm}[$morph_kaaraka_anal] =~ /<rel_nm:sup_samucciwaH><relata_pos:$abhihita_pos>/) {
         if (${$tmp_var_nm}[$ana_fld_for_calling_gen_after_lwg] =~ /^[^ ]+ [^ ]+ ([^ ]+) ([^ ]+)/){
           $samucciwa_lifgam = $1;
	   if(($abhihita_lifgam eq "f") && ($samucciwa_lifgam eq "m")){
		   $abhihita_lifgam = "m";
	   }
           $abhihita_vacanam = "p";
         }
        }
       }

        ${$var_nm}[$ana_fld_for_calling_gen_after_lwg] =~ s/^([^ ]+) ([^ ]+) ([^ ]+) ([^ ]+)/$1 $2 $abhihita_lifgam $abhihita_vacanam/;
        ${$var_nm}[$ana_fld_for_calling_gen_after_lwg_karwari] =~ s/^([^ ]+) ([^ ]+) ([^ ]+) ([^ ]+)/$1 $2 $abhihita_lifgam $abhihita_vacanam/;
     }
     if(${$var_nm}[$morph_kaaraka_anal] =~ /<prayogaH:(karmaNi|BAve)>/){
         for($k=1;$k<=$#wrd_ana+1;$k++){
            $var_nm1 = "wrd_ana_flds_".$j;
            if(${$var_nm1}[$morph_kaaraka_anal] =~ /<rel_nm:karwA><relata_pos:([0-9\.]+)>/){
                     $verb_pos = $1;
                     if ($index{$verb_pos} == $j) {
                           ${$var_nm1}[$ana_fld_for_calling_gen_after_lwg] =~ /^[^ ]+ [^ ]+ ([^ ]+) ([^ ]+)/;
                           $abhihita_lifgam = $1;
                           $abhihita_vacanam = $2;
                           ${$var_nm}[$ana_fld_for_calling_gen_after_lwg_karwari] =~ s/^([^ ]+) ([^ ]+) ([^ ]+) ([^ ]+)/$1 $2 $abhihita_lifgam $abhihita_vacanam/;
                     }
            }
        }
    }
  }
}
1;
