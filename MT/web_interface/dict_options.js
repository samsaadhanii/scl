function showcontent(){
	var sel = "" ;
	$("#result").html("");
	$('#check :checked').each(function(){
		var dic = $(this).val();
				$.post("/cgi-bin/scl/MT/generate_and_print.cgi",{word:$("#word").val(),dic:dic,outencoding:$("#outencoding").val()},
		function(data){
		   sel = data;
		   $("#result").append(data);
		});
	});
//alert (sel);
}
