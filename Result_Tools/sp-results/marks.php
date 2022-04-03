<?php

$DB_SEARCH_SCRIPT = "/home/sanal/test/sp-results/get_marks_info.py";
// $DB_SEARCH_SCRIPT = "/home/poochoo/Projects/samsaadhanii_praveshika/show_marks/get_marks_info.py";
$reg_id = $_GET["regid"];
$info = exec("python3 $DB_SEARCH_SCRIPT $reg_id");
echo($info);

?>