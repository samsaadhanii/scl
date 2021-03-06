#!/bin/bash
#### Do not change bash to sh. source command does not work in sh -> dash

#  Copyright (C) 2008-2022 Amba Kulkarni (ambapradeep@gmail.com)
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
GraphvizDot=$2
TMP_DIR_PATH=$4
LANG=$5
OUTSCRIPT=$6
MORPH=$7
PARSE=$8
TEXT_TYPE=$9
HERITAGE_CGIURL=${10}
LTPROCBIN=${11}
MYPYTHONPATH=${12}

echo $MYPYTHONPATH > /tmp/aa

export MT_PATH=$SCLINSTALLDIR/MT
ANU_MT_PATH=$MT_PATH/prog
export LC_ALL=POSIX

DEBUG="OFF"
Heritage_Input="NO"

if [ $OUTSCRIPT = "IAST" ]; then
 my_converter="$SCLINSTALLDIR/converters/wx2utf8roman.out"
 my_converter_wxHindi="$SCLINSTALLDIR/converters/wx2utf8roman.out"
fi

if [ $OUTSCRIPT = "DEV" ]; then
  my_converter="$SCLINSTALLDIR/converters/wx2utf8.sh $SCLINSTALLDIR"
  my_converter_wxHindi="$SCLINSTALLDIR/converters/wxHindi-utf8.sh $SCLINSTALLDIR"
fi

