import java.io.*;
	class get_input{
		public static void main (String argv []) throws IOException{			
			BufferedReader read_input=new BufferedReader(new FileReader("nouns"));
			String s1="";String noun="";String s2="";String new_temp="";String gender="puM";
			while((s1=read_input.readLine())!=null){
				if(s1.indexOf("")!=-1){
				String ng[]=s1.split(" ");
				noun=ng[0];
				if(ng.length>1){
					gender=ng[1];
				}
				}
				else{
					gender="puM";
				}
				
				BufferedReader read_temp=new BufferedReader(new FileReader("templates"));
				//System.out.println(noun);
				while((s2=read_temp.readLine())!=null){
					String temp[]=s2.split(" ");
					
					System.out.println(noun+" "+temp[1]+" "+gender+" "+temp[3]);
				}
			}
		}
	}
			