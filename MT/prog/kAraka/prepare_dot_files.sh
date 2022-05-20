#!/bin/sh


SCLINSTALLDIR=$1
GraphvizDot=$2
OUTSCRIPT=$3
SENT_NO=$4
PROGRAM=$5
MORPHFILE=$6
PARSEFILE=$7
MYPATH=$8
parseno=$9

ANU_MT_PATH=$SCLINSTALLDIR/MT/prog

if [ $OUTSCRIPT = "DEV" ] ; then
 $SCLINSTALLDIR/converters/ri_skt < $MORPHFILE | $SCLINSTALLDIR/converters/iscii2utf8.py 1 | perl -pe 's/@//g' > ${MORPHFILE}.out
 kArakaName=$ANU_MT_PATH/kAraka/list_n/kAraka_names_dev.txt
fi

if [ $OUTSCRIPT = "IAST" ] ; then
 $SCLINSTALLDIR/converters/wx2utf8roman.out < $MORPHFILE > ${MORPHFILE}.out
 kArakaName=$ANU_MT_PATH/kAraka/list_n/kAraka_names_roman.txt
fi

$ANU_MT_PATH/kAraka/$PROGRAM $SCLINSTALLDIR $GraphvizDot $OUTSCRIPT $SENT_NO ${MORPHFILE}.out $kArakaName $MYPATH $parseno < $PARSEFILE
