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

SCLINSTALLDIR=$1
MY_PATH=$SCLINSTALLDIR/SHMT/prog/Heritage_morph_interface

$MY_PATH/Heritage_anusaaraka_morph.out |\
$MY_PATH/change_pratipadik_cat.pl $SCLINSTALLDIR $MY_PATH/mapping_Heritage_saMsAdhanii_WX.txt $MY_PATH/../morph/rUDa_kqw.txt $MY_PATH/fem_pratipadik_Heritage_anusaaraka_map.txt $MY_PATH/pratipadika_heritage_anusaaraka_map.txt |\
$MY_PATH/postprocess.pl | $MY_PATH/add_end_s_tag.pl
