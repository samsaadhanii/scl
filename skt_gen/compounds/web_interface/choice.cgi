#!/usr/bin/env perl
#
#  Copyright (C) 2012-2023 Amba Kulkarni (ambapradeep@gmail.com)
#
#  This program is free software; you can redistribute it and/or
#  modify it under the terms of the GNU General Public License
#  as published by the Free Software Foundation; either
#  version 2 of the License, or (at your option) any later
#  version.
#
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with this program; if not, write to the Free Software
#  Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.


use utf8;
require "../../paths.pl";
require "$GlblVar::SCLINSTALLDIR/cgi_interface.pl";

use warnings;
#use CGI ':standard';

print "Content-type:text/html;-expires:60*60*24;charset:UTF-8\n\n";
my %param = &get_parameters();

my $prAwipaxikam1;
my $prAwipaxikam2;

my %questions = (
"1",  "किम् अनेन समासेन मित्रार्थः उच्यते?",
"2",  "किम् अनेन समासेन अमित्रार्थः उच्यते?",
"3",  "अनेन समासेन नगरार्थः प्रतीयते?",
"4",  "किम् अनेन समासेन पर्वतः उच्यते?",
"5",  "अनेन समासेन देवतार्थः उच्यते?",
"6",  "किम् अनेन समासेन अवस्था उच्यते?",
"7",  "अनेन समासेन ऋषिः उच्यते?",
"8",  "अनेन समासेन सञ्ज्ञा गम्यते?",
"9",  "अनेन समासेन वयः उच्यते?",
"10", "किम् अनेन समासेन तत्कृतार्थः उच्यते?",
"11", "अनेन समासेन आवश्यकार्थः उच्यते?",
"12", "अनेन समासेन अत्यन्तसंयोगः उच्यते?",
"13", "अनेन समासेन क्षेपार्थः उच्यते?",
"14", "किं समासेन निन्दार्थः गम्यते?",
"15", "अनेन समासेन द्विगुः अथवा समाहारः उच्यते?",
"16", "किम् अयं समास स्त्रियां वर्तते?",
"17", "अनेन समासेन पूज्यमानार्थः गम्यते?",
"18", "अनेन समासेन सञ्ज्ञा एवम् अन्यपदार्थः उच्यते?",
"19", "अनेन समासेन जातिः अथवा संज्ञा गम्यते?",
"20", "किम् अनेन समासेन स्त्रीत्वं द्योत्यते?",
"21", "अनेन समासेन अल्पार्थः गम्यते?",
"22", "अनेन समासेन कर्मव्यतिहारः उच्यते?",
"23", "अनेन समासेन लुब्धयोगः उच्यते?",
"24", "किम् अनेन समासेन शेषः उच्यते?",
"25", "अनेन समासेन स्वाङ्गः उच्यते?",
"26", "अनेन समासेन जानपदाख्यार्थः उच्यते?",
"27", "अनेन समासेन मुख्यः अर्थः उच्यते?",
"28", "किमनेन आक्रोशार्थः गम्यते?",
"29", "किं p1 प्राक्देशकरार्थे वर्तते एवं समासेन संज्ञा गम्यते?",
"30", "किमिदं p1 स्वाङ्गवाचकं वर्तते एवं समासेन संज्ञा प्रतीयते?",
"31a", "किम् अनु इति अव्ययम् समयार्थे वर्तते एवम् इदम् पदम् p1 चिह्नवाचकम् वा?",
"31b", "किम् अनु इति अव्ययम् समयार्थे वर्तते एवम् इदम् पदम् p2 चिह्नवाचकम् वा?",
"32",  "अनुना दैर्घ्यं उच्यते?",
"33",  "अनु इति अव्ययम् आयामर्थे वर्तते?",
"34a", "अभिप्रती आभिमुक्यार्थे वर्तेते एवम् इदम् पदम् p1 चिह्नवाचकम् वा?",
"34b", "अभिप्रती आभिमुक्यार्थे वर्तेते एवम् इदम् पदम् p2 चिह्नवाचकम् वा?",
"35",  "किम् अक्षिशब्दः अदर्शनार्थे वर्तते?",
"36", "आङ् इति अव्ययम् मार्यादा एवम् अभिविधि अर्थे वर्तते?",
"37", "किम् इति अव्ययम् क्षेपार्थे वर्तते?",
"38", "किम् इति निन्दार्थे वर्तते?",
"39", "किं कु इति ईषदर्थे वर्तते?",
"40", "प्रति इति अव्ययम् मात्रार्थे अस्ति?",
"41", "यथा इति अव्ययम् असादृश्यार्थे अस्ति?",
"42", "यावत् इति अव्ययम् अवधारणार्थे अस्ति?",
"43", "p1 इति पदं पूजार्थे वर्तते?",
"44", "p2 इति पदं पूजार्थे वर्तते?",
"45",  "किम् p1 इति पदम् जातिपरिप्रश्नार्थं सूचयति?",
"46",  "किम् p1 इति पदम् चतुष्पाज्जातिवाचको वा?",
"47",  "किम् p1 इति पदम् जातिवाचकं वा?",
"48a", "p1 इदम् पदम् अल्पपञ्चम्यं वर्तते वा?",
"48b", "p2 इदम् पदम् अल्पपञ्चम्यं वर्तते वा?",
"49",  "किमिदं p1 नद्यन्तं?",
"50",  "किम् p1 इति पदम् निन्दार्थे वर्तते?",
"51",  "किम् p1 इति पदम् निर्धारणे वर्तते?",
"52",  "p1 इति पदम् संख्येयार्थे अस्ति?",
"53a", "p1 इति पदम् वंश्यवाचकं वा?",
"53b", "p2 इति पदम् वंश्यवाचकं वा?",
"54",  "किम् p2 इति पदम् चतुष्पात्जातिवाचको वा?",
"55",  "किम् p2 इति पदम् जातिवाचकं वा?",
"56",  "p1 इति पदम् कालभिन्नवाचकम्?",
"57",  "किमिदं p2 भाषायां वर्तते ?",
"58",  "kiM p1 vixyAsambanXarWe varwawe aWavA yonisambanXarWe?",
"59",  "किम् p1 इति पदं कालवाचकः एवम् p2 इति पदं परिच्छेध्यवाचकः वा?",
"60a", "p1 p2 किम् उभावपि पदौ वर्णवाचकौ?",
"60b", "p2 p1 किम् उभावपि पदौ वर्णवाचकौ?",
"61",  "p1 इति पदं व्यञ्जनवाचकम् एवम् p2 इति पदम् अन्नवाचकं वा?",
"62",  "p1 इति पदं मिश्रिखरणवाचकं एवं p2 इति पदम् भक्ष्यवाचकं वा?",
"63a",  "p1 इति पदम् p2 इति पदस्य निन्दार्थः वा?",
"64b",  "p2 इति पदम् p1 इति पदस्य निन्दार्थः वा?",
"65a", "किम् p1 इति पदम् p2 अस्य पदस्य अहोरात्रवयवः वा?",
"65b", "किम् p2 इति पदम् p1 अस्य पदस्य अहोरात्रवयवः वा?",
"66a", "p1 p2 पदद्वयम् समाहारे वर्तते?",
"66b", "p2 p1 पदद्वयम् समाहारे वर्तते?",
"67a", "किम् p1 इति पदं p2 इति पदस्य अवयवः वा ?",
"67b", "किम् p2 इति पदं p1 इति पदस्य अवयवः वा ?",
"68a", "किं p1 पदम् p2 पदस्य उपमानं वा?",
"68b", "किं p2 पदम् p1 पदस्य उपमानं वा?",
"69a", "किम् p1 पदम् p2 पदस्य उपमेयः वा?",
"69b", "किम् p2 पदम् p1 पदस्य उपमेयः वा?",
"70a", "किम् p1 इति पदम् अवयवी वा p2 इति पदस्य?",
"70b", "किम् p2 इति पदम् अवयवी वा p1 इति पदस्य?",
"71a", "किं p1 पदं p2 पदस्य विशेषणं वा?",
"71b", "किं p2 पदं p1 पदस्य विशेषणं वा?",
"72a", "p1 इदम् पदम् p2 अस्य पदस्य तदर्थो वा?",
"72b", "p2 इदम् पदम् p1 अस्य पदस्य तदर्थो वा?",
"73",  "अनेन समासेन प्राणिभिन्नः उच्यते?"
);

