#!/bin/bash
#  Copyright (C) 2002-2024 Amba Kulkarni (ambapradeep@gmail.com)
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


TFPATH=$1
myPATH=$2
Ppid=$3

ANU_MT_PATH=$myPATH/MT/prog/Discourse

$ANU_MT_PATH/cnvrt2discourse_format.pl < $TFPATH/tmp_in$Ppid/in$Ppid.wsd_consoliated > $TFPATH/tmp_in$Ppid/discourse_input.txt
$ANU_MT_PATH/discourse < $TFPATH/tmp_in$Ppid/discourse_input.txt > $TFPATH/tmp_in$Ppid/discourse.txt
$ANU_MT_PATH/prepare_input_for_graph.pl $TFPATH/tmp_in$Ppid/discourse.txt < $TFPATH/tmp_in$Ppid/discourse_input.txt | $myPATH/converters/wx2utf8.sh $myPATH > $TFPATH/tmp_in$Ppid/graph_input.txt
