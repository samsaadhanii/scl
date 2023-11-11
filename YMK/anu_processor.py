
from collections import defaultdict #for antya_word
import re
import copy
from collections import Counter
import itertools
import json
from ymk_processor import inp_processor_yamaka, answ
#from inp_trans import translit_in, translit_out
# LATA is coming in cheka and cheka not in vr, but if vr is a part of cheka then it should come.
##########################################


#Antyanuprasa-

def last (p1,k2):
	vowel = ['a','A','e','E','i','I','o','O','u','U','q','Q','L']
	k = 0
	# print("i", p1)
	if p1 != ["---"]or p1 !="." or p1 !="..":
		pp1 = []
		# for i in p1:
		for n in range(len(p1)-1,-1,-1):
				if k < k2:
					pp1.append(p1[n])
				if p1[n] in vowel:
					k +=1
		# pp1.reverse()				
	else:
		pp1 = ["---"]		
	return pp1
# padas maMxaMhasaMwaHpulakaMvah,_a,MwaH* goRTaMBramaMwaScaRakapivaMwaH rawinayaMwaHsuvikASamaMwaH priyAMspqSaMwaHsvarivAvasaMwaH
# p1 ['_H', 'a', 'M', 'x', 'a', 'M', 'h', 'a', 's', 'a', 'M', 'w', 'a', 'H', 'p', 'u', 'l', 'a', 'k', 'a', 'M', 'v', 'a', 'h', 'a', 'M', 'w', 'a', 'H*']
def antya_feet(pp1,pp2,pp3,pp4,p1,p2,p3,p4):
	#problem - all anunasikas are changed to M in ymk sp the anuprasa shloka do not match with antyanuprasa.
	# - when the shloka is not in samavrutta the ends are not matched. in keSaH kASaH ...
	a = b = c = d = e = f = g = h = i = 0
	if p1 != ["---"]:
		p1,p2,p3,p4= list(p1),list(p2),list(p3),list(p4)
		# print("p1",p1,p2,p3,p4)	
	
		for n in range(len(pp1)-1,-1,-1):
			n1=int(-n)
			# print(n1)
			if pp1[:n]==pp2[:n]==pp3[:n]==pp4[:n] and a==0:
				# print("n1",p1[n1], pp1[n],"n",n)
				p1[n1-1]="_"+pp1[n] #n1-n gives a negative value, try to make it automatically without adding -1
				p2[n1-1]="_"+pp2[n]
				p3[n1-1]="_"+pp3[n]
				p4[n1-1]="_"+pp4[n]
				
				p1[-1]=pp1[0]+"*"
				p2[-1]=pp2[0]+"*.<@br/>"
				p3[-1]=pp3[0]+"*"
				p4[-1]=pp4[0]+"*..<@br/>"

				a = n 	 
			if pp1[:n]==pp2[:n]==pp3[:n] and b==a==0:
				# feet_d.update({"b":["1","2"]})
				p1[n1-1]="_"+pp1[n] #n1-n gives a negative value, try to make it automatically without adding -1
				p2[n1-1]="_"+pp2[n]
				p3[n1-1]="_"+pp3[n]
				# p4[n1-1]="_"+pp4[n]
				
				p1[-1]=pp1[0]+"*"
				p2[-1]=pp2[0]+"*.<@br/>"
				p3[-1]=pp3[0]+"*"
				p4[-1]=p4[-1]+"..<@br/>"
				b = n
			elif pp1[:n]==pp2[:n]==pp4[:n] and c==a==0:
				p1[n1-1]="_"+pp1[n] #n1-n gives a negative value, try to make it automatically without adding -1
				p2[n1-1]="_"+pp2[n]
				# p3[n1-1]="_"+pp3[n]
				p4[n1-1]="_"+pp4[n]
				
				p1[-1]=pp1[0]+"*"
				p2[-1]=pp2[0]+"*.<@br/>"
				# p3[-1]=pp3[0]+"*"
				p4[-1]=pp4[0]+"*..<@br/>"
				c = n	
			elif pp1[:n]==pp3[:n]==pp4[:n] and d==a==0:
				p1[n1-1]="_"+pp1[n] #n1-n gives a negative value, try to make it automatically without adding -1
				# p2[n1-1]="_"+pp2[n]
				p3[n1-1]="_"+pp3[n]
				p4[n1-1]="_"+pp4[n]
				
				p1[-1]=pp1[0]+"*"
				p2[-1]=p2[-1]+".<@br/>"
				p3[-1]=pp3[0]+"*"
				p4[-1]=pp4[0]+"*..<@br/>"
				d = n	
			elif pp2[:n]==pp3[:n]==pp4[:n] and e==a==0:
				# p1[n1-1]="_"+pp1[n] #n1-n gives a negative value, try to make it automatically without adding -1
				p2[n1-1]="_"+pp2[n]
				p3[n1-1]="_"+pp3[n]
				p4[n1-1]="_"+pp4[n]
				
				# p1[-1]=pp1[0]+"*"
				p2[-1]=pp2[0]+"*.<@br/>"
				p3[-1]=pp3[0]+"*"
				p4[-1]=pp4[0]+"*..<@br/>"
				e = n
				# 2 
			elif pp1[:n]==pp2[:n] and a==b==c==f==0 :
				p1[n1-1]="_"+pp1[n] #n1-n gives a negative value, try to make it automatically without adding -1
				p2[n1-1]="_"+pp2[n]
				# p3[n1-1]="_"+pp3[n]
				# p4[n1-1]="_"+pp4[n]
				
				p1[-1]=pp1[0]+"*"
				p2[-1]=pp2[0]+"*.<@br/>"
				# p3[-1]=pp3[0]+"*"
				p4[-1]=p4[-1]+"..<@br/>"
				f = n	
			elif pp3[:n]==pp4[:n] and a==d==e==g==0:	
				# p1[n1-1]="_"+pp1[n] #n1-n gives a negative value, try to make it automatically without adding -1
				# p2[n1-1]="_"+pp2[n]
				p3[n1-1]="_"+pp3[n]
				p4[n1-1]="_"+pp4[n]
				
				# p1[-1]=pp1[0]+"*"
				p2[-1]=pp2[0]+".<@br/>"
				p3[-1]=pp3[0]+"*"
				p4[-1]=pp4[0]+"*..<@br/>"
				g = n
			elif pp1[:n]==pp3[:n] and a==b==c==d==e==h==0:	
				p1[n1-1]="_"+pp1[n] #n1-n gives a negative value, try to make it automatically without adding -1
				# p2[n1-1]="_"+pp2[n]
				p3[n1-1]="_"+pp3[n]
				# p4[n1-1]="_"+pp4[n]
				
				p1[-1]=pp1[0]+"*"
				p2[-1]=pp2[0]+".<@br/>"
				p3[-1]=pp3[0]+"*"
				p4[-1]=pp4[0]+"..<@br/>"
				h = n
			elif pp2[:n]==pp4[:n] and a==b==c==d==e==i==0:	
				# p1[n1-1]="_"+pp1[n] #n1-n gives a negative value, try to make it automatically without adding -1
				#print("n1=",n1)
				#print("n=",n)
				####p2[n1-1]="_"+pp2[n]
				# p3[n1-1]="_"+pp3[n]
				####p4[n1-1]="_"+pp4[n]
				
				# p1[-1]=pp1[0]+"*"
				p2[-1]=pp2[0]+"*.<@br/>"
				# p3[-1]=pp3[0]+"*"
				p4[-1]=pp4[0]+"*..<@br/>"
				i = n	
	p1,p2,p3,p4 = "".join(p1),"".join(p2),"".join(p3),"".join(p4)

	feet = p1+p2+p3+p4

	# print(a,b,c,d,e,f,g,h,i)			
	# print("p1",p1,"\np2",p2,"\np3", p3,"\np4", p4)	
	return feet

