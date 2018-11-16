function showcontent(val){
	var sel = "" ;
	$("#result").html("");
	$('#check :checked').each(function(){
		var dic = $(this).val();
		$.get("generate.cgi",{dic:dic,word:$("#word").val()},
		function(data){
		sel = sel+data;
		$("#result").append(data);
		});
	});
	//alert(sel);
}
