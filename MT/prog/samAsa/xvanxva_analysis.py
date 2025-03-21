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
