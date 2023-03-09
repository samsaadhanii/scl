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



=head1 karwA_and_karwA_samAnAXikaraNa_agreement

=head1 DESCRIPTION

This program handles the gender and number agreement between the karwA and karwA_samAnAXikaraNa (viXeya viSeRaNa).

=head1 EXAMPLES

This function is invoked by the agreement module.

=head1 AUTHORS

Amba Kulkarni

ambapradeep@gmail.com

License: GPL

=cut
sub karwA_and_karwA_samAnAXikaraNa_agr{

 my($j,$k,$verb_pos,$lifgam,$rt,$abhihita_lifgam);
### copy karwA gender to karwA samAnAXikaraNa #######
#####################################################
# Search for karwA-samAnAXikaraNa relation, and copy karwA's gender to it
  for($j=1;$j<=$#wrd_ana+1;$j++){
       $var_nm = "wrd_ana_flds_".$j;

     if(${$var_nm}[$morph_kaaraka_anal] =~ /<rel_nm:karwqsamAnAXikaraNam><relata_pos:([0-9\.]+)>/){
         $verb_pos = $1;
	 #for($k=0;$k<=$flds;$k++){
	 for($k=1;$k<=$#wrd_ana+1;$k++){
             $new_var_nm = "wrd_ana_flds_".$k;
             if(${$new_var_nm}[$morph_kaaraka_anal] =~ /<rel_nm:karwA><relata_pos:$verb_pos>/){
               if(${$new_var_nm}[$morph_kaaraka_anal] =~ /<lifgam:([^>]+)>/){
                    $lifgam = $1;
                    ${$new_var_nm}[$ana_fld_for_calling_gen_after_lwg] =~ /^([^ ]+) /;
                    ${$new_var_nm}[$ana_fld_for_calling_gen_after_lwg_karwari] =~ /^([^ ]+) /;
                    $rt = $1;
                    $abhihita_lifgam = &get_hn_lifga($rt,$lifgam);
               } else { $abhihita_lifgam = "m";} # Default
             }
             ${$var_nm}[$ana_fld_for_calling_gen_after_lwg] =~ /^([^ ]+) ([^ ]+) ([^ ]+)/;
             ${$var_nm}[$ana_fld_for_calling_gen_after_lwg_karwari] =~ /^([^ ]+) ([^ ]+) ([^ ]+)/;
               $rt = $1; $lifgam = $3;
               if($abhihita_lifgam ne $lifgam) {
                  if(($abhihita_lifgam eq "f") && ($rt =~ /A$/)){
                      $rt =~ s/A$/I/; 
                      # uwwamam puswakam -> acCA puswaka -> acCI puswaka
                  }
               }
               ${$var_nm}[$ana_fld_for_calling_gen_after_lwg] =~ s/^([^ ]+) ([^ ]+) ([^ ]+)/$rt $2 $abhihita_lifgam/;
               ${$var_nm}[$ana_fld_for_calling_gen_after_lwg_karwari] =~ s/^([^ ]+) ([^ ]+) ([^ ]+)/$rt $2 $abhihita_lifgam/;
         }
      }
   }
}
1;
