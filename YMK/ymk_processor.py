
'If we add a clause of minimun distance will the two syllable output stop??? '


#from tabulate import tabulate
import re
import copy
from collections import Counter
#from inp_trans import translit_out

#SAraxA SAraxAmBojavaxanA vaxanAmbuje. sarvaxA sarvaxAsmAkaM sanniXiM sanniXiM kriyAw.
#ananwamahimavyApwaviSvAM veXA na vexa yAm. yA ca mAweva Bajawe praNawe mAnave xayAm.

def ak22 (ltf): #raHKa
	# lat = []
	l=len(ltf)
	count=0
	vowel = ['a','A','e','E','i','I','o','O','u','U','q','Q','L']			 
	if l>0:
		lt=copy.deepcopy(ltf)
		for i in lt:
			count = 0
			cons = ""		 
			#for v in vowel:
			for ii in i:
				if ii in vowel:
					count=count+1
				else:
					cons += ii
			# print("cons",cons, set(cons), "iii", i)			
			if len(i) < 6:
				if len(set(cons)) == 1:
					ltf.remove(i)
			# print("\ncount", i, count)			
			if count<2:
				ltf.remove(i)
				count=0		
			if count == 2 :
				if "H" in i[:-1] :
					ltf.remove(i)	
					count = 0	
	# 	print("this is lata", ltf)
	if len(ltf) == 0:
		ltf = ["-----"]
	return ltf

def seg(s):
	if re.search("([bBcCdDfFgGhjJkKlLmnNpPrRsStTvVwWxXyY])([bBcCdDfFgGhjJkKlLmnNpPrRsStTvVwWxXyY])", s):
		s=re.sub("([bBcCdDfFgGhjJkKlLmnNpPrRsStTvVwWxXyY])([bBcCdDfFgGhjJkKlLmnNpPrRsStTvVwWxXyY])",r"\1-\2",s) 
	return s

def vowel(s):
	vowels = ['a','A','e','E','i','I','o','O','u','U','q','Q','L','H',"M"]
	strg =""
	for letter in s:
		if letter in vowels:
			strg += letter + "-"	
		else:
			strg += letter		

	s2=strg.split("-")
	s2=' '.join(s2).split()
	n=len(s2)
	list0=[]
	for j in range(n,1,-1):
		for i in range(1,j):
			pada1=(s2[i-1:j])
			list0.append(pada1)
#			print(pada1)
	return list0
def break_vowel(s0):
	vowel = ['a','A','e','E','i','I','o','O','u','U','q','Q','L','H']
	new_word=""
	for letter in s0:
		if letter in vowel:
			new_word += letter + "-"	
			while letter=="M":
				new_word+=letter
		else:
			new_word += letter
	listt=[]
	listt[:0]=new_word   #anunasikas = #
	for i in range(len(listt)):		
		if listt[i]=='M':
			listt[i]="-"
			listt[i-1]="M"
		if listt[i]=="H":
			listt[i]='-'
			listt[i-1]='H'	
	ll=len(listt)
	# print("listtt",listt)
	halant=['M','w','n','x','t','g','d','m']
	for h in halant:
		if listt[ll-1]==h:
			listt[ll-1]="-"
			listt[ll-2]=h		    		
	listt=''.join(listt)
	
	return listt

def first_half(pada1_2):
	# print(pada1_2)
	length=len(pada1_2)
	middle_index = length//2
	pada_1=pada1_2[:middle_index]
	return pada_1
	
def sec_half(pada1_2):
	length=len(pada1_2)
	middle_index = length//2
	pada_2=pada1_2[middle_index:]
	return pada_2
def join(p):
	p="".join(p)
	return p
	
def one(p1):
	l=len(p1)
	l=l//3#=4
	n1=p1[:l]
	m2_3=p1[l:]
	l1=len(m2_3)//2#=3
	p1IIii="".join(m2_3[:l1])
	p1III="".join(m2_3[l1:])
	p1I="".join(p1[:l1])
	p1IIi="".join(p1[l1:l1+l1])
	return p1I, p1IIi, p1IIii,p1III	

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
#-----------if i and l are not equal due to additional single element like 'M' ----------
def equal(i,l):
	k=len(i)
	k1=len(l)
	if i == l:
		pass
	elif k1 == k+1:
		if i == l[:-1]:
			l=i
		elif i == l[1:]:
			l = i	
	elif k == k1+1:
		if l == i[:-1]:
			i=l
		elif l == i[1:]:
			i = l 	
	else:
		pass
	return	i,l
		
def pankti(R,list1,p1,p2,p3,p4,a):
	if p1==p2==p3==p4:
		R.append(['"'+answ(p1)+'"',a+"-yamaka"])	
		l=copy.deepcopy(list1)
		for i in l:
			if i==p1:
				list1.remove(i)
		return True
	else:
		return False
			
def yugmaka(R,list1,p1,p2,p3,p4,a):
	p1,p2=equal(p1,p2)
	p3,p4=equal(p3,p4)
	if p1==p2 and p3==p4:
		R.append(['"'+answ(p1)+'",'+' "'+answ(p3)+'"',a+"-yamaka"])	
		l=copy.deepcopy(list1)
		for i in l:
			if i==p1==p3:
				list1.remove(i)
				break
			if i==p1:
				list1.remove(i)
			if i==p3:
				list1.remove(i)
		return True 
	else:
		return False		
def p8_samu(R,list1,p1a,p1b,p2a,p2b,p3a,p3b,p4a,p4b,a):
#for samswa p.s., chakraka,ardha_pari
	p1a,p1b=equal(p1a,p1b)
	p2a,p2b=equal(p2a,p2b)
	p3a,p3b=equal(p3a,p3b)
	p4a,p4b=equal(p4a,p4b)
	if p1a==p1b and p2a==p2b and p3a==p3b and p4a==p4b:
		R.append(['"'+answ(p1a)+'",'+' "'+answ(p2a)+'",' +'"'+answ(p3a)+'",'+' "'+answ(p4a)+'"',a+"-yamaka"])
#		print("\n",'"'+answ(p1a)+'",','"'+answ(p2a)+'",','"'+answ(p3a)+'",','"'+answ(p4a)+'"',a)
		l=copy.deepcopy(list1)
		for i in l:		
			if i==p1a:
				list1.remove(i)
			if i==p2a:
				list1.remove(i)	
			if i==p3a:
				list1.remove(i)	
			if i==p4a:
				list1.remove(i)	
		return True		
	else:	
		return False		 	
def p6_samu(R,list1,p1a,p1b,p2a,p2b,p3a,p3b,a):
	p1a,p1b=equal(p1a,p1b)
	p2a,p2b=equal(p2a,p2b)
	p3a,p3b=equal(p3a,p3b)						 	
	if p1a==p1b and p2a==p2b and p3a==p3b:
		R.append(['"'+answ(p1a)+'",'+' "'+answ(p2a)+'",'+' "'+answ(p3a)+'"',a+"-yamaka"])
#		print("\n",'"'+answ(p1a)+'",','"'+answ(p2a)+'",','"'+answ(p3a)+'"',a)
		l=copy.deepcopy(list1)
		for i in l:		
			if i==p1a:
				list1.remove(i)
			if i==p2a:
				list1.remove(i)	
			if i==p3a:
				list1.remove(i)
		return True
	else:
		return False
def p2_samu(R,list1,p1a,p1b,a):
	# print("1  p1a",p1a,"p1b", p1b)
	p1a,p1b=equal(p1a,p1b)
	# print("2  p1a",p1a,"p1b", p1b)
	if p1a==p1b:
		R.append(['"'+answ(p1a)+'"',a+"-yamaka"])
#		print("\n"+'"'+answ(p1a)+'"',a)
		l=copy.deepcopy(list1)
		for i in l:				
			if i==p1a:
				list1.remove(i)
		return True
	else :
		return False
def p12_samu(R,list1,p1I,p1II,p1III,p2I,p2II,p2III,p3I,p3II,p3III,p4I,p4II,p4III,a):
	if p1I==p1II==p1III and p2I==p2II==p2III and p3I==p3II==p3III and p4I==p4II==p4III:
		R.append(['"'+answ(p1I)+'",'+' "'+answ(p2I)+'",'+' "'+answ(p3I)+'",'+' "'+answ(p4I)+'"',a+"-yamaka"])
#		print("\n",'"'+answ(p1I)+'",','"'+answ(p2I)+'",','"'+answ(p3I)+'",','"'+answ(p4I)+'"',a)
		l=copy.deepcopy(list1)
		for i in l:		
			if i==p1I:
				list1.remove(i)
			if i==p2I:
				list1.remove(i)	
			if i==p3I:
				list1.remove(i)	
			if i==p4I:
				list1.remove(i)	
		return True		
	else:	
		return False

def p9_samu(R,list1,p1I,p1II,p1III,p2I,p2II,p2III,p3I,p3II,p3III,a):
	if p1I==p1II==p1III and p2I==p2II==p2III and p3I==p3II==p3III :
		R.append(['"'+answ(p1I)+'",'+' "'+answ(p2I)+'",'+' "'+answ(p3I)+'"',a+"-yamaka"])
#		print("\n",'"'+answ(p1I)+'",','"'+answ(p2I)+'",','"'+answ(p3I)+'"',a)
		l=copy.deepcopy(list1)
		for i in l:		
			if i==p1I:
				list1.remove(i)
			if i==p2I:
				list1.remove(i)	
			if i==p3I:
				list1.remove(i)	
		return True		
	else:	
		return False
		
