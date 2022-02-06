for i in `ls *.html`
do
	perl ./add_url.pl < $i > jnk
       mv jnk $i	
done
