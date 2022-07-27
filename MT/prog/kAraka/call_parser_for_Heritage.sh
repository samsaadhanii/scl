#!/bin/bash
#
##  Copyright (C) 2016-2017 Amba Kulkarni (ambapradeep@gmail.com)
##
##  This program is free software; you can redistribute it and/or
##  modify it under the terms of the GNU General Public License
##  as published by the Free Software Foundation; either
##  version 2 of the License, or (at your option) any later
##  version.
##
##  This program is distributed in the hope that it will be useful,
##  but WITHOUT ANY WARRANTY; without even the implied warranty of
##  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
##  GNU General Public License for more details.
##
##  You should have received a copy of the GNU General Public License
##  along with this program; if not, write to the Free Software
##  Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
#
# Experimental shell file to test Heritage interface
# Assume there is only one input sentence

source ../../../paths.sh
MT_PATH=$SCLINSTALLDIR/MT
ANU_MT_PATH=$MT_PATH/prog

if [ $# -lt 8 ] ; then
  echo "Usage: clips_rules.sh GH_INPUT TMP_FILES_PATH <file> REL_OUTPUT_FILE [DEV|IAST] [NO|Partial|Full] [prose|Sloka] [ECHO|NOECHO]"
else
   GH_INPUT=$1
   TMP_FILES_PATH=$2
   OUTSCRIPT=$5
   PARSE=$6
   TEXT_TYPE=$7
   ECHO=$8
fi

 mkdir $TMP_FILES_PATH/parser_files
 
 if [ $ECHO = "ECHO" ] ; then
      echo "creating arcs"
 fi
 
$ANU_MT_PATH/kAraka/morph_uniform.pl $TMP_FILES_PATH <  $TMP_FILES_PATH/$3
 
cd $TMP_FILES_PATH/parser_files
 
$ANU_MT_PATH/kAraka/Prepare_Graph/build_graph $TMP_FILES_PATH/parser_files/ prose < 1.clp  > graph.txt

 if [ $ECHO = "ECHO" ] ; then
      echo "calling constraint solver to solve the equations"
 fi
 
cut -d' ' -f1-5 graph.txt | sort -u | sort -n | $ANU_MT_PATH/kAraka/Prepare_Graph/constraint_solver |\
 $ANU_MT_PATH/kAraka/kaaraka_sharing_Sawq_kwa.pl $SCLINSTALLDIR $TMP_FILES_PATH/$3 $ANU_MT_PATH/kAraka/gdbm_n |\
 $ANU_MT_PATH/kAraka/kaaraka_sharing.pl $SCLINSTALLDIR $ANU_MT_PATH/kAraka/gdbm_n/kAraka_name.gdbm  $ANU_MT_PATH/kAraka/gdbm_n/kAraka_num.gdbm  > parseop1.txt
 #$ANU_MT_PATH/kAraka/handle_niwya_sambanXa.pl $SCLINSTALLDIR $ANU_MT_PATH/kAraka/gdbm_n/kAraka_name.gdbm  $ANU_MT_PATH/kAraka/gdbm_n/kAraka_num.gdbm > parseop1.txt
 
#$ANU_MT_PATH/kAraka/prepare_dot_files.sh $OUTSCRIPT 1 mk_kAraka_help.pl $TMP_FILES_PATH/$3 parseop1.txt ..
$MT_PATH/../converters/wx2utf8roman.out < $TMP_FILES_PATH/$3 > $TMP_FILES_PATH/$3.out
cp $TMP_FILES_PATH/$3.out morph1.out.out