# s1 maMxaM hasaMwaH pulakaM vahaMwaH goRTaM BramaMwaScaRakaMM pivaMwaH . rawiM nayaMwaH suvikASamaMwaH priyAM spqSaMwaH svarivAvasaMwaH.
def antya_word (s1):
# manx_aM*has_anwaH*pulak_aM*vah_anwaH*goRTIMSrayanwaScaRak_aM*pib_anwaH*.<@br/>rawinnay_anwaH*suvikASam_anwaH*priyAMspqS_anwaH*svarivAvas_anwaH*..<@br/>
	# not implemented - dist; freq is right now taken to be more than 1. 
	# vowel = ['a','A','e','E','i','I','o','O','u','U','q','Q','L']
	# print("s1_inp\n", s1)
	ss1 = re.sub ("[Z(\n)(\r)]",r" ",s1)
	ss1=ss1.split()
	# print ("ss1",ss1)
	ind_ss2 = []#list of [ind and [endings]]
	ind_ss1 = []#list of [ind and [endings]]

	n = 0
	for i in ss1:
		last_seqq = last(i,2)
		ind_ss2.append([n,list(reversed(last_seqq))])
		n+=1
	n1 = 0
	for i in ss1:
		last_seq = last(i,1)
		ind_ss1.append([n1,list(reversed(last_seq))])
		n1+=1	
	ind_ss1.sort()
	
	# print("ind_ss2",ind_ss2)
	# print("ind_ss1",ind_ss1)

	# Create a dictionary to store sequences and their indices
	sequence_dict2 = defaultdict(list)

	for index, sequence in ind_ss2:# Convert the sequence list to a tuple to make it hashable
		sequence_key = tuple(sequence)
		sequence_dict2[sequence_key].append(index)

	# Filter sequences with a frequency of more than 1
	freq_gr_2_for2 = [
    	[list(sequence_key), indices]
    	for sequence_key, indices in sequence_dict2.items()
    	if len(indices) > 1
	]

	# print("result",freq_gr_2_for2)

	# Create a list to store sequences and their indices using lists
	sequence_list1 = []

	for index, sequence in ind_ss1:
		found = False
		for item in sequence_list1:
			if item[0] == sequence:
				item[1].append(index)
				found = True
				break
		if not found:
			sequence_list1.append([sequence, [index]])

