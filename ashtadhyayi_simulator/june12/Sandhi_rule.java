class Sandhi_rule{//The class can handle all the Sandhi rules
	String lphone;//lphone represents the category of left phoneme such as 'ik', 'ac' etc.
	String rphone;//same for right phoneme
	String lphone_attr;//attributes of left phoneme(word) such as prAwipaxika
	String rphone_attr;//attributes of right phoneme
	String rule_number;//rule number
	String rule_upaxeSa;//the rule wordings
	boolean is_other;//used till now for special case such as akaH savarNe xIrGaH, has to be generalized further
	get_SabdarUpa_new main_ins=new get_SabdarUpa_new();
	Sandhi_rule(String r,String u,String l,String rp){//a constructor when only the classes are to be used
		rule_number=r;
		rule_upaxeSa=u;
		lphone=l;
		rphone=rp;
		is_other=false;
		lphone_attr="";
		rphone_attr="";
	}
	
	Sandhi_rule(String r,String u,String l,String rp,String l_at, String r_at){//a constructor when only the classes are to be used
		rule_number=r;
		rule_upaxeSa=u;
		lphone=l;
		rphone=rp;
		is_other=false;
		lphone_attr=l_at;
		rphone_attr=r_at;
	}
	
	Sandhi_rule(String r,String u,String l,String rp, boolean sav){// constructor for akaH...
		rule_number=r;
		rule_upaxeSa=u;
		lphone=l;
		rphone=rp;
		is_other=true;
		lphone_attr="";
		rphone_attr="";
	}
	boolean condition(input_DS prakriyA,int i){//checks for conditions and returns true only if all are satisfied
		String lword=prakriyA.words[i];
		String lword_char=prakriyA.attrib_words[i];
		String rword=prakriyA.words[i+1];
		String rword_char=prakriyA.attrib_words[i+1];		
		//String check_afga_ending=
		boolean status=true;
		if(lphone.length()>0){
			if(!(belongs(main_ins.anwyam(lword), lphone))){//System.out.println(rule_number+"1st");
				status=false;
				return status;
			}
		}
		
		if(rphone.length()>0){
			if(!(belongs(rword.substring(0,1), rphone))){//System.out.println(rule_number+"2nd");
				status=false;
				return status;
			}
		}
		
		if(lphone_attr.length()>0){
			if(!(belongs(lphone_attr, lword_char))){//System.out.println(rule_number+"3rd");
				status=false;
				return status;
			}
		}
		
		if(rphone_attr.length()>0){
			if(!(belongs(rphone_attr, rword_char))){//System.out.println(rule_number+"4th");
				status=false;				
				return status;
			}
		}
		if(is_other){
			if(!(is_savarNa(get_SabdarUpa_new.anwyam(lword),rword.substring(0,1)))){
				status=false;				
				return status;
			}
		}
		
		return status;
	}
	
	
	String domain(String l, String r){//a function which operte on rule and tells the domain (one of the l and r needs to be empty. l is the left phoneme and r is the right phoneme
		if(is_other){//specially for akaH...
			if(r.length()==0){
				return savarNa(l);
			}
			else{
				return savarNa(r);
			}
		}
		else{
			if(r.length()==0){//check the right context
				return rphone;
			}
			else{//check the right context
				return lphone;
			}
		}
	}		
		
	boolean belongs(String a, String b){
			boolean answer=false;
			if((b.indexOf("+")==-1)&&(b.indexOf("|")==-1)&&(b.indexOf("!")==-1)){
				String temp[]=a.split("[+]");
				for(int i=0;i<temp.length;i++){
					String temp1[]=temp[i].split("[|]");
					answer=false;
					for(int j=0;j<temp1.length;j++){
						if(temp1[j].indexOf("!")==0){						
							if(b.indexOf(temp1[j].substring(1))==-1){
								answer=true;
							}
						}
						else{
							if(b.indexOf(temp1[j])!=-1){
								answer=true;
							}
						}
					}
					if(!(answer)){
						return answer;
					}
				}
				return answer;
			}
			else{
				String temp[]=b.split("[+]");
				for(int i=0;i<temp.length;i++){
					String temp1[]=temp[i].split("[|]");
					answer=false;
					for(int j=0;j<temp1.length;j++){
						if(temp1[j].indexOf("!")==0){						
							if(temp1[j].substring(1).indexOf(a)==-1){
								answer=true;
							}
						}
						else{
							if(temp1[j].indexOf(a)!=-1){
								answer=true;
							}
						}
					}
					if(!(answer)){
						return answer;
					}
				}
				return answer;
			}	
				
		}
	boolean is_savarNa(String a, String b){
		if(belongs(a,savarNa(b))){
			return true;
		}
		
			return false;
	}
	
	String savarNa(String ch){//needs to be fully made for all the vowels at least.
		String output="";
		char to_chk=ch.charAt(0);
		switch(to_chk){
			case 'u':
			case 'U':
				output="uU";
			        break;
			case 'a':
			case 'A':
				output="aA";
			        break;
			case 'i':
			case 'I':
				output="iI";
			        break;
			case 'q':
			case 'Q':
				output="qQ";
			        break;
			default:
				break;
		}
		return output;
	}
	
	String apply_Sandhi_rule(input_DS prakriyA, int i){
		String lword=prakriyA.words[i];
		String rword=prakriyA.words[i+1];
		char lword_phone=lword.charAt(lword.length()-1);//get the left phone
		char rword_phone=rword.charAt(0);//get the right phone
		String sandhi_part="";	
		if(rule_number=="6-1-77"){
			String lphone_mod="";
			switch(lword_phone){
				case 'i':
				case 'I':
					lphone_mod="y";break;
				case 'u':
				case 'U':
					lphone_mod="v";break;
				case 'q':
				case 'Q':
					lphone_mod="r";break;
				case 'L':
					lphone_mod="l";break;
				default:
					break;
			}
			sandhi_part=lphone_mod+rword_phone+"";
		}
		
		else if(rule_number=="6-1-78"){
			String lphone_mod="";
			switch(lword_phone){
				case 'e':
					lphone_mod="ay";break;
				case 'E':
					lphone_mod="Ay";break;
				case 'o':
					lphone_mod="av";break;
				case 'O':
					lphone_mod="Av";break;
				default:
					break;
			}
			sandhi_part=lphone_mod+rword_phone+"";
		}
		
		else if(rule_number=="6-1-87"){
			sandhi_part=guNa(rword_phone);
		}
		
		else if(rule_number=="6-1-88"){
			sandhi_part=vqxXi(rword_phone);
		}
		else if(rule_number=="6-1-89"){
			sandhi_part=vqxXi(rword_phone);
		}
		else if(rule_number=="6-1-90"){
			sandhi_part=vqxXi(rword_phone);
		}
		else if(rule_number=="6-1-93"){
			sandhi_part="A";
		}
		else if((rule_number=="6-1-94")||(rule_number=="6-1-95")||(rule_number=="6-1-96")||(rule_number=="6-1-97")){
			sandhi_part=""+rword_phone;
		}		
		else if(rule_number=="6-1-101"){
			switch(lword_phone){
				case 'u':
				case 'U':
					sandhi_part="U";
					break;
				case 'a':
				case 'A':
					sandhi_part="A";
					break;
				case 'i':
				case 'I':
					sandhi_part="I";
					break;
				case 'q':
				case 'Q':
					sandhi_part="Q";
					break;
				case 'L':
					sandhi_part="L";
					break;
				default:
					break;
			}
			//System.out.println(
		}
		
		else if(rule_number=="6-1-102"){
			sandhi_part=get_SabdarUpa_new.do_xIrGa(lword_phone);//xIrGa is a function of main class that accept char as input and return a string with its xIrGa			
		}
		
		else if(rule_number=="6-1-104"){
			sandhi_part=""+rword_phone;//to be changed
		}
		else if(rule_number=="6-1-105"){
			sandhi_part=""+rword_phone;//to be changed
		}
		else if(rule_number=="6-1-68"){
			sandhi_part=""+lword_phone;//to be changed
		}
		else if((rule_number=="6-1-107")||(rule_number=="6-1-109")||(rule_number=="6-1-110")){
			sandhi_part=""+lword_phone;//to be changed
		}
		
		else if(rule_number=="6-1-111"){
			sandhi_part="u";//to be changed into a recursive structure
		}
		else if(rule_number=="6-1-112"){
			sandhi_part="u";//to be changed into a recursive structure
		}
		String output_form=lword.substring(0,lword.length()-1)+sandhi_part+rword.substring(1);
		return output_form;		
	}
					
			
				
		
		
	
		String vqxXi(char aa){
			String output="";
			switch(aa){
				case 'a':
				case 'A':
					output="A";break;
				case 'i':
				case 'I':
				case 'e':
				case 'E':
					output="E";break;
				case 'u':
				case 'U':
				case 'o':
				case 'O':
					output="O";break;
				case 'q':
				case 'Q':
					output="Ar";break;
				case 'L':
					output="Al";break;
				default:
					break;
			}
			
			return output;
		}			
					
				
		String guNa(char aa){
			String output="";
			switch(aa){
				case 'a':
				case 'A':
					output="a";break;
				case 'i':
				case 'I':
				case 'e':
				case 'E':
					output="e";break;
				case 'u':
				case 'U':
				case 'o':
				case 'O':
					output="o";break;
				case 'q':
				case 'Q':
					output="ar";break;
				case 'L':
					output="al";break;
			}
			
			return output;
		}		
			
}