   function samAsaprakAracgi() {
    $("#output1").html("");
    $("#output2").html("");
    $("#output3").html("");
    $("#output4").html("");
    $("#output5").html("");
    $("#output6").html("");
    $("#output7").html("");
    $.post("/cgi-bin/SCL_CGI/skt_gen/compounds/samAsaprakAra.cgi",{encoding:$("#encoding").val(),vigraha:$("#vigraha_vAkya").val()},function(data,status){
       $("#output1").html(data)
    });
    return false;
   };
   function samasaprakaraexpertcgi() {
    $("#output1").html("");
    $("#output2").html("");
    $("#output3").html("");
    $("#output4").html("");
    $("#output5").html("");
    $("#output6").html("");
    $("#output7").html("");
    $.post("/cgi-bin/SCL_CGI/skt_gen/compounds/samasaprakaraexpert.cgi",{input_encoding:$("#input_encoding").val(),output_encoding:$("#output_encoding").val(),pratipadika1:$("#pratipadika1").val(),pratyaya1:$("#pratyaya1").val(),pratipadika2:$("#pratipadika2").val(),pratyaya2:$("#pratyaya2").val(),viXAyakasUwra:$("#viXAyakasUwra").val()},function(data,status){
       $("#output1").html(data)
    });
    return false;
   };


   function samAsAnwayescgi() {
      $.post("/cgi-bin/SCL_CGI/skt_gen/compounds/samAsAnwa.cgi",{encodingsamAsAnwa:$("#encodingsamAsAnwa").val(),vigrahasamAsAnwa:$("#vigrahasamAsAnwa").val(), p1samAsAnwa:$("#p1samAsAnwa").val(), p2samAsAnwa:$("#p2samAsAnwa").val(), s1samAsAnwa:$("#s1samAsAnwa").val(), s2samAsAnwa:$("#s2samAsAnwa").val(), viXAyakasUwrasamAsAnwa:$("#viXAyakasUwrasamAsAnwa").val(), samAsaprakArasamAsAnwa:$("#samAsaprakArasamAsAnwa").val(), samAsAnwa:$("#samAsAnwa").val(), sUwrasamAsAnwa:$("#sUwrasamAsAnwa").val(),anssamAsAnwa:'Yes'},function(data,status){
        $("#output2").html(data)
    });
    return false;
   };

   function samAsAnwanocgi() {
      $.post("/cgi-bin/SCL_CGI/skt_gen/compounds/samAsAnwa.cgi",{encodingsamAsAnwa:$("#encodingsamAsAnwa").val(),vigrahasamAsAnwa:$("#vigrahasamAsAnwa").val(), p1samAsAnwa:$("#p1samAsAnwa").val(), p2samAsAnwa:$("#p2samAsAnwa").val(), s1samAsAnwa:$("#s1samAsAnwa").val(), s2samAsAnwa:$("#s2samAsAnwa").val(), viXAyakasUwrasamAsAnwa:$("#viXAyakasUwrasamAsAnwa").val(), samAsaprakArasamAsAnwa:$("#samAsaprakArasamAsAnwa").val(), samAsAnwa:$("#samAsAnwa").val(), sUwrasamAsAnwa:$("#sUwrasamAsAnwa").val(),anssamAsAnwa:'No'},function(data,status){
        $("#output2").html(data)
    });
    return false;
   };

   function samAsAnwaNullcgi() {
      $.post("/cgi-bin/SCL_CGI/skt_gen/compounds/samAsAnwa.cgi",{encodingsamAsAnwa:$("#encodingsamAsAnwa").val(),vigrahasamAsAnwa:$("#vigrahasamAsAnwa").val(), p1samAsAnwa:$("#p1samAsAnwa").val(), p2samAsAnwa:$("#p2samAsAnwa").val(), s1samAsAnwa:$("#s1samAsAnwa").val(), s2samAsAnwa:$("#s2samAsAnwa").val(), viXAyakasUwrasamAsAnwa:$("#viXAyakasUwrasamAsAnwa").val(), samAsaprakArasamAsAnwa:$("#samAsaprakArasamAsAnwa").val(), samAsAnwa:$("#samAsAnwa").val(), sUwrasamAsAnwa:$("#sUwrasamAsAnwa").val(),anssamAsAnwa:'NULL'},function(data,status){
      $("#output2").html(data)
    });
    return false;
   };

   function pUrvanipAwayescgi() {
      $.post("/cgi-bin/SCL_CGI/skt_gen/compounds/pUrvanipAwa.cgi",{encodingpUrvanipAwa:$("#encodingpUrvanipAwa").val(),vigrahapUrvanipAwa:$("#vigrahapUrvanipAwa").val(), p1pUrvanipAwa:$("#p1pUrvanipAwa").val(), p2pUrvanipAwa:$("#p2pUrvanipAwa").val(), s1pUrvanipAwa:$("#s1pUrvanipAwa").val(), s2pUrvanipAwa:$("#s2pUrvanipAwa").val(), viXAyakasUwrapUrvanipAwa:$("#viXAyakasUwrapUrvanipAwa").val(), samAsaprakArapUrvanipAwa:$("#samAsaprakArapUrvanipAwa").val(), samAsAnwapUrvanipAwa:$("#samAsAnwapUrvanipAwa").val(), positionpUrvanipAwa:$("#positionpUrvanipAwa").val(),sUwrapUrvanipAwa:$("#sUwrapUrvanipAwa").val(),dividpUrvanipAwa:$("#dividpUrvanipAwa").val(),anspUrvanipAwa:'Yes'},function(data,status){
      var x = $("#dividpUrvanipAwa").val();
      $(x).html(data)
    });
    return false;
   };

   function pUrvanipAwanocgi() {
      $.post("/cgi-bin/SCL_CGI/skt_gen/compounds/pUrvanipAwa.cgi",{encodingpUrvanipAwa:$("#encodingpUrvanipAwa").val(),vigrahapUrvanipAwa:$("#vigrahapUrvanipAwa").val(), p1pUrvanipAwa:$("#p1pUrvanipAwa").val(), p2pUrvanipAwa:$("#p2pUrvanipAwa").val(), s1pUrvanipAwa:$("#s1pUrvanipAwa").val(), s2pUrvanipAwa:$("#s2pUrvanipAwa").val(), viXAyakasUwrapUrvanipAwa:$("#viXAyakasUwrapUrvanipAwa").val(), samAsaprakArapUrvanipAwa:$("#samAsaprakArapUrvanipAwa").val(), samAsAnwapUrvanipAwa:$("#samAsAnwapUrvanipAwa").val(), positionpUrvanipAwa:$("#positionpUrvanipAwa").val(),sUwrapUrvanipAwa:$("#sUwrapUrvanipAwa").val(),dividpUrvanipAwa:$("#dividpUrvanipAwa").val(),anspUrvanipAwa:'No'},function(data,status){
      // var x = $("#sUwra").val();
      // alert(x);
      var x = $("#dividpUrvanipAwa").val();
      $(x).html(data)
    });
    return false;
   };

   function pUrvanipAwaNullcgi() {
      $.post("/cgi-bin/SCL_CGI/skt_gen/compounds/pUrvanipAwa.cgi",{encodingpUrvanipAwa:$("#encodingpUrvanipAwa").val(),vigrahapUrvanipAwa:$("#vigrahapUrvanipAwa").val(), p1pUrvanipAwa:$("#p1pUrvanipAwa").val(), p2pUrvanipAwa:$("#p2pUrvanipAwa").val(), s1pUrvanipAwa:$("#s1pUrvanipAwa").val(), s2pUrvanipAwa:$("#s2pUrvanipAwa").val(), viXAyakasUwrapUrvanipAwa:$("#viXAyakasUwrapUrvanipAwa").val(), samAsaprakArapUrvanipAwa:$("#samAsaprakArapUrvanipAwa").val(), samAsAnwapUrvanipAwa:$("#samAsAnwapUrvanipAwa").val(), positionpUrvanipAwa:$("#positionpUrvanipAwa").val(),sUwrapUrvanipAwa:$("#sUwrapUrvanipAwa").val(),dividpUrvanipAwa:$("#dividpUrvanipAwa").val(),anspUrvanipAwa:'NULL'},function(data,status){
      // var x = $("#sUwra").val();
      // alert(x);
      var x = $("#dividpUrvanipAwa").val();
      $(x).html(data)
    });
    return false;
   };
//
   function upasarjanayescgi() {
      $.post("/cgi-bin/SCL_CGI/skt_gen/compounds/upasarjana.cgi",{encodingupasarjana:$("#encodingupasarjana").val(),vigrahaupasarjana:$("#vigrahaupasarjana").val(), p1upasarjana:$("#p1upasarjana").val(), p2upasarjana:$("#p2upasarjana").val(), s1upasarjana:$("#s1upasarjana").val(), s2upasarjana:$("#s2upasarjana").val(), viXAyakasUwraupasarjana:$("#viXAyakasUwraupasarjana").val(), samAsaprakAraupasarjana:$("#samAsaprakAraupasarjana").val(), samAsAnwaupasarjana:$("#samAsAnwaupasarjana").val(), positionupasarjana:$("#positionupasarjana").val(),dividupasarjana:$("#dividupasarjana").val(),upacond:$("#upacond").val(),ansupasarjana:'Yes'},function(data,status){
      var x = $("#dividupasarjana").val();
      $(x).html(data)
    });
    return false;
   };

   function upasarjananocgi() {
      $.post("/cgi-bin/SCL_CGI/skt_gen/compounds/upasarjana.cgi",{encodingupasarjana:$("#encodingupasarjana").val(),vigrahaupasarjana:$("#vigrahaupasarjana").val(), p1upasarjana:$("#p1upasarjana").val(), p2upasarjana:$("#p2upasarjana").val(), s1upasarjana:$("#s1upasarjana").val(), s2upasarjana:$("#s2upasarjana").val(), viXAyakasUwraupasarjana:$("#viXAyakasUwraupasarjana").val(), samAsaprakAraupasarjana:$("#samAsaprakAraupasarjana").val(), samAsAnwaupasarjana:$("#samAsAnwaupasarjana").val(), positionupasarjana:$("#positionupasarjana").val(),dividupasarjana:$("#dividupasarjana").val(),upacond:$("#upacond").val(),ansupasarjana:'No'},function(data,status){
         var x = $("#dividupasarjana").val();
         $(x).html(data)
    });
    return false;
 };

   function upasarjananocontcgi() {
      $.post("/cgi-bin/SCL_CGI/skt_gen/compounds/upasarjana.cgi",{encodingupasarjana:$("#encodingupasarjana").val(),vigrahaupasarjana:$("#vigrahaupasarjana").val(), p1upasarjana:$("#p1upasarjana").val(), p2upasarjana:$("#p2upasarjana").val(), s1upasarjana:$("#s1upasarjana").val(), s2upasarjana:$("#s2upasarjana").val(), viXAyakasUwraupasarjana:$("#viXAyakasUwraupasarjana").val(), samAsaprakAraupasarjana:$("#samAsaprakAraupasarjana").val(), samAsAnwaupasarjana:$("#samAsAnwaupasarjana").val(), positionupasarjana:$("#positionupasarjana").val(),dividupasarjana:$("#dividupasarjana").val(),upacond:$("#upacond").val(),ansupasarjana:'NoCont',p1utf:$("#p1utf").val(), p2utf:$("#p2utf").val()},function(data,status){
      var x = $("#upacond").val();
        var p2 = $("#p2utf").val();
        var p1 = $("#p1utf").val();
        var q = "किं  " +  p2 + " पदं " +p1 + "पदस्य  " + x + " वा(Y/N)?" ;
        var r = confirm(q);
        if (r == true) {
           var x = $("#dividupasarjana").val();
           $(x).html(data)
        } else {
          alert("असामर्थ्यात् समासो न");
        }
    });
    return false;
   };

   function upasarjanaNullcgi() {
      $.post("/cgi-bin/SCL_CGI/skt_gen/compounds/upasarjana.cgi",{encodingupasarjana:$("#encodingupasarjana").val(),vigrahaupasarjana:$("#vigrahaupasarjana").val(), p1upasarjana:$("#p1upasarjana").val(), p2upasarjana:$("#p2upasarjana").val(), s1upasarjana:$("#s1upasarjana").val(), s2upasarjana:$("#s2upasarjana").val(), viXAyakasUwraupasarjana:$("#viXAyakasUwraupasarjana").val(), samAsaprakAraupasarjana:$("#samAsaprakAraupasarjana").val(), samAsAnwaupasarjana:$("#samAsAnwaupasarjana").val(), positionupasarjana:$("#positionupasarjana").val(),dividupasarjana:$("#dividupasarjana").val(),upacond:$("#upacond").val(),ansupasarjana:'NULL'},function(data,status){
      // var x = $("#samAsAnwaupasarjana").val();
      // alert(x);
      var x = $("#dividupasarjana").val();
      $(x).html(data)
    });
    return false;
   };

   function gawiyescgi() {
      $.post("/cgi-bin/SCL_CGI/skt_gen/compounds/gawi.cgi",{encodinggawi:$("#encodinggawi").val(),vigrahagawi:$("#vigrahagawi").val(), p1gawi:$("#p1gawi").val(), p2gawi:$("#p2gawi").val(), s1gawi:$("#s1gawi").val(), s2gawi:$("#s2gawi").val(), viXAyakasUwragawi:$("#viXAyakasUwragawi").val(), samAsaprakAragawi:$("#samAsaprakAragawi").val(), samAsAnwagawi:$("#samAsAnwagawi").val(), positiongawi:$("#positiongawi").val(),gawisUwra:$("#gawisUwra").val(),ansgawi:'Yes'},function(data,status){
      $("#output3").html(data)
    });
    return false;
   };

   function gawinocgi() {
      $.post("/cgi-bin/SCL_CGI/skt_gen/compounds/gawi.cgi",{encodinggawi:$("#encodinggawi").val(),vigrahagawi:$("#vigrahagawi").val(), p1gawi:$("#p1gawi").val(), p2gawi:$("#p2gawi").val(), s1gawi:$("#s1gawi").val(), s2gawi:$("#s2gawi").val(), viXAyakasUwragawi:$("#viXAyakasUwragawi").val(), samAsaprakAragawi:$("#samAsaprakAragawi").val(), samAsAnwagawi:$("#samAsAnwagawi").val(), positiongawi:$("#positiongawi").val(),gawisUwra:$("#gawisUwra").val(),ansgawi:'No'},function(data,status){
      $("#output3").html(data)
    });
    return false;
   };

   function gawiNullcgi() {
      $.post("/cgi-bin/SCL_CGI/skt_gen/compounds/gawi.cgi",{encodinggawi:$("#encodinggawi").val(),vigrahagawi:$("#vigrahagawi").val(), p1gawi:$("#p1gawi").val(), p2gawi:$("#p2gawi").val(), s1gawi:$("#s1gawi").val(), s2gawi:$("#s2gawi").val(), viXAyakasUwragawi:$("#viXAyakasUwragawi").val(), samAsaprakAragawi:$("#samAsaprakAragawi").val(), samAsAnwagawi:$("#samAsAnwagawi").val(), positiongawi:$("#positiongawi").val(),gawisUwra:$("#gawisUwra").val(),ansgawi:'NULL'},function(data,status){
      $("#output3").html(data)
    });
    return false;
   };

   function alukyescgi() {
      $.post("/cgi-bin/SCL_CGI/skt_gen/compounds/aluk.cgi",{encodingaluk:$("#encodingaluk").val(),p1aluk:$("#p1aluk").val(), p2aluk:$("#p2aluk").val(), s1aluk:$("#s1aluk").val(), s2aluk:$("#s2aluk").val(), samAsaprakAraaluk:$("#samAsaprakAraaluk").val(), samAsAnwaaluk:$("#samAsAnwaaluk").val(), alukviBARA:$("#alukviBARA").val(),sUwraaluk:$("#sUwraaluk").val(),dividaluk:$("#dividaluk").val(),ansaluk:'Yes'},function(data,status){
      var x = $("#dividaluk").val();
      $(x).html(data)
    });
    return false;
   };

   function aluknocgi() {
      $.post("/cgi-bin/SCL_CGI/skt_gen/compounds/aluk.cgi",{encodingaluk:$("#encodingaluk").val(),p1aluk:$("#p1aluk").val(), p2aluk:$("#p2aluk").val(), s1aluk:$("#s1aluk").val(), s2aluk:$("#s2aluk").val(), samAsaprakAraaluk:$("#samAsaprakAraaluk").val(), samAsAnwaaluk:$("#samAsAnwaaluk").val(), alukviBARA:$("#alukviBARA").val(),sUwraaluk:$("#sUwraaluk").val(),dividaluk:$("#dividaluk").val(),ansaluk:'No'},function(data,status){
      var x = $("#dividaluk").val();
      $(x).html(data)
    });
    return false;
   };

   function alukNullcgi() {
      $.post("/cgi-bin/SCL_CGI/skt_gen/compounds/aluk.cgi",{encodingaluk:$("#encodingaluk").val(),p1aluk:$("#p1aluk").val(), p2aluk:$("#p2aluk").val(), s1aluk:$("#s1aluk").val(), s2aluk:$("#s2aluk").val(), samAsaprakAraaluk:$("#samAsaprakAraaluk").val(), samAsAnwaaluk:$("#samAsAnwaaluk").val(), alukviBARA:$("#alukviBARA").val(),sUwraaluk:$("#sUwraaluk").val(),dividaluk:$("#dividaluk").val(),ansaluk:'NULL'},function(data,status){
      var x = $("#dividaluk").val();
      $(x).html(data)
    });
    return false;
   }

   function pUrvapaxayescgi() {
      $.post("/cgi-bin/SCL_CGI/skt_gen/compounds/pUrvapaxa.cgi",{encodingpUrva:$("#encodingpUrva").val(),p1pUrva:$("#p1pUrva").val(), p2pUrva:$("#p2pUrva").val(), samAsaprakArapUrva:$("#samAsaprakArapUrva").val(), samAsAnwapUrva:$("#samAsAnwapUrva").val(), sUwrastrpUrva:$("#sUwrastrpUrva").val(),strmodpUrva:$("#strmodpUrva").val(),strunmodpUrva:$("#strunmodpUrva").val(),dividpUrva:$("#dividpUrva").val(),anspUrva:'Yes'},function(data,status){
      var x = $("#dividpUrva").val();
      $(x).html(data)
    });
    return false;
   };

   function pUrvapaxanocgi() {
      $.post("/cgi-bin/SCL_CGI/skt_gen/compounds/pUrvapaxa.cgi",{encodingpUrva:$("#encodingpUrva").val(),p1pUrva:$("#p1pUrva").val(), p2pUrva:$("#p2pUrva").val(), samAsaprakArapUrva:$("#samAsaprakArapUrva").val(), samAsAnwapUrva:$("#samAsAnwapUrva").val(), sUwrastrpUrva:$("#sUwrastrpUrva").val(),strmodpUrva:$("#strmodpUrva").val(),strunmodpUrva:$("#strunmodpUrva").val(),dividpUrva:$("#dividpUrva").val(),anspUrva:'No'},function(data,status){
      var x = $("#dividpUrva").val();
      $(x).html(data)
    });
    return false;
   };

   function pUrvapaxaNullcgi() {
      // alert("In pUrvapaxaNullcgi");
      // var x = $("#samAsAnwapUrva").val();
      // alert(x);
      $.post("/cgi-bin/SCL_CGI/skt_gen/compounds/pUrvapaxa.cgi",{encodingpUrva:$("#encodingpUrva").val(),p1pUrva:$("#p1pUrva").val(), p2pUrva:$("#p2pUrva").val(), samAsaprakArapUrva:$("#samAsaprakArapUrva").val(), samAsAnwapUrva:$("#samAsAnwapUrva").val(), sUwrastrpUrva:$("#sUwrastrpUrva").val(),strmodpUrva:$("#strmodpUrva").val(),strunmodpUrva:$("#strunmodpUrva").val(),dividpUrva:$("#dividpUrva").val(),anspUrva:'NULL'},function(data,status){
      var x = $("#dividpUrva").val();
      $(x).html(data)
    });
    return false;
   }

   function uwwarapaxayescgi() {
      $.post("/cgi-bin/SCL_CGI/skt_gen/compounds/uwwarapaxa.cgi",{encodinguwwara:$("#encodinguwwara").val(),p1uwwara:$("#p1uwwara").val(), p2uwwara:$("#p2uwwara").val(), samAsAnwauwwara:$("#samAsAnwauwwara").val(),samAsaprakArauwwara:$("#samAsaprakArauwwara").val(), sUwrastruwwara:$("#sUwrastruwwara").val(),uwwarapaxastr:$("#uwwarapaxastr").val(),dividuwwara:$("#dividuwwara").val(),ansuwwara:'Yes'},function(data,status){
      var x = $("#dividuwwara").val();
      $(x).html(data)
    });
    return false;
   };

   function uwwarapaxanocgi() {
      $.post("/cgi-bin/SCL_CGI/skt_gen/compounds/uwwarapaxa.cgi",{encodinguwwara:$("#encodinguwwara").val(),p1uwwara:$("#p1uwwara").val(), p2uwwara:$("#p2uwwara").val(), samAsAnwauwwara:$("#samAsAnwauwwara").val(),samAsaprakArauwwara:$("#samAsaprakArauwwara").val(), sUwrastruwwara:$("#sUwrastruwwara").val(),uwwarapaxastr:$("#uwwarapaxastr").val(),dividuwwara:$("#dividuwwara").val(),ansuwwara:'No'},function(data,status){
      var x = $("#dividuwwara").val();
      $(x).html(data)
    });
    return false;
   };

   function uwwarapaxaNullcgi() {
      $.post("/cgi-bin/SCL_CGI/skt_gen/compounds/uwwarapaxa.cgi",{encodinguwwara:$("#encodinguwwara").val(),p1uwwara:$("#p1uwwara").val(), p2uwwara:$("#p2uwwara").val(), samAsAnwauwwara:$("#samAsAnwauwwara").val(),samAsaprakArauwwara:$("#samAsaprakArauwwara").val(), sUwrastruwwara:$("#sUwrastruwwara").val(),uwwarapaxastr:$("#uwwarapaxastr").val(),dividuwwara:$("#dividuwwara").val(),ansuwwara:'NULL'},function(data,status){
      var x = $("#dividuwwara").val();
      $(x).html(data)
    });
    return false;
   }
