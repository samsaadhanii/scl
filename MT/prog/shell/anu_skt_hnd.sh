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

source $1/paths.sh # This is being invoked by anusaaraka.cgi from scl/MT

FILE_NM=$2
TMP_DIR_PATH=$3
LANG=$4
OUTSCRIPT=$5
MORPH=$6
PARSE=$7
TEXT_TYPE=$8

ANU_MT_PATH=$SCLINSTALLDIR/MT/prog
export LC_ALL=POSIX

my_converters (){
  if [ $OUTSCRIPT = "IAST" ]; then
     my_converter="$SCLINSTALLDIR/converters/wx2utf8roman.out"
     my_converter_wxHindi="$SCLINSTALLDIR/converters/wx2utf8roman.out"
  fi

  if [ $OUTSCRIPT = "DEV" ]; then
     my_converter="$SCLINSTALLDIR/converters/wx2utf8.sh $SCLINSTALLDIR"
     dev_converter="$SCLINSTALLDIR/converters/wx2utf8.sh $SCLINSTALLDIR"
     my_converter_wxHindi="$SCLINSTALLDIR/converters/wxHindi-utf8.sh $SCLINSTALLDIR"
  fi
}

display_usage () {
    echo "Usage: anu_skt_hnd.sh <file> tmp_dir_path hi [DEV|IAST|VH] [NO|YES] [UoHyd|GH] [NO|Partial|Full] [ECHO|NOECHO] [D]."
}

set_tmp_path () {
  fbn=`basename $FILE_NM` #fbn = file base name
  temp_files_path=$TMP_DIR_PATH/${dnm}/tmp_$fbn

  if [ -f "tmp_$fbn"  ] ; then 
    echo "File tmp_$fbn exists. Remove or rename it, and rerun the command."
  else
    mkdir -p $temp_files_path
  fi
}

format () {
      $ANU_MT_PATH/format/format.sh $SCLINSTALLDIR < $TMP_DIR_PATH/$FILE_NM > $temp_files_path/$fbn.out
	cp $temp_files_path/$fbn.out $temp_files_path/$fbn.out.orig
}

sandhi_splitter () {
      $ANU_MT_PATH/sandhi_splitter/copy_field.pl  $temp_files_path/sandhied_$fbn < $temp_files_path/$fbn.out.orig > $temp_files_path/$fbn.out
}

morph () {
  $ANU_MT_PATH/morph/morph.sh $SCLINSTALLDIR $temp_files_path/$fbn.out $temp_files_path/$fbn.mo_all $temp_files_path/$fbn.mo_prune $temp_files_path/$fbn.mo_kqw $LTPROCBIN $temp_files_path
     # $2.unkn contains the unrecognised words
     # $2.mo_all: Monier williams o/p
     # $2.mo_prune: After pruning with Apte's dict
     # $2.mo_kqw: After adding derivational morph analysis
}

shaabdabodha () {
  $ANU_MT_PATH/kAraka/shabdabodha.sh $SCLINSTALLDIR $GraphvizDot $temp_files_path $fbn.out $fbn.kAraka $OUTSCRIPT $PARSE $TEXT_TYPE
# Field 9: morph analysis corresponding to the kaaraka role
# Field 10: kaaraka role
}

anaphora () {
# anaphora in the 11th field
     $ANU_MT_PATH/anaphora/anaphora.pl $SCLINSTALLDIR $ANU_MT_PATH/anaphora < $temp_files_path/$fbn.out > $temp_files_path/tmp
     mv $temp_files_path/tmp $temp_files_path/$fbn.out
}

wsd () {
# wsd in the 12th field
    $ANU_MT_PATH/wsd/wsd_rules.sh $SCLINSTALLDIR $temp_files_path $fbn.out $fbn.wsd $fbn.wsd_upapaxa
}

###########

### Map to hindi
# Color Code in the 13th field
# Chunk/LWG in the 14th field
# map o/p in the 15th field and lwg o/p in 16th field
# gen o/p in the 17th field

