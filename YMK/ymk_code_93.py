import re

s1=input("Enter a Sloka: ")

if re.search(r"n[ ]*[wWxXn]",s1):		
	s1=re.sub(r"n[ ]*([wWxXn])",r"#\1",s1)
	
if re.search(r"f[ ]*[kKgGf]",s1):		
	s1=re.sub(r"f[ ]*([kKgGf])",r"#\1",s1)
if re.search(r"F[ ]*[cCjJF]",s1):		
	s1=re.sub(r"F[ ]*([cCjJF])",r"#\1",s1)
if re.search(r"N[ ]*[tTdDN]",s1):		
	s1=re.sub(r"N[ ]*([tTdDN])",r"#\1",s1)				
if re.search(r"m[bBpPm]",s1):		
	s1=re.sub(r"m([bBpPm])",r"#\1",s1)

s1=' '.join(s1).split()

for n in range(len(s1)):
	if s1[n]==".":
		if s1[n-1]=="m":
			s1[n-1]="#"
s1=''.join(s1)
rpl= "Z "
for r in rpl:
	for s in s1:
		if r==s:
			s1=s1.replace(r,"")
s1=s1.replace("H","")			
check= s1#(without space)
check=check.replace(".","")
s1=''.join(s1)	
s1=s1.split(".")
s1=' '.join(s1).split()		

s0=s1[0]
s00=s1[1]

def vovel(s):
	vowels = ['a','A','e','E','i','I','o','O','u','U','q','Q','L','H',"#"]
	strg =""
	for letter in s:
		if letter in vowels:
			strg += letter + "-"	
		else:
      			strg += letter
	return strg
str=vovel(s0)
str2=vovel(s00)
		
vowel = ['a','A','e','E','i','I','o','O','u','U','q','Q','L','H']
new_word =""
new_word2=""
for letter in s0:
	if letter in vowel:
		new_word += letter + "-"	
		while letter=="#":
			new_word+=letter
	else:
      		new_word += letter
      		
for letter in s00:
	if letter in vowel:
		new_word2 += letter + "-"	
		while letter=="#":
			new_word2+=letter
	else:
      		new_word2 += letter 
#print(new_word)
#print(new_word2)      		
listt=[]
listt[:0]=new_word
for i in range(len(listt)):		
	if listt[i]=='#':
	        listt[i]="-"
	        listt[i-1]="#"
	if listt[i]=="H":
		listt[i]='-'
		listt[i-1]='H'	        

listt2=[]
listt2[:0]=new_word2
for i in range(len(listt2)):
	if listt2[i]=='#':
	        listt2[i]="-"
	        listt2[i-1]="#"
	if listt2[i]=="H":
		listt2[i]='-'
		listt2[i-1]='H'		
		
l=len(listt2)
ll=len(listt)
halant=['#','w','n','x','t','g','d','m']
for h in halant:
	if listt2[l-1]==h:
		listt2[l-1]="-"
		listt2[l-2]=h
	if listt[ll-1]==h:
		listt[ll-1]="-"
		listt[ll-2]=h	
			        	        	            
listt=''.join(listt)
listt2=''.join(listt2)
#print(listt)
#print(listt2)

pada1_2=listt.split("-")# makes list
pada1_2=' '.join(pada1_2).split()#(removes blank obj)

pada3_4=listt2.split("-")
pada3_4=" ".join(pada3_4).split()

def first_half(pada1_2):
	length=len(pada1_2)
	middle_index = length//2
	pada_1=pada1_2[:middle_index]
#	pada_1="".join(pada_1)
	return pada_1
	
def sec_half(pada1_2):
	length=len(pada1_2)
	middle_index = length//2
	pada_2=pada1_2[middle_index:]
#	pada_2="".join(pada_2)
	return pada_2

p1=(first_half(pada1_2))
p2=(sec_half(pada1_2))
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

#print(p1)
#print(p1a)
#print(p1b)
#print(p2)
#print(p2a)
#print(p2b)
#print(p3)
#print(p3a)
#print(p3b)
#print(p4)
#print(p4a)
#print(p4b)
def answ(ans):
	if re.search(r"#[wWxXn]",ans):		
		ans=re.sub(r"#([wWxXn])",r"n\1",ans)
	
	if re.search(r"#[kKgGf]",ans):		
		ans=re.sub(r"#([kKgGf])",r"f\1",ans)
		
	if re.search(r"#[cCjJF]",ans):		
		ans=re.sub(r"#([cCjJF])",r"F\1",ans)
	
	if re.search(r"#[tTdDN]",ans):		
		ans=re.sub(r"#([tTdDN])",r"N\1",ans)				
	
	if re.search(r"#[pBbP]",ans):		
		ans=re.sub(r"#([bBpP])",r"m\1",ans)
	
	else:
		ans=re.sub("#","m",ans)	
		return ans
