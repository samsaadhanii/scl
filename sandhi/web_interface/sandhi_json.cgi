#!/usr/bin/env perl
#
#  Copyright (C) 2023-2022 Anil and Amba Kulkarni (ambapradeep@gmail.com)
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


use utf8;
require "../paths.pl";
require "$GlblVar::SCLINSTALLDIR/sandhi/apavAxa_any.pl";
require "$GlblVar::SCLINSTALLDIR/sandhi/any_sandhi.pl";
require "$GlblVar::SCLINSTALLDIR/sandhi/sandhi.pl";
require "$GlblVar::SCLINSTALLDIR/cgi_interface.pl";

package main;

my %param = &get_parameters();
     my $word1=$param{word1};
     my $word2=$param{word2};
     $word1 =~ s/\r//g;
     $word2 =~ s/\r//g;
     chomp($word1);
     chomp($word2);
     my $results = &call_sandhi($word1,$word2);
     print "Access-Control-Allow-Origin: *\n";
     print "Content-type:text/html;-expires:60*60*24;charset:UTF-8\n\n";
     print "[".$results."]";



sub call_sandhi {
  my ($w1, $w2) = @_;
 my(@word1chars, @word2chars, @forms, @pra_steps, @sutras);
 my($results,$ans,$size, $lletter, $fletter, $fspelling, $x);
 #extracting last and first letter from both the words
 $w1 =~ /(.$)/;
 $lletter = $1;
 $w2 =~ /(^.)/;
 $fletter = $1;

#seperating all letters from word 1
    @word1chars = split(//, $w1);
    foreach $fspelling(@word1chars){$w1spell .= $fspelling." ";}
    @word2chars = split(//, $w2);
    foreach $fspelling(@word2chars){$w2spell .= $fspelling." ";}


    $word1 = chomp($w1);
    $ans = &sandhi($w1,$w2);

    ($sandhied_wrds,$prakriyA,$sutram,$others) = split(",",$ans);
    @forms = split(":",$sandhied_wrds);
    @pra_steps = split(":",$prakriyA);
    @sutras = split(":",$sutram);

    $size = $#forms;


    for($x = 0; $x<= $size; $x++){
     if($forms[$x] ne ""){
       $results .= "{";
       $results .= '"word1":"'.$w1.'",';
       $results .= '"word2":"'.$w2.'",';
       $results .= '"spelling_word1":"'.$w1spell.'",';
       $results .= '"spelling_word2":"'.$w2spell.'",';
       $results .= '"last_letter":"'.$lletter.'",';
       $results .= '"first_letter":"'.$fletter.'",';
       $results .= '"saMhiwapaxam":"'.$forms[$x].'",';
       $results .= '"sanXiH":"'.$pra_steps[$x].'",';
       $results .= '"sUwram":"'.$sutras[$x].'"},';
     }
    }

    $results =~ s/,$//;
    $results =~ s/%//;
 $results;
}
1;
