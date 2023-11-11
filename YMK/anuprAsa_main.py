#wawoZruNaparispanxamanxIkqwavapuH  SaSI. xaXre kAmaparikRAmakAminIgaNdapANduwAm..        

import sys
import re
from inp_trans import escape_vowel1
from anu_processor import inp_processor_anuprasa
#import json
#import markupsafe

mode=sys.argv[1]
out_encoding=sys.argv[2]
user_input = input()
result=inp_processor_anuprasa(user_input)
#print (result)

if mode == "json":
   print(result)
else:
   print ("<@table>")
   for x in result:
       print ("<@tr><@td><@font @color=\"@blue\">")
       print (x["@prakAra"])
       print ("</@font></@td>")
       if x["@prakAra"] == "anwyAnuprAsa" or x["@prakAra"] == "antyānuprāsa":
            outp = x["@outp"]
            for y in outp:
               print ("<@tr><@td></@td><@td><@font @color=\"@SlateBlue\">",y["@prakAra"],"</@font></@td>")
               yy1 = re.sub("_","<@font @color=\"@blue\">",y["@outp"])
               yy2 = re.sub("\*","</@font>",yy1)
               print ("<@td><@font @color=\"@magenta\">",yy2,"</@font></@td></@tr>")
       elif x["@prakAra"] == "SqwyanuprAsa" or x["@prakAra"] == "śṛtyanuprāsa":
            outp = x["@outp"]
            for y in outp:
               print ("<@tr><@td></@td><@td><@font @color = \"@SlateBlue\">",y["@prakAra"],"</@font></@td>")
               if out_encoding == "IAST":
                  outparray1 = y["@outp"]
               else:
                  outparray1 = escape_vowel1(y["@outp"])
               outparray2 = re.sub("_","<@font @color=\"@blue\">",outparray1)
               outparray = re.sub("\*","</@font>",outparray2)
               print ("<@td><@font @color=\"@magenta\">",outparray,"</@font></@td></@tr>")
       else:
          if out_encoding == "IAST":
             outparray1 = x["@outp"]
          else:
             outparray1 = escape_vowel1(x["@outp"])
          outparray2 = re.sub("_","<@font @color=\"@blue\">",outparray1)
          outparray = re.sub("\*","</@font>",outparray2)
          print ("<@td></@td><@td><@font @color=\"@magenta\">",outparray,"</@font></@td></@tr>")
   print("</@table>")
