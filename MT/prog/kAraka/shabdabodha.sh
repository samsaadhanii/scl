#!/bin/sh
#
##  Copyright (C) 2002-2023 Amba Kulkarni (ambapradeep@gmail.com)
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
   TMP_FILES_PATH=$3
   OUTSCRIPT=$6
   PARSE=$7
   TEXT_TYPE=$8

   ANU_MT_PATH=$SCLINSTALLDIR/MT/prog
   mkdir -p $TMP_FILES_PATH/parser_files

  if [ $OUTSCRIPT = "IAST" ]; then
     my_converter="$SCLINSTALLDIR/converters/wx2utf8roman.out"
  fi

  if [ $OUTSCRIPT = "DEV" ]; then
     my_converter="$SCLINSTALLDIR/converters/wx2utf8.sh $SCLINSTALLDIR"
  fi

   if [ $PARSE != "NO" ] ; then
	if [ $PARSE != "AVAILABLE" ]; then
             $ANU_MT_PATH/kAraka/uniform_morph_anal.pl $SCLINSTALLDIR <  $TMP_FILES_PATH/$4  > $TMP_FILES_PATH/parser_files/morph.txt
             $ANU_MT_PATH/kAraka/Prepare_Graph/build_graph $TMP_FILES_PATH/parser_files/ $TEXT_TYPE  < $TMP_FILES_PATH/parser_files/morph.txt |\
             $ANU_MT_PATH/kAraka/kaaraka_sharing.pl $SCLINSTALLDIR $ANU_MT_PATH/kAraka/Prepare_Graph/DATA/AkAfkRA/relations.txt > $TMP_FILES_PATH/parser_files/parseop1.txt
        fi
	if [ $PARSE = "AVAILABLE" ]; then
	     cp $TMP_FILES_PATH/parser_files/parseop_new.txt $TMP_FILES_PATH/parser_files/parseop1.txt 
        fi
             $ANU_MT_PATH/kAraka/add_best_parse_output.pl $ANU_MT_PATH/kAraka/Prepare_Graph/DATA/AkAfkRA/relations.txt $TMP_FILES_PATH/parser_files/parseop1.txt < $TMP_FILES_PATH/$4 |\
             $ANU_MT_PATH/kAraka/add_abhihita_info.pl > $TMP_FILES_PATH/tmp_parse
	
  else

     touch $TMP_FILES_PATH/parser_files/graph.txt
     touch $TMP_FILES_PATH/parser_files/parseop.txt
     $ANU_MT_PATH/kAraka/handle_no_parse.pl < $TMP_FILES_PATH/$4 |\
     $ANU_MT_PATH/kAraka/add_best_parse_output.pl $ANU_MT_PATH/kAraka/Prepare_Graph/DATA/AkAfkRA/relations.txt $TMP_FILES_PATH/parser_files/parseop.txt > $TMP_FILES_PATH/tmp_parse

  fi
     $ANU_MT_PATH/kAraka/add_possible_relations.pl $TMP_FILES_PATH/parser_files/graph.txt < $TMP_FILES_PATH/tmp_parse > $TMP_FILES_PATH/$4
