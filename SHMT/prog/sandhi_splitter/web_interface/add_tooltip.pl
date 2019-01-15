#!/usr/bin/env perl

#  Copyright (C) 2008-2019 Amba Kulkarni (ambapradeep@gmail.com)
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


open(TMP,"<$ARGV[0]") || die "Can't open $ARGV[0] for reading";

while($in = <TMP>){
 chomp($in);
 $in =~ s/<level:[0-4]>//g;
 $in =~ s/^\^//;
 $in =~ s/\$$//;
 ($wrd,$ana) = split(/\//,$in,2);
 $MO{$wrd} = $ana;
}
close(TMP);

my($i);
while($in = <STDIN>){
 chomp($in);
 if($in =~ /./) {
   if($in =~ /^([^=]+= )(.*)/){
      $w1 = $1;
      $w2 = $2;
      print $w1;
   } else { $w2 = $in;}
    @wrds = split(/\+/,$w2);
    for($i = 0; $i <= $#wrds; $i++){
      print "<\@a \@title = \"",$MO{$wrds[$i]},"\">",$wrds[$i],"</\@a>";
      if(($wrds[$i] !~ /\-$/) && ($i < $#wrds)) { print "+";}
    }
    print "/";
 }
}
