#!/bin/bash

#  Copyright (C) 2008-2019 Amba Kulkarni (ambapradeep@gmail.com)
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

PROG_PATH=$SCLINSTALLDIR/SHMT/prog/sandhi_splitter

#$PROG_PATH/sandhi_samaasa_splitter.out -t -b $PROG_PATH/samAsa_words.txt $PROG_PATH/samAsa_rules.txt $LTPROCBIN $SCLINSTALLDIR/morph_bin/samAsa_splitter.bin $3 4 > sandhi_splitter_out
#$PROG_PATH/sandhi_samaasa_splitter.out -t -S $PROG_PATH/samAsa_words.txt $PROG_PATH/samAsa_rules.txt $LTPROCBIN $SCLINSTALLDIR/morph_bin/samAsa_splitter.bin $3 4 > sandhi_splitter_out

$PROG_PATH/sandhi_samaasa_splitter.out -t -s $PROG_PATH/sandhi_words.txt $PROG_PATH/sandhi_rules.txt $LTPROCBIN $SCLINSTALLDIR/morph_bin/samAsa_splitter.bin $3 4 >> sandhi_splitter_out

sort sandhi_splitter_out | grep . | $SCLINSTALLDIR/SHMT/prog/sandhi_splitter/pick_best.pl | cut -f1 
