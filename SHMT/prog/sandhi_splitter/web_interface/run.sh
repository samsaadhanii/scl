#!/bin/sh
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


DEBUG="OFF"

TYPE=$1
DIRPATH=$2
FILEPATH=$3
SCLINSTALLDIR=$4
FSTPATH=$5

PROG_PATH=$SCLINSTALLDIR/SHMT/prog/sandhi_splitter
$SCLINSTALLDIR/SHMT/prog/Normalisation/get_std_spelling.out < $DIRPATH/$FILEPATH > $DIRPATH/$FILEPATH.1

if [ $TYPE = "S" ]; then
$PROG_PATH/sandhi_samaasa_splitter.out -t -$1 $PROG_PATH/samAsa_words.txt $PROG_PATH/samAsa_rules.txt $FSTPATH $SCLINSTALLDIR/morph_bin/samAsa_splitter.bin $DIRPATH/$FILEPATH.1 4 > most_probable_output.txt

else if [ $TYPE = "s" ]; then
$PROG_PATH/sandhi_samaasa_splitter.out -t -$1 $PROG_PATH/sandhi_words.txt $PROG_PATH/sandhi_rules.txt $FSTPATH $SCLINSTALLDIR/morph_bin/sandhi_splitter.bin $DIRPATH/$FILEPATH.1 4 > most_probable_output.txt

else if [ $TYPE = "b" ]; then
$PROG_PATH/sandhi_samaasa_splitter.out -t -$1 $PROG_PATH/word_freq.txt $PROG_PATH/all_rules.txt $FSTPATH $SCLINSTALLDIR/morph_bin/samAsa_splitter.bin $DIRPATH/$FILEPATH.1 4 > most_probable_output.txt

fi
fi
fi

$PROG_PATH/../interface/modify_mo_for_mo_display.pl $SCLINSTALLDIR < temp_result_mo > mo_display

cut -f1 most_probable_output.txt | $PROG_PATH/web_interface/add_tooltip.pl mo_display| $SCLINSTALLDIR/converters/ri_skt | $SCLINSTALLDIR/converters/iscii2utf8.py 1 > most_probable_output_utf.txt

tail -n +3 full_output | cut -f1 | $PROG_PATH/web_interface/add_tooltip.pl mo_display | $SCLINSTALLDIR/converters/ri_skt | $SCLINSTALLDIR/converters/iscii2utf8.py 1 > all_possible_outputs.txt

#if [ $DEBUG = "OFF" ] ; then
rm expected_output expected_output_notfound wordwx wordwx.1 words_notdone temp_result most_probable_output.txt todelete rank_percentages percent_discards full_output temp_result_mo mo_display
#fi
