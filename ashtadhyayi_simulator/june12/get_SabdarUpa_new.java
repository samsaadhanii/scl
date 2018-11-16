import java.io.*;
import org.w3c.dom.Document;
import org.w3c.dom.*;
import java.util.regex.*;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.DocumentBuilder;
import org.xml.sax.SAXException;
import org.xml.sax.SAXParseException; 
import java.lang.*;
class get_SabdarUpa_new{
    public static final int Max_process=150;//May change depending upon the requirement
    public static String []process=new String [Max_process];
    public static String []rules=new String [Max_process];
    public static String instant_DS[]=new String[Max_process];
    public static String prev_target[]=new String[Max_process];
    public static boolean is_applied=false;
    public static int process_status=0;
    public static int afga_viXi_iter=0;
    public static String prev_rules[]=new String[18];
    //private static int num_rule_used=1;
    private static String output="";
    public static String [] viBakwi={"su,1","O","jas","am","Ot","Sas","tA","ByAm","Bis","fe","ByAm","Byas","fasi,3","ByAm","Byas","fas","os","Am","fi","os","sup"};//anunAsik marker needs to be given
    public static String [] wif={"wip","was","Ji","sip","Was","Wa","mib","vas","mas","wa","AwAm","Ja","WAs","AWAm","Xvam","it","vahi","mahif"};
    public static String [] wif_lot={"Nal","awus","us","Wal","aWus","a","Nal","va","ma"};
    //Different technical terms which need to be discussed
    private static String ac="[aAiIuUoOeEqQ]";
    private static String ak="[aAiIuUqQ]";
    private static String ic="[iIuUoOeEqQ]";	
    private static String cu="[cCjJF]";
    private static String tu="[tTdDN]";
    private static String ku="[kKgGf]";
    private static String pu="[pPbBm]";
    private static String iN=or(ic,"[hyvrl]");
    private static String wu="[wWxXn]";
    private static String hal=or(or(or(or(or(cu,tu),ku),pu),wu),"[yrlvSRsh]");
    private static String Jal="[JBGDXjbgdxKPCTWctwkpsSRh]";
    private static String yaF="[yvrlmfNnJB]";
    private static String ec="[eEoO]";
    private static String aN="[aAiIuU]";
    private static String hrasva="[aiuq]";
    private static String xIrGa="[AIUQ]";
    private static String guNa="[aeo]";
    private static String ik="[iIuUqQL]";
    private static String at=or(ac,"[hyvr]");	
    private static String Kar="[KPCTWctwkpSRs]";
    private static String yaN="[yvrl]";
    private static String anunAsika="[FmfNn]";
    private static String jaS="[jbgdx]";
    private static String car="[ctwkpSRs]";
    private static String yam="[yvrlFmfNn]";
    private static String Jay="[JBGDXjbgdxKPCTWctwkp]";
    private static String JaS="[JBGDXjbgdx]";
    private static String JaR="[JBGDX]";
    private static String Jar="[JBGDXjbgdxKPCTWctwkpsSR]";
    private static String Sar="[SRs]";
    private static String yar="[yvrlFmfNnJBGDXjbgdxKPCTWctwkpsSR]";
    private static String val="[vrlFmfNnJBGDXjbgdxKPCTWctwkpsSRh]";
    //Different technical terms which need to be discussed
	
	
    //===================The main program starts here=========================================//

    public static void main (String argv []) throws IOException{

	    //To ensure that the values are not copied again
	process_status=0;afga_viXi_iter=0;
	for(int i=0;i<Max_process;i++){
	    process[i]="";rules[i]="";instant_DS[i]="";
	}
	//===input read from the command line====//
	String tempin[]=new String[argv.length];
	for(int i=0;i<argv.length;i++) tempin[i]=argv[i];
	/*
	  if(where_to_continue(tempin)){
	  f1.write("-\n");				
	  //===============Some words which don't take all th declensions======================//	
	  continue readloop;
	  }*/
	String out_only="";//Instead of writing in file, it will be appended here, not sure where to output this though			
	String input_root="";String input_attr="";
	if(tempin.length==4){
	    input_root=tempin[0].trim();
	    input_attr=tempin[1].trim()+", "+tempin[2].trim()+", "+tempin[3].trim();
	}
	else{
	    input_root=tempin[0].trim();
	    input_attr=tempin[1].trim()+", "+tempin[2].trim()+", "+tempin[3].trim()+", "+tempin[4].trim()+", "+tempin[5].trim();
	}
	input_DS input=new input_DS(input_root,input_attr);
	input_DS use_it=input;
	String root_word=input.words[0];		    
	String root_word_char=input.attrib_words[0];
	process[process_status]=root_word;
	instant_DS[process_status]=input.get_output();
	process_status++;
	try{
	    use_it=search_for_category(input);
	}
	catch(Exception e){};
	input=use_it;
	use_it=vacana_assign(input);
	input=use_it;
	use_it=add_appropriate_prawyaya(input);//A subroutine add_appropriate_prawyay to be made
	input=use_it;
				
	//=========Only for prAwipaxika==========================================//
				
				
	paxa_DS[] new_use_it;
	if(belongs("prAwipaxika",input.attrib_words[0])){
	    //try{
	    input_DS special[]=rule_6_1_63(input);
	    //}
	    //catch(Exception e){};
	    for(int kk=0;kk<special.length;kk++){
		afga_viXi_iter=0;
		//System.out.println(special[kk].get_output()+" 161");
		BufferedReader Xawuread=new BufferedReader(new FileReader("Xawu"));
		String Xawu_ind="";
		//	//System.out.println(input.words[0]+"118");
		String prakqwi=special[kk].words[0];
		//					//System.out.println(prakqwi+"113");
		while((Xawu_ind=Xawuread.readLine())!=null){
		    if(prakqwi.indexOf(Xawu_ind)!=-1){//System.out.println("86");
			if(prakqwi.indexOf(Xawu_ind)==(prakqwi.length()-Xawu_ind.length())){//System.out.println("87");
			    special[kk].add("@ends(XAwu)",0);
			    special[kk].add("@ends("+Xawu_ind+")",0);
			}
		    }
		}
		//================Some way for prawyayAnwa needs to be found==========================//
		if(prakqwi.equals("XAwq")){
		    input.add("prawyayAnwa(wqn)",0);
		}
						
		if(belongs("puM",special[kk].attrib_words[0])){//System.out.println("152");
		    BufferedReader prAread=new BufferedReader(new FileReader("swrI"));
		    String prA_ind="";
		    //String prakqwi=input.words[0];
		    while((prA_ind=prAread.readLine())!=null){//System.out.println("98");
			if(prakqwi.indexOf(prA_ind)!=-1){//System.out.println("99");
			    if(prakqwi.indexOf(prA_ind)==(prakqwi.length()-prA_ind.length())){//System.out.println("100");
				special[kk].add("@ends(swrI)",0);
			    }
			}
		    }
		}
					
		input=special[kk];
		input_DS use_it_sam[]=saMjFA(input);
		for(int sam=0;sam<use_it_sam.length;sam++){
		    afga_viXi_iter=0;
		    input=use_it_sam[sam];
		    //System.out.println(input.get_output()+"sam"+sam+"166");
		    input_DS sapAxa_sap[]=recursive_sUwra_aRt(input);
							
		    for(int ss=0;ss<sapAxa_sap.length;ss++){
			new_use_it=paxa_viXi(sapAxa_sap[ss]);
			for(int nu=0;nu<new_use_it.length;nu++){
			    out_only += (new_use_it[nu].get_output().substring(1,new_use_it[nu].get_output().indexOf("(")));
			    if(kk==special.length-1){
				if(ss==sapAxa_sap.length-1){
				    if(sam==use_it_sam.length-1){
					if(nu==new_use_it.length-1){
											
					     out_only += ("<@br>");
					}
					else
					    {
						 out_only += ("/");
					    }
				    }
				    else
					{
					     out_only += ("/");
					}
				}
				else
				    {
					 out_only += ("/");
				    }
			    }
			    else{
				 out_only += ("/");
			    }
			}
		    }
		}
					
	    }
	}
	else{
	    input_DS use_it_sam[]=saMjFA(input);
	    for(int sam=0;sam<use_it_sam.length;sam++){
		afga_viXi_iter=0;
		input=use_it_sam[sam];
		//System.out.println(input.get_output()+"sam"+sam+"166");
		input_DS sapAxa_sap[]=recursive_sUwra_aRt(input);
							
		for(int ss=0;ss<sapAxa_sap.length;ss++){
		    new_use_it=paxa_viXi(sapAxa_sap[ss]);
		    for(int nu=0;nu<new_use_it.length;nu++){
			 out_only += (new_use_it[nu].get_output().substring(1,new_use_it[nu].get_output().indexOf("(")));
			//if(kk==special.length-1){
			if(ss==sapAxa_sap.length-1){
			    if(sam==use_it_sam.length-1){
				if(nu==new_use_it.length-1){
											
				     out_only += ("\n");
				}
				else
				    {
					 out_only += ("/");
				    }
			    }
			    else
				{
				     out_only += ("/");
				}
			}
			else
			    {
				 out_only += ("/");
			    }
			// 								}
			// 								else{
			// 									f1.write("/");
			// 								}
		    }
		}
	    }
	}
	BufferedReader read_input_sutra=new BufferedReader(new FileReader("aRt_new"));
	String sutra="";String sutra_or="";
	for(int i=1;i<process_status;i++){
	    sutra_or="";sutra="";					
	    if(rules[i].length()>4){
		for(int z=0;z<rules[i].length();z++){
		    if(rules[i].charAt(z)=='.'){
			rules[i]=rules[i].substring(0,z)+"-"+rules[i].substring(z+1);
		    }
		}
						
		read_input_sutra=new BufferedReader(new FileReader("aRt_new"));
		sutraloop:while((sutra=read_input_sutra.readLine())!=null){
								
		    int space=sutra.indexOf(" ");
		    if(sutra.substring(0,space).equals(rules[i])){
									
			sutra_or=sutra.substring(space+1);
			break sutraloop;
		    }
		}
		//if(rules[i]
		if(process[i].length()>1){
		    System.out.println(rules[i] +"("+sutra_or+")"+"::::::::"+process[i]+"<@br>");
		}
		else{
		    System.out.println("::::::::"+rules[i] +"("+sutra_or+")"+"::::::::<@br>");
		}
	    }
	    //instant_DS[i].output_form();
	    if(instant_DS[i].length()>5){
		System.out.println(instant_DS[i]+"<@br>");
	    }
	}				
				
	System.out.println("<@br>");System.out.println("<@br>");System.out.println("<@br>");System.out.println("<@br>");
    }
		
    public static boolean where_to_continue(String[] tempin){
	if(tempin.length<4){
	    //f1.write(tempin[0]+"\n");
	    //System.out.println("Error::input is not specified correctly");
	    //continue readloop;
	    return true;
	}
	//===============Some words which don't take all the declensions=======================//
	if((tempin[0].equals("xArA"))||(tempin[0].equals("lAjA"))||(tempin[0].equals("gqha"))){
	    if(!(tempin[2].equals("napuMsaka"))){
		if(!(tempin[3].equals("bahuvacana"))){
		    return true;
		}
	    }
	}
	if(belongs(tempin[0],"eka|ekam")){
	    if(!(tempin[3].equals("ekavacana"))){
		return true;
	    }
	}
	if(belongs(tempin[0],"uBa|xvi")){
	    if(!(tempin[3].equals("xvivacana"))){
		return true;
	    }
	}
	if(belongs(tempin[0],"kawi|wri|cawur|paFcan|RaR|sapwan|aRtan|navan|xaSan")){
	    if(!(tempin[3].equals("bahuvacana"))){
		return true;
	    }
	}
	if(tempin[0].equals("uBaya")){
	    if(tempin[3].equals("xvivacana")){
		return true;
	    }
	}
	return false;
    }
    public static void ap_process(String rule_number,String rule_category,paxa_DS paxa){
	rules[process_status]=rule_number;
	process[process_status]=rule_category;
	instant_DS[process_status]=paxa.get_output();
	process_status++;
    }
    public static input_DS xviwva(input_DS prakriyA){
	String word=prakriyA.words[0];
	String ekAca="";
	if(belongs(word.charAt(0)+"",ac)){
	    if(belongs(word.charAt(1)+" ","nxr")){
		if(belongs(word.charAt(2)+" ",hal)){
		    ekAca=get_ekAca(word.substring(2));
		    rules[process_status]="6-1-3";process_status++;
		}
		ekAca=get_ekAca(word.substring(1));
		rules[process_status]="6-1-2";process_status++;
	    }
	    ekAca=get_ekAca(word.substring(1));
	    rules[process_status]="6-1-2";process_status++;				
	}
	else{
	    ekAca=get_ekAca(word);
	    rules[process_status]="6-1-2";process_status++;
	}
	prakriyA.words[0]=ekAca+word;
	prakriyA.add("aByAsa("+ekAca+")",0);
	rules[process_status]="6-1-4";process_status++;
	prakriyA.add("aByaswa",0);
	rules[process_status]="6-1-5";process_status++;
	return prakriyA;
    }
    public static String get_ekAca(String word){
	if(is_ekAca(word)){
	    return word;
	}
	else{
	    int j=find_firstvowel(word);
	    return word.substring(0,j+1);
	}
    }
		
