#!/bin/sh

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
GraphvizDot=$2
TMP_DIR_PATH=$4
LANG=$5
OUTSCRIPT=$6
SANDHI=$7
MORPH=$8
PARSE=$9
TEXT_TYPE=${10}
ECHO=${11}
LTPROCBIN=${12}

export SHMT_PATH=$SCLINSTALLDIR/SHMT
ANU_MT_PATH=$SHMT_PATH/prog
export LC_ALL=POSIX

DEBUG="OFF"
Heritage_Input="NO"

if [ $OUTSCRIPT = "IAST" ]; then
 my_converter="$SCLINSTALLDIR/converters/wx2utf8roman.out"
 my_converter_wxHindi="$SCLINSTALLDIR/converters/wx2utf8roman.out"
fi

if [ $OUTSCRIPT = "DEV" ]; then
#  my_converter="$SCLINSTALLDIR/converters/ri_skt | $SCLINSTALLDIR/converters/iscii2utf8.py 1"
#  my_converter_wxHindi="$SCLINSTALLDIR/converters/ri | $SCLINSTALLDIR/converters/iscii2utf8.py 1"
  my_converter="$SCLINSTALLDIR/converters/wx2utf8.sh $SCLINSTALLDIR"
  my_converter_wxHindi="$SCLINSTALLDIR/converters/wxHindi-utf8.sh $SCLINSTALLDIR"
fi

if [ $OUTSCRIPT = "VH" ]; then
  my_converter="$SCLINSTALLDIR/converters/wx-velthuis.out"
  my_converter_wxHindi="$SCLINSTALLDIR/converters/wx-velthuis.out"
fi

