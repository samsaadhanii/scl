for ((  i = 1 ;  i <= 271;  i++  ))
do
  echo "Welcome $i times"
  dot -Tjpg -o $i.jpg $i.dot
done
