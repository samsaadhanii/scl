#!/bin/bash

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


#echo `pwd = $pwd`
source ../paths.sh

word=$1

echo $word | $SCLINSTALLDIR/MT/prog/Normalisation/get_std_spelling.out |\
$LTPROCBIN -c $SCLINSTALLDIR/morph_bin/all_morf.bin | grep . | perl -p -e 's/\//=/' | perl -p -e 's/^.*=\*.*//' | perl -p -e 's/.*=//' | perl -p -e 's/^^//' |\
$SCLINSTALLDIR/MT/prog/interface/modify_mo_for_mo_display.pl $SCLINSTALLDIR |\
perl -p -e 's/\/\/\+/\//g' | perl -p -e 's/\/$//' | perl -p -e  's/^\///' | perl -pe 's/\$//' | perl -pe 's/</{/g' | perl -pe 's/>/}/g' | perl -pe 's/:/ /g' | $SCLINSTALLDIR/converters/ri_skt | $SCLINSTALLDIR/converters/iscii2utf8.py 1 
