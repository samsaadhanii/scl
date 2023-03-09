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


=head1 karmaNi_BAve_to_karwari.pl

This function handle_karmaNi_BAve() translates the Sanskrit sentence in karmaNi/BAve prayoga by converting it into karwari

=head1 DESCRIPTION

Sanskrit uses karmaNi and BAve prayogas very often. In Hindi such constructions do not sound good. Hence we convert these into karwari (by changing the vibhaktis of karwA and karma and the tin suffix, and then translate it into Hindi

=head1 EXAMPLES

This function is a part of the Hindi generation module.

=head1 AUTHORS

Amba Kulkarni

ambapradeep@gmail.com

License: GPL

=cut

sub karmaNi_BAve{
 my($j,$verb_pos);


  $verb_pos = 0;
 ## Check if there is a verb in karmaNi or BAve.
  for($j=1;$j<=$#wrd_ana+1;$j++){
       $var_nm = "wrd_ana_flds_".$j;
       ${$var_nm}[$ana_fld_for_calling_gen_after_lwg+1] = ${$var_nm}[$ana_fld_for_calling_gen_after_lwg];

#If the verb is in karmaNi or BAve
      if ((${$var_nm}[$morph_kaaraka_anal] =~ /<prayogaH:karmaNi>/) || (${$var_nm}[$morph_kaaraka_anal] =~ /<prayogaH:BAve>/)){
            $verb_pos = $j;
      }
   }
  ## If the sentence/shloka contains at least one verb in karmaNi/BAve
   if ($verb_pos > 0) {
     for($j=1;$j<=$#wrd_ana+1;$j++){
       $var_nm = "wrd_ana_flds_".$j;
       if(${$var_nm}[$morph_kaaraka_anal] =~ /<rel_nm:(karwA|karma)><relata_pos:([0-9\.]+)>/){
            $verb_pos = $2;
            $var_nm1 = "wrd_ana_flds_".$verb_pos;
            if ((${$var_nm1}[$morph_kaaraka_anal] =~ /<prayogaH:karmaNi>/) || (${$var_nm1}[$morph_kaaraka_anal] =~ /<prayogaH:BAve>/)){
                 ${$var_nm}[$ana_fld_for_calling_gen_after_lwg+1] =~ s/^([^ ]+) ([^ ]+) ([^ ]+) ([^ ]+) ([^ ]+) 0/$1 $2 $3 $4 $5 ko/;
                 ${$var_nm}[$ana_fld_for_calling_gen_after_lwg+1] =~ s/^([^ ]+) ([^ ]+) ([^ ]+) ([^ ]+) ([^ ]+) ke\~xvArA/$1 $2 $3 $4 $5 0/;
                 ${$var_nm1}[$ana_fld_for_calling_gen_after_lwg+1] =~ s/yA_jAwA_hE/wA_hE/;
		## we need to add this for all the mappings in karmaNI_lakAra and BAve_lakAra
            }
       }
     }
   }
}
1;
