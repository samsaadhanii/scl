function callmorphanalyser(){
  var x = document.getElementById("encoding").value;
  var y = document.getElementById("morphword").value;
  if (avalidation(x,y) == 1){return false;}
  
  if($("#morphword").val()==""){
                       alert("कृपया किमपि एकं संस्कृतपदं प्रदत्तस्थले टङ्क्यताम्। तदनन्तरमेव नुद्यताम्। (Please Enter any Sanskrit word in the textbox and then submit.)");
                       return false;
               }
               else{
               		$("#output").html("कृपया प्रतीक्ष्यताम्....");
               		$.post("/cgi-bin/SCL_CGI/morph/morph.cgi",{"morfword":$("#morphword").val(),"encoding":$("#encoding").val(),"outencoding":$("#outencoding").val()},function(data){
               		
               			$("#output").html(data);
               		});
               	
               	return false;
               }
}

function callsandhi(){
  var x = document.getElementById("encoding").value;
  var t = document.getElementById("outencoding").value;
  var y = document.getElementById("text").value;
  var z = document.getElementById("text1").value;
  if (avalidation(x,y) == 1){return false;}
  if (avalidation(x,z) == 1){return false;}
  
if($("#text").val()==""){
                       alert("Please enter a word in the textbox.");
                       return false;
               }
               else{
               		$("#output").html("कृपया प्रतीक्ष्यताम्....");
               		$.post("/cgi-bin/SCL_CGI/sandhi/sandhi.cgi",{"text":$("#text").val(),"text1":$("#text1").val(),"encoding":$("#encoding").val(),"outencoding":$("#outencoding").val()},function(data){
               		
               			$("#output").html(data);
               		});
               	
               	return false;
               }
}

function callsandhisplitter(){
  var x = document.getElementById("encoding").value;
  var y = document.getElementById("word").value;
  var z = document.getElementById("outencoding").value;
  var w = document.getElementById("mode").value;
  if (avalidationwithspace(x,y) == 1){return false;}
  
if($("#word").val()==""){
                       alert("Please enter a word the in textbox.");
                       return false;
               }
               else{
               		$("#output").html("कृपया प्रतीक्ष्यताम्....");
               		$.post("/cgi-bin/SCL_CGI/sandhi_splitter/sandhi_splitter.cgi",{"word":$("#word").val(),"outencoding":$("#outencoding").val(),"encoding":$("#encoding").val(),"mode":$("#mode").val()},function(data){
               		
               			$("#output").html(data);
               		});
               	
               	return false;
               }
}

function callnoungen(){
  var x = document.getElementById("encoding").value;
  var y = document.getElementById("rt").value;
  if (avalidation(x,y) == 1){return false;}
  
if($("#rt").val()==""){
                       alert("Please enter a word the in textbox.");
                       return false;
               }
               else{
			
               		$("#output").html("कृपया प्रतीक्ष्यताम्....");
               		$.post("/cgi-bin/SCL_CGI/skt_gen/noun/noun_gen.cgi",{"rt":$("#rt").val(),"jAwi":$("#jAwi-opt").val(),"gen":$("#gen-opt").val(),"encoding":$("#encoding").val(),"outencoding":$("#outencoding").val(),"level":$("#level").val()},function(data){
               		
               			$("#output").html(data);
               		});
               	
               	return false;
               }
}

function callwaxXiwagen(){
  var x = document.getElementById("encoding").value;
  var y = document.getElementById("rt").value;
  if (avalidation(x,y) == 1){return false;}
  
if($("#rt").val()==""){
                       alert("Please enter the प्रातिपदिकम्");
                       return false;
               }
               else{

               		$("#output").html("कृपया प्रतीक्ष्यताम्....");
               		$.post("/cgi-bin/SCL_CGI/skt_gen/waxXiwa/waxXiwa_gen.cgi",{"rt":$("#rt").val(),"encoding":$("#encoding").val()},function(data){
               		
               			$("#output").html(data);
               		});
               	
               	return false;
               }
}

