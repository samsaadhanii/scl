import java.io.*;
class change_aRt{
	public static void main(String args[]) throws IOException{
		BufferedReader read_input_sutra=new BufferedReader(new FileReader("dd_colors"));
		String sutra="";
		sutraloop:while((sutra=read_input_sutra.readLine())!=null){
			if(sutra.indexOf(" ")!=-1){

				int space=sutra.indexOf(" ",sutra.indexOf("-"));String sutra_or="";
			//if(sutra.substring(0,space).equals(rules[i])){
				sutra_or=sutra.substring(space+1);
				String prohib="0123456789()-";
				boolean change=true;;
				while(change==true){	
					change=false;				
					for(int kk=0;kk<sutra_or.length();kk++){						
						if(prohib.indexOf(sutra_or.charAt(kk))!=-1){
							sutra_or=sutra_or.substring(0,kk)+sutra_or.substring(kk+1);
							change=true;
							//kk++;
						}
					}
				}
				System.out.println(sutra.substring(0,space)+" "+sutra_or);
			}
			//}
		}
	}
}