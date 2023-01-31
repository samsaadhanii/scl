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




=head1 kriyAmUla_na_verb.pl

=head1 DESCRIPTION

This module moves the negation 'nahIM' after the kriyAmAula

=head1 EXAMPLES

This function is invoked internally by the Hindi agreement module.

=head1 AUTHORS

Amba Kulkarni

ambapradeep@gmail.com

License: GPL

=cut
sub handle_kriyAmUla_na_verb{
# If the verb is of kriyAmUla type, and it has a negative element nahIM, then the nahIM should move after the kriyAmAuala
#usakI pyAsa nahIM SAnwa_huI
# --> usakI pyAsa SAnwa_nahIM_huI

    for($j=1;$j<=$#wrd_ana+1;$j++){
       $var_nm = "wrd_ana_flds_".$j;
       $prev_var_nm = "wrd_ana_flds_".($j-1);
       if((${$prev_var_nm}[$ana_fld_for_calling_gen_after_lwg] =~ /^nahIM /) && ${$var_nm}[$ana_fld_for_calling_gen_after_lwg] =~ /^([^_]+_(kara|ho|xe|laga)) /){
          ${$prev_var_nm}[$ana_fld_for_calling_gen_after_lwg] =  "--";
          ${$prev_var_nm}[$ana_fld_for_calling_gen_after_lwg_karwari] =  "--";
          ${$var_nm}[$ana_fld_for_calling_gen_after_lwg] =~ s/ ([^ ]+)$/ nahIM+$1/;
          ${$var_nm}[$ana_fld_for_calling_gen_after_lwg_karwari] =~ s/ ([^ ]+)$/ nahIM+$1/;
       }
     }
}
1;
