The input is stored in the file 
"read_input.txt"
The input is in the following format:
vipra wqwIyA pul ekavacana
It has four entries separated by space, 
1. Noun
The noun should be one of those enlisted in the file "prAwipaxika". If another noun is to be added, it has to be added in another line in the file.
2. viBakwi
Any of the 8 viBakwi in w-x format, as praWamA, xviwIyA etc.
3. lifga
The lifga as 'pul', 'swrI' or 'napufsaka'
4. vacana
The vacan as 'ekavacana', 'xvivacana' or 'bahuvacana'

After the input has been put, we need to run the java file as follows:
javac get_SabdarUpa_new.java
java get_SabdarUpa_new>see_output.txt

It will store the final output in the file "see_output.txt".

If we want to see the complete prakriyA for a noun such as "viSvapA" in all 21 cases, we need to do the following:
put the word in w-x notation in the file "nouns" as

viSvapA pul

Now, run the following commands:

java get_input>read_input.txt
java get_SabdarUpa_new>see_output.txt
