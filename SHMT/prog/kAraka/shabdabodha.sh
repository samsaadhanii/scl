#!/bin/sh
#
##  Copyright (C) 2002-2019 Amba Kulkarni (ambapradeep@gmail.com)
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

SCLINSTALLDIR=$1
GraphvizDot=$2
SHMT_PATH=$SCLINSTALLDIR/SHMT
ANU_MT_PATH=$SHMT_PATH/prog

if [ $# -lt 10 ] ; then
  echo "Usage: shabdabodha.sh SCLINSTALLDIR GraphvizDot GH_INPUT TMP_FILES_PATH <file> REL_OUTPUT_FILE [DEV|IAST] [NO|Partial|Full] [prose|Sloka] [ECHO|NOECHO]"
  exit
else
   GH_INPUT=$3
   TMP_FILES_PATH=$4
   OUTSCRIPT=$7
   PARSE=$8
   TEXT_TYPE=$9
   ECHO=$10
fi

mkdir -p $TMP_FILES_PATH/parser_files

if [ $PARSE != "NO" ] ; then
 
 if [ $ECHO = "ECHO" ] ; then
      echo "creating arcs"
 fi
 
$ANU_MT_PATH/kAraka/uniform_morph_anal.pl $SCLINSTALLDIR $TMP_FILES_PATH <  $TMP_FILES_PATH/$5
 
$ANU_MT_PATH/kAraka/split_multisentence_input.pl $TMP_FILES_PATH/parser_files/morph < $TMP_FILES_PATH/$5
 
for i in `ls -1 $TMP_FILES_PATH/parser_files/*.clp| sort -n`
do
j=`basename $i .clp`
$ANU_MT_PATH/kAraka/Prepare_Graph/build_graph $TMP_FILES_PATH/parser_files/ $9 < $i  |\
#$ANU_MT_PATH/kAraka/kaaraka_sharing_Sawq_kwa.pl morph$j.out $ANU_MT_PATH/kAraka/gdbm_n |\
#$ANU_MT_PATH/kAraka/kaaraka_sharing.pl $SCLINSTALLDIR $ANU_MT_PATH/kAraka/gdbm_n/kAraka_name.gdbm  $ANU_MT_PATH/kAraka/gdbm_n/kAraka_num.gdbm > $TMP_FILES_PATH/parser_files/parseop$j.txt
$ANU_MT_PATH/kAraka/kaaraka_sharing.pl $SCLINSTALLDIR $ANU_MT_PATH/kAraka/Prepare_Graph/DATA/AkAfkRA/relations.txt > $TMP_FILES_PATH/parser_files/parseop$j.txt

 if [ $ECHO = "ECHO" ] ; then
      echo "calling constraint solver to solve the equations"
 fi
 
 #$ANU_MT_PATH/kAraka/add_parser_output.pl $SCLINSTALLDIR $ANU_MT_PATH/kAraka/gdbm_n $TMP_FILES_PATH/parser_files/parseop$j.txt 1 $GH_INPUT < $TMP_FILES_PATH/parser_files/morph$j.out |\
 $ANU_MT_PATH/kAraka/add_parser_output.pl $SCLINSTALLDIR $ANU_MT_PATH/kAraka/Prepare_Graph/DATA/AkAfkRA/relations.txt $TMP_FILES_PATH/parser_files/parseop$j.txt 1 $GH_INPUT < $TMP_FILES_PATH/parser_files/morph$j.out |\
  $ANU_MT_PATH/kAraka/add_abhihita_info.pl > $TMP_FILES_PATH/parser_files/morph${j}_1.out
#  $ANU_MT_PATH/kAraka/disambiguate_hewu_karaNa.pl $SCLINSTALLDIR $SHMT_PATH/data/hi > $TMP_FILES_PATH/parser_files/morph${j}_1.out 
 
$ANU_MT_PATH/kAraka/prepare_dot_files.sh $SCLINSTALLDIR $GraphvizDot $OUTSCRIPT $j mk_kAraka_help.pl $TMP_FILES_PATH/parser_files/morph$j.out $TMP_FILES_PATH/parser_files/parseop$j.txt $TMP_FILES_PATH 1
cat $TMP_FILES_PATH/parser_files/morph${j}_1.out >> $TMP_FILES_PATH/$5.1
#rm $TMP_FILES_PATH/parser_files/morph${j}_1.out
#rm $TMP_FILES_PATH/parser_files/morph$j.out
done
 
 mv $TMP_FILES_PATH/$5.1 $TMP_FILES_PATH/$5
else
 touch $TMP_FILES_PATH/parser_files/parseop.txt
 $ANU_MT_PATH/kAraka/handle_no_parse.pl < $TMP_FILES_PATH/$5 |\
 $ANU_MT_PATH/kAraka/add_parser_output.pl $ANU_MT_PATH/kAraka/Prepare_Graph/DATA/AkAfkRA/relations.txt $TMP_FILES_PATH/parser_files/parseop.txt 1 $GH_INPUT > $TMP_FILES_PATH/$5
fi
