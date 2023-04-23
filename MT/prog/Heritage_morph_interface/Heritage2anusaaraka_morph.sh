#!/bin/sh
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

SCLINSTALLDIR=$1
temp_path=$2
pid=$3
MY_PATH=$SCLINSTALLDIR/MT/prog/Heritage_morph_interface

$MY_PATH/Heritage_anusaaraka_morph.out  |\
$MY_PATH/join_consecutive_analysis.pl   |\
$MY_PATH/change_pratipadik_cat.pl $MY_PATH/mapping_Heritage_saMsAdhanii_WX.txt $MY_PATH/../morph/rUDa_kqw.txt $MY_PATH/fem_pratipadik_Heritage_anusaaraka_map.txt $MY_PATH/pratipadika_heritage_anusaaraka_map.txt  > $temp_path/tmp_in$pid/in$pid.out
#$MY_PATH/postprocess.pl | $MY_PATH/add_end_s_tag.pl > $temp_path/tmp_in$pid/in$pid.out
cut -f1-6 $temp_path/tmp_in$pid/in$pid.out > $temp_path/tmp_in$pid/in${pid}_tmp1_6
cut -f2,7 $temp_path/tmp_in$pid/in$pid.out | tr '\t' '=' > $temp_path/tmp_in$pid/in${pid}_tmp
$SCLINSTALLDIR/MT/prog/prune/prune.sh $SCLINSTALLDIR < $temp_path/tmp_in$pid/in${pid}_tmp | sed '1,$s/.*=//' > $temp_path/tmp_in$pid/in${pid}_tmp7
paste $temp_path/tmp_in$pid/in${pid}_tmp1_6 $temp_path/tmp_in$pid/in${pid}_tmp7 > $temp_path/tmp_in$pid/in${pid}.out
cut -f2 $temp_path/tmp_in$pid/in${pid}.out | tr '\n' ' ' > $temp_path/tmp_in$pid/wor.$pid
cut -f2 $temp_path/tmp_in$pid/in${pid}.out | tr '\n' ' ' > $temp_path/tmp_in$pid/sandhied_in$pid
#echo -n '"<s>"' > $temp_path/in$pid 
cat $temp_path/tmp_in$pid/wor.$pid >> $temp_path/in$pid
echo ' .' >> $temp_path/in$pid
