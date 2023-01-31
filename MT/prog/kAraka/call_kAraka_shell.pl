#!/usr/bin/env perl

#  Copyright (C) 2010-2023 Amba Kulkarni (ambapradeep@gmail.com)
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

  $tmp_files_path = $ARGV[0];
  $sentences = $ARGV[1];
  $encoding = $ARGV[2];
  $pid = $ARGV[3];
  $script = $ARGV[4];
  $sandhi = $ARGV[5];
  $morph = $ARGV[6];
  $parse = $ARGV[7];
  $text_type = $ARGV[8];
  $echo = $ARGV[9];
  $debug = $ARGV[10];

  system("mkdir -p $tmp_files_path");
  open(TMP1,">$tmp_files_path/in$pid");
  $sentences=&convert($encoding,$sentences,$SCLINSTALLDIR);
  chomp($sentences);
  $sentences =~ s/#$//;
  $sentences =~ s/#/\n/g;
  @sentences=split(/\./,$sentences);
  foreach $sent (@sentences) {
     $sent =~ s/^\n//g;
     if($morph eq "GH") {
       print TMP1 $sent,"\n";
     } else {
       print TMP1 "<s>",$sent,".</s>\n";
     }
  }
  close(TMP1);

# The interface for calling only parser for kaaraka vishleshana is now not being used. Hence this programme is defunct.
#  if($morph eq "GH") {
#      system ("mkdir -p $tmp_files_path/tmp_in$pid; $GlblVar::HERITAGE_PATH/ML/reader_plugin  < $tmp_files_path/in$pid > $tmp_files_path/tmp_in$pid/in$pid.gh");
#  }
     $cmd = "cd $tmp_files_path; $SCLINSTALLDIR/MT/prog/kAraka/parser.sh in$pid $tmp_files_path hi $script $sandhi $morph $parse $text_type $echo $debug 2> $tmp_files_path/tmp_in$pid/err$pid;";
     system($cmd);
