for i in `ls *.xml`
do
	echo $i
	grep -v jAwi $i | grep -v upAXi | grep -v is_a_part | grep -v kind_of > Apte_dict/$i
done
