OUTENCODING=$4

CGIDIR=$5

if [ $OUTENCODING = "DEV" ] ; then
$CGIDIR/$SCL_CGI/amarakosha/relations.pl $1 $2 $3 $4 | $CGIDIR/$SCL_CGI/converters/ri_skt | $CGIDIR/$SCL_CGI/converters/iscii2utf8.py 1
fi
if [ $OUTENCODING = "IAST" ] ; then
$CGIDIR/$SCL_CGI/amarakosha/relations.pl $1 $2 $3 $4 | $CGIDIR/$SCL_CGI/converters/wx2utf8roman.out
fi