def pankti(p1,p2,p3,p4,a):
	if p1==p2==p3==p4:
		print(answ(p1),a)
		return True
	else:
		return False
			
def yugmaka(p1,p2,p3,p4,a):
	if p1==p2 and p3==p4:
		print(answ(p1),answ(p3),a)
		return True
	else:
		return False	 		
def p8_samu(p1a,p1b,p2a,p2b,p3a,p3b,p4a,p4b,a):
#for samswa p.s., chakraka,ardha_pari
	if p1a==p1b and p2a==p2b and p3a==p3b and p4a==p4b:
		print(answ(p1a),answ(p2a),answ(p3a),answ(p4a),a)
		return True
	else:	
		return False		 	
def p6_samu(p1a,p1b,p2a,p2b,p3a,p3b,a):#for p.s, vamsa,						 	
	if p1a==p1b and p2a==p2b and p3a==p3b:
		print(answ(p1a),answ(p2a),answ(p3a),a)
		return True
	else:
		return False
def p2_samu(p1a,p1b,a):#for all mukhadi single ymk, and all vyasta
	if p1a==p1b:
		print(answ(p1a),a)
		return True
	else :
		return False	

Z=Y=X=U=0
if Z==0:
	if pankti(p1,p2,p3,p4,"yamaka-Bexa: samaswa-pAxaja-pAxAvqwwi-pafkwi-yamaka") is True:	Z=1
if Z==0: 
	if pankti(p1a,p2a,p3a,p4a,"yamaka-Bexa: ekaxeSaja-pAxAxi-BAgAvqwwi-pafkwi-yamaka") is True:	Z=1			
if Z==0:
	if pankti(p1b,p2b,p3b,p4b,"yamaka-Bexa: ekaxeSaja-pAxAnwa-BAgAvqwwi-yugmaka-yamaka") is True:	Z=1
if Z==0:
	if yugmaka(p1,p2,p3,p4,"yamaka-Bexa: samaswa-pAxaja-pAxAvqwwi-yugmaka-yamaka") is True:	Z=1
if Z==0:
	if yugmaka(p1a,p2a,p3a,p4a,"yamaka-Bexa: ekaxeSaja-pAxAxi-BAgAvqwwi-yugmaka-yamaka") is True:	Z=1
if Z==0:
	if yugmaka(p1b,p2b,p3b,p4b,"yamaka-Bexa: ekaxeSaja-pAxAnwa-BAgAvqwwi-yugmaka-yamaka") is True:	Z=1
if Z==0:
	if yugmaka(p1,p3,p2,p4,"yamaka-Bexa: samaswa-pAxaja-pAxAvqwwi-samudgaka-yamaka") is True:	Z=1
if Z==0:
	if yugmaka(p1a,p3a,p2a,p4a,"yamaka-Bexa: ekaxeSaja-pAxAxi-BAgAvqwwi-samuxgaka-yamaka") is True:	Z=1
if Z==0:
	if yugmaka(p1b,p3b,p2b,p4b,"yamaka-Bexa: ekaxeSaja-pAxAnwa-BAgAvqwwi-samuxgaka-yamaka") is True:	Z=1		
if Z==0:
	if yugmaka(p1,p4,p2,p3,"yamaka-Bexa: samaswa-pAxaja-pAxAvqwwi-parivqwwi-yamaka") is True:	
		Z=1
if Z==0:
	if yugmaka(p1a,p4a,p2a,p3a,"yamaka-Bexa: ekaxeSaja-pAxAxi-BAgAvqwwi-parivqwwi-yamaka") is True:	Z=1	
if Z==0:
	if yugmaka(p1b,p4b,p2b,p3b,"yamaka-Bexa: ekaxeSaja-pAxAnwa-BAgAvqwwi-parivqwwi-yamaka") is True:	Z=1
if Z==0:
	if p8_samu(p1a,p2b,p1b,p2a,p3a,p4b,p3b,p4a,"yamaka-Bexa: ekaxeSaja-arXaparivqwwi-yamaka") is True:	Z=1
if Z==0:
	if p8_samu(p1a,p1b,p2a,p2b,p3a,p3b,p4a,p4b,"yamaka-Bexa: ekaxeSaja-samaswa-pAxasamuxgaka-yamaka") is True:	Z=1	
