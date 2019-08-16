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
export BIN_PATH=$SCLINSTALLDIR/SHMT/prog/prune

#wvam mawwaH SqNu; here we need wasil analysis
#$BIN_PATH/rm_wasil.pl  |\
$BIN_PATH/handle_special_words_repetitive.pl  |\
#$BIN_PATH/rm_duplicate_ans.pl  |\
#$BIN_PATH/rm_non_apte.pl $SCLINSTALLDIR $BIN_PATH/default_gen.dbm $BIN_PATH/apte_pratipadik.dbm $SHMT_PATH/prog/morph/rUDa_kqw.gdbm |\
$BIN_PATH/rm_non_apte.pl $SCLINSTALLDIR $BIN_PATH/default_gen.txt $SHMT_PATH/prog/morph/rUDa_kqw.txt  |\
#$BIN_PATH/retain_only_inflectional_if_exists.pl  |\
#Above line was commented. Uncommented by Amba on 28 Feb 2012
#test sent: praBAwe ahaM rAjasaBAm gawvA kA vArwA (aswi) iwi paSyAmi
#Without praBAwe it produces fast and correct result.
#With praBAwe it takes infinitely large time.
#19 May 2013: Again retain_only.. is commented. This time the above sent worked well without taking long time.
#When this is uuncommented, sawi sapwami does not work well
#rAme vanam gacCawi sawi sIwA anusarawi
# This is again uncommented, since now we have kqw analysis for all words. So all those analysis which are rare need to bbe deleted. For example, in praBawe, we need to delete pra_BA1 analysis.
#$BIN_PATH/remove_prAtipadik_derivation_info.pl < /tmp/5 > /tmp/6
#Earlier we added the kqw analysis later. Now derivational analysis is produced simultaneously with the inflectional morph analysis. Hence this programme is removed.
#$BIN_PATH/remove_derivational_analysis_of_rUDa_kqws.pl $SCLINSTALLDIR $SHMT_PATH/prog/morph/rUDa_kqw.gdbm |\
$BIN_PATH/remove_derivational_analysis_of_rUDa_kqws.pl $SCLINSTALLDIR $SHMT_PATH/prog/morph/rUDa_kqw.txt  |\
$BIN_PATH/rm_saMKyA.pl  |\
$BIN_PATH/handle_samboXana.pl D  2> /dev/null  |\
#$BIN_PATH/keep_freq_mo.pl $SCLINSTALLDIR $BIN_PATH/default_morph.dbm |\
$BIN_PATH/keep_freq_mo.pl $BIN_PATH/default_morph.txt  |\
$BIN_PATH/rm_duplicate_ans.pl |\
$BIN_PATH/handle_sawi_sapwami.pl |\
$BIN_PATH/remove_wal.pl |\
## commented the below line, since it did not parse wena kqwam properly, as kqxanwa analysis of kqw were removed
#$BIN_PATH/remove_derivational_kqw_ana.pl < /tmp/1 |\
$BIN_PATH/priotarize.pl |\
perl -pe 's/=\//=/; s/^\///; s/\/\//\//g;' 2> /dev/null

#$BIN_PATH/retain_only_pronominal_if_exists.pl |\
#The above program is removed, since now the kaaraka analyser takes care of the multiple analysis
#$BIN_PATH/rm_non_avyaya.pl |\
#The above program is removed, since now the kaaraka analyser takes care of the multiple analysis