def p62_samu(R, list1,p1I,p1II,p1III,p2I,p2II,p2III,a):
	if p1I==p1II==p1III and p2I==p2II==p2III :
#		print("\n",'"'+answ(p1I)+'",','"'+answ(p2I)+'"',a)
		R.append(['"'+answ(p1I)+'",'+' "'+answ(p2I)+'"',a+"-yamaka"])
		l=copy.deepcopy(list1)
		for i in l:		
			if i==p1I:
				list1.remove(i)
			if i==p2I:
				list1.remove(i)				
		return True	
	else:	
		return False
def p13_samu(R,list1,p1I,p1II,p1III,a):
	if p1I==p1II==p1III :
		R.append(['"'+answ(p1I)+'",'+' "'+answ(p1II)+'",'+' "'+answ(p1III)+'"',a+"-yamaka"])
#		print("\n",'"'+answ(p1a)+'",','"'+answ(p2a)+'",','"'+answ(p3a)+'",','"'+answ(p4a)+'"',a)
		l=copy.deepcopy(list1)
		for i in l:		
			if i==p1I:
				list1.remove(i)
		return True		
	else:	
		return False
		
# to remove the element which is already analysed/matched
def rmv(list1,i):
	l=copy.deepcopy(list1)
	for i1 in l:		
		if i==i1:
			list1.remove(i)
	return list1
	
def rev(s):#for reversal of the sequence 
    st = ""
    for i in s:
        st = i + st
    return st
    
def ak2 (ltf, p1):
	removed=[]
	l=len(ltf)
	count=0
	vowel = ['a','A','e','E','i','I','o','O','u','U','q','Q','L']	
	if l>0:
		lt=copy.deepcopy(ltf)
		for i in lt:
			cons = ""		 
			#for v in vowel:
			for ii in i:
				if ii in vowel:
					count=count+1
				else:
					cons += ii
			# print("cons",cons, set(cons), "iii", i)			
			if len(i) < 6:
				if len(set(cons)) == 1:
					ltf.remove(i)
			if count<2:
				ltf.remove(i)
				removed.append(i)
				count = 0
			if count == 2 and "H" in i[:-1]:
				ltf.remove(i)	
				count=0	
			if len(i)>len(p1):
				ltf.remove(i)
		if len(removed)>2:
			ltf=ltf+removed	
	return ltf  



