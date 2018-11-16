#!/usr/bin/env perl 

my $samAsa;

$color[0] = "gold";
$color[1] = "green";
$color[2] = "pink";
$color[3] = "grey";

while ($samAsa=<STDIN>)
{
   chomp($samAsa);
   print "digraph parse {
           size=\"10,20\";
           edge [ color=\"red\"];\n";

   samAsa_vigraH($samAsa);
}

sub samAsa_vigraH()
{
 my($samAsa) = @_;
        my($color_code);
        $color_code = 0;
        while($samAsa =~ /^(.*)<([^>]+)>([^-<>]+)(.*)$/)
        {
         $tmp_samAsa = $2;
         $samAsa_tag = $3;  
	 open(TMP,"<samasa_tag");
		while($in=<TMP>){
		($data,$tag)=split("\t",$in);
		if($tag=~/$samAsa_tag/){
			$samAsa_tag=$data;
		}
	}
         $left_node = "(".$tmp_samAsa.")[".$samAsa_tag."]";
         $left_node =~ s/-/_/g;
	 @avayavAH=split(/\-/,$tmp_samAsa);

         print "node [shape=rectangle,style=filled,color=\"$color[$color_code]\",fontname=\"Lohit Hinid\"]\n";
         foreach $avayava (@avayavAH) {
            print "\"$left_node\" -> \"$avayava\"\n";
         }
         $tmp_samAsa =~ s/-/_/g;
        $samAsa =~ s/^(.*)<([^>]+)>([^-><]+)(.*)$/$1($tmp_samAsa)\[$samAsa_tag\]$4/;
        $color_code++;
        
       }
       print "}\n";
}
