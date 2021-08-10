#!/usr/bin/env python3

# This program is written by Sukhada.
# It takes Hindi verb root as input and returns Hindi causal form of the input.
# Ex. jI -> jilA, jA -> Beja, paDa -> paDA, kAMpa -> kaMpA
# To run: python3 causal_verb_handler.py <Hindi verb root>
# Ex. python3 causal_verb_handler.py paDa
# Output: paDA


import sys
inp = sys.argv[1] # Hindi verb root
hi_v = inp.strip()
apavadaList = {'jA':'Beja', 'parosa':'parosavA', 'KA':'KilA', 'lipata':'lapeta', 'lapeta':'lipatavA', 'batora':'batoravA', 'le':'livA', 'A':'bulA', 'PEla':'PElA', 'PElA':'PElavA', 'wEra':'wErA', 'wErA':'wEravA', 'Pata':'PAda', 'piGala':'piGAla', 'piGAla':'piGalavA', 'xOda':'xOdA', 'xOdA':'xOdavA', 'CUta':'Coda', 'tUta':'woda', 'Pata':'PAda','PUta':'Poda','bika':'beca','dUba':'dubo', 'BIga':'Bigo', 'Bigo':'BigavA', 'gA':'gavA','raha':'raKa' }

def secondLastVowel(s):
    c = 0
    for ch in s[::-1]:
        if ch in 'aAiIuUeEoO':
            c += 1
        if c == 2:
            return ch, s.index(ch)


try:
    if hi_v in apavadaList:
       print(apavadaList[hi_v])
    elif hi_v.endswith('_ho'):
       print(hi_v[0:-3] + '_kara')                  # 'vyApwa_ho' -> 'vyApwa_kara'
    elif hi_v.endswith('_le'):
       print(hi_v[0:-3] + '_livA')                  # 'vyApwa_ho' -> 'vyApwa_kara'
    elif hi_v.endswith('_kara'):
       print(hi_v[0:-1] + 'A')                      # 'prawIkRA_kara' -> 'prawIkRA_karA'
    elif hi_v.endswith('I') or hi_v.endswith('e'):         # 'jI', pI, xe
        print(hi_v[0:-1] + 'ilA')                   # 'jilA', pilA, xilA
    elif hi_v.endswith('U'):                       # 'cU', CU
        print(hi_v[0:-1] + 'uA')                    # 'cuA', CuA
    elif hi_v.endswith('o'):                       # ro
        print(hi_v[:-1] + 'ulA')                    # rulA
    elif hi_v.endswith('a'):
        if secondLastVowel(hi_v)[0] == 'A':                                                          # kAzpa, jAga
            print(hi_v[:secondLastVowel(hi_v)[1]] + 'a' + hi_v[secondLastVowel(hi_v)[1]+1:-1] + 'A')  # kazpA, jagA
        elif secondLastVowel(hi_v)[0] == 'I':                                                        # sIMca
            print(hi_v[:secondLastVowel(hi_v)[1]] + 'i' + hi_v[secondLastVowel(hi_v)[1]+1:] + 'vA')   # siMcavA
        elif secondLastVowel(hi_v)[0] == 'U':                                                        # kUta
            print(hi_v[:secondLastVowel(hi_v)[1]] + 'u' + hi_v[secondLastVowel(hi_v)[1]+1:] + 'vA')   # kutavA
        elif secondLastVowel(hi_v)[0] == 'o':                                                        # joda, sikoda, Coda
            print(hi_v[:secondLastVowel(hi_v)[1]] + 'u' + hi_v[secondLastVowel(hi_v)[1]+1:] + 'vA')   # judavA, sikudavA, CudavA
        elif secondLastVowel(hi_v)[0] == 'e' or secondLastVowel(hi_v)[0] == 'E' :                    # PeMka,  xeKa, bETa
            print(hi_v[:secondLastVowel(hi_v)[1]] + 'i' + hi_v[secondLastVowel(hi_v)[1]+1:-1] + 'A')  # PiMkvA, xiKA, biTA
        else:
            print(hi_v[0:-1] + 'A')                # 'pakadA', paDA
    elif hi_v.endswith('A'):
        print(hi_v[0:-1] + 'avA')                  #  'pakavA'
    else:
        print(inp)
except:
     print('Warning ==================\n SOME ERROR, PLEASE CHECK \n==========================\n')


# jA -> Beja, KA -> KilA,KavA, gA -> gavA, gaMvA ->  gaMvavA???, CA -> ???, pA -> mil,Does_not_take_Nic???, BA -> ???, Gera -> GiravA???, Ko -> KovA,KuvA??, ho ->
# batora , KaMKAra, lapeta, nApanA

#SoBA_xe, SuB2,v,SoBA_xe,xIpwO
#suh1,v,wqpwa_ho^saha^prawiroXa_kara,cakyarWe
#SumB2,v,sunxara_ho^SoBAyAn_ho,SoBArWe
#SunX1,v,SuxXa_ho^paviwra_ho,SuxXO