# Filter sequences with a frequency of more than 1
	freq_gr_2_for1 = [
    	[sequence, indices]
    	for sequence, indices in sequence_list1
    	if len(indices) >= 2
	]
	# print("result1",freq_gr_2_for1)


	# Create a set of all indices covered by larger sequences
	covered_indices = set()
	for sequence in freq_gr_2_for2:
		covered_indices.update(sequence[-1])

# Filter the smaller sequences, retaining only those with uncovered indices
	filtered_freq_gr_1_for1 = []
	for sequence in freq_gr_2_for1:
		smaller_seq, indices = sequence
		uncovered_indices = [index for index in indices if index not in covered_indices]
		if uncovered_indices:
			filtered_freq_gr_1_for1.append([smaller_seq, uncovered_indices])

	# Combine the filtered smaller sequences with the larger sequences
	result = freq_gr_2_for2 + filtered_freq_gr_1_for1
	#dist not calculated
	# print("_fnl", result)

	for sequence in result:
		seq, indices = sequence
		seq1 = "".join(seq)
		# print("seq", seq1)
		seq_pattern = re.compile(re.escape(seq1) + r'\Z')  # Match the end of the string
		for index in indices:
			if re.search(seq1, ss1[index]):
				# print("22")
				ss1[index] = seq_pattern.sub("_" + seq1 + "*", ss1[index])
	ss1 = " ".join(ss1)			
	ss1 = ss1.replace(".",".<@br/>")
	ss1 = ss1.replace(".<@br/>.<@br/>", "..<@br/>")			

	# print(ss1)					

	# print("\nss1_NEW", ss1)
	return ss1	

###################################################
def rmv_spl_char(sen):
	# print("sen",sen)
	spl_char = ['"', "'", "?",'-', "!", ",", ";", "<", ">", "(", ")", "+", "=", "Z", " ","1","2",'3','4','5','6','7','8','9','0','१','२','३','४','५','६','७','८','९','०']
	for n in range(len(sen)): #to get the index of line one ending"."
		if sen[n] == ".":
			break
	plain_sen = ""
	for char in sen:
		if char not in spl_char:
			plain_sen += char
		else:
			pass
	ss11 = list(plain_sen)
	return plain_sen, n, ss11

def answ(ans):
	if re.search(r"M[wWxXn]",ans):		
		ans=re.sub(r"M([wWxXn])",r"n\1",ans)
	if re.search(r"M[kKgGf]",ans):		
		ans=re.sub(r"M([kKgGf])",r"f\1",ans)
	if re.search(r"M[cCjJF]",ans):		
		ans=re.sub(r"M([cCjJF])",r"F\1",ans)
	if re.search(r"M[tTdDN]",ans):		
		ans=re.sub(r"M([tTdDN])",r"N\1",ans)
	if re.search(r"M[ysSRhrlv]",ans):
		pass
	elif re.search("M",ans):
		ans=re.sub("M","m",ans)	
	return ans
	
def seg(s):
	if re.search("([bBcCdDfFgGhjJkKlLmnNpPrRsStTvVwWxXyY])([bBcCdDfFgGhjJkKlLmnNpPrRsStTvVwWxXyY])", s):
		s=re.sub("([bBcCdDfFgGhjJkKlLmnNpPrRsStTvVwWxXyY])([bBcCdDfFgGhjJkKlLmnNpPrRsStTvVwWxXyY])",r"\1-\2",s) 
	return s	

