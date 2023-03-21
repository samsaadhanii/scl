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


=head1  agreement.pl

This is the main agreement module for Hindi that takes care of the following:
a0) Handling karmaNi and BAve prayogas in Sanskrit
a) Add ergative 'ne' in Hindi
b) Handle aBihiwa agreement
c) Handle idiosyncratic 'ko' in Hindi as a karma vibhakti.
d) Handling 'pada' formation in Hindi (viSeRaNa-viSeRya: arXa-samAsa)
e) Handling viBakwis in kriyAmUla, and its agreement
f) Handling agreement in the predicative adjective

=head1 DESCRIPTION

This is a module that is invoked just before the Hindi word generation.
This module has various sub modules which take care of agreement issues in Hindi, as well as certain special cases of irregularities in Hindi.

This module uses various databases. DESCRIPTION TOADD

=head1 EXAMPLES

This takes the parsed Sanskrit output as an input.

=head1 AUTHORS

Amba Kulkarni

ambapradeep@gmail.com

License: GPL

=cut

my $Data_Path=$ARGV[0];
my $prog_Path=$ARGV[1];

if($ARGV[2] eq "D") { $DEBUG = 1;} else {$DEBUG = 0;}

$DEBUG = 0;

require "$prog_Path/add_ne.pl";
require "$prog_Path/handle_noun_verb_agr.pl";
require "$prog_Path/hindi_idio_karma_ko.pl";
require "$prog_Path/hindi_second_person_honorificity.pl";
require "$prog_Path/intra_chunk.pl";
require "$prog_Path/intra_chunk_RaRTI_agr.pl";
require "$prog_Path/kriyAmUla_karma_vibh.pl";
require "$prog_Path/kriyAmUla_verb_agr.pl";
require "$prog_Path/kriyAmUla_na_verb.pl";
require "$prog_Path/misc_func.pl";
require "$prog_Path/predicative_adj_agr.pl";
require "$prog_Path/karmaNi_BAve_to_karwari.pl";

open(TMP,"$Data_Path/hi/fem_hnd_noun.lst") || die "Can't open fem_hnd_noun.txt for reading";
while(<TMP>) {
chomp;
$key = $_;
$FEM{$key}=1;
}
close(TMP);
open(TMP,"$Data_Path/hi/human.txt") || die "Can't open human.txt for reading";
while(<TMP>) {
chomp;
$key = $_;
$HMN{$key}=1;
}
close(TMP);
open(TMP,"$Data_Path/hi/animate.txt") || die "Can't open animate.txt for reading";
while(<TMP>) {
chomp;
$key = $_;
$ANMT{$key}=1;
}
close(TMP);
open(TMP,"$Data_Path/hi/inanimate.txt") || die "Can't open inanimate.txt for reading";
while(<TMP>) {
chomp;
$key = $_;
$INANMT{$key}=1;
}
close(TMP);
open(TMP,"$Data_Path/hi/ne_excptnl_verbs.txt") || die "Can't open ne_excptnl_verbs.txt for reading";
while(<TMP>) {
chomp;
$key = $_;
$EXCPT_NE{$key}=1;
}
close(TMP);
open(TMP,"$Data_Path/hi/kriyAmUla_marker.txt") || die "Can't open kriyAmUla_marker.txt for reading";
while(<TMP>) {
chomp;
$_ =~ /^([^,]+),([^,]+)/;
$key = $1;
$val = $2;
$kriyAmUla_marker{$key}=$val;
}
close(TMP);

#All the variables used are Global variables, except $i

$wrd_fld = 1; #starting from 0;
#$parse_ana_fld = 7; #starting from 0;
$morph_kaaraka_anal = 12; #starting from 0;
$ana_fld_for_calling_gen_after_lwg = 14; #starting from 0;
$ana_fld_for_calling_gen_after_lwg_karwari = 15; #starting from 0;
$flds = 15; # Starting from 0;

#Read whole sentence
$/ = "\n\n";