    public static paxa_DS[] paxa_viXi(input_DS prakriyA){			
	wripAxI_rule list_wripAxI_rule[]=new wripAxI_rule[200];
	String word=prakriyA.words[0]+prakriyA.words[1];
	String attr="paxa";
	input_DS external=new input_DS(word,attr);
	paxa_DS paxa=new paxa_DS(external,prakriyA);			
	external.add("avasAna",0);
	if(prakriyA.words[1].length()>0){
	    prakriyA.add("avasAna",1);
	}
	else{
	    prakriyA.add("avasAna",0);
	}
	paxa=new paxa_DS(external,prakriyA);
	ap_process("1-4-110","avasAna",paxa);
	//rules[process_status]="1-4-110";
	//process[process_status]="avasAna";
			
	//paxa=new paxa_DS(external,prakriyA);
	//instant_DS[process_status]=paxa.get_output();
	//process_status++;
	int w=0;
	list_wripAxI_rule[w]=new wripAxI_rule("8-2-7","(n)(\\w)+","1 lopa","1 prAwipaxika+paxa","2 prawyaya");w++;
	list_wripAxI_rule[w]=new wripAxI_rule("8-2-7","(n)$","1 lopa","1 prAwipaxika");w++;
	list_wripAxI_rule[w]=new wripAxI_rule("8-2-8","(n)(\\w)+","","1 prAwipaxika","2 root(fi)|sambuxXi","niReXa");w++;
	list_wripAxI_rule[w]=new wripAxI_rule("8-2-23",hal+"("+hal+")$","1 lopa","1 paxa");w++;
	list_wripAxI_rule[w]=new wripAxI_rule("8-2-23",hal+"("+hal+")(\\w)","1 lopa","1 paxa+!prawyaya","2 prawyaya");w++;
	list_wripAxI_rule[w]=new wripAxI_rule("8-2-24","r("+hal+")$","","1 paxa","","niReXa");w++;
	list_wripAxI_rule[w]=new wripAxI_rule("8-2-24","r("+hal+")(\\w)","1 lopa","1 paxa","2 prawyaya","niReXa");w++;
	list_wripAxI_rule[w]=new wripAxI_rule("8-2-24","r(s)$","1 lopa","1 paxa","");w++;
	list_wripAxI_rule[w]=new wripAxI_rule("8-2-24","r(s)(\\w)","1 lopa","1 paxa","2 prawyaya");w++;
	list_wripAxI_rule[w]=new wripAxI_rule("8-2-27","("+hrasva+")(s)"+Jal,"2 lopa","1 afga");w++;
	list_wripAxI_rule[w]=new wripAxI_rule("8-2-29","([sk])"+hal+Jal,"1 lopa","1 paxa");w++;
	list_wripAxI_rule[w]=new wripAxI_rule("8-2-29","([sk])"+hal+"$","1 lopa","1 paxa");w++;
	list_wripAxI_rule[w]=new wripAxI_rule("8-2-30","("+cu+")"+Jal,"1 substitute "+ku);w++;
	list_wripAxI_rule[w]=new wripAxI_rule("8-2-30","("+cu+")"+"$","1 substitute "+ku);w++;
	list_wripAxI_rule[w]=new wripAxI_rule("8-2-31","(h)"+Jal,"1 substitute D");w++;
	list_wripAxI_rule[w]=new wripAxI_rule("8-2-31","(h)$","1 substitute D");w++;
	list_wripAxI_rule[w]=new wripAxI_rule("8-2-32","^x\\w*(h)"+Jal,"1 substitute G","1 XAwu");w++;
	list_wripAxI_rule[w]=new wripAxI_rule("8-2-32","^x\\w*(h)$","1 substitute G","1 XAwu");w++;
	list_wripAxI_rule[w]=new wripAxI_rule("8-2-33","(h)"+Jal,"1 substitute G","1 root(xruh)|root(muh)|root(RNuh)|root(RNih)","","viBARA");w++;
	list_wripAxI_rule[w]=new wripAxI_rule("8-2-33","(h)$","1 substitute G", "1 root(xruh)|root(muh)|root(RNuh)|root(RNih)","","viBARA");w++;
	list_wripAxI_rule[w]=new wripAxI_rule("8-2-34","na(h)"+Jal,"1 substitute X");w++;
	list_wripAxI_rule[w]=new wripAxI_rule("8-2-34","na(h)$","1 substitute X");w++;
	list_wripAxI_rule[w]=new wripAxI_rule("8-2-35","A(h)"+Jal,"1 substitute W");w++;
	list_wripAxI_rule[w]=new wripAxI_rule("8-2-36","([cj])"+Jal,"1 substitute R","1 ends(vraSc)|ends(Brasj)|ends(sqj)|ends(mqj)|ends(yaj)|ends(rAj)|ends(BrAj)");w++;
	list_wripAxI_rule[w]=new wripAxI_rule("8-2-36","([cj])$","1 substitute R","1 ends(vraSc)|ends(Brasj)|ends(sqj)|ends(mqj)|ends(yaj)|ends(rAj)|ends(BrAj)");w++;
	list_wripAxI_rule[w]=new wripAxI_rule("8-2-36","([cj])(\\w)","1 substitute R","1 ends(vraSc)|ends(Brasj)|ends(sqj)|ends(mqj)|ends(yaj)|ends(rAj)|ends(BrAj)","2 prawyaya");w++;
	list_wripAxI_rule[w]=new wripAxI_rule("8-2-36","([CS])"+Jal,"1 substitute R");w++;
	list_wripAxI_rule[w]=new wripAxI_rule("8-2-36","([CS])$","1 substitute R");w++;
	//if(is_ekAca(external.words[0])){
	//System.out.println(is_ekAca(external.words[0])+"300");
	list_wripAxI_rule[w]=new wripAxI_rule("8-2-37","([bgdx])\\w*[JBGDX]$","1 substitute [BGDX]","1 XAwu","",is_ekAca(paxa.internal_str.words[0]));w++;
	list_wripAxI_rule[w]=new wripAxI_rule("8-2-37","([bgdx])\\w*[JBGDX]","1 substitute [BGDX]","1 paxa","1 XAwu",is_ekAca(paxa.internal_str.words[0]));w++;
	//}
	list_wripAxI_rule[w]=new wripAxI_rule("8-2-39","("+Jal+")$","1 substitute "+jaS);w++;
	list_wripAxI_rule[w]=new wripAxI_rule("8-2-39","("+Jal+")(\\w)","1 substitute "+jaS,"1 paxa+!prawyaya","2 prawyaya");w++;
	list_wripAxI_rule[w]=new wripAxI_rule("8-2-40","("+JaR+")(wW)","2 substitute X","1 !root(XA)");w++;
	list_wripAxI_rule[w]=new wripAxI_rule("8-2-41","([RD])s","1 substitute k");w++;
	list_wripAxI_rule[w]=new wripAxI_rule("8-2-42","[rx](w)","1 substitute n","1 niRTA");w++;
	list_wripAxI_rule[w]=new wripAxI_rule("8-2-43","(^"+hal+hal+"\\w*A)(w)","2 substitute n","1 XAwu", "2 niRTA");w++;
	list_wripAxI_rule[w]=new wripAxI_rule("8-2-44","(\\w)(w)","2 substitute n","1 lU-Axi", "2 niRTA");w++;
	list_wripAxI_rule[w]=new wripAxI_rule("8-2-66","(s)$","1 AxeSa ru,1","1 paxa");w++;
	list_wripAxI_rule[w]=new wripAxI_rule("8-2-68","aha(n)$","1 AxeSa ru,1","1 paxa");w++;
	list_wripAxI_rule[w]=new wripAxI_rule("8-2-80","^a(x[^sa])","1 substitute mU","1 root(axas)");w++;
	list_wripAxI_rule[w]=new wripAxI_rule("8-2-80","^a(xa)","1 substitute mu","1 root(axas)");w++;
	list_wripAxI_rule[w]=new wripAxI_rule("8-2-81","a(xe)","1 substitute mI","1 root(axas)","1 bahuvacana");w++;
	list_wripAxI_rule[w]=new wripAxI_rule("8-3-13","(D)(D)","2 lopa");w++;
	list_wripAxI_rule[w]=new wripAxI_rule("8-3-14","(r)(r)","2 lopa");w++;
	list_wripAxI_rule[w]=new wripAxI_rule("8-3-15","(r)$","1 substitute H");w++;
	list_wripAxI_rule[w]=new wripAxI_rule("8-3-15","(r)("+Kar+")","1 substitute H","1 paxa");w++;
	list_wripAxI_rule[w]=new wripAxI_rule("8-3-23","(m)("+hal+")","1 substitute M","1 paxa");w++;
	list_wripAxI_rule[w]=new wripAxI_rule("8-3-24","([nm])"+Jal,"1 substitute M","1 !paxa");w++;
	list_wripAxI_rule[w]=new wripAxI_rule("8-3-25","sa(m)(rA)"+Jal,"1 substitute M","2 root(rAj)+prawyayaAnwa(kvip)");w++;
	list_wripAxI_rule[w]=new wripAxI_rule("8-3-26","(m)(h)m","1 substitute m","","","viBARA");w++;
	list_wripAxI_rule[w]=new wripAxI_rule("8-3-27","(m)(h)n","1 substitute n","","","viBARA");w++;
	list_wripAxI_rule[w]=new wripAxI_rule("8-3-29","(d)(s)","1 Agama Xut,1","","","viBARA");w++;
	list_wripAxI_rule[w]=new wripAxI_rule("8-3-59","("+or(iN,ku)+")(s)\\w+","2 substitute R","2 prawyaya");w++;
	list_wripAxI_rule[w]=new wripAxI_rule("8-4-2","[rRqQ]"+or(or(or(at,ku),pu),"[n]")+"*(n)","1 substitute N");w++;
	list_wripAxI_rule[w]=new wripAxI_rule("8-4-37","[rRqQ]"+or(or(or(at,ku),pu),"[n]")+"*(n)$","","1 paxa","","niReXa");w++;
	list_wripAxI_rule[w]=new wripAxI_rule("8-4-40","([swWxXn])[ScCjJF]","1 substitute [ScCjJF]");w++;
	list_wripAxI_rule[w]=new wripAxI_rule("8-4-40","[ScCjJF]([swWxXn])","1 substitute [ScCjJF]");w++;
	list_wripAxI_rule[w]=new wripAxI_rule("8-4-41","([swWxXn])[RtTdDN]","1 substitute [RtTdDN]");w++;
	list_wripAxI_rule[w]=new wripAxI_rule("8-4-41","[RtTdDN]([swWxXn])","1 substitute [RtTdDN]");w++;
	list_wripAxI_rule[w]=new wripAxI_rule("8-4-42","([tTdDN])[swWxXn]","","1 paxa","","niReXa");w++;
	list_wripAxI_rule[w]=new wripAxI_rule("8-4-43","([wWxXn])(R)","","","","niReXa");w++;
	list_wripAxI_rule[w]=new wripAxI_rule("8-4-44","(S)([wWxXn])","","","","niReXa");w++;
	//list_wripAxI_rule[w]=new wripAxI_rule("8-4-44","("+yar+")"+anunAsika,"1 substitute [nmfFN]","1 paxa","","viBARA");w++;
	//list_wripAxI_rule[w]=new wripAxI_rule("8-4-46",ac+"[rh]("+yar+")","1 substitute duplicate","1 paxa","","viBARA");w++;
	//list_wripAxI_rule[w]=new wripAxI_rule("8-4-47",ac+"("+yar+")"+not(ac),"1 substitute duplicate","","","viBARA");w++;
	//list_wripAxI_rule[w]=new wripAxI_rule("8-4-47",ac+"("+yar+")("+ac+")","","","","niReXa");w++;
	list_wripAxI_rule[w]=new wripAxI_rule("8-4-49","("+Sar+")("+ac+")","","","","niReXa");w++;
	list_wripAxI_rule[w]=new wripAxI_rule("8-4-53","("+Jal+")("+JaS+")","1 substitute "+jaS);w++;
	list_wripAxI_rule[w]=new wripAxI_rule("8-4-55","("+Jal+")("+Kar+")","1 substitute "+car);w++;
	list_wripAxI_rule[w]=new wripAxI_rule("8-4-56","([jbgdx])$","1 substitute [cpktw]","","","viBARA");w++;
	//8-4-56 was modified;w++;
	list_wripAxI_rule[w]=new wripAxI_rule("8-4-59","(M)("+pu+")","1 substitute m","1 paxa","","viBARA");w++;
	list_wripAxI_rule[w]=new wripAxI_rule("8-4-62","([kKgG])(h)","2 substitute G","","","viBARA");w++;
	list_wripAxI_rule[w]=new wripAxI_rule("8-4-62","([cCjJ])(h)","2 substitute J","","","viBARA");w++;
	list_wripAxI_rule[w]=new wripAxI_rule("8-4-62","([tTdD])(h)","2 substitute D","","","viBARA");w++;
	list_wripAxI_rule[w]=new wripAxI_rule("8-4-62","([wWxX])(h)","2 substitute X","","","viBARA");w++;
	list_wripAxI_rule[w]=new wripAxI_rule("8-4-62","([pPbB])(h)","2 substitute B","","","viBARA");w++;
	list_wripAxI_rule[w]=new wripAxI_rule("8-4-63","("+Jay+")(S)"+at,"2 substitute C","","","viBARA");w++;
	list_wripAxI_rule[w]=new wripAxI_rule("8-4-64","("+hal+")("+yam+")"+yam,"2 lopa","","","viBARA");w++;
	boolean is_apavAxa=false;
	input_DS aa=new input_DS("","");
	//input_DS aa=new_input_DS("","");
	paxa_DS all_paxa[]=new paxa_DS[10];
	boolean just_changed[]=new boolean[10];
	int start_ind[]={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};
	int num_apavAxa=0;
	String category[]=new String[15];
	int winner=0;
	int runner=0;
	String winner_cat="";
	String runner_cat="";
	all_paxa[0]=paxa;all_paxa[1]=new paxa_DS(aa,aa.myclone());
	for(int pp=2;pp<6;pp++){
	    all_paxa[pp]=all_paxa[pp-1].myclone();
	    //System.out.println(all_paxa[pp].get_output().length());
	}
	int num_forms=1;
	for(int pp=0;pp<10;pp++){
	    if(pp<num_forms){
		wrloop:for(int wr=start_ind[pp];wr<w;wr++){
		    //System.out.println(start_ind[pp]+" "+pp+" "+" 362");
		    if(list_wripAxI_rule[wr].condition(all_paxa[pp])){
			//System.out.println(list_wripAxI_rule[wr].rule_number+" "+wr);
			num_apavAxa=0;winner=0;winner_cat="";runner_cat="";
			loop:for(int i=1;i<16;i++){
			    category[i-1]="";
			    if(wr+i<w){
				if(!(list_wripAxI_rule[wr+i].rule_number.equals(list_wripAxI_rule[wr].rule_number))){
				    if(list_wripAxI_rule[wr+i].rule_number.substring(0,3).equals(list_wripAxI_rule[wr].rule_number.substring(0,3))){
					if(list_wripAxI_rule[wr+i].condition(all_paxa[pp])){
					    if((list_wripAxI_rule[wr+i].ap_ind(all_paxa[pp])==list_wripAxI_rule[wr].ap_ind(all_paxa[pp]))||(list_wripAxI_rule[wr+i].special.equals("niReXa"))||(list_wripAxI_rule[wr+i].rule_number.equals("8-2-29"))){
						//System.out.println(list_wripAxI_rule[wr+i].rule_number+":::"+list_wripAxI_rule[wr].rule_number+" 369 "+list_wripAxI_rule[wr+i].ap_ind(all_paxa[pp]));
						if(list_wripAxI_rule[wr+i].special.length()==0){
						    if(list_wripAxI_rule[wr+i].group1_check.length()>0){
							category[i-1]="apavAxa";num_apavAxa++;
						    }
						}
						else{
						    category[i-1]=list_wripAxI_rule[wr+i].special;num_apavAxa++;
						}
					    }
					}
					else{
					    category[i-1]="";
					}
				    }}
			    }
			}
			//System.out.println("385 "+list_wripAxI_rule[wr].rule_number+" "+wr+" "+num_apavAxa);
			if(num_apavAxa==0){
			    if(list_wripAxI_rule[wr].special.equals("viBARA")){
				all_paxa[num_forms]=all_paxa[pp].myclone();
				start_ind[num_forms]=wr+1;
				num_forms++;
				//all_paxa[pp+1]=
				all_paxa[pp]=list_wripAxI_rule[wr].apply(all_paxa[pp]);
				ap_process(list_wripAxI_rule[wr].rule_number,"wripAxI",all_paxa[pp]);
			    }
			    else if(list_wripAxI_rule[wr].special.equals("niReXa")){
				all_paxa[pp]=all_paxa[pp];
			    }
			    else{
				all_paxa[pp]=list_wripAxI_rule[wr].apply(all_paxa[pp]);
				ap_process(list_wripAxI_rule[wr].rule_number,"wripAxI",all_paxa[pp]);
			    }
			    //wr=
			}
			else if(num_apavAxa==1){
			    for(int cat=0;cat<15;cat++){
				if(category[cat].length()>0){
				    winner=wr+cat+1;
				    winner_cat=category[cat];
				}
			    }
			    if(winner_cat.equals("niReXa")){
				all_paxa[pp]=all_paxa[pp];
			    }
			    else if(winner_cat.equals("apavAxa")){
				all_paxa[pp]=list_wripAxI_rule[winner].apply(all_paxa[pp]);
				ap_process(list_wripAxI_rule[winner].rule_number,"wripAxI",all_paxa[pp]);
				wr=winner;
			    }
			    else{
				if(list_wripAxI_rule[winner].ap_spec(all_paxa[pp]).equals(list_wripAxI_rule[wr].ap_spec(all_paxa[pp]))){
				    all_paxa[num_forms]=all_paxa[pp].myclone();
				    start_ind[num_forms]=winner+1;
				    num_forms++;
				    all_paxa[pp]=list_wripAxI_rule[wr].apply(all_paxa[pp]);
				    ap_process(list_wripAxI_rule[wr].rule_number,"wripAxI",all_paxa[pp]);
				}
				else{
				    paxa_DS paxa_clone=all_paxa[pp].myclone();
				    paxa_clone=list_wripAxI_rule[winner].apply(paxa_clone);
				    ap_process(list_wripAxI_rule[winner].rule_number,"wripAxI",paxa_clone);
				    all_paxa[num_forms]=paxa_clone.myclone();
				    start_ind[num_forms]=winner+1;
				    num_forms++;
				    all_paxa[pp]=list_wripAxI_rule[wr].apply(all_paxa[pp]);
				    ap_process(list_wripAxI_rule[wr].rule_number,"wripAxI",all_paxa[pp]);
				}
			    }
			}
			else{
			    for(int cat=14;cat>=0;cat--){
				if(category[cat].length()>0){
				    if(winner_cat.length()>0){
					if(runner_cat.length()==0){
					    runner=wr+cat+1;
					    runner_cat=category[cat];
					}
				    }
				    else{
					winner=wr+cat+1;
					winner_cat=category[cat];
				    }
				}
			    }
			    //System.out.println(list_wripAxI_rule[winner].rule_number+" 479 "+winner_cat);
			    if(winner_cat.equals("niReXa")){
				all_paxa[pp]=all_paxa[pp];
			    }
			    else if(winner_cat.equals("apavAxa")){
				all_paxa[pp]=list_wripAxI_rule[winner].apply(all_paxa[pp]);
				ap_process(list_wripAxI_rule[winner].rule_number,"wripAxI",all_paxa[pp]);
				wr=winner;
			    }
			    else{
				if(runner_cat.equals("apavAxa")){
				    if(list_wripAxI_rule[runner].ap_spec(all_paxa[pp]).equals(list_wripAxI_rule[winner].ap_spec(all_paxa[pp]))){
					paxa_DS paxa_clone=all_paxa[pp].myclone();
					paxa_clone=list_wripAxI_rule[winner].apply(paxa_clone);
					ap_process(list_wripAxI_rule[winner].rule_number,"wripAxI",paxa_clone);
					all_paxa[num_forms]=paxa_clone.myclone();
					start_ind[num_forms]=winner+1;
					num_forms++;
					all_paxa[pp]=list_wripAxI_rule[wr].apply(all_paxa[pp]);
					ap_process(list_wripAxI_rule[wr].rule_number,"wripAxI",all_paxa[pp]);
					/*
					  all_paxa[num_forms]=all_paxa[pp].myclone();
					  start_ind[num_forms]=winner+1;
					  num_forms++;
					  all_paxa[pp]=list_wripAxI_rule[winner].apply(all_paxa[pp]);
					  ap_process(list_wripAxI_rule[winner].rule_number,"wripAxI",all_paxa[pp]);
					*/
					//wr=winner;
				    }
				    else{
					paxa_DS paxa_clone=all_paxa[pp].myclone();
					paxa_clone=list_wripAxI_rule[winner].apply(paxa_clone);
					ap_process(list_wripAxI_rule[winner].rule_number,"wripAxI",paxa_clone);
					all_paxa[num_forms]=paxa_clone.myclone();
					start_ind[num_forms]=winner+1;
					num_forms++;
					all_paxa[pp]=list_wripAxI_rule[runner].apply(all_paxa[pp]);
					ap_process(list_wripAxI_rule[runner].rule_number,"wripAxI",all_paxa[pp]);
				    }
				}
				else if(runner_cat.equals("niReXa")){
				    all_paxa[num_forms]=all_paxa[pp].myclone();
				    start_ind[num_forms]=winner+1;
				    num_forms++;
				    all_paxa[pp]=list_wripAxI_rule[wr].apply(all_paxa[pp]);
				    ap_process(list_wripAxI_rule[wr].rule_number,"wripAxI",all_paxa[pp]);
				}
				else{
				    all_paxa[num_forms]=all_paxa[pp].myclone();
				    start_ind[num_forms]=winner+1;
				    num_forms++;
				    all_paxa[pp]=list_wripAxI_rule[winner].apply(all_paxa[pp]);
				    ap_process(list_wripAxI_rule[winner].rule_number,"wripAxI",all_paxa[pp]);
				}
				wr=winner;
			    }
			}
		    }
		}
	    }
	}
	paxa_DS output[]=new paxa_DS[num_forms];
	for(int nu=0;nu<num_forms;nu++){
	    output[nu]=all_paxa[nu];
	}
	return output;
    }
				
    public static String get_mapping(String to_search,String from,String output){
	if(from.length()==output.length()){
	    int fr_ind=from.indexOf(to_search);
	    return output.substring(fr_ind,fr_ind+1);
	}
	if(from.equals(Jal)){
	    if(output.equals(car)){
		if(belongs(to_search,ku)){
		    return "k";
		}
		if(belongs(to_search,cu)){
		    return "c";
		}
		if(belongs(to_search,tu)){
		    return "t";
		}
		if(belongs(to_search,wu)){
		    return "w";
		}
		if(belongs(to_search,pu)){
		    return "p";
		}
		return to_search;
	    }
	    if(output.equals(jaS)){
		if(belongs(to_search,ku)){
		    return "g";
		}
		if(belongs(to_search,cu)){
		    return "j";
		}
		if(belongs(to_search,tu)){
		    return "d";
		}
		if(belongs(to_search,wu)){
		    return "x";
		}
		if(belongs(to_search,pu)){
		    return "b";
		}
		if(to_search.equals("S")){return "j";}
		if(to_search.equals("R")){return "d";}
		if(to_search.equals("s")){return "x";}
		if(to_search.equals("h")){return "g";}
		return to_search;
	    }
	}
	return to_search;
    }
				
    public static boolean is_ekAca(String word){
	int aca=0;
	for(int i=0;i<word.length();i++){
	    if(belongs(word.substring(i,i+1),ac)){
		aca++;
	    }
	}
	if(aca==1){
	    return true;
	}
	return false;
    }
    public static String do_xIrGa(char a){
	String output="";
	switch(a){
	case 'a':
	case 'A':
	    output="A";break;
	case 'i':
	case 'I':
	    output="I";break;
	case 'u':
	case 'U':
	    output="U";break;
	case 'q':
	case 'Q':
	    output="Q";break;
	default:
	    output=a+"";break;
	}
	return output;
    }
		
    public static input_DS prawyaya_saMjFA(input_DS prakriyA){
	// 			if(belongs("wif|S-iw",prakriyA.attrib_words[1])){
	// 				if(!(belongs("sArvaXAwuka",prakriyA.attrib_words[1]))){
	// 					prakriyA.add("sArvaXAwuka",1);
	// 					rules[process_status]="3-4-113";
	// 					process[process_status]="sArvaXAwuka";
	// 					instant_DS[process_status]=prakriyA.get_output();
	// 					process_status++;
	// 				}
	// 			}
	if(belongs("prAwipaxika",prakriyA.attrib_words[0])){
	    if(belongs("AxeSa(Si)",prakriyA.attrib_words[1])){
		if(!(belongs("sarvanAmasWAna",prakriyA.attrib_words[1]))){
		    prakriyA.add("sarvanAmasWAna",1);
		    prakriyA.remove("Ba",0);
		    prakriyA.remove("paxa",0);
		    rules[process_status]="1-1-42";
		    process[process_status]="sarvanAmasWAna";
		    instant_DS[process_status]=prakriyA.get_output();
		    process_status++;
		}
	    }
	    if(belongs("Gi",prakriyA.attrib_words[0])){
		//System.out.println("848");
		if(!(belongs(anwyam(prakriyA.attrib_words[0]),"iu"))){
		    //System.out.println("850");
		    prakriyA.remove("Gi",0);
		    //System.out.println(prakriyA.attrib_words[0]+"852");
		}
	    }
	    if(prakriyA.words[1].length()>0){
		boolean is_bha=false;
		if(!(belongs("Ba",prakriyA.attrib_words[0]))){
		    if(prakriyA.attrib_words[1].indexOf("sarvanAmasWAna")==-1){//System.out.println("620");
			if(belongs(prakriyA.words[1].charAt(0)+"",ac)){//System.out.println("621");
			    is_bha=true;
			}
		    }
		    if(belongs(prakriyA.words[1].charAt(0)+"","y")){
			is_bha=true;
		    }
		    if(is_bha){
			prakriyA.add("Ba",0);
			rules[process_status]="1-4-18";
			process[process_status]="Ba";
			instant_DS[process_status]=prakriyA.get_output();
			process_status++;
		    }
					
		}
		else{
		    if(!(belongs(prakriyA.words[1].charAt(0)+"",ac+"y"))){
			prakriyA.remove("Ba",0);
		    }
		}
							
	    }
	}
				
	return prakriyA;
    }
		
