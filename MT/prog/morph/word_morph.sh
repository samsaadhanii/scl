#!/bin/sh

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

SCLINSTALLDIR=$1
LTPROCBIN=$2
TMP_FILES_PATH=$3

export BIN_PATH=$SCLINSTALLDIR/morph_bin

DEBUG="ON"

cut -f2 | $SCLINSTALLDIR/MT/prog/Normalisation/get_std_spelling.out |\
$SCLINSTALLDIR/MT/prog/morph/bin/split-samAsa-wrds.pl $TMP_FILES_PATH/tmpall $TMP_FILES_PATH/tmpany $TMP_FILES_PATH/tmpsamb $TMP_FILES_PATH/tmpupaxa

$LTPROCBIN -c $BIN_PATH/samAsa_upaxa.bin < $TMP_FILES_PATH/tmpupaxa | perl -pe 's/\//=/;s/^.*=\*.*//;s/.*=//;s/^^//;s/\$$//;' > $TMP_FILES_PATH/tmp_n1
$LTPROCBIN -c $BIN_PATH/samboXana.bin < $TMP_FILES_PATH/tmpsamb | perl -pe 's/\//=/;s/^.*=\*.*//;s/.*=//;s/^^//;s/\$$//' > $TMP_FILES_PATH/tmp_n2
$LTPROCBIN -c $BIN_PATH/all_but_samboXana_morf.bin < $TMP_FILES_PATH/tmpany | perl -pe 's/\//=/;s/^.*=\*.*//;s/.*=//;s/^^//;s/\$$//;s/[a-zA-Z]+<vargaH:sa-pU-pa><lifgam:[^>]+><level:[02]>//g;s/[a-zA-Z]+[^\/]+<vargaH:sa-pU-pa><level:[02]>//g;s/>([a-zA-Z]+)</><kqw_pratipadika:\1></g;' > $TMP_FILES_PATH/tmp_n3

paste -d'/' $TMP_FILES_PATH/tmp_n3 $TMP_FILES_PATH/tmp_n2 $TMP_FILES_PATH/tmp_n1 | perl -pe 's/\/\//\//g;' > $TMP_FILES_PATH/tmp_n

$SCLINSTALLDIR/MT/prog/morph/bin/handle_Namul_next.pl < $TMP_FILES_PATH/tmp_n | $SCLINSTALLDIR/MT/prog/morph/bin/handle_Namul_prev.pl  | perl -pe 's/=\//=/;s/\$$//g' > $TMP_FILES_PATH/tmp_nn

paste -d= $TMP_FILES_PATH/tmpall $TMP_FILES_PATH/tmp_nn | perl -pe 's/\/$//;s/^=//;s/=\//=/; s/\-$//;'

if [ $DEBUG = "OFF" ]; then
     rm -f $TMP_FILES_PATH/tmp_n $TMP_FILES_PATH/tmp_n1 $TMP_FILES_PATH/tmp_n2 $TMP_FILES_PATH/tmp_n3 $TMP_FILES_PATH/tmp_nn
fi
