/*
#  Copyright (C) 2010-2012 Karunakar 2013-14 Amba Kulkarni
#
#  This program is free software; you can redistribute it and/or
#  modify it under the terms of the GNU General Public License
#  as published by the Free Software Foundation; either
#  version 2 of the License, or (at your option) any later
#  version.
#
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with this program; if not, write to the Free Software
#  Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
*/
function validation() {
var src = $("#source").val();
var srclang = $("#srclang").val();
var tarlang = $("#tarlang").val();
var data="";
//src=src.replace(/\n/g,' ');
//src=src.replace(/\t/g,' ');
if(srclang=="1" || tarlang=="1"){
	alert("Please select the source and traget transliteration schemes");
	return false;
}
else if(src == "") {
	alert("Please enter some text to transliterate.");
	return false;
}

else if(srclang == tarlang){
	alert("Both the source and target schemes are the same");
	return false;
}
else if(srclang!="1" && tarlang!="1" && src!=""){

	var reg=/[aAiIuUqQlLeEoOMHzkKgGfcCjJFtTdDNwWxXnpPbBmyrlvSRshZ \.\?\n \t,]/;
        var reguni=/[अआइईउऊऋॠऌएऐओऔअंअःकखगघङचछजझञटठडढणतथदधनपफबभमयरलवशषसह ्ा्ािीुूृॄॢेैोौंः \-\_\\_[\]\(\)\? \.\,\!\"\'\`\+\/\|।॥ऽ०१२३४५६७८९\n\tऽ]/;
        var regitrans=/[AaiuURiLIeoMH.Nkgh~NcChjnThDtdpbmyrlvsS \?\-\_\.\,\!\^\n\t]/;
        var regslp=/[aAiIuUfFlxeEoOMHkKgGNcCqQjJwWQRtTdDnpPbBmyYrlvSzsh \~\?\-\_\.\,\!\n\t]/;
        var regvel=/[faiurleomhkgncjtdpbyszv \~\"\?\-\_\.\,\!\n\t]/;
        var regrom=/[aāiīuūṛleaioauṃḥ?khgṅcjñṭḍṇtdnpbmyrlvśṣsIṝḷ \?\-\_\.\,\!\n\t]/;
        var regkh=/[aAiIuUReaoMHkghGcCfjJTDNtdnpbmyrlLvzSs \?\-\_\.\,\!\n\t]/;

	
	if(srclang=="Unicode-Devanagari"){//<![CDATA[
			for(var i=0;i<src.length;i++){
			if(reguni.test(src[i])){
				
			}
			else{
				alert("Please check encoding notation and input text notation");
				return false;
			}
			}//]]>
		}
		else if(srclang=="Itrans"){//<![CDATA[
			for(var i=0;i<src.length;i++){
				if(regitrans.test(src[i])){
				}
				else {
					alert("Please check encoding notation and input text notation");
					return false;
				}
			}//]]>
			
		}
		else if(srclang=="SLP"){//<![CDATA[
			for(var i=0;i<src.length;i++){
                                if(regslp.test(src[i])){
                                }
                                else {
                                	alert("Please check encoding notation and input text notation");
                                        return false;
                                }
                        }//]]>
      		}

		else if(srclang=="Unicode Roman Diacritic"){//<![CDATA[
                        for(var i=0;i<src.length;i++){
                                if(regrom.test(src[i])){
                                }
                                else {	
                                	alert("Please check encoding notation and input text notation");
                                        return false;
                                }
                        }//]]>
      
                }		

		else if(srclang=="Kyoto-Harvard"){//<![CDATA[
                        for(var i=0;i<src.length;i++){
                                if(regkh.test(src[i])){
                                }
                                else {
                                	alert("Please check encoding notation and input text notation");
                                        return false;
                                }
                        }//]]>
      
                }

		else if(srclang=="Velthuis"){//<![CDATA[
                        for(var i=0;i<src.length;i++){
                                if(regvel.test(src[i])){
                                }
                                else {
                                	alert("Please check encoding notation and input text notation");
                                        return false;
                                }
                        }//]]>
      
                }

		else if(srclang=="WX-Alphabetic"){//<![CDATA[
                        for(var i=0;i<src.length;i++){
                                if(reg.test(src[i])){
                                }
                                else {
                                	alert("Please check encoding notation and input text notation");
                                        return false;
                                }
                        }//]]>
                       
                }
	
$.post("/cgi-bin/SCL_CGI/transliteration/transliterate.cgi",{'src':src,'srclang':srclang,'tarlang':tarlang},function(data){
$("#target").html(data);

});
}


}
function set() {
document.getElementById("target").innerHTML="";
document.getElementById("source").value="";
document.getElementById("srclang").value="1";
document.getElementById("tarlang").value="1";
}