if [ $# -lt 1 ] ; then
  echo "Usage: anu_skt_hnd.sh <file> tmp_dir_path hi [DEV|IAST|VH] [NO|YES] [UoHyd|GH] [NO|Partial|Full] [ECHO|NOECHO] [D]."
fi

fbn=`basename $3` #fbn = file base name
#dnm=`dirname $3` #dnm = directory name

temp_files_path=$TMP_DIR_PATH/${dnm}/tmp_$fbn
#temp_files_path=$TMP_DIR_PATH/tmp_$fbn

export TMP_FILES_PATH=$temp_files_path

if [ -f "tmp_$fbn"  ] ; then 
  echo "File tmp_$fbn exists. Remove or rename it, and give the command again."
else
  mkdir -p $temp_files_path

###########
   if [ $PARSE != "AVAILABLE" ] ; then
    if [ $MORPH = "UoHyd" ] ; then

      $ANU_MT_PATH/format/format.sh $SCLINSTALLDIR < $TMP_DIR_PATH/$3 > $temp_files_path/$fbn.out
###########
      cp $temp_files_path/$fbn.out $temp_files_path/$fbn.out.orig
      $ANU_MT_PATH/sandhi_splitter/copy_field.pl  $temp_files_path/sandhied_$fbn < $temp_files_path/$fbn.out.orig > $temp_files_path/$fbn.out
###########
#      /usr/bin/time "%Uuser %Ssystem %Eelapsed %PCPU (%Xtext+%Ddata %Mmax)k\n%Iinputs+%Ooutputs (%Fmajor+%Rminor)pagefaults %Wswaps %C\n" 
      #cp $temp_files_path/$fbn.out $temp_files_path/$fbn.out.pre_morph
#date
$ANU_MT_PATH/morph/morph.sh $SCLINSTALLDIR $temp_files_path/$fbn.out $temp_files_path/$fbn.mo_all $temp_files_path/$fbn.mo_prune $temp_files_path/$fbn.mo_kqw $LTPROCBIN $temp_files_path
#date
      #cp $temp_files_path/$fbn.out $temp_files_path/$fbn.out.post_morph
#       if [ $DEBUG = "OFF" ]; then 
#         rm $temp_files_path/$fbn.mo_all $temp_files_path/$fbn.mo_prune $temp_files_path/$fbn.mo_kqw
#       fi

    # $2.unkn contains the unrecognised words
    # $2.mo_all: Monier williams o/p
    # $2.mo_prune: After pruning with Apte's dict
    # $2.mo_kqw: After adding derivational morph analysis
  fi

###########
#     # First argument: Name of the file
#     # Second argument: no of parses
#     # Third argument: Name of the file with kaaraka analysis for annotation
# Field 9: morph analysis corresponding to the kaaraka role
# Field 10: kaaraka role
#     /usr/bin/time "%Uuser %Ssystem %Eelapsed %PCPU (%Xtext+%Ddata %Mmax)k\n%Iinputs+%Ooutputs (%Fmajor+%Rminor)pagefaults %Wswaps %C\n" 
#date
$ANU_MT_PATH/kAraka/shabdabodha.sh $SCLINSTALLDIR $GraphvizDot $Heritage_Input $temp_files_path $fbn.out $fbn.kAraka $OUTSCRIPT $PARSE $TEXT_TYPE $HERITAGE_CGIURL
#date
#cp $temp_files_path/$fbn.out $temp_files_path/$fbn.post_parse_out
#echo "within Parse" > /tmp/aaa
 fi  # PARSE != AVAILABLE ends here
#     /usr/bin/time "%Uuser %Ssystem %Eelapsed %PCPU (%Xtext+%Ddata %Mmax)k\n%Iinputs+%Ooutputs (%Fmajor+%Rminor)pagefaults %Wswaps %C\n" 
#
###########
# anaphora in the 11th field
#echo "calling Anaphora" >> /tmp/aaa
     $ANU_MT_PATH/anaphora/anaphora.pl $SCLINSTALLDIR $ANU_MT_PATH/anaphora < $temp_files_path/$fbn.out > $temp_files_path/tmp
     mv $temp_files_path/tmp $temp_files_path/$fbn.out

############
# wsd in the 12th field
    #cp $temp_files_path/$fbn.out $temp_files_path/$fbn.pre_wsd
    $ANU_MT_PATH/wsd/wsd_rules.sh $SCLINSTALLDIR $temp_files_path $fbn.out $fbn.wsd $fbn.wsd_upapaxa
    #cp $temp_files_path/$fbn.out $temp_files_path/$fbn.post_wsd
#    if [ $DEBUG = "OFF" ]; then 
     #rm $temp_files_path/$fbn.wsd $temp_files_path/$fbn.wsd_upapaxa
#    fi
###########
### Map to hindi
# Color Code in the 13th field
# Chunk/LWG in the 14th field
# map o/p in the 15th field and lwg o/p in 16th field
# gen o/p in the 17th field
    #cp $temp_files_path/$fbn.out $temp_files_path/$fbn.pre_final_out
    $ANU_MT_PATH/interface/add_colorcode.pl < $temp_files_path/$fbn.out |\
    $ANU_MT_PATH/chunker/lwg.pl  |\
    $ANU_MT_PATH/map/add_dict_mng.pl $SCLINSTALLDIR $MT_PATH/data hi |\
    $ANU_MT_PATH/map/lwg_avy_avy.pl $SCLINSTALLDIR $MT_PATH/data hi |\
    $ANU_MT_PATH/hn/sent_gen/agreement.pl $SCLINSTALLDIR $MT_PATH/data $ANU_MT_PATH/hn/sent_gen  |\
    $ANU_MT_PATH/hn/sent_gen/call_gen.pl $SCLINSTALLDIR  |\
    $ANU_MT_PATH/interface/modify_mo_for_display.pl $SCLINSTALLDIR  > $temp_files_path/ttt
    mv $temp_files_path/ttt $temp_files_path/$fbn.out

##########
    $ANU_MT_PATH/translation/translate.sh $SCLINSTALLDIR $my_converter_wxHindi < $temp_files_path/$fbn.out > $temp_files_path/../${fbn}_trnsltn
###########

###########
# 1-2: format
# 3: sandhied_word
# 4: word
# 5: format
# 6-8: morph
# 9: morph in context
# 10: kaaraka role
# 11: Anaphora
# 12: WSD
# ** 13: POS
# 13: Color code
# 14: Chunk/LWG
# 15:  map o/p
# 16: lwg o/p
# 17: gen o/p

$ANU_MT_PATH/reader_generator/extract.pl < $temp_files_path/$fbn.out > $temp_files_path/table.tsv
$MYPYTHONPATH $ANU_MT_PATH/anvaya/reorder.py -i $temp_files_path/table.tsv -o $temp_files_path/anvaya.tsv -s $SCLINSTALLDIR -t hi
$my_converter < $temp_files_path/table.tsv > $temp_files_path/table_outscript.tsv
$my_converter < $temp_files_path/anvaya.tsv > $temp_files_path/anvaya_outscript.tsv

#Generate Anvaya order html file
$ANU_MT_PATH/interface/get_anvaya_order_html.pl $fbn $temp_files_path $OUTSCRIPT  cgi-bin $HERITAGE_CGIURL A < $temp_files_path/anvaya_outscript.tsv > $temp_files_path/../anvaya_$fbn.html
$ANU_MT_PATH/interface/get_anvaya_shloka_translation.pl ${temp_files_path}/anvaya_$fbn  ${temp_files_path}/anvaya_${fbn}_wx_trnsltn < $temp_files_path/anvaya.tsv

#Generate Shloka order html file
$ANU_MT_PATH/interface/get_anvaya_order_html.pl $fbn $temp_files_path $OUTSCRIPT  cgi-bin $HERITAGE_CGIURL S < $temp_files_path/anvaya_outscript.tsv > $temp_files_path/../shloka_$fbn.html

$my_converter < $temp_files_path/anvaya_${fbn}_wx_trnsltn > $temp_files_path/anvaya_${fbn}_trnsltn
$MYPYTHONPATH $ANU_MT_PATH/reader_generator/csv2xlsx.py $temp_files_path/table_outscript.tsv $temp_files_path/table.xlsx
#if [ $DEBUG = "OFF" ]; then 
#rm -rf $temp_files_path/tmp* $temp_files_path/in* $temp_files_path/wsd_files
#fi
fi
