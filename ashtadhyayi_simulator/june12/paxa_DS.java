class paxa_DS{
	input_DS external_str=new input_DS("","");
	input_DS internal_str=new input_DS("","");
	
	paxa_DS(input_DS a, input_DS b){//attr should be separated by a ',' a,b,c
		external_str=a;
		internal_str=b;
	}
	
	String get_output(){ 
		// a method that will return the complete structure
		String output=external_str.get_output()+"("+internal_str.get_output()+")";		
		return output;
	}
	
	paxa_DS myclone(){
		input_DS ext_clone=external_str.myclone();
		input_DS int_clone=internal_str.myclone();
		paxa_DS output=new paxa_DS(ext_clone,int_clone);
		return output;
	}

}