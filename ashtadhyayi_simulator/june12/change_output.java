import java.io.*;
class change_output{
	public static void main(String args[]) throws IOException{
		System.out.println("<HTML>");
		System.out.println("<BODY>");
		String file=args[0];
		BufferedReader read_input_sutra=new BufferedReader(new FileReader(args[0]));
		String sutra="";
		sutraloop:while((sutra=read_input_sutra.readLine())!=null){
			//int space=sutra.indexOf(" ");String sutra_or="";
			
				System.out.print(sutra);
				System.out.println("<BR>");
			//}
		}
		System.out.println("</HTML>");
		System.out.println("</BODY>");
	}
}