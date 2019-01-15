#!/usr/bin/env perl
#  Copyright (C) 2002-2019 Amba Kulkarni (ambapradeep@gmail.com)
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

  $tmp_file_path = $ARGV[0];
  $SCLINSTALLDIR = $ARGV[1];
  $GraphvizDot = $ARGV[2];
  $sentences = $ARGV[3];
  $encoding = $ARGV[4];
  $pid = $ARGV[5];
  $script = $ARGV[6];
  $sandhi = $ARGV[7];
  $morph = $ARGV[8];
  $parse = $ARGV[9];
  $text_type = $ARGV[10];
  $LTPROCBIN = $ARGV[11];

  require "$SCLINSTALLDIR/converters/convert.pl";

  system("mkdir -p $tmp_file_path");
  open(TMP1,">$tmp_file_path/in$pid");
  $sentences1=&convert($encoding,$sentences,$SCLINSTALLDIR);
  chomp($sentences1);
  @sentences=split(/\./,$sentences);
  foreach $sent (@sentences) {
     $sent =~ s/^\n/ /;
     $sent =~ s/^ [ \t]*//;
     if($morph eq "GH"){
       print TMP1 $sent,"\n";
     } else {
       print TMP1 "<s>",$sent,".</s>\n";
     }
  }
  close(TMP1);
     `date > $tmp_file_path/tmp_in$pid/err$pid`;
     $cmd = "$SCLINSTALLDIR/SHMT/prog/shell/anu_skt_hnd.sh $SCLINSTALLDIR $GraphvizDot in$pid $tmp_file_path hi $script $sandhi $morph $parse $text_type NOECHO $LTPROCBIN D 2>> $tmp_file_path/tmp_in$pid/err$pid;";
  system($cmd);
     `date >> $tmp_file_path/tmp_in$pid/err$pid`;