if [ $# -lt 1 ] ; then
  echo "Usage: anu_skt_hnd.sh <file> tmp_dir_path hi [DEV|IAST|VH] [NO|YES] [UoHyd|GH] [NO|Partial|Full] [ECHO|NOECHO] [D]."
fi

#cd $TMP_DIR_PATH
fbn=`basename $3` #fbn = file base name
dnm=`dirname $3` #dnm = directory name

temp_files_path=$TMP_DIR_PATH/${dnm}/tmp_$fbn

export TMP_FILES_PATH=$temp_files_path

if [ -f "tmp_$fbn"  ] ; then 
  echo "File tmp_$fbn exists. Remove or rename it, and give the command again."
else
  mkdir -p $temp_files_path

  cmd=s#tmp_dir_scrpt#$temp_files_path\&amp\;outscript=$OUTSCRIPT#g
  cmd1=s#tmp_anu_dir#${dnm}\/tmp_$fbn#g
  cmd2=s#tmp_dir_gen#$temp_files_path#g

###########
   if [ $PARSE != "AVAILABLE" ] ; then
    if [ $MORPH = "UoHyd" ] ; then

      $ANU_MT_PATH/format/format.sh $SCLINSTALLDIR < $TMP_DIR_PATH/$3 > $temp_files_path/$fbn.out
###########
      if [ $SANDHI = "YES" ] ; then
        cp $temp_files_path/$fbn.out $temp_files_path/$fbn.out.orig
        $ANU_MT_PATH/sandhi_splitter/split.sh $SCLINSTALLDIR $temp_files_path $LTPROCBIN $temp_files_path/$fbn.out
      fi
      if [ $SANDHI = "NO" ] ; then
        cp $temp_files_path/$fbn.out $temp_files_path/$fbn.out.orig
        $ANU_MT_PATH/sandhi_splitter/copy_field.pl < $temp_files_path/$fbn.out.orig > $temp_files_path/$fbn.out
      fi
###########
#      /usr/bin/time -f "%Uuser %Ssystem %Eelapsed %PCPU (%Xtext+%Ddata %Mmax)k\n%Iinputs+%Ooutputs (%Fmajor+%Rminor)pagefaults %Wswaps %C\n" 
$ANU_MT_PATH/morph/morph.sh $SCLINSTALLDIR $temp_files_path/$fbn.out $temp_files_path/$fbn.mo_all $temp_files_path/$fbn.mo_prune $temp_files_path/$fbn.mo_kqw $LTPROCBIN
#       if [ $DEBUG = "OFF" ]; then 
#         rm $temp_files_path/$fbn.mo_all $temp_files_path/$fbn.mo_prune $temp_files_path/$fbn.mo_kqw
#       fi

    # $2.unkn contains the unrecognised words
    # $2.mo_all: Monier williams o/p
    # $2.mo_prune: After pruning with Apte's dict
    # $2.mo_kqw: After adding derivational morph analysis
  fi

# When Heritage splitter is called, scl parser and other modules are invoked by sktreader. So this piece of code iss now redundant.
#  if [ $MORPH = "GH" ] ; then
#     Heritage_Input="YES"
#     $HERITAGE_PATH/ML/reader_plugin < $TMP_DIR_PATH/$3 > $temp_files_path/$3.gh
#     $ANU_MT_PATH/Heritage_morph_interface/Heritage2anusaaraka_morph.sh < $TMP_DIR_PATH/tmp_$fbn/$fbn.gh > $TMP_DIR_PATH/tmp_$fbn/$fbn.out
#  fi
#cp $temp_files_path/$fbn.out $temp_files_path/$fbn.pre_parse_out

###########
#     # First argument: Name of the file
#     # Second argument: no of parses
#     # Third argument: Name of the file with kaaraka analysis for annotation
# Fields 9 and 10: morph analysis corresponding to the kaaraka role and kaaraka role in the 10th field
#     /usr/bin/time -f "%Uuser %Ssystem %Eelapsed %PCPU (%Xtext+%Ddata %Mmax)k\n%Iinputs+%Ooutputs (%Fmajor+%Rminor)pagefaults %Wswaps %C\n" 
$ANU_MT_PATH/kAraka/shabdabodha.sh $SCLINSTALLDIR $GraphvizDot $Heritage_Input $temp_files_path $fbn.out $fbn.kAraka $OUTSCRIPT $PARSE $TEXT_TYPE $ECHO 
cp $temp_files_path/$fbn.out $temp_files_path/$fbn.post_parse_out
 fi  # PARSE != AVAILABLE ends here
#
###########
# anaphora in the 11th field
     $ANU_MT_PATH/anaphora/anaphora.pl $SCLINSTALLDIR $ANU_MT_PATH/anaphora < $temp_files_path/$fbn.out > $temp_files_path/tmp
     mv $temp_files_path/tmp $temp_files_path/$fbn.out
#    cp $temp_files_path/tmp $temp_files_path/$fbn.out


############
# wsd in the 12th field
    $ANU_MT_PATH/wsd/wsd_rules.sh $SCLINSTALLDIR $temp_files_path $fbn.out $fbn.wsd $fbn.wsd_upapaxa
#    if [ $DEBUG = "OFF" ]; then 
#      rm $temp_files_path/$fbn.wsd $temp_files_path/$fbn.wsd_upapaxa
#    fi
###########
### Map to hindi
# Color Code in the 13th field
# Chunk/LWG in the 14th field
# map o/p in the 15th field and lwg o/p in 16th field
# gen o/p in the 17th field
    $ANU_MT_PATH/interface/add_colorcode.pl < $temp_files_path/$fbn.out |\
    $ANU_MT_PATH/chunker/lwg.pl |\
    $ANU_MT_PATH/map/add_dict_mng.pl $SCLINSTALLDIR $SHMT_PATH/data ONE |\
    $ANU_MT_PATH/map/lwg_avy_avy.pl $SCLINSTALLDIR $SHMT_PATH/data hi  |\
    $ANU_MT_PATH/hnd_sent_gen/agreement.pl $SCLINSTALLDIR $SHMT_PATH/data $ANU_MT_PATH/hnd_sent_gen  |\
    $ANU_MT_PATH/hnd_sent_gen/call_gen.pl $SCLINSTALLDIR |\
    $ANU_MT_PATH/interface/modify_mo_for_display.pl $SCLINSTALLDIR > $temp_files_path/ttt
    mv $temp_files_path/ttt $temp_files_path/$fbn.out
#
##########
    $ANU_MT_PATH/translation/translate.sh $SCLINSTALLDIR $my_converter_wxHindi < $temp_files_path/$fbn.out > $temp_files_path/../$3_trnsltn
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
  cut -f1-7,9-10,11,13,16,17 $temp_files_path/$fbn.out |\
  perl -p -e 's/<([sa])>/<\@$1>/g' |\
  perl -p -e 's/<\/([sa])>/<\/\@$1>/g' |\
  $my_converter |\
  $ANU_MT_PATH/interface/gen_xml.pl 10 |\
  xsltproc $ANU_MT_PATH/interface/xhtml_unicode_sn-hi.xsl - |\
  $ANU_MT_PATH/interface/add_dict_ref.pl $OUTSCRIPT $HTDOCSDIR/scl |\
  perl -p -e $cmd |\
  perl -p -e $cmd1 |\
  perl -p -e $cmd2 > $temp_files_path/../$3.html

$ANU_MT_PATH/reader_generator/extract.pl < $temp_files_path/$fbn.out | $my_converter > $temp_files_path/table.csv
#if [ $DEBUG = "OFF" ]; then 
#   rm -rf $temp_files_path/tmp* $temp_files_path/in* $temp_files_path/wsd_files
#fi
fi
