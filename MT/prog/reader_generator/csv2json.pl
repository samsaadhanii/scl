#!/usr/bin/perl

$color{"N1"} = "#00BFFF";
$color{"N2"} = "#93DB70";
$color{"N3"} = "#40E0D0";
$color{"N4"} = "#B0E2FF";
$color{"N5"} = "#B4FFB4";
$color{"N6"} = "#87CEEB";
$color{"N7"} = "#C6E2EB";
$color{"N8"} = "#6FFFC3";
$color{"NA"} = "#FF99FF";
$color{"KP"} = "#FF1975";
$color{"CP"} = "#FFFF00";

$in = <STDIN>;
chomp($in);
@names = split(/\t/,$in);
$tot_columns = $#names;

$first = 1;
print "{";
print "\"sent\":[";
while($in = <STDIN>){
 chomp($in);
 if($in =~ /./) {
  @flds = split(/\t/,$in);
  if($first == 0) { print "},";}
  print "{";
  for ($i=0;$i<=$tot_columns;$i++) { # 
      if($i==9) { $flds[$i] = "";}  ## This is the English Meaning field, which is currently blank. For MT system for Amruta, we are producing karwari prayoga translation in this field.
      if($i == 8) {$flds[$i] =~ s/(.*)/$color{$1}/;}
      if($i == $tot_columns){
         print '"'.$names[$i].'":"'.$flds[$i].'"';
      }else{
         print '"'.$names[$i].'":"'.$flds[$i].'",';
      }
  }
   $first = 0;
 }
}
print "}]}";
