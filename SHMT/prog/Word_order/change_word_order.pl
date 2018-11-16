#!/usr/bin/env perl

#  Copyright (C) 2017-2018 Amba Kulkarni (ambapradeep@gmail.com)
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

use strict;
use warnings;

$SCLINSTALLDIR=$ARGV[0];
require "$SCLINSTALLDIR/paths.pl";
require "$GlblVar::SCLINSTALLDIR/converters/convert.pl";

my ($sent, $sent_wx, $word, @words, $in, @in,$i,%ANA, @cws, $cw, $found,$worder);

$sent_wx = $ARGV[1];
$sent_wx =~ s/_/ /g;

@words = split(/ /,$sent_wx);

while($in = <STDIN>){
  if ($in =~ /<form wx=/) {
     $in =~ s/<\/solution>//;
     chomp($in);
     @in = split(/<form/, $in);
     
   #This algo works only if the words are not repeated in a sentence
   foreach $word (@words) {
     if ($word =~ /\-/) {
         $ANA{$word} = "";
         @cws = split(/\-/,$word);
         for ($i = 0; $i < $#cws; $i++) {
           $found = 0;
           foreach $in (@in) {
             if ( !$found && ($in =~ / wx="$cws[$i]"/) && ($in =~ /"iic"/)) {
                 $ANA{$word} .= "<form".$in;
                 $found = 1;
             }
           }
         }
         $found = 0;
         foreach $in (@in) {
           if (!$found && ($in =~ / wx="$cws[$#cws]"/) && ($in !~ /"iic"/)) {
                $ANA{$word} .= "<form".$in;
                $found = 1;
           }
         }
      } else {
        foreach $in (@in) {
          if ($in =~ / wx="$word"/) {
              $ANA{$word} = "<form".$in;
          }
        }
     }
   }


   for ($i=0; $i <= $#words; $i++){
    print $ANA{$words[$i]};
   }
   print "<\/solution>\n";
 } else {
   print "<solution num=\"1\">\n";
 }
}
