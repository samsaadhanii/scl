#!/usr/bin/env perl

#  Copyright (C) 2002-2023 Amba Kulkarni (ambapradeep@gmail.com)
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


#BEGIN{require "$ARGV[0]/paths.pl";}

#use lib $GlblVar::LIB_PERL_PATH;

#use GDBM_File;
##tie(%RD_KQW,GDBM_File,"$ARGV[0]",GDBM_READER,0644) || die "Can't open $ARGV[0] for reading"; 
#tie(%KQW_MO,GDBM_File,"$ARGV[1]",GDBM_READER,0644) || die "Can't open $ARGV[1] for reading"; 

open(TMP,"$ARGV[1]") || die "Can't open $ARGV[1] for reading"; 
while(<TMP>) {
chomp;
$_ =~ /^([^\t]+)\t(.+)$/;
$key = $1;
$val = $2;
$KQW_MO{$key}=$val;
}
close(TMP);

while($in = <STDIN>){
chomp($in);
  if($in) {
    @ana = split(/\//,$in);
    $ans = "";
    foreach $ana (@ana) {
       $ana =~ s/<kqw_XAwu:([^>]+)>/$1/;
       $ana =~ s/>([a-zA-Z]+)</><kqw_pratipadika:$1></;
       $ana =~ /^([^<]*\-)*([^<\-]+)</;
       $ppada = $1;$rt = $2;
     #  if((!$RD_KQW{$rt}) && ($ana !~ /<vargaH:nA_/)){
       if($ana !~ /<vargaH:nA_/){
           $tmp = $ana;
           $ana =~ /<lifgam:([^>]+)>/;
           $ana_lifgam = $1;
           if($KQW_MO{$rt}) {
             if($KQW_MO{$rt}) {
                @kqw_ana = split(/\//,$KQW_MO{$rt});
             } 
             foreach $kqw_ana (@kqw_ana) {
               $kqw_ana =~ /<lifgam:([^>]+)>/;
               $kqw_lifgam = $1;
               if($kqw_lifgam eq $ana_lifgam) {
                  $tmp =~ s/^$ppada$rt/$ppada${kqw_ana}<kqw_pratipadika:${rt}>/;
                  $tmp =~ s/<lifgam:[^>]+>//;
                  $tmp =~ s/<level:[01]>//;
                  $ans .= "/".$tmp;
                  $tmp = $ana;
               }
             } if($ans eq "") { $ans = $ana;}
           } else {$ans .= "/".$ana;}
       } else {
#If it is a rUDa kqxanwa, and has kqw analysis, remove the kqw analysis
       $ana =~ s/^[^<]+.*<kqw_pratipadika:([^>]+)>/$1/;
       $ans .= "/".$ana;
       }
     }
     $ans =~ s/^\///;
     #print $wrd,"=",$ans,"\n";    
     print $ans,"\n";    
  } else { print "\n";}
}
untie(%KQW_MO);

sub frequent_kqw_suffix {
my($in) = @_;
if($in =~ /kqw_prawyayaH:(Sawq_lat|SAnac_lat|wqc|Nvul|kwa|kwavawu|lyut|GaF|yak|Namul|wavya|wavyaw|anIyar|yaw|kyap|Nyaw|Kal|yuc|A)/) {
   return 1;
} else {return 0;}
}
1;