def inp_processor_yamaka(s1):
#	s1=input("Enter a Sloka: ")
#preprocessing of input. - anunasika to M
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
	# s1 = re.sub("\n","",s1)
	check= s1.replace("."," ")
	check=check.split()
	# s1 = s1.strip()
	s1=s1.replace("Z","")
	
	s1=s1.replace(" ","")# to check	

	# print("\ninp", s1 )
	s1 = ''.join(s1.split())
	s1=s1.split(".")####(".")

	s1=' '.join(s1).split()
	# print("s1",s1)
	#here if verse
	if len(s1)>1:		
		# s1=s1.split(".")

		# s1=' '.join(s1).split()

		s0=s1[0]#line1
		s00=s1[1]#line2


		s01=seg(seg(s0))
		s001=seg(seg(s00))

	#=============FOR LIST OF NGRAMS WITH FREQ MORE THAN 2===========================

	#print(vowel(s0))	
		raw_ngram = vowel(s01)+vowel(s001)
		# raw_ngram = str1+str2

		# print(str2)
		all_ngram=[]
		counted2_raw=[]
		for l in raw_ngram:
			for l1 in l:
				joint="".join(l)
			all_ngram.append(joint)
		
		for l in all_ngram:
			y=all_ngram.count(l)
			if y>1:
				counted2_raw.append(l)
				counted2_raw.sort(reverse=True, key=len)
		counted2_raw=list(set(counted2_raw)) #prints the repeated element.
		counted2_raw.sort(reverse=True, key=len)
		counted2=[]
		if len(counted2_raw)>0:
			counted2=[counted2_raw[0]]
		count=0
		for i in counted2_raw:
			for j in counted2:
				if i in j:
					count=count+1
			if count==0:
				counted2.append(i)
			count=0
		list_final=[]
		# print("counted_2",counted2)
		# print(check)
		for i in counted2:
			l=len(i)
			if i[0]=="H":
				i=i[1:]
				list_final.append(i)
			else:	
				for k in range(3):
					if i[0:k+1]==i[l-k-1:l]:
						if i in check:
							list_final.append(i)
						elif i[:l-k-1] in check:
							i=i[:l-k-1]
							list_final.append(i)
						elif i[k+1:] in check:
							i=i[k+1:]
							list_final.append(i)
						else:
							list_final.append(i)	
						break
					if k==2:
						list_final.append(i)
						
		list_final = ' '.join(list_final).split()	
		# print("11list_final", list_final)	
	#=======FOR PADA DIVISION===============

		new_word= break_vowel(s0)
		new_word2=break_vowel(s00)
	#print(new_word, new_word2)
	#==================PADA DIVISION=====================
		pada1_2=new_word.split("-")# makes list
		pada1_2=' '.join(pada1_2).split()#(removes blank spaces)

		pada3_4=new_word2.split("-")
		pada3_4=" ".join(pada3_4).split()
		

		p1=first_half(pada1_2)
		p2=sec_half(pada1_2)
		p1a=first_half(p1)
		p1b=sec_half(p1)
		p2a=first_half(p2)
		p2b=sec_half(p2)
		p3=(first_half(pada3_4))
		p4=(sec_half(pada3_4))
		p3a=first_half(p3)
		p3b=sec_half(p3)
		p4a=first_half(p4)
		p4b=sec_half(p4)
		pada_lst=[join(p1),join(p2),join(p3),join(p4)]
		pada_lst1=[join(p1),join(p2),join(p3),join(p4)]
		le=len(p1a)
		N=0
		if le>3:
			N=0
		else:
			N=1	
		p1ai=first_half(p1a)
		p1aii=sec_half(p1a)
		p1bi=first_half(p1b)
		p1bii=sec_half(p1b)
		p2ai=first_half(p2a)
		p2aii=sec_half(p2a)
		p2bi=first_half(p2b)
		p2bii=sec_half(p2b)
		p3ai=first_half(p3a)
		p3aii=sec_half(p3a)
		p3bi=first_half(p3b)
		p3bii=sec_half(p3b)	
		p4ai=first_half(p4a)
		p4aii=sec_half(p4a)
		p4bi=first_half(p4b)
		p4bii=sec_half(p4b)
		
		ll=len(p1)
		#if ll%3==0:
		#	N=0
		#else:
		#	N=1	
		p1I=one(p1)[0]
		p1II=one(p1)[1]
		p1IIi=one(p1)[2]
		p1III=one(p1)[3]
		
		p2I=one(p2)[0]
		p2II=one(p2)[1]
		p2IIi=one(p2)[2]
		p2III=one(p2)[3]
		
		p3I=one(p3)[0]
		p3II=one(p3)[1]
		p3IIi=one(p3)[2]
		p3III=one(p3)[3]
		
		p4I=one(p4)[0]
		p4II=one(p4)[1]
		p4IIi=one(p4)[2]
		p4III=one(p4)[3]

		#for Anuprasa -
		pp1,pp2,pp3,pp4 = p1,p2,p3,p4


		# print(p3)	
		p1="".join(p1)
		p2="".join(p2)
		p1a="".join(p1a)
		p1b="".join(p1b)
		p2a="".join(p2a)
		p2b="".join(p2b)
		p3="".join(p3)
		p4="".join(p4)
		p3a="".join(p3a)
		p3b="".join(p3b)
		p4a="".join(p4a)
		p4b="".join(p4b)
		
		p1ai="".join(p1ai)
		p1bi="".join(p1bi)
		p2ai="".join(p2ai)
		p2bi="".join(p2bi)
		p3ai="".join(p3ai)
		p3bi="".join(p3bi)
		p4ai="".join(p4ai)
		p4bi="".join(p4bi)
		
		p1aii="".join(p1aii)
		p1bii="".join(p1bii)
		p2aii="".join(p2aii)
		p2bii="".join(p2bii)
		p3aii="".join(p3aii)
		p3bii="".join(p3bii)
		p4aii="".join(p4aii)
		p4bii="".join(p4bii)
		
		#for Anuprasa -
		pp1,pp2,pp3,pp4 = p1,p2,p3,p4

		# print("padas",pp1, pp2, pp3, pp4)
		# print(p2b, p3a)
		# print("\nLSt",pada_lst)

		#print(p1bii, p2bii, p3bii, p4bii)
		#-----------------------
		#when i is 3 or 4 times in a pada.
		co=c1=0
		to=t1=0
		lk=list_final[:]
		for i in lk:
			for k in pada_lst:
				l=len(i)
				l2=int(l/2) 
				l3=int(l/3)
				if i[:l2]==i[l2:]:
		#			print(i)
					c1=1
					if i in k:
						co=co+1
				if i[:l3]==i[l3:l3*2]==i[l3*2:]:
					t1=1
					if i in k:
						to=to+1
			if co==1 and c1==1:
		#		print(i)
				list_final.remove(i)
				list_final.append(i[:l2])
			if to==1 and t1==1:
		#		print(i)
				list_final.remove(i)
				list_final.append(i[:l3])
				
			co=0	
			to=0
		#---------------to convert # into anunasika--------

		Rudrata=[]
		Rudrata1=[{"@author":"AcArya ruxrata","@outp":[]}]
		
		Dandi=[]
		Dandi1=[{"@author":"AcArya xaNdI","@outp":[]}]
		
		Bharata=[]
		Bharata1=[{"@author":"AcArya Barawa","@outp":[]}]
		
		#Rudrata1=[{"@author":"ruxrata","@outp":[{}]}] 
		#Rudrata1=
		# print("list_final 2nd", list_final)	
		#------------editing of the elements in list_final-----------
		list_f=list_final
		list_final=[]#rmv rudrata
		#to remove 'M' in the beginning
		for i in list_f:
			if i[0]=="M":
				i=i[1:]
				list_final.append(i)
			else:
				list_final.append(i)	
				
		# print("list_final2",list_final)
		lf = copy.deepcopy(list_final)
		for i in lf:
		#	print(i)
			if len(i) < 4 :
				list_final.remove(i)
			if i==p1+p2:
				list_final.remove(i)
				
		LATA_list = copy.deepcopy(list_final)		
		# print("lata", LATA_list)		
		list_final = ak2(list_final, p1)			
		list_final1=list_final[:]#full
		list_finald=list_final[:]#rmv dandin	
		list_final2=list_final[:]#rmv bharata
		# print("list_final3",list_final)
			
		
		#print('\n-----ruxrata-----_')				
		Z=Y=X=U=dn=0
		if  pankti(Rudrata,list_final,p1,p2,p3,p4,"samaswa-pAxAvqwwi-pafkwi") is True:		
			Z=1
			Bharata.append(['"'+answ(p1)+'"',"cawurvyavasiwa-yamaka"])
			rmv(list_final2,p1)
			if p1a==p1b:
				Dandi.append(['"'+answ(p1a)+'"',"mAhA-yamaka"])
				rmv(list_finald,p1a)
			else:
				Dandi.append(['"'+answ(p1)+'"',"cawuRpAxagawa-yamaka"])
				rmv(list_finald,p1a)	
			dn=1	
		if Z==0: 
			if pankti(Rudrata,list_final,p1a,p2a,p3a,p4a,"pAxAxi-pAxArXAvqwwi-pafkwi") is True:	Z=1
		if Z==0:
			if pankti(Rudrata,list_final,p1b,p2b,p3b,p4b,"pAxAnwa-pAxArXAvqwwi-pafkwi") is True:	Z=1
		if Z==N==0:
			if pankti(Rudrata,list_final,p1I,p2I,p3I,p4I,"pAxAxi-pAxawqwIyArXAvqwwi-pafkwi") is True:		Z=1	
		if Z==N==0:
			if pankti(Rudrata,list_final,p1II,p2II,p3II,p4II,"pAxamaXya-pAxawqwIyArXAvqwwi-pafkwi") is True:	Z=1	
		if Z==N==0:
			if pankti(Rudrata,list_final,p1III,p2III,p3III,p4III,"pAxAnwya-pAxawqwIyArXAvqwwi-pafkwi") is True:	Z=1	
		if Z==N==0:
			if pankti(Rudrata,list_final,p1bii,p2bii,p3bii,p4bii,"pAxAnwya-pAxacawuXArXAvqwwi-pafkwi") is True:	Z=1
		if Z==N==0:
			if pankti(Rudrata,list_final,p1ai,p2ai,p3ai,p4ai,"pAxAxi-pAxacawuXArXAvqwwi-pafkwi") is True:	Z=1				
		if Z==0:
			if p1==p2==p3:
				Dandi.append(['"'+answ(p1)+'"',"(1,2,3)wripAxagawa-yamaka"])
				rmv(list_finald,p1)
				dn=1
			if p1==p3==p4:	
				Dandi.append(['"'+answ(p1)+'"',"(1,3,4)wripAxagawa-yamaka"])
				rmv(list_finald,p1)
				dn=1
			if p2==p3==p4:
				Dandi.append(['"'+answ(p2)+'"',"(2,3,4)wripAxagawa-yamaka"])
				rmv(list_finald,p2)
				dn=1
			if p1==p2==p4:
				Dandi.append(['"'+answ(p2)+'"',"(1,2,4)wripAxagawa-yamaka"])	
				rmv(list_finald,p2)
				dn=1	
		if Z==0:
			if yugmaka(Rudrata,list_final,p1,p2,p3,p4,"samaswa-pAxAvqwwi-yugmaka") is True:	
				Z=1
				Bharata.append(['"'+answ(p1)+'"'+","+'"'+answ(p3)+'"',"(1,2;3,4)samuxgaka-yamaka"])
				rmv(list_final2,p2)
				rmv(list_final2,p3)
				Dandi.append(['"'+answ(p1)+'"'+","+'"'+answ(p3)+'"',"(1,2;3,4)samuxgaka-yamaka"])
				rmv(list_finald,p1)
				rmv(list_finald,p3)
				dn=1	
		if Z==0:
			if yugmaka(Rudrata,list_final,p1a,p2a,p3a,p4a,"pAxAxi-pAxArXAvqwwi-yugmaka") is True:	Z=1
		if Z==N==0:
			if yugmaka(Rudrata,list_final,p1b,p2b,p3b,p4b,"pAxAnwa-pAxArXAvqwwi-yugmaka") is True:	Z=1
		if Z==N==0:
			if yugmaka(Rudrata,list_final,p1I,p2I,p3I,p4I,"pAxAxi-pAxawqwIyArXAvqwwi-yugmaka") is True:		Z=1
		if Z==N==0:
			if yugmaka(Rudrata,list_final,p1II,p2II,p3II,p4II,"pAxamaXya-pAxawqwIyArXAvqwwi-yugmaka") is True:	Z=1
		if Z==N==0:
			if yugmaka(Rudrata,list_final,p1III,p2III,p3III,p4III,"pAxAnwya-pAxawqwIyArXAvqwwi-yugmaka") is True:	Z=1	
		if Z==N==0:
			if yugmaka(Rudrata,list_final,p1bii,p2bii,p3bii,p4bii,"pAxAnwya-pAxacawuXArXAvqwwi-yugmaka") is True:	Z=1
		if Z==N==0:
			if yugmaka(Rudrata,list_final,p1ai,p2ai,p3ai,p4ai,"pAxAxi-pAxacawuXArXAvqwwi-yugmaka") is True:	Z=1		
							
		if Z==0:
			if yugmaka(Rudrata,list_final,p1,p3,p2,p4,"samaswa-pAxAvqwwi-samuxgaka") is True:
				
				Z=1
				Bharata.append(['"'+answ(p1)+'"'+","+'"'+answ(p2)+'"',"(1,3;2,4)samuxgaka-yamaka"])
				rmv(list_final2,p1)
				rmv(list_final2,p2)
				Dandi.append(['"'+answ(p1)+'"'+","+'"'+answ(p2)+'"',"(1,3;2,4)samuxgaka-yamaka"])
				rmv(list_finald,p1)
				rmv(list_finald,p2)
				dn=1
		if Z==0:
			if yugmaka(Rudrata,list_final,p1a,p3a,p2a,p4a,"pAxAxi-pAxArXAvqwwi-samuxgaka") is True:	Z=1
		if Z==0:
			if yugmaka(Rudrata,list_final,p1b,p3b,p2b,p4b,"pAxAnwa-pAxArXAvqwwi-samuxgaka") is True:	Z=1	
		if Z==N==0:
			if yugmaka(Rudrata,list_final,p1I,p3I,p2I,p4I,"pAxAxi-pAxawqwIyArXAvqwwi-samuxgaka") is True:	Z=1
		if Z==N==0:
			if yugmaka(Rudrata,list_final,p1II,p3II,p2II,p4II,"pAxamaXya-pAxawqwIyArXAvqwwi-samuxgaka") is True:	Z=1
		if Z==N==0:
			if yugmaka(Rudrata,list_final,p1III,p3III,p2III,p4III,"pAxAnwya-pAxawqwIyArXAvqwwi-samuxgaka") is True:	Z=1	
		if Z==N==0:
			if yugmaka(Rudrata,list_final,p1bii,p2bii,p3bii,p4bii,"pAxAnwya-pAxacawuXArXAvqwwi-samuxgaka") is True:	Z=1
		if Z==N==0:
			if yugmaka(Rudrata,list_final,p1ai,p2ai,p3ai,p4ai,"pAxAxi-pAxacawuXArXAvqwwi-samuxgaka") is True:	Z=1				
		if Z==0:
			if yugmaka(Rudrata,list_final,p1,p4,p2,p3,"samaswa-pAxAvqwwi-parivqwwi") is True:	
				Z=1
				Bharata.append(['"'+answ(p1)+'"'+","+'"'+answ(p2)+'"',"(1,4;2,3)samuxgaka-yamaka"])
				rmv(list_final2,p1)
				rmv(list_final2,p2)
				Dandi.append(['"'+answ(p1)+'"'+","+'"'+answ(p2)+'"',"(1,4;2,3)samuxgaka-yamaka"])
				rmv(list_finald,p1)
				rmv(list_finald,p2)
				dn=1
		if Z==0:
			if yugmaka(Rudrata,list_final,p1a,p4a,p2a,p3a,"pAxAxi-pAxArXAvqwwi-parivqwwi") is True:	Z=1	
		if Z==0:
			if yugmaka(Rudrata,list_final,p1b,p4b,p2b,p3b,"pAxAnwa-pAxArXAvqwwi-parivqwwi") is True:	Z=1
		if Z==N==0:
			if yugmaka(Rudrata,list_final,p1I,p4I,p2I,p3I,"pAxAxi-pAxawqwIyArXAvqwwi-parivqwwi") is True:	Z=1
		if Z==N==0:
			if yugmaka(Rudrata,list_final,p1II,p4II,p2II,p3II,"pAxamaXya-pAxawqwIyArXAvqwwi-parivqwwi") is True:	Z=1
		if Z==N==0:
			if yugmaka(Rudrata,list_final,p1III,p4III,p2III,p3III,"pAxAnwya-pAxawqwIyArXAvqwwi-parivqwwi") is True:	Z=1	
				
		if Z==0:
			if p8_samu(Rudrata,list_final,p1a,p2b,p1b,p2a,p3a,p4b,p3b,p4a,"pAxArXAvqwwi-arXaparivqwwi") is True:	Z=1
		if Z==N==0:
			if yugmaka(Rudrata,list_final,p1bii,p4bii,p2bii,p3bii,"pAxAnwya-pAxacawuXArXAvqwwi-parivqwwi") is True:	Z=1
		if Z==N==0:
			if yugmaka(Rudrata,list_final,p1ai,p4ai,p2ai,p3ai,"pAxAxi-pAxacawuXArXAvqwwi-parivqwwi") is True:	Z=1			
		if Z==0:
			if p8_samu(Rudrata,list_final,p1a,p1b,p2a,p2b,p3a,p3b,p4a,p4b,"pAxArXAvqwwi-samaswa-pAxasamuxgaka") is True:	
				Z=1
		if Z==N==0:
			if p12_samu(Rudrata,list_final,p1I,p1II,p1III,p2I,p2II,p2III,p3I,p3II,p3III,p4I,p4II,p4III,"pAxawqwIyArXAvqwwi-samaswa-pAxasamuxgaka") is True:	Z=1
		if Z==0:
			if p8_samu(Rudrata,list_final,p1a,p2b,p2a,p3b,p3a,p4b,p4a,p1b,"pAxArXAvqwwi-samaswa-Axyanwika-cakraka") is True:	Z=1
		if Z==0:
			if p8_samu(Rudrata,list_final,p1b,p2a,p2b,p3a,p3b,p4a,p4b,p1a,"pAxArXAvqwwi-samaswa-anwAxika-cakraka") is True:	Z=1	
		if Z==N==0:
			if p8_samu(Rudrata,list_final,p1I,p2III,p1III,p2I,p3I,p4III,p3III,p4I,"pAxawqwIyArXAvqwwi-arXaparivqwwi") is True:	Z=1	
		if Z==N==0:
			if p8_samu(Rudrata,list_final,p1I,p2III,p2I,p3III,p3I,p4III,p4I,p1III,"pAxawqwIyArXAvqwwi-samaswa-Axyanwika-cakraka") is True:	Z=1
		if Z==N==0:	
			if p8_samu(Rudrata,list_final,p1III,p2I,p2III,p3I,p3III,p4I,p4III,p1I,"pAxawqwIyArXAvqwwi-samaswa-anwAxika-cakraka") is True:	Z=1
				
		if Z==0:
			if p6_samu(Rudrata,list_final,p1a,p1b,p2a,p2b,p3a,p3b,"pAxArXAvqwwi-samaswa-ananwariwa-pAxasamuxgaka") is True:	Z=1
		if Z==N==0:
			if p9_samu(Rudrata,list_final,p1I,p1II,p1III,p2I,p2II,p2III,p3I,p3II,p3III,"pAxawqwIyArXAvqwwi-samaswa-ananwariwa-pAxasamuxgaka") is True:	Z=1	
		if Z==0:
			if p6_samu(Rudrata,list_final,p2a,p2b,p3a,p3b,p4a,p4b,"pAxArXAvqwwi-samaswa-ananwariwa-pAxasamuxgaka") is True:	Z=1	
		if Z==N==0:
			if p9_samu(Rudrata,list_final,p2I,p2II,p2III,p3I,p3II,p3III,p4I,p4II,p4III,"pAxawqwIyArXAvqwwi-samaswa-ananwariwa-pAxasamuxgaka") is True:	Z=1		
		if Z==0:
			if p6_samu(Rudrata,list_final,p1a,p1b,p2a,p2b,p4a,p4b,"pAxArXAvqwwi-samaswa-anwariwa-pAxasamuxgaka") is True:	Z=1
		if Z==N==0:	
			if p9_samu(Rudrata,list_final,p1I,p1II,p1III,p2I,p2II,p2III,p4I,p4II,p4III,"pAxawqwIyArXAvqwwi-samaswa-anwariwa-pAxasamuxgaka") is True:	Z=1			
		if Z==0:
			if p6_samu(Rudrata,list_final,p2a,p2b,p3a,p3b,p4a,p4b,"pAxArXAvqwwi-samaswa-anwariwa-pAxasamuxgaka") is True:	Z=1
		if Z==N==0:
			if p9_samu(Rudrata,list_final,p2I,p2II,p2III,p3I,p3II,p3III,p4I,p4II,p4III,"pAxawqwIyArXAvqwwi-samaswa-anwariwa-pAxasamuxgaka") is True:	Z=1				
		if Z==0:
			if p6_samu(Rudrata,list_final,p1a,p2b,p2a,p3b,p3a,p4b,"pAxArXAvqwwi-samaswa-Axyanwika-vaMSa") is True:	Z=1
		if Z==N==0:
			if p6_samu(Rudrata,list_final,p1I,p2III,p2I,p3III,p3III,p3I,"pAxawqwIyArXAvqwwi-samaswa-Axyanwika-vaMSa") is True:	Z=1	
		if Z==0:
			if p6_samu(Rudrata,list_final,p1b,p2a,p2b,p3a,p3b,p4a,"pAxArXAvqwwi-samaswa-anwAxika-vaMSa") is True:	Z=2
		if Z==N==0:
			if p6_samu(Rudrata,list_final,p1III,p2I,p2III,p3I,p3I,p3III,"pAxawqwIyArXAvqwwi-samaswa-anwAxika-vaMSa") is True:	Z=1		
		
		##################################################
		A=B=C=D=E=F=G=H=I=J=K=L=M=E1=0
		if Z==0:
			if yugmaka(Rudrata,list_final,p1a,p2b,p3a,p4b,"pAxArXAvqwwi-samaswa-Axyanwika") is True:	U=1
			if U==0:
				if yugmaka(Rudrata,list_final,p1I,p2III,p3I,p4III,"pAxawqwIyArXAvqwwi-samaswa-Axyanwika") is True:	U=1
			if yugmaka(Rudrata,list_final,p1b,p2a,p3b,p4a,"pAxArXAvqwwi-samaswa-anwAxika") is True:	Y=1
			if Y==0:
				if yugmaka(Rudrata,list_final,p1III,p2I,p3III,p4I,"pAxawqwIyArXAvqwwi-vyaswa-anwAxika") is True:	
					Y=1
			if p2_samu(Rudrata,list_final,p1,p2,"samaswa-pAxAvqwwi-muKa") is True:	
				A=1
				Bharata.append(['"'+answ(p2)+'"',"cakravAla-yamaka"])
				rmv(list_final2,p2)
				Dandi.append(['"'+answ(p1)+'"',"(1,2)-xvipAxagawa-yamaka"])
				rmv(list_finald,p1)
				dn=1
			if A==0:
				if p2_samu(Rudrata,list_final,p1a,p2a,"pAxAxi-pAxArXAvqwwi-muKa") is True:	A=1 
				if p2_samu(Rudrata,list_final,p1b,p2b,"pAxAnwa-pAxArXAvqwwi-muKa") is True:	A=1
				if yugmaka(Rudrata,list_final,p1a,p1b,p2a,p2b,"pAxArXAvqwwi-samaswa-ananwariwa-pAxasamuxgaka") is True:	A=1
				if N==A==0:
					if p62_samu(Rudrata,list_final,p1I,p1II,p1III,p2I,p2II,p2III,"pAxawqwIyArXAvqwwi-samaswa-ananwariwa-pAxasamuxgaka") is True: A==1				
			if A==N==0:
				if p2_samu(Rudrata,list_final,p1I,p2I,"pAxAxi-wqwIyArXAvqwwi-muKa") is True:	A=1
				if p2_samu(Rudrata,list_final,p1II,p2II,"pAxamaXya-wqwIyArXAvqwwi-muKa") is True:	A=1
				if p2_samu(Rudrata,list_final,p1III,p2III,"pAxAnwa-wqwIyArXAvqwwi-muKa") is True:	A=1
			if A==N==0:
				if p2_samu(Rudrata,list_final,p1bii,p2bii,"pAxAnwa-pAxacawurXArXAvqwwi-muKa") is True:	A=1
				if p2_samu(Rudrata,list_final,p1ai,p2ai,"pAxAxi-pAxacawurXArXAvqwwi-muKa") is True:	A=1
			if A==U==0:
				if p2_samu(Rudrata,list_final,p1a,p2b,"pAxArXAvqwwi-vyaswa-Axyanwika") is True:	A=1
			if A==N==U==0:
				if p2_samu(Rudrata,list_final,p1I,p2III,"pAxawqwIyArXAvqwwi-vyaswa-Axyanwika") is True:	A=1	
			if A==Y==0:	
				if p2_samu(Rudrata,list_final,p1b,p2a,"pAxArXAvqwwi-vyaswa-anwAxika") is True:	A=1	
			if A==N==Y==0:		
				if p2_samu(Rudrata,list_final,p1III,p2I,"pAxawqwIyArXAvqwwi-vyaswa-anwAxika") is True:	
					A=1				
		#-------------------------------------------------------------------------------------------------------------------------------------------	
			if p2_samu(Rudrata,list_final,p3,p4,"samaswa-pAxAvqwwi-pucCa") is True:	
				B=1
				Bharata.append(['"'+answ(p3)+'"',"cakravAla-yamaka"])
				rmv(list_final2,p3)
				Dandi.append(['"'+answ(p3)+'"',"(3,4)-xvipAxagawa-yamaka"])
				rmv(list_finald,p3)
				dn=1 		
			if B==0:
				if p2_samu(Rudrata,list_final,p3a,p4a,"pAxAxi-pAxArXAvqwwi-pucCa") is True:	B=1
				if p2_samu(Rudrata,list_final,p3b,p4b,"pAxAnwa-pAxArXAvqwwi-pucCa") is True:	B=1
				if yugmaka(Rudrata,list_final,p3a,p3b,p4a,p4b,"pAxArXAvqwwi-samaswa-ananwariwa-pAxasamuxgaka") is True:	B=1
				if N==B==0:
					if p62_samu(Rudrata,list_final,p3I,p3II,p3III,p4I,p4II,p4III,"pAxawqwIyArXAvqwwi-samaswa-ananwariwa-pAxasamuxgaka") is True: B==1
				if N==B==0:
					if p2_samu(Rudrata,list_final,p3bii,p4bii,"pAxAnwa-pAxacawurXArXAvqwwi-pucCa") is True:	B=1
					if p2_samu(Rudrata,list_final,p3ai,p4ai,"pAxAxi-pAxacawurXArXAvqwwi-pucCa") is True:	B=1
			if B==N==0:
				if p2_samu(Rudrata,list_final,p3I,p4I,"pAxAxi-wqwIyArXAvqwwi-pucCa") is True:	B=1
				if p2_samu(Rudrata,list_final,p3II,p4II,"pAxamaXya-wqwIyArXAvqwwi-pucCa") is True:	B=1
				if p2_samu(Rudrata,list_final,p3III,p4III,"pAxAnwa-wqwIyArXAvqwwi-pucCa") is True:	B=1	
			if B==U==0: 	
				if p2_samu(Rudrata,list_final,p3a,p4b,"pAxArXAvqwwi-vyaswa-Axyanwika") is True:	B=1
			if B==N==U==0:
				if p2_samu(Rudrata,list_final,p3I,p4III,"pAxawqwIyArXAvqwwi-vyaswa-Axyanwika") is True:	B=1		
			if B==Y==0:	
				if p2_samu(Rudrata,list_final,p3b,p4a,"pAxArXAvqwwi-vyaswa-anwAxika") is True:	B=1
			if B==N==Y==0:		
				if p2_samu(Rudrata,list_final,p3III,p4I,"pAxawqwIyArXAvqwwi-vyaswa-anwAxika") is True:	
					B=1											
		#---------------------------------------------------------------------------------------------------------------------------------------------
			if p2_samu(Rudrata,list_final,p2,p3,"samaswa-pAxAvqwwi-garBa") is True:	
				C=1
				Bharata.append(['"'+answ(p2)+'"',"cakravAla-yamaka"])
				rmv(list_final2,p2)
				Dandi.append(['"'+answ(p2)+'"',"(2,3)-xvipAxagawa-yamaka"])
				rmv(list_finald,p2)	
				dn=1
			if C==0:
				if p2_samu(Rudrata,list_final,p2a,p3a,"pAxAxi-pAxArXAvqwwi-garBa") is True:	C=1
				if p2_samu(Rudrata,list_final,p2b,p3b,"pAxAnwa-pAxArXAvqwwi-garBa") is True:	C=1
				if yugmaka(Rudrata,list_final,p2a,p2b,p3a,p3b,"pAxArXAvqwwi-samaswa-ananwariwa-pAxasamuxgaka") is True:	C=1
				if N==C==0:
					if p62_samu(Rudrata,list_final,p2I,p2II,p2III,p3I,p3II,p3III,"pAxawqwIyArXAvqwwi-samaswa-ananwariwa-pAxasamuxgaka") is True: C==1	
			if C==N==0:
				if p2_samu(Rudrata,list_final,p2I,p3I,"pAxAxi-wqwIyArXAvqwwi-garBa") is True:	C=1
				if p2_samu(Rudrata,list_final,p2II,p3II,"pAxamaXya-wqwIyArXAvqwwi-garBa") is True:	C=1
				if p2_samu(Rudrata,list_final,p2III,p3III,"pAxAnwa-wqwIyArXAvqwwi-garBa") is True:	C=1
			if N==C==0:
				if p2_samu(Rudrata,list_final,p2bii,p3bii,"pAxAnwa-pAxacawurXArXAvqwwi-garBa") is True:	C=1
				if p2_samu(Rudrata,list_final,p2ai,p3ai,"pAxAxi-pAxacawurXArXAvqwwi-garBa") is True:	C=1			
			if C==0:	
				if p2_samu(Rudrata,list_final,p2a,p3b,"pAxArXAvqwwi-vyaswa-Axyanwika-maXya") is True:	C=1
			if C==N==0:
				if p2_samu(Rudrata,list_final,p2I,p3III,"pAxawqwIyArXAvqwwi-vyaswa-Axyanwika-maXya") is True:	C=1		
			if C==0:
				if p2_samu(Rudrata,list_final,p2b,p3a,"pAxArXAvqwwi-vyaswa-anwAxika-maXya") is True: C=1			
			if C==N==0:
				if p2_samu(Rudrata,list_final,p2III,p3I,"pAxawqwIyArXAvqwwi-vyaswa-anwAxika-maXya") is True:	
					C=1
	#---	------------------------------------------------------------------------------------------------------------------------------------------			
			if p2_samu(Rudrata,list_final,p1,p4,"samaswa-pAxAvqwwi-Avqwwi") is True:	
				D=1
				Bharata.append(['"'+answ(p1)+'"',"vikrAnwa-yamaka"])
				rmv(list_final2,p1)
				Dandi.append(['"'+answ(p1)+'"',"(1,4)-xvipAxagawa-yamaka"])
				rmv(list_finald,p1)
				dn=1
			if D==0:
				if p2_samu(Rudrata,list_final,p1a,p4a,"pAxAxi-pAxArXAvqwwi-Avqwwi") is True:	D=1
				if p2_samu(Rudrata,list_final,p1b,p4b,"pAxAnwa-pAxArXAvqwwi-Avqwwi")	is True:	D=1
				if yugmaka(Rudrata,list_final,p1a,p1b,p4a,p4b,"pAxArXAvqwwi-samaswa-anwariwa-pAxasamuxgaka") is True:	D=1
				if N==D==0:
					if p62_samu(Rudrata,list_final,p1I,p1II,p1III,p4I,p4II,p4III,"pAxawqwIyArXAvqwwi-samaswa-anwariwa-pAxasamuxgaka") is True: D==1
			if D==N==0:
				if p2_samu(Rudrata,list_final,p1I,p4I,"pAxAxi-wqwIyArXAvqwwi-Avqwwi") is True:	D=1
				if p2_samu(Rudrata,list_final,p1II,p4II,"pAxamaXya-wqwIyArXAvqwwi-Avqwwi") is True:	D=1
				if p2_samu(Rudrata,list_final,p1III,p4III,"pAxAnwa-wqwIyArXAvqwwi-Avqwwi") is True:	D=1
			if N==D==0:
				if p2_samu(Rudrata,list_final,p1bii,p4bii,"pAxAnwa-pAxacawurXArXAvqwwi-Avqwwi") is True:	D=1
				if p2_samu(Rudrata,list_final,p1ai,p4ai,"pAxAxi-pAxacawurXArXAvqwwi-Avqwwi") is True:	D=1						
	#---	------------------------------------------------------------------------------------------------------------------------------------------			
			if p2_samu(Rudrata,list_final,p1,p3,"samaswa-pAxAvqwwi-sanxaMSa") is True:	
				E=1
				Bharata.append(['"'+answ(p1)+'"',"vikrAnwa-yamaka"])
				rmv(list_final2,p1)
				Dandi.append(['"'+answ(p1)+'"',"(1,3)-xvipAxagawa-yamaka"])
				rmv(list_finald,p1) 
				dn=1
			if E==0:
				if p2_samu(Rudrata,list_final,p1a,p3a,"pAxAxi-pAxArXAvqwwi-sanxaMSa") is True:	E=1
				if p2_samu(Rudrata,list_final,p1b,p3b,"pAxAnwa-pAxArXAvqwwi-sanxaMSa") is True:	E=1
				if yugmaka(Rudrata,list_final,p1a,p1b,p3a,p3b,"pAxArXAvqwwi-samaswa-anwariwa-pAxasamuxgaka") is True:	E=1
			if N==E==0:
				if p62_samu(Rudrata,list_final,p1I,p1II,p1III,p4I,p4II,p4III,"pAxawqwIyArXAvqwwi-samaswa-anwariwa-pAxasamuxgaka") is True: E==1	
			if E==N==0:
				if p2_samu(Rudrata,list_final,p1I,p3I,"pAxAxi-wqwIyArXAvqwwi-sanxaMSa") is True:	E=1
				if p2_samu(Rudrata,list_final,p1II,p3II,"pAxamaXya-wqwIyArXAvqwwi-sanxaMSa") is True:	E=1
				if p2_samu(Rudrata,list_final,p1III,p3III,"pAxAnwa-wqwIyArXAvqwwi-sanxaMSa") is True:	E=1
			if N==E==0:
				if p2_samu(Rudrata,list_final,p1bii,p3bii,"pAxAnwa-pAxacawurXArXAvqwwi-sanxaMSa") is True:	E=1
				if p2_samu(Rudrata,list_final,p1ai,p3ai,"pAxAxi-pAxacawurXArXAvqwwi-sanxaMSa") is True:	E=1						 
	#---	------------------------------------------------------------------------------------------------------------------------------------------
			if p2_samu(Rudrata,list_final,p2,p4,"samaswa-pAxAvqwwi-sanxaRtaka") is True:	
				F=1
				Bharata.append(['"'+answ(p2)+'"',"vikrAnwa-yamaka"])
				rmv(list_final2,p2)
				Dandi.append(['"'+answ(p2)+'"',"(2,4)-xvipAxagawa-yamaka"])
				rmv(list_finald,p2)
				dn=1
			if F==0:
				if p2_samu(Rudrata,list_final,p2a,p4a,"pAxAxi-pAxArXAvqwwi-sanxaRtaka") is True:	F=1
		
				if p2_samu(Rudrata,list_final,p2b,p4b,"pAxAnwa-pAxArXAvqwwi-sanxaRtaka") is True: F=1	
				if yugmaka(Rudrata,list_final,p2a,p2b,p4a,p4b,"pAxArXAvqwwi-samaswa-anwariwa-pAxasamuxgaka") is True:	F=1	
				if N==F==0:
					if p62_samu(Rudrata,list_final,p2I,p2II,p2III,p4I,p4II,p4III,"pAxawqwIyArXAvqwwi-samaswa-anwariwa-pAxasamuxgaka") is True: F==1
			if F==N==0:
				if p2_samu(Rudrata,list_final,p2I,p4I,"pAxAxi-wqwIyArXAvqwwi-sanxaRtaka") is True:	F=1
				if p2_samu(Rudrata,list_final,p2II,p4II,"pAxamaXya-wqwIyArXAvqwwi-sanxaRtaka") is True:	F=1
				if p2_samu(Rudrata,list_final,p2III,p4III,"pAxAnwa-wqwIyArXAvqwwi-sanxaRtaka") is True:	F=1	
			if N==E==0:
				if p2_samu(Rudrata,list_final,p2bii,p4bii,"pAxAnwa-pAxacawurXArXAvqwwi-sanxaRtaka") is True:	F=1
				if p2_samu(Rudrata,list_final,p2ai,p4ai,"pAxAxi-pAxacawurXArXAvqwwi-sanxaRtaka") is True:	F=1	
	#---	------------------------------------------------------------------------------------------------------------------------------------------		
			if A==D==E==0:	
				if p2_samu(Rudrata,list_final,p1a,p1b,"pAxArXAvqwwi-vyaswa-pAxasamuxgaka") is True:	X=1
				if X==N==0:
					if p13_samu(Rudrata,list_final,p1I,p1II,p1III,"pAxawqwIyArXAvqwwi-vyaswa-pAxasamuxgaka") is True: J=1
				if J==X==0:	
					if yugmaka(Rudrata,list_final,p1ai,p1aii,p1bi,p1bii,"pAxacawurWArXavqwwi-mAlA") is True:	J=1
					if yugmaka(Rudrata,list_final,p1ai,p1bii,p1aii,p1bi,"pAxacawurWArXavqwwi-kAFcI") is True:	J=1	
					if J==0:
						if p2_samu(Rudrata,list_final,p1I,p1II,"pAxawqwIyArXAvqwwi-AximaXya") is True:	J=1
						if p2_samu(Rudrata,list_final,p1IIi,p1III,"pAxawqwIyArXAvqwwi-maXyAnwa") is True:	J=1
						if p2_samu(Rudrata,list_final,p1I,p1III,"pAxawqwIyArXAvqwwi-Axyanwa") is True:	J=1		
					if J==0:		
						if p2_samu(Rudrata,list_final,p1ai,p1aii,"pAxacawurWArXavqwwi-vakwra") is True:	J=1
						if p2_samu(Rudrata,list_final,p1bi,p1bii,"pAxacawurWArXavqwwi-SiKA") is True:	J=1
						if p2_samu(Rudrata,list_final,p1aii,p1bi,"pAxacawurWArXavqwwi-maXya") is True:	J=1		 	 						
						if p2_samu(Rudrata,list_final,p1ai,p1bii,"pAxacawurWArXavqwwi-Axyanwa") is True:	J=1
							
			if A==C==F==0:	
				if p2_samu(Rudrata,list_final,p2a,p2b,"pAxArXAvqwwi-vyaswa-pAxasamuxgaka") is True:	X=1
				if X==N==0:
					if p13_samu(Rudrata,list_final,p2I,p2II,p2III,"pAxawqwIyArXAvqwwi-vyaswa-pAxasamuxgaka") is True: K=1
				if K==X==0:
					if yugmaka(Rudrata,list_final,p2ai,p2aii,p2bi,p2bii,"pAxacawurWArXAvqwwi-mAlA") is True:	K=1
					if yugmaka(Rudrata,list_final,p2ai,p2bii,p2aii,p2bi,"pAxacawurWArXAvqwwi-kAFcI") is True:	K=1
					if K==0:
							if p2_samu(Rudrata,list_final,p2I,p2II,"pAxawqwIyArXAvqwwi-AximaXya") is True:	K=1
							if p2_samu(Rudrata,list_final,p2IIi,p2III,"pAxawqwIyArXAvqwwi-maXyAnwa") is True:	K=1
							if p2_samu(Rudrata,list_final,p2I,p2III,"pAxawqwIyArXAvqwwi-Axyanwa") is True:	K=1
					if K==0:	
						if p2_samu(Rudrata,list_final,p2ai,p2aii,"pAxacawurWArXAvqwwi-vakwra") is True:	K=1
						if p2_samu(Rudrata,list_final,p2bi,p2bii,"pAxacawurWArXAvqwwi-SiKA") is True:	K=1
						if p2_samu(Rudrata,list_final,p2aii,p2bi,"pAxacawurWArXAvqwwi-maXya") is True:	K=1
						if p2_samu(Rudrata,list_final,p2ai,p2bii,"pAxacawurWArXAvqwwi-Axyanwa") is True:	K=1
								
			if B==C==E==0:	
				if p2_samu(Rudrata,list_final,p3a,p3b,"pAxArXAvqwwi-vyaswa-pAxasamuxgaka") is True:	X=1
				if X==0:
					if p13_samu(Rudrata,list_final,p3I,p3II,p3III,"pAxawqwIyArXAvqwwi-vyaswa-pAxasamuxgaka") is True: L=1
				if L==X==0:
					if yugmaka(Rudrata,list_final,p3ai,p3aii,p3bi,p3bii,"pAxacawurWArXAvqwwi-mAlA") is True:	L=1
					if yugmaka(Rudrata,list_final,p3ai,p3bii,p3aii,p3bi,"pAxacawurWArXAvqwwi-kAFcI") is True:	L=1
					if N==L==0:
						if p2_samu(Rudrata,list_final,p3I,p3II,"pAxawqwIyArXAvqwwi-AximaXya") is True:	L=1
						if p2_samu(Rudrata,list_final,p3IIi,p3III,"pAxawqwIyArXAvqwwi-maXyAnwa") is True:	L=1
						if p2_samu(Rudrata,list_final,p3I,p3III,"pAxawqwIyArXAvqwwi-Axyanwa") is True:	L=1
						if L==0:
							if p2_samu(Rudrata,list_final,p3ai,p3aii,"pAxacawurWArXAvqwwi-vakwra") is True:	L=1
							if p2_samu(Rudrata,list_final,p3bi,p3bii,"pAxacawurWArXAvqwwi-SiKA") is True:	L=1
							if p2_samu(Rudrata,list_final,p3aii,p3bi,"pAxacawurWArXAvqwwi-maXya") is True:	L=1					
							if p2_samu(Rudrata,list_final,p3ai,p3bii,"pAxacawurWArXAvqwwi-Axyanwa") is True:	L=1
			if B==D==F==0:	
				if p2_samu(Rudrata,list_final,p4a,p4b,"pAxArXAvqwwi-vyaswa-pAxasamuxgaka") is True:	X=1
				if X==N==0:
					if p13_samu(Rudrata,list_final,p4I,p4II,p4III,"pAxawqwIyArXAvqwwi-vyaswa-pAxasamuxgaka") is True: M=1
				if M==X==0:
					if yugmaka(Rudrata,list_final,p4ai,p4aii,p4bi,p4bii,"pAxacawurWArXAvqwwi-mAlA") is True:	M=1
					if yugmaka(Rudrata,list_final,p4ai,p4bii,p4aii,p4bi,"pAxacawurWArXAvqwwi-kAFcI") is True:	M=1
					if M==N==0:
							if p2_samu(Rudrata,list_final,p4I,p4II,"pAxawqwIyArXAvqwwi-AximaXya") is True:	M=1
							if p2_samu(Rudrata,list_final,p4IIi,p4III,"pAxawqwIyArXAvqwwi-maXyAnwa") is True:	M=1
							if p2_samu(Rudrata,list_final,p4I,p4III,"pAxawqwIyArXAvqwwi-Axyanwa") is True:	M=1
					if M==0:
						if p2_samu(Rudrata,list_final,p4ai,p4aii,"pAxacawurWArXAvqwwi-vakwra") is True:	M=1
						if p2_samu(Rudrata,list_final,p4bi,p4bii,"pAxacawurWArXAvqwwi-SiKA") is True:	M=1
						if p2_samu(Rudrata,list_final,p4aii,p4bi,"pAxacawurWArXAvqwwi-maXya") is True:	M=1
						if p2_samu(Rudrata,list_final,p4ai,p4bii,"pAxacawurWArXAvqwwi-Axyanwa") is True:	M=1
								
	#print("----Rudrata----")
	#for the remaining elements in list_final - remove if its length is less than 3 aksharas, if its length is more than a pada
		
		
		z=1	
					
				
		if A==B==C==D==E==F==J==K==L==M==Z==X==Y==U==0:	z=0
		#list_final=ak2(list_final, p1)
		#print("ak2",ak2(list_final, p1))
		z10=0
		l= len(list_final)
		if l==z==0:
			Rudrata.append(["-----","-----"])
			z10=1		
		if l>0:
			for i in list_final:	
				Rudrata.append(['"'+answ(i)+'"',"aniyawa-pAxaBAgAvqwwi-yamaka"])
		#print(Rudrata)
		
		#print(tabulate(Rudrata, headers="firstrow", tablefmt="fancy_grid"))
		#--------DANDIN------------
		#print('\n-----xaNdI-----_')
		####PRATILOMA#####
		
		y1=y2=y3=y4=y5=y6=0
		# print("\npada lst1", pada_lst1)
		# print("\nlst", pada_lst)
		if pada_lst[1] != pada_lst[0] and rev(pada_lst1[0])==pada_lst[1]:	y1=1	
		if rev(pada_lst1[0])==pada_lst[2] and pada_lst[0]!=pada_lst[2]:	y2=1	
		if rev(pada_lst1[0])==pada_lst[3] and pada_lst[0]!=pada_lst[3]:	y3=1	
		if rev(pada_lst1[1])==pada_lst[2] and pada_lst[1]!=pada_lst[2]:	y4=1	
		if rev(pada_lst1[1])==pada_lst[3] and pada_lst[1]!=pada_lst[3]:	y5=1	
		if rev(pada_lst1[2])==pada_lst[3] and pada_lst[1]!=pada_lst[4]:	y6=1
		
		if y1==y6==1:	Dandi.append([p1+", "+p2+" ;"+p3+", "+p4,"(1,2;3,4)SlokArXa-prawiloma-yamaka"])#print(p1,p2,";",p3,p4,"(1,2;3,4)SlokArXa-prawiloma-yamaka")	
		elif y2==y5==1:	Dandi.append([p1+", "+p3+" ;"+p2+", "+p4,"(1,3;2,4)SlokArXa-prawiloma-yamaka"])#print(p1,p3,";",p2,p4,"(1,3;2,4)SlokArXa-prawiloma-yamaka")
		elif y3==y4==1:	Dandi.append([p1+", "+p4+" ;"+p3+", "+p3,"(1,4;2,3)SlokArXa-prawiloma-yamaka"])#print(p1,p4,";",p2,p3,"(1,4;3,4)SlokArXa-prawiloma-yamaka")
		elif y1==1:	Dandi.append([p1+", "+p2,"(1,2)pAxa-prawiloma-yamaka"])#print(pada_lst[0],pada_lst[1],"(1,2)pAxa-prawiloma-yamaka")
		elif y2==1:	Dandi.append([p1+", "+p3,"(1,3)pAxa-prawiloma-yamaka"])#print(pada_lst[0],pada_lst[2],"(1,3)pAxa-prawiloma-yamaka")
		elif y3==1:	Dandi.append([p1+", "+p4,"(1,4)pAxa-prawiloma-yamaka"])#print(pada_lst[0],pada_lst[3],"(1,4)pAxa-prawiloma-yamaka")	
		elif y4==1:	Dandi.append([p2+", "+p3,"(2,3)pAxa-prawiloma-yamaka"])#print(pada_lst[1],pada_lst[2],"(2,3)pAxa-prawiloma-yamaka")	
		elif y5==1:	Dandi.append([p2+", "+p4,"(2,4)pAxa-prawiloma-yamaka"])#print(pada_lst[1],pada_lst[3],"(2,4)pAxa-prawiloma-yamaka")	
		elif y6==1:	Dandi.append([p3+", "+p4,"(3,4)pAxa-prawiloma-yamaka"])#print(pada_lst[2],pada_lst[3],"(3,4)pAxa-prawiloma-yamaka")	
		
			
		ax=md=an=yy=cd=av=d=cb=ca=0
		if len(Dandi)>0:
			ax=md=an=yy=cd=av=d=1		
		part=[]
		joint=[]
		jati=[]
		listd1=list_finald[:]
		for i in listd1:
			l = len (i) 
			l2=int(l/2) 
			l3=int(l*2)
			yy = 0
			for k in pada_lst:
				if i in k and i[:l2]==i[l2:]:
					yy=1
					jati.append("pAxaBAgagawa-avyapewa-vyapewa-yamaka" )
					if i[:l]==k[:l]:
						part.append("Axi")
						Bharata.append(['"'+answ(i[:l2])+'"',"sanxaRtaka-yamaka"])
						rmv(list_final2,i)
					if i[-l:]==k[-l:]:# how to check for i+i in start in stead of i
						part.append("anwya")
						Bharata.append(['"'+answ(i[l2:])+'"',"pAxAnwAmrediwa-yamaka"])
						rmv(list_final2,i)
					if i in k[1:-1]:
						part.append("maXya")
					i_part=list(set(part))
						
			if len(part)>=1:
				Dandi.append(['"'+answ(i)+'"',""+"".join(list(set(part)))+"-"+ " ".join(list(set(jati)))])						
				rmv(list_finald,i)		
				part=[]
			for k in pada_lst:
				if yy==0 and i in k:
					if i+i+i == k:
						joint.append("avyapewa-AximaXyAnwa-yamaka")
						d=1
					elif i+i==k :	
						joint.append("avyapewa-Axyanwa-yamaka")
						d=1
					elif i+i in k:
		#				av=1
						joint.append("avyapewa-yamaka")
						if i[:l]==k[:l]:
							part.append("Axi")
							ax=1
						elif i[-l:]==k[-l:]:
							part.append("anwya")
							an=1
						elif i in k[1:len(k)-1]:
							part.append("maXya")
							md=1
		#	print(part)
		#	part = list(part.sort())
			result_d= part+joint
		#	print("1",result_d)
		#	result_d.sort()
		#	print("2",result_d)
			if len(joint)>=1:
				result_d="-".join(list(dict.fromkeys(result_d)))
				Dandi.append(['"'+answ(i)+'"',result_d])
				rmv(list_finald,i)		
				joint=[]
				part= []										
		
		for n in reversed(range(4,len(pada_lst[0]))):
				if d==av==0:		
					if pada_lst[0][-n:]==pada_lst[1][:n]!="" and cd==0:	
						Dandi.append([answ('"'+pada_lst[0][-n:])+'"',"1,2-sanxaRta(anwAxi)-yamaka"])
						rmv(list_finald,pada_lst[0][-n:])
						cd=1
					if pada_lst[1][-n:]==pada_lst[2][:n]!="" and cb==0:
						Dandi.append(['"'+answ(pada_lst[1][-n:])+'"',"2,3-sanxaRta(anwAxi)-yamaka"])
						rmv(list_finald,pada_lst[1][-n:])
						cb=1
					if pada_lst[2][-n:]==pada_lst[3][:n]!="" and ca==0:	
						Dandi.append(['"'+answ(pada_lst[2][-n:])+'"',"3,4-sanxaRta(anwAxi)-yamaka"])		
						rmv(list_finald,pada_lst[2][-n:])
						ca=1
					
		list_finald=ak2(list_finald, p1)
		list_finald1=list_finald[:]	
		for i in list_finald1:
			l=len(i)
			for k in pada_lst:
				# print("k", k)
				if d==av==0:
					joint.append("vyapewa-yamaka")
					if i[:l]==k[:l] or i[:l]=="M"+k[:l]:
						part.append("Axi")
						ax=1
					if i[-l:]==k[-l:] or i[-l:]=="M"+k[-l:] or i[-l:]==k[-l-1:-1]:
						part.append("anwya")
						an=1
					if i in k[2:-2]:
						part.append("maXya")	
			result_d= part+joint
			result_d.sort()
			if len(joint)>=1:
				result_d="-".join(list(dict.fromkeys(result_d)))
				Dandi.append(['"'+answ(i)+'"',result_d])
				rmv(list_finald,i)		
				joint=[]
				part= []
		list_finald=ak2(list_finald, p1)
		if len(list_finald)>0:
			fnld=copy.deepcopy(list_finald)
			for i in list_finald:
				Dandi.append(['"'+answ(i)+'"',"-----"])
		if z10==1:
			Dandi.append(["-----","-----"])
		#print(Dandi)
		#print(tabulate(Dandi, headers="firstrow", tablefmt="fancy_grid"))				
		#===============BHARATA ===============================================================================================
		#print('\n-----Barawa-----_')
		adi=anta=knc=cv=pn=sn=by=0
		
		if len(Bharata)>0:
			adi=anta=knc=cv=pn=sn=by=1
		kn=[]
		part_B=[]
		if by==0:
			for k in pada_lst:
				for n in range(2,len(k)):
					if k[:n]==k[n:n*2]!="" and k[:n]+k[:n]!=k: 
						adi=1
						kn.append(answ(k[:n]))
						a1=k[:n]
					if k[-n:]==k[-n*2:-n]!="" and k[-n:]!=k:
						anta=1
						kn.append(answ(k[-n:]))
						b1=k[-n:]
					if adi==1 and anta==1:
						rmv(list_final2, a1)
						rmv(list_final2,b1)
						if k==pada_lst[0]:
							Bharata.append(['"'+a1+'",'+' "'+b1+'"',"(1)kAFcI-yamaka"])
						if k==pada_lst[1]:
							Bharata.append(['"'+a1+'",'+' "'+b1+'"',"(2)kAFcI-yamaka"])
						if k==pada_lst[2]:
							Bharata.append(['"'+a1+'",'+' "'+b1+'"',"(3)kAFcI-yamaka"])
						if k==pada_lst[3]:
							Bharata.append(['"'+a1+'",'+' "'+b1+'"',"(4)kAFcI-yamaka"])
						adi=anta=0
						kn=[]
						knc=1
		cv1=0
		for n in reversed(range(4,len(pada_lst[0]))):
			if by==knc==0:
				if pada_lst[0][-n:]==pada_lst[1][:n]!="":
					Bharata.append(['"'+answ(pada_lst[0][-n:])+'"',"1,2-cakravAla-yamaka"])	
					rmv(list_final2,pada_lst[0][-n:])
					cv=1
				if pada_lst[1][-n:]==pada_lst[2][:n]!="" and cv1==0 or pada_lst[1][-n-1:-1]==pada_lst[2][:n]!="" and cv1==0 or pada_lst[1][-n:]==pada_lst[2][:n+1]!="" and cv1==0:
					Bharata.append(['"'+answ(pada_lst[1][-n:])+'"',"2,3-cakravAla-yamaka"])
					rmv(list_final2,pada_lst[1][-n:])
					cv=1
					cv1=1
				if pada_lst[2][-n:]==pada_lst[3][:n]!="":
					Bharata.append(['"'+answ(pada_lst[2][-n:])+'"',"3,4-cakravAla-yamaka"])	
					rmv(list_final2,pada_lst[2][-n:])
					cv=1
		
		for i in list_final1:				
			l=int(len(i))
			l2=int(l/2) 
			l3=int(l*2)
			for k in pada_lst: 
				if i+i in k and i+i!=k:
					if i+i==k[-l*2:] and knc==0:
						pn=1
						Bharata.append(['"'+answ(i)+'"', "pAxAnwAmrediwa-yamaka"])
						rmv(list_final2,i)
						pn=1	
					if i+i==k[:l*2] or i[:l2]==i[l2:] :
						if cv==knc==0:
							sn=1
							Bharata.append(['"'+answ(i)+'"', "sanxaRtaka-yamaka"])					
							rmv(list_final2,i)	
							sn=1			
				if knc==cv==0:
					if i in k :
						if i+i==k and sn==pn==0:	
							part_B.append("pAxArXa-samuxgaka-yamaka")
							rmv(list_final2,i)
							sn=pn=1
						if i[:l]==k[:l] and sn==0 and l > 2:
							part_B.append("pAxAxi-yamaka")
							rmv(list_final2,i)
							ax=2
						if i[-l:]==k[-l:] and pn==0 and l > 2 or i[-l:]==k[-l-1:-1] and pn==0 and l > 2:
							part_B.append("pAxAnwa-yamaka")
							rmv(list_final2,i)
							an=2
			if len(part_B)>0:	
				Bharata.append(['"'+answ(i)+'"',("".join(list(dict.fromkeys(part_B))))])
				part_B=[]
				kA=sn=pn=0	

		list_final2=ak2(list_final2, p1)
		listty=list_final2[:]	
		if len(listty)>0:	
			for i in listty:
				Bharata.append(['"'+answ(i)+'"',"-----"])
				rmv(list_final1,i)
		
		if z10==1:
			Bharata.append(["-----", "-----"])
		#print(Bharata)
		#print(tabulate(Bharata, headers="firstrow", tablefmt="fancy_grid"))		
		# RD_for_lata = []
		for k in range(0,len(Rudrata)):
			Rudrata1[0]["@outp"].append({"@yamaka":Rudrata[k][0],"@prakAra":Rudrata[k][1]})
			# RD_for_lata.append(Rudrata[k][0])

		for k in range(0,len(Dandi)):
			Dandi1[0]["@outp"].append({"@yamaka":Dandi[k][0],"@prakAra":Dandi[k][1]})
		
		for k in range(0,len(Bharata)):
			Bharata1[0]["@outp"].append({"@yamaka":Bharata[k][0],"@prakAra":Bharata[k][1]})
		
		con_res=Rudrata1+Dandi1+Bharata1
		return con_res, LATA_list, pp1, pp2, pp3, pp4 
	
	else:		
		s1=' '.join(s1).split()
		s0=s1[0]#line1
		s01=seg(seg(s0))
		raw_ngram = vowel(s01)
		all_ngram=[]
		counted2_raw=[]
		for l in raw_ngram:
			for l1 in l:
				joint="".join(l)
			all_ngram.append(joint)
		
		for l in all_ngram:
			y=all_ngram.count(l)
			if y>1:
				counted2_raw.append(l)
				counted2_raw.sort(reverse=True, key=len)
		counted2_raw=list(set(counted2_raw)) #prints the repeated element.
		counted2_raw.sort(reverse=True, key=len)
		counted2=[]
		if len(counted2_raw)>0:
			counted2=[counted2_raw[0]]
		count=0
		for i in counted2_raw:
			for j in counted2:
				if i in j:
					count=count+1
			if count==0:
				counted2.append(i)
			count=0
		list_final=[]
		#print(counted2)
		#print(check)
		for i in counted2:
			l=len(i)
			if i[0]=="H":
				i=i[1:]
				list_final.append(i)
			else:	
				for k in range(3):
					if i[0:k+1]==i[l-k-1:l]:
						if i in check:
							list_final.append(i)
						elif i[:l-k-1] in check:
							i=i[:l-k-1]
							list_final.append(i)
						elif i[k+1:] in check:
							i=i[k+1:]
							list_final.append(i)
						else:
							list_final.append(i)	
						break
					if k==2:
						list_final.append(i)
						
		list_final = ' '.join(list_final).split()
		lk=[]
		for i in list_final:
			l=len(i)
			l2=int(l/2)
			l3=int(l/3)
			# print("l2", l2, "l3", l3)
			if i[:l2]==i[l2:]:
				# print("iiiiii",i)
				i = i[:l2]
			if i[:l3]==i[l3:l3*2]==i[l3*2:]:
				i =i[:l3]
			lk.append(i)	
		list_f=lk
		list_final=[]#rmv rudrata
		#to remove 'M' in the beginning
		for i in list_f:
			if i[0]=="M":
				i=i[1:]
				list_final.append(i)
			else:
				list_final.append(i)	
				
		list_final = ak22(list_final)
		# print("ak22re",list_final)

		Rudrata1=[{"@author":"AcArya ruxrata","@outp":[]}]
		
		Dandi1=[{"@author":"AcArya xaNdI","@outp":[]}]
		
		Bharata1=[{"@author":"AcArya Barawa","@outp":[]}]
		
		for k in range(0,len(list_final)):
			Rudrata1[0]["@outp"].append({"@yamaka":list_final[k],"@prakAra":"-----"})
			# RD_for_lata.append(Rudrata[k][0])

		for k in range(0,len(list_final)):
			Dandi1[0]["@outp"].append({"@yamaka":list_final[k],"@prakAra":"-----"})
		
		for k in range(0,len(list_final)):
			Bharata1[0]["@outp"].append({"@yamaka":list_final[k],"@prakAra":"-----"})
		# 
		con_res=Rudrata1+Dandi1+Bharata1
		pp1, pp2, pp3, pp4 = ["---"],["---"],["---"],["---"]	
		# print("list", list_final)
		#print(con_res)
		#print("------")
		#print(list_final)
		#print("------")
		#print(pp1)
		#print("------")
		#print(pp2)
		#print("------")
		#print(pp3)
		#print("------")
		#print(pp4)
		#print("------")
		return con_res, list_final, pp1, pp2, pp3, pp4
