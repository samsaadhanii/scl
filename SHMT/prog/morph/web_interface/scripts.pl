sub printscripts{

print "<script>
function analyse_noun_forms(encod,word){
  window.open('/cgi-bin/scl/morph/morph.cgi?encoding='+encod+'&morfword='+word+'','popUpWindow','height=200,width=600,left=100,top=100,resizable=yes,scrollbars=yes,toolbar=yes,menubar=no,location=no,directories=no, status=yes').focus();}

function generate_any_noun_forms(encod,prAwi,lifga,jAwi,level){
  window.open('/cgi-bin/scl/skt_gen/noun/noun_gen.cgi?encoding='+encod+'&rt='+prAwi+'&gen='+lifga+'&jAwi='+jAwi+'&level='+level+'','popUpWindow','height=500,width=400,left=100,top=100,resizable=yes,scrollbars=yes,toolbar=yes,menubar=no,location=no,directories=no, status=yes').focus();
}

function generate_noun_forms(encod,prAwi,lifga){
 window.open('/cgi-bin/scl/amarakosha/noun_gen.cgi?encoding='+encod+'&rt='+prAwi+'&gen='+lifga+'&jAwi=nA'+'&level=1'+'','popUpWindow','height=500,width=400,left=100,top=100,resizable=yes,scrollbars=yes,toolbar=yes,menubar=no,location=no,directories=no, status=yes').focus();
}

function generate_kqw_forms(encod,vb,upasarga){
  window.open('/cgi-bin/scl/skt_gen/kqw/kqw_gen.cgi?encoding='+encod+'&vb='+vb+'&upasarga='+upasarga+'','popUpWindow','height=500,width=400,left=100,top=100,resizable=yes,scrollbars=yes,toolbar=yes,menubar=no,location=no,directories=no, status=yes').focus();
}\n

function generate_waxXiwa_forms(encod,rt,gen){
  window.open('/cgi-bin/scl/skt_gen/waxXiwa/waxXiwa_gen.cgi?encoding='+encod+'&rt='+rt+'&gen='+gen+'','popUpWindow','height=500,width=400,left=100,top=100,resizable=yes,scrollbars=yes,toolbar=yes,menubar=no,location=no,directories=no, status=yes').focus();
}\n

function generate_verb_forms(encod,rt,prayoga,upasarga,paxI){
  window.open('/cgi-bin/scl/skt_gen/verb/verb_gen.cgi?encoding='+encod+'&vb='+rt+'&prayoga-paxI='+prayoga+'-'+paxI+'&upasarga='+upasarga+'','popUpWindow','height=500,width=800,left=100,top=100,resizable=yes,scrollbars=yes,toolbar=yes,menubar=no,location=no,directories=no, status=yes').focus();
}\n

function show(word,encod){
  window.open('/cgi-bin/scl/SHMT/options1.cgi?word='+word+'&outencoding='+encod+'','popUpWindow','height=500,width=400,left=100,top=100,resizable=yes,scrollbars=yes,toolbar=no,menubar=no,location=no,directories=no, status=yes').focus(); } 


</script>\n";
}
1;
