import java.util.regex.*;
class regex_check{
	public static void main(String args[]){
		String hal="[khds]";
		Pattern p=Pattern.compile("r(r)");
		Matcher m=p.matcher("hurry");
		boolean b=m.find();
		System.out.println(b);
		if("r(r)".indexOf('(',"r(r)".indexOf(')'))!=-1){
			if(!(m.group(2).equals(null))){
				System.out.println(m.group(2).length());
				System.out.println(m.group(1)+":::"+m.group(2));
			}
		}
		else{
			System.out.println("null");
		}
		//System.out.println(b+""+m.group(1)+"hurry".replace(m.group(1),"h"));
		//System.out.println(is_matched("afga+sup","afga+root(su,1)"));
		/*String word[]={"kkA","wAt"};
		String attrib[]={"XA","niRTA"};		
		input_DS prakriyA=new input_DS(word, attrib);
		wripAxI_rule a=new wripAxI_rule("8-3-59",or(iN,ku)+"(s)\\w+","1 substitute R");
		if(a.condition(prakriyA)){
			System.out.println(a.apply(prakriyA).get_output());
		}
		else{
			System.out.println("did not get");
		}*/
	}
	
	
	//=======Whatever a says, should be in b ,b has to be apavAxa b->praWamA|xviwIyA, a->sup==> b can be apavAxa==> we can explore a more in subsets=============================//
	/*public static boolean is_matched(String a_attr, String b_attr){
		boolean status=false;
		boolean match=false;;
			//System.out.println("rAma+gf|hd".split("[+|]").length);
			//String a_attr="root(Si)";
			//String b_attr="sarvanAmasWAna+!sambuxXi";
		b_attr=b_attr.replace("afga+","").replace("afga","").replace("@root(","").replace("root(","").replace(")","");
		a_attr=a_attr.replace("afga+","").replace("afga","").replace("@root(","").replace("root(","").replace(")","");
		if(a_attr.length()==0){
			return true;
		}
		else if(b_attr.length()==0){
			return false;
		}
			
		String all_a_attr[]=a_attr.split("[+]");
			//System.out.println(b_attr+" "+a_attr);
		gg:for(int pat=0;pat<all_a_attr.length;pat++){
			System.out.println(all_a_attr[pat]+" "+b_attr);
			if(b_attr.indexOf(all_a_attr[pat])==-1){
				String all_a_attr_sub[]=all_a_attr[pat].split("[|]");
				inloop:for(int pata=0;pata<all_a_attr_sub.length;pata++){
					String subs="";
					if(subset(all_a_attr_sub[pata]).length()>0){
						subs=subs+subset(all_a_attr_sub[pata])+"|";
					}
					if(subs.length()>0){
						subs=subs.substring(0,subs.length()-1);
						System.out.println(subs);
					}
					else{
						continue gg;
					}
						
						//String subs=subset(all_a_attr_sub[pata]);
						//System.out.println(subs);
					match=false;
					whloop:while(subs.length()>0){
						String subse[]=subs.split("[|]");
						for(int kk=0;kk<subse.length;kk++){
								//System.out.println(b_attr+" "+subse[kk]+"52");
							if(b_attr.indexOf(subse[kk])!=-1){
									//System.out.println("54");
								match=true;
								status=true;
										//System.out.println("matched");
								continue gg;
							}
						}
						if(match){
							continue gg;
						}
						else{
								//String subse[]=subs.split("[|]");
							subs="";
							for(int kk=0;kk<subse.length;kk++){
								if(subset(subse[kk]).length()>0){
									subs=subs+subset(subse[kk])+"|";
								}
							}
							if(subs.length()>0){
								subs=subs.substring(0,subs.length()-1);
									//System.out.println(subs);
							}
							match=false;
						}
					}
					if(!match){
						status=false;
							//System.out.println(status);
						return status;
					}
						
				}
					
			}
				
		}
		return status;
	}
		
	
	public static String subset(String input){
		String output="";	
		if((input.equals("sup"))||(input.equals("viBakwi"))){
			output="praWamA|xviwIyA|wqwIyA|cawurWI|paFcamI|RaRTI|sapwamI";
		}
		else if(input.equals("praWamA")){
			output="su,1|O|jas";
		}
		else if(input.equals("xviwIyA")){
			output="am|Ot|Sas";
		}
		else if(input.equals("wqwIyA")){
			output="tA|ByAm|Bis";
		}
		else if(input.equals("cawurWI")){
			output="fe|ByAm|Byas";
		}
		else if(input.equals("paFcamI")){
			output="fasi,3|ByAm|Byas";
		}
		else if(input.equals("RaRTI")){
			output="fas|os|Am";
		}
		else if(input.equals("sapwamI")){
			output="fi|os|sup";
		}
		else if(input.equals("sarvanAmasWAna")){
			output="su,1|O|jas|am|Ot|Si";
		}
		return output;
	}	*/
		
		
}

