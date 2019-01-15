#!/usr/bin/env perl

#  Copyright (C) 2009-2019 Amba Kulkarni (ambapradeep@gmail.com)
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
     if(${$var_nm}[$morph_kaaraka_anal] =~ /<rel_nm:aBihiwa_(karwA|karma)><relata_pos:([0-9]+)>/){
        $abhihita_pos = $2;
        $new_var_nm = "wrd_ana_flds_".$abhihita_pos;
        if (${$new_var_nm}[$ana_fld_for_calling_gen_after_lwg] =~ /^[^ ]+ [^ ]+ ([^ ]+) ([^ ]+)/){
           $abhihita_lifgam = $1;
           $abhihita_vacanam = $2;
        }
	if($abhihita_vacanam eq "NW"){
          if(${$new_var_nm}[$wrd_fld] eq "ca") {
             $abhihita_vacanam = "p";
          }
        }
	if($abhihita_lifgam eq "NW"){
          for($k=1;$k<=$#wrd_ana+1;$k++){
           $new_var_nm = "wrd_ana_flds_".$k;
           if(${$new_var_nm}[$morph_kaaraka_anal] =~ /<rel_nm:samucciwam><relata_pos:$abhihita_pos>/){
              ${$new_var_nm}[$ana_fld_for_calling_gen_after_lwg] =~ /^[^ ]+ [^ ]+ ([^ ]+) [^ ]+/;
              $tmp_lifgam = $1;
              if($abhihita_lifgam eq "NW") { $abhihita_lifgam = $tmp_lifgam;}
              elsif($tmp_lifgam eq "m") { $abhihita_lifgam = $tmp_lifgam;}
           }
          }
        }
        ${$var_nm}[$ana_fld_for_calling_gen_after_lwg] =~ s/^([^ ]+) ([^ ]+) ([^ ]+) ([^ ]+)/$1 $2 $abhihita_lifgam $abhihita_vacanam/;
     }
  }
}
1;
