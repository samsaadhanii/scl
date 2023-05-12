#!/bin/bash

#### Do not change bash to sh. source command does not work in sh -> dash
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

source ../../../paths.sh

MT_PATH=$SCLINSTALLDIR/MT/
ANU_MT_PATH=$MT_PATH/prog

TMP_FILES_PATH=$1
pid=$2
OUTSCRIPT=$3
outfilename="in"$pid".out"

 $ANU_MT_PATH/kAraka/add_parser_output.pl $SCLINSTALLDIR $ANU_MT_PATH/kAraka/Prepare_Graph/DATA/AkAfkRA/relations.txt $TMP_FILES_PATH/parser_files/parseop_new.txt 1 < $TMP_FILES_PATH/parser_files/morph1.out |\
  $ANU_MT_PATH/kAraka/add_abhihita_info.pl > $TMP_FILES_PATH/parser_files/$outfilename

$ANU_MT_PATH/kAraka/prepare_dot_files.sh $SCLINSTALLDIR $GraphvizDot $OUTSCRIPT 1 mk_kAraka_help.pl $TMP_FILES_PATH/parser_files/morph1.out $TMP_FILES_PATH/parser_files/parseop_new.txt $TMP_FILES_PATH 1

cp $TMP_FILES_PATH/parser_files/parseop_new.txt $TMP_FILES_PATH/parser_files/parseop1.txt
$GlblVar::SCLINSTALLDIR/MT/prog/shell/anu_skt_hnd.sh $GlblVar::CGIDIR/$GlblVar::SCL_CGI tmp_in${pid}/in$pid $GlblVar::TFPATH hi DEV UoHyD AVAILABLE Prose 2> $GlblVar::TFPATH/tmp_in$pid/err1$pid

$ANU_MT_PATH/interface/display_output.pl $SCLINSTALLDIR $TFPATH $OUTSCRIPT $pid A $GlblVar::SCL_HTDOCS $GlblVar::SCL_CGI