while($in = <STDIN>){

#Get analysis of each wrd
@wrd_ana = split(/\n/,$in);

# Split analysis per line into fields separated by \t, 
# and store in wrd_ana_flds_$i, where $i is the word index, 
# which starts from 1, and not 0.
#for ($i=1; $i <= $#wrd_ana+1; $i++){
#    $var_nm = "wrd_ana_flds_".$i;
#    @{$var_nm} = split(/\t/,$wrd_ana[$i-1]); 
#}

#After adding the cid, now the index is composite of id and cid.

    $indx = 1;
foreach $w_ana (@wrd_ana){
    $w_ana =~ /<id:([0-9]+)><cid:([0-9]+)>/;
    $i = $1.".".$2;
    $var_nm = "wrd_ana_flds_".$i;
    $var_ndx = "wrd_ana_flds_".$indx;
    @{$var_nm} = split(/\t/,$w_ana); 
    @{$var_ndx} = split(/\t/,$w_ana); 
    $index{$i} = $indx;
    $indx++; 
}

  &karmaNi_BAve();
  if($DEBUG) {&print_array("STDERR","karmaNi_BAve",$wrd_fld,$morph_kaaraka_anal,$ana_fld_for_calling_gen_after_lwg,$ana_fld_for_calling_gen_after_lwg_karwari);}

  &add_ne();
  if($DEBUG) {&print_array("STDERR","Add ne",$wrd_fld,$morph_kaaraka_anal,$ana_fld_for_calling_gen_after_lwg,$ana_fld_for_calling_gen_after_lwg_karwari);}

  &kriyAmUla_karma_viBakwi();
  if($DEBUG) {&print_array("STDERR","kriyAmUla_karma_vibh",$wrd_fld,$morph_kaaraka_anal,$ana_fld_for_calling_gen_after_lwg,$ana_fld_for_calling_gen_after_lwg_karwari);}

  &handle_hindi_idio_karma_ko();
  if($DEBUG) {&print_array("STDERR","handle_hindi_idio_karma_ko",$wrd_fld,$morph_kaaraka_anal,$ana_fld_for_calling_gen_after_lwg,$ana_fld_for_calling_gen_after_lwg_karwari);}

  &copy_abhihita_gen_num_to_verb();
  if($DEBUG) {&print_array("STDERR","noun_verb_agr",$wrd_fld,$morph_kaaraka_anal,$ana_fld_for_calling_gen_after_lwg,$ana_fld_for_calling_gen_after_lwg_karwari);}

  &handle_kriyAmUla_verb_agr();
  if($DEBUG) {&print_array("STDERR","kriyAmUla_verb_agr",$wrd_fld,$morph_kaaraka_anal,$ana_fld_for_calling_gen_after_lwg,$ana_fld_for_calling_gen_after_lwg_karwari);}

  &handle_kriyAmUla_na_verb();
  if($DEBUG) {&print_array("STDERR","kriyAmUla_na_verb",$wrd_fld,$morph_kaaraka_anal,$ana_fld_for_calling_gen_after_lwg,$ana_fld_for_calling_gen_after_lwg_karwari);}

  &karwA_and_karwA_samAnAXikaraNa_agr();
  if($DEBUG) {&print_array("STDERR","pred_adj_agr",$wrd_fld,$morph_kaaraka_anal,$ana_fld_for_calling_gen_after_lwg,$ana_fld_for_calling_gen_after_lwg_karwari);}

  &chunk_viSeRaNa();
  if($DEBUG) {&print_array("STDERR","viSeRaNa_agr",$wrd_fld,$morph_kaaraka_anal,$ana_fld_for_calling_gen_after_lwg,$ana_fld_for_calling_gen_after_lwg_karwari);}

  &handle_RaRTI_lifgam();
  if($DEBUG) {&print_array("STDERR","RaRTI_agr",$wrd_fld,$morph_kaaraka_anal,$ana_fld_for_calling_gen_after_lwg,$ana_fld_for_calling_gen_after_lwg_karwari);}

  &handle_second_person_honorificity();
  if($DEBUG) {&print_array("STDERR","Honorificity",$wrd_fld,$morph_kaaraka_anal,$ana_fld_for_calling_gen_after_lwg,$ana_fld_for_calling_gen_after_lwg_karwari);}

  &print_array("STDOUT");

  print "\n";
}
untie(%FMN);
untie(%HMN);
untie(%ANMT);
untie(%INANMT);
untie(%EXCPT_NE);
untie(%kriyAmUla_marker);
