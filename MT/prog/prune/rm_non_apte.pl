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

open(TMP,$ARGV[1]) || die "Can't open $ARGV[1] for reading";
while(<TMP>) {
  chomp;
  $_ =~ /^(.*)$/;
  $key = $1;
  $APTE{$key}=1;
  $key =~ s/_.*//;
  $APTENOGEN{$key} = 1;
}
close(TMP);

open(TMP,$ARGV[2]) || die "Can't open $ARGV[2] for reading";
while(<TMP>) {
  chomp;
  $rUDa{$_}=1;
}
close(TMP);

while($in = <STDIN>){
    chomp($in);
    if($in){
      ($word,$ana) = split(/=/, $in);
      if($ana =~ /^(.*)\-/) {  $pUrvapaxa = $1."-"; $ana =~ s/^.*\-//;}
      else {$pUrvapaxa = "";}
      @analysis = split(/\//, $ana);

      print $word,"=",$pUrvapaxa;
      $ans = "";
      foreach ($i=0; $i<=$#analysis;$i++){

       if($analysis[$i] =~ /^\-?([a-zA-Z]+)<[^\-]+/){
          $head_wrd = $1;
       }
       $analysis[$i] =~ /<lifgam:([^>]+)>/;
       $lifga = $1;

	if($analysis[$i] =~ /lakAraH/) { 
           if($analysis[$i] !~ /level/) {$analysis[$i] .= "<level:1>";}
        }
       #print "ana = $analysis[$i]\n";
       #if($analysis[$i] =~ /<level:[1234]>/)
       if($analysis[$i] =~ /<level:1>/) {
#At present we remove only those analysis at level 1, for which there is no entry in the Apte's dictionary.
#Thus all the entries at the 2,3 and 4th level will be retained. 
#However, in the later stages, if an analysis with level 1 exists, others will not be shown. If analysis at level 1 does not exist, then analysis at level 2 will be shown, and so on.
	       #print "ana = $analysis[$i]\n";
          if((($analysis[$i] =~ /<vargaH:nA/) || ($analysis[$i] =~ /<vargaH:sarva/) || ($analysis[$i] =~ /<vargaH:sa\-u\-pa/)) && ($analysis[$i] !~ /kqw_prawyayaH/)){ 
		  #condition of kqw prawyayaH is added, since some of the analysis of kqxanwas are still needed even if the kqxanwa is not found in the Apte's dictionary. For example saFjAwAH
              $key = $head_wrd."_".$lifga;
              if($APTE{$key}) { 
                 $ans .= "/".$analysis[$i];
		 #print "key found\n";
              }
	      # else { print "\n$analysis[$i] IGNORING\n";}
          } else { $ans .= "/".$analysis[$i];}
      } elsif($analysis[$i] =~ /<level:[23]>/) {
          if(($analysis[$i] =~ /<vargaH:nA/) || ($analysis[$i] =~ /<vargaH:sarva/) || ($analysis[$i] =~ /<vargaH:sa\-u\-pa/)){ 
              #if ($analysis[$i] =~ /<rt:([^>]+)>/) { $head_wrd = $1;}
              $key = $head_wrd."_".$lifga;
              if(!$rUDa{$head_wrd}) { $ans .= "/".$analysis[$i];}
              elsif($APTE{$key} && $rUDa{$head_wrd}) { $ans .= "/".$analysis[$i]; }
          } else { $ans .= "/".$analysis[$i];}
    # else { $ans .= "/".$analysis[$i];} # For handline 0 level analysis
#Adding this condition had resulted into an error for the 1st shloka of Gita.
#Why was this condition added at all? -- amba 20th may 2013
    } elsif ($analysis[$i] =~ /<level:4>/) { $ans .= "/".$analysis[$i];}
   }

#print "\nANS = $ans\n";
    if($ans eq "") {
     foreach ($i=0; $i<=$#analysis;$i++){

       $analysis[$i] =~ /^([a-zA-Z]+)</;
       $head_wrd = $1;

       #if($analysis[$i] =~ /<level:[14]>/)  do not remove compound uwwarapaxas (4), even if the pratipadika with same gender not found in Apte. This may be the case of Bahuvrihi
       if($analysis[$i] =~ /<level:1>/) { 
          if(($analysis[$i] =~ /<vargaH:nA/) || ($analysis[$i] =~ /<vargaH:sa\-u\-pa/)){ 
              if($APTENOGEN{$head_wrd}) { 
                 $ans .= "/".$analysis[$i];
              }
          } else { $ans .= "/".$analysis[$i];}
        } elsif($analysis[$i] =~ /<level:4>/) { 
           $ans .= "/".$analysis[$i];
       }
     }
   }
    if(!$ans) {  print join ("/",@analysis);} else { $ans =~ s/^\///; print $ans;}
 }
    print "\n";
}


## History
#Date 24/3/09
#This program is added to prune the output of morphological analyser.
#The morphological analyser has a dictionary with head words extracted from the Monier William's dictionary. Though it has a good coverage, many a times it shows outputs that are very rare.
#In order to get a better coverage, we decided to go for a more practical dictionary: Apte's.
#Initially we restricted the answers even to match the gender so that unnecessary answers are out.
#But later we realised that the viSeRaNas can be in any of the 3 genders, and hence especially for viSeRaNas it is not a good practice to restrict to a particular gender.
#So we have reverted back to all the possible analysis, with roots restricted to Apte's dictionary.
#This restrictions we apply only to the samaasa and subantas, and not to waxXiwas and kqxanwas.

# In case none of the root-gen pairs matches the o/p, all the o/p is reproduced without prunig.
# To get a better o/p we decided to keep only those entries, which are found in the apte's dict but not necessarily with the same lifga.