function callashtadhyayisimulator(){
  var x = document.getElementById("encoding").value;
  var y = document.getElementById("rt").value;
  if (avalidation(x,y) == 1){return false;}
  
  if($("#rt").val()==""){
                       alert("Please enter the प्रातिपदिकम्");
                       return false;
               }
               else{
               		$("#asht").html("कृपया प्रतीक्ष्यताम्....");
               		$.post("/cgi-bin/SCL_CGI/ashtadhyayi_simulator/simulation.cgi",{"praatipadika":$("#rt").val(),"vibhakti":$("#case").val(),"linga":$("#gender").val(),"vacana":$("#number").val(),"encoding":$("#encoding").val()},function(data){
               			$("#asht").html(data);
               		});
               	return false;
               }
}

// validation program start from here //


 function avalidation(encoding,word){
        var inputlang = encoding;
        var data = word;
        var stat = 0;
	var reguni=/[अआइईउऊऋॠऌएऐओऔअंअःकखगघङचछजझञटठडढणतथदधनपफबभमयरलवशषसह ्ािीुूृॄॢेैोौंःळ\-ऽ]/;
	var reg=/[aAiIuUqQlLeEoOMHzkKgGfcCjJFtTdDNwWxXnpPbBmyrlvSRshZ\-]/;
	var regitrans=/[aiuURiLIeoMH.Nkgh~NcChj~nThDtdpbmyrlvwGYsSA\^\-]/;
	var regslp=/[aAiIuUfFlxeEoOMHkKgGNcCqQjJwWQRtTdDnpPbBmyrlvSzsh\-]/;
	var regvel=/[aiurleomhkgncjtdpbyszv\~\"\?\-\_\.\,\!\-\']/;
	var regrom=/[aÃ„ÂiÃ„Â«uÃ…Â«Ã¡Â¹â€º?leoÃ¡Â¹Æ’Ã¡Â¸Â¥khgÃ¡Â¹â€¦cjÃƒÂ±Ã¡Â¹Â­Ã¡Â¸ÂÃ¡Â¹â€¡tdnpbmyrlvÃ…â€ºÃ¡Â¹Â£s\-]/;
	var regkh=/[aAiIuUlReaoMHkghGcjJTDNtdnpbmyrlvzSs\-]/;
	     	
	
		if(inputlang=="Unicode"){
			for(var i=0;i<data.length;i++){
			if(reguni.test(data[i])){
				
			}
			else{
				alert("Please check encoding notation and input text notation; the input text is not in Unicode Devanagari");
				stat = 1;
				return stat;
			}
			}
                 return stat;
		}
		else if(inputlang=="Itrans"){
			for(var i=0;i<data.length;i++){
				if(regitrans.test(data[i])){
				}
				else {
					alert("Please check encoding notation and input text notation; the input text is not in Itrans");
					stat = 1;
					return stat;
				}
			}
			
		 return stat;	
		}
		else if(inputlang=="SLP"){
			for(var i=0;i<data.length;i++){
                                if(regslp.test(data[i])){
                                }
                                else {
                                	alert("Please check encoding notation and input text notation; The input text is not in SLP");
                                       stat = 1;
					return stat;
                                }
                        }
		 return stat;	
      		}
		else if(inputlang=="roman"){
                        for(var i=0;i<data.length;i++){
                                if(regrom.test(data[i])){
                                }
                                else {	
                                	alert("Please check encoding notation and input text notation; the input text is not in roman");
                                        stat = 1;
					 return stat;
                                }
                        }
      
		 return stat;	
                }		

		else if(inputlang=="KH"){
                        for(var i=0;i<data.length;i++){
                                if(regkh.test(data[i])){
                                }
                                else {
                                	alert("Please check encoding notation and input text notation; the input tet is not in Harvard Kyoto");
                                        stat = 1;
					 return stat;
                                }
                        }
      
		 return stat;	
                }

		else if(inputlang=="VH"){
                        for(var i=0;i<data.length;i++){
                                if(regvel.test(data[i])){
                                }
                                else {
                                	alert("Please check encoding notation and input text notation; the input text is not in Velthuis-Huet");
                                        stat = 1;
					 return stat;
                                }
                        }
      
		 return stat;	
                }

		else if(inputlang=="WX"){
                        for(var i=0;i<data.length;i++){
                                if(reg.test(data[i])){ }
                                else {
                                	alert("Please check encoding notation and input text notation; the input text is not in WX");
                                        stat = 1;
					 return stat;
                                }
                        }
                       
		 return stat;	
                }
               
}
 function avalidationwithspace(encoding,word){
        var inputlang = encoding;
        var data = word;
        var stat = 0;
	var regunisp=/[ अआइईउऊऋॠऌएऐओऔअंअःकखगघङचछजझञटठडढणतथदधनपफबभमयरलवशषसह ्ािीुूृॄॢेैोौंःळ\-ऽ]/;
	var regsp=/[ aAiIuUqQlLeEoOMHzkKgGfcCjJFtTdDNwWxXnpPbBmyrlvSRshZ\-]/;
	var regitranssp=/[ aiuURiLIeoMH.Nkgh~NcChj~nThDtdpbmyrlvwGYsSA\^\-]/;
	var regslpsp=/[ aAiIuUfFlxeEoOMHkKgGNcCqQjJwWQRtTdDnpPbBmyrlvSzsh\-]/;
	var regvelsp=/[ aiurleomhkgncjtdpbyszv\~\"\?\-\_\.\,\!\-\']/;
	var regromsp=/[ aÃ„ÂiÃ„Â«uÃ…Â«Ã¡Â¹â€º?leoÃ¡Â¹Æ’Ã¡Â¸Â¥khgÃ¡Â¹â€¦cjÃƒÂ±Ã¡Â¹Â­Ã¡Â¸ÂÃ¡Â¹â€¡tdnpbmyrlvÃ…â€ºÃ¡Â¹Â£s\-]/;
	var regkhsp=/[ aAiIuUlReaoMHkghGcjJTDNtdnpbmyrlvzSs\-]/;
	     	
	
		if(inputlang=="Unicode"){
			for(var i=0;i<data.length;i++){
			if(regunisp.test(data[i])){
				
			}
			else{
				alert("Please check encoding notation and input text notation; the input text is not in Unicode Devanagari");
				stat = 1;
				return stat;
			}
			}
                 return stat;
		}
		else if(inputlang=="Itrans"){
			for(var i=0;i<data.length;i++){
				if(regitranssp.test(data[i])){
				}
				else {
					alert("Please check encoding notation and input text notation; the input text is not in Itrans");
					stat = 1;
					return stat;
				}
			}
			
		 return stat;	
		}
		else if(inputlang=="SLP"){
			for(var i=0;i<data.length;i++){
                                if(regslpsp.test(data[i])){
                                }
                                else {
                                	alert("Please check encoding notation and input text notation; The input text is not in SLP");
                                       stat = 1;
					return stat;
                                }
                        }
		 return stat;	
      		}
		else if(inputlang=="roman"){
                        for(var i=0;i<data.length;i++){
                                if(regromsp.test(data[i])){
                                }
                                else {	
                                	alert("Please check encoding notation and input text notation; the input text is not in roman");
                                        stat = 1;
					 return stat;
                                }
                        }
      
		 return stat;	
                }		

		else if(inputlang=="KH"){
                        for(var i=0;i<data.length;i++){
                                if(regkhsp.test(data[i])){
                                }
                                else {
                                	alert("Please check encoding notation and input text notation; the input tet is not in Harvard Kyoto");
                                        stat = 1;
					 return stat;
                                }
                        }
      
		 return stat;	
                }

		else if(inputlang=="VH"){
                        for(var i=0;i<data.length;i++){
                                if(regvelsp.test(data[i])){
                                }
                                else {
                                	alert("Please check encoding notation and input text notation; the input text is not in Velthuis-Huet");
                                        stat = 1;
					 return stat;
                                }
                        }
      
		 return stat;	
                }

		else if(inputlang=="WX"){
                        for(var i=0;i<data.length;i++){
                                if(regsp.test(data[i])){ }
                                else {
                                	alert("Please check encoding notation and input text notation; the input text is not in WX");
                                        stat = 1;
					 return stat;
                                }
                        }
                       
		 return stat;	
                }
               
}
 
function SandhiClear(){
       $(".output").html("");
       $("#text").val("");$("#text1").val("");
}

function show_prakriyA(encod,prAwi,viBakwi,lifga,vacana){
window.open('/cgi-bin/SCL_CGI/ashtadhyayi_simulator/simulation.cgi?encoding='+encod+'&praatipadika='+prAwi+'&vibhakti='+viBakwi+'&linga='+lifga+'&vacana='+vacana+'','popUpWindow','height=500,width=400,left=100,top=100,resizable=yes,scrollbars=yes,toolbar=yes,menubar=no,location=no,directories=no, status=yes',"dhellw").focus();
}
