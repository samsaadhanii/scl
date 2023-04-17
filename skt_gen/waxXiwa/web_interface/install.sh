for i in `ls *.html`
do
	perl ./add_url_install.pl < $i > $1/$i
done
