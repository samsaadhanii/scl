<html>
<head>
  <meta charset="UTF-8">
  <title>Rendered Graph</title>
</head>
<body>
  <?php
    $PROCESSID = getmypid();
    $TIMESTAMP = date("YmdHis");

    $BASE_NAME = "/tmp/table-$TIMESTAMP-$PROCESSID";
    $XLSX_GVIZ = "/home/sanal/test/viewgraph.py";

    if (isset($_FILES["ifile"])) {
      move_uploaded_file($_FILES["ifile"]["tmp_name"], "$BASE_NAME.xlsx");
      
      exec("python3 $XLSX_GVIZ $BASE_NAME.xlsx");
      
      $sfile = fopen("$BASE_NAME.svg", "r") or die("<p>Graph not generated</p>");
      echo fread($sfile, filesize("$BASE_NAME.svg"));
      $sfile.close();
    }
    else {
      echo "<p>No file uploaded</p>";
    }
  ?>
</body>
</html>