def ak2 (ltf):
	removed=[]
	l=len(ltf)
	count=0
	vowel = ['a','A','e','E','i','I','o','O','u','U','q','Q','L']			 
	if l>0:
		lt=copy.deepcopy(ltf)
		for i in lt:
			for v in vowel:
				for ii in i:
					if v == ii:
						count=count+1
			if count<2:
				ltf.remove(i)
				removed.append(i)		
			count=0
		
	return ltf
	
def dist_lata(ss, lst_lt):
	nlt = []
	for i in lst_lt:
		l = len(i)
		sp_ss = ss.split(i)
		for k in range(0,len(sp_ss)):
#			for s in ss:
			if len(sp_ss[k]) > 0:
				if ss[:len(sp_ss[k])] == sp_ss[k] != "" :
					dis = int(len(sp_ss[k+1]))
				else:
					dis = int(len(sp_ss[k]))
				if dis <= int(l) * 3:
					nlt.append(i)
	return nlt
				
def vowel(s): # can this be used ?
	vowels = ['a','A','e','E','i','I','o','O','u','U','q','Q','L','H',"M"]
	strg =""
	for letter in s:
		if letter in vowels:
			strg += letter + "-"	
		else:
			strg += letter		
	s1=strg.split("-")
	s2=' '.join(s1).split()
	n=len(s2)
	list0=[]
	# dict_list0 = {}
	for j in range(n,1,-1):
		for i in range(1,j):
			pada1=(s2[i-1:j])
			list0.append(pada1)
			# print("pada1",pada1)
	return list0

def ak22 (ltf): #raHKa
	count=0
	vowel = ['a','A','e','E','i','I','o','O','u','U','q','Q','L']		
	lk=[]
	for i in ltf:
		l=len(i)
		l2=int(l/2)
		l3=int(l/3)
		# print("l2", l2, "l3", l3)
		if i[:l2]==i[l2:] :
			# print("iiiiii",i)
			i = i[:l2]
		if i[:l3]==i[l3:l3*2]==i[l3*2:]:
			i =i[:l3]
		lk.append(i)
	# print("lk",lk)		
	ll=len(lk)
	if ll>0:
		lt=copy.deepcopy(lk)
		for i in lt:
			cons = ""	
			for ii in i:
				if ii in vowel:
					count=count+1
				else:
					cons += ii
			# print("cons",cons, set(cons), "iii", i)			
			if len(i) < 6:
				# print(i)
				if len(set(cons)) == 1:
					lk.remove(i)			
			elif count<2:
				lk.remove(i)
				count=0		
			elif count == 2 :
				if "H" in i[:-1] :
					lk.remove(i)	
					count = 0
						
	# 	print("this is my lat", ltf)
	if len(lk) == 0:
		lk = ["-----"]
	return lk

def collat(lst, s):
	# print("lst",lst)
	new_lst = []
	if lst == ['-----']:
		s = lst[0]
	else:
		for i in lst:
			# print("ii", i)
			if "," in i: # when 2 ymks in one answer like ["rama", "shyama"]
				i_lst = i.split(",")
				for il in i_lst:
					il = rmv_spl_char(il)[0] 
					# print("\niiiiiiii",il)
					if re.search(il,s):
						s = re.sub(il,"_"+il+"*", s)
					if il[-1]=="M":
						il = il[:-1]+"M"
						if re.search(il,s):
							s = re.sub(il,"_"+il+"*", s)
					if re.search(answ(il),s):
						s = re.sub(answ(il),"_"+answ(il)+"*", s)		

			else:
				new_lst.append(i)
				if i[-1]=="M":
					il = i[:-1]+"M"
					im = i[:-1]+'m'
					# print("il", il)
					if re.search(il,s):
						s = re.sub(il,"_"+il+"*", s)
					if re.search(im,s):
						s = re.sub(im,"_"+im+"*", s)	
				elif re.search(answ(i),s):
					s = re.sub(answ(i),"_"+answ(i)+"*", s)			
				elif re.search(i,s):
					s = re.sub(i,"_"+i+"*", s)
				
	# print("s",s, "\nnew_lst", new_lst )			

	s = s.replace(".",".<@br/>")
	s = s.replace(".<@br/>.<@br/>", "..<@br/>")
	return s, new_lst
	
	
	
def can_add (s, ss, anu):
	if s != None:
		#anu[4]["@outp"].append({ss : s})		
	        anu[4]["@outp"].append({"@prakAra":ss,"@outp": s})