hnd_gen () {
    $ANU_MT_PATH/interface/add_colorcode.pl < $temp_files_path/$fbn.out |\
    $ANU_MT_PATH/chunker/lwg.pl |\
    $ANU_MT_PATH/map/add_dict_mng.pl $SCLINSTALLDIR $ANU_MT_PATH/../data hi |\
    $ANU_MT_PATH/map/lwg_avy_avy.pl $SCLINSTALLDIR $ANU_MT_PATH/../data hi  |\
    $ANU_MT_PATH/hn/sent_gen/agreement.pl $SCLINSTALLDIR $ANU_MT_PATH/../data $ANU_MT_PATH/hn/sent_gen  |\
    $ANU_MT_PATH/hn/sent_gen/call_gen.pl $SCLINSTALLDIR  |\
    $ANU_MT_PATH/interface/modify_mo_for_display.pl $SCLINSTALLDIR  > $temp_files_path/ttt
    mv $temp_files_path/ttt $temp_files_path/$fbn.out
}

##########
  hnd_tr () {
    $ANU_MT_PATH/translation/translate.sh $SCLINSTALLDIR $my_converter_wxHindi < $temp_files_path/$fbn.out > $temp_files_path/../${fbn}_trnsltn
 }
##########

 generate_anvaya () {
   $ANU_MT_PATH/reader_generator/extract.pl < $temp_files_path/$fbn.out > $temp_files_path/table.tsv
   #
   ## Temporary commented. Sanal has to fix the programme.
   #$MYPYTHONPATH $ANU_MT_PATH/anvaya/reorder.py -i $temp_files_path/table.tsv -o $temp_files_path/anvaya.tsv -s $SCLINSTALLDIR -t hi
   #
   cut -f1 $temp_files_path/table.tsv > /tmp/1
   cut -f2 $temp_files_path/table.tsv > /tmp/2
   cut -f4- $temp_files_path/table.tsv > /tmp/3
   paste /tmp/1 /tmp/2 /tmp/1 /tmp/3 > $temp_files_path/anvaya.tsv
   $my_converter < $temp_files_path/table.tsv > $temp_files_path/table_outscript.tsv
   $dev_converter < $temp_files_path/table.tsv > $temp_files_path/table_dev.tsv
   $my_converter < $temp_files_path/anvaya.tsv > $temp_files_path/anvaya_outscript.tsv
 }
##########
 #Generate Anvaya order anusaaraka output
 anvaya_anu_op () {
   $ANU_MT_PATH/interface/get_anvaya_order_html.pl $fbn $temp_files_path $OUTSCRIPT  cgi-bin $HERITAGE_CGI A < $temp_files_path/anvaya_outscript.tsv > $temp_files_path/../anvaya_$fbn.html
   $ANU_MT_PATH/interface/get_anvaya_shloka_translation.pl ${temp_files_path}/anvaya_$fbn  ${temp_files_path}/anvaya_${fbn}_wx_trnsltn < $temp_files_path/anvaya.tsv
 }

#Generate Shloka order anusaaraka output
 shloka_anu_op () {
  $ANU_MT_PATH/interface/get_anvaya_order_html.pl $fbn $temp_files_path $OUTSCRIPT  cgi-bin $HERITAGE_CGI S < $temp_files_path/anvaya_outscript.tsv > $temp_files_path/../shloka_$fbn.html
 }

################

 anvaya_order_tr () {
  $my_converter < $temp_files_path/anvaya_${fbn}_wx_trnsltn > $temp_files_path/anvaya_${fbn}_trnsltn
 }

################

 csv2xlsx () {
   $MYPYTHONPATH $ANU_MT_PATH/reader_generator/csv2xlsx.py $temp_files_path/table_outscript.tsv $temp_files_path/table.xlsx
 }

########      Main routine starts here

if [ $# -lt 1 ] ; then
  display_usage
else 
  my_converters
  set_tmp_path

   if [ $PARSE != "AVAILABLE" ] ; then
    if [ $MORPH = "UoHyd" ] ; then

      format
      #cp $temp_files_path/$fbn.out $temp_files_path/$fbn.out.orig
      sandhi_splitter
    `date >> $temp_files_path/err`;
      morph
    `date >> $temp_files_path/err`;

    fi # If Morph = UoHyd ends here
    `date >> $temp_files_path/err`;
    cp $temp_files_path/$fbn.out $temp_files_path/$fbn.out.before_parse
    shaabdabodha
    cp $temp_files_path/$fbn.out $temp_files_path/$fbn.out.after_parse
    `date >> $temp_files_path/err`;

  fi  # PARSE != AVAILABLE ends here
  anaphora
  wsd
  hnd_gen
  hnd_tr
  generate_anvaya
  anvaya_anu_op
  shloka_anu_op
  anvaya_order_tr
  csv2xlsx
fi

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
