#!/bin/sh
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


SCLINSTALLDIR=$1
TMP_FILES_PATH=$2

ANU_MT_PATH=$SCLINSTALLDIR/MT/prog

rm -rf $TMP_FILES_PATH/wsd_files
mkdir $TMP_FILES_PATH/wsd_files

touch $TMP_FILES_PATH/wsd_files/wsd.txt
cut -f1,2,7,8 $TMP_FILES_PATH/$3 | $ANU_MT_PATH/wsd/add_kaaraka_info.pl > $TMP_FILES_PATH/$4
$ANU_MT_PATH/wsd/cnvrtkaaraka2uniform_format.pl < $TMP_FILES_PATH/$4  |\
$ANU_MT_PATH/wsd/wsd $ANU_MT_PATH/wsd/ > $TMP_FILES_PATH/wsd_files/wsd.txt

cat $TMP_FILES_PATH/$4 | $ANU_MT_PATH/wsd/create_wsd.pl $TMP_FILES_PATH/wsd_files/wsd.txt > $TMP_FILES_PATH/$5

paste $TMP_FILES_PATH/$3 $TMP_FILES_PATH/$5 | perl -p -e 's/^\t//'  > $TMP_FILES_PATH/tmpwsd
cp $TMP_FILES_PATH/tmpwsd $TMP_FILES_PATH/$3
#rm $TMP_FILES_PATH/wsd
