./nne2diagram.out  < $1 > a.dot
dot -Tjpg -oa.jpg a.dot
eog a.jpg
