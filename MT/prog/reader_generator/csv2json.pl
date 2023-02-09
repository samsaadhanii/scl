#!/usr/bin/perl

$in = <STDIN>;
chomp($in);
@names = split(/\t/,$in);
$tot_columns = $#names;

$first = 1;
print "[";
while($in = <STDIN>){
 chomp($in);
 if($in =~ /./) {
  @flds = split(/\t/,$in);
  #if($first == 0) { print "},\n";}
  if($first == 0) { print "},";}
  #print "{\n";
  print "{";
  for ($i=0;$i<=$tot_columns;$i++) { # 
   if($i==9) { $flds[$i] = "";}  ## This is the English Meaning field, which is currently blank. For MT system for Amruta, we are producing karwari prayoga translation in this field.
   #print "\"$names[$i]\":\"$flds[$i]\",\n";
   print "\"$names[$i]\":\"$flds[$i]\",";
  }
  # print "\"$names[$#flds]\":\"$flds[$#flds]\"\n";
   print "\"$names[$#flds]\":\"$flds[$#flds]\",";
   $first = 0;
 }
}
#print "}\n]\n";
print "}]";