def Sthan(S, lst, ss):
	varna_l = []
	varna_lst = []
	varna_lst1 = []
	# varna_fnl = []
	for k,v in lst.items():
		if v in S:
			# print("v", v)
			varna_lst.append([k,v])
			varna_l.append(v)
	# print("varna_lst",varna_l)
	varna_l = list(set(varna_l))	
	if len(varna_l) > 1:	
		for n in range(0,len(varna_lst)-1):
			# print("letter", varna_lst[n+1], varna_lst[n] )
			if varna_lst[n+1][0]-varna_lst[n][0] <= 8:
				# print("diff", varna_lst[n+1][0]-varna_lst[n][0] )
				# print("diff2", varna_lst[n+1][0], varna_lst[n][0] )
				# print("diff2", varna_lst[n+1][1], varna_lst[n][1] )
				varna_lst1.append(varna_lst[n])
				varna_lst1.append(varna_lst[n+1])
	ss = [*ss]
	# print("varna_lst1", varna_lst1)
	if len(varna_lst1) > 8: # changed for screenshot, not all highlighted in talavya? 				  
		for ii in varna_lst1:
			ss[ii[0]] = "_"+ii[1]+"*"
		ss = "".join(ss)	
		ss = ss.replace(".",".<@br/>")
		ss = ss.replace(".<@br/>.<@br/>", "..<@br/>")	
		return ss
	else:
		return None
										
###====================================================================	ANUPRASA	====================================
		
def dist_group(trial,k):
	# if k == 1:
	# print("trial", trial)
	sublists = []
	sublist = [trial[0]]  # Start the first sublist with the first element of the trial list
	for i in range(1, len(trial)):
		if trial[i] - trial[i-1] > k*4+1:#changing for screenshot ? before it was - k*3+1
			# print("sublist", sublist)
			sublists.append(sublist)  # Add the current sublist to the list of sublists
			sublist = []  # Start a new sublist
		sublist.append(trial[i])  # Add the current element to the current sublist

	sublists.append(sublist)
	return sublists
	
	
def kngram(k,letters, ind): #used in cheka
	kgram = {}
	ind_g = {}
	ch_ind = {}
	n = len(letters)
	for i in range (0,n):
		gram = (letters[i:i+k])
		i_gram = (ind[i:i+k])
		joint = "".join(gram)
		if len(joint) == k:
			kgram.update({i:joint})
			ind_g.update({i:i_gram})

	freq = {}
	for kk,v in kgram.items():
		kk = []
		for n in range(0,len(kgram)):
			if v == kgram[n]:
#			print(v,n)
#			print(m)
				kk.append(n)
				freq.update({v:kk})
				kk.sort()
	# print("freq",freq)
	freq2 = {}
	for key, value in freq.items():
		if len(value)>1:
			dis = dist_group(value,k)
			chek_d = []
			for d in dis:
				if len(d) == 2:
					chek_d = chek_d + d
			if len(chek_d)>1:		
				freq2.update({key:chek_d})
	# print("\nchek_d", freq2)					
					
	for kk, v in freq2.items():
		v1 = []
#		v2 = []	
		if len(v)> 1:
			for n in range(len(v)):
				v1.extend(ind_g[v[n]])
#			print("\nv1", kk, v1)
			ch_ind.update({kk:v1})				
				
#	uniq_char = ""#for k-k, k-l-k-l  
	if len(ch_ind) > 0:
		# print(ch_ind)
		ch = copy.deepcopy(ch_ind)
		for kk, v in ch.items():
#			print("kk",kk)
			uniq_set = set(kk)
#			print("set",uniq_set)
			if len (uniq_set) != k:
#				print("kk", len(uniq_set), k)
#				return {},{}
				ch_ind.pop(kk)
#	print("ch_ind", ch_ind)																		
	return ch_ind, freq2, freq	

def kngram_vr (k,letters, ind): #used in cheka k= number, letters = cosonants, ind = original ind

	kgram = {} # {index:ngrams}
	ind_g = {} #{index: ngram of original index}
	ch_ind = {} #{ng with freq 2 and anu dustance : original indexes}
	n = len(letters)
	for i in range (0,n):
		gram = (letters[i:i+k])
		i_gram = (ind[i:i+k])
		joint = "".join(gram)
		if len(joint) == k:
			kgram.update({i:joint})
			ind_g.update({i:i_gram})

	freq = {} # {nGram : indexesOfNgrams}
	for kk,v in kgram.items():
		kk = []
		for n in range(0,len(kgram)):
			if v == kgram[n]:
#			print(v,n)
#			print(m)
				kk.append(n)
				freq.update({v:kk})
				kk.sort()
				
	freq2 = {}
	for ng, kk in freq.items():
		v1 = [] #list of ngIndexes with anu distance
		v2 = [] # list of original indexes of letters in oringinal ngrams
		if len(ng) == 1 and len(kk) > 1:
			for n in range(0, len(kk)-1):
				# print("\nkk[n]",ng, kk, kk[n+1],kk[n])
				if kk[n+1] - kk[n] < 8 :	
					v1.append(kk[n])
					v1.append(kk[n+1])
					v2 = v2 + ind_g[kk[n]] + ind_g[kk[n+1]]
#					print("This is V1", v1)	
#					print("v2", v2)
					v1.sort()
					v2.sort()
					v2 = list(set(v2))
					v1 = list(set(v1))
					freq2.update({ng:v1})
					ch_ind.update({ng:v2}) 
						
			# print ("ch_ind", ch_ind)
		elif len(ng) > 1 and len(kk) > 2:
			for n in range(0, len(kk)-1):
				if kk[n+1] - kk[n] <= 8 :	
					v1.append(kk[n])
					v1.append(kk[n+1])
					v2= v2 + ind_g[kk[n]] + ind_g[kk[n+1]]
#					v2.append(vk)
					v2 = list(set(v2))
					v1 = list(set(v1))			
		if k > 1 and len(v1) > 2 :
			v1.sort()
			v2.sort()
			freq2.update({ng:v1})
			ch_ind.update({ng:v2})		
	
#	uniq_char = ""#for k-k, k-l-k-l  
	if len(ch_ind) > 0:
		# print(ch_ind)
		ch = copy.deepcopy(ch_ind)
		for kk, v in ch.items():
#			print("kk",kk)
			uniq_set = set(kk)
#			print("set",uniq_set)
			if len (uniq_set) != k:
#				return {},{}
				ch_ind.pop(kk)
	return ch_ind, freq2, freq	
	
def inp_processor_anuprasa (s1):

#	s1 = user_input
	inp_s1 = s1 #for anuprasa
	#preprocessing of input. - anunasika to M
	ss1 = s1
	if re.search("n[ ]*[wWxXn \.\n]",s1):		
		s1=re.sub("n([ ]*[wWxXn\.\n])",r"M\1",s1)	
	if re.search(r"f[ ]*[kKgGf ]",s1):		
		s1=re.sub(r"f([ ]*[kKgGf ])",r"M\1",s1)
	if re.search(r"F[ ]*[cCjJF ]",s1):		
		s1=re.sub(r"F([ ]*[cCjJF ])",r"M\1",s1)
	if re.search(r"N[ ]*[tTdDN ]",s1):		
		s1=re.sub(r"N([ ]*[tTdDN ])",r"M\1",s1)				
	if re.search(r"m[bBpPm ]",s1):		
		s1=re.sub(r"m([bBpPm ])",r"M\1",s1)# add space also
	
	s1=re.sub("[fFnNm][\.\n]", r"M .",s1)# to check for $
	s1=re.sub("[nmfFN]$",r"M",s1)
	# print("s1",s1)
	s_pd = s1
	check= s1.replace("."," ")
	check=check.split()

	s1 = s1.replace("Z","")
	ss1 = ss1.replace("Z","")
		
	s1 = s1.replace(" ","")# to check
	ss1 = ss1.replace(" ", "") 
	s1 = rmv_spl_char(s1)[0]
	ss1 = rmv_spl_char(ss1)[0]
	# print("ss1",ss1)
	
	ss1 = re.sub ("[ Z(\n)(\r)]",r"",inp_s1)
	
		
