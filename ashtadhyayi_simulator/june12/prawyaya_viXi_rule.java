class prawyaya_viXi_rule{
	String afga_ending;
	String afga_attrib;
	String prawyaya;
	String prawyaya_attrib;
	String rule_number;//rule number
	String rule_upaxeSa;//the rule wordings
	
	prawyaya_viXi_rule(String r,String u,String af_en, String praw, String af_att, String praw_att){
		rule_number=r;
		rule_upaxeSa=u;
		afga_ending=af_en;
		prawyaya=praw;
		afga_attrib=af_att;
		prawyaya_attrib=praw_att;
	}
	
	
	boolean condition(input_DS prakriyA){//checks for conditions and returns true only if all are satisfied
		String root_word=prakriyA.words[0];
		String root_word_char=prakriyA.attrib_words[0];
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
			if(!(belongs(prawyaya1, prawyaya))){//System.out.println(rule_number+"second");
				status=false;
				return status;
			}
		}
		
		if(afga_attrib.length()>0){
			if(!(belongs(afga_attrib, root_word_char))){//System.out.println(rule_number+"third");
				status=false;
				return status;
			}
		}
		
		if(prawyaya_attrib.length()>0){
			if(!(belongs(prawyaya_attrib, prawyaya1_char))){//System.out.println(rule_number+"fourth");
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
	
	input_DS apply_prawyaya_viXi_rule(input_DS prakriyA){
		input_DS new_value=prakriyA;
		String prawyaya_value="";
		if(rule_number=="7-1-9"){
			prawyaya_value = "Es";
			new_value=get_SabdarUpa_new.substitute(new_value,prawyaya_value,1);
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
			new_value=get_SabdarUpa_new.substitute(new_value,prawyaya_value,1);
		}
		else if(rule_number=="7-1-13"){
			prawyaya_value = "ya";
			new_value=get_SabdarUpa_new.substitute(new_value,prawyaya_value,1);
		}
		else if(rule_number=="7-1-54"){
			prawyaya_value = "nAm";
			new_value=get_SabdarUpa_new.substitute(new_value,prawyaya_value,1);
		}
		
		else if((rule_number=="7-1-92")||(rule_number=="7-1-90")){
			new_value.add("F-iw",1);
			//new_value=prakriyA;
		}
		
		else if((rule_number=="7-1-19")||(rule_number=="7-1-18")){
			prawyaya_value = "SI";
			new_value=get_SabdarUpa_new.substitute(new_value,prawyaya_value,1);
		}
		
		else if(rule_number=="7-1-20"){
			prawyaya_value = "Si";
			new_value=get_SabdarUpa_new.substitute(new_value,prawyaya_value,1);
		}

		else if(rule_number=="7-1-23"){
			prawyaya_value = "";
			new_value.words[1]="";
		}
		else if(rule_number=="7-3-112"){
			//input_DS temp=new input_DS(prakriyA.words[1],prakriyA.attrib_words[1]);
			new_value=get_SabdarUpa_new.augment(new_value,"At",1);

			//prakriyA.words[1] ="O";
		}
		else if(rule_number=="7-3-113"){
			//input_DS temp=new input_DS(prakriyA.words[1],prakriyA.attrib_words[1]);
			new_value=get_SabdarUpa_new.augment(new_value,"yAt",1);

			//prakriyA.words[1] ="O";
		}

		else if(rule_number=="6-1-112"){
			new_value.words[1]="us";
		}
		else if(rule_number=="7-1-24"){			
			prawyaya_value = "am";
			new_value=get_SabdarUpa_new.substitute(new_value,prawyaya_value,1);
		}
		
		//new_value.substitute(prawyaya_value,1);
		//System.out.println(new_value.get_output());
		return new_value;

	}
}