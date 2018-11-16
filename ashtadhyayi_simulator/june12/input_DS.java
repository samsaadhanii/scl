import java.lang.*;

class input_DS implements Cloneable{
	String words[]=new String[10];
	String attrib_words[]=new String[10];
	String attrib_group[]=new String[10];
	String index_attrib_group[]=new String[10];
	int length_DS=0;
	
	input_DS(String w, String attr){//attr should be separated by a ',' a,b,c
		length_DS=1;
		words[0]=w;
		attrib_words[0]=attr;
	}
	int DS_length(){
		int my_len=0;
		for(int i=0;i<5;i++){
			if((words[i]!=null)){
				if(attrib_words[i].length()>0){
					//System.out.println(words[i]+" "+i);
					my_len++;
				}
			}
		}
		return my_len;
	}
	input_DS(String w[], String attr[]){
		length_DS=w.length;
		for(int i=0;i<length_DS;i++){
			words[i]=w[i];
			attrib_words[i]=attr[i];
		}
	}
	void merge(){
		int len=DS_length();
		words[0]=words[0]+words[1];
		attrib_words[0]=attrib_words[0]+attrib_words[1];
		for(int i=1;i<len-1;i++){
			words[i]=words[i+1];
			attrib_words[i]=attrib_words[i+1];
		}
		//System.out.println(len+"  "+get_output()+42);
		words[len-1]="";
		attrib_words[len-1]="";
		length_DS=length_DS-1;
	}
	void insert(input_DS a,int where){
		int len=a.DS_length();
		//System.out.println(a.DS_length()+""+DS_length()+" 35");
		for(int j=DS_length()-1;j>where-1;j--){
			words[j+len]=words[j];
			attrib_words[j+len]=attrib_words[j];
		}
		for(int k=0;k<len;k++){
			words[where+k]=a.words[k];
			attrib_words[where+k]=a.attrib_words[k];
		}
		length_DS=length_DS+len;
		//System.out.println(DS_length()+" "+get_output()+"45input");
	}
	void add(String what_to_add, int where){
		attrib_words[where]=attrib_words[where]+","+what_to_add;
	}
	String get_aByAsa(int where){
		int aB_ind=attrib_words[where].indexOf("aByAsa");
		String aByAsa_word="";
		if(aB_ind==-1){
			aByAsa_word= "";
		}
		else{
			aByAsa_word=attrib_words[where].substring(aB_ind+7,attrib_words[where].indexOf('(',aB_ind));
		}
		return aByAsa_word;
	}
	
	void remove(String what_to_remove, int where){
		//if(

		int start=attrib_words[where].indexOf(what_to_remove);
		if(start!=-1){
			if(start<2){
				attrib_words[where]=attrib_words[where].substring(start+what_to_remove.length());
				if(attrib_words[where].indexOf(",")==0){
					attrib_words[where]=attrib_words[where].substring(1);
				}
			}
			else if(attrib_words[where].charAt(start-2)==','){
				attrib_words[where]=attrib_words[where].substring(0,start-2)+attrib_words[where].substring(start+what_to_remove.length());
			}
			else{
				attrib_words[where]=attrib_words[where].substring(0,start-1)+attrib_words[where].substring(start+what_to_remove.length());
			}
		}
		
	}

	input_DS myclone(){
		input_DS output=new input_DS("","");
		for(int i=0;i<10;i++){
			output.words[i]=this.words[i];
			output.attrib_words[i]=this.attrib_words[i];
		}
		output.length_DS=this.length_DS;
		return output;
	}

	
	void substitute(String what_to_subs, int where){
		String search_this=attrib_words[where];
		int root_prev=search_this.indexOf("root(");
		String root_pr="";
		if(root_prev==-1){
			//System.out.println("Error:: root not set");
		}
		else{
			root_pr=search_this.substring(root_prev+5, search_this.indexOf(")",root_prev+5)).trim();
			//System.out.println("The root is"+root_pr);
		}
		String attr_all[]=search_this.split(",");
		for(int i=0;i<attr_all.length;i++){
			if(attr_all[i].indexOf("-iw")!=-1){
				remove(attr_all[i],1);
				//System.out.println("1:::::"+get_output());
			}
			else if(attr_all[i].indexOf("root")!=-1){
				remove(attr_all[i],1);
				//System.out.println("2:::::"+get_output());
			}
		}
		words[1]=what_to_subs;
		//System.out.println("3:::::"+get_output());
		add("upaxeSa",1);
		//System.out.println("4:::::"+get_output());
		add("formation("+root_pr+")",1);
		//System.out.println("5:::::"+get_output());
	}
		
	String get_output(){ 
		// a method that will return the complete structure
		String output="";
		if(length_DS>0){
			for(int i=0;i<length_DS;i++){
				if(attrib_words[i].length()>0){
					output=output+" "+words[i]+"("+attrib_words[i]+")"+"+";
				}
			}
		if(output.length()>0){
			output=output.substring(0,output.length()-1);
		}
		}
		return output;
	}
}
