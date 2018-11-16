sub get_dot {
   my ($samAsa) = @_;
   chomp($samAsa);
   my $dot = "digraph parse {
           size=\"10,20\";
           edge [ color=\"red\"];\n";

   $dot .= &samAsa_vigraH($samAsa);
$dot;
}
1;

sub samAsa_vigraH
{
 my($samAsa) = @_;
 my @color = ("gold", "green","pink","grey");
 my($dot);
 $samasa_tag{"A1"} = "अव्यय_पूर्वपदः";
 $samasa_tag{"A2"} = "अव्यय_उत्तरपदः";
 $samasa_tag{"A3"} = "तिष्टद्गुप्रभृति	";
 $samasa_tag{"A4"} = "संख्यापूर्वपद_नद्युत्तरपद";
 $samasa_tag{"A5"} = "नद्युत्तरपद_अन्यपदार्थे_संज्ञायाम्";
 $samasa_tag{"A6"} = "संख्यापूर्वपद_वंश्योत्तरपदः";
 $samasa_tag{"A7"} = "पारे_मध्ये_पूर्वपद_षष्ठ्युत्तरपद";
 $samasa_tag{"K1"} = "विशेषण_पूर्वपद_कर्मधारयः";
 $samasa_tag{"K2"} = "विशेषण_उत्तरपद_कर्मधारयः";
 $samasa_tag{"K3"} = "विशेषण_उभयपद_कर्मधारयः";
 $samasa_tag{"K4"} = "उपमान_पूर्व_पद_कर्मधारयः";
 $samasa_tag{"K5"} = "उपमान_उत्तर_पद_कर्मधारयः";
 $samasa_tag{"K6"} = "अवधारणापूर्वपदः_कर्मधारयः";
 $samasa_tag{"K7"} = "सम्भावनापूर्वपदः_कर्मधारयः";
 $samasa_tag{"Km"} = "मध्यमपदलोपी_कर्मधारयः";
 $samasa_tag{"T1"} = "प्रथमातत्पुरुषः";
 $samasa_tag{"T2"} = "द्वितीयातत्पुरुषः";
 $samasa_tag{"T3"} = "तृतीयातत्पुरुषः";
 $samasa_tag{"T4"} = "चतुर्थीतत्पुरुषः";
 $samasa_tag{"T5"} = "पञ्चमीतत्पुरुषः";
 $samasa_tag{"T6"} = "षष्ठीतत्पुरुषः";
 $samasa_tag{"T7"} = "सप्तमीतत्पुरुषः";
 $samasa_tag{"Tn"} = "नञ्तत्पुरुषः";
 $samasa_tag{"Tds"} = "समाहार_द्विगुः";
 $samasa_tag{"Tdt"} = "तद्धितार्थद्विगुः";
 $samasa_tag{"Tdu"} = "उत्तरपदद्विगुः";
 $samasa_tag{"Tg"} = "गतिसमासः";
 $samasa_tag{"Tk"} = "कुसमासः";
 $samasa_tag{"Tp"} = "प्रादिसमासः";
 $samasa_tag{"Tm"} = "मयूरव्यंसकादिः";
 $samasa_tag{"Tb"} = "तत्पुरुषः_बहुपदः";
 $samasa_tag{"U"} = "तत्पुरुषः_उपपदः";
 $samasa_tag{"Bs2"} = "द्वितीयार्थ_बहुव्रीहिः(समानाधिकरणः)";
 $samasa_tag{"Bs3"} = "तृतीयार्थ_बहुव्रीहिः(समानाधिकरणः)";
 $samasa_tag{"Bs4"} = "चतुर्थ्यर्थ_बहुव्रीहिः(समानाधिकरणः)";
 $samasa_tag{"Bs5"} = "पञ्चम्यर्थ_बहुव्रीहिः(समानाधिकरणः)";
 $samasa_tag{"Bs6"} = "षष्ठ्यर्थ_बहुव्रीहिः(समानाधिकरणः)";
 $samasa_tag{"Bs7"} = "सप्तम्यर्थ_बहुव्रीहिः(समानाधिकरणः)";
 $samasa_tag{"Bsd"} = "दिग्वाचक_बहुव्रीहिः(समानाधिकरणः)";
 $samasa_tag{"Bsp"} = "प्रहरणविषयक_बहुव्रीहिः(समानाधिकरणः)";
 $samasa_tag{"Bsg"} = "ग्रहणविषयक_बहुव्रीहिः(समानाधिकरणः)";
 $samasa_tag{"Bsmn"} = "अस्त्यर्थ_मध्यमपदलोपी_नञ्_बहुव्रीहिः";
 $samasa_tag{"Bvp"} = "प्रादि_बहुव्रीहिः";
 $samasa_tag{"Bss"} = "संख्योभयपद_बहुव्रीहिः(समानाधिकरणः)";
 $samasa_tag{"Bsu"} = "उपमानपूर्वपद_बहुव्रीहिः(समानाधिकरणः)";
 $samasa_tag{"Bv"} = "व्यधिकरण_बहुव्रीहिः	";
 $samasa_tag{"Bvs"} = "सङ्ख्योत्तरपदः_व्यधिकरण_बहुव्रीहिः";
 $samasa_tag{"BvS"} = "सहपूर्वपद_व्यधिकरण-बहुव्रीहिः";
 $samasa_tag{"BvU"} = "उपमानपूर्वपद_व्यधिकरण_बहुव्रीहिः";
 $samasa_tag{"Bb"} = "बहुपदः_बहुव्रीहिः";
 $samasa_tag{"Di"} = "इतरेतर_द्वंद्व";
        $dot = "";
        my($color_code);
        $color_code = 0;
        $count = 1;
        while($samAsa =~ /^(.*)<([^>]+)>([^-<>]+)(.*)$/)
        {
         $tmp_samAsa = $2;
	 $samAsa_tag=$samasa_tag{$3};
         $tmp_samAsa_without_tag = $tmp_samAsa;
         $tmp_samAsa_without_tag =~ s/\[[^\[\]]*\]//g;
         $left_node = "(".$tmp_samAsa_without_tag.")";
         $left_node =~ s/-/_/g;
         $tmp_samAsa =~ s/\[[^\[\]]*\]_/-/g;
         print "left_node = $left_node\n";
         print "avayava = $tmp_samAsa\n";
	 @avayavAH=split(/\-/,$tmp_samAsa);

         $dot .= "node [shape=rectangle,style=filled,color=\"$color[$color_code]\",fontname=\"Lohit Hindi\"]\n";
         foreach $avayava (@avayavAH) {
           if ($avayava !~ /\(/) { $avayava .= "{".$count."}"; $count++;}
            $dot .= "\"$left_node\" -> \"$avayava\"\n";
         }
         $tmp_samAsa =~ s/-/_/g;
         $samAsa =~ s/^(.*)<([^>]+)>([^-><]+)(.*)$/$1($tmp_samAsa)$4/;
         $color_code++;
         if ($color_code > 3) { $color_code = 0;} 
       }
       $dot .= "}\n";
$dot;
}
1;
