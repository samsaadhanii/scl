#!/usr/bin/env perl

#  Copyright (C) 2010-2016 Amba Kulkarni (ambapradeep@gmail.com)
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



=head1 handle_RaRTI_lifgam

=head1 DESCRIPTION

This module handles the agreement with the following 
=head1 EXAMPLES

..how to use it

=head1 SEE ALSO

..related works: other modules, programs, RFCs

=head1 AUTHORS

Amba Kulkarni

ambapradeep@gmail.com

License: GPL

=cut
sub handle_RaRTI_lifgam{

my($gen,$num,$per,$vibh,$continue);

#%ke_parsarg_list = ("Age",1,"bAhara",1, "barAbara",1, "bAre",1, "bAxa",1, "baxale",1, "binA",1, "BIwara",1, "cAroM",1, "xonoM",1, "hewu",1, "jEsA",1, "kAraNa",1, "nikata",1,"nIce",1,"pahale",1,"pAsa",1,"paScima",1,"pICe",1,"prawi",1,"pUrva",1,"saba",1,"samAna",1,"sAmane",1,"samIpa",1,"sAWa",1,"Upara",1,"uwwara",1,"vinA",1,"viparIwa",1,"viRaya",1,"xakRiNa",1,"xvArA",1,"sAWa",1,"sAWa_sAWa",1,"Gara",1);
#Why the word 'Gara is there in this list? This creates problems with 'wasya gqham kuwra aswi. -- 23 Apr 2020
%ke_parsarg_list = ("Age",1,"bAhara",1, "barAbara",1, "bAre",1, "bAxa",1, "baxale",1, "binA",1, "BIwara",1, "cAroM",1, "xonoM",1, "hewu",1, "jEsA",1, "kAraNa",1, "maXya", 1,"nikata",1,"nIce",1,"pUrva",1,"pahale",1,"pAsa",1,"paScima",1,"pICe",1,"prawi",1,"pUrva",1,"saba",1,"samAna",1,"sAmane",1,"samIpa",1,"sAWa",1,"Upara",1,"uwwara",1,"vinA",1,"viparIwa",1,"viRaya",1,"xakRiNa",1,"xvArA",1,"sAWa_sAWa",1);

%kI_parsarg_list = ("ora",1,"waraha",1,"xAIM",1);

###### Handle kA/kI/ke agreement #####################################
######################################################################
#Algo: Check the word in 6th case with which it agrees.
# If that word is feminine, then kA -> kI
# If that word is masculine with viBakwi, or pl: kA -> ke
# If that word is masculine with 0 viBaki and sg: NO Change.

# If the parser has failed, traverse to the right, and get the viSeRya.
  $SeRa_sambanXa_found = 0;
  for($j=1;$j<=$#wrd_ana+1;$j++){
       $var_nm = "wrd_ana_flds_".$j;
       $sup_nm = "";

        if (${$var_nm}[$morph_kaaraka_anal] =~ /<rel_nm:sup_samucciwaH><relata_pos:([0-9\.]+)>/){
	   $sup_nm = $var_nm;
           $var_nm = "wrd_ana_flds_".$1;
        }

	#print STDERR "var_nm = ",$var_nm,"\n";
        if ((${$var_nm}[$ana_fld_for_calling_gen_after_lwg] =~ /^[^ ]+ (n|P|adj) [^ ]+ [^ ]+ [^ ]+ k[Ao]/) && (${$var_nm}[$morph_kaaraka_anal] =~ /<rel_nm:(RaRTIsambanXaH|karwA|karma|upa_saha|upa_vinA|prawiyogI|viSeRaNam|sanxarBa_binxuH|nirXAraNam)><relata_pos:([0-9\.]+)>/)){
          $new_var_nm = "wrd_ana_flds_".$2;
	  #print STDERR "new_var_nm = ",$new_var_nm,"\n";
       #if(${$new_var_nm}[$parse_ana_fld] =~ /(RaRTI_sambanXaH|kAraka_RaRTI|upapaxa_sambanXaH),([0-9]+)/){
#This is removed, because the RaRTI in Sanskrit is ambiguous.
# W1{6} W2{6}: Here W1 may be related to W2 either by the vyadhikaraNa relation (hence 6th case) or by samAnAXikaraNa relation (since W2 is in 6th case, Skt will also have 6th case).) So the assumtion that this is always viSeRaNa is wrong.
       # ${$var_nm}[$ana_fld_for_calling_gen_after_lwg] =~ s/^([^ ]+) ([^ ]+) ([^ ]+) ([^ ]+) ([^ ]+) ([^ ]+)/$1 $2 $3 $4 $5 1/;
      #}elsif(${$new_var_nm}[$ana_fld_for_calling_gen_after_lwg] =~ /^([^ ]+) (n|adj) ([^ ]+) ([^ ]+) ([^ ]+) ([^ ]+)/)

      if(${$new_var_nm}[$ana_fld_for_calling_gen_after_lwg] =~ /^([^ ]+) (n|adj|avy) ([^ ]+) ([^ ]+) ([^ ]+) ([^ ]+)/) {
               $n_word = $1;
               $gen = $3;
               $num = $4;
               $vibh = $6;
               if(($ke_parsarg_list{$n_word}) || ($n_word =~ /_meM|_se|_ko|_para|_kI|_ke|_ora/)) {
                  ${$var_nm}[$ana_fld_for_calling_gen_after_lwg] =~ s/^([^ ]+) ([^ ]+) ([^ ]+) ([^ ]+) ([^ ]+) ([^ ]+)/$1 $2 $3 $4 $5 ke/;
                  ${$var_nm}[$ana_fld_for_calling_gen_after_lwg_karwari] =~ s/^([^ ]+) ([^ ]+) ([^ ]+) ([^ ]+) ([^ ]+) ([^ ]+)/$1 $2 $3 $4 $5 ke/;
		    if($sup_nm ne "") {
                       ${$sup_nm}[$ana_fld_for_calling_gen_after_lwg] =~ s/^([^ ]+) ([^ ]+) ([^ ]+) ([^ ]+) ([^ ]+) ([^ ]+)/$1 $2 $3 $4 $5 ke/;
                       ${$sup_nm}[$ana_fld_for_calling_gen_after_lwg_karwari] =~ s/^([^ ]+) ([^ ]+) ([^ ]+) ([^ ]+) ([^ ]+) ([^ ]+)/$1 $2 $3 $4 $5 ke/;
	            }
               }elsif($kI_parsarg_list{$n_word}) {
                 ${$var_nm}[$ana_fld_for_calling_gen_after_lwg] =~ s/^([^ ]+) ([^ ]+) ([^ ]+) ([^ ]+) ([^ ]+) ([^ ]+)/$1 $2 $3 $4 $5 kI/;
                 ${$var_nm}[$ana_fld_for_calling_gen_after_lwg_karwari] =~ s/^([^ ]+) ([^ ]+) ([^ ]+) ([^ ]+) ([^ ]+) ([^ ]+)/$1 $2 $3 $4 $5 kI/;
		 if($sup_nm ne "") {
                    ${$sup_nm}[$ana_fld_for_calling_gen_after_lwg] =~ s/^([^ ]+) ([^ ]+) ([^ ]+) ([^ ]+) ([^ ]+) ([^ ]+)/$1 $2 $3 $4 $5 kI/;
                    ${$sup_nm}[$ana_fld_for_calling_gen_after_lwg_karwari] =~ s/^([^ ]+) ([^ ]+) ([^ ]+) ([^ ]+) ([^ ]+) ([^ ]+)/$1 $2 $3 $4 $5 kI/;
		 }
               }elsif($gen eq "f") {
                  ${$var_nm}[$ana_fld_for_calling_gen_after_lwg] =~ s/^([^ ]+) ([^ ]+) ([^ ]+) ([^ ]+) ([^ ]+) ([^ ]+)/$1 $2 $3 $4 $5 kI/;
                  ${$var_nm}[$ana_fld_for_calling_gen_after_lwg_karwari] =~ s/^([^ ]+) ([^ ]+) ([^ ]+) ([^ ]+) ([^ ]+) ([^ ]+)/$1 $2 $3 $4 $5 kI/;
		 if($sup_nm ne "") {
                  ${$sup_nm}[$ana_fld_for_calling_gen_after_lwg] =~ s/^([^ ]+) ([^ ]+) ([^ ]+) ([^ ]+) ([^ ]+) ([^ ]+)/$1 $2 $3 $4 $5 kI/;
                  ${$sup_nm}[$ana_fld_for_calling_gen_after_lwg_karwari] =~ s/^([^ ]+) ([^ ]+) ([^ ]+) ([^ ]+) ([^ ]+) ([^ ]+)/$1 $2 $3 $4 $5 kI/;
	         }
               }elsif(($gen eq "m") && (($vibh ne "0")|| ($num eq "p"))) {
                  ${$var_nm}[$ana_fld_for_calling_gen_after_lwg] =~ s/^([^ ]+) ([^ ]+) ([^ ]+) ([^ ]+) ([^ ]+) ([^ ]+)/$1 $2 $3 $4 $5 ke/;
                  ${$var_nm}[$ana_fld_for_calling_gen_after_lwg_karwari] =~ s/^([^ ]+) ([^ ]+) ([^ ]+) ([^ ]+) ([^ ]+) ([^ ]+)/$1 $2 $3 $4 $5 ke/;
		  if($sup_nm ne "") {
                    ${$sup_nm}[$ana_fld_for_calling_gen_after_lwg] =~ s/^([^ ]+) ([^ ]+) ([^ ]+) ([^ ]+) ([^ ]+) ([^ ]+)/$1 $2 $3 $4 $5 ke/;
                    ${$sup_nm}[$ana_fld_for_calling_gen_after_lwg_karwari] =~ s/^([^ ]+) ([^ ]+) ([^ ]+) ([^ ]+) ([^ ]+) ([^ ]+)/$1 $2 $3 $4 $5 ke/;
	          }
               }
           }
           $SeRa_sambanXa_found = 1;
        }
  }
  if(!$SeRa_sambanXa_found) {
     for($j=1;$j<=$#wrd_ana+1;$j++){
       $var_nm = "wrd_ana_flds_".$j;
       if(${$var_nm}[$ana_fld_for_calling_gen_after_lwg] =~ /^([^ ]+) n ([^ ]+) ([^ ]+) ([^ ]+) kA/){
           # Get the GNP of the next word.
            $k = $j+1;
            $viSeRya_var_nm = "wrd_ana_flds_".$k;
            if(${$viSeRya_var_nm}[$ana_fld_for_calling_gen_after_lwg] =~ /^([^ ]+) n ([^ ]+) ([^ ]+) ([^ ]+) ([^ ]+)/) {
              $gen = $3;
              $num = $4;
              $per = $5;
              $vib = $6;
              $continue = 1;
              for($k=$j+2;$k<=$#wrd_ana+1 && $continue;$k++){
                  $viSeRya_var_nm = "wrd_ana_flds_".$k;
                  ${$viSeRya_var_nm}[$ana_fld_for_calling_gen_after_lwg] =~ /^([^ ]+) n ([^ ]+) ([^ ]+) ([^ ]+) ([^ ]+)/;
                  ${$viSeRya_var_nm}[$ana_fld_for_calling_gen_after_lwg_karwari] =~ /^([^ ]+) n ([^ ]+) ([^ ]+) ([^ ]+) ([^ ]+)/;
                  $new_gen = $3;
                  $new_num = $4;
                  $new_per = $5;
                  $new_vib = $6;
                  if(($gen ne $new_gen) || ($num ne $new_num) || ($per ne $new_per) || ($vib ne $new_vib)) {
              	      $continue = 0;
                  }
              }
            } elsif(${$viSeRya_var_nm}[$ana_fld_for_calling_gen_after_lwg] =~ /^([^ ]+) avy/) {
              $gen = &get_hn_lifga($1,"a");
            }
              if($gen eq "f") {
                 ${$var_nm}[$ana_fld_for_calling_gen_after_lwg] =~ s/^([^ ]+) ([nP]) ([^ ]+) ([^ ]+) ([^ ]+) ([^ ]+)/$1 $2 $3 $4 $5 kI/;
                 ${$var_nm}[$ana_fld_for_calling_gen_after_lwg_karwari] =~ s/^([^ ]+) ([nP]) ([^ ]+) ([^ ]+) ([^ ]+) ([^ ]+)/$1 $2 $3 $4 $5 kI/;
              } elsif(($gen eq "m") && ($vib ne "0")) {
                ${$var_nm}[$ana_fld_for_calling_gen_after_lwg] =~ s/^([^ ]+) ([nP]) ([^ ]+) ([^ ]+) ([^ ]+) ([^ ]+)/$1 $2 $3 $4 $5 ke/;
                ${$var_nm}[$ana_fld_for_calling_gen_after_lwg_karwari] =~ s/^([^ ]+) ([nP]) ([^ ]+) ([^ ]+) ([^ ]+) ([^ ]+)/$1 $2 $3 $4 $5 ke/;
              }
         } 
     } 
  }
}
1;