my %ques = (
"rAjan+fas puruRa+su (2.2.8)", "28",
"agra+su xanwa+su (2.2.24)","22;8;71a;8",
"nIla+su uwpala+su (2.1.57)","71a",
"UDa+su raWa+su (2.2.24)","22;8;71a",
"eka+tA pari (2.1.10)","",
"ku anna+su (2.2.18)","",
"ku raWa+su (2.2.18)","",
"ku vaxa+su (2.2.18)","",
"hqxaya+fas roga+su (2.2.8)","28",
"hqxaya+fas lAsa+su (2.2.8)","28",
"hari+su hara+su (2.2.29)","",
"hala+fi wripaxikA+su (2.1.44)","8;8;29",
"haswa+fi banXa+su (2.1.41)","8;30",
"haswin+fas varcas+su (2.2.8)","28",
"na karwum (2.2.6)","",
"akeSA+su BAryA+su (2.2.24)","22;8;71a",
"akRa+fas Xur+su (2.2.8)","28",
"akRa+tA pari (2.1.10)","",
"akRa+sup SONda+su (2.1.40)","8;30;57",
"akRi+O BrU+O (2.2.29)","",
"na ga (2.2.19)","73",
"agaxa+fas kAra+su (2.2.8)","8",
"na go+su (2.2.6)","",
"agni+Am swoma+su (2.2.8)","",
"agni+su varuNa+su (2.2.29)","",
"agnIRoma+os CAyA+su (2.2.8)","8;30;57;28",
"Ahiwa+jas agni+jas (2.2.24)","22;49;71a",
"aja+fas wunxa+su (2.2.8)","28;3",
"ajAwa+su kakuxa+su (2.2.24)","22;8;71a;6",
"aNaka+su kulAla+su (2.1.54)","63a",
"aNakA+su BAryA+su (2.1.54)","63a",
"nixrA+su awi (2.1.6)","",
"hima+fas awi (2.1.6)","",
"kumArI+su aXi (2.1.6)","",
"gopA+fi aXi (2.1.6)","",
"hari+fi aXi (2.1.6)","",
"aXi Awman+fi (2.1.6)","",
"na aSva+su (2.2.6)","",
"grAma+fas anu (2.1.16)","32",
"go+fas anu (2.1.16)","32",
"giri+fas anu (2.1.6)","",
"giri+fas anu (2.1.6)","",
"go+fas anu (2.1.6)","",
"jyeRTa+fas anu (2.1.6)","",
"na upalabXi+su (2.2.6)","",
"anu rahas+su (2.2.18)","",
"rUpa+fas anu (2.1.6)","",
"vana+fas anu (2.1.15)","31a",
"viRNu+fas anu (2.1.6)","",
"giri+fi anwar (2.1.6)","",
"anwika+fasi Agawa+su (2.1.39)","",
"anXa+su wamas+su (2.1.57)","71a",
"anya+fas kAraka+su (2.2.8)","28",
"anya+fe arWa+su (2.1.36)","72a",
"anya+su AsWiwa+su (2.1.57)","71a",
"anya+fas ASis+su (2.2.8)","28",
"anya+tA AsWiwa+su (2.1.32)","",
"anu akRi+os (2.1.6)","",
"anu ap+fas (2.1.15)","31a",
"apa kara (2.2.18)","",
"xiSA+os apa (2.1.6)","",
"na paWin+su (2.2.6)","",
"apara+jas para+jas (2.2.29)","",
"apararAwra+fi kqwa+su (2.1.45)","65a;8;30;57",
"apara+su aXyApaka+su (2.1.58)","",
"apa viRNu+fasi (2.1.12)","",
"apUpa+fas arXa+su (2.2.8)","28",
"na brAhmaNa+su (2.2.6)","",
"agni+am aBi (2.1.14)","34b",
"aByASa+fasi Agawa+su (2.1.39)","",
"amqwa+su aSman+su (2.1.57)","19;71a",
"ayas+su xanwa+jas (2.2.24)","22;8;71a;8",
"araNya+am gawa+su (2.1.24)","",
"araNya+fi wilaka+jas (2.1.44)","8;8;30;57",
"na rAjan+su (2.2.6)","",
);

