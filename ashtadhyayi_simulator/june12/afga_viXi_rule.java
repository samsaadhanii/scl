class afga_viXi_rule{
	String afga_ending;
	String afga_attrib;
	String prawyaya;
	String prawyaya_attrib;
	String rule_number;//rule number
	String rule_upaxeSa;//the rule wordings
	
	afga_viXi_rule(String r,String u,String af_en, String praw, String af_att, String praw_att){
		rule_number=r;
		rule_upaxeSa=u;
		afga_ending=af_en;
		prawyaya=praw;
		afga_attrib=af_att;
		prawyaya_attrib=praw_att;
	}
	
	
	boolean condition(input_DS prakriyA){//checks for conditions and returns true only if all are satisfied
		String root_word=prakriyA.words[0];
		//System.out.println(root_word);
		//System.out.println(anwyam(root_word));
		String root_word_char=prakriyA.attrib_words[0];
//System.out.println(root_word_char);
		String prawyaya1=prakriyA.words[1];
		String prawyaya1_char=prakriyA.attrib_words[1];		
		//String check_afga_ending=
		boolean status=true;
		if(afga_ending.length()>0){
			if(!(belongs(anwyam(root_word), afga_ending))){//System.out.println(rule_number+"first");
				
				status=false;
				return status;
			}
		}
		
		if(prawyaya.length()>0){
		
			if(!(belongs(prawyaya1.substring(0,1), prawyaya))){//System.out.println(rule_number+"2nd");
				
				status=false;
				return status;
			}
		}
		
		if(afga_attrib.length()>0){//System.out.println("3rd");
			if(!(belongs(afga_attrib, root_word_char))){//System.out.println(rule_number+"3rd");
				status=false;
				return status;
			}
		}
		
		if(prawyaya_attrib.length()>0){//System.out.println("4th");
			if(!(belongs(prawyaya_attrib, prawyaya1_char))){//System.out.println(rule_number+"4th");
				status=false;
				
				return status;
			}
			//System.out.println(prawyaya_attrib+" "+status);
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
	
	input_DS apply_afga_viXi_rule(input_DS prakriyA){		
		String prawyaya_value="";
		if(rule_number=="7-1-9"){
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
		else if(rule_number=="7-1-54"){
			prawyaya_value = "nut,1";
			prakriyA=get_SabdarUpa_new.augment(prakriyA,prawyaya_value,1);
			prakriyA.remove("@root(Am)",1);
		}
		else if(rule_number=="7-1-52"){
			prawyaya_value = "sut,1";
			prakriyA=get_SabdarUpa_new.augment(prakriyA,prawyaya_value,1);
			prakriyA.remove("@root(Am)",1);
		}
		else if((rule_number=="7-1-92")||(rule_number=="7-1-90")){
			prakriyA.add("F-iw",1);
			//prakriyA=prakriyA;
		}
		
		else if((rule_number=="7-1-19")||(rule_number=="7-1-18")){
			prawyaya_value = "SI";
			prakriyA=get_SabdarUpa_new.substitute(prakriyA,prawyaya_value,1);
		}
		
		else if(rule_number=="7-1-20"){
			prawyaya_value = "Si";
			prakriyA=get_SabdarUpa_new.substitute(prakriyA,prawyaya_value,1);
			if(belongs("@root(jas)",prakriyA.attrib_words[1])){
				prakriyA.remove("@root(jas)",1);
			}
			if(belongs("@root(Sas)",prakriyA.attrib_words[1])){
				prakriyA.remove("@root(Sas)",1);
			}
		
		}

		else if(rule_number=="7-1-23"){
			prawyaya_value = "";
			prakriyA.words[1]="";
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

		else if(rule_number=="6-1-112"){
			prakriyA.words[1]="us";
		}
		else if(rule_number=="7-1-24"){			
			prawyaya_value = "am";
			prakriyA=get_SabdarUpa_new.substitute(prakriyA,prawyaya_value,1);
		}
		

		else if((rule_number=="6-4-3")||(rule_number=="7-3-102")){
			prakriyA.words[0] = prakriyA.words[0].substring(0,prakriyA.words[0].length()-1)+get_SabdarUpa_new.do_xIrGa(anwyam(prakriyA.words[0]).charAt(0));
			//process[process_status]="a->e";
			//process_status++;
		}
		else if(rule_number=="7-2-85"){
			prakriyA.words[0] ="rA";
		}
		
		else if(rule_number=="7-1-17"){
			prakriyA=get_SabdarUpa_new.substitute(prakriyA,"SI",1);
		}
		else if(rule_number=="7-1-14"){
			prakriyA=get_SabdarUpa_new.substitute(prakriyA,"smE",1);
		}
		else if(rule_number=="7-1-15"){
			if(belongs("root(fasi,3)",prakriyA.attrib_words[1])){
				prakriyA=get_SabdarUpa_new.substitute(prakriyA,"smAw",1);
			}
			if(belongs("root(fi)",prakriyA.attrib_words[1])){
				prakriyA=get_SabdarUpa_new.substitute(prakriyA,"smin",1);
			}
		}
		else if((rule_number=="7-3-103")||(rule_number=="7-3-104")){
			prakriyA.words[0] = prakriyA.words[0].substring(0,prakriyA.words[0].length()-1)+"e";
			//process[process_status]="a->xIrGa";
		}
		else if(rule_number=="6-4-140"){
			prakriyA.words[0] =prakriyA.words[0].substring(0,prakriyA.words[0].length()-1);
		}
		else if(rule_number=="6-4-134"){
			prakriyA.words[0] =prakriyA.words[0].substring(0,prakriyA.words[0].length()-2)+"n";
		}
		else if((rule_number=="6-4-77")||(rule_number=="6-4-85")){
			if(belongs("IkArAnwa|ikArAnwa",prakriyA.attrib_words[0])){
				prakriyA=get_SabdarUpa_new.substitute(prakriyA,"iyaf,2",0);
			}
			else{
				prakriyA=get_SabdarUpa_new.substitute(prakriyA,"uvaf,2",0);
			}
			//prakriyA.words[0] =prakriyA.words[0].substring(0,prakriyA.words[0].length()-1);
		}
		else if((rule_number=="6-4-82")||(rule_number=="6-4-83")||(rule_number=="6-4-84")){
			prakriyA.words[0] =prakriyA.words[0].substring(0,prakriyA.words[0].length()-1)+get_SabdarUpa_new.do_yaNa(anwyam(prakriyA.words[0]).charAt(0));
		}
		else if((rule_number=="7-3-109")||(rule_number=="7-3-111")||(rule_number=="7-3-110")){
			prakriyA.words[0] =prakriyA.words[0].substring(0,prakriyA.words[0].length()-1)+get_SabdarUpa_new.guNa(anwyam(prakriyA.words[0]).charAt(0));
		}
		else if((rule_number=="7-3-116")||(rule_number=="7-3-117")){
			prakriyA.words[1] ="Am";
			prakriyA.remove("root(fi)",1);
		}
		else if(rule_number=="7-3-118"){
			prakriyA.words[1] ="O";
		}
		else if(rule_number=="7-3-112"){
			//input_DS temp=new input_DS(prakriyA.words[1],prakriyA.attrib_words[1]);
			prakriyA=get_SabdarUpa_new.augment(prakriyA,"At",1);

			//prakriyA.words[1] ="O";
		}
		else if((rule_number=="7-1-93")||(rule_number=="7-1-94")){
			prawyaya_value = "anaf,2";
			prakriyA=get_SabdarUpa_new.substitute(prakriyA,prawyaya_value,0);
			//prakriyA=new_value;
		}
		else if(rule_number=="7-3-113"){
			//input_DS temp=new input_DS(prakriyA.words[1],prakriyA.attrib_words[1]);
			prakriyA=get_SabdarUpa_new.augment(prakriyA,"yAt",1);

			//prakriyA.words[1] ="O";
		}
		
		else if((rule_number=="7-1-72")||(rule_number=="7-1-73")){
			prakriyA=get_SabdarUpa_new.augment(prakriyA,"num,1",0);
			//System.out.println(prakriyA.get_output());
		}
		

		else if(rule_number=="7-1-75"){
			prawyaya_value = "anaf,2";
			prakriyA=get_SabdarUpa_new.substitute(prakriyA,prawyaya_value,0);
		}

		else if(rule_number=="7-3-120"){
			prakriyA=get_SabdarUpa_new.substitute(prakriyA,"nA",1);
		}
		else if(rule_number=="7-3-105"){
			prakriyA.words[0] =prakriyA.words[0].substring(0,prakriyA.words[0].length()-1)+"e";
		}
	/*	else if(rule_number=="7-2-101"){
			String word1=prakriyA.words[0];
			String word2="nirjaras";
			String words1[]={word1,prakriyA.words[1]};
			String words2[]={word2,prakriyA.words[1]};
			String attribs[]={prakriyA.attrib_words[0],prakriyA.attrib_words[1]};
			input_DS temp1=new input_DS(words1,attribs);	
					
			input_DS temp2=new input_DS(words2,attribs);
			//temp2.words[0] ="nirjaras";
			//temp1.words[0] ="nirjara";
			//System.out.println(temp1.get_output()+"168");
			//System.out.println(temp2.get_output()+"169");
			input_DS temp[]=new input_DS[2];
			temp[0]=temp1;
			//temp2.words[0]="nirjaras";
			temp[1]=temp2;
			//System.out.println(temp[0].get_output()+"173");
			//System.out.println(temp[1].get_output()+"174");
			return temp;
			
		}*/
		else if(rule_number=="7-2-115"){
			prakriyA.words[0] =prakriyA.words[0].substring(0,prakriyA.words[0].length()-1)+get_SabdarUpa_new.vqxXi(anwyam(prakriyA.words[0]).charAt(0));
		}
		else if(rule_number=="7-3-119"){
			prakriyA.words[0] =prakriyA.words[0].substring(0,prakriyA.words[0].length()-1)+"a";
			prakriyA.words[1] ="O";
		}

		else if(rule_number=="6-4-79"){
			prakriyA=get_SabdarUpa_new.substitute(prakriyA,"iyaf,2",0);
		}
		
		
		else if(rule_number=="6-4-84"){
			prakriyA=get_SabdarUpa_new.substitute(prakriyA,"iyaf,2",0);
		}
		
		else if(rule_number=="6-4-85"){
			prakriyA=get_SabdarUpa_new.substitute(prakriyA,"iyaf,2",0);
		}
		else if((rule_number=="6-4-7")||(rule_number=="6-4-8")||(rule_number=="6-4-11")){
			prakriyA.words[0] =prakriyA.words[0].substring(0,prakriyA.words[0].length()-2)+get_SabdarUpa_new.do_xIrGa(prakriyA.words[0].charAt(prakriyA.words[0].length()-2))+anwyam(prakriyA.words[0]);
			//prakriyA.words[1] ="O";
		}
		//input_DS temp[]={prakriyA};
		return prakriyA;
	}
	
	
}	