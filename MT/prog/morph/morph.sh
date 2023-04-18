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
INFILE=$2
OUTFILE=$3
PRUNEOUT=$4
KQWOUT=$5
LTPROCBIN=$6
TMP_FILES_PATH=$7

DEBUG="ON"

export MY_PATH=$SCLINSTALLDIR/MT/prog


$MY_PATH/morph/word_morph.sh $SCLINSTALLDIR $LTPROCBIN  $TMP_FILES_PATH < $INFILE > $TMP_FILES_PATH/tmp_mo_all 
$MY_PATH/morph/local_analysis/add_mo_local.pl $SCLINSTALLDIR $MY_PATH/morph/local_analysis/mo_ana.txt < $TMP_FILES_PATH/tmp_mo_all |\
$MY_PATH/prune/prune.sh $SCLINSTALLDIR > $TMP_FILES_PATH/tmp_mo

cut -d= -f2 $TMP_FILES_PATH/tmp_mo_all > $OUTFILE
cut -d= -f2 $TMP_FILES_PATH/tmp_mo > $PRUNEOUT

$MY_PATH/morph/bin/add_kqw_analy.pl $SCLINSTALLDIR $MY_PATH/morph/local_analysis/kqw_mo_ana.txt < $PRUNEOUT > $KQWOUT

paste $INFILE $OUTFILE $PRUNEOUT $KQWOUT| perl -pe 's/^\t//;s/^\t//;s/^\t//; s/\t\t/\t-\t/; s/\t\t/\t-\t/; s/\t$/\t-/; s/,\/,/,/g;' > $TMP_FILES_PATH/tmptmp
#cp $TMP_FILES_PATH/tmptmp $INFILE
mv $TMP_FILES_PATH/tmptmp $INFILE

if [ $DEBUG = "OFF" ]; then
rm $TMP_FILES_PATH/tmp_mo_all $TMP_FILES_PATH/tmp_mo  $TMP_FILES_PATH/$OUTFILE $TMP_FILES_PATH/$PRUNEOUT $TMP_FILES_PATH/$KQWOUT 
fi
