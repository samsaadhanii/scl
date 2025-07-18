import os, sys

xvanxva_samples = [
    "rAma-lakRmaNa",
    "rAma-lakRmaNa-Barawa-SawruGna",
    "sIwA-rAma-lakRmaNa",
    "sIwA-ramA",
    "sIwA-rAma",
    "rAma-kqRNa",
    "rAxA-kqRNa",
    "Barawa-SawruGna",
    "wapas-svAXyAya",
    "lava-kuSa",
    "jFAna-yoga",
    "mAna-moha",
    
    # From Bagavad-gIwA
    "cara-acara", # 11_007
    "mAna-apamAna", # 06_007, 12_018
    "SIwa-uRNa-suKa-xuHKa", # 02_014, 06_007, 12_018
    "ninxA-swuwi", # 12_018
    "apara-para", # 16_008
    "aparaH-para", # 16_008
    "suhqw-miwra-ari-uxAsIna-maXyasWa-xveRya-banXu", # 06_009
    "Bava-apyaya", # 11_002
    "Axi-maXya-anwa", # 11_019
    "SaSin-sUrya", # 07_008, 11_019
    "kAma-kroXa", # 16_012, 05_026, 05_023
    "vakwra-nayana", # 11_011 - 11_009-011
    "mAlya-ambara", # 11_011 - 11_009-011
    "kArya-akArya", # 16_024, 18_030
    "yajFa-wapas", # 05_029
    "rAga-xveRa", # , 02_064, 03_034, 18_023, 18_051, 18_053 (18_051-53)
    "vihAra-SayyA-Asana-Bojana", # 11_041
    "kAya-Siras-grIva", # 06_013-014
    "ruxra-Axiwya", # 11_022
    "ganXarva-yakRa-asura-sixXa", # 11_022
    "guNa-karman", # 03_028, 04_013
    "prANa-apAna", # 04_029, 05_027-028, 15_014
    "janma-karman", # 02_042-044
    "Boga-ESvarya", # 02_042-044
    "kRewra-kRewrajFa", # 13_002, 13_026, 13_034
    "vakwra-newra", # 11_023
    "bAhu-uru-pAxa", # 11_023
    "suKa-xuHKa", # 02_038, 13_020, 15_005
    "lABa-alABa", # 02_038
    "jaya-ajaya", # 02_038
    "keSava-arjuna", # 18_076
    "Axi-anwa", # 05_022
    "SuBa-aSuBa", # 02_057, 09_028, 12_017
    "sawkAra-mAna-pUjA", # 17_018
    "Xqwi-uwsAha", # 18_026
    "sixXi-asixXi", # 18_026
    "cEla-ajina-kuSa", # 06_011-012
    "ciwwa-inxriya", # 06_011-012
    "katu-amla-lavaNa-awyuRNa-wIkRNa-rUkRa-vixAhin", # 17_009
    "xuHKa-Soka-Amaya", # 17_009
    "BIRma-xroNa", # 01_024-025
    "rAga-Baya-kroXa", # 02_056, 04_010
    "aXiBUwa-aXixEva", # 07_030
    "pramAxa-Alasya-nixrA", # 14_008
    "vAc-kAya-mAnasa", # 18_051-53
    "XyAna-yoga", # 18_051-53
    "wqRNA-safga", # 14_007
    "Xana-mAna-maxa", # 16_017
    "suGoRa-maNipuRpaka", # 01_016
    "ahan-rAwra", # 08_017
    "anala-arka", # 11_017
    "yajFa-xAna-wapas-kriyA", # 17_024
    "xeva-xvija-guru-prAjFa", # 17_014
    "Baya-aBaya", # 18_030
    "paNava-Anaka-gomuKa", # 01_013
    "viRaya-inxriya", # 18_038
    "pOrva-xehika", # 06_043
    "kqRi-gOrakRya-vANijya", # 18_044
    "jFAna-vijFAna", # 03_041, 06_008
    "loRta-aSman-kAFcana", # 06_008
    "janma-mqwyu-jarA-xuHKa", # 14_020
    "harRa-amarRa-Baya-uxvega", # 12_015
    "vixyA-vinaya", # 05_018
    "sAfKya-yoga", # 05_004
    "Xarma-kAma-arWa", # 18_034
    "yajFa-wapas-kriyA", # 17_025
    "xamBa-mAna-maxa", # 16_010
    "yakRa-rakRasa", # 10_023
    "ciwwa-Awman", # 04_021
    "Ayus-sawwva-bala-Arogya-suKa-prIwi", # 17_008
    "maharRi-sixXa", # 11_021
    "Sukla-kqRNa", # 08_026
    "SarIra-vAc-manas", # 18_015
    "inxriya-manas-buxXi", # 05_027-028
    "icCA-Baya-kroXa", # 05_027-028
    "harRa-Soka", # 18_027
    "yajFa-xAna-wapas-karman", # 18_003-005
    "icCA-xveRa", # 07_027
    "saw-asaw", # 13_021
    "sukqwa-duRkqwa", # 02_050
    "arWa-kAma", # 02_005
    "kAma-safkalpa", # 04_019
    "pANi-pAxa", # 13_013
    "akRi-Siras-muKa", # 13_013
    "Awman-para", # 16_018
    "mAna-moha", # 15_005
    "xuHKa-suKa", # 12_013-014
    "manas-buxXi", # 08_007, 12_013-014
    "kAla-anala", # 11_025
    "brAhmaNa-kRawriya-viS", # 18_041
    "xyAvA-pqWivI", # 11_020
    "lupwa-piNda-uxaka", # 01_042
    "inxriya-arWa", # 13_007-011
    "janma-mqwyu-jarA-vyAXi-xuHKa-xoRa", # 13_007-011
    "puwra-xAra-gqha", # 13_007-011
    "iRta-aniRta", # 13_007-011
    "jFAna-arWa", # 13_007-011
    "bAhu-uxara-vakwra-newra", # 11_016
    "xamBa-ahafkAra", # 17_005
    "kAma-rAga-bala", # 17_005
    "kArya-kAraNa", # 13_020
    "BIma-arjuna", # 01_004-006
    "Agama-apAyin", # 02_014
    "jarA-maraNa", # 07_029
    "AhAra-vihAra", # 06_017
    "manas-prANa-inxriya", # 18_033
    "BAva-uxBava", # 08_003
    "nixrA-Alasya-pramAxa", # 18_039
    "yakRa-rakRas", # 17_004
    "kAma-rAga", # 07_011
    "xeSa-kAla", # 17_022
    "yoga-kRema", # 02_045
    "aXyAya-aByasana", # 17_015
    "miwra-ari", # 14_024
    "gawa-Agawa", # 09_021
    "pramAxa-moha", # 14_017
    "sWAvara-jafgama", # 13_027
    "vexa-yajFa-aXyayana", # 11_048
    "svapna-avaboXa", # 06_017
    
    # aRtAfgahqxayam
    "Xarma-arWa-suKa", # 01_002
]


