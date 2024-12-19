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



=head1 kriyAmUla_karma_viBakwi.pl


=head1 DESCRIPTION

The Sanskrit nAmaXAwu are mapped to the kriyAmUla in Hindi. When this is done, the kriyAmUla itself assigns some vibhakti to its karma, which is different from the karma vibhakti in Sanskrit. This module takes care of this aspect.

=head1 EXAMPLES

This is invoked internally in the agreement module.

=head1 AUTHORS

Amba Kulkarni

ambapradeep@gmail.com

License: GPL

=cut
sub kriyAmUla_karma_viBakwi{

my($j,$verb_pos,$kriyAmUla,$karma_marker);

# If the verb is of kriyAmUla type, then change the vibhakti of karma to 'kA/meM/para/se'.

  for($j=1;$j<=$#wrd_ana+1;$j++){
       $var_nm = "wrd_ana_flds_".$j;

       #print ${$var_nm}[$morph_kaaraka_anal],"\n";
#If the word is karma
      if((${$var_nm}[$morph_kaaraka_anal] =~ /<rel_nm:karma><relata_pos:([0-9\.]+)>/) || (${$var_nm}[$morph_kaaraka_anal] =~ /<rel_nm:(muKya|gONa)karma><relata_pos:([0-9\.]+)>/)){
         $verb_pos = $1;
         $new_var_nm = "wrd_ana_flds_".$verb_pos;
         if(${$new_var_nm}[$ana_fld_for_calling_gen_after_lwg] =~ /^([^_]+_([^ ])+)/){
            $kriyAmUla = $1;
            if($kriyAmUla_marker{$kriyAmUla}) { 
	       $karma_marker = $kriyAmUla_marker{$kriyAmUla};
	      if ((${$var_nm}[$ana_fld_for_calling_gen_after_lwg] =~ / v /) &&
	          ($kriyAmUla eq "icCA_kara")) {
                   ${$var_nm}[$ana_fld_for_calling_gen_after_lwg] =~ s/^([^ ]+) ([^ ]+) ([^ ]+) ([^ ]+) ([^ ]+) ([^ ]+)/$1 $2 $3 $4 $5 nA\~$karma_marker/;
                   ${$var_nm}[$ana_fld_for_calling_gen_after_lwg_karwari] =~ s/^([^ ]+) ([^ ]+) ([^ ]+) ([^ ]+) ([^ ]+) ([^ ]+)/$1 $2 $3 $4 $5 nA\~$karma_marker/;
              } else {
	       if(${$var_nm}[$morph_kaaraka_anal] =~ /<rt:kim_1>/) {
                  ${$var_nm}[$ana_fld_for_calling_gen_after_lwg] =~ s/^([^ ]+) ([^ ]+) ([^ ]+) ([^ ]+) ([^ ]+) ([^ ]+)/$1 avy NW NW NW NW/;
                  ${$var_nm}[$ana_fld_for_calling_gen_after_lwg_karwari] =~ s/^([^ ]+) ([^ ]+) ([^ ]+) ([^ ]+) ([^ ]+) ([^ ]+)/$1 avy NW NW NW NW/;
	      } else {
               ${$var_nm}[$ana_fld_for_calling_gen_after_lwg] =~ s/^([^ ]+) ([^ ]+) ([^ ]+) ([^ ]+) ([^ ]+) ([^ ]+)/$1 $2 $3 $4 $5 $karma_marker/;
               ${$var_nm}[$ana_fld_for_calling_gen_after_lwg_karwari] =~ s/^([^ ]+) ([^ ]+) ([^ ]+) ([^ ]+) ([^ ]+) ([^ ]+)/$1 $2 $3 $4 $5 $karma_marker/;
              }
             }
	   }
         }
       }
   }
}
1;
