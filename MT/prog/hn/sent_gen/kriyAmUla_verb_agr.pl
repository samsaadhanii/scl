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




=head1 kriyAmUla_verb_agr.pl

=head1 DESCRIPTION

This module handles the  agreement between the kriyAmUla and the verb.

=head1 EXAMPLES

This function is invoked internally by the Hindi agreement module.

=head1 AUTHORS

Amba Kulkarni

ambapradeep@gmail.com

License: GPL

=cut
sub handle_kriyAmUla_verb_agr{
  my($karma_vib_found,$karwA_viB_found,$kriyAmUla,$agreeing_gen);
# If the verb is of kriyAmUla type, and both karwA and karma have viBaktis, then agreement of the verb is with its kriyAmUla.
#pawnI pawi kI sevA karawI hE
#pawnI pawi kA anukaraNa karawI hE
#pawnI xvArA pawi kA anukaraNa kiyA gayA
#pawnI xvArA pawi kI sevA kiyA gayA

for($j=1;$j<=$#wrd_ana+1;$j++){
       $var_nm = "wrd_ana_flds_".$j;
       if(${$var_nm}[$ana_fld_for_calling_gen_after_lwg] =~ /^([^_]+_(kara|ho|xe|laga)) /){

       $karma_vib_found = 0;
       $karwA_vib_found = 0;
       $karma_found=0;
       $karwA_found=0;

       for($k=1;$k<=$#wrd_ana+1;$k++){
           $new_var_nm = "wrd_ana_flds_".$k;
           if(${$new_var_nm}[$morph_kaaraka_anal] =~ /<rel_nm:karma><relata_pos:$j>/){
	       $karma_found=1;
               if(${$new_var_nm}[$ana_fld_for_calling_gen_after_lwg] =~ /^([^ ]+) ([^ ]+) ([^ ]+) ([^ ]+) ([^ ]+) ([^0]+)/) { $karma_vib_found = 1;}
           }
           if(${$new_var_nm}[$morph_kaaraka_anal] =~ /<rel_nm:karwA><relata_pos:$j>/){
	        $karwA_found=1;
               if(${$new_var_nm}[$ana_fld_for_calling_gen_after_lwg] =~ /^([^ ]+) ([^ ]+) ([^ ]+) ([^ ]+) ([^ ]+) ([^0]+)/) { $karwA_vib_found = 1;}
           }
        }
        if(($karwA_vib_found == $karwA_found ) && ($karma_vib_found == $karma_found)) {
         if(${$var_nm}[$ana_fld_for_calling_gen_after_lwg] =~ /^([^_]+)_(kara|ho|xe|laga) .* (yA)/){
            $kriyAmUla = $1;
            $agreeing_gen = &get_hn_lifga($kriyAmUla,"a");
# Number in such cases is always assumed to be singluar.
#In case there are any exceptions, they are to be listed.
            ${$var_nm}[$ana_fld_for_calling_gen_after_lwg] =~ s/^([^ ]+) ([^ ]+) ([^ ]+) ([^ ]+) ([^ ]+) yA/$1 $2 $agreeing_gen s $5 yA/;
            ${$var_nm}[$ana_fld_for_calling_gen_after_lwg_karwari] =~ s/^([^ ]+) ([^ ]+) ([^ ]+) ([^ ]+) ([^ ]+) yA/$1 $2 $agreeing_gen s $5 yA/;
         }
       }
     }
    }
}
1;