if Z==0:
	if p8_samu(p1a,p2b,p2a,p3b,p3a,p4b,p4a,p1b,"yamaka-Bexa: ekaxeSaja-samaswa-Axyanwika-cakraka-yamaka") is True:	Z=1
if Z==0:
	if p8_samu(p1b,p2a,p2b,p3a,p3b,p4a,p4b,p1a,"yamaka-Bexa: ekaxeSaja-samaswa-anwAxika-cakraka-yamaka") is True:	Z=1
if Z==0:
	if p6_samu(p1a,p1b,p2a,p2b,p3a,p3b,"yamaka-Bexa: ekaxeSaja-samaswa-ananwariwa-pAxasamuxgaka-yamaka") is True:	Z=1
if Z==0:
	if p6_samu(p2a,p2b,p3a,p3b,p4a,p4b,"yamaka-Bexa: ekaxeSaja-samaswa-ananwariwa-pAxasamuxgaka-yamaka") is True:	Z=1	
if Z==0:
	if p6_samu(p1a,p1b,p2a,p2b,p4a,p4b,"yamaka-Bexa: ekaxeSaja-samaswa-anwariwa-pAxasamuxgaka-yamaka") is True:
		Z=1
if Z==0:
	if p6_samu(p2a,p2b,p3a,p3b,p4a,p4b,"yamaka-Bexa: ekaxeSaja-samaswa-anwariwa-pAxasamuxgaka-yamaka") is True:	Z=1
if Z==0:
	if p6_samu(p1a,p2b,p2a,p3b,p3a,p4b,"yamaka-Bexa: ekaxeSaja-samaswa-Axyanwika-vamSa-yamaka") is True:	Z=1
if Z==0:
	if p6_samu(p1b,p2a,p2b,p3a,p3b,p4a,"yamaka-Bexa: ekaxeSaja-samaswa-anwAxika-vamSa-yamaka") is True:	Z=2
#if Z==0:
#	if yugmaka(p1a,p2b,p3a,p4b,"yamaka-Bexa: ekaxeSaja-samaswa-Axyanwika-yamaka") is True:	Z=1
#if Z==0:
#	if yugmaka(p1b,p2a,p3b,p4a,"yamaka-Bexa: ekaxeSaja-samaswa-anwAxika-yamaka") is True:	Z=1
##################################################
A=B=C=D=E=F=0
if Z==0:
	if yugmaka(p1a,p2b,p3a,p4b,"yamaka-Bexa: ekaxeSaja-samaswa-Axyanwika-yamaka") is True:	U=1
	if yugmaka(p1b,p2a,p3b,p4a,"yamaka-Bexa: ekaxeSaja-samaswa-anwAxika-yamaka") is True:	Y=1
	
	if p2_samu(p1,p2,"yamaka-Bexa: samaswa-pAxaja-pAxAvqwwi-muKa-yamaka") is True:	A=1
	if A==0:
		if p2_samu(p1a,p2a,"yamaka-Bexa: ekaxeSaja-pAxAxi-BAgAvqwwi-muKa-yamaka") is True:	A=1 
		if p2_samu(p1b,p2b,"yamaka-Bexa: ekaxeSaja-pAxAnwa-BAgAvqwwi-muKa-yamaka") is True:	A=1
		if yugmaka(p1a,p1b,p2a,p2b,"yamaka-Bexa: ekaxeSaja-samaswa-ananwariwa-pAxasamuxgaka-yamaka") is True:	A=1		
	if A==U==0:
		if p2_samu(p1a,p2b,"yamaka-Bexa: ekaxeSaja-vyaswa-Axyanwika-yamaka") is True:	A=1
	if A==Y==0:	
		if p2_samu(p1b,p2a,"yamaka-Bexa: ekaxeSaja-vyaswa-anwAxika-yamaka") is True:	A=1				
	
	if p2_samu(p3,p4,"yamaka-Bexa: samaswa-pAxaja-pAxAvquwwi-pucCa-yamaka") is True:	B=1 		
	if B==0:
		if p2_samu(p3a,p4a,"yamaka-Bexa: ekaxeSaja-pAxAxi-BAgAvqwwi-pucCa-yamaka") is True:	B=1
		if p2_samu(p3b,p4b,"yamaka-Bexa: ekaxeSaja-pAxAnwa-BAgAvqwwi-pucCa-yamaka") is True:	B=1
		if yugmaka(p3a,p3b,p4a,p4b,"yamaka-Bexa: ekaxeSaja-samaswa-ananwariwa-pAxasamuxgaka-yamaka") is True:	B=1
	if B==U==0: 	
		if p2_samu(p3a,p4b,"yamaka-Bexa: ekaxeSaja-vyaswa-Axyanwika-yamaka") is True:	B=1
	if B==Y==0:	
		if p2_samu(p3b,p4a,"yamaka-Bexa: ekaxeSaja-vyaswa-anwAxika-yamaka") is True:	B=1		

	if p2_samu(p2,p3,"yamaka-Bexa: samaswa-pAxaja-pAxAvquwwi-garBa-yamaka") is True:	C=1	
	if C==0:
		if p2_samu(p2a,p3a,"yamaka-Bexa: ekaxeSaja-pAxAxi-BAgAvqwwi-garBa-yamaka") is True:	C=1
		if p2_samu(p2b,p3b,"yamaka-Bexa: ekaxeSaja-pAxAnwa-BAgAvqwwi-garBa-yamaka") is True:	C=1
		if yugmaka(p2a,p2b,p3a,p3b,"yamaka-Bexa: ekaxeSaja-samaswa-ananwariwa-pAxasamuxgaka-yamaka") is True:	C=1
	if C==0:	
		if p2_samu(p2a,p3b,"yamaka-Bexa: ekaxeSaja-vyaswa-Axyanwika-maXya-yamaka") is True:	C=1
		if p2_samu(p2b,p3a,"yamaka-Bexa: ekaxeSaja-vyaswa-anwAxika-maXya-yamaka") is True: C=1			
		
	if p2_samu(p1,p4,"yamaka-Bexa: samaswa-pAxaja-pAxAvqwwi-Avqwwi-yamaka") is True:	D=1
	if D==0:
		if p2_samu(p1a,p4a,"yamaka-Bexa: ekaxeSaja-pAxAxi-BAgAvqwwi-Avqwwi-yamaka") is True:	D=1
		if p2_samu(p1b,p4b,"yamaka-Bexa: ekaxeSaja-pAxAnwa-BAgAvqwwi-Avqwwi-yamaka")	is True:	D=1
		if yugmaka(p1a,p1b,p4a,p4b,"yamaka-Bexa: ekaxeSaja-samaswa-anwariwa-pAxasamuxgaka-yamaka") is True:
			D=1		
	if p2_samu(p1,p3,"yamaka-Bexa: samaswa-pAxaja-pAxAvqwwi-sanxamSa-yamaka") is True:	E=1
	if E==0:
		if p2_samu(p1a,p3a,"yamaka-Bexa: ekaxeSaja-pAxAxi-BAgAvqwwi-sanxaMSa-yamaka") is True:	E=1
		if p2_samu(p1b,p3b,"yamaka-Bexa: ekaxeSaja-pAxAnwa-BAgAvqwwi-sanxaMSa-yamaka") is True:	E=1
		if yugmaka(p1a,p1b,p3a,p3b,"yamaka-Bexa: ekaxeSaja-samaswa-anwariwa-pAxasamuxgaka-yamaka") is True:	E=1				 

	if p2_samu(p2,p4,"yamaka-Bexa: samaswa-pAxaja-pAxAvquwwi-sanxaRtaka-yamaka") is True:	F=1
	if F==0:
		if p2_samu(p2a,p4a,"yamaka-Bexa: ekaxeSaja-pAxAxi-BAgAvqwwi-sanxaRtaka-yamaka") is True: F=1
		if p2_samu(p2b,p4b,"yamaka-Bexa: ekaxeSaja-pAxAnwa-BAgAvqwwi-sanxaRtaka-yamaka") is True: F=1	
		if yugmaka(p2a,p2b,p4a,p4b,"yamaka-Bexa: ekaxeSaja-samaswa-anwariwa-pAxasamuxgaka-yamaka") is True:	F=1	
	if A==D==E==0:	
		if p2_samu(p1a,p1b,"yamaka-Bexa: ekaxeSaja-vyaswa-pAxasamuxgaka-yamaka") is True:	X=1
	if A==C==F==0:	
		if p2_samu(p2a,p2b,"yamaka-Bexa: ekaxeSaja-vyaswa-pAxasamuxgaka-yamaka") is True:	X=1	
	if B==C==E==0:	
		if p2_samu(p3a,p3b,"yamaka-Bexa: ekaxeSaja-vyaswa-pAxasamuxgaka-yamaka") is True:	X=1
	if B==D==F==0:	
		if p2_samu(p4a,p4b,"yamaka-Bexa: ekaxeSaja-vyaswa-pAxasamuxgaka-yamaka") is True:	X=1		
	if A==B==C==D==E==F==Z==X==0:
		print("Unknown kind of ymk! ")
print(A,B,C,D,E,F,Z,X,Y,U)		
#print(p1a,p2a, p3a,p4a)
##############################################################################################


	
	

		
						
