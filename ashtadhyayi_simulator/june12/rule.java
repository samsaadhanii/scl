import java.util.regex.*;
class rule{
	String lword_regex;//for defau
	String rword_regex;
	String lword_attrib;
	String rword_attrib;
	String rule_number;//rule number
	String rule_category;//afga_viXi etc.
	String special;
	boolean is_other=true;
	
	rule(String r,String c,String af_en, String praw, String af_att, String praw_att){
		rule_number=r;
		rule_category=c;
		lword_regex=af_en;
		rword_regex=praw;
		lword_attrib=af_att;
		rword_attrib=praw_att;
		special="";
	}
	
	rule(String r,String c,String af_en, String praw, String af_att, String praw_att, boolean sav){
		rule_number=r;
		rule_category=c;
		lword_regex=af_en;
		rword_regex=praw;
		lword_attrib=af_att;
		rword_attrib=praw_att;
		special="";
		is_other=sav;
	}
	
	rule(String r,String c,String af_en, String praw){
		rule_number=r;
		rule_category=c;
		lword_regex=af_en;
		rword_regex=praw;
		lword_attrib="";
		rword_attrib="";
		special="";
	}
	
	
	rule(String r,String c,String af_en, String praw,boolean sav){
		rule_number=r;
		rule_category=c;
		lword_regex=af_en;
		rword_regex=praw;
		lword_attrib="";
		rword_attrib="";
		special="";
		is_other=sav;
	}
	rule(String r,String c,String af_en, String praw, String af_att, String praw_att,String spec){
		rule_number=r;
		rule_category=c;
		lword_regex=af_en;
		rword_regex=praw;
		lword_attrib=af_att;
		rword_attrib=praw_att;
		special=spec;
	}
	
	
	boolean condition(input_DS prakriyA, int index){//checks for conditions and returns true only if all are satisfied
		//========index value should be the index of left word==============//
		String root_word=prakriyA.words[index];
		String root_word_char=prakriyA.attrib_words[index];
		String prawyaya1=prakriyA.words[index+1];
		String prawyaya1_char=prakriyA.attrib_words[index+1];		
		boolean status=true;
		if(!(Pattern.matches(lword_regex, root_word))){
			//System.out.println(rule_number+"1st");
			status=false;
			return status;
		}
		//if(prawyaya1.length()>0){
			if(!(Pattern.matches(rword_regex, prawyaya1))){//System.out.println(rule_number+"2nd");
				//if(rule_number.equals("7-2-101")){System.out.println(rword_regex+" "+prawyaya1);}
				status=false;
				return status;
			}
		//}
		if(lword_attrib.length()>0){//System.out.println("3rd");
			if(!(belongs(lword_attrib, root_word_char))){
				//System.out.println(rule_number+"3rd");
				//if(rule_number.equals("6-4-82")){
				//	System.out.println(lword_attrib+ root_word_char);
				//}
				status=false;
				return status;
			}
		}
		
		if(rword_attrib.length()>0){//System.out.println("4th");
			if(!(belongs(rword_attrib, prawyaya1_char))){//System.out.println(rule_number+"4th");
				//if(rule_number=="6-1-107"){
				//	System.out.println(rword_attrib+prawyaya1_char);
				//}
				status=false;				
				return status;
			}
			//System.out.println(prawyaya_attrib+" "+status);
		}
		if(!(is_other)){
			status=false;
			return status;
		}
		return status;
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
	
	String anwyam(String a){
		return a.substring(a.length()-1,a.length());
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
	input_DS apply_rule(input_DS prakriyA){	
		String prawyaya_value="";
		if(rule_number=="3-1-68"){
			input_DS a=new input_DS("Sap","prawyaya, vikiraNa, upaxeSa");
			a=get_SabdarUpa_new.iw(a);
			prakriyA.insert(a,1);
		}
		else if(rule_number=="3-4-85"){
			prakriyA.add("f-iw",1);
		}
		else if(rule_number=="3-4-86"){
			prakriyA.words[1].replace("i","u");
		}
		else if(rule_number=="3-4-101"){
			if(belongs("root(was)",prakriyA.attrib_words[1])){
				prakriyA=get_SabdarUpa_new.substitute(prakriyA,"wAm",1);
			}
			else if(belongs("root(Was)",prakriyA.attrib_words[1])){
				prakriyA=get_SabdarUpa_new.substitute(prakriyA,"wam",1);
			}
			else if(belongs("root(Wa)",prakriyA.attrib_words[1])){
				prakriyA=get_SabdarUpa_new.substitute(prakriyA,"wa",1);
			}
			else if(belongs("root(mip)",prakriyA.attrib_words[1])){
				prakriyA=get_SabdarUpa_new.substitute(prakriyA,"am",1);
			}
		}
		else if(rule_number=="3-4-113"){
			//System.out.println("sarvadhatuka will be added");
			prakriyA.add("sArvaXAwuka",1);
		}
		else if(rule_number=="3-4-115"){
			prakriyA.add("ArXaXAwuka",1);
		}
		else if(rule_number=="6-1-68"){
			prakriyA.words[1]="";
		}
		else if(rule_number=="6-1-103"){
			prakriyA.words[1]=prakriyA.words[1].substring(0,prakriyA.words[1].length()-1)+"n";
		}		
		else if(rule_number=="6-1-112"){
			prakriyA.words[1]="us";
		}
		else if(rule_number=="6-1-131"){
			prakriyA=get_SabdarUpa_new.substitute(prakriyA,"u",0);
		}
		else if((rule_number=="6-4-3")||(rule_number=="6-4-2")||(rule_number=="6-4-6")){
			prakriyA.words[0] = prakriyA.words[0].substring(0,prakriyA.words[0].length()-1)+get_SabdarUpa_new.do_xIrGa(anwyam(prakriyA.words[0]).charAt(0));
			//process[process_status]="a->e";
			//process_status++;
		}
		else if((rule_number=="6-4-7")||(rule_number=="6-4-8")||(rule_number=="6-4-11")||(rule_number=="6-4-13")||(rule_number=="6-4-14")||(rule_number=="6-4-15")){
			prakriyA.words[0] =prakriyA.words[0].substring(0,prakriyA.words[0].length()-2)+get_SabdarUpa_new.do_xIrGa(prakriyA.words[0].charAt(prakriyA.words[0].length()-2))+anwyam(prakriyA.words[0]);
			//prakriyA.words[1] ="O";
		}
		else if(rule_number=="6-4-10"){
			prakriyA.words[0] =prakriyA.words[0].substring(0,prakriyA.words[0].length()-3)+get_SabdarUpa_new.do_xIrGa(prakriyA.words[0].charAt(prakriyA.words[0].length()-3))+prakriyA.words[0].substring(prakriyA.words[0].length()-2);
		}
		else if(rule_number=="6-4-12"){
			if(belongs("AxeSa(Si)",prakriyA.attrib_words[1])){
				prakriyA.words[0] =prakriyA.words[0].substring(0,prakriyA.words[0].length()-2)+get_SabdarUpa_new.do_xIrGa(prakriyA.words[0].charAt(prakriyA.words[0].length()-2))+anwyam(prakriyA.words[0]);
			}
		}
		else if(rule_number=="6-4-77"){
			if(belongs("IkArAnwa|ikArAnwa",prakriyA.attrib_words[0])){
				prakriyA=get_SabdarUpa_new.substitute(prakriyA,"iyaf,2",0);
			}
			else{
				prakriyA=get_SabdarUpa_new.substitute(prakriyA,"uvaf,2",0);
			}
			//prakriyA.words[0] =prakriyA.words[0].substring(0,prakriyA.words[0].length()-1);
		}
		else if((rule_number=="6-4-79")||(rule_number=="6-4-80")){
			prakriyA=get_SabdarUpa_new.substitute(prakriyA,"iyaf,2",0);
		}
		else if((rule_number=="6-4-82")||(rule_number=="6-4-83")||(rule_number=="6-4-84")){
			prakriyA.words[0] =prakriyA.words[0].substring(0,prakriyA.words[0].length()-1)+get_SabdarUpa_new.do_yaNa(anwyam(prakriyA.words[0]).charAt(0));
			prakriyA.add("AxeSa(yaNa)",0);
		}
		else if(rule_number=="6-4-88"){
			prakriyA=get_SabdarUpa_new.augment(prakriyA,"vuk,1",0);
		}
		else if((rule_number=="6-4-127")||(rule_number=="6-4-128")){
			prakriyA=get_SabdarUpa_new.substitute(prakriyA,"wq,1",0);
		}
		/*else if(rule_number=="6-4-130"){
			prakriyA=get_SabdarUpa_new.substitute(prakriyA,"wq,1",0,"pAx");
			//=============Make the new function overloaded for substitute====================//
		}*/
		else if(rule_number=="6-4-133"){
			if(prakriyA.words[0].equals("maGavan")){
				prakriyA.words[0]="maGon";
			}
			if(prakriyA.words[0].equals("Svan")){
				prakriyA.words[0]="Sun";
			}
			if(prakriyA.words[0].equals("yuvan")){
				prakriyA.words[0]="yUn";
			}
		}
		else if((rule_number=="6-4-134")||(rule_number=="6-4-136")){
			prakriyA.words[0] =prakriyA.words[0].substring(0,prakriyA.words[0].length()-2)+"n";
		}
		else if(rule_number=="6-4-140"){
			prakriyA.words[0] =prakriyA.words[0].substring(0,prakriyA.words[0].length()-1);
		}
		else if(rule_number=="6-4-143"){
			String ti_afga=get_SabdarUpa_new.ti(prakriyA.words[0]);
			if(ti_afga.length()>0){
				int ti_ind=prakriyA.words[0].lastIndexOf(ti_afga);
				prakriyA.words[0] =prakriyA.words[0].substring(0,ti_ind);
			}
		}
		else if(rule_number=="7-1-3"){
			prakriyA.words[1].replace("J","anw");
		}
		
		else if(rule_number=="7-1-9"){
			prawyaya_value = "Es";
			prakriyA=get_SabdarUpa_new.substitute(prakriyA,prawyaya_value,1);
		}
		else if(rule_number=="7-1-12"){
			if(belongs("wqwIyA", prakriyA.attrib_words[1])){
				prawyaya_value = "ina";
			}
			else if(belongs("paFcamI", prakriyA.attrib_words[1])){
				prawyaya_value = "Aw";
			}
			else{
				prawyaya_value = "sya";
			}
			prakriyA=get_SabdarUpa_new.substitute(prakriyA,prawyaya_value,1);
		}
		else if(rule_number=="7-1-13"){
			prawyaya_value = "ya";
			prakriyA=get_SabdarUpa_new.substitute(prakriyA,prawyaya_value,1);
			prakriyA.remove("@root(fe)",1);
		}
		
		else if(rule_number=="7-1-14"){
			prakriyA=get_SabdarUpa_new.substitute(prakriyA,"smE",1);
		}
		else if((rule_number=="7-1-15")||(rule_number=="7-1-16")){
			if(belongs("root(fasi,3)",prakriyA.attrib_words[1])){
				prakriyA=get_SabdarUpa_new.substitute(prakriyA,"smAw",1);
			}
			if(belongs("root(fi)",prakriyA.attrib_words[1])){
				prakriyA=get_SabdarUpa_new.substitute(prakriyA,"smin",1);
			}
		}
			
		else if(rule_number=="7-1-17"){
			prakriyA=get_SabdarUpa_new.substitute(prakriyA,"SI",1);
		}
		else if((rule_number=="7-1-19")||(rule_number=="7-1-18")){
			prawyaya_value = "SI";
			prakriyA=get_SabdarUpa_new.substitute(prakriyA,prawyaya_value,1);
		}
		else if(rule_number=="7-1-20"){
			prawyaya_value = "Si";
			prakriyA=get_SabdarUpa_new.substitute(prakriyA,prawyaya_value,1);
		
		}
		else if(rule_number=="7-1-21"){
			prawyaya_value = "OS";
			prakriyA=get_SabdarUpa_new.substitute(prakriyA,prawyaya_value,1);
		}
		else if((rule_number=="7-1-22")||(rule_number=="7-1-23")){
			//System.out.println("prakriyA at the rule  "+prakriyA.get_output());
			prawyaya_value = "";
			prakriyA.words[1]="";
			prakriyA.attrib_words[1]="";
			prakriyA.add("paxa",0);
		}
		else if(rule_number=="7-1-24"){	
			prawyaya_value = "am";
			prakriyA=get_SabdarUpa_new.substitute(prakriyA,prawyaya_value,1);
		}
		else if(rule_number=="7-1-25"){	
			prawyaya_value = "axd";
			prakriyA=get_SabdarUpa_new.substitute(prakriyA,prawyaya_value,1);
		}
		else if(rule_number=="7-1-27"){	
			prawyaya_value = "aS";
			prakriyA=get_SabdarUpa_new.substitute(prakriyA,prawyaya_value,1);
		}
		else if(rule_number=="7-1-28"){			
			prawyaya_value = "am";
			prakriyA=get_SabdarUpa_new.substitute(prakriyA,prawyaya_value,1);
		}
		else if(rule_number=="7-1-29"){			
			prakriyA=get_SabdarUpa_new.substitute(prakriyA,"n",1);
		}
		else if(rule_number=="7-1-30"){
			prakriyA=get_SabdarUpa_new.substitute(prakriyA,"aByam",1);
		}
		else if((rule_number=="7-1-31")||(rule_number=="7-1-32")){
			prakriyA=get_SabdarUpa_new.substitute(prakriyA,"aw",1);
		}
		else if(rule_number=="7-1-33"){
			prakriyA=get_SabdarUpa_new.substitute(prakriyA,"Akam",1);
		}
		else if(rule_number=="7-1-34"){
			prakriyA=get_SabdarUpa_new.substitute(prakriyA,"O",1);
		}
		else if(rule_number=="7-1-52"){
			prawyaya_value = "sut,1";
			prakriyA=get_SabdarUpa_new.augment(prakriyA,prawyaya_value,1);
			prakriyA.remove("@root(Am)",1);
		}
		else if(rule_number=="7-1-53"){
			prakriyA.words[0]="wraya";
		}
		else if(rule_number=="7-1-54"){
			prawyaya_value = "nut,1";
			prakriyA=get_SabdarUpa_new.augment(prakriyA,prawyaya_value,1);
			//System.out.println(prakriyA.get_output()+" 362");
			prakriyA.remove("@root(Am)",1);
		}
		else if(rule_number=="7-1-70"){
			prakriyA=get_SabdarUpa_new.augment(prakriyA,"num,1",0);
		}
		else if((rule_number=="7-1-72")||(rule_number=="7-1-73")){
			prakriyA=get_SabdarUpa_new.augment(prakriyA,"num,1",0);
			//System.out.println(prakriyA.get_output());
		}
		else if(rule_number=="7-1-75"){
			prawyaya_value = "anaf,2";
			prakriyA=get_SabdarUpa_new.substitute(prakriyA,prawyaya_value,0);
		}
		else if(rule_number=="7-1-82"){
			prawyaya_value = "num,1";
			prakriyA=get_SabdarUpa_new.substitute(prakriyA,prawyaya_value,0);
		}
		else if(rule_number=="7-1-84"){
			prakriyA=get_SabdarUpa_new.substitute(prakriyA,"O",0);
		}
		else if(rule_number=="4-1-5"){
			if(anwyam(prakriyA.words[0]).equals("q")){
				prakriyA.words[0]=prakriyA.words[0].substring(0,prakriyA.words[0].length()-1)+"rI";
			}
			else{
				prakriyA.words[0]=prakriyA.words[0]+"I";
			}
			prakriyA.add("fyanwa",0);
		}
		else if(rule_number=="7-1-85"){
			prakriyA=get_SabdarUpa_new.substitute(prakriyA,"A",0);
		}
		else if(rule_number=="7-1-86"){
			//System.out.println(prakriyA.get_output()+" 415");
			if(!(belongs("sarvanAmasWAna",prakriyA.attrib_words[1]))){
				prakriyA.words[0] =prakriyA.words[0].substring(0,prakriyA.words[0].length()-1);
			}
			else{
				prakriyA.words[0] =prakriyA.words[0].substring(0,prakriyA.words[0].length()-2)+"a"+anwyam(prakriyA.words[0]);
			}
		}
		else if(rule_number=="7-1-87"){
			prakriyA.words[0] =prakriyA.words[0].replace("W","nW");
		}
		else if(rule_number=="7-1-88"){
			prakriyA.words[0] =prakriyA.words[0].substring(0,prakriyA.words[0].length()-2);
		}
		else if(rule_number=="7-1-89"){
			prakriyA=get_SabdarUpa_new.substitute(prakriyA,"asuf,2",0);
		}	
		else if((rule_number=="7-1-92")||(rule_number=="7-1-90")){
			prakriyA.add("F-iw",1);
			//prakriyA=prakriyA;
		}		
		else if((rule_number=="7-1-93")||(rule_number=="7-1-94")){
			prawyaya_value = "anaf,2";
			prakriyA=get_SabdarUpa_new.substitute(prakriyA,prawyaya_value,0);
			//prakriyA=new_value;
		}
		else if((rule_number=="7-1-95")||(rule_number=="7-1-97")){
			prakriyA.words[0]="kroRtq";
			prakriyA.add("prawyayAnwa(wqc)",0);
			prakriyA.remove("Gi",0);
		}
		else if(rule_number=="7-1-96"){
			prakriyA.words[0]="kroRtq";
			prakriyA.add("prawyayAnwa(wqc)",0);
			//prakriyA.remove("Gi",0);
		}
		else if(rule_number=="7-2-84"){
			prakriyA.words[0] ="aRtA";
		}
		else if(rule_number=="7-2-85"){
			prakriyA.words[0] ="rA";
		}
		else if((rule_number=="7-2-87")||(rule_number=="7-2-88")){
			prakriyA=get_SabdarUpa_new.substitute(prakriyA,"A",0);
		}
		else if(rule_number=="7-2-90"){
			Pattern p=Pattern.compile("\\w*(ax)");
			Matcher m=p.matcher(prakriyA.words[0]);
			//System.out.println(prakriyA.words[0]+" "+m.find());
			//if(m.find()){
				prakriyA.words[0]=prakriyA.words[0].replace(m.group(1),"");
			//}
		}
		else if(rule_number=="7-2-92"){
			Pattern p=Pattern.compile("(\\w*m)");
			Matcher m=p.matcher(prakriyA.words[0]);
			//System.out.println(prakriyA.words[0]+" "+m.find());
				if(belongs("root(asmax)",prakriyA.attrib_words[0])){
					prakriyA.words[0]=prakriyA.words[0].replace(m.group(1),"Ava");
				}
				else{
					prakriyA.words[0]=prakriyA.words[0].replace(m.group(1),"yuva");
				}
			
		}
		else if(rule_number=="7-2-93"){
			Pattern p=Pattern.compile("(\\w*m)");
			Matcher m=p.matcher(prakriyA.words[0]);
			//System.out.println(prakriyA.words[0]+" "+m.find());
			if(belongs("root(asmax)",prakriyA.attrib_words[0])){
				prakriyA.words[0]=prakriyA.words[0].replace(m.group(1),"vaya");
			}
			else{
				prakriyA.words[0]=prakriyA.words[0].replace(m.group(1),"yUva");
			}
			
		}
		else if(rule_number=="7-2-94"){
			if(belongs("root(asmax)",prakriyA.attrib_words[0])){
				prakriyA.words[0] ="ahax";
			}
			else{
				prakriyA.words[0] ="wvax";
			}
		}
		else if(rule_number=="7-2-97"){
			Pattern p=Pattern.compile("(\\w*m)");
			Matcher m=p.matcher(prakriyA.words[0]);
			//System.out.println(prakriyA.words[0]+" "+m.find());
			if(belongs("root(asmax)",prakriyA.attrib_words[0])){
				prakriyA.words[0]=prakriyA.words[0].replace(m.group(1),"ma");
			}
			else{
				prakriyA.words[0]=prakriyA.words[0].replace(m.group(1),"wva");
			}
			
		}
		else if(rule_number=="7-2-99"){
			if(prakriyA.words[0].equals("wri")){
				prakriyA.words[0] ="wisq";
			}
			else{
				prakriyA.words[0] ="cawasq";
			}
		}
		else if(rule_number=="7-2-100"){
			prakriyA.words[0] = prakriyA.words[0].substring(0,prakriyA.words[0].length()-1)+"r";
		}
		else if(rule_number=="7-2-101"){
			if(belongs("root(nirjara)",prakriyA.attrib_words[0])){
				prakriyA.words[0] ="nirjaras";//To be modified by substitution of jaras
			}
			else{
				prakriyA.words[0] ="jaras";//To be modified by substitution of jaras
			}
		}
		else if(rule_number=="7-2-102"){
			prakriyA=get_SabdarUpa_new.substitute(prakriyA,"a",0);
		}
		else if(rule_number=="7-2-103"){
			prakriyA=get_SabdarUpa_new.substitute(prakriyA,"ka",0);
		}
		else if(rule_number=="7-2-106"){
			Pattern p=Pattern.compile("\\w*([wx])\\w+");
			Matcher m=p.matcher(prakriyA.words[0]);
			//System.out.println(prakriyA.words[0]+" "+m.find());
			prakriyA.words[0]=prakriyA.words[0].replace(m.group(1),"s");
			////System.out.println(prakriyA.words[0]+"  "+prakriyA.get_output()+"  469 rule");
		}
		else if(rule_number=="7-2-107"){
			prakriyA.words[1]="";
			prakriyA=get_SabdarUpa_new.substitute(prakriyA,"O",0);
		}
		else if(rule_number=="7-2-109"){
			Pattern p=Pattern.compile("\\w*(x)\\w+");
			Matcher m=p.matcher(prakriyA.words[0]);
			//System.out.println(prakriyA.words[0]+" "+m.find());
			prakriyA.words[0]=prakriyA.words[0].replace(m.group(1),"m");
		}
		else if(rule_number=="7-2-110"){
			Pattern p=Pattern.compile("\\w*(x)\\w+");
			Matcher m=p.matcher(prakriyA.words[0]);
			//System.out.println(prakriyA.words[0]+" "+m.find());
			prakriyA.words[0]=prakriyA.words[0].replace(m.group(1),"y");
		}
		else if(rule_number=="7-2-111"){
			Pattern p=Pattern.compile("\\w*(ix)\\w+");
			Matcher m=p.matcher(prakriyA.words[0]);
			//System.out.println(prakriyA.words[0]+" "+m.find());
			prakriyA.words[0]=prakriyA.words[0].replace(m.group(1),"ay");
		}
		else if(rule_number=="7-2-112"){
			Pattern p=Pattern.compile("\\w*(ix)\\w+");
			Matcher m=p.matcher(prakriyA.words[0]);
			//System.out.println(prakriyA.words[0]+" "+m.find());
			prakriyA.words[0]=prakriyA.words[0].replace(m.group(1),"an");
		}
		else if(rule_number=="7-2-113"){
			Pattern p=Pattern.compile("\\w*(ix)\\w+");
			Matcher m=p.matcher(prakriyA.words[0]);
			//System.out.println(prakriyA.words[0]+" "+m.find());
			prakriyA.words[0]=prakriyA.words[0].replace(m.group(1),"");
		}
			
		else if(rule_number=="7-2-115"){
			prakriyA.words[0] =prakriyA.words[0].substring(0,prakriyA.words[0].length()-1)+get_SabdarUpa_new.vqxXi(anwyam(prakriyA.words[0]).charAt(0));
		}
		else if(rule_number=="7-3-54"){
			prakriyA.words[0] = prakriyA.words[0].substring(0,prakriyA.words[0].length()-2)+"G"+anwyam(prakriyA.words[0]);
		}
		else if(rule_number=="7-3-84"){
			prakriyA.words[0] = prakriyA.words[0].substring(0,prakriyA.words[0].length()-1)+get_SabdarUpa_new.guNa(anwyam(prakriyA.words[0]).charAt(0));
		}
		else if((rule_number=="7-3-101")||(rule_number=="7-3-102")){
			prakriyA.words[0] = prakriyA.words[0].substring(0,prakriyA.words[0].length()-1)+get_SabdarUpa_new.do_xIrGa(anwyam(prakriyA.words[0]).charAt(0));
		}
		else if((rule_number=="7-3-103")||(rule_number=="7-3-104")){
			prakriyA.words[0] = prakriyA.words[0].substring(0,prakriyA.words[0].length()-1)+"e";
			//process[process_status]="a->xIrGa";
		}
		else if(rule_number=="7-3-105"){
			prakriyA.words[0] =prakriyA.words[0].substring(0,prakriyA.words[0].length()-1)+"e";
		}
		else if((rule_number=="7-3-109")||(rule_number=="7-3-111")||(rule_number=="7-3-110")){
			prakriyA.words[0] =prakriyA.words[0].substring(0,prakriyA.words[0].length()-1)+get_SabdarUpa_new.guNa(anwyam(prakriyA.words[0]).charAt(0));
		}
		else if(rule_number=="7-3-112"){
			//input_DS temp=new input_DS(prakriyA.words[1],prakriyA.attrib_words[1]);
			prakriyA=get_SabdarUpa_new.augment(prakriyA,"At",1);

			//prakriyA.words[1] ="O";
		}
		else if(rule_number=="7-3-113"){
			//input_DS temp=new input_DS(prakriyA.words[1],prakriyA.attrib_words[1]);
			prakriyA=get_SabdarUpa_new.augment(prakriyA,"yAt",1);

			//prakriyA.words[1] ="O";
		}
		else if(rule_number=="7-3-114"){
			//input_DS temp=new input_DS(prakriyA.words[1],prakriyA.attrib_words[1]);
			prakriyA=get_SabdarUpa_new.augment(prakriyA,"syAt",1);
			prakriyA.words[0] = prakriyA.words[0].substring(0,prakriyA.words[0].length()-1)+get_SabdarUpa_new.hrasva(anwyam(prakriyA.words[0]).charAt(0));

			//prakriyA.words[1] ="O";
		}
		else if((rule_number=="7-3-116")||(rule_number=="7-3-117")){
			prakriyA.words[1] ="Am";
			prakriyA.remove("root(fi)",1);
		}
		else if(rule_number=="7-3-118"){
			prakriyA.words[1] ="O";
		}
		
		else if(rule_number=="7-3-119"){
			prakriyA.words[0] =prakriyA.words[0].substring(0,prakriyA.words[0].length()-1)+"a";
			prakriyA.words[1] ="O";
		}
		else if(rule_number=="7-3-120"){
			prakriyA=get_SabdarUpa_new.substitute(prakriyA,"nA",1);
		}

		
		
		
		else if((rule_category=="saMhiwA")||(rule_category=="ekAxeSa")){
			String lword=prakriyA.words[0];
			String rword=prakriyA.words[1];
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
			else if((rule_number=="6-1-88")||(rule_number=="6-1-89")||(rule_number=="6-1-90")){
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
			////System.out.println(
			}
		
			else if(rule_number=="6-1-102"){
				sandhi_part=get_SabdarUpa_new.do_xIrGa(lword_phone);//xIrGa is a function of main class that accept char as input and return a string with its xIrGa			
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
			
			prakriyA.words[0]=lword.substring(0,lword.length()-1)+sandhi_part+rword.substring(1);
			prakriyA.remove("prAwipaxika",0);
			prakriyA.words[1]="";
			return prakriyA;	
		}
		//System.out.println(prakriyA.get_output()+"in rule.java");
			
		//input_DS temp[]={prakriyA};
		return prakriyA;
	}
	
	
}	