    public static rule superior(rule a, rule b, input_DS prakriyA){
	if(a.rule_category.equals("prawyaya_viXi")){
	    if(!(b.rule_category.equals("prawyaya_viXi"))){
		//System.out.println("Due to prawyaya_viXi");
		return a;
	    }
	}
	if((a.rule_category.equals("ekAxeSa"))||(a.rule_category.equals("saMhiwA"))){
	    if(!((b.rule_category.equals("ekAxeSa"))||(b.rule_category.equals("saMhiwA")))){
		//System.out.println("Due to ekAxeSa");
		return b;
	    }
	}
	if((b.rule_category.equals("ekAxeSa"))||(b.rule_category.equals("saMhiwA"))){
	    if(!((a.rule_category.equals("ekAxeSa"))||(a.rule_category.equals("saMhiwA")))){
		//System.out.println("Due to ekAxeSa");
		return a;
	    }
	}
	if((a.rule_number=="6-1-77")||(a.rule_number=="6-1-87")){
	    if(b.rule_number=="6-1-101"){
		return b;
	    }
	}
	if(a.rule_number=="6-4-77"){
	    if(b.rule_number=="7-1-54"){
		return b;
	    }
	}
	int tempp=process_status;
	input_DS clone_prakriyA=prakriyA.myclone();
	boolean is_a_env_change=false;
	boolean is_b_env_change=false;
	//System.out.println(clone_prakriyA.get_output()+"489");
	clone_prakriyA=a.apply_rule(clone_prakriyA);
	//System.out.println(clone_prakriyA.get_output()+"491 after a");
	if(!(b.condition(clone_prakriyA,0))){
	    is_a_env_change=true;
	}
	clone_prakriyA=prakriyA.myclone();
	//System.out.println(clone_prakriyA.get_output()+"496");
	clone_prakriyA=b.apply_rule(clone_prakriyA);
	//System.out.println(clone_prakriyA.get_output()+"498 after b");
	if(!(a.condition(clone_prakriyA,0))){
	    is_b_env_change=true;
	}
	neutralize(tempp,process_status);
	process_status=tempp;
	//System.out.println(is_a_env_change+" "+is_b_env_change);
	if(is_a_env_change||is_b_env_change){
	    if(is_apavAxa(b,a,prakriyA)){
		//System.out.println("Due to apavAxa");
		return b;
	    }
	    if(is_apavAxa(a,b,prakriyA)){
		//System.out.println("Due to apavAxa");
		return a;
	    }
	}
	//if(a.rule_category.equals("prawyaya_viXi")){
	//	if(b.rule_category.equals("prawyaya_viXi")){
	if(is_a_env_change){
	    if(!(is_b_env_change)){
		//	//System.out.println("Due to niwya");
		return a;
	    }
	}
	else{
	    if(is_b_env_change){
		//System.out.println("Due to niwya");
		return b;
	    }
	    else{
		//System.out.println("Due to no prawiSeXa");
		return a;
	    }
	}
			
	boolean status=false;
	if(a.lword_attrib.indexOf("root")!=-1){
	    if(b.lword_attrib.indexOf("root")==-1){
		//System.out.println("Due to root in left");
		return a;
					
	    }
	}
	else if(b.lword_attrib.indexOf("root")!=-1){
	    //System.out.println("Due to root in left");
	    return b;
				
	}
	if(a.lword_attrib.indexOf("Axi")!=-1){
	    if(b.lword_attrib.indexOf("Axi")==-1){
		//System.out.println("Due to Axi in left");
		return a;
					
	    }
	}
	else if(b.lword_attrib.indexOf("Axi")!=-1){
	    //System.out.println("Due to Axi in left");
	    return b;
				
	}
	if(a.lword_attrib.indexOf("ends")!=-1){
	    if(b.lword_attrib.indexOf("ends")==-1){
		//System.out.println("Due to ends in left");
		return a;
					
	    }
	}
	else if(b.lword_attrib.indexOf("ends")!=-1){
	    //System.out.println("Due to root in left");
	    return b;
	}
	if(is_root(a.lword_regex)){
	    if(!is_root(b.lword_regex)){
		//System.out.println("Due to root in left regex");
		return a;
	    }
	}
	else if(is_root(b.lword_regex)){
	    //System.out.println("Due to root in left regex");
	    return b;
	}
	if(length_regex(a.lword_regex)>length_regex(b.lword_regex)){
	    if(length_regex(b.lword_regex)>=1){
		//if(length_regex(b.lword_regex)<=1){
		//System.out.println("Due to left regex lenth "+length_regex(a.lword_regex)+" "+length_regex(b.lword_regex));
		return a;
	    }
	}
	if(length_regex(b.lword_regex)>length_regex(a.lword_regex)){
	    if(length_regex(a.lword_regex)>=1){
		//if(length_regex(b.lword_regex)<=1){
		//System.out.println("Due to left regex lenth "+length_regex(b.lword_regex)+" "+length_regex(a.lword_regex));
		return b;
	    }
	}
	if(a.rword_attrib.indexOf("root")!=-1){
	    if(b.rword_attrib.indexOf("root")==-1){
		if(a.rule_category.equals(b.rule_category)){
		    //System.out.println("Due to root in right");
		    return a;
		}
	    }
	}
	else if(b.rword_attrib.indexOf("root")!=-1){
	    if(a.rule_category.equals(b.rule_category)){
		//System.out.println("Due to root in right");
		return b;
	    }
	}
			
	if(a.rword_attrib.indexOf("ends")!=-1){
	    if(b.rword_attrib.indexOf("ends")==-1){
		//System.out.println("Due to ends in right");
		return a;
	    }
	}
	else if(b.rword_attrib.indexOf("ends")!=-1){
	    //System.out.println("Due to ends in right");
	    return b;
	}
	if(is_root(a.rword_regex)){
	    if(!is_root(b.rword_regex)){
		//System.out.println("Due to root in right regex");
		return a;
	    }
	}
	else if(is_root(b.rword_regex)){
	    //System.out.println("Due to root in right regex");
	    return b;
	}
	if(a.lword_attrib.length()==0){
	    if(b.lword_attrib.length()>0){
		//System.out.println("Due to more attributes in left ");
		return b;
	    }
	}
	else if(b.lword_attrib.length()==0){
	    //System.out.println("Due to more attributes in left ");
	    return a;
	}
	if(b.lword_attrib.indexOf(a.lword_attrib)!=-1){
	    if(a.lword_attrib.indexOf(b.lword_attrib)==-1){
		//System.out.println("Due to much more attributes in left ");
		return b;
	    }
	}
	else if(a.lword_attrib.indexOf(b.lword_attrib)!=-1){
	    //System.out.println("Due to much more attributes in left ");
	    return a;
	}
	if(length_regex(a.lword_regex)>1){
	    if(length_regex(b.lword_regex)<=1){
		//System.out.println("Due to left regex lenth "+length_regex(a.lword_regex)+" "+length_regex(b.lword_regex));
		return a;
	    }
	}
	else if(length_regex(b.lword_regex)>1){
	    //System.out.println("Due to left regex lenth");
	    return b;
	}
			
			
	if(a.rword_attrib.length()==0){
	    if(b.rword_attrib.length()>0){
		//System.out.println("Due to more attributes in right ");
		return b;
	    }
	}
	else if(b.rword_attrib.length()==0){
	    //System.out.println("Due to more attributes in right ");
	    return a;
	}
	if(is_matched(a.rword_attrib,b.rword_attrib)){
	    //System.out.println("Due to match right 1151");
	    if(!(is_matched(b.rword_attrib,a.rword_attrib))){
		return b;
	    }
	}
	else if(is_matched(b.rword_attrib,a.rword_attrib)){
	    //System.out.println("Due to match right 1157");
	    return a;
	}
	if(belongs(a.rword_attrib,b.rword_attrib)){
	    if(!(belongs(b.rword_attrib,a.rword_attrib))){
		//System.out.println("Due to much more attributes in right ");
		return b;
	    }
	}
	else if(belongs(b.rword_attrib,a.rword_attrib)){
	    //System.out.println("Due to much more attributes in right ");
	    return a;
	}
				
	if(length_regex(a.rword_regex)>1){
	    if(length_regex(b.rword_regex)<=1){
		//System.out.println("Due to length in right regex");
		return a;
	    }
	}
	else if(length_regex(b.rword_regex)>1){
	    //System.out.println("Due to length in right regex");
	    return b;
	}
	if(a.rule_category.equals(b.rule_category)){
	    if(length_regex(a.lword_regex)==1){
		if(length_regex(b.lword_regex)==1){
		    if(options(a.lword_regex)>options(b.lword_regex)){
			//System.out.println("Due to more options left regex "+options(a.lword_regex)+"    "+options(b.lword_regex));
			return b;
		    }
		    else if(options(a.lword_regex)<options(b.lword_regex)){
			//System.out.println("Due to more options left regex "+options(a.lword_regex)+"    "+options(b.lword_regex));
			return a;
		    }
		}
	    }
			
	    if(length_regex(a.rword_regex)==1){
		if(length_regex(b.rword_regex)==1){
		    if(options(a.rword_regex)>options(b.rword_regex)){
							
			//System.out.println("Due to more options right regex");
			return b;
		    }
		    else if(options(a.rword_regex)<options(b.rword_regex)){
			//System.out.println("Due to more options right regex");
			return a;
		    }
		}
	    }
	}
	if(length_regex(a.rword_regex)==1){
	    if(length_regex(b.rword_regex)==0){
		if(a.rule_category.equals(b.rule_category)){
		    //System.out.println("Due to length right regex");
		    return a;
		}
	    }
	}
	else{
	    if(length_regex(b.rword_regex)==1){
		if(a.rule_category.equals(b.rule_category)){
		    //System.out.println("Due to length right regex");
		    return b;
		}
	    }
	}
					
	if(length_regex(a.lword_regex)==1){
	    if(length_regex(b.lword_regex)==0){
		//System.out.println("Due to length left regex");
		return a;
	    }
	}
	else{
	    if(length_regex(b.lword_regex)==1){
		//System.out.println("Due to length left regex");
		return b;
	    }
	}
	//System.out.println("Not sufficient");
	return b;
    }
		
    public static int length_regex(String reg_ex){
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
	    //System.out.println(expression+" after removing \\w");
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
	return length_regex;
    }
					
					
    public static int options(String reg_ex){
	if(reg_ex.indexOf('[')==-1){
	    return 1;
	}
	else{
	    return(reg_ex.substring(reg_ex.indexOf('['),reg_ex.indexOf(']')).length()-1);
	}
    }
		
    public static boolean is_root(String reg_ex){
	if((reg_ex.indexOf("^")==0)&&(reg_ex.indexOf("$")!=-1)){
	    //System.out.println("1019");
	    return true;
	}
	if(reg_ex.indexOf('|')!=-1){
	    //System.out.println("1023");
	    return true;
	}
	return false;
    }
		
    public static String or(String regex1,String regex2){
	return(regex1.substring(0,regex1.length()-1)+regex2.substring(1));
    }
    public static String not(String regex1){
	return(regex1.substring(0,1)+"^"+regex1.substring(1));
    }		
		
    public static input_DS augment(input_DS prakriyA,String _to, int index){
	int tempp=process_status;
	String copy=prakriyA.words[index];
	String copy_char=prakriyA.attrib_words[index];			
	input_DS find_iw=new input_DS(_to,"upaxeSa");
	find_iw=iw(find_iw);
	find_iw.remove("upaxeSa",0);
	find_iw.add("@root("+_to+")",0);
	//System.out.println(find_iw.get_output());
	String subs=find_iw.words[0];
	String subs_char=find_iw.attrib_words[0];
	neutralize(tempp,process_status);
	process_status=tempp;
	//String use_it=iw(Agama,"");
	//String temp1[]=new String [2];//use_it.split("%");
	//String subs=temp1[0];//value of _to after iw
	//String subs_char=temp1[1];//what is iw in subs
	if(belongs("t-iw",subs_char)){
	    rules[process_status]="1.1.46";
	    //process_status++;
	    String word[]={subs, copy};
	    String attrib[]={subs_char, copy_char};
	    input_DS temp=new input_DS(word,attrib);
	    input_DS temp1[]=sUwra_aRt(temp);//Sandhi of the augment with the word to which it is augmented
	    //System.out.println(temp1.get_output());
	    //input_DS temp2=temp1.external_str;
	    input_DS temp3=temp1[0];
	    input_DS temp4=new input_DS(temp3.words[0]+temp3.words[1],temp3.attrib_words[1]);
	    temp4.add("@root("+temp3.words[0]+temp3.words[1]+")",0);
	    //temp4.add("@formation("+copy+")",0);
	    temp4.add("Agama("+_to+")",0);
	    //return temp4;
	    prakriyA.words[index]=temp4.words[0];
	    prakriyA.attrib_words[index]=temp4.attrib_words[0];
	    return prakriyA;
	}
	else if(belongs("k-iw",subs_char)){
	    rules[process_status]="1.1.46";
	    //process[process_status]=prawyaya1+"+"+subs;
	    //process_status++;
	    String word[]={copy, subs};
	    String attrib[]={copy_char, subs_char};
	    input_DS temp=new input_DS(word,attrib);
	    input_DS temp1[]=sUwra_aRt(temp);//Sandhi of the augment with the word to which it is augmented
	    //input_DS temp2=temp1.external_str;
	    input_DS temp3=temp1[0];
	    input_DS temp4=new input_DS(temp3.words[0]+temp3.words[1],temp3.attrib_words[0]);
	    temp4.add("@root("+temp3.words[0]+temp3.words[1]+")",0);
	    //temp4.add("@formation("+copy+")",0);
	    temp4.add("Agama("+_to+")",0);
	    prakriyA.words[index]=temp4.words[0];
	    prakriyA.attrib_words[index]=temp4.attrib_words[0];
	    return prakriyA;
	}
	else if(belongs("m-iw",subs_char)){
	    //System.out.println("m-iw");
	    rules[process_status]="1.1.47";
	    //process[process_status]=prawyaya1+"+"+subs;
	    //process_status++;
	    int lastvowel=find_lastvowel(copy);//aconwyAw->Make the function to find the last vowel
	    //System.out.println(lastvowel+"1342");
	    if((lastvowel<=copy.length()-2)&&(lastvowel>=0)){
		//System.out.println(join(copy.substring(0,lastvowel+1),subs)+" 1344");
		subs=join(join(copy.substring(0,lastvowel+1),subs),copy.substring(lastvowel+1));//make the function join to join between substitute, augment etc.
		//System.out.println(subs+" 1345");
		input_DS temp4=new input_DS(subs,copy_char);
		temp4.add("@root("+subs+")",0);
		//temp4.add("@formation("+copy+")",0);
		temp4.add("Agama("+_to+")",0);
		prakriyA.words[index]=temp4.words[0];
		prakriyA.attrib_words[index]=temp4.attrib_words[0];
		return prakriyA;
	    }
	    else{
		rules[process_status]="1.1.47";
		//process[process_status]=prawyaya1+"+"+subs;
		//process_status++;
		String word[]={copy, subs};
		String attrib[]={copy_char, subs_char};
		input_DS temp=new input_DS(word,attrib);
		input_DS temp1[]=sUwra_aRt(temp);//Sandhi of the augment with the word to which it is augmented
		//input_DS temp2=temp1.external_str;
		input_DS temp3=temp1[0];
		input_DS temp4=new input_DS(temp3.words[0]+temp3.words[1],temp3.attrib_words[0]);
		temp4.add("@root("+temp3.words[0]+temp3.words[1]+")",0);
		//temp4.add("@formation("+copy+")",0);
		temp4.add("Agama("+_to+")",0);
		prakriyA.words[index]=temp4.words[0];
		prakriyA.attrib_words[index]=temp4.attrib_words[0];
		return prakriyA;
	    }					
	    //copy_char=copy_char+", "+Agama+"-Agama("+prawyaya1;
	    //return subs+"%"+copy_char;
	}
	/*else{//I dont know till now other rules for augmentation
	  subs=join(prawyaya1,subs);
	  copy_char=copy_char+", "+Agama+"-Agama("+prawyaya1;
	  return subs+"%"+copy_char;
	  }*/
	return prakriyA;
    }
		
    public static input_DS substitute(input_DS prakriyA,String _to, int index){
	int tempp=process_status;
	String _from=prakriyA.words[index];
	String copy_char=prakriyA.attrib_words[index];
	if(index==0){
	    copy_char="afga, prAwipaxika";
	}
	input_DS find_iw=new input_DS(_to,"upaxeSa");
	if(belongs("viBakwi",copy_char)){
	    find_iw=new input_DS(_to,"upaxeSa, viBakwi");
	}
	boolean is_viBakwi=false;
	for(int i=0;i<21;i++){
	    if(viBakwi[i].equals(_to)){
		is_viBakwi=true;
	    }
	}
	if(is_viBakwi){
	    find_iw=new input_DS(_to,"upaxeSa, viBakwi");
	}
	find_iw=iw(find_iw);
	find_iw.remove("upaxeSa",0);
	//System.out.println(find_iw.get_output());
	String subs=find_iw.words[0];
	String subs_char=find_iw.attrib_words[0];
	if((subs.length()>1)||(subs_char.indexOf("S-iw")!=-1)){
	    if(subs_char.indexOf("f-iw")==-1){
		prakriyA.words[index]=subs;
		rules[process_status]="1.1.55";
		process[process_status]=_from+"->"+subs;
		process_status++;
		//return subs+"%"+copy_char;
	    }
	    else{
		if(_from.length()==1){
		    prakriyA.words[index]=subs;
		    rules[process_status]="1.1.53";
		    process[process_status]=_from+"->"+subs;
		    process_status++;
		    //copy_char=copy_char+", "+_to+"-AxeSa("+_from;
		    //return subs+"%"+copy_char;
		}
		else{
		    String word[]={_from.substring(0,_from.length()-1), subs};
		    String attrib[]={copy_char, subs_char};
		    input_DS temp=new input_DS(word,attrib);
		    //int tempp=afga_viXi_iter;
		    //afga_viXi_iter=0;
		    input_DS temp1[]=sUwra_aRt(temp);
		    //afga_viXi_iter=tempp;
		    input_DS temp3=temp1[0];
		    input_DS temp4=new input_DS(temp3.words[0]+temp3.words[1],temp3.attrib_words[0]);
		    prakriyA.words[index]=temp4.words[0];
		    //prakriyA.attrib_words[index]=temp4.attrib_words[0];
		    rules[process_status]="1.1.53";
		    process[process_status]=_from.substring(_from.length()-1)+"->"+subs;
		    process_status++;
		}
	    }
	}
	else{
	    if(_from.length()==1){
		prakriyA.words[index]=subs;
	    }
	    else{
					
		String word[]={_from.substring(0,_from.length()-1), subs};
		String attrib[]={copy_char, subs_char};
		input_DS temp=new input_DS(word,attrib);
		//int tempp=afga_viXi_iter;
		//afga_viXi_iter=0;
		//System.out.println(temp.words[1]+" 1449");
		input_DS temp1[]=sUwra_aRt(temp);
		//System.out.println(temp1[0].words[1]+" 1451");
		//afga_viXi_iter=tempp;
		input_DS temp3=temp1[0];
		input_DS temp4=new input_DS(temp3.words[0]+temp3.words[1],temp3.attrib_words[0]);
		prakriyA.words[index]=temp4.words[0];
		//prakriyA.attrib_words[index]=temp4.attrib_words[0];
		//return prakriyA;
	    }
	    rules[process_status]="1.1.52";
	    process[process_status]=_from.substring(_from.length()-1)+"->"+subs;
	    process_status++;
	}
	int root_prev=copy_char.indexOf("root(");
	String root_pr="";
				
	if(root_prev!=-1){
	    root_pr=copy_char.substring(root_prev+5, copy_char.indexOf(")",root_prev+5)).trim();
	}
	String attr_all[]=copy_char.split(",");
	for(int i=0;i<attr_all.length;i++){
	    if(attr_all[i].indexOf("-iw")!=-1){
		prakriyA.remove(attr_all[i],index);
	    }
					
	}
	//prakriyA.words[index]=subs;				
	if(index==1){
	    prakriyA.remove("@root("+root_pr+")",index);
	}
	prakriyA.add("AxeSa("+_to+")",index);
	prakriyA.add(subs_char,index);
	neutralize(tempp,process_status);
	process_status=tempp;
	return prakriyA;
			
    }
    public static void neutralize(int tempp,int process_status){
	for(int i=tempp;i<process_status;i++){
	    process[i]="";
	    instant_DS[i]="";
	    rules[i]="";
	}
    }

    public static String join(String aa, String bb){
	if((aa.length()>0)&&(bb.length()>0)){
	    if(((belongs(aa.substring(aa.length()-1),ac))&&(belongs(bb.substring(0,1),hal)))||((belongs(aa.substring(aa.length()-1),hal))&&(belongs(bb.substring(0,1),ac)))||((belongs(aa.substring(aa.length()-1),hal))&&(belongs(bb.substring(0,1),hal)))){
		return aa+bb;
	    }
	    else{
		return (aa.substring(0,aa.length()-1)+do_sandhi(aa.charAt(aa.length()-1),bb.charAt(0))+bb.substring(1));//Ma
	    }
	}
	else return aa+bb;
    }
		

    public static int find_firstvowel(String aa){
	for(int i=0;i<aa.length();i++){
	    if(belongs(aa.substring(i,i+1),ac)){
		return i;
	    }
	}
	return -1;
    }
    public static int find_lastvowel(String aa){
	for(int i=0;i<aa.length();i++){
	    if(belongs(aa.substring(aa.length()-1-i,aa.length()-i),ac)){
		return aa.length()-i-1;
	    }
	}
	return -1;
    }
			
    public static String do_sandhi(char first, char second){	     //To be made
	String output="";
	switch(first){
	case 'a':
	case 'A':
	    switch(second){
	    case 'a':
	    case 'A':
		output= "A";
		rules[process_status]="6.1.101";
		process[process_status]=""+first+"+"+second+"->"+output;
		process_status++;
		break;
	    case 'i':
	    case 'u':
	    case 'q':
		//case 'Q':
	    case 'L':
		output= guNa(second);
		rules[process_status]="6.1.87";
		process[process_status]=""+first+"+"+second+"->"+output;
		process_status++;
		break;//guNa should return a string
	    case 'e':
	    case 'o':
		output= second+"";
		rules[process_status]="6.1.97";
		process[process_status]=""+first+"+"+second+"->"+output;
		process_status++;
		break;//vqxXi should return a string
	    default:
		break;
	    }
	    break;
	case 'i':
	case 'I':
	    switch(second){
	    case 'i':
	    case 'I':
		output= "I";
		rules[process_status]="6.1.101";
		process[process_status]=""+first+"+"+second+"->"+output;
		process_status++;
		break;
	    default:
		output=do_yaNa(first)+second;
		break;
	    }
	case 'u':
	case 'U':
	    switch(second){
	    case 'i':
	    case 'I':
		output= "I";
		rules[process_status]="6.1.101";
		process[process_status]=""+first+"+"+second+"->"+output;
		process_status++;
		break;
	    default:
		output=do_yaNa(first)+second;
		break;
	    }
	case 'q':
	case 'Q':
	    switch(second){
	    case 'q':
	    case 'Q':
		output= "Q";
		rules[process_status]="6.1.101";
		process[process_status]=""+first+"+"+second+"->"+output;
		process_status++;
		break;
	    default:
		output=do_yaNa(first)+second;
		break;
	    }//case 'Q':
	case 'L':
	    switch(second){
	    case 'L':
		output= "L";
		rules[process_status]="6.1.101";
		process[process_status]=""+first+"+"+second+"->"+output;
		process_status++;
		break;
	    default:
		output=do_yaNa(first)+second;
		break;
	    }//case 'Q':
					
	case 'e':
	case 'E':
	case 'o':
	case 'O':
	    output=ecoyavAyAva(first)+second;break;
	default:
	    output=first+second+"";break;
	}
	return output;
    }
    public static String hrasva(char aa){
	String output="";
	switch(aa){
	case 'a':
	case 'A':
	    output="a";break;
	case 'i':
	case 'I':
	    output="i";break;
	case 'u':
	case 'U':
	    output="u";break;				
	case 'q':
	case 'Q':
	    output="q";break;
	default:
	    output=aa+"";break;
	}
	return output;
    }
		
