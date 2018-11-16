import java.util.regex.*;
class wripAxI_rule{
	String rule_number;
	String p;
	String target;
	String group1_check;
	String group2_check;
	String special;
	boolean condition=true;
	wripAxI_rule(String rule_num,String a,String tar){
		rule_number=rule_num;
		p=a;
		target=tar;
		group1_check="";
		group2_check="";
		special="";
	}
	
	wripAxI_rule(String rule_num,String a,String tar,String g1,String g2,boolean other){
		rule_number=rule_num;
		p=a;
		target=tar;
		group1_check=g1;
		group2_check=g2;
		special="";
		condition=other;
	}
	wripAxI_rule(String rule_num,String a,String tar,String g1){
		rule_number=rule_num;
		p=a;
		target=tar;
		group1_check=g1;
		group2_check="";
		special="";
	}
	
	wripAxI_rule(String rule_num,String a,String tar,String g1,String g2){
		rule_number=rule_num;
		p=a;
		target=tar;
		group1_check=g1;
		group2_check=g2;
		special="";
	}
	
	wripAxI_rule(String rule_num,String a,String tar,String g1,String g2,String spec){
		rule_number=rule_num;
		p=a;
		target=tar;
		group1_check=g1;
		group2_check=g2;
		special=spec;
	}
	
	/*wripAxI_rule(String rule_num,String a,String tar,String g1,String spec){
		rule_number=rule_num;
		p=a;
		target=tar;
		group1_check=g1;
		group2_check="";
		special=spec;
	}
	
	wripAxI_rule(String rule_num,String a,String tar,String spec){
		rule_number=rule_num;
		p=a;
		target=tar;
		group1_check="";
		group2_check="";
		special=spec;
	}*/
	boolean belongs(String a, String b){
		if(!condition){
			return false;
		}
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
	String ap_spec(paxa_DS paxa_final){
		String spec[]=target.split(" ");
		if(spec[1].equals("substitute")){
			return spec[2];
		}
		return "";
	}
		
	int ap_ind(paxa_DS paxa_final){
		input_DS external=paxa_final.external_str;
		input_DS prakriyA=paxa_final.internal_str;
		String paxa=external.words[0];
		Pattern pp=Pattern.compile(p);
		int afga_length=prakriyA.words[0].length();
		int prawyaya_length=0;
		int g1_ind=0;
		int g2_ind=0;
		int re_len=0;
		String brac_ind="";
		boolean status=true;
		//String paxa=prakriyA.words[0];
		if(prakriyA.words[1].length()>0){
			paxa=prakriyA.words[0]+prakriyA.words[1];
			prawyaya_length=prakriyA.words[1].length();
		}
		Matcher m=pp.matcher(paxa);
		boolean b=m.find();
		if(target.length()==0){
			return -2;
		}
		String apply_specs[]=target.split(" ");
		int group_number=Integer.parseInt(apply_specs[0]);
		//int g2_ind=0;
		String the_group="";
		if(group_number==1){
			int k=p.indexOf('(');
			the_group=p.substring(k+1,p.indexOf(')'));
			//System.out.println(the_group+"222");
			if(k==0){
				re_len=0;
			}
			if(k>0){
				brac_ind=p.substring(0,k);
				if((brac_ind.indexOf("+")!=-1)||(brac_ind.indexOf("*")!=-1)){
					re_len=paxa.substring(m.start(),m.end()).indexOf(m.group(group_number));
				}
				else{
					re_len=regex_length(brac_ind);
				}
				//prak_ind=re_len+m.start();
			}
		}
			else{
				brac_ind=p.substring(0,p.indexOf('(',p.indexOf(')'))).replace("(","").replace(")","");
				if((brac_ind.indexOf("+")!=-1)||(brac_ind.indexOf("*")!=-1)){
					re_len=paxa.substring(m.start(),m.end()).indexOf(m.group(group_number));
				}
				else{
					re_len=regex_length(brac_ind);
				}
			}
				g2_ind=re_len;
				
			return g2_ind+m.start();
			//System.out.println(g2_ind+"283");
		}
		
	
		
	boolean condition(paxa_DS paxa_final){
		input_DS external=paxa_final.external_str;
		input_DS prakriyA=paxa_final.internal_str;
		String paxa=external.words[0];
		Pattern pp=Pattern.compile(p);
		int afga_length=prakriyA.words[0].length();
		int prawyaya_length=0;
		int g1_ind=0;
		int g2_ind=0;
		boolean status=true;
		//String paxa=prakriyA.words[0];
		if(prakriyA.words[1].length()>0){
			paxa=prakriyA.words[0]+prakriyA.words[1];
			prawyaya_length=prakriyA.words[1].length();
		}
		Matcher m=pp.matcher(paxa);
		boolean b=m.find();
		if(!b){
			status=false;
			//System.out.println(rule_number+" regex "+paxa+"till "+p);
			return status;
			
		}
		else{
			if((rule_number.indexOf("8-3")!=-1)||(rule_number.indexOf("8-4")!=-1)){
				if(p.indexOf('(',p.indexOf(')'))!=-1){
					String brac_ind="";
					int re_len=0;
					int prak_ind=0;
					int praw_ind=0;
					int k=p.indexOf('(');
					if(k==0){
						prak_ind=m.start();
					}
					if(k>0){
						brac_ind=p.substring(0,k);
					if((brac_ind.indexOf("+")!=-1)||(brac_ind.indexOf("*")!=-1)){
						re_len=paxa.substring(m.start(),m.end()).indexOf(m.group(1));
					}
					else{
						re_len=regex_length(brac_ind);
					}
						prak_ind=re_len+m.start();
					}
					brac_ind=p.substring(0,p.indexOf('(',p.indexOf(')'))).replace("(","").replace(")","");
					if((brac_ind.indexOf("+")!=-1)||(brac_ind.indexOf("*")!=-1)){
						re_len=paxa.substring(m.start(),m.end()).indexOf(m.group(2));
					}
					else{
						re_len=regex_length(brac_ind);
					}
					//re_len=regex_length(brac_ind.replace("(","").replace(")",""));
					praw_ind=re_len+m.start();
				
					if(!((prak_ind<afga_length)&&(praw_ind>=afga_length))){
						//System.out.println(rule_number+" saMhiwA");
						return false;
						
					}
				}
			}
		
			if(group1_check.length()>0){
				String g1[]=group1_check.split(" ");
				int group1=Integer.parseInt(g1[0]);
				String attribute=g1[1];
				String matched_group1=m.group(group1);
				if(group1==1){
					int k=p.indexOf('(');
					if(k==0){
						g1_ind=0;
					}
					if(k>0){
						String brac_ind=p.substring(0,k);
						int re_len=regex_length(brac_ind);
						g1_ind=re_len;
					}
				}
				else{
					String brac_ind=p.substring(0,p.indexOf('(',p.indexOf(')')));
					int re_len=regex_length(brac_ind.replace("(","").replace(")",""));
					g1_ind=re_len;
				}
				g1_ind=m.start()+g1_ind;
				if(g1_ind>=afga_length){
					if(!(belongs(attribute,prakriyA.attrib_words[1]))){
						//System.out.println(rule_number+" attr1");
						status=false;
						return status;
					}
				}
				else{
					if(!(belongs(attribute,prakriyA.attrib_words[0]))){
						if(prakriyA.words[1].length()==0){
							if(!(belongs(attribute,prakriyA.attrib_words[1]))){
								//System.out.println(rule_number+" attr0");
								status=false;
								return status;
							}
						}
						else{
							//System.out.println(rule_number+" attr0");
							status=false;
							return status;
						}
						
					}
				}
			}
			if(group2_check.length()>0){
				String g2[]=group2_check.split(" ");
				int group2=Integer.parseInt(g2[0]);
				String attribute=g2[1];
				String matched_group1=m.group(group2);
				if(group2==1){
					int k=p.indexOf('(');
					if(k==0){
						g2_ind=0;
					}
					if(k>0){
						String brac_ind=p.substring(0,k);
						int re_len=regex_length(brac_ind);
						g2_ind=re_len;
					}
				}
				else{
					String brac_ind=p.substring(0,p.indexOf('(',p.indexOf(')')));
					int re_len=regex_length(brac_ind.replace("(","").replace(")",""));
					g2_ind=re_len;
				}
				g2_ind=m.start()+g2_ind;
				if(g2_ind>=afga_length){
					if(!(belongs(attribute,prakriyA.attrib_words[1]))){
						//System.out.println(rule_number+" attr1");
						status=false;
						return status;
					}
				}
				else{
					if(!(belongs(attribute,prakriyA.attrib_words[0]))){
						//System.out.println(rule_number+" attr0");
						status=false;
						return status;
					}
				}
			}
			
		}
		return status;
	}
	
	int regex_length(String reg_ex){
		//System.out.println(" 208 "+reg_ex);
		String expression="";
		if(reg_ex.equals("\\w*")){
			return 0;
		}
		if((reg_ex.indexOf("^")==0)&&(reg_ex.indexOf("$")!=-1)){
			return reg_ex.length()-2;
		}
		if(reg_ex.indexOf("|")!=-1){
			return(reg_ex.indexOf(0,reg_ex.indexOf("|")));
		}
		int tem=reg_ex.indexOf("\\w*");
		if(tem==0){
			expression=reg_ex.substring(3);
				//System.out.println(expression+" after removing \\w");
		}
		else if(tem>0){
			if(tem==reg_ex.length()-3){
				expression=reg_ex.substring(0,tem);
			}
			else{
				expression=reg_ex.substring(0,tem)+reg_ex.substring(tem+3);
			}
				//System.out.println(expression+" after removing \\w 231");
		}
		else{
			expression=reg_ex;
		}
		if(expression.indexOf("^")==0){
			expression=expression.substring(1);
				//System.out.println(expression+" after removing ^");
		}
		if(expression.indexOf("$")!=-1){
			expression=expression.substring(0,expression.length()-1);
				//System.out.println(expression+" after removing $");
		}
		//System.out.println(" 236 "+expression);
		int length_regex=0;
		int i=0;
		while(i<expression.length()){
			if(expression.charAt(i)=='['){
				while(!(expression.charAt(i)==']')){
					i++;
				}
			}
			length_regex++;
			i++;
		}
		//System.out.println(length_regex+" 246 "+expression);
		return length_regex;
	}
					
	//int index_of_brac(String p,String
	paxa_DS apply(paxa_DS paxa_final){
		Pattern pp=Pattern.compile(p);
		//int afga_length=prakriyA.words[0].length();
		int prawyaya_length=0;
		input_DS external=paxa_final.external_str;
		input_DS prakriyA=paxa_final.internal_str;
		String paxa=external.words[0];
		if(prakriyA.words[1].length()>0){
			paxa=prakriyA.words[0]+prakriyA.words[1];
			prawyaya_length=prakriyA.words[1].length();
		}
		int afga_length=prakriyA.words[0].length();
		Matcher m=pp.matcher(paxa);
		boolean b=m.find();
		String apply_specs[]=target.split(" ");
		int group_number=Integer.parseInt(apply_specs[0]);
		int g2_ind=0;
		String the_group="";
		if(group_number==1){
			int k=p.indexOf('(');
			the_group=p.substring(k+1,p.indexOf(')'));
			if(k==0){
				g2_ind=0;
				//the_group=p.substring(1,p.indexOf(')'));
			}
			if(k>0){
				String brac_ind=p.substring(0,k);
				int re_len=0;
				if((brac_ind.indexOf("+")!=-1)||(brac_ind.indexOf("*")!=-1)){
					re_len=paxa.substring(m.start(),m.end()).indexOf(m.group(group_number));
				}
				else{
					re_len=regex_length(brac_ind);
				}
				g2_ind=re_len;
				
			}
		}
		else{
			String brac_ind=p.substring(0,p.indexOf('(',p.indexOf(')')));
			the_group=p.substring(p.indexOf('(',p.indexOf(')'))+1,p.indexOf(')',brac_ind.length()));
			int re_len=regex_length(brac_ind.replace("(","").replace(")",""));
			g2_ind=re_len;
		}
		boolean aff_praw=false;
		int ind_praw=0;
		if(g2_ind+m.start()>=prakriyA.words[0].length()){
			aff_praw=true;
			ind_praw=g2_ind+m.start()-prakriyA.words[0].length();
		}
		else{
			ind_praw=g2_ind+m.start();
		}
		//System.out.println(g2_ind+"436 wripAxI rule "+rule_number);
		String app=apply_specs[1];
		if(app.equals("lopa")){
			if(aff_praw){
				if(ind_praw==0){
					prakriyA.words[1]=prakriyA.words[1].substring(1);
				}
				else{
					prakriyA.words[1]=prakriyA.words[1].substring(0,ind_praw)+prakriyA.words[1].substring(ind_praw+1);
				}
			}
			else{
				prakriyA.words[0]=prakriyA.words[0].substring(0,ind_praw)+prakriyA.words[0].substring(ind_praw+1);
			}
		}
		else if(app.equals("AxeSa")){
			if(aff_praw){
				prakriyA=get_SabdarUpa_new.substitute(prakriyA,apply_specs[2],1);
			}
			else{
				prakriyA=get_SabdarUpa_new.substitute(prakriyA,apply_specs[2],0);
			}
			//external=substitute(external,"ru,1",0);
		}
		
		else if(app.equals("Agama")){
			if((rule_number.indexOf("8-3")!=-1)||(rule_number.indexOf("8-4")!=-1)){
				prakriyA=get_SabdarUpa_new.augment(prakriyA,apply_specs[2],1);
			}
			//external=substitute(external,"ru,1",0);
		}
			
		else if(app.equals("substitute")){
			String to_be_subs="";
			if(m.group(group_number).length()>1){
				//if(apply_specs[2].length()==m.group(group_number).length()){
					prakriyA.words[0]=prakriyA.words[0].replace(m.group(1),apply_specs[2]);
				//}
				//else{
					
			}
			else{
				if(apply_specs[2].length()>1){
					if(apply_specs[2].equals("duplicate")){
						to_be_subs=m.group(group_number)+m.group(group_number);
					}
					else{
						to_be_subs=get_SabdarUpa_new.get_mapping(m.group(group_number),the_group,apply_specs[2]);
					}
				}
				else{
					to_be_subs=apply_specs[2];
				}
				if(aff_praw){
					if(ind_praw==0){
						prakriyA.words[1]=to_be_subs+prakriyA.words[1].substring(1);
					}
					else{
						prakriyA.words[1]=prakriyA.words[1].substring(0,ind_praw)+to_be_subs+prakriyA.words[1].substring(ind_praw+1);
					}
				}
				else{
					prakriyA.words[0]=prakriyA.words[0].substring(0,ind_praw)+to_be_subs+prakriyA.words[0].substring(ind_praw+1);
				}
			}
		}
		external.words[0]=prakriyA.words[0]+prakriyA.words[1];
		paxa_DS output=new paxa_DS(external,prakriyA);
		return output;
	}
	
	
}