#my $cgi = new CGI;

#$cgi->charset('utf-8');

#print $cgi->header(-type    => 'text/html',
#                   -charset => 'utf-8');

print "<style>
.head_div{background:none repeat scroll 0px 0px #5678AA; color:#fff;}
h3{margin-top:1px !important; font-size:30px;}
.head_div p{font-size:16px !important; }
.text div{padding:5px;}
input[type=\"submit\"]{margin-top:5px; width:87px;}
select{margin-top:10px; width:200px !important; padding:3px !important;}
.listdiv{margin-top:5px;border:1px solid;}
</style>
</head>
<body>
<center>
<div class=\"container-full\">

<header class=\"head_div col-md-12 text-center\">

	<h3>समस्तपदव्युत्पादिका</h3>   
	<h3>A Compound stem generator</h3>
	<h4>Department of Sanskrit Studies, University of Hyderabad.</h4>
<h3><a href=\"/$GlblVar::SCL_HTDOCS/start.html\">Samsaadhanii</a></h3>
</center>
<br /> <br />";
#print $cgi->start_html(-title => 'समस्त-पद-निर्माण-प्रक्रिया ',
#                       -head  => meta({-http_equiv => 'Content-Type',
#                                       -content => 'text/html; charset=utf-8'}));
#
my $i;
#my $init;
my $rem_ques_nos = "";
my $ch0 = "";
my $ch1 = "";
my $ch2 = "";
my $ch3 = "";
my $ch4 = "";
my $ch5 = "";
my $ch6 = "";
my $q = "";

my @ques_nos = ();
my $user_choices = "";
my $avigraha = "";

#if (param) {
  $avigraha = $param{vigraha};
  if(param("ch0")) {$ch0 = $param{ch0};} else { $ch0 = "";}
  if(param("ch1")) {$ch1 = $param{ch1};} else { $ch1 = "";}
  if(param("ch2")) {$ch2 = $param{ch2};} else { $ch2 = "";}
  if(param("ch3")) {$ch3 = $param{ch3};} else { $ch3 = "";}
  if(param("ch4")) {$ch4 = $param{ch4};} else { $ch4 = "";}
  if(param("ch5")) {$ch5 = $param{ch5};} else { $ch5 = "";}
  if(param("ch6")) {$ch6 = $param{ch6};} else { $ch6 = "";}
  $rem_ques = $param{ques_nos};
  $user_choices = $param{user_choices};
  
  $user_choices .= $ch0.$ch1.$ch2.$ch3.$ch4.$ch5.$ch6;
          $ch0 = "";
          $ch1 = "";
          $ch2 = "";
          $ch3 = "";
          $ch4 = "";
          $ch5 = "";
          $ch6 = "";


  my $a = `echo "$avigraha" | $GlblVar::SCLINSTALLDIR/converters/ri_skt | $GlblVar::SCLINSTALLDIR/converters/iscii2utf8.py 1`;

  if($user_choices =~ /Y$/) { $rem_ques =~ s/^[0-9]+b;//;}
  

  if (($rem_ques eq "") && ($user_choices ne "")) { # not 1st entry, no more questions
        &call_generator($avigraha,$ch0,$ch1,$ch2,$ch3,$ch4.$ch5,$ch6,$user_choices);
  } else { # Either 1st entry, or still more questions
          if(($rem_ques eq "") && ($user_choices eq "")) { # 1st entry
              @ques_nos = split(/;/,$ques{$avigraha}); # get question nos
          }
          else {@ques_nos = split(/;/,$rem_ques);} # retrieve ques nos from the cgi parameters

          if($ques_nos[0] eq "") { # 1st entry and no questions (eka+tA pari)
             &call_generator($avigraha,$ch0,$ch1,$ch2,$ch3,$ch4,$ch5,$ch6,$user_choices);
          } else { #more questions

             $avigraha =~ /^([^ ]+)\+([^ ]+) ([^ ]+)\+([^ ]+) (\([^)]+\))/;

             my $prAwipaxikam1 = $1;
             my $sup1 = $2;
             my $prAwipaxikam2 = $3;
             my $sup2 = $4;
             my $sutra = $5;

             my $prAwi1 = `echo "$prAwipaxikam1" | $GlblVar::SCLINSTALLDIR/converters/ri_skt | $GlblVar::SCLINSTALLDIR/converters/iscii2utf8.py 1`; chomp($prAwi1);
             my $prAwi2 = `echo "$prAwipaxikam2" | $GlblVar::SCLINSTALLDIR/converters/ri_skt | $GlblVar::SCLINSTALLDIR/converters/iscii2utf8.py 1`; chomp($prAwi2);

             my $associated_question = 0;
   	     $ch_table = "<center><table>";
             for ($i=0;$i<=$#ques_nos && !$associated_question;$i++) {
               if($ques_nos[$i] =~ /a$/) { $associated_question = 1;}
               my $q = $questions{$ques_nos[$i]};
               $q =~ s/p1/$prAwi1/;
               $q =~ s/p2/$prAwi2/;
               my $var = "ch".$i;
	       $ch_table .= "<tr><td id=\"questions\">$q</td>";
  	       $ch_table .= "<td><select name=\"ch$i\" id=\"choice$i\">\n";
               if(${$var} eq "") {
  	        $ch_table .= "<option value=\"Y\">Yes/आम्</option>";
		$ch_table .= "<option value=\"N\">No/न</option>";
               } else {
                 $ch_table .= "<option value=\"${$var}\">${$var}</option>";
               }
 	      $ch_table .= "</select></td></tr>\n";
              }
  	      $ch_table .= "</table></center><br />";
              if($associated_question) { #question ends in 'a', has accompanying 'b'
                $rem_ques_nos = $ques_nos[$i-1];
                $rem_ques_nos =~ s/a$/b/;
                for (my $j=$i; $j <= $#ques_nos; $j++) {
                      $rem_ques_nos .= ";".$ques_nos[$j];
                }
                $rem_ques_nos =~ s/^;//;
              } 
               &call_choice($avigraha,$ch_table,$rem_ques_nos,$user_choices);
        }
    }
    print "</body></html>\n";
    #}

sub call_generator{
  my($avigraha,$ch0,$ch1,$ch2,$ch3,$ch4,$ch5,$ch6,$user_choices) = @_;
      $user_choices .= $ch0.$ch1.$ch2.$ch3.$ch4.$ch5.$ch6;

      print "<br />";
      #print "<div id=\"output2\">";
      print "<center><pre>\n";
      my $cmd = "echo '$user_choices' | $GlblVar::SCLINSTALLDIR/skt_gen/compounds/sanskrit_grammar.out \"$avigraha\" 1 | $GlblVar::SCLINSTALLDIR/converters/ri_skt | $GlblVar::SCLINSTALLDIR/converters/iscii2utf8.py 1";
      system($cmd);
      print "</pre></center>\n";
      #print "</div>";
}
1;

sub call_choice{
  my($avigraha,$ch_table,$rem_ques_nos,$user_choices) = @_;
  my($form);
          $form =  "<form name=\"f1\" method=\"get\" action=\"/cgi-bin/$GlblVar::SCL_CGI/skt_gen/compounds/choice.cgi\">\n";
          $form .= "<input type=\"hidden\" name=\"vigraha\" id=\"vigraha_vAkya\" value=\"$avigraha\" />";
          $form .= $ch_table;
          $form .= "<input type=\"hidden\" name=\"ques_nos\" id=\"rem_ques_nos\" value=\"$rem_ques_nos\" />";
          $form .= "<input type=\"hidden\" name=\"user_choices\" id=\"user_choices\" value=\"$user_choices\" />";
          $form .= "<br /><input type=\"submit\" name=\"submit\" value=\"submit\" id=\"submit_query\" />";
          $form .= "</form><br />";
          print "<center>",$form,"</center>\n";
}
1;
