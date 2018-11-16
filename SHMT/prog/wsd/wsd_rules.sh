#!/bin/sh
#  Copyright (C) 2002-2018 Amba Kulkarni (ambapradeep@gmail.com)
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

ANU_MT_PATH=$SCLINSTALLDIR/SHMT/prog

rm -rf $TMP_FILES_PATH/wsd_files
mkdir $TMP_FILES_PATH/wsd_files

cut -f4,9,10 $2 | $ANU_MT_PATH/wsd/add_kaaraka_info.pl > $3
$ANU_MT_PATH/wsd/cnvrtkaaraka2uniform_format.pl $TMP_FILES_PATH < $3
touch $TMP_FILES_PATH/wsd_files/wsd.txt
$ANU_MT_PATH/wsd/wsd $ANU_MT_PATH/wsd/ < $TMP_FILES_PATH/wsd_files/rl1.clp > $TMP_FILES_PATH/wsd_files/wsd.txt

cat $3 | $ANU_MT_PATH/wsd/create_wsd.pl $TMP_FILES_PATH/wsd_files/wsd.txt > $4

paste $2 $4 | perl -p -e 's/^\t//'  > $TMP_FILES_PATH/tmpwsd
mv $TMP_FILES_PATH/tmpwsd $2
#rm $TMP_FILES_PATH/wsd
