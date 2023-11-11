#wawoZruNaparispanxamanxIkqwavapuH  SaSI. xaXre kAmaparikRAmakAminIgaNdapANduwAm..	

import sys
from ymk_processor import inp_processor_yamaka
#import markupsafe

result={}

mode=sys.argv[1]
user_input = input()
(result,list_final,pp1,pp2,pp3,pp4)=inp_processor_yamaka(user_input)
   
if mode == "json":
   print(result)
else:
  print ("<@table>")
  for x in result:
    print ("<@tr><@td @colspan=\"3\", @style=\"@text-@align: @center\"><@font @color=@red>",x["@author"],"</@font></@td></@tr>")
    outp=x["@outp"]
    for y in outp:
      print ("<@tr><@td><@font @color=@blue>",y["@yamaka"],"</@font></@td>")
      print ("<@td><@font @color=@magenta>",y["@prakAra"],"</@font></@td></@tr>")
  print("</@table>")
