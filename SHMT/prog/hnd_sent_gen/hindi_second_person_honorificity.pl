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



=head1 Hindi_second_person_honorificity.pl

=head1 DESCRIPTION

In Hindi wuma is always plural. It has wU,wuma,Apa.
On the other hand, Sanskrit has wvam, which is more close to wuma than wU.
So when wvam in Sanskrit which is n singular is mapped to wuma in Hindi which is plural, we need to make the changes in Hindi agreement accordingly.
This module takes care of this divergence.

=head1 EXAMPLES

This is invoked internally within the agreement module

=head1 AUTHORS

Amba Kulkarni

ambapradeep@gmail.com

License: GPL

=cut
sub handle_second_person_honorificity{

my($j,$verb_pos);
###### handle Apa/wuma  #####################################
# The agreement with verb: wuma jAo and not wuma jA.
# jAo is produced only with 'p' vacana by the Hindi gen, and hence this adjustment.
######################################################################
#Algo: If the root is wuma, always it is plural
  for($j=1;$j<=$#wrd_ana+1;$j++){
       $var_nm = "wrd_ana_flds_".$j;
#       if((${$var_nm}[$morph_kaaraka_anal] =~ /<rel_nm:karwA><relata_pos:([0-9]+)>/) && (${$var_nm}[$morph_kaaraka_anal] =~ /^(yuRmax|Bavaw)</))
### This algo should be modified with karwA -> aBihiwa
#Should it not be second person singular -> second person plural?
  #         ${$var_nm}[$morph_kaaraka_anal] =~ /<rel_nm:karwA><relata_pos:([0-9]+)>/;
  #         $verb_pos = $1;
  #         $new_var_nm = "wrd_ana_flds_".$verb_pos;
  #         ${$new_var_nm}[$ana_fld_for_calling_gen_after_lwg] =~ s/^([^ ]+) ([^ ]+) ([^ ]+) ([^ ]+) ([^ ]+) ([^ ]+)/$1 $2 $3 p $5 $6/;
#Current algorithm changes the verb to plural if it is in 2nd 2nd person.
#But this may create problems if the verb is not in karwari prayoga.
#e.g. भृत्यैः सेव्यसे.
#Hence added following condition.

       if(${$var_nm}[$morph_kaaraka_anal] =~ /<prayogaH:karwari>/){
           ${$var_nm}[$ana_fld_for_calling_gen_after_lwg] =~ s/^([^ ]+) v ([^ ]+) s m ([^ ]+)/$1 v $2 p m $3/;
       }
   }
}
1;