# #=============FOR LIST OF NGRAMS WITH FREQ MORE THAN 2===========================
	
	lata = inp_processor_yamaka(inp_s1)[1]
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~Antyanuprasa~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

	p1 = inp_processor_yamaka(inp_s1)[2]
	p2 = inp_processor_yamaka(inp_s1)[3]
	p3 = inp_processor_yamaka(inp_s1)[4]
	p4 = inp_processor_yamaka(inp_s1)[5]

	pp1, pp2, pp3, pp4 = last(p1,2), last(p2,2), last(p3,2), last(p4,2)

	# print(pp1,pp2,pp3,pp4)
	feet = answ(antya_feet(pp1,pp2,pp3,pp4,p1,p2,p3,p4))
	paxa = answ(antya_word(s_pd))

	# print ("\nPADA", paxa)

	# feet = "manxaMhasanwaHpulakaMvah_anwaH*goRTIMSrayanwaScaRakaMpib_anwaH*.<@br/>rawiMnayanwaHsuvikASam_anwaH*priyAMspqSanwaHsvarivAvas_anwaH*..<@br/>"
	# paxa = "manx_aM*has_anwaH*pulak_aM*vah_anwaH*goRTIMSrayanwaScaRak_aM*pib_anwaH*.<@br/>rawiMnay_anwaH*suvikASam_anwaH*priyAMspqS_anwaH*svarivAvas_anwaH*..<@br/>"

	# print(antya_word(s_pd),"\nfeet",feet)

	#=========================================

	x1 = collat(ak22(lata), ss1)[1]
	x = collat(ak22(lata), ss1)[0]
	#print(x)			
	#print("ss1",ss1)

	
	dict_all_let = {}

	for n in range(len(ss1)):
		dict_all_let.update({n:ss1[n]})
	#print("sict_ss1",dict_all_let)

	inp_s1 = re.sub ("[ Z(\n)(\r)]",r"",inp_s1)
	# inp_s1 = rmv_spl_char(inp_s1)[2]
	# print("iiiiiinp_s1",inp_s1)
	
#-----------------------------------------------------------------------------

	#s = Counter(inp_s1)				
	vowels = ['a','A','e','E','i','I','o','O','u','U','q','Q','L','H','M','.','-']

	letters = [l for l in inp_s1 if l not in vowels] # list of letters without vowels
	dict_let = [] # [[indx,letter]]
	ind_l = []#list of indexes
	for n in range(len(ss1)):
	#	for l in letters:
		if ss1[n] not in vowels:
			dict_let.append([n,ss1[n]])
			ind_l.append(n)
		 

	#=======================================CHEKANUPRASA
	# print("letters", letters)
	# print("\nind_l", ind_l)
	hexagram = kngram(6,letters,ind_l)[0]
	pentagram = kngram(5,letters, ind_l)[0]
	quad_gram = kngram(4,letters, ind_l)[0]
	trigram = kngram(3,letters, ind_l)[0]
	bigram = kngram(2,letters, ind_l)[0]
#	onegram = kngram(1,letters, ind_l)[0]
	# trigram1 = kngram(3,letters, ind_l)[1]
	#print("trig3", trigram1)
#	
	total_ng = {**hexagram,**pentagram, **quad_gram, **trigram, **bigram}#, **onegram}
	# final_ng = dict(itertools.islice(total_ng.items(), 1))
	
	# print("final_ng", final_ng)
	# print("total_ng",total_ng)
	#print(bigram)
	final_c = {}
	if len(total_ng) > 1 :
		final_c = dict(itertools.islice(total_ng.items(),1))
	#print("final_c",final_c)
	count=0
	for i,v in total_ng.items():
		for j,vv in final_c.items():
			if i in j:
				count=count+1
		if count==0:
			final_c.update({i:v})
		count=0	
	
	#New_vr_======================
	vr_check = final_c

	#========================New_Vrutti===================

	hexagram_vr = kngram_vr(6,letters,ind_l)[0]
	pentagram_vr = kngram_vr(5,letters, ind_l)[0]
	quad_gram_vr = kngram_vr(4,letters, ind_l)[0]
	trigram_vr = kngram_vr(3,letters, ind_l)[0]
	bigram_vr = kngram_vr(2,letters, ind_l)[0]
	onegram_vr = kngram_vr(1,letters, ind_l)[0]
	# print("onegram_vr",onegram_vr)

	total_ng_vr = {**hexagram_vr, **pentagram_vr, **quad_gram_vr, **trigram_vr, **bigram_vr, **onegram_vr} 
#final_ng_vr = dict(itertools.islice(total_ng.items(), 1))
	if len(total_ng_vr) > 1 :
		# final_vr = dict(itertools.islice(total_ng_vr.items(),1)) #this takes the first item from the dict.
		final_vr = total_ng_vr


	# print("final_vr", final_vr)	
