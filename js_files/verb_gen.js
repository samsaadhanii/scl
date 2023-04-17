var enc = 'dev';

function load_pref_info() {
  $("#upasargaH").empty();
  $.each(pref_info, function (pref_key, pref_text) {
    $("#upasargaH").append($('<option>', {
      text: pref_text[enc],
      value: pref_key
    }));
  });
  $("#upasargaH").select2();
}

function load_root_info() {
  $("#XAwu").empty();
  $.each(root_info, function (root_key, root_text) {
    $("#XAwu").append($('<option>', {
      text: root_text[enc],
      value: root_key
    }));
  });
  $("#XAwu").select2();
}

function update_voice() {
  prayogaH = $("#prayogaH").val();
  if (prayogaH == "karmaNi") {
    $("#paxI").val('AwmanepaxI');
    $('.akarmaNi').prop('disabled', true);
  }
  else {
    $('.akarmaNi').prop('disabled', false);
  }
}

function update_encoding() {
  enc = $("#enc").val();
  load_pref_info();
  load_root_info();
  $.each(labels, function (label_id, label_text) {
    if ($("#" + label_id).length != 0) {
      $("#" + label_id).text(label_text[enc]);
    }
  });
  $("#submit-verb").val(submit_label[enc]);
}

function mycallverbgen() {
  $("#output").html(waiting_label[enc]);

  var prayogaH_paxI;
  if ($("#prayogaH").val() == 'karwari') {
    prayogaH_paxI = 'karwari-' + $("#paxI").val();
    if ($("#Nic").prop("disabled") == false && $("#Nic").prop("checked") == true) {
      prayogaH_paxI = 'Nic' + prayogaH_paxI;
    }
  }
  else {
    prayogaH_paxI = 'karmaNi';
  }

  if (enc == "dev") {
    outenc = "Unicode";
  }
  else {
    outenc = "IAST";
  }

  $.post(
    "/cgi-bin/SCL_CGI/skt_gen/verb/verb_gen_web.cgi",
    {
      "vb": $("#XAwu").val(),
      "prayoga_paxI": prayogaH_paxI,
      "upasarga": $("#upasargaH").val(),
      "encoding": "WX",
      "outencoding": outenc,
    },
    function(data) {
      $("#output").html(data);
    }
  );
  return false;
}

function mycallkrwgen () {
  $("#output").html(waiting_label[enc]);

  if (enc == "dev") {
    outenc = "Unicode";
  }
  else {
    outenc = "IAST";
  }

  $.post(
    "/cgi-bin/SCL_CGI/skt_gen/kqw/kqw_gen_web.cgi",
    {
      "vb": $("#XAwu").val(),
      "upasarga": $("#upasargaH").val(),
      "encoding":  outenc,
    },
    function (data) {
      $("#output").html(data);
    }
  );
  return false;
}
