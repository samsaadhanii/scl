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


## Usage:
## http://sanskrit.uohyd.ac.in/cgi-bin/scl/sandhi/sandhi_json.cgi?word1=rAmaH&word2=AlayaH&encoding=WX&outencoding=Unicode

use utf8;
require "../paths.pl";
require "$GlblVar::SCLINSTALLDIR/sandhi/apavAxa_any.pl";
require "$GlblVar::SCLINSTALLDIR/sandhi/any_sandhi.pl";
require "$GlblVar::SCLINSTALLDIR/sandhi/sandhi.pl";
require "$GlblVar::SCLINSTALLDIR/cgi_interface.pl";
require "$GlblVar::SCLINSTALLDIR/converters/convert.pl";

package main;
my $ans;
my $cmd;
my $results;

my %param = &get_parameters();
     my $word1=$param{word1};
     my $word2=$param{word2};
     my $encoding=$param{encoding};
     my $outencoding=$param{outencoding};

     $word1 =~ s/\r//g;
     $word2 =~ s/\r//g;
     chomp($word1);
     chomp($word2);

     $word1_wx=&convert($encoding,$word1,$GlblVar::SCLINSTALLDIR);
     chomp($word1_wx);

     $word2_wx=&convert($encoding,$word2,$GlblVar::SCLINSTALLDIR);
     chomp($word2_wx);

     $results = &call_sandhi($word1_wx,$word2_wx);

     if($outencoding eq "IAST") {
         $cmd = "echo \'$results\' | $GlblVar::SCLINSTALLDIR/converters/wx2utf8roman.out";
      } else {
         $cmd = "echo \'$results\' | $GlblVar::SCLINSTALLDIR/converters/ri_skt | $GlblVar::SCLINSTALLDIR/converters/iscii2utf8.py 1";
      }

     $ans = `$cmd`;

     print "Access-Control-Allow-Origin: *\n";
     print "Content-type:text/html;-expires:60*60*24;charset:UTF-8\n\n";
     print "[".$ans."]";



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
       $results .= '"@'.'word1":"'.$w1.'",';
       $results .= '"@'.'word2":"'.$w2.'",';
       $results .= '"@'.'spelling_@'.'word1":"'.$w1spell.'",';
       $results .= '"@'.'spelling_@'.'word2":"'.$w2spell.'",';
       $results .= '"@'.'last_@'.'letter":"'.$lletter.'",';
       $results .= '"@'.'first_@'.'letter":"'.$fletter.'",';
       $results .= '"@'.'saMhiwapaxam":"'.$forms[$x].'",';
       $results .= '"@'.'sanXiH":"'.$pra_steps[$x].'",';
       $results .= '"@'.'sUwram":"'.$sutras[$x].'"},';
     }
    }

    $results =~ s/,$//;
    $results =~ s/%//;
 $results;
}
1;
