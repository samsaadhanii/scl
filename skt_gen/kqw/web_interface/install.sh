for i in `ls *.pl`
do
	perl ./add_url_install.pl < $i > $1/$i
done

for i in `ls *.cgi`
do
	perl ./add_url_install.pl < $i > $1/$i
done
