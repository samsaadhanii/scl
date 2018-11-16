import java.io.*;
class change_output1{
	public static void main(String args[]) throws IOException{
		System.out.println("<HTML>");
		System.out.println("<BODY>");
		System.out.println("<table border="+"\""+1+"\""+">");

		
		String file=args[0];
		BufferedReader read_input_sutra=new BufferedReader(new FileReader(args[0]));
		String sutra="";int triad=0;
		System.out.println("<tr>");
		sutraloop:while((sutra=read_input_sutra.readLine())!=null){
			triad++;

			
				System.out.print("<td>");
				System.out.print(sutra);
				System.out.print("</td>");
				if((triad%3)==0){
					System.out.println("</tr>");
					System.out.println("<tr>");
				}
			//}
		}
		System.out.println("</table>");
		System.out.println("</HTML>");
		System.out.println("</BODY>");
	}
}
