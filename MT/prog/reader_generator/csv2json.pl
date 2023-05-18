#!/usr/bin/perl

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