def check_xvanxva(cpd):
    """ """
    
    return cpd in xvanxva_samples


def check_all(cpd):
    """ """
    
    xvanxva_compounds = []
    matched_strings = []
    
    final_cpd = ""
    for item in xvanxva_samples:
        if item in cpd:
            xvanxva_compounds.append(item)
            
            cpd_lst = cpd.split("-")
            item_lst = item.split("-")
            n = len(item_lst)
            
            for i in range(len(cpd_lst)):
                if cpd_lst[i:i+n] == item_lst:
                    matched_strings.append((item, i, i + n - 1))
    
    matched_strings.sort(key=lambda x: (-len(x[0].split('-')), x[1]))
    
    non_overlapping = []
    indices_covered = []

    cpd_markers = [ 0 for x in range(len(cpd.split("-")))]

    for s, start, end in matched_strings:
        if not start in indices_covered and not end in indices_covered:
            indices_covered += [ x for x in range(start, end + 1) ]
            non_overlapping.append((s, start, end))
            for i in range(start, end):
                cpd_markers[i] = 1
            cpd_markers[end] = 2
    
#    new_string_lst = []
#    init_marked = False
#    for i in range(len(cpd.split("-"))):
#        if init_marked and :
#            new_string_lst.append(cpd[i])
#        elif i in indices_covered:
#            init_marked = True
        
    
    return cpd_markers


def loop_over(cpd):
    """ """
    
    components = cpd.split("-")
    num_of_components = len(components)
    
#    xvanxva_indices = []
    xvanxva_compounds = []
    
    i = num_of_components
    final_cpd = []
    while (i > 1 and len(xvanxva_compounds) == 0):
        j = 0
        while (j < num_of_components and (j + i <= num_of_components)):
            cur_cpd = "-".join(components[j:(j + i)])
            if check_xvanxva(cur_cpd):
#                cur_cpd_indices = [ x for x in range(j, (j + i)) ]
#                xvanxva_indices.append(cur_cpd_indices)
                xvanxva_compounds.append(cur_cpd)
                xvanxva_compounds
            j += 1
        i -= 1
    
#    final_list = []
#    for l in xvanxva_indices:
#        cur_indices = l[:]
#        cur_lst = []
#        cur_lst.append("-".join([ components[i] for i in l ]))
#        for m in xvanxva_indices:
#            if l == m:
#                continue
#            if not any(y in cur_indices for y in m):
#                cur_indices += m[:]
#                cur_lst.append("-".join([ components[i] for i in m ]))
#        
#        final_list.append(cur_lst)
#        
#    print(final_list)
#    for l in final_list:
#        print(",".join(l))

#    xvanxva_sols = []
#    for l in xvanxva_indices:
#        item = []
#        for i in l:
#            item.append(components[i])
#        xvanxva_sols.append("-".join(item))
    
#    print(xvanxva_compounds)
    if xvanxva_compounds:
        return "-".join(xvanxva_compounds)
    else:
        return cpd
    

def iterate(sentence):
    """ """
    
    modified_words = []
    for word in sentence.split(" "):
        if "-" in word:
            new_word = loop_over(word)
        else:
            new_word = word
        modified_words.append(new_word)
    
    return " ".join(modified_words)


#input_ = "wapas-svAXyAya-sIwA-rAma-lakRmaNa-Barawa-SawruGna-lava-kuSa"
#print(check_all("sIwA-rAma-lakRmaNa"))
#print(check_all("wapas-svAXyAya-nirawa"))
#print(check_all(input_))
#input_ = "wapas-svAXyAya-nirawa"
#input_ = "katu-amla-lavana"

#print(input_, check_all(input_))
#print(input_, loop_over(input_))

# Input - Sandhi-split sentence
#print(iterate(sys.argv[1]))
