source ../../../paths.sh
$myPATH=$CGIDIR/$SCL_CGI
$myPATH/MT/prog/reader_generator/convert.pl $myPATH $2 < $1.txt > $1.html

cut -f1,2,3,7 $1.txt  | $myPATH/MT/prog/reader_generator/generate_figs.pl 
rm -rf $1
mkdir $1 
cp $myPATH/MT/prog/reader_generator/style_script/*.js $1
cp $myPATH/MT/prog/reader_generator/style_script/*.css $1
cp $myPATH/MT/prog/reader_generator/style_script/rows.html $1
mv *.jpg $1.html $1
#mv $1_a.txt $1
