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


require "../paths.pl";

require "$GlblVar::SCLINSTALLDIR/sandhi/apavAxa_any.pl";
require "$GlblVar::SCLINSTALLDIR/sandhi/any_sandhi.pl";
require "$GlblVar::SCLINSTALLDIR/sandhi/sandhi.pl";




while($in = <STDIN>){
 chomp($in);
 ($first,$second) = split(/\+/,$in);
 $ans = "";
 $ans = &sandhi($first,$second);
 print "ans = $ans\n";
 $ans =~ s/^([^,]+),(.*)/$1/;
 $ans =~ s/^://;
 @ans = split(/:/,$ans); 
 foreach $ans (@ans) {
   print $in," = ",$ans,"\n";
 }
}
