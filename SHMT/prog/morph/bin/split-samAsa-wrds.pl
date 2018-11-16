#!/usr/bin/env perl

#This program copies all the puurvapadas and uttarapadas in one file and non-samaasa in another file.
#The words are of 4 types
# morph type  abcd, abcd-, -abcd-, -abcd
# uwwarapaxa   X     X	    X       Y
# samboXana    Y     X      X       Y
# Rest	       Y     Y      Y       Y

#So  abcd- and -abcd-  -> all_morf
#So  abcd              -> all_morf + samboXana
#So  -abcd             -> all_morf + samboXana + upaxa

open(ALL,">$ARGV[0]") || die "Can't open $ARGV[0] for writing";
open(ANY,">$ARGV[1]") || die "Can't open $ARGV[1] for writing";
open(SAMB,">$ARGV[2]") || die "Can't open $ARGV[2] for writing";
open(UPAXA,">$ARGV[3]") || die "Can't open $ARGV[3] for writing";

while($in = <STDIN>){

   print ALL $in;
   if ($in =~ /\-$/){ #Case of W- and -W-
     $in =~ s/^\-//; #remove the initial,  in case of -W-
     print ANY $in; print SAMB "\n"; print UPAXA "\n"; # Produce all analyses except samboXana and uwwarapaxa
   } elsif ($in !~ /\-/) { # Case of W
     print SAMB $in; print ANY $in; print UPAXA "\n"; # Produce all analyses except an uwwarapaxa
   } else { # Case of -W
     $in =~ s/^\-//;  #remove initial -
     print ANY $in; print SAMB $in; print UPAXA $in;# Produce all analyses
   }
}

close UPAXA;
close SAMB;
close ANY;
close ALL;