#the folloiwng process is to remove the lata and cheka counted in onegram as vr in onegram is counted when the freq is equal or more than 1.  
	# print("vr_check", vr_check)
	for g, index in final_vr.items(): #creating prob in 'wawo'runa parispanda...
		i = copy.deepcopy(index)
		for ans, indx in vr_check.items():
			if len(g) == 1:
				# if len(g) == 1:
				new_index = list(set(index) - set(indx))
				index.clear()
				if len(new_index) >= 2:
					index.extend(new_index)
	# print("final_vr2", final_vr)	

	final_vr1 = {}
	ind_vr1 = []
	for kk, vv in final_vr.items():
		if len(vv) >1:
			vv.sort()
			vv1 = dist_group(vv, 4)
			l = copy.deepcopy(vv1)
			for i in l:
				if len(i)<2:
					# print("i", i)
					vv1.remove(i)
				final_vr1.update({kk:vv1})
			
		
	# print("\nfinal_vr", final_vr1)
	ind_vr = list(final_vr1.values()) #it is a list of  sublists. To merge them the following two steps are taken, then to remove the duplicate elements list(set()) method is used.
	merge = list(itertools.chain.from_iterable(ind_vr))
	merge = list(itertools.chain.from_iterable(merge))
	merge = list(set(merge))
	# print("merge", merge)

	ss_vr = [*ss1]

	for v in merge :
#		for v1 in v:
		ss_vr[v] = "_"+ss_vr[v]+"*"
		
	ss_vr = "".join(ss_vr)	
	ss_vr = ss_vr.replace(".",".<@br/>")
	ss_vr = ss_vr.replace(".<@br/>.<@br/>", "..<@br/>")
	if "*" not in ss_vr:
		ss_vr = "-----"

#=============
	vowels1 = ['a','A','e','E','i','I','o','O','u','U','q','Q','L']
	if len(x1) > 0 :
		for i in x1 :
			# print("i", i)
			strg = ""
			for n in range(0,len(i)) :
				# print(i,n)
				if i[n] not in vowels1 and i[n] != '"':
					strg = strg + i[n]
			# print("strg",strg)		
			fc = list(final_c.keys())	
			for l in fc:
				# print("l",l)
				if strg == l :
					final_c.pop(l)
				elif answ(strg) == l:
					final_c.pop(l)	

	ind = list(final_c.values())
	merge_ng = list(itertools.chain.from_iterable(ind))
	# print("ind", merge_ng)
	merge_ng = list(set(merge_ng))
	ss2 = [*ss1]
	# print("ind_ng",ind)# = list(set(ind))
	for v in merge_ng :
		# for v1 in v:
		ss2[v] = "_"+ss2[v]+"*"
		# print("CEKANUPRAS", ss2)
	
	ss2 = "".join(ss2)	
	ss2 = ss2.replace(".",".<@br/>")
	ss2 = ss2.replace(".<@br/>.<@br/>", "..<@br/>")
	if "*" not in ss2:
		ss2 = "-----"

	# print("\nCEKANUPRAS", ss2)
	# print("\nVQWWYANUPRAS", ss_vr)	
    
	#-----------------------------------to remove vq from ch		

	"n grams done! counted 2 and more than 2 is also done but not validated the result. now dist and duplicate ngrams to be removed. Now what is counted in cheka will not be in 	Vq"
	#----------------------------------------------------------------------------------------------------------
	anuprasa = [
	{"@prakAra" :"lAtAnuprAsa", "@outp": x },
	{"@prakAra":"CekAnuprAsa", "@outp" : ss2},
	{"@prakAra" :"vqwwyanuprAsa","@outp" : ss_vr},
	{"@prakAra" :"anwyAnuprAsa", "@outp" : [{"@prakAra":"pAxa","@outp":feet},{"@prakAra":"paxa","@outp": paxa}] },
	{"@prakAra" :"SqwyanuprAsa", "@outp" : [] }
	]
	#print ("\nSQWYANUPRASA:")	
			
#print("New_srutyanuprasa")
	kanth = Sthan("kKgGfh",dict_all_let, ss1)
	talu = Sthan("cCjJFyS",dict_all_let, ss1)
	murdha = Sthan("tTdDNrR",dict_all_let, ss1)
	danta = Sthan("wWxXnlsv",dict_all_let, ss1)
	oshtha = Sthan("pPbBmv",dict_all_let, ss1)


	can_add(kanth,"kaNTya", anuprasa)
	can_add(talu,"wAlavya", anuprasa)		  
	can_add(murdha,"mUrXanya", anuprasa)		  
	can_add(danta,"xanwya", anuprasa)		  
	can_add(oshtha,"oRTya", anuprasa)
	
	if len(anuprasa[4]["@outp"]) == 0:
		anuprasa[4]["@outp"].append("-")
	
	result = json.dumps(anuprasa, indent = 2)
	return anuprasa
