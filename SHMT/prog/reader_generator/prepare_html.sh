#/home/ambaji/scl/SHMT/prog/reader_generator/convert_anvya.pl < $1_a.txt |\
#/home/ambaji/scl/SHMT/prog/reader_generator/convert.pl < $1_a.txt > $1_a.html

source ../../../paths.sh
$SCLINSTALLDIR/SHMT/prog/reader_generator/convert.pl $SCLINSTALLDIR $2 < $1.txt > $1.html

cut -f1,2,3,7 $1.txt  | $SCLINSTALLDIR/SHMT/prog/reader_generator/generate_figs.pl 
rm -rf $1
mkdir $1 
cp $SCLINSTALLDIR/SHMT/prog/reader_generator/style_script/*.js $1
cp $SCLINSTALLDIR/SHMT/prog/reader_generator/style_script/*.css $1
cp $SCLINSTALLDIR/SHMT/prog/reader_generator/style_script/rows.html $1
mv *.jpg $1.html $1
#mv $1_a.txt $1
