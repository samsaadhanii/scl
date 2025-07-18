import sys

import re

import xvanxva_analysis as xa

script, in_, out_ = sys.argv


with open(in_, "r", encoding="utf-8") as f:
    in_contents = f.read()

in_lines = list(filter(None, in_contents.split("\n")))

new_lines = []
compound_components = []
compound_components_iic_form = []

cpd_details = []

for line in in_lines:
    items = line.split("\t")
    
    word = items[1]
    id_ = items[0].split(".")
    
    if len(id_) == 3:
        sent_id = id_[0]
        wrd_id = sent_id + "." + id_[1]
        cmpnt_id = id_[2]
    elif len(id_) == 2:
        wrd_id = id_[0]
        cmpnt_id = id_[1]
    
    sandhied_word = items[2]
    morphs = items[5]
    
#    print(morphs)
    # NOTE: Check each of the morphs
    
    if "kqw_pratipadika" in morphs:
        prAwipaxika = re.sub(r'^.*?<kqw_pratipadika:(.*?)>.*?$', r'\1', morphs)
    elif morphs:
        prAwipaxika = re.sub(r'^(.*?)<.*?$', r'\1', morphs)
    else:
        # If there is no morph, then assign the word directly
        prAwipaxika = word.replace("-", "")
    
    prAwipaxika = prAwipaxika.replace("-", "")
    # Collect all the components first and then 
    # run xvanxva analysis on the entire compound
    if word.endswith("-"): # Includes all the iics
        compound_components.append(prAwipaxika)
        compound_components_iic_form.append(word.replace("-", ""))
        cpd_details.append(line)
    elif word.startswith("-") and not word.endswith("-"): # For the ifcs
        compound_components.append(prAwipaxika)
        compound_components_iic_form.append(word.replace("-", ""))
        cpd_details.append(line)
        
        # These markers are identifiers for xvanxva compounds
        # 0 - not a part of any xvanxva compound
        # 1 - pUrvapaxa (iic) of a xvanxva compound
        # 2 - uwwarapaxa (ifc) of a xvanxva compound
        # These are used ahead for merging the xvanxva compounds with an "_"
        
        cpd_markers = xa.check_all("-".join(compound_components))
        
        # NOTE: Add condition to check if the markers contain 1 or 2
        # Else, continue to next line
        
        # Iterated for the updated ids if xvanxva compounds are found
        cur_cmpnt_id = 0
        
        compound_lines = []
        final_cpd_lst = []
        
        new_compound = []
        new_compound_iic_form = []
        for i in range(len(compound_components)):
            if cpd_markers[i] == 0: # Indicates not a part of xvanxva compound
                cur_cmpnt_id += 1
                new_cmpnt_id = wrd_id + "." + str(cur_cmpnt_id)
                final_cpd_lst.append(compound_components[i])
                compound_lines.append("\t".join((new_cmpnt_id, "\t".join(cpd_details[i].split("\t")[1:]))))
            elif cpd_markers[i] == 1: # iic of a xvanxva compound
                # new_compound.append(compound_components[i])
                new_compound.append(compound_components[i])
                new_compound_iic_form.append(compound_components_iic_form[i])
            elif cpd_markers[i] == 2: # ifc of a xvanxva compound
                new_xvanxva_cpd = new_compound + [ compound_components[i] ]
                new_xvanxva_cpd_iic_form = new_compound_iic_form + [ compound_components_iic_form[i] ]
                
                # For including the inflected word for the final component of the overall compound
                if i == len(compound_components) - 1:
                    new_compound_iic_form.append(word.replace("-", ""))
                else:
                    new_compound_iic_form.append(compound_components_iic_form[i])
                
                new_cpd_str = "_".join(new_compound_iic_form)
                final_cpd_lst.append(new_cpd_str)
                
                # All the entries in the morph analysis corresponding to the prAwipaxika
                # of the the component previously stored are replaced with the updated
                # compound string
                # This creates a problem when there are multiple different prAwipaxikas 
                # for the same word.  Hence use the next approach
                last_prAwipaxika = compound_components[i]
                last_prAwipaxika_iic_form = compound_components_iic_form[i]
                new_xvanxva_cpd_str = "_".join(new_xvanxva_cpd)
                new_xvanxva_cpd_str_iic_form = "_".join(new_xvanxva_cpd_iic_form)
                last_cmpnt_details_str = cpd_details[i].replace(last_prAwipaxika,new_xvanxva_cpd_str)
                last_cmpnt_details = last_cmpnt_details_str.replace(last_prAwipaxika_iic_form,new_xvanxva_cpd_str_iic_form).split("\t")
                
                # To check for possible stem differences in the morph analysis
                # and replace with new compound prAwipaxika
#                new_cpd_details = re.sub(r'\t[^<]+?(<[^\t]+?)', rf'\t{new_xvanxva_cpd_str}\1', cpd_details[i])
#                new_cpd_details = re.sub(r'/[^<]+?(<[^/]+?)', rf'/{new_xvanxva_cpd_str}\1', cpd_details[i])
                # incomplete
                
                # To insert "-" accordingly
                if cur_cmpnt_id == 0:
                    if i < len(compound_components) - 1:
                        new_cpd_str = new_cpd_str + "-"
                elif i == len(compound_components) - 1:
                    new_cpd_str = "-" + new_cpd_str
                else:
                    new_cpd_str = "-" + new_cpd_str + "-"
                
                cur_cmpnt_id += 1
                new_cmpnt_id = wrd_id + "." + str(cur_cmpnt_id)
                
                compound_lines.append("\t".join((new_cmpnt_id, new_cpd_str, "\t".join(last_cmpnt_details[2:]))))
                
                new_compound = []
                new_compound_iic_form = []
        
        first_items = compound_lines[0].split("\t")
        
        # print(first_items)
        # print(final_cpd_lst)
        new_items = (first_items[0], first_items[1], "-".join(final_cpd_lst), "\t".join(first_items[3:]))
        
        new_lines += [ "\t".join(new_items) ] + compound_lines[1:]
        
        compound_components = []
        cpd_details = []        
        
    else:
        new_lines.append(line)
    

out_file = open(out_, "w", encoding="utf-8")
out_file.write("\n".join(new_lines))
out_file.close()
    
