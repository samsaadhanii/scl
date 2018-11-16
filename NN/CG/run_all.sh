j=1;
for i in `cat tests/test-28feb.txt`
do
echo $j
echo $i | ./nne2diagram.out > $j.dot
dot -Tjpg -o$j.jpg $j.dot
j=`expr $j + 1`
done