    public static String guNa(char aa){
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
    public static String do_yaNa(char aa){
	String output="";
	switch(aa){
	case 'i':
	case 'I':
	    output="y";break;
	case 'u':
	case 'U':
	    //case 'e':
	    //case 'E':
	    output="v";break;				
	case 'q':
	case 'Q':
	    output="r";break;
	case 'L':
	    output="l";break;
	default:
	    output=aa+"";break;
	}
			
	return output;
    }
	
    public static String vqxXi(char aa){
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
					
    public static String ecoyavAyAva(char aa){
	String output="";
	switch(aa){
	case 'e':
	    output="ay";break;
	case 'E':
	    output="Ay";break;
	case 'o':
	    output="av";break;
	case 'O':
	    output="Av";break;
	default:
	    break;
	}
	return output;
    }
			
    public static input_DS search_for_category(input_DS prakqwi) throws IOException{
	input_DS output=prakqwi;
	String input_word=prakqwi.words[0];
	int temp=prakqwi.attrib_words[0].split(",").length;
	if(temp==3){
	    if(belongs(anwyam(input_word),ac)){
		output.attrib_words[0]=output.attrib_words[0]+", prAwipaxika, @root("+input_word+"), " +anwyam(input_word)+"kArAnwa";
	    }
	    else{
		output.attrib_words[0]=output.attrib_words[0]+", prAwipaxika, @root("+input_word+"), " +anwyam(input_word)+"akArAnwa";
	    }
	    rules[process_status]="1.2.45";
	    process[process_status]="prAwipaxika";
	    instant_DS[process_status]=output.get_output();
	    process_status++;

	    BufferedReader category1=new BufferedReader(new FileReader("sarvanAma"));
	    String s1="";
	    pr1loop:while((s1=category1.readLine())!=null){
		if(s1.startsWith(input_word)){
		    output.attrib_words[0]=output.attrib_words[0]+", sarvanAma";
		    rules[process_status]="1.1.27";
		    process[process_status]="sarvanAma";
		    instant_DS[process_status]=output.get_output();
		    process_status++;
		    if(belongs(input_word,"pUrva|para|avara|xakRiNa|uwwara|apara|aXara")){
			output.add("pUrvAxi",0);
		    }
		    break pr1loop;
		}
	    }
	    if(belongs(input_word,"wyax|wax|yax|ewax|ixam|axas|eka|xvi")){
		output.add("wyaxAxi",0);
	    }
	    if(belongs(input_word,"bahu|gaNa|kawi")){
		output.add("safKyA",0);
		rules[process_status]="1.1.23";
		process[process_status]="safKyA";
		process_status++;
	    }
	    BufferedReader safKyA_words=new BufferedReader(new FileReader("safKyA"));
	    s1="";
	    pr2loop:while((s1=safKyA_words.readLine())!=null){
		if(s1.startsWith(input_word)){
		    output.add("safKyA",0);
		    break pr2loop;
		}
	    }
	    if(belongs(anwyam(input_word),"Rn")){
		if(belongs("safKyA",output.attrib_words[0])){
		    output.add("Rat",0);
		    rules[process_status]="1.1.24";
		    process[process_status]="Rat";
		    process_status++;
		}
	    }
	    if(belongs(input_word,"kawi")){
		output.add("Rat",0);
		rules[process_status]="1.1.25";
		process[process_status]="Rat";
		process_status++;
	    }
	}
			
	else{
	    BufferedReader XAwu_words=new BufferedReader(new FileReader("Xawu"));
	    String s1="";
	    pr1loop:while((s1=XAwu_words.readLine())!=null){
		if(s1.equals(input_word)){
		    output.add("XAwu",0);
		    break pr1loop;
		}
	    }
	}
	//if(belongs("qkArAnwa|nakArAnwa",output.attrib_words[0])){
				
	return output;
    }

    public static input_DS vacana_assign(input_DS prakriyA){
			
	input_DS output=prakriyA;
	String temp[]=prakriyA.attrib_words[0].split(",");
	String lakAra=temp[2].trim();
	if(output.attrib_words[0].indexOf("prAwipaxika")==-1){
	    rules[process_status]="3-4-69";// sarUpANAm (ekaSeRa)73 ekaviBakwO
	    process[process_status]="lakAra";
	    process_status++;
	    if(temp[2].equals("lat")){
		rules[process_status]="3-2-123";// sarUpANAm (ekaSeRa)73 ekaviBakwO
		process[process_status]="lat";
		process_status++;
	    }
	    else if(temp[2].equals("lot")){
		rules[process_status]="3-2-123";// sarUpANAm (ekaSeRa)73 ekaviBakwO
		process[process_status]="lat";
		process_status++;
	    }
	}
	// 				if(output.attrib_words[0].indexOf("ekavacana")==-1){
	// 					rules[process_status]="1-2-64";// sarUpANAm (ekaSeRa)73 ekaviBakwO
	// 					process[process_status]="ekaSeRa";
	// 					process_status++;
	// 					if(output.attrib_words[0].indexOf("bahuvacana")!=-1){
	// 						rules[process_status]="1-4-21";// bahuRu (bahuvacanam)?
	// 								//1-4-22 xvyekayoH xvivacanEkavacane sarUpANAm (ekaSeRa)73 ekaviBakwO
	// 								process[process_status]="bahuvacana";
	// 						process_status++;
	// 					}
	// 					if(output.attrib_words[0].indexOf("xvivacana")!=-1){
	// 						rules[process_status]="1-4-22";// bahuRu (bahuvacanam)?
	// 								//1-4-22 xvyekayoH xvivacanEkavacane sarUpANAm (ekaSeRa)73 ekaviBakwO
	// 								process[process_status]="xvivacana";
	// 						process_status++;
	// 					}
	// 				}
	// 				
	// 				else{
	// 					rules[process_status]="1-4-22";// sarUpANAm (ekaSeRa)73 ekaviBakwO
	// 					process[process_status]="ekavacana";
	// 					process_status++;
	// 				}
				
	//}
				
	return output;	
    }	
			
    public static input_DS[] rule_6_1_63(input_DS prakriyA)throws IOException{
			
	String prakqwi=prakriyA.words[0];
	boolean apply=false;
	String alternate="";
	if(!(belongs("sarvanAmasWAna",prakriyA.attrib_words[1]))){
	    if(prakqwi.equals("pAxa")){
		alternate="pax";apply=true;
	    }
	    else if(prakqwi.equals("xanwa")){
		alternate="xaw";apply=true;
	    }
	    else if(prakqwi.equals("nAsikA")){
		alternate="nas";apply=true;
	    }
	    else if(prakqwi.equals("mAsa")){
		alternate="mAs";apply=true;
	    }
	    else if(prakqwi.equals("hqxaya")){
		alternate="hqx";apply=true;
	    }
	    else if(prakqwi.equals("niSA")){
		alternate="niS";apply=true;
	    }
	    else if(prakqwi.equals("asqj")){
		alternate="asan";apply=true;
	    }
	    else if(prakqwi.equals("yURa")){
		alternate="yUR";apply=true;
	    }
	    else if(prakqwi.equals("xAs")){
		alternate="xoRan";apply=true;
	    }
	    else if(prakqwi.equals("yakqw")){
		alternate="yakan";apply=true;
	    }
	    else if(prakqwi.equals("Sakqw")){
		alternate="Sakan";apply=true;
	    }
	    else if(prakqwi.equals("uxaka")){
		alternate="uxan";apply=true;
	    }
	    else if(prakqwi.equals("Asya")){
		alternate="asan";apply=true;
	    }
	}
	if(apply){
	    rules[process_status]="6-1-63";
	    process[process_status]="vikalpena "+prakriyA.words[0]+" "+alternate;
	    process_status++;
	    String words[]={prakqwi,prakriyA.words[1]};
	    String attrib_words[]={prakriyA.attrib_words[0],prakriyA.attrib_words[1]};
	    input_DS temp1=new input_DS(words,attrib_words);
	    String words1[]={alternate,prakriyA.words[1]};
	    String attrib_words1[]={prakriyA.attrib_words[0],prakriyA.attrib_words[1]};
	    input_DS temp2=new input_DS(words1,attrib_words1);
	    //System.out.println(temp1.get_output()+"temp_1");
	    //System.out.println(temp2.get_output()+"temp_2");
	    input_DS[] temp={temp1,temp2};
	    return temp;
	}
	if(belongs(prakqwi,"pUrva|para|avara|xakRiNa|uwwara|apara|aXara")){
	    //System.out.println("1713");
	    if(belongs("root(jas)",prakriyA.attrib_words[1])){
		//System.out.println("1715");
		//System.out.println(prakriyA.get_output()+" 1716");
		input_DS output1=prakriyA.myclone();
		prakriyA.remove("sarvanAma",0);
		rules[process_status]="1-1-34";
		process[process_status]="vikalpena sarvanAma";
		//System.out.println(prakriyA.get_output()+" "+output1.get_output()+" 1720");
		process_status++;
		input_DS[] temp={prakriyA,output1};
		return temp;
	    }
	}
	BufferedReader BPread=new BufferedReader(new FileReader("BARiwapuMs"));
	String BP_ind="";
	boolean is_BP=false;
	boolean is_7174=false;
	input_DS output1=prakriyA.myclone();
	while((BP_ind=BPread.readLine())!=null){
	    if(BP_ind.equals(prakqwi)){
		is_BP=true;
	    }
	}
	if(is_BP){
	    if(belongs("napuMsaka",output1.attrib_words[0])){
		if(belongs(anwyam(prakqwi),ik)){
		    if(!(belongs("praWamA|xviwIyA",output1.attrib_words[1]))){
			//System.out.println("how could it?");
			if(belongs(output1.words[1].substring(0,1),ac)){
			    is_7174=true;
			    output1.remove("napuMsaka",0);
			    output1.add("puM",0);
			}
		    }
		}
	    }
	}
	input_DS output=prakriyA.myclone();
	boolean is_1247=false;
	if(belongs("napuMsaka",prakriyA.attrib_words[0])){
	    if(belongs(anwyam(output.words[0]),ac)){
		if(!(belongs(anwyam(output.words[0]),hrasva))){
		    is_1247=true;
		    rules[process_status]="1.2.47";
		    process[process_status]="hrasva";					    
		    if(!(belongs(anwyam(output.words[0]),ec))){
			output.words[0]=output.words[0].substring(0,output.words[0].length()-1)+hrasva(anwyam(output.words[0]).charAt(0));
			instant_DS[process_status]=output.get_output();
			process_status++;
		    }
		    else{
			rules[process_status]="1.1.48";
			// process[process_status]="hrasva";	
			String guNa_char="";
			if(belongs(anwyam(output.words[0]),"eE")){
			    guNa_char="i";
			}
			else{
			    guNa_char="u";
			}
			output.words[0]=output.words[0].substring(0,output.words[0].length()-1)+guNa_char; 
			instant_DS[process_status]=output.get_output();
			process_status++;
		    }
		}
	    }
					    
	}
	if(is_1247 && is_7174){
	    //System.out.println("both got");
	    input_DS[] temp={output1,output};
	    return temp;
	}
	if(is_1247){
	    //System.out.println("1247 only");
	    input_DS[] temp={output};
	    return temp;
	}
	if(is_7174){
	    //System.out.println("7174 only");
	    input_DS[] temp={output1};
	    return temp;
	}
	input_DS[] temp={prakriyA};
	return temp;
    }
		

    public static input_DS[] saMjFA(input_DS prakriyA){
	// 			if(belongs("wif|S-iw",prakriyA.attrib_words[1])){
	// 				if(!(belongs("sArvaXAwuka",prakriyA.attrib_words[1]))){
	// 					prakriyA.add("sArvaXAwuka",1);
	// 					rules[process_status]="3-4-113";
	// 					process[process_status]="sArvaXAwuka";
	// 					instant_DS[process_status]=prakriyA.get_output();
	// 					process_status++;
	// 				}
	// 			}
	if(belongs("prAwipaxika",prakriyA.attrib_words[0])){
	    //System.out.println("How it reached?");
	    String prakqwi=prakriyA.words[0];
	    String prawyaya=prakriyA.words[1];
	    boolean is_bha=false;
	    boolean is_paxa=false;
	    if(prakriyA.attrib_words[1].indexOf("sarvanAmasWAna")==-1){
		if(belongs(prawyaya.charAt(0)+"",ac)){
		    is_bha=true;
		}
	    }
	    if(belongs(prawyaya.charAt(0)+"","y")){
		is_bha=true;
	    }
	    if(is_bha){
		prakriyA.add("Ba",0);
		rules[process_status]="1-4-18";
		process[process_status]="Ba";
		instant_DS[process_status]=prakriyA.get_output();
		process_status++;
	    }
	    else{
		if(!(belongs("sarvanAmasWAna",prakriyA.attrib_words[1]))){
		    is_paxa=true;
		    prakriyA.add("paxa",0);
		    rules[process_status]="1-4-17";
		    process[process_status]="paxa saMjFA";
		    process_status++;
		}
		if(!(is_paxa)){
			
		    if(belongs("swrI",prakriyA.attrib_words[0])){
			if(belongs(anwyam(prakqwi),"I|U")){
			    if(!(belongs("BU",prakqwi))){
				prakriyA.add("naxI",0);
				rules[process_status]="1-4-3";// sarUpANAm (ekaSeRa)73 ekaviBakwO
				process[process_status]="naxI";
				instant_DS[process_status]=prakriyA.get_output();
				process_status++;
				if(belongs(anwyam(prakqwi),"I")){
				    if(!(belongs(prakqwi,"avI|wanwrI|warI|lakRmI|XI|SrI"))){//To be checked whether true
					prakriyA.add("fyanwa",0);//To be checked, whether true
				    }
				}
			    }
			}
			if(belongs(anwyam(prakqwi),"i|u")){
			    if(belongs("f-iw",prakriyA.attrib_words[1])){
				input_DS clone_prakriyA=prakriyA.myclone();
				prakriyA.add("naxI",0);
				rules[process_status]="1-4-6";// sarUpANAm (ekaSeRa)73 ekaviBakwO
				process[process_status]="naxI";
				instant_DS[process_status]=prakriyA.get_output();
				process_status++;
				clone_prakriyA.add("Gi",0);
				rules[process_status]="1-4-7";// sarUpANAm (ekaSeRa)73 ekaviBakwO
				process[process_status]="Gi";
				instant_DS[process_status]=clone_prakriyA.get_output();
				process_status++;
				input_DS[] output={prakriyA,clone_prakriyA};
				return output;
			    }
			}
		    }
		}
				
				
		if(belongs("pawi",prakqwi)){
		    if(prakqwi.indexOf("pawi")>0){//System.out.println("wrong");
			prakriyA.add("Gi",0);
			rules[process_status]="1-4-8";// sarUpANAm (ekaSeRa)73 ekaviBakwO
			process[process_status]="Gi";
			instant_DS[process_status]=prakriyA.get_output();
			process_status++;
		    }
		}
		else{
		    if(prakqwi.indexOf("saKi")==-1){
			if(belongs(anwyam(prakqwi),"i|u")){//System.out.println("wrong1");
			    if(!(belongs("naxI",prakriyA.attrib_words[0]))){
				String root_afga=prakriyA.attrib_words[0].substring(prakriyA.attrib_words[0].indexOf("root")+5,prakriyA.attrib_words[0].indexOf(')',prakriyA.attrib_words[0].indexOf("root")));
				//stem.out.println(root_afga+"1293");
				if(belongs(anwyam(root_afga),"i|u")){
				    prakriyA.add("Gi",0);
				    rules[process_status]="1-4-7";// sarUpANAm (ekaSeRa)73 ekaviBakwO
				    process[process_status]="Gi";
				    instant_DS[process_status]=prakriyA.get_output();
				    process_status++;
				}
			    }
			}
		    }
		}
	    }
	    if(belongs("swrI",prakriyA.attrib_words[0])){
		if(belongs(anwyam(prakqwi),"A")){
		    prakriyA.add("Abanwa",0);//To be checked, whether true
		}
	    }
	    if(prawyaya.length()==1){
		prakriyA.add("apqkwa",1);
		rules[process_status]="1-2-41";// sarUpANAm (ekaSeRa)73 ekaviBakwO
		process[process_status]="apqkwa";
		instant_DS[process_status]=prakriyA.get_output();
		process_status++;
	    }
	}
				
	input_DS[] output={prakriyA};			
	return output;
			
			
    }		
		
		
    public static input_DS add_appropriate_prawyaya(input_DS prakqwi){
	//String pratyaya_group[]=new String[];
	String prawyaya_obtained="";
	String root_word_char=prakqwi.attrib_words[0];
	input_DS output=new input_DS("","");
	if(root_word_char.indexOf("prAwipaxika")!=-1){
	    String []prawyaya_group=new String [21];
	    String []prawyaya_group_char=new String [21];
	    for(int i=0;i<21;i++){
		prawyaya_group[i]=viBakwi[i];
		prawyaya_group_char[i]="sup, upaxeSa, viBakwi, prawyaya";
	    }
	    rules[process_status]="4.1.2";
	    process[process_status]="sup";
	    process_status++;
	    rules[process_status]="3.1.1";
	    process[process_status]="prawyaya";
	    process_status++;
	    rules[process_status]="3.1.2";
	    process[process_status]="prakqwi+prawyaya";
	    process_status++;
	    for(int i=0;i<7;i++){
		prawyaya_group_char[3*i]=prawyaya_group_char[3*i]+", ekavacana";
		prawyaya_group_char[3*i+1]=prawyaya_group_char[3*i+1]+", xvivacana";
		prawyaya_group_char[3*i+2]=prawyaya_group_char[3*i+2]+", bahuvacana";
	    }
	    rules[process_status]="1.4.102";
	    process[process_status]="vacana";
	    process_status++;
	    rules[process_status]="1.4.103";
	    process[process_status]="viBakwi";
				
	    for(int i=0;i<3;i++){
		prawyaya_group_char[i]=prawyaya_group_char[i]+", praWamA";
		prawyaya_group_char[i+3]=prawyaya_group_char[i+3]+", xviwIyA";
		prawyaya_group_char[i+6]=prawyaya_group_char[i+6]+", wqwIyA";
		prawyaya_group_char[i+9]=prawyaya_group_char[i+9]+", cawurWI";
		prawyaya_group_char[i+12]=prawyaya_group_char[i+12]+", paFcamI";
		prawyaya_group_char[i+15]=prawyaya_group_char[i+15]+", RaRTI";
		prawyaya_group_char[i+18]=prawyaya_group_char[i+18]+", sapwamI";
	    }
	    for(int i=0;i<5;i++){
		if(root_word_char.indexOf("napuMsaka")==-1){
		    prawyaya_group_char[i]=prawyaya_group_char[i]+", sarvanAmasWAna";
		}
	    }
	    int get_viBakwi=mapviBakwi_num(root_word_char);//mapviBakwi_num is a function that takes input a string, searches for any viBakwi and returns integer corresponding to it.
	    int get_vacana=mapvacana_num(root_word_char);//mapvacana_num is a function that takes input a string, searches for any vacana and returns integer corresponding to it.
	    prawyaya_obtained=prawyaya_group[3*(get_viBakwi-1)+(get_vacana-1)]+"%"+prawyaya_group_char[3*(get_viBakwi-1)+(get_vacana-1)];
	    String word[]={prakqwi.words[0], prawyaya_group[3*(get_viBakwi-1)+(get_vacana-1)]};
	    String attrib[]={prakqwi.attrib_words[0],prawyaya_group_char[3*(get_viBakwi-1)+(get_vacana-1)]};	if(belongs("sarvanAmasWAna",prawyaya_group_char[3*(get_viBakwi-1)+(get_vacana-1)])){
		rules[process_status]="1-1-43";
		process[process_status]="sarvanAmasWAna";
		process_status++;
	    }			
	    output=new input_DS(word, attrib);
	    output.add("@root("+output.words[1]+")",1);
	    //output.output_form();
	    instant_DS[process_status]=output.get_output();
	    //System.out.println(instant_DS[process_status].output_form());
	    process_status++;
	    rules[process_status]="1-4-13";
	    process[process_status]="afga";
	    output.add("afga",0);
	    instant_DS[process_status]=output.get_output();process_status++;
	    rules[process_status]="1-4-14";
	    process[process_status]="paxa";
	    output.add("paxa",1);
	    instant_DS[process_status]=output.get_output();process_status++;
	    if(matchb_in_a(output.attrib_words[1],"upaxeSa")){
		output=iw(output);
	    }
				
	    //return output;
	}
	else{
	    String []prawyaya_group=new String [18];
	    String []prawyaya_group_char=new String [18];
	    if(!(belongs("lit",prakqwi.attrib_words[0]))){
					
		for(int i=0;i<18;i++){
		    prawyaya_group[i]=wif[i];
		    prawyaya_group_char[i]="wif, upaxeSa, lakAra, prawyaya";
		}
		rules[process_status]="3.4.78";
		process[process_status]="wif";
		process_status++;
	    }
	    else{
		for(int i=0;i<9;i++){
		    prawyaya_group[i]=wif_lot[i];
		    prawyaya_group_char[i]="wif, upaxeSa, lakAra, prawyaya";
		    prawyaya_group[i+9]=wif[i+9];
		    prawyaya_group_char[i+9]="wif, upaxeSa, lakAra, prawyaya";
		}
		rules[process_status]="3.4.82";
		process[process_status]="lit parasmEpaxa";
		process_status++;
	    }
				
	    rules[process_status]="3.1.1";
	    process[process_status]="prawyaya";
	    process_status++;
	    rules[process_status]="3.1.2";
	    process[process_status]="prakqwi+prawyaya";
	    process_status++;
	    for(int i=0;i<9;i++){
		prawyaya_group_char[i]=prawyaya_group_char[i]+", parasmai";
		prawyaya_group_char[i+9]=prawyaya_group_char[i+9]+", Awmane";
	    }
	    for(int i=0;i<3;i++){
		prawyaya_group_char[i]=prawyaya_group_char[i]+", praWama";
		prawyaya_group_char[i+3]=prawyaya_group_char[i+3]+", maXyama";
		prawyaya_group_char[i+6]=prawyaya_group_char[i+6]+", uwwama";
		prawyaya_group_char[i+9]=prawyaya_group_char[i+9]+", praWama";
		prawyaya_group_char[i+12]=prawyaya_group_char[i+12]+", maXyama";
		prawyaya_group_char[i+15]=prawyaya_group_char[i+15]+", uwwama";
	    }
	    for(int i=0;i<6;i++){
		prawyaya_group_char[3*i]=prawyaya_group_char[3*i]+", ekavacana";
		prawyaya_group_char[3*i+1]=prawyaya_group_char[3*i+1]+", xvivacana";
		prawyaya_group_char[3*i+2]=prawyaya_group_char[3*i+2]+", bahuvacana";
	    }
	    rules[process_status]="1.4.99";
	    process[process_status]="paxa";
	    process_status++;
	    rules[process_status]="1.4.100";
	    process[process_status]="paxa";
	    process_status++;
	    rules[process_status]="1.4.101";
	    process[process_status]="puruRa";
	    process_status++;
	    rules[process_status]="1.4.102";
	    process[process_status]="vacana";
	    process_status++;
	    int get_paxa=mappaxa_num(root_word_char);
	    int get_puruRa=mappuruRa_num(root_word_char);//mapviBakwi_num is a function that takes input a string, searches for any viBakwi and returns integer corresponding to it.
	    int get_vacana=mapvacana_num(root_word_char);//mapvacana_num is a function that takes input a string, searches for any vacana and returns integer corresponding to it.
	    prawyaya_obtained=prawyaya_group[9*(get_paxa-1)+3*(get_puruRa-1)+(get_vacana-1)]+"%"+prawyaya_group_char[9*(get_paxa-1)+3*(get_puruRa-1)+(get_vacana-1)];
	    String word[]={prakqwi.words[0], prawyaya_group[9*(get_paxa-1)+3*(get_puruRa-1)+(get_vacana-1)]};
	    String attrib[]={prakqwi.attrib_words[0],prawyaya_group_char[9*(get_paxa-1)+3*(get_puruRa-1)+(get_vacana-1)]};		
	    output=new input_DS(word, attrib);
	    output.add("@root("+output.words[1]+")",1);
	    //output.output_form();
	    instant_DS[process_status]=output.get_output();
	    //System.out.println(instant_DS[process_status].output_form());
	    process_status++;
	    if(output.attrib_words[0].indexOf("ekavacana")==-1){
		rules[process_status]="1-2-64";// sarUpANAm (ekaSeRa)73 ekaviBakwO
		process[process_status]="ekaSeRa";
		process_status++;
		if(output.attrib_words[0].indexOf("bahuvacana")!=-1){
		    rules[process_status]="1-4-21";// bahuRu (bahuvacanam)?
		    //1-4-22 xvyekayoH xvivacanEkavacane sarUpANAm (ekaSeRa)73 ekaviBakwO
		    process[process_status]="bahuvacana";
		    process_status++;
		}
		if(output.attrib_words[0].indexOf("xvivacana")!=-1){
		    rules[process_status]="1-4-22";// bahuRu (bahuvacanam)?
		    //1-4-22 xvyekayoH xvivacanEkavacane sarUpANAm (ekaSeRa)73 ekaviBakwO
		    process[process_status]="xvivacana";
		    process_status++;
		}
	    }
				
	    else{
		rules[process_status]="1-4-22";// sarUpANAm (ekaSeRa)73 ekaviBakwO
		process[process_status]="ekavacana";
		process_status++;
	    }
	    if(output.attrib_words[0].indexOf("praWama")!=-1){
		rules[process_status]="1-4-108";// sarUpANAm (ekaSeRa)73 ekaviBakwO
		process[process_status]="praWama puruRa";
		process_status++;
	    }
	    else if(output.attrib_words[0].indexOf("maXyama")!=-1){
		rules[process_status]="1-4-105";// sarUpANAm (ekaSeRa)73 ekaviBakwO
		process[process_status]="maXyama puruRa";
		process_status++;
	    }
	    else{
		rules[process_status]="1-4-107";// sarUpANAm (ekaSeRa)73 ekaviBakwO
		process[process_status]="uwwama puruRa";
		process_status++;
	    }
	    String temp[]=output.attrib_words[0].split(",");
	    String lakAra=temp[2].trim();
	    output.add(lakAra,1);
	    rules[process_status]="1-4-13";
	    process[process_status]="afga";
	    output.add("afga",0);
	    instant_DS[process_status]=output.get_output();process_status++;
	    rules[process_status]="1-4-14";
	    process[process_status]="paxa";
	    output.add("paxa",1);
	    instant_DS[process_status]=output.get_output();process_status++;
	    if(matchb_in_a(output.attrib_words[1],"upaxeSa")){
		output=iw(output);
	    }
				
	    //return output;
	}
				
	return output;
	//return prawyaya_obtained;//you have to split it based on % sign.	
			
    }
	
	
    public static int mappuruRa_num(String root_word_char){
	if(root_word_char.indexOf("praWama")!=-1){
	    return 1;
	}
	else if(root_word_char.indexOf("maXyama")!=-1){
	    return 2;
	}
	else if(root_word_char.indexOf("uwwama")!=-1){
	    return 3;
	}
	else{
	    //System.out.println("puruRa_error");
	    return 0;
	}
			
    }
    public static int mappaxa_num(String root_word_char){
	if(root_word_char.indexOf("parasmai")!=-1){
	    return 1;
	}
	else if(root_word_char.indexOf("Awmane")!=-1){
	    return 2;
	}
	else{
	    //System.out.println("paxa_error");
	    return 0;
	}
    }
    public static int mapviBakwi_num(String root_word_char){
	if(root_word_char.indexOf("praWamA")!=-1){
	    return 1;
	}
	else if(root_word_char.indexOf("xviwIyA")!=-1){
	    return 2;
	}
	else if(root_word_char.indexOf("wqwIyA")!=-1){
	    return 3;
	}
	else if(root_word_char.indexOf("cawurWI")!=-1){
	    return 4;
	}
	else if(root_word_char.indexOf("paFcamI")!=-1){
	    return 5;
	}
	else if(root_word_char.indexOf("RaRTI")!=-1){
	    return 6;
	}
	else if(root_word_char.indexOf("sapwamI")!=-1){
	    return 7;
	}
	else{
	    //System.out.println("viBakwi_error");
	    return 0;
	}
	//return "";
    }
	
    public static int mapvacana_num(String root_word_char){
	if(matchb_in_a(root_word_char,"ekavacana")){
	    return 1;
	}
	else if(matchb_in_a(root_word_char,"xvivacana")){
	    return 2;
	}
	else if(matchb_in_a(root_word_char,"bahuvacana")){
	    return 3;
	}
	else{
	    //System.out.println("vacana_error");
	    return 0;
	}
	//return "";
    }
		    
    public static boolean matchb_in_a(String a, String b){
	if(a.indexOf(b)!=-1){
	    return true;
	}
	else{
	    return false;
	}
	//return ;
    }

    public static input_DS iw(input_DS upaxeSa_DS){
	//input_DS output;
	String store_in="";
	String upaxeSa_word="";
	String upaxeSa_word_char="";
	int position_up=0;
	for(int i=0;i<upaxeSa_DS.length_DS;i++){
	    if(matchb_in_a(upaxeSa_DS.attrib_words[i],"upaxeSa")){
		position_up=i;
		upaxeSa_word=upaxeSa_DS.words[i];
		store_in=upaxeSa_DS.words[i];
		upaxeSa_word_char=upaxeSa_DS.attrib_words[i];
	    }
	}
	//System.out.println("1206::"+upaxeSa_word+" "+upaxeSa_word_char);
	int anunAsik_marker=-1;
	if(upaxeSa_word.length()>2){
	    if(upaxeSa_word.indexOf(",")==upaxeSa_word.length()-2){
		anunAsik_marker=Integer.parseInt(upaxeSa_word.substring(upaxeSa_word.length()-1));
		upaxeSa_word=upaxeSa_word.substring(0,upaxeSa_word.length()-2);
	    }
	}
	String it_values="";
	//System.out.println(upaxeSa_word+""+anunAsik_marker);
	StringBuffer to_store_prawyaya=new StringBuffer(upaxeSa_word);
	StringBuffer to_store_prawyaya_char=new StringBuffer(upaxeSa_word_char);   
	String use_it=upaxeSa_word_char;
	//iw_rule list_iw_rule[]=new iw_rule[5];
	//iw_rule[0]=new iw_rule();
			
	it_values=rule_1_3_5(upaxeSa_word, upaxeSa_word_char);
	it_values=it_values+rule_1_3_6(upaxeSa_word, upaxeSa_word_char);
	it_values=it_values+rule_1_3_7(upaxeSa_word, upaxeSa_word_char);
			    
	if((upaxeSa_word_char.indexOf("viBakwi")==-1)&&(upaxeSa_word_char.indexOf("wif")==-1)){
	    //  //System.out.println("i came fine");
	    it_values=it_values+rule_1_3_3(upaxeSa_word, upaxeSa_word_char);
	}
	else{
	    if(!(belongs(anwyam(upaxeSa_word),"wWxXnsm"))){//Make the function antyam
		// //System.out.println("i came ");
		it_values=it_values+rule_1_3_3(upaxeSa_word, upaxeSa_word_char);
	    }
	}
	it_values=it_values+rule_1_3_2(upaxeSa_word, upaxeSa_word_char,anunAsik_marker);
	try{
	    it_values=it_values+ rule_1_3_8(upaxeSa_word, upaxeSa_word_char);
	}
	catch (Exception e){};
	//System.out.println(it_values);
	if(belongs("%",it_values)){
	    String indices[]=it_values.split("%");//onlt the positions are ruturned
				  
	    //System.out.println(indices.length);
	    int indices_num[]=new int[indices.length];
	    for(int i=0;i<indices.length;i++){
		if(indices[i].length()>0){
		    indices_num[i]=Integer.parseInt(indices[i]);
		}
	    }
	    for(int i=0;i<indices.length;i++){
		use_it=use_it+", "+to_store_prawyaya.substring(indices_num[i],indices_num[i]+1)+"-iw";
		to_store_prawyaya.setCharAt(indices_num[i],'$');
	    }
	    for(int i=to_store_prawyaya.length()-1;i>=0;i--){
		if(to_store_prawyaya.charAt(i)=='$'){
		    to_store_prawyaya.deleteCharAt(i);
		}
	    }
	    //System.out.println("1:::"+upaxeSa_DS.output_form());
	    upaxeSa_DS.words[position_up]=""+to_store_prawyaya;
	    //System.out.println("2:::"+upaxeSa_DS.output_form());
	    upaxeSa_DS.attrib_words[position_up]=use_it;
	    //System.out.println("3:::"+upaxeSa_DS.output_form());
	    upaxeSa_DS.remove("upaxeSa",position_up);//make a function in input_DS
	    instant_DS[process_status-1]=upaxeSa_DS.get_output();
	    return upaxeSa_DS;
				
	}
	else{
	    return upaxeSa_DS;
	}
		    
    }	

    public static String anwyam(String a){
	return a.substring(a.length()-1,a.length());
    }	

    public static String rule_1_3_2(String upaxeSa_word, String upaxeSa_word_char,int anunAsik_marker){
	if(anunAsik_marker!=-1){
	    rules[process_status]="1.3.2";
	    process[process_status]=upaxeSa_word.substring(anunAsik_marker,anunAsik_marker+1)+"-iw";
	    process_status++;
	    return (anunAsik_marker+"%");//% will be used to decipher if there are more iw's
	}
	else return "";
    }


	
    public static String rule_1_3_3(String upaxeSa_word, String upaxeSa_word_char){
	if(belongs(upaxeSa_word.substring(upaxeSa_word.length()-1),hal)){
	    rules[process_status]="1.3.3";
	    process[process_status]=upaxeSa_word.substring(upaxeSa_word.length()-1)+"-iw";
	    process_status++;
	    return ((upaxeSa_word.length()-1)+"%");//% will be used to decipher if there are more iw's
	}
	else return "";
    }

    public static String rule_1_3_5(String upaxeSa_word, String upaxeSa_word_char){
	if(upaxeSa_word.length()>2){
	    if((belongs(upaxeSa_word.substring(0,2),"Fi"))||(belongs(upaxeSa_word.substring(0,2),"Tu"))||(belongs(upaxeSa_word.substring(0,2),"Du"))){
		rules[process_status]="1.3.5";
		process[process_status]=upaxeSa_word.substring(0,2)+"-iw";
		process_status++;
		return (0+"%"+1+"%");//% will be used to decipher if there are more iw's
	    }		
	    else return "";
	}
	else return "";
    }

    public static String rule_1_3_6(String upaxeSa_word, String upaxeSa_word_char){
	//System.out.println("1325"+upaxeSa_word);
	if(belongs(upaxeSa_word.substring(0,1),"R")){
	    rules[process_status]="1.3.6";
	    process[process_status]=upaxeSa_word.substring(0,1)+"-iw";
	    process_status++;
	    return (0+"%");//% will be used to decipher if there are more iw's
	}
	else return "";
    }

    public static String rule_1_3_7(String upaxeSa_word, String upaxeSa_word_char){
	if((belongs(upaxeSa_word.substring(0,1),cu))||(belongs(upaxeSa_word.substring(0,1),tu))){
	    if(!(belongs("J",upaxeSa_word.substring(0,1)))){
		rules[process_status]="1.3.7";
		process[process_status]=upaxeSa_word.substring(0,1)+"-iw";
		process_status++;
		return (0+"%");//% will be used to decipher if there are more iw's
	    }
	}
	return "";
    }

    public static String rule_1_3_8(String upaxeSa_word, String upaxeSa_word_char) throws IOException{
	BufferedReader is_waxXiwa=new BufferedReader(new FileReader("waxXiwa"));
	String s="";
	while((s=is_waxXiwa.readLine())!=null){
	    if(s.indexOf(upaxeSa_word)==1){
		return "";
	    }
	}		
	if((belongs(upaxeSa_word.substring(0,1),ku))||(belongs(upaxeSa_word.substring(0,1),"lS"))){
	    rules[process_status]="1.3.8";
	    process[process_status]=upaxeSa_word.substring(0,1)+"-iw";
	    process_status++;
	    return (0+"%");//% will be used to decipher if there are more iw's
	}
	else return "";
    }

    public static boolean belongs(String a, String b){
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

    public static input_DS[] recursive_sUwra_aRt(input_DS prakriyA){
	//input_DS[] output;
	boolean flag=true;
	boolean just_inc=false;
	boolean afga_viXi_ch=false;
	int how_many_over=0;
	int temp_afga_viXi=0;
	int temp1_afga_viXi=0;
	String temp_rules="";
	String temp1_rules="";
	input_DS prakriyA_output_prev[]=new input_DS[4];
	prakriyA_output_prev[0]=prakriyA;
	for(int i=1;i<4;i++){
	    prakriyA_output_prev[i]=new input_DS("","");
	}
	input_DS prakriyA_output_new[]=new input_DS[4];
	for(int i=0;i<4;i++){
	    prakriyA_output_new[i]=new input_DS("","");
	}
	input_DS prakriyA_output_temp[]={prakriyA.myclone()};
	input_DS temp;
	boolean flags[]={true,false,false,false};
	int ind_new=0;
	int changed_iter=0;
	while(flag){
	    flag=false;
	    ind_new=0;				
	    for(int i=0;i<prakriyA_output_prev.length;i++){
		if(prakriyA_output_prev[i].words[0].length()>0){
		    if(flags[i]){
			flags[i]=false;
			prakriyA_output_prev[i]=prawyaya_saMjFA(prakriyA_output_prev[i].myclone());
			if(i>0){
			    if(just_inc){
				temp_afga_viXi=afga_viXi_iter;
				if(afga_viXi_iter>0){
				    temp_rules=prev_rules[afga_viXi_iter-1];
				}
							
				afga_viXi_iter=changed_iter;
							
				afga_viXi_ch=true;
				just_inc=false;
			    }
			    else{
				if(flags[i-1]){
				    if(afga_viXi_iter>0){
					temp_rules=prev_rules[afga_viXi_iter-1];
				    }
				    temp_afga_viXi=afga_viXi_iter;
				    afga_viXi_iter=temp1_afga_viXi;
				    if(afga_viXi_iter>0){
					prev_rules[afga_viXi_iter-1]=temp1_rules;
				    }
				}
			    }
			    //System.out.println(temp_afga_viXi+" temp_afga_viXi "+afga_viXi_iter+" afga_viXi_iter "+temp_rules+" temp_rules "+temp1_rules+" temp1_rules 1903");
								
			}
			else{
			    if(afga_viXi_ch){
				if(flags[i+1]){
				    if(afga_viXi_iter>0){
					temp1_rules=prev_rules[afga_viXi_iter-1];
				    }
				    temp1_afga_viXi=afga_viXi_iter;
				    afga_viXi_iter=temp_afga_viXi;
				    if(afga_viXi_iter>0){
					prev_rules[afga_viXi_iter-1]=temp_rules;
				    }
				    //System.out.println(temp_afga_viXi+" temp_afga_viXi "+afga_viXi_iter+" afga_viXi_iter "+temp_rules+" temp_rules "+temp1_rules+" temp1_rules 1916");
				}
			    }
			    else{
				//System.out.println(temp_afga_viXi+" temp_afga_viXi "+afga_viXi_iter+" afga_viXi_iter "+temp_rules+" temp_rules "+temp1_rules+" temp1_rules 1917");
			    }
			}
			is_applied=false;
			//temp=prakriyA_output_prev[i].myclone();
			//System.out.println(temp.get_output());
					
			prakriyA_output_temp=sUwra_aRt(prakriyA_output_prev[i]);
			if(afga_viXi_iter>0){
			    //System.out.println(temp_afga_viXi+" temp_afga_viXi "+afga_viXi_iter+" afga_viXi_iter "+temp_rules+" temp_rules "+temp1_rules+" temp1_rules 1928 "+prev_rules[afga_viXi_iter-1]+"the process "+i);
			}
			if(prakriyA_output_temp.length>1){
			    //flag=true;
			    flags[i]=true;
			    flags[i+1]=true;
			    just_inc=true;
			    changed_iter=afga_viXi_iter;
			    //System.out.println(just_inc+"1937 "+rules[process_status-1]);
			}
			else{
			    //just_inc=false;
			    //System.out.println(prakriyA_output_temp[0].get_output()+"1869");
			    //System.out.println(is_applied);
			    if(is_applied){
				//flag=true;
				flags[i]=true;
			    }
			    else{
				if(prakriyA_output_prev[i].DS_length()>2){
				    prakriyA_output_prev[i].merge();
				    flags[i]=true;
				}
				else{
				    flags[i]=false;	
				}
			    }
			}
			if((process[process_status-1].equals("ekAxeSa"))||(process[process_status-1].equals("saMhiwA"))){
			    if(prakriyA_output_prev[i].DS_length()>2){
				//System.out.println(prakriyA_output_prev[i].get_output()+"2604");
				prakriyA_output_prev[i].merge();
				//System.out.println(prakriyA_output_prev[i].get_output()+"2606");
				flags[i]=true;
			    }
			    else{
							
				flags[i]=false;
			    }
			}
			for(int l=0;l<prakriyA_output_temp.length;l++){
			    prakriyA_output_new[ind_new]=prakriyA_output_temp[l];
			    ind_new++;
			}
					
		    }
		    else{
			prakriyA_output_new[ind_new]=prakriyA_output_prev[i];
			ind_new++;
		    }
		}
					
	    }
			
	    for(int newl=0;newl<ind_new;newl++){
		prakriyA_output_prev[newl]=prakriyA_output_new[newl].myclone();
	    }
	    flag=flags[0]||flags[1]||flags[2]||flags[3];
			

	    //prakriyA_output_prev=prakriyA_output_new;
	    //System.out.println(flag+""+flags[0]+""+flags[1]+" 2361 "+prakriyA_output_prev.length);
	}
	input_DS return_output[]=new input_DS[ind_new];
	for(int newl=0;newl<ind_new;newl++){
	    return_output[newl]=prakriyA_output_new[newl].myclone();
	}
	return return_output;
    }
		
    public static String ti(String afga){
	int j=afga.length();
	if(j==1){
	    if(belongs(afga,ac)){
		return afga;
	    }
	    else{
		return "";
	    }
	}
	int first_ac=0;
	ac_loop:for(int i=j-1;i>=0;i--){
	    if(belongs(afga.substring(i,i+1),ac)){
		first_ac=i;
		break ac_loop;
	    }
	}
	return afga.substring(first_ac);
    }
				
			
    public static input_DS[] sUwra_aRt(input_DS prakriyA){
	rule list_iy_rule[]=new rule[5];
	list_iy_rule[0]=new rule("6-4-77","asixXavaw","^BrU$","^"+ac+"\\w*$","afga+root(BrU)","");//aci)100 SnuXAwuBruvAM (yvoH)78 (iyaf)80 (uvafO)78
	list_iy_rule[1]=new rule("6-4-77","asixXavaw","\\w*[iIuU]$","^"+ac+"\\w*$","afga+@ends(XAwu)","");//(aci)100 SnuXAwuBruvAM (yvoH)78 (iyaf)80 (uvafO)78
	list_iy_rule[2]=new rule("6-4-77","asixXavaw","\\w*","^"+ac+"\\w*$","afga+prawyayAnwa(Snu)","");//(aci)100 SnuXAwuBruvAM (yvoH)78 (iyaf)80 (uvafO)78
	list_iy_rule[3]=new rule("6-4-79","asixXavaw","^swrI$","^"+ac+"\\w*$","afga","");//swriyAH
	list_iy_rule[4]=new rule("6-4-80","asixXavaw","^swrI$","^"+ac+"\\w*$","afga","root(am)|root(Sas)","viBARA");
	if(belongs("swrI",prakriyA.attrib_words[0])){
	    if(!((is_applied("1-4-5"))||(is_applied("1-4-4"))||(is_applied("1-4-6")))){
		boolean rule_applied=false;
		for(int as=0;as<5;as++){
		    if(list_iy_rule[as].condition(prakriyA,0)){
			rule_applied=true;
		    }
		}
		//if(list_rule[0].condition(prakriyA,0))
		if(rule_applied){
		    if(!(belongs("@root(swrI)",prakriyA.attrib_words[0]))){
			if(belongs("@root(Am)",prakriyA.attrib_words[1])){
			    input_DS clone_prakriyA=prakriyA.myclone();
			    prakriyA.remove("naxI",0);
			    rules[process_status]="1-4-5";
			    process[process_status]="naxI saMjFA vikalpa";
			    instant_DS[process_status]=prakriyA.get_output();
			    process_status++;
			    input_DS[] output= {prakriyA,clone_prakriyA};
			    is_applied=true;
			    return output;
			}
			else if(belongs("f-iw",prakriyA.attrib_words[1])){
			    input_DS clone_prakriyA=prakriyA.myclone();
			    prakriyA.remove("naxI",0);
			    rules[process_status]="1-4-6";
			    process[process_status]="naxI saMjFA vikalpa";
			    instant_DS[process_status]=prakriyA.get_output();
			    process_status++;
			    input_DS[] output= {prakriyA,clone_prakriyA};
			    is_applied=true;
			    return output;
			}
			else{
			    prakriyA.remove("naxI",0);
			    rules[process_status]="1-4-4";
			    process[process_status]="naxI saMjFA niReXa";
			    instant_DS[process_status]=prakriyA.get_output();
			    process_status++;
			    input_DS[] output= {prakriyA};
			    is_applied=true;
			    return output;
			}
		    }
		}
	    }
	}
							
	//System.out.println("before sUwra "+prakriyA.get_output());
	boolean is_15=true;
	String afga=prakriyA.words[0];
	if(afga.length()>2){
	    if(afga.length()==3){
		if(belongs(afga.charAt(0)+"",ac)){
		    prakriyA.add("anekAca",0);
		}
	    }
	    else{
		//System.out.println("anekAca added");
		prakriyA.add("anekAca",0);
	    }
	    if((anwyam(afga).equals("U"))&&(belongs("BU",afga))){
		prakriyA.add("@ends(BU)",0);
		prakriyA.remove("naxI",0);
	    }
	}
			
	if(afga.length()>=3){
	    //System.out.println(is_15+" 1877");
	    if(belongs(afga.substring(afga.length()-2,afga.length()-1),hal)){
		//System.out.println(is_15+" 1879");
		if(belongs(afga.substring(afga.length()-3,afga.length()-2),hal)){
		    //System.out.println(is_15+" 1881");
		    is_15=false;
		}
	    }
	}
	else{
	    if(afga.length()==2){
		is_15=false;
	    }
	}
	//System.out.println(is_15+" 1888");
	if(is_15){
	    prakriyA.add("asaMyoga",0);
	}
			
	rule list_rule[]=new rule[300];
	rule triggered_rule[]=new rule[50];
	rule new_triggered_rule[]=new rule[50];
	int r=0;
	list_rule[r]=new rule("default","other","\\w*"+hal+hal+hal+"$","\\w*","\\w*","apqkwa+root(su,1)|root(wi)|root(si)");r++;
	list_rule[r]=new rule("2-4-85","prawyaya_viXi","\\w*","\\w*","XAwu","lut+praWama");r++;
	list_rule[r]=new rule("3-1-33","prawyaya_viXi","\\w*","\\w*","XAwu","lat|lqt|lqf");r++;
	list_rule[r]=new rule("3-1-68","prawyaya_viXi","\\w*","\\w*","XAwu+karwari","sArvaXAwuka");r++;
	list_rule[r]=new rule("3-4-85","prawyaya_viXi","\\w*","\\w*","XAwu","lot");r++;
	list_rule[r]=new rule("3-4-86","prawyaya_viXi","\\w*","\\w*i\\w*","XAwu","lot");r++;
	list_rule[r]=new rule("3-4-87","prawyaya_viXi","\\w*","\\w*","XAwu","lot+root(sip)");r++;
	list_rule[r]=new rule("3-4-101","prawyaya_viXi","\\w*","\\w*i\\w*","XAwu","f-iw+root(was)|root(Was)|root(Wa)|root(mip)");r++;
	//list_rule[r]=new rule("3-4-113","prawyaya_viXi","\\w*","\\w*","XAwu","wif");r++;
	//list_rule[r]=new rule("3-4-113","prawyaya_viXi","\\w*","\\w*","XAwu","S-iw");r++;
	//list_rule[r]=new rule("3-4-114","prawyaya_viXi","\\w*","\\w*","XAwu","!wif+!S-iw");r++;
	//list_rule[r]=new rule("3-4-115","prawyaya_viXi","\\w*","\\w*","XAwu+lit","wif");r++;
	list_rule[r]=new rule("4-1-5","prawyaya_viXi","\\w*[qn]$","\\w*","swrI","");r++;
	list_rule[r]=new rule("6-1-68","other","\\w*"+hal+"$","\\w","","apqkwa+root(su,1)|root(wi)|root(si)");r++;
	list_rule[r]=new rule("6-1-68","other","\\w*[IA]$","\\w","fyanwa|Abanwa","apqkwa+root(su,1)|root(wi)|root(si)");r++;
	list_rule[r]=new rule("6-1-77","saMhiwA","\\w*"+ik+"$","^"+ac+"\\w*");r++;//ikaH yaN (aci)
	list_rule[r]=new rule("6-1-78","saMhiwA","\\w*"+ec+"$","^"+ac+"\\w*");r++;
	list_rule[r]=new rule("6-1-79","saMhiwA","\\w*[oO]$","^y\\w*","","prawyaya");r++;
	//=======================How to implement 6-1-80==========================
	list_rule[r]=new rule("6-1-87","ekAxeSa","\\w*[aA]$","^"+ak+"\\w*");r++;
	list_rule[r]=new rule("6-1-88","ekAxeSa","\\w*[aA]$","^"+ec+"\\w*");r++;			
	list_rule[r]=new rule("6-1-89", "ekAxeSa","\\w*[aA]$","ewi|eXawi|UTa");r++;
	list_rule[r]=new rule("6-1-90","ekAxeSa","\\w*A$","^"+ac+"\\w*","root(At)","");r++;
	list_rule[r]=new rule("6-1-91","ekAxeSa","\\w*[aA]$","^q\\w*","upasarga","XAwu");r++;
	list_rule[r]=new rule("6-1-93", "ekAxeSa","\\w*o$","\\w*","prAwipaxika+okArAnwa","root(am)|root(Sas)+viBakwi");r++;
	list_rule[r]=new rule("6-1-94", "ekAxeSa","\\w*[aA]$","^[eo]\\w*","upasarga","XAwu");r++;
	list_rule[r]=new rule("6-1-95", "ekAxeSa","\\w*[aA]$","^"+ac+"\\w*","","root(om)|root(Af)");r++;
	list_rule[r]=new rule("6-1-96", "ekAxeSa","\\w*[aA]$","^u\\w*","!paxa","root(us)");r++;
	list_rule[r]=new rule("6-1-97", "ekAxeSa","\\w*a$","^"+guNa+"\\w*"+"\\w*","!paxa|paxa","");r++;
	if(prakriyA.words[1].length()>0){
	    list_rule[r]=new rule("6-1-101", "ekAxeSa","\\w*"+ak+"$","^"+ak+"\\w*",is_savarNa(anwyam(prakriyA.words[0]),prakriyA.words[1].substring(0,1)));r++;
	}
	list_rule[r]=new rule("6-1-102", "ekAxeSa","\\w*"+ak+"$","^"+ac+"\\w*","afga","praWamA|xviwIyA");r++;
	list_rule[r]=new rule("6-1-103", "ekAxeSa","\\w*","^"+xIrGa+"s\\w*","","root(Sas)",is_applied("6-1-102"));r++;
	list_rule[r]=new rule("6-1-104", "ekAxeSa","\\w*[aA]$","^"+ic+"\\w*","afga","praWamA|xviwIyA","niReXa");r++;
	//incorporate this feature!!
	list_rule[r]=new rule("6-1-105", "ekAxeSa","\\w*[IU]$","^"+ic+"\\w*","afga","praWamA|xviwIyA","niReXa");r++;
	list_rule[r]=new rule("6-1-105", "ekAxeSa","\\w*[AIU]$","\\w*as$","afga","root(jas)","niReXa");r++;
	list_rule[r]=new rule("6-1-107", "ekAxeSa","\\w*"+ak+"$","^a\\w*","","root(am)|AxeSa(am)");r++;
	list_rule[r]=new rule("6-1-109", "ekAxeSa","\\w*[eo]$","^a\\w*","paxa","");r++;
	list_rule[r]=new rule("6-1-110", "ekAxeSa","\\w*[eo]$","^a\\w*","prAwipaxika","root(fasi,3)|root(fas)");r++;
	list_rule[r]=new rule("6-1-111", "ekAxeSa","\\w*q$","^a\\w*","prAwipaxika","root(fasi,3)|root(fas)");r++;		list_rule[r]=new rule("6-1-112", "other","\\w*[Kw]y\\w*","^a\\w*","AxeSa(yaNa)","root(fasi,3)|root(fas)");r++;
	list_rule[r]=new rule("6-1-131", "other","\\w*xiv$","\\w*","paxa","");r++;
	//list_rule[r]=new rule("6-4-2","afga_viXi","\\w*"+hal+yaN+ac+"$","\\w*","afga","");r++;
	list_rule[r]=new rule("6-4-3","afga_viXi","\\w*","^nAm$","afga","");r++;
	list_rule[r]=new rule("6-4-4","afga_viXi","wisq|cawasq","^nAm$","afga","","niReXa");r++;
	list_rule[r]=new rule("6-4-6","afga_viXi","nq","^nAm$","afga","","viBARA");r++;
	list_rule[r]=new rule("6-4-7","afga_viXi","\\w*n$","^nAm$","afga","");r++;
	list_rule[r]=new rule("6-4-8","afga_viXi","\\w*n$","\\w*","afga","sarvanAmasWAna+!sambuxXi");r++;
	//System.out.println(r);
	list_rule[r]=new rule("6-4-10","afga_viXi","\\w*ns$","\\w*","afga","sarvanAmasWAna+!sambuxXi");r++;
	list_rule[r]=new rule("6-4-11", "afga_viXi", "\\w*"+ac+hal+"$", "\\w*", "root(svasq)|root(napwq)|root(neRtq)|root(wvaRtq)|root(kRawq)|root(howq)|root(praSAstq)|prawyayAnwa(wqc)|prawyayAnwa(wqn)", "sarvanAmasWAna+!sambuxXi");r++;
	list_rule[r]=new  rule("6-4-12","afga_viXi","\\w*in$|\\w*han$|\\w*pURan$|\\w*aryaman$","\\w*","afga","sarvanAmasWAna+!sambuxXi");r++;
	list_rule[r]=new rule("6-4-13","afga_viXi","\\w*in$|\\w*han$|\\w*pURan$|\\w*aryaman$","\\w*","afga","sarvanAmasWAna+@root(su,1)+!sambuxXi");r++;
	list_rule[r]=new rule("6-4-14","afga_viXi","\\w*aw$|\\w*as$","\\w*","afga","@root(Su,1)+!sambuxXi");r++;
	//Not full: consonant doesn't belong to the root?
	list_rule[r]=new rule("6-4-15","afga_viXi","\\w*"+ac+"n"+"$","\\w*","afga","@root(kvi)");r++;
	list_rule[r]=new rule("6-4-15","afga_viXi","\\w*"+ac+"n"+"$",Jal+"\\w*","afga","k-iw|F-iw");r++;
	list_rule[r]=new rule("6-4-16","afga_viXi","\\w*"+ac+"$",Jal+"\\w*","afga+XAwu","@root(san)");r++;
	list_rule[r]=new rule("6-4-16","afga_viXi","han|gam",Jal+"\\w*","afga+XAwu","@root(san)");r++;
	list_rule[r]=new rule("6-4-17","afga_viXi","^wan$",Jal+"\\w*","afga","@root(san)","viBARA");r++;
	list_rule[r]=new rule("6-4-18","afga_viXi","^kram$",Jal+"\\w*","afga","@root(kwvA)","viBARA");r++;
	//---------------6-4-19 6-4-20 left due to being tedious-----------------
	list_rule[r]=new rule("6-4-21","afga_viXi","\\w*r[vC]$","\\w*","afga","@root(kvi)");r++;
	list_rule[r]=new rule("6-4-23","afga_viXi","\\w*$","\\w*","afga","@root(kvi)");r++;
	//---------
	list_rule[r]=new rule("6-4-24","asixXavaw","\\w*n"+hal+"$","\\w*","afga+!i-iw","");r++;
	list_rule[r]=new rule("6-4-25","asixXavaw","xanS|saFj|svaFj","\\w*","afga","root(Sap)");r++;
	list_rule[r]=new rule("6-4-26","asixXavaw","^raFj$","\\w*","afga","root(Sap)");r++;
	list_rule[r]=new rule("6-4-27","asixXavaw","^raFj$","\\w*","afga","Bava|karaNa","niReXa");r++;
	list_rule[r]=new rule("6-4-28","afga_viXi","^raFj$","\\w*","afga","Bava|karaNa","niReXa");r++;
	list_rule[r]=new rule("6-4-30","asixXavaw","\\w*","\\w*","afga+arWa(pUjA)","","niReXa");r++;
	//======================arWa(pUjA)=>semantic context=====================================//	
	list_rule[r]=new rule("6-4-31","asixXavaw","skanx|syanx","\\w*","afga","@root(kwvA)","niReXa");r++;
	list_rule[r]=new rule("6-4-32","asixXavaw","\\w*n$|naS","\\w*","afga","@root(kwvA)","niReXaviBARA");r++;
	list_rule[r]=new rule("6-4-33","asixXavaw","^BaFj$","\\w*","afga","@root(ciN)","viBARA");r++;
	list_rule[r]=new rule("6-4-34","asixXavaw","^SAs$","\\w*","afga","@root(af)");r++;
	list_rule[r]=new rule("6-4-34","asixXavaw","^SAs$","\\w*","afga","k-iw|f-iw");r++;
	list_rule[r]=new rule("6-4-35","asixXavaw","^SAs$","^hi$","afga","");r++;
	list_rule[r]=new rule("6-4-36","asixXavaw","^han$","^hi$","afga","");r++;
	//----------------6-4-37 38 39-------------------------------\\
	list_rule[r]=new rule("6-4-40","asixXavaw","^gam$","\\w*","afga","root(kvip)");r++;
	list_rule[r]=new rule("6-4-41","asixXavaw","\\w*"+anunAsika+"$","\\w*","afga","root(vit)|root(van)");r++;
	list_rule[r]=new rule("6-4-42","asixXavaw","^[jsK]an$",Jal+"\\w*","afga","root(san)|k-iw|f-iw");r++;
	list_rule[r]=new rule("6-4-43","asixXavaw","^[jsK]an$","^y\\w*","afga","k-iw|f-iw","viBARA");r++;
	list_rule[r]=new rule("6-4-44","asixXavaw","^wan$","\\w*","afga","root(yak)","viBARA");r++;
	list_rule[r]=new rule("6-4-45","asixXavaw","^san$","\\w*","afga","root(kwic)","viBARA");r++;
	//----------------ArXaXAwuke---------------------------
	list_rule[r]=new rule("6-4-47","asixXavaw","^Brasj$","\\w*","afga","ArXaXAwuka","viBARA");r++;
	list_rule[r]=new rule("6-4-48","asixXavaw","\\w*a$","\\w*","afga","ArXaXAwuka");r++;
	list_rule[r]=new rule("6-4-49","asixXavaw","\\w*"+hal+"ya$","\\w*","afga","ArXaXAwuka");r++;
	list_rule[r]=new rule("6-4-50","asixXavaw","\\w*"+hal+"ya$","\\w*","afga+root(kya","ArXaXAwuka");r++;
	//-----------------Make it more formal, root(kya-----------------------------\\
	//-------------6-4-51==> Not possible by the current DS--------------------\\
	list_rule[r]=new rule("6-4-77","asixXavaw","^BrU$","^"+ac+"\\w*$","afga+root(BrU)","");r++;//aci)100 SnuXAwuBruvAM (yvoH)78 (iyaf)80 (uvafO)78
	list_rule[r]=new rule("6-4-77","asixXavaw","\\w*[iIuU]$","^"+ac+"\\w*$","afga+@ends(XAwu)","");r++;//(aci)100 SnuXAwuBruvAM (yvoH)78 (iyaf)80 (uvafO)78
	list_rule[r]=new rule("6-4-77","asixXavaw","\\w*","^"+ac+"\\w*$","afga+prawyayAnwa(Snu)","");r++;//(aci)100 SnuXAwuBruvAM (yvoH)78 (iyaf)80 (uvafO)78
	list_rule[r]=new rule("6-4-79","asixXavaw","^swrI$","^"+ac+"\\w*$","afga","");r++;//swriyAH
	list_rule[r]=new rule("6-4-80","asixXavaw","^swrI$","^"+ac+"\\w*$","afga","root(am)|root(Sas)","viBARA");r++;
	list_rule[r]=new rule("6-4-82","asixXavaw","\\w*[iI]$","^"+ac+"\\w*$","@ends(XAwu)+asaMyoga+anekAca","sup");r++;
	list_rule[r]=new rule("6-4-83","asixXavaw","\\w*[uU]","^"+ac+"\\w*$","asaMyoga+anekAca+@ends(XAwu)","sup");r++;//oH supi
	list_rule[r]=new rule("6-4-84","asixXavaw","^varRABU$","^"+ac+"\\w*$","","sup");r++;//varRABvaSca	
	list_rule[r]=new rule("6-4-85","asixXavaw","\\w*I","^"+ac+"\\w*$","root(suXI)","sup","niReXa");r++;
	list_rule[r]=new rule("6-4-85","asixXavaw","\\w*U","^"+ac+"\\w*$","ends(BU)","sup","niReXa");r++;
	list_rule[r]=new rule("6-4-88","asixXavaw","^BU$","^"+ac+"\\w*$","XAwu","luf|lit");r++;	
	list_rule[r]=new rule("6-4-105","asixXavaw","\\w*a$","^hi$","XAwu","");r++;	
	list_rule[r]=new rule("6-4-127","asixXavaw","^\\w*arvan$","\\w*","afga+!root(naF)","!root(su,1)");r++;//The wq->wq,1
	list_rule[r]=new rule("6-4-128","asixXavaw","^maGavan$","\\w*","afga+root(maGavan)","","viBARA");r++;//The wq->wq,1
	list_rule[r]=new rule("6-4-130","afga_viXi","\\w*pAx$","\\w*","afga+Ba","");r++;
	list_rule[r]=new rule("6-4-131","afga_viXi","\\w*","\\w*","afga+Ba+prawyayAnwa(vasu)","");r++;
	//=================What about prawyayAnwa?=============================================//
	list_rule[r]=new rule("6-4-132","afga_viXi","\\w*vAh$","\\w*","afga+Ba","");r++;
	list_rule[r]=new rule("6-4-133","afga_viXi","Svan|yuvan|maGavan","\\w*","afga+Ba","!waxXiwa");r++;
	list_rule[r]=new rule("6-4-134","afga_viXi","\\w*an$","\\w*","afga+Ba","");r++;
	list_rule[r]=new rule("6-4-135","afga_viXi","\\w*Ran$","\\w*","afga+Ba","root(aN)");r++;
	list_rule[r]=new rule("6-4-135","afga_viXi","\\w*Ran$","\\w*","afga+Ba+root(han)|root(XqwarAjan)","root(aN)");r++;
	list_rule[r]=new rule("6-4-136","afga_viXi","\\w*an$","\\w*","afga+Ba","root(fi)|AxeSa(SI)","viBARA");r++;
	list_rule[r]=new rule("6-4-137","afga_viXi","\\w*"+hal+"[vm]an$","\\w*","afga+Ba","","niReXa");r++;
	list_rule[r]=new rule("6-4-138","afga_viXi","\\w*ac$","\\w*","afga+Ba+root(aFc)","");r++;
	list_rule[r]=new rule("6-4-139","afga_viXi","\\w*ac$","\\w*","afga+Ba+root(aFc)+upasarga(ux)","");r++;
	list_rule[r]=new rule("6-4-140","afga_viXi","\\w*A$","\\w*","afga+Ba+@ends(XAwu)","");r++;
	list_rule[r]=new rule("6-4-143","afga_viXi","\\w*","\\w*","afga+Ba","d-iw");r++;
	list_rule[r]=new rule("7-1-3", "afga_viXi", "\\w*", "\\w*J\\w*", "afga", "prawyaya");r++;
	list_rule[r]=new rule("7-1-9", "afga_viXi", "\\w*a$", "\\w*", "afga", "root(Bis)");r++;//use the root in all the data structure whether iw or not
	list_rule[r]=new rule("7-1-11", "afga_viXi", "\\w*a$", "\\w*", "afga+root(ixam)|root(axas)", "root(Bis)","niReXa");r++;
	list_rule[r]=new rule("7-1-12", "afga_viXi", "\\w*a$", "^"+ac+"\\w*", "afga", "root(tA)|root(fasi,3)|root(fas)");r++;
	list_rule[r]=new rule("7-1-13", "afga_viXi", "\\w*a$", "\\w*e", "afga", "root(fe)");r++;
	list_rule[r]=new rule("7-1-14", "afga_viXi", "\\w*a$", "\\w*e", "afga+sarvanAma", "root(fe)");r++;
	list_rule[r]=new rule("7-1-15", "afga_viXi", "\\w*a$", "\\w*"+ac, "afga+sarvanAma", "root(fasi,3)|root(fi)");r++;
	list_rule[r]=new rule("7-1-16", "afga_viXi", "\\w*a$", "\\w*"+ac, "afga+sarvanAma+pUrvAxi", "root(fasi,3)|root(fi)","viBARA");r++;
	//-----------------Make the mapping for ...Axi-----------------======================\\
	list_rule[r]=new rule("7-1-17", "afga_viXi", "\\w*a$", "^as$", "afga+sarvanAma", "root(jas)");r++;
	list_rule[r]=new rule("7-1-18", "afga_viXi", "\\w*A$", "^O\\w*", "afga+Abanwa", "root(O)|root(Ot)");r++;	
	list_rule[r]=new rule("7-1-19", "afga_viXi", "\\w*", "^O\\w*$", "afga+napuMsaka", "root(O)|root(Ot)");r++;
	list_rule[r]=new rule("7-1-20", "afga_viXi", "\\w*", "^as$", "afga+napuMsaka", "root(jas)|root(Sas)");r++;
	list_rule[r]=new rule("7-1-21", "afga_viXi", "^aRtA$*", "\\w*", "afga", "root(jas)|root(Sas)");r++;
	list_rule[r]=new rule("7-1-22", "afga_viXi", "\\w*", "^as$", "afga+Rat", "root(jas)|root(Sas)");r++;
	list_rule[r]=new rule("7-1-23", "afga_viXi", "\\w*", "\\w*", "afga+napuMsaka", "root(su,1)|root(am)");r++;
	list_rule[r]=new rule("7-1-24", "afga_viXi", "\\w*a$", "\\w*", "afga+napuMsaka", "root(su,1)|root(am)");r++;
	list_rule[r]=new rule("7-1-25", "afga_viXi", "dawara|dawama|anya|anyawara|iwara", "\\w*", "afga+napuMsaka", "root(su,1)|root(am)");r++;
	list_rule[r]=new rule("7-1-27", "afga_viXi", "\\w*", "\\w*", "afga+root(yuRmax)|root(asmax)", "root(fas)");r++;
	list_rule[r]=new rule("7-1-28", "afga_viXi", "\\w*", "\\w*", "afga+root(yuRmax)|root(asmax)", "praWamA|xviwIyA");r++;
	list_rule[r]=new rule("7-1-28", "afga_viXi", "\\w*", "\\w*", "afga+root(yuRmax)|root(asmax)", "root(fe)");r++;
	list_rule[r]=new rule("7-1-29", "afga_viXi", "\\w*", "\\w*", "afga+root(yuRmax)|root(asmax)", "root(Sas)");r++;
	list_rule[r]=new rule("7-1-30", "afga_viXi", "\\w*", "\\w*", "afga+root(yuRmax)|root(asmax)", "root(Byas)");r++;
	list_rule[r]=new rule("7-1-31", "afga_viXi", "\\w*", "\\w*", "afga+root(yuRmax)|root(asmax)", "root(Byas)+paFcamI");r++;
	list_rule[r]=new rule("7-1-32", "afga_viXi", "\\w*", "\\w*", "afga+root(yuRmax)|root(asmax)", "root(fasi,3)");r++;
	list_rule[r]=new rule("7-1-33", "afga_viXi", "\\w*", "^sAm$", "afga+root(yuRmax)|root(asmax)", "");r++;
	list_rule[r]=new rule("7-1-34", "afga_viXi", "\\w*A$", "", "afga", "root(Nal)");r++;
	list_rule[r]=new rule("7-1-52", "afga_viXi", "\\w*[aA]$", "\\w*", "afga+sarvanAma", "root(Am)");r++;
	list_rule[r]=new rule("7-1-53", "afga_viXi", "wri", "\\w*", "afga", "root(Am)");r++;
	list_rule[r]=new rule("7-1-54", "afga_viXi", "\\w*"+hrasva+"$", "\\w*", "afga", "root(Am)",belongs("RaRTI",prakriyA.attrib_words[1]));r++;//define hrasva vowels			
	list_rule[r]=new rule("7-1-54", "afga_viXi", "\\w*", "\\w*", "afga+naxI", "root(Am)",belongs("RaRTI",prakriyA.attrib_words[1]));r++;
	list_rule[r]=new rule("7-1-54", "afga_viXi", "\\w*A$", "\\w*", "afga+Abanwa", "root(Am)",belongs("RaRTI",prakriyA.attrib_words[1]));r++;
	list_rule[r]=new rule("7-1-55", "afga_viXi", "\\w*", "\\w*", "afga+Rat|root(cawur)", "root(Am)",belongs("RaRTI",prakriyA.attrib_words[1]));r++;
	list_rule[r]=new rule("7-1-70","afga_viXi","\\w*","\\w*","afga+!XAwu+u-iw|q-iw|L-iw","sarvanAmasWAna");r++;
	list_rule[r]=new rule("7-1-70","afga_viXi","\\w*","\\w*","afga+root(aFc)+lopa(n)","sarvanAmasWAna");r++;//add the nalopa characteristic or replace by something else
	list_rule[r]=new rule("7-1-71","afga_viXi","^yuj$","\\w*","afga","sarvanamasWAna");r++;//Where to add asamAse??
	list_rule[r]=new rule("7-1-72","afga_viXi","\\w*"+or(Jal,ac)+"$","\\w*","afga+napuMsaka","sarvanAmasWAna");r++;//Make the "or" function
	list_rule[r]=new rule("7-1-73","afga_viXi","\\w*"+ik+"$","^"+ac+"\\w*$","afga+napuMsaka","sup");r++;//
	//list_rule[r]=new rule("7-1-74","afga_viXi","\\w*"+ik+"$","^"+ac+"\\w*$","napuMsaka","wqwIyA|cawurWI|paFcamI|RaRTI|sapwamI");r++;//
	list_rule[r]=new rule("7-1-75","afga_viXi","asWi|xaXi|sakWi|akRi","^"+ac+"\\w*$","afga","wqwIyA|cawurWI|paFcamI|RaRTI|sapwamI");r++;
	list_rule[r]=new rule("7-1-82", "afga_viXi", "\\w*", "\\w*", "afga+root(anaduh)", "root(su,1)");r++;
	list_rule[r]=new rule("7-1-84", "afga_viXi", "\\w*", "\\w*", "afga+root(xiv)", "root(su,1)");r++;
	list_rule[r]=new rule("7-1-85","afga_viXi","\\w*paWin|maWin|qBukRin","\\w*","afga+root(paWin)|root(supaWin)|root(maWin)|root(qBukRin)","root(su,1)");r++;
	list_rule[r]=new rule("7-1-86","afga_viXi","\\w*i\\w*","A","afga+root(paWin)|root(supaWin)|root(maWin)|root(qBukRin)","!root(tA)");r++;
	list_rule[r]=new rule("7-1-86","afga_viXi","\\w*i\\w*","\\w*","afga+root(paWin)|root(supaWin)|root(maWin)|root(qBukRin)","sarvanAmasWAna");r++;
	list_rule[r]=new rule("7-1-87","afga_viXi","\\w*[^n]W\\w*","\\w*","afga+root(paWin)|root(supaWin)|root(maWin)","sarvanAmasWAna");r++;
	list_rule[r]=new rule("7-1-88","afga_viXi","\\w*paWin|maWin|qBukRin","\\w*","afga+Ba","");r++;
	//-------------Discuss the difference between 7-1-85 & 7-1-86. 7-1-87-. 7-1-88-----------------------\\
	list_rule[r]=new rule("7-1-89","afga_viXi","pu[mM]s","\\w*","afga","sarvanAmasWAna");r++;
	list_rule[r]=new rule("7-1-90", "afga_viXi", "\\w*o$", "\\w*", "afga+okArAnwa", "sarvanAmasWAna");r++;
	list_rule[r]=new rule("7-1-91", "afga_viXi", "\\w*", "\\w*", "afga", "root(Nal)+uwwama");r++;
	list_rule[r]=new rule("7-1-92", "afga_viXi", "^saKi$", "\\w*", "afga", "sarvanAmasWAna+!sambuxXi+!F-iw");r++;
	//--------------------------!F-iw just to bleed itself, whether to be taken?-----------------------\\
	list_rule[r]=new rule("7-1-93", "afga_viXi","^saKi$", "\\w*", "afga", "root(su,1)");r++;
	list_rule[r]=new rule("7-1-94", "afga_viXi", "\\w*q$", "\\w*", "afga", "root(su,1)");r++;
	list_rule[r]=new rule("7-1-94", "afga_viXi", "uSanas|purudaMsas|anehas", "\\w*", "afga", "root(su,1)");r++;
	list_rule[r]=new rule("7-1-95", "afga_viXi", "^kroRtu$", "\\w*", "afga+root(kroRtu)", "sarvanAmasWAna+!sambuxXi");r++;
	list_rule[r]=new rule("7-1-96", "afga_viXi", "^kroRtu$", "\\w*", "afga+root(kroRtu)+swrI", "");r++;
	list_rule[r]=new rule("7-1-97", "afga_viXi", "^kroRtu$", "^"+ac+"\\w*", "afga+root(kroRtu)", "wqwIyA|cawurWI|paFcamI|RaRTI|sapwamI","viBARA");r++;
	/*---------------------ad prawyayanwa(wqc) to attributes of it----------------------------\\*/
	list_rule[r]=new rule("7-1-98", "afga_viXi", "\\w*", "\\w*", "afga+root(cawur)|root(anaduh)", "sarvanAmasWAna");r++;
	list_rule[r]=new rule("7-1-99", "afga_viXi", "\\w*", "\\w*", "afga+root(cawur)|root(anaduh)", "sambuxXi");r++;
	list_rule[r]=new rule("7-2-35","afga_viXi","\\w*","^"+val+"\\w*","","ArXaXAwuka");r++;
	list_rule[r]=new rule("7-2-84","afga_viXi","^aRtan$","^"+hal+"\\w*","afga+root(aRtan)","viBakwi","viBARA");r++;
	list_rule[r]=new rule("7-2-84","afga_viXi","^aRtan$","\\w*","afga+root(aRtan)","root(Sas)|root(jas)","viBARA");r++;
	list_rule[r]=new rule("7-2-85","afga_viXi","^rE$","^"+hal+"\\w*","afga","viBakwi");r++;
	list_rule[r]=new rule("7-2-86","afga_viXi","\\w*","^"+hal+"\\w*","afga+root(yuRmax)|root(asmax)","viBakwi");r++;
	list_rule[r]=new rule("7-2-87","afga_viXi","\\w*ax","\\w*","afga+root(yuRmax)|root(asmax)","viBakwi+xviwIyA");r++;
	list_rule[r]=new rule("7-2-88","afga_viXi","\\w*","\\w*","afga+root(yuRmax)|root(asmax)","viBakwi+praWamA+xvivacana");r++;
	list_rule[r]=new rule("7-2-89","afga_viXi","\\w*","\\w*","afga+root(yuRmax)|root(asmax)","viBakwi");r++;
	list_rule[r]=new rule("7-2-90","afga_viXi","\\w*ax","\\w*","afga+root(yuRmax)|root(asmax)","viBakwi");r++;
	list_rule[r]=new rule("7-2-92","afga_viXi","\\w*","\\w*","afga+root(yuRmax)|root(asmax)","viBakwi+xvivacana");r++;
	list_rule[r]=new rule("7-2-93","afga_viXi","\\w*","\\w*","afga+root(yuRmax)|root(asmax)","viBakwi+root(jas)");r++;
	list_rule[r]=new rule("7-2-94","afga_viXi","\\w*","\\w*","afga+root(yuRmax)|root(asmax)","viBakwi+root(su,1)");r++;
	list_rule[r]=new rule("7-2-95","afga_viXi","\\w*","\\w*","afga+root(yuRmax)|root(asmax)","viBakwi+root(fe)");r++;
	list_rule[r]=new rule("7-2-96","afga_viXi","\\w*","\\w*","afga+root(yuRmax)|root(asmax)","viBakwi+root(fas)");r++;
	list_rule[r]=new rule("7-2-97","afga_viXi","\\w*","\\w*","afga+root(yuRmax)|root(asmax)","viBakwi+ekavacana");r++;
	//=====================Ekawva kaWana in next two rules?==================================//
	list_rule[r]=new rule("7-2-99","afga_viXi","wri|cawur","\\w*","afga+swrI","viBakwi");r++;
	list_rule[r]=new rule("7-2-100","afga_viXi","wisq|cawasq","^"+ac+"\\w*","afga","viBakwi");r++;
	list_rule[r]=new rule("7-2-101","afga_viXi","\\w*","^"+ac+"\\w*","afga+root(nirjara)|root(jarA)","viBakwi","viBARA");r++;
	list_rule[r]=new rule("7-2-102","afga_viXi","\\w*","\\w+","afga+wyaxAxi","sup");r++;
	list_rule[r]=new rule("7-2-103","afga_viXi","\\w*","\\w*","afga+root(kim)","viBakwi");r++;
	list_rule[r]=new rule("7-2-104","afga_viXi","\\w*","^[wh]\\w*","afga+root(kim)","viBakwi");r++;
	list_rule[r]=new rule("7-2-105","afga_viXi","\\w*","\\w*","afga+root(kim)","viBakwi+root(aw)");r++;
	list_rule[r]=new rule("7-2-106","afga_viXi","\\w*[wx]\\w+","\\w*","afga+wyaxAxi","root(su,1)");r++;
	list_rule[r]=new rule("7-2-107","afga_viXi","\\w*","\\w*","afga+root(axas)","root(su,1)");r++;
	list_rule[r]=new rule("7-2-108","afga_viXi","^ixam$","\\w+","afga+root(ixam)","root(su,1)");r++;
	list_rule[r]=new rule("7-2-109","afga_viXi","\\w*x\\w+","\\w+","afga+root(ixam)","viBakwi");r++;
	list_rule[r]=new rule("7-2-110","afga_viXi","^ixam$","\\w+","afga+root(ixam)","root(su,1)");r++;
	list_rule[r]=new rule("7-2-111","afga_viXi","^ixam$","\\w+","afga+root(ixam)+puM","root(su,1)");r++;
	list_rule[r]=new rule("7-2-112","afga_viXi","\\w*ix\\w+","\\w*","afga+root(ixam)","wqwIyA|cawurWI|paFcamI|RaRTI|sapwamI");r++;
	list_rule[r]=new rule("7-2-113","afga_viXi","\\w*ix\\w+","^"+hal+"\\w*","afga+root(ixam)","wqwIyA|cawurWI|paFcamI|RaRTI|sapwamI");r++;
	//=============see how to implement kakArarahiwa================================\\
	list_rule[r]=new rule("7-2-115","afga_viXi","\\w*"+ac+"$","\\w*","afga","N-iw|F-iw");r++;
	list_rule[r]=new rule("7-3-54","afga_viXi","\\w*hn\\w*","\\w*","afga+ends(han)","");r++;
	list_rule[r]=new rule("7-3-84","afga_viXi","\\w*"+ik+"$","\\w*","afga","sArvaXAwuka|ArXaXAwuka");r++;
	list_rule[r]=new rule("7-3-101","afga_viXi","\\w*a$","^"+yaF+"\\w*","afga","sArvaXAwuka");r++;
	list_rule[r]=new rule("7-3-102","afga_viXi","\\w*a$","^"+yaF+"\\w*","afga","sup");r++;
	list_rule[r]=new rule("7-3-103","afga_viXi","\\w*a$","^"+Jal+"\\w*","afga","sup+bahuvacana");r++;
	list_rule[r]=new rule("7-3-104","afga_viXi","\\w*a$","\\w*","afga","root(os)");r++;
	list_rule[r]=new rule("7-3-105","afga_viXi","\\w*A$","\\w*","afga+Abanwa","root(tA)|root(os)");r++;
	list_rule[r]=new rule("7-3-109","afga_viXi","\\w*"+hrasva+"$","^as$","afga","root(jas)");r++;
	list_rule[r]=new rule("7-3-110","afga_viXi","\\w*q$","\\w*","afga","sarvanAmasWAna");r++;
	list_rule[r]=new rule("7-3-110","afga_viXi","\\w*q$","\\w*","afga","root(fi)");r++;
	list_rule[r]=new rule("7-3-111","afga_viXi","\\w*[iu]$","\\w*","afga+Gi","sup+f-iw");r++;//GeH fiwi
	list_rule[r]=new rule("7-3-112","afga_viXi","\\w*","\\w*","afga+naxI","f-iw");r++;
	list_rule[r]=new rule("7-3-113", "afga_viXi", "\\w*A$", "\\w*", "afga+Abanwa", "f-iw");r++;
	list_rule[r]=new rule("7-3-114", "afga_viXi", "\\w*A$", "\\w*", "afga+Abanwa+sarvanAma", "f-iw");r++;
	list_rule[r]=new rule("7-3-116","afga_viXi","\\w*","\\w*i\\w*","afga+naxI","root(fi)");r++;
	list_rule[r]=new rule("7-3-116","afga_viXi","\\w*A$","\\w*i\\w*","afga+Abanwa","root(fi)");r++;
	list_rule[r]=new rule("7-3-116","afga_viXi","\\w*[nN]I$","\\w*","afga+ends(XAwu)","root(fi)");r++;	
	list_rule[r]=new rule("7-3-117", "afga_viXi", "\\w*[iu]$", "\\w*", "afga+naxI", "root(fi)");r++;
	list_rule[r]=new rule("7-3-118","afga_viXi","\\w*[iu]$","\\w*","afga+!naxI+!Gi","root(fi)");r++;	
	list_rule[r]=new rule("7-3-119","afga_viXi","\\w*[iu]$","\\w*","afga+Gi+!napuMsaka","root(fi)");r++;
	list_rule[r]=new rule("7-3-120","afga_viXi","\\w*","\\w*","afga+Gi+!swrI","root(tA)");r++;
	list_rule[r]=new rule("7-4-50","afga_viXi","\\w*wAs$","^s\\w*","root(wAsi)","root(tA)");r++;
	list_rule[r]=new rule("7-4-51","afga_viXi","\\w*","\\w*","afga+Gi+!swrI","root(tA)");r++;
	if(prakriyA.get_aByAsa(0).length()>0){
	    list_rule[r]=new rule("7-4-59","afga_viXi","\\w*","\\w*","aByAsa(","",belongs(prakriyA.words[0].charAt(find_firstvowel(prakriyA.get_aByAsa(0)))+"","AIUQ"));r++;
	}
	list_rule[r]=new rule("7-4-60","afga_viXi","\\w*","\\w*","aByAsa(","");r++;
	list_rule[r]=new rule("7-4-73","afga_viXi","\\w*","\\w*","root(BU)+aByAsa(","lit");r++;	
	//afga_viXi_rule triggerd_afga_viXi_rule[]=new afga_viXi_rule[15];
	rule winner=list_rule[0];
	rule runner=list_rule[0];
	rule keep_runner=list_rule[0];
	rule temp=list_rule[0];
	int winner_index=-1;
	rule not_again[]=new rule[10];
	int not_ag=0;
	boolean apply=false;
	int ind=0;
	for(int i=0;i<r;i++){
	    if(list_rule[i].condition(prakriyA,0)){
		rules[process_status]=list_rule[i].rule_number;
		process_status++;
		triggered_rule[ind]=list_rule[i];
		ind++;
	    }
	}
	if(belongs("anekAca",prakriyA.attrib_words[0])){
	    prakriyA.remove("anekAca",0);
	}
	if(belongs("asaMyoga",prakriyA.attrib_words[0])){
	    prakriyA.remove("asaMyoga",0);
	}
	if(belongs("@ends(BU)",prakriyA.attrib_words[0])){
	    prakriyA.remove("@ends(BU)",0);
	}
	int new_rule=0;
	if(afga_viXi_iter>0){
	    //System.out.println(prev_rules[afga_viXi_iter-1]+afga_viXi_iter+" 2950");
	    if(prev_rules[afga_viXi_iter-1].length()>0){
		for(int trig=0;trig<ind;trig++){
		    if(!(belongs(triggered_rule[trig].rule_number+" ",prev_rules[afga_viXi_iter-1]))){
			//System.out.println(triggered_rule[trig].rule_number+" 2954 "+prev_rules[afga_viXi_iter-1]);
			new_triggered_rule[new_rule]=triggered_rule[trig];
			//rules[process_status]=new_triggered_rule[new_rule].rule_number;
			//process_status++;
			new_rule++;
		    }
		    else if(belongs(triggered_rule[trig].rule_category,"saMhiwA|ekAxeSa")){
			//System.out.println(triggered_rule[trig].rule_number+" 2954 "+prev_rules[afga_viXi_iter-1]);
			new_triggered_rule[new_rule]=triggered_rule[trig];
			//rules[process_status]=new_triggered_rule[new_rule].rule_number;
			//process_status++;
			new_rule++;
		    }
		}
	    }
	    //System.out.println(new_rule+"2209");
	    if(new_rule>0){
		ind=new_rule;
		for(int trig=0;trig<new_rule;trig++){
		    triggered_rule[trig]=new_triggered_rule[trig];
		    rules[process_status]=triggered_rule[trig].rule_number;
		    process_status++;
		    //System.out.println(triggered_rule[trig].rule_number+"2215");
		}
	    }
	    else{
		//System.out.println("2218"+is_applied);
		input_DS[] output={prakriyA};
		return output;
	    }
	}
	if(ind>1){
	    //System.out.println(ind+"2228");
	    winner_index=0;
	    rule first=triggered_rule[0];
	    for(int i=0;i<ind-1;i++){	
		temp=superior(first,triggered_rule[i+1],prakriyA);
		//System.out.println(first.rule_number+" "+triggered_rule[i+1].rule_number+":::"+temp.rule_number);
		if((temp.rule_number)!=(first.rule_number)){
		    winner_index=i+1;
		    keep_runner=runner;
		    runner=first;
		}
		else{
		    if(!((temp.special.equals("niReXa"))||(temp.special.equals("niReXaviBARA")))){
			runner=triggered_rule[i+1];
			keep_runner=runner;
		    }
						
		}
		first=temp;
	    }
	    winner=first;
	    apply=true;
				
	}
	else if(ind==1){
	    winner_index=0;
	    winner=triggered_rule[0];
	    apply=true;
	}
	else{
	    winner=list_rule[0];//to prevent error, not for any use;
	}
	boolean is_ap=false;
	boolean is_niy=false;
	not_ag=0;
	if(winner_index>=0){
	    not_again[not_ag]=winner;
	    not_ag++;
	    if((winner.special.equals("niReXa"))||(winner.special.equals("niReXaviBARA"))){
		//if(is_apavAxa(winner,runner))
		//System.out.println("Very special "+winner.rule_number+" "+runner.rule_number+" "+keep_runner.rule_number);
		if(!(runner.rule_number.equals("default"))){
		    not_again[not_ag]=runner;not_ag++;
		}
		if(!(keep_runner.rule_number.equals("default"))){
		    not_again[not_ag]=keep_runner;not_ag++;
		}
		for(int ri=0;ri<winner_index;ri++){
		    if(!((triggered_rule[ri].rule_number.equals(runner.rule_number))||(triggered_rule[ri].rule_number.equals(keep_runner.rule_number)))){
			is_ap=false;
			is_niy=false;
			//try{
			is_ap=is_apavAxa(winner,triggered_rule[ri],prakriyA);
			//}
			//catch(Exception e){};
			if(is_ap){
			    not_again[not_ag]=triggered_rule[ri];not_ag++;
			}
			else{
			    try{
				is_niy=is_niyama(winner,triggered_rule[ri]);
			    }
			    catch(Exception e){};
			    if(is_niy){
				not_again[not_ag]=triggered_rule[ri];not_ag++;
			    }
			}
		    }
		}
						
		//if(is_apavAxa(winner,triggered_rule[ri]
	    }
	    else{
		for(int ri=0;ri<ind;ri++){
		    //if(triggered_rule[ri
		    //System.out.println(triggered_rule[ri].rule_number+" "+winner.rule_number);
		    if(!(triggered_rule[ri].rule_number.equals(winner.rule_number))){
			is_ap=false;
			is_niy=false;
			//System.out.println("apavAxa func"+winner.rule_number+triggered_rule[ri].rule_number);
			//try{
			is_ap=is_apavAxa(winner,triggered_rule[ri],prakriyA);
			//}
			//catch(Exception e){};
			if(is_ap){
			    //System.out.println("apavAxa found"+winner.rule_number+triggered_rule[ri].rule_number);
			    //not_again[not_ag]=triggered_rule[ri];not_ag++;
			}
			/*
			  else{
			  try{
			  is_niy=is_niyama(winner,triggered_rule[ri]);
			  }
			  catch(Exception e){};
			  if(is_niy){
			  //System.out.println("niyama found"+winner.rule_number+triggered_rule[ri].rule_number);
			  //not_again[not_ag]=triggered_rule[ri];not_ag++;
			  }
			  }
			*/
		    }
		}
	    }
	    if(afga_viXi_iter>0){
		prev_rules[afga_viXi_iter]=prev_rules[afga_viXi_iter-1];
	    }
	    else{
		prev_rules[afga_viXi_iter]="";
	    }
	    //System.out.println(prev_rules[afga_viXi_iter]+" "+afga_viXi_iter+"2307");
	    for(int trig=0;trig<not_ag;trig++){
		prev_rules[afga_viXi_iter]=prev_rules[afga_viXi_iter]+not_again[trig].rule_number+" ";
	    }
	    //System.out.println(prev_rules[afga_viXi_iter]+" "+afga_viXi_iter+"2310");
	}
				
			
	/*if(belongs("@ends(an)",prakriyA.attrib_words[0])){
	  prakriyA.remove("@ends(an)",0);
	  }*/
	if(apply){
	    afga_viXi_iter++;
	    is_applied=true;
	    boolean is_repeat=false;
	    /*for(int rr=0;rr<process_status;rr++){
	      if(rules[rr].equals(winner.rule_number)){
	      if(process[rr].length()>0){
	      boolean is_ap=false;
	      try{
	      is_ap=is_apavAxa(winner,runner);
	      }
	      catch(Exception e){};					if(is_ap){
	      if(keep_runner.rule_number.equals("default")){
	      is_applied=false;
	      input_DS[] output={prakriyA};
	      return output;
	      }
	      else{
	      winner=keep_runner;
	      }
	      }
	      else{
	      //System.out.println("No, he couldn't get default"+winner.rule_number);
	      if(runner.rule_number.equals("default")){
	      is_applied=false;
	      input_DS[] output={prakriyA};
	      return output;
	      }
	      winner=runner;
	      runner=keep_runner;
	      //if(prakriyA.get_output().equals(prev_target[rr])){
	      //System.out.println("The rule apprawyaya_saMjFA(prakriyA_output_prev[i].myclone());
	      if(i>0){plied again");
								
								
	      //System.out.println(winner.rule_number+" after change");
	      }
	      }
	      }
	      }
	      //if(!(is_repeat)){
	      */
					
	    //prev_target[process_status]=prakriyA.get_output();

	    if(winner.special=="niReXa"){
		//System.out.println(runner.rule_number+" "+keep_runf6-1-102ner.rule_number);
		if(keep_runner.rule_number!="default"){
		    prakriyA=keep_runner.apply_rule(prakriyA);
		    rules[process_status]=keep_runner.rule_number;
		    process[process_status]=keep_runner.rule_category;
		    instant_DS[process_status]=prakriyA.get_output();
		    process_status++;
		    input_DS[] output= {prakriyA};
		    return output;
		}
	    }
	    else if(winner.special=="viBARA"){
		input_DS clone_prakriyA=prakriyA.myclone();
		prakriyA=winner.apply_rule(prakriyA);
		//System.out.println("after applying"+prakriyA.get_output()+"another"+clone_prakriyA.get_output());
		rules[process_status]=winner.rule_number;
		process[process_status]=winner.rule_category;
		instant_DS[process_status]=prakriyA.get_output();
		process_status++;
		input_DS[] output= {prakriyA,clone_prakriyA};
		return output;
	    }
					
	    else if(winner.special=="niReXaviBARA"){
		input_DS clone_prakriyA=prakriyA.myclone();
		prakriyA=runner.apply_rule(prakriyA);
		rules[process_status]=runner.rule_number;
		process[process_status]=runner.rule_category;
		instant_DS[process_status]=prakriyA.get_output();
		process_status++;
		clone_prakriyA=keep_runner.apply_rule(clone_prakriyA);
		rules[process_status]=keep_runner.rule_number;
		process[process_status]=runner.rule_category;
		instant_DS[process_status]=prakriyA.get_output();
		process_status++;
		input_DS[] output= {prakriyA,clone_prakriyA};
		return output;
	    }
	    else{	
		boolean is_103=false;
		if(winner.rule_number.equals("6-1-102")){
		    if(belongs("root(Sas)",prakriyA.attrib_words[1])){//System.out.println("2430");
			if(belongs("puM",prakriyA.attrib_words[0])){//System.out.println("2431");
			    if(!belongs("napuMsaka",prakriyA.attrib_words[0])){//System.out.println("2432");
				is_103=true;
			    }
			}
		    }
		}											
		prakriyA=winner.apply_rule(prakriyA);
		rules[process_status]=winner.rule_number;
		process[process_status]=winner.rule_category;
		instant_DS[process_status]=prakriyA.get_output();
		process_status++;
		if(is_103){
							
		    prakriyA.words[0]=prakriyA.words[0].substring(0,prakriyA.words[0].length()-1)+"n";
		    rules[process_status]="6-1-103";
		    process[process_status]="ekAxeSa";
		    instant_DS[process_status]=prakriyA.get_output();
		    process_status++;
		}
		input_DS[] output= {prakriyA};
		return output;
	    }
	    //}
	}
			
	//input_DS[] tempp={prakriyA};
	input_DS[] output= {prakriyA};
	return output;
    }
    //=======Whatever a says, should be in b ,b has to be apavAxa b->praWamA|xviwIyA, a->sup==> b can be apavAxa==> we can explore a more in subsets=============================//
    public static boolean is_matched(String a_attr, String b_attr){
	boolean status=false;
	boolean match=false;
	//System.out.println("rAma+gf|hd".split("[+|]").length);
	//String a_attr="root(Si)";
	//String b_attr="sarvanAmasWAna+!sambuxXi";
	b_attr=b_attr.replace("afga+","").replace("afga","").replace("@root(","").replace("root(","").replace(")","");
	a_attr=a_attr.replace("afga+","").replace("afga","").replace("@root(","").replace("root(","").replace(")","");
	if(a_attr.length()==0){
	    //System.out.println("Returned at 3233");
	    return true;
	}
	else if(b_attr.length()==0){
	    //System.out.println("Returned at 3236");
	    return false;
	}
	if(a_attr.equals(b_attr)){
	    //System.out.println("Returned at 3239");
	    return true;
	}
	if(b_attr.length()>a_attr.length()){
	    if(b_attr.indexOf(a_attr)!=-1){
		//System.out.println("Returned at 3243");
		return true;
	    }
	}
	if(a_attr.length()>b_attr.length()){
	    if(a_attr.indexOf(b_attr)!=-1){
		//System.out.println("Returned at 3248");
		return false;
	    }
	}
	String all_a_attr[]=a_attr.split("[+]");
	//System.out.println(b_attr+" "+a_attr);
	gg:for(int pat=0;pat<all_a_attr.length;pat++){
	    status=false;
	    //System.out.println(all_a_attr[pat]+" "+b_attr+" 3254");
	    if(b_attr.indexOf(all_a_attr[pat])==-1){
		String all_a_attr_sub[]=all_a_attr[pat].split("[|]");
		for(int pata=0;pata<all_a_attr_sub.length;pata++){
		    status=false;
		    if(b_attr.indexOf(all_a_attr_sub[pata])!=-1){
			if(pat==all_a_attr.length-1){
			    //System.out.println("Returned at 3268");
			    return true;
			}
			else{
			    continue gg;
			}
		    }
		}
		inloop:for(int pata=0;pata<all_a_attr_sub.length;pata++){
		    String subs="";
		    if(subset(all_a_attr_sub[pata]).length()>0){
			subs=subs+subset(all_a_attr_sub[pata])+"|";
		    }
		    if(subs.length()>0){
			subs=subs.substring(0,subs.length()-1);
			//System.out.println(subs+" 3274 ");
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
				if(!((b_attr.indexOf("praWamA")!=-1)&&(subse[kk].equals("am")))){
				    //System.out.println("54");
				    match=true;
				    status=true;
				    //System.out.println("matched");
				    continue gg;
				}
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
	//System.out.println("Returned at 3333 "+status);
	return status;
    }
		
    public static boolean is_apavAxa(rule a, rule b,input_DS prakriyA){
	boolean status=true;
	input_DS clone_prakriyA=prakriyA.myclone();
	boolean is_a_env_change=false;
	boolean is_b_env_change=false;
	int tempp=process_status;
			
	//System.out.println(clone_prakriyA.get_output()+"489");
	clone_prakriyA=a.apply_rule(clone_prakriyA);
	//System.out.println(clone_prakriyA.get_output()+"491 after a");
	if(!(b.condition(clone_prakriyA,0))){
	    is_a_env_change=true;
	}
	clone_prakriyA=prakriyA.myclone();
	//System.out.println(clone_prakriyA.get_output()+"496");
	clone_prakriyA=b.apply_rule(clone_prakriyA);
	//System.out.println(clone_prakriyA.get_output()+"498 after b");
	if(!(a.condition(clone_prakriyA,0))){
	    is_b_env_change=true;
	}
	neutralize(tempp,process_status);
	process_status=tempp;
	//System.out.println(is_a_env_change+" "+is_b_env_change);
	if(!(is_a_env_change)){
	    if(!(is_b_env_change)){
		//System.out.println("Returned at 3082");
		return false;
	    }
	}

	String left_pat_a=a.lword_regex.replace("\\w*","").replace("$","").replace("^","");
	String left_pat_a_all[]=left_pat_a.split("[|]");
	String add_before="";
	String add_after="";
	String in_between="";
	String new_exp="";
	int no_brackets;
	for(int pat=0;pat<left_pat_a_all.length;pat++){
	    if(left_pat_a_all[pat].indexOf('[')!=-1){
		add_before=left_pat_a_all[pat].substring(0,left_pat_a_all[pat].indexOf('['));
		add_after=left_pat_a_all[pat].substring(left_pat_a_all[pat].lastIndexOf(']')+1);
		in_between=left_pat_a_all[pat].substring(left_pat_a_all[pat].indexOf('['),left_pat_a_all[pat].lastIndexOf(']')+1);
		no_brackets=in_between.split("\\]").length;
		String option[]=new String[no_brackets];
		for(int br=0;br<no_brackets;br++){
		    option[br]=in_between.substring(1,in_between.indexOf(']'));
		    if(in_between.indexOf('[',in_between.indexOf(']'))!=-1){
			in_between=in_between.substring(in_between.indexOf('[',in_between.indexOf(']')));
		    }
		    for(int all_op=0;all_op<option[br].length();all_op++){
			new_exp=new_exp+add_before+option[br].substring(all_op,all_op+1)+add_after+"|";
		    }
						
		}
		new_exp=new_exp.substring(0,new_exp.length()-1);
		//System.out.println(new_exp);
		String left_chk[]=new_exp.split("[|]");
		for(int chk=0;chk<left_chk.length;chk++){
		    if(!(Pattern.matches(b.lword_regex,left_chk[chk]))){
			status=false;
			//System.out.println("No apavAxa at 2556");
			return status;
						
		    }
		}	
	    }
	    else if(!(Pattern.matches(b.lword_regex,left_pat_a_all[pat]))){
		status=false;
		//System.out.println("No apavAxa at 2564");
		return status;
	    }
	}
	new_exp="";
	String right_pat_a=a.rword_regex.replace("\\w+","a").replace("\\w*","").replace("$","").replace("^","");
	String right_pat_a_all[]=right_pat_a.split("[|]");
	for(int pat=0;pat<right_pat_a_all.length;pat++){
	    if(right_pat_a_all[pat].indexOf('[')!=-1){
		add_before=right_pat_a_all[pat].substring(0,right_pat_a_all[pat].indexOf('['));
		add_after=right_pat_a_all[pat].substring(right_pat_a_all[pat].lastIndexOf(']')+1);
		in_between=right_pat_a_all[pat].substring(right_pat_a_all[pat].indexOf('['),right_pat_a_all[pat].lastIndexOf(']')+1);
		no_brackets=in_between.split("\\]").length;
		String option[]=new String[no_brackets];
		for(int br=0;br<no_brackets;br++){
		    option[br]=in_between.substring(1,in_between.indexOf(']'));
		    if(in_between.indexOf('[',in_between.indexOf(']'))!=-1){
			in_between=in_between.substring(in_between.indexOf('[',in_between.indexOf(']')));
		    }
		    for(int all_op=0;all_op<option[br].length();all_op++){
			new_exp=new_exp+add_before+option[br].substring(all_op,all_op+1)+add_after+"|";
		    }
						
		}
		new_exp=new_exp.substring(0,new_exp.length()-1);
		//System.out.println(new_exp);
		String right_chk[]=new_exp.split("[|]");
		for(int chk=0;chk<right_chk.length;chk++){
		    if(!(Pattern.matches(b.rword_regex,right_chk[chk]))){
			status=false;
			//System.out.println("No apavAxa at 2594"+b.rword_regex+right_chk[chk]);
			return status;
						
		    }
		}	
	    }
	    else if(!(Pattern.matches(b.rword_regex,right_pat_a_all[pat]))){
		status=false;
		//System.out.println("No apavAxa at 2602");
		return status;
	    }
	}
	if(!(is_matched(b.lword_attrib,a.lword_attrib))){
	    status=false;
	    //System.out.println("No apavAxa at 2608");
	    return status;
	}
	if(!(is_matched(b.rword_attrib,a.rword_attrib))){
	    status=false;
	    //System.out.println("No apavAxa at 2613");
	    return status;
	}
	return status;
    }
    //=======Function to check whether rule a is apavAxa of rule b=============================//
    //=======Function to check whether rule a is niyama of rule b=============================//
    public static boolean is_niyama(rule a, rule b)throws IOException{
	boolean status=true;
	BufferedReader read_input=new BufferedReader(new FileReader("rule_niyama"));
	String ss="";
	niyloop:while((ss=read_input.readLine())!=null){
	    if(ss.indexOf(a.rule_number)!=-1){
		if(ss.indexOf(b.rule_number)==-1){
		    status=false;
		    return status;
		}
		else{
		    status=true;
		    break niyloop;
		}
	    }
	}

	String left_pat_a=a.lword_regex.replace("\\w*","").replace("$","").replace("^","");
	String left_pat_a_all[]=left_pat_a.split("[|]");
	String add_before="";
	String add_after="";
	String in_between="";
	String new_exp="";
	int no_brackets;
	for(int pat=0;pat<left_pat_a_all.length;pat++){
	    if(left_pat_a_all[pat].indexOf('[')!=-1){
		add_before=left_pat_a_all[pat].substring(0,left_pat_a_all[pat].indexOf('['));
		add_after=left_pat_a_all[pat].substring(left_pat_a_all[pat].lastIndexOf(']')+1);
		in_between=left_pat_a_all[pat].substring(left_pat_a_all[pat].indexOf('['),left_pat_a_all[pat].lastIndexOf(']')+1);
		no_brackets=in_between.split("\\]").length;
		String option[]=new String[no_brackets];
		for(int br=0;br<no_brackets;br++){
		    option[br]=in_between.substring(1,in_between.indexOf(']'));
		    if(in_between.indexOf('[',in_between.indexOf(']'))!=-1){
			in_between=in_between.substring(in_between.indexOf('[',in_between.indexOf(']')));
		    }
		    for(int all_op=0;all_op<option[br].length();all_op++){
			new_exp=new_exp+add_before+option[br].substring(all_op,all_op+1)+add_after+"|";
		    }
						
		}
		new_exp=new_exp.substring(0,new_exp.length()-1);
		//System.out.println(new_exp);
		String left_chk[]=new_exp.split("[|]");
		for(int chk=0;chk<left_chk.length;chk++){
		    if(!(Pattern.matches(b.lword_regex,left_chk[chk]))){
			status=false;
			return status;
						
		    }
		}	
	    }
	    else if(!(Pattern.matches(b.lword_regex,left_pat_a_all[pat]))){
		status=false;
		return status;
	    }
	}
	new_exp="";
	String right_pat_a=a.rword_regex.replace("\\w*","").replace("$","").replace("^","");
	String right_pat_a_all[]=right_pat_a.split("[|]");
	for(int pat=0;pat<right_pat_a_all.length;pat++){
	    if(right_pat_a_all[pat].indexOf('[')!=-1){
		add_before=right_pat_a_all[pat].substring(0,right_pat_a_all[pat].indexOf('['));
		add_after=right_pat_a_all[pat].substring(right_pat_a_all[pat].lastIndexOf(']')+1);
		in_between=right_pat_a_all[pat].substring(right_pat_a_all[pat].indexOf('['),right_pat_a_all[pat].lastIndexOf(']')+1);
		no_brackets=in_between.split("\\]").length;
		String option[]=new String[no_brackets];
		for(int br=0;br<no_brackets;br++){
		    option[br]=in_between.substring(1,in_between.indexOf(']'));
		    if(in_between.indexOf('[',in_between.indexOf(']'))!=-1){
			in_between=in_between.substring(in_between.indexOf('[',in_between.indexOf(']')));
		    }
		    for(int all_op=0;all_op<option[br].length();all_op++){
			new_exp=new_exp+add_before+option[br].substring(all_op,all_op+1)+add_after+"|";
		    }
						
		}
		new_exp=new_exp.substring(0,new_exp.length()-1);
		//System.out.println(new_exp);
		String right_chk[]=new_exp.split("[|]");
		for(int chk=0;chk<right_chk.length;chk++){
		    if(!(Pattern.matches(b.rword_regex,right_chk[chk]))){
			status=false;
			return status;
						
		    }
		}	
	    }
	    else if(!(Pattern.matches(b.rword_regex,right_pat_a_all[pat]))){
		status=false;
		return status;
	    }
	}
	if(!(is_matched(b.lword_attrib,a.lword_attrib))){
	    status=false;
	    return status;
	}
	if(!(is_matched(b.rword_attrib,a.rword_attrib))){
	    status=false;
	    return status;
	}
	return status;
    }
    //=======Function to check whether rule a is niyama of rule b=============================//
			
    public static String subset(String input){
	String output="";	
	if((input.equals("sup"))||(input.equals("viBakwi"))){
	    output="praWamA|xviwIyA|wqwIyA|cawurWI|paFcamI|RaRTI|sapwamI";
	}
	else if(input.equals("praWamA")){
	    output="su,1|O|jas";
	}
	else if(input.equals("ekavacana")){
	    output="su,1|am";
	}
	else if(input.equals("wyaxAxi")){
	    output="wyax|wax|yax|ewax|ixam|axas|eka|xvi";
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
	    output="fi|os";
	}
	else if(input.equals("f-iw")){
	    output="fi|fas|fe|fasi,3";
	}
	else if(input.equals("sarvanAmasWAna")){
	    output="su,1|O|jas|am|Ot|Si";
	}
	return output;
    }
	
    //=======Function to check whether rule a is apavAxa of rule b=============================//
    //========To be simplified and made rigorous for all the rules==========================//
		
    //=======Function to check whether rule a is apavAxa of rule b=============================//

    //=======Function to check whether a rule has been applied=============================//
    public static boolean is_applied(String the_rule){
	for(int rr=0;rr<process_status;rr++){
	    if(rules[rr].equals(the_rule)){
		if(process[rr].length()>2){
		    return true;
		}
	    }
	}
	return false;
    }	
    //=======Function to check whether a rule has been applied=============================//
		
    //=======Function to check whether two strings are savarNa=============================//
    public static boolean is_savarNa(String a, String b){
	if(belongs(a,savarNa(b))){
	    return true;
	}
		
	return false;
    }	
    //=======Function to check whether two strings are savarNa=============================//
		
    //=======Function to find the savarNa of a letter=============================//
    public static String savarNa(String ch){//needs to be fully made for all the vowels at least.
	String output="";
	char to_chk=ch.charAt(0);
	switch(to_chk){
	case 'u':
	case 'U':
	    output="uU";
	    break;
	case 'a':
	case 'A':
	    output="aA";
	    break;
	case 'i':
	case 'I':
	    output="iI";
	    break;
	case 'q':
	case 'Q':
	    output="qQ";
	    break;
	default:
	    break;
	}
	return output;
    }		
    //=======Function to find the savarNa of a letter=============================//
		
}
