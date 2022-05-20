#!/bin/bash
# $1  src_dir_path; "Story-I"
# $2  total csv files; "10"
# $3  target; "S-1"

source ../../../paths.sh

$SCLINSTALLDIR/MT/prog/reader_generator/prepare_story_file.pl $1 $2 |\
cut -f1-3,5-11 > $3.txt
count=`head -1 $3.txt | perl -pe 's/\t/\n/g' | wc -l`
$SCLINSTALLDIR/MT/prog/reader_generator/prepare_html.sh $3 $count
rm $3.txt
