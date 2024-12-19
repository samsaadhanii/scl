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




=head1 intra_chunk.pl

=head1 DESCRIPTION

In Sanskrit both the viSeRaNas and viSeRya take vibhaktis. The agreement is shown by same gender, number, and vibhakti. In case of Hindi, viSeRaNas do not take any vibhakti but on the other hand show agreement with the viSeRya in terms of gender and number. 
This module handles this.
=head1 EXAMPLES

This is an internal module invoked by the agreement module.

=head1 AUTHORS

Amba Kulkarni

ambapradeep@gmail.com

License: GPL

=cut
sub chunk_viSeRaNa{
my($j,$viSeRya_gen);
##### Remove viBakwi of the viSeRaNa , and declare it oblique if the head has viBakwi, else direct. 
#Also change the category to Adj ########
# See the note below related to the category Adj. #######
######################################################################
  for($j=1;$j<=$#wrd_ana+1;$j++){
       $var_nm = "wrd_ana_flds_".$j;
       if(${$var_nm}[$morph_kaaraka_anal] =~ /<rel_nm:(viSeRaNam|vIpsA|aBexaH)><relata_pos:([0-9\.]+)>/){
         $new_var_nm = "wrd_ana_flds_".$2;
         if(${$new_var_nm}[$ana_fld_for_calling_gen_after_lwg] !~ /^[^ ]+ [nP] ([^ ]+) [^ ]+ [^ ]+ 0/){
		 #      && (${$new_var_nm}[$ana_fld_for_calling_gen_after_lwg] !~ /^[^ ]+ [nP] ([^ ]+) [^ ]+ [^ ]+ kA/)){
	    ${$new_var_nm}[$ana_fld_for_calling_gen_after_lwg] =~ /^[^ ]+ [nP] ([^ ]+) /;
	    ${$new_var_nm}[$ana_fld_for_calling_gen_after_lwg_karwari] =~ /^[^ ]+ [nP] ([^ ]+) /;
	    $viSeRya_gen = $1;
            if(${$var_nm}[$ana_fld_for_calling_gen_after_lwg] =~ /^([^ ]+) ([nP]) ([^ ]+) ([^ ]+) ([^ ]+) ([^ ]+)/) {
               $rt = $1;
               $cat = $2;
            }
               if($cat eq "n") { $mod_cat = "adj";} else {$mod_cat = $cat;}
               if($rt =~ /^anwika|nikata|samIpa|xUra/) {
                 if($viSeRya_gen eq "f") {
                   ${$var_nm}[$ana_fld_for_calling_gen_after_lwg] =~ s/^([^ ]+) ([nP]) ([^ ]+) ([^ ]+) ([^ ]+) ([^ ]+)/$1 $2 $viSeRya_gen $4 $5 vAlI/;
                   ${$var_nm}[$ana_fld_for_calling_gen_after_lwg_karwari] =~ s/^([^ ]+) ([nP]) ([^ ]+) ([^ ]+) ([^ ]+) ([^ ]+)/$1 $2 $viSeRya_gen $4 $5 vAlI/;
		 } else {
                   ${$var_nm}[$ana_fld_for_calling_gen_after_lwg] =~ s/^([^ ]+) ([nP]) ([^ ]+) ([^ ]+) ([^ ]+) ([^ ]+)/$1 $2 $viSeRya_gen $4 $5 vAle/;
                   ${$var_nm}[$ana_fld_for_calling_gen_after_lwg_karwari] =~ s/^([^ ]+) ([nP]) ([^ ]+) ([^ ]+) ([^ ]+) ([^ ]+)/$1 $2 $viSeRya_gen $4 $5 vAle/;
                 } 
               } else { 
		   ${$var_nm}[$ana_fld_for_calling_gen_after_lwg] =~ s/^([^ ]+) ([nP]) ([^ ]+) ([^ ]+) ([^ ]+) ([^ ]+)/$1 $mod_cat $viSeRya_gen $4 $5 1/;
		   ${$var_nm}[$ana_fld_for_calling_gen_after_lwg_karwari] =~ s/^([^ ]+) ([nP]) ([^ ]+) ([^ ]+) ([^ ]+) ([^ ]+)/$1 $mod_cat $viSeRya_gen $4 $5 1/;
	       }
#In case the viSeRaNa is a kqxanwa, then its form should have the same gender and number as the viSeRya.
# nalaH huwaBujA xagXaM araNyaM apaSyaw.
               ${$var_nm}[$ana_fld_for_calling_gen_after_lwg] =~ s/^([^ ]+) v ([^ ]+) ([^ ]+) ([^ ]+) ([^ ]+)/$1 v $viSeRya_gen p $4 $5/;
               ${$var_nm}[$ana_fld_for_calling_gen_after_lwg_karwari] =~ s/^([^ ]+) v ([^ ]+) ([^ ]+) ([^ ]+) ([^ ]+)/$1 v $viSeRya_gen p $4 $5/;
         } elsif(${$new_var_nm}[$ana_fld_for_calling_gen_after_lwg] =~ /^([^ ]+) ([nP]) ([^ ]+) ([^ ]+) ([^ ]+) 0/) {
            $cat = $2;
            $viSeRya_gen = $3;
            $viSeRya_num = $4;
#Earlier we used the category as Adj. But then, since pdgm info for Adj is not sufficient, we go back to the noun category.
# checked for viviXa n f p a 0 -> viviXeM
#while with viviXa adj f p a 0 -> viviXa
#Hence reverting back to adj
# The n_excp.c was not sorted and hence there was error in generating correct form
#It should be n, and not adj.
#just as kAlA -> kAlI with adj pdgm, sevikA -> sevikI
#Therefore adj changed to n.
#Again reverting back to adj. The analysis is correct. 
#The problem is with the Hindi generator.
#Hindi generator mixes the derivational morph (generating feminine forms from the masc adj) with the inflection.
           if(${$var_nm}[$ana_fld_for_calling_gen_after_lwg] =~ /^([^ ]+) ([nP]) ([^ ]+) ([^ ]+) ([^ ]+) ([^ ]+)/) {
           $rt = $1;
           $cat = $2;
           }
           if($cat eq "n") { $mod_cat = "adj";} else { $mod_cat = $cat;}
           if($rt =~ /^anwika|nikata|samIpa|xUra/) { 
              if($viSeRya_gen eq "f") {
                ${$var_nm}[$ana_fld_for_calling_gen_after_lwg] =~ s/^([^ ]+) ([nP]) ([^ ]+) ([^ ]+) ([^ ]+) ([^ ]+)/$1 $2 $viSeRya_gen $4 $5 vAlI/;
                ${$var_nm}[$ana_fld_for_calling_gen_after_lwg_karwari] =~ s/^([^ ]+) ([nP]) ([^ ]+) ([^ ]+) ([^ ]+) ([^ ]+)/$1 $2 $viSeRya_gen $4 $5 vAlI/;
              } elsif($viSeRya_num eq "p") {
                ${$var_nm}[$ana_fld_for_calling_gen_after_lwg] =~ s/^([^ ]+) ([nP]) ([^ ]+) ([^ ]+) ([^ ]+) ([^ ]+)/$1 $2 $viSeRya_gen $4 $5 vAle/;
                ${$var_nm}[$ana_fld_for_calling_gen_after_lwg_karwari] =~ s/^([^ ]+) ([nP]) ([^ ]+) ([^ ]+) ([^ ]+) ([^ ]+)/$1 $2 $viSeRya_gen $4 $5 vAle/;
                } else { ${$var_nm}[$ana_fld_for_calling_gen_after_lwg] =~ s/^([^ ]+) ([nP]) ([^ ]+) ([^ ]+) ([^ ]+) ([^ ]+)/$1 $2 $viSeRya_gen $4 $5 vAlA/;
              }
            } else {
              ${$var_nm}[$ana_fld_for_calling_gen_after_lwg] =~ s/^([^ ]+) ([nP]) ([^ ]+) ([^ ]+) ([^ ]+) ([^ ]+)/$1 $mod_cat $viSeRya_gen $4 $5 0/;
              ${$var_nm}[$ana_fld_for_calling_gen_after_lwg_karwari] =~ s/^([^ ]+) ([nP]) ([^ ]+) ([^ ]+) ([^ ]+) ([^ ]+)/$1 $mod_cat $viSeRya_gen $4 $5 0/;
	    }
#In case the viSeRaNa is a kqxanwa, then its form should have the same gender and number as the viSeRya.
# nalaH huwaBujA xagXaM araNyaM apaSyaw.
            ${$var_nm}[$ana_fld_for_calling_gen_after_lwg] =~ s/^([^ ]+) v ([^ ]+) ([^ ]+) ([^ ]+) ([^ ]+)/$1 v $viSeRya_gen $viSeRya_num $4 $5/;
            ${$var_nm}[$ana_fld_for_calling_gen_after_lwg_karwari] =~ s/^([^ ]+) v ([^ ]+) ([^ ]+) ([^ ]+) ([^ ]+)/$1 v $viSeRya_gen $viSeRya_num $4 $5/;
         } elsif(${$new_var_nm}[$ana_fld_for_calling_gen_after_lwg] =~ /^([^ ]+) ([nP]) ([^ ]+) ([^ ]+) ([^ ]+) kA/) { 
# This case arises if because of kriyAmUla noun gets 6th case and its adj has some other vibh.
#Ex: kqRNaH preyasaH janAn smarawi.
            $cat = $2;
            $viSeRya_gen = $3;
            $viSeRya_num = $4;
           if(${$var_nm}[$ana_fld_for_calling_gen_after_lwg] !~ /^([^ ]+) ([nP]) ([^ ]+) ([^ ]+) ([^ ]+) kA/) {
           $rt = $1;
           $cat = $2;
           if($cat eq "n") { $mod_cat = "adj";} else { $mod_cat = $cat;}
           ${$var_nm}[$ana_fld_for_calling_gen_after_lwg] =~ s/^([^ ]+) ([nP]) ([^ ]+) ([^ ]+) ([^ ]+) ([^ ]+)/$1 $mod_cat $viSeRya_gen $4 $5 0/;
           ${$var_nm}[$ana_fld_for_calling_gen_after_lwg_karwari] =~ s/^([^ ]+) ([nP]) ([^ ]+) ([^ ]+) ([^ ]+) ([^ ]+)/$1 $mod_cat $viSeRya_gen $4 $5 0/;
           }
        }
      }
  }
}
1;
