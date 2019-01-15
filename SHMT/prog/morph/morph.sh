#!/bin/sh

#  Copyright (C) 2009-2019 Amba Kulkarni (ambapradeep@gmail.com)
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

DEBUG="OFF"

export MY_PATH=$SCLINSTALLDIR/SHMT/prog

#$MY_PATH/morph/word_morph.sh $INFILE $TMP_FILES_PATH/tmp_mo_all $TMP_FILES_PATH/tmp_kqw_analy_mo
$MY_PATH/morph/word_morph.sh $SCLINSTALLDIR $LTPROCBIN < $INFILE > $TMP_FILES_PATH/tmp_mo_all #$TMP_FILES_PATH/tmp_kqw_analy_mo
$MY_PATH/morph/local_analysis/add_mo_local.pl $SCLINSTALLDIR $MY_PATH/morph/local_analysis/mo_ana.txt < $TMP_FILES_PATH/tmp_mo_all |\
$MY_PATH/prune/prune.sh $SCLINSTALLDIR > $TMP_FILES_PATH/tmp_mo

$MY_PATH/morph/bin/join_split_wrds.pl < $TMP_FILES_PATH/tmp_mo_all | cut -f2 > $OUTFILE

$MY_PATH/morph/bin/join_split_wrds.pl < $TMP_FILES_PATH/tmp_mo | cut -f2 > $PRUNEOUT
#$MY_PATH/morph/bin/add_kqw_analy.pl $MY_PATH/morph/rUDa_kqw.gdbm $MY_PATH/morph/local_analysis/kqw_mo_ana.dbm $TMP_FILES_PATH/tmp_kqw_analy_mo < $PRUNEOUT > $KQWOUT
$MY_PATH/morph/bin/add_kqw_analy.pl $SCLINSTALLDIR $MY_PATH/morph/local_analysis/kqw_mo_ana.txt < $PRUNEOUT > $KQWOUT

paste $INFILE $OUTFILE $PRUNEOUT $KQWOUT| perl -pe 's/^\t//;s/^\t//;s/^\t//' > $TMP_FILES_PATH/tmp_111
mv $TMP_FILES_PATH/tmp_111 $INFILE

#if [ $DEBUG = "OFF" ]; then
# rm $TMP_FILES_PATH/tmp_mo_all $TMP_FILES_PATH/tmp_mo $TMP_FILES_PATH/tmp_kqw_analy_mo  $TMP_FILES_PATH/tmp_non-samAsa-ppada-wrds $TMP_FILES_PATH/tmp_samAsa-upada-wrds
#fi
