#!/bin/bash

#  Copyright (C) 2006-2019 Amba Kulkarni (ambapradeep@gmail.com)
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


source ../paths.sh

DEBUG="OFF"

SCLINSTALLDIR=$1
TFPATH=$2
LTPROCBIN=$3
INFILE=$4

cut -f3 $INFILE | sort -u | grep -v '-' |\
$SCLINSTALLDIR/SHMT/prog/Normalisation/get_std_spelling.out |\
$LTPROCBIN -c $SCLINSTALLDIR/morph_bin/all_but_samboXana_morf.bin |\
grep '*' | perl -pe 's/\/.*//' | perl -pe 's/^.//' > $TFPATH/tmp_unkn
cd $TFPATH
$SCLINSTALLDIR/SHMT/prog/sandhi_splitter/run.sh $SCLINSTALLDIR $LTPROCBIN tmp_unkn > tmp_split
cd ..
$SCLINSTALLDIR/SHMT/prog/sandhi_splitter/replace_sandhi.pl $SCLINSTALLDIR $TFPATH/tmp_split < $INFILE.orig | perl -pe 's/\+/\n/g' > $INFILE

#if [ $DEBUG = "OFF" ]; then
#  rm $TFPATH/tmp_unkn $TFPATH/tmp_split $INFILE.orig
#fi
