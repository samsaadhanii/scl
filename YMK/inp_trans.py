#import re

def escape_vowel1(sen):
    vowel = ['a', 'A', 'e', 'E', 'i', 'I', 'o', 'O', 'u', 'U', 'q', 'Q', 'L']
    out_sen = ""
    ind = 0
    while ind < len(sen):
          now = sen[ind]
          if ind == 0:
             pre = ""
          else:
             pre = sen[ind - 1]
          if ind + 1 < len(sen):
             nxt = sen[ind + 1]
          else:
             nxt = ""
           
          if now == "*":
             if nxt in vowel:
                if ind + 2 < len(sen) and sen[ind + 2] in ['H', 'M']:
                   out_sen = out_sen + nxt + sen[ind + 2] + now
                   ind += 3
                elif ind + 2 < len(sen) and sen[ind + 2] in vowel:
                   out_sen = out_sen + nxt + now + sen[ind + 2]
                   ind += 3
                else:
                   out_sen = out_sen + nxt + now
                   ind += 2
             elif nxt in ['H','M'] :
                out_sen = out_sen + nxt + now 
                ind += 2      
             else:
                out_sen = out_sen + now
                ind += 1
          else:
             out_sen += now
             ind += 1
    return out_sen
