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


#BEGIN {require "$ARGV[0]/paths.pl";}

#use lib $GlblVar::LIB_PERL_PATH;

#use GDBM_File;
#tie(%MO,GDBM_File,$ARGV[1],GDBM_READER,0644) || die "Can't open mo_ana.dbm for reading";

open(TMP,$ARGV[1]) || die "Can't open mo_ana.txt for reading";
while(<TMP>) {
chomp;
$_ =~ /^([^\t]+)\t(.+)$/;
$key = $1;
$val = $2;
$MO{$key}=$val;
}
close(TMP);

while($in = <STDIN>){
 chomp($in);
#Earlier we used to add the local analysis only when no analysis is found.
# if($in =~ /^(.+)=$/) {
#But since many a times required analysis is missing the morph, we decided to add local analysis even if morph has produced some answer.
 if($in =~ /^(.+)=(.*)/) {
    $wrd = $1;
    $ana = $2;
    print $in;
    if($MO{$1}) { 
       if($ana) { print "\/";}
       print $MO{$1};
    }
 } else {
    print $in;
 } 
 print "\n";
}
