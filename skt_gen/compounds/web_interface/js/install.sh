mkdir $2
for i in `ls *.$1`
do
	perl ./add_url_install.pl < $i > $2/$i
done
