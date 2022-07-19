OUTENCODING=$4

SCLINSTALLDIR=$5

if [ $OUTENCODING = "DEV" ] ; then
$SCLINSTALLDIR/amarakosha/relations.pl $1 $2 $3 $4 | $SCLINSTALLDIR/converters/ri_skt | $SCLINSTALLDIR/converters/iscii2utf8.py 1
fi
if [ $OUTENCODING = "IAST" ] ; then
$SCLINSTALLDIR/amarakosha/relations.pl $1 $2 $3 $4 | $SCLINSTALLDIR/converters/wx2utf8roman.out
fi
