#rm $1
#for i in `ls *.xml`
#do
#perl get_nouns.pl < $i >> $1
##echo $i
##sh N1 $i | wc
#done

/home/ambaji/scl/converters/utf82wx.sh /home/ambaji/scl < $1 > $1_wx

grep ' puM\*' $1_wx > masc
grep ' napuM\*' $1_wx >> neut
grep ' swrI\*' $1_wx >> fem
grep ' swrI$' $1_wx >> fem
grep ' vi\*' $1_wx >> masc
grep ' vi\*' $1_wx >> neut
grep ' vi\* puM\*' $1_wx >> masc
grep ' avya\*' $1_wx > Avy
grep ' kri\* vi\*' $1_wx >> Avy
grep ' kq\* vi\*' $1_wx >> Avy
grep ' saM\* kq\*' $1_wx >> masc
grep ' saM\* kq\*' $1_wx >> neut
grep ' BU\* ka\* kq\*' $1_wx >> neut
grep ' BU\* ka\* kq\*' $1_wx >> masc
