#!/usr/bin/env perl

#  Copyright (C) 2009-2019 Amba Kulkarni (ambapradeep@gmail.com)
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

$SCLINSTALLDIR = $ARGV[0];

require "$SCLINSTALLDIR/paths.pl";
require "$SCLINSTALLDIR/converters/convert.pl";

$encoding = $ARGV[1];
$word = $ARGV[2];
$sandhi_type = $ARGV[3];
$pid = $ARGV[4];

      $word_wx=&convert($encoding,$word,$SCLINSTALLDIR);
      chomp($word_wx);


 $dirpath = "$GlblVar::TFPATH/seg_$pid";
 system("mkdir $dirpath");

 open(TMP,">$dirpath/wordwx");
   print TMP $word_wx;
 close(TMP);

system("cd $GlblVar::TFPATH/seg_$pid/; $SCLINSTALLDIR/SHMT/prog/sandhi_splitter/web_interface/run.sh $sandhi_type $GlblVar::TFPATH/seg_$pid/ wordwx $SCLINSTALLDIR $GlblVar::LTPROCBIN");
