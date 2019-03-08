#!/bin/bash

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

source ../../../paths.sh

SHMT_PATH=$SCLINSTALLDIR/SHMT/
ANU_MT_PATH=$SHMT_PATH/prog
GH_INPUT="NO" 
#This is misleading; needs to be fixed properly. Here the input need not be from GH's morph, but the constraint interface somewhere needs it.

TMP_FILES_PATH=$1
pid=$2
OUTSCRIPT=$3
outfilename="in"$pid".out"

#$ANU_MT_PATH/kAraka/cnvrtclips2morph.pl $ANU_MT_PATH/kAraka/gdbm_n $dirname/parser_files/parseop_new.txt 1 $GH_INPUT < $dirname/$filename |\
#$ANU_MT_PATH/kAraka/add_abhihita_info.pl |\
#
#$ANU_MT_PATH/kAraka/disambiguate_hewu_karaNa.pl $SCLINSTALLDIR $SHMT_PATH/data/hi > $dirname/$inpid.out.1
#
#$ANU_MT_PATH/kAraka/prepare_dot_files.sh DEV mk_kAraka_help.pl $SCLINSTALLDIR $dirname/$inpid.out $dirname/parseop_new.txt $dirname
#
#$ANU_MT_PATH/kAraka/prepare_kAraka_tagged_file.pl 2 9 < $dirname/$inpid.out.1 > $dirname/$inpid.kAraka
#cp $dirname/$inpid.out.1 $dirname/$inpid.out

 $ANU_MT_PATH/kAraka/add_parser_output.pl $SCLINSTALLDIR $ANU_MT_PATH/kAraka/Prepare_Graph/DATA/AkAfkRA/relations.txt $TMP_FILES_PATH/parser_files/parseop_new.txt 1 $GH_INPUT < $TMP_FILES_PATH/parser_files/morph1.out |\
  $ANU_MT_PATH/kAraka/add_abhihita_info.pl > $TMP_FILES_PATH/parser_files/morph1_1.out
#  $ANU_MT_PATH/kAraka/disambiguate_hewu_karaNa.pl $SCLINSTALLDIR $SHMT_PATH/data/hi > $TMP_FILES_PATH/parser_files/morph${j}_1.out 

#$ANU_MT_PATH/kAraka/prepare_dot_files.sh $SCLINSTALLDIR $GraphvizDot $OUTSCRIPT 1 mk_kAraka_help.pl $TMP_FILES_PATH/parser_files/morph1.out $TMP_FILES_PATH/parser_files/parseop1.txt $TMP_FILES_PATH 1
$ANU_MT_PATH/kAraka/prepare_dot_files.sh $SCLINSTALLDIR $GraphvizDot $OUTSCRIPT 1 mk_kAraka_help.pl $TMP_FILES_PATH/parser_files/morph1.out $TMP_FILES_PATH/parser_files/parseop_new.txt $TMP_FILES_PATH 1
cat $TMP_FILES_PATH/parser_files/morph1_1.out > $TMP_FILES_PATH/$outfilename.1
mv $TMP_FILES_PATH/$outfilename.1 $TMP_FILES_PATH/$outfilename

$ANU_MT_PATH/shell/anu_skt_hnd.sh $SCLINSTALLDIR $GraphvizDot "in"$pid $TFPATH hi DEV NO UoHyd AVAILABLE Prose NOECHO $LTPROCBIN D 2>> $TMP_FILES_PATH/err$pid;

$ANU_MT_PATH/interface/display_output.pl $SCLINSTALLDIR $TFPATH $OUTSCRIPT $pid
