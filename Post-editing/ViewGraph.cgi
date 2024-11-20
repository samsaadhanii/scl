#!/usr/bin/env perl

#  Copyright (C) 2023-2024 Amba Kulkarni (ambapradeep@gmail.com)
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


my $buffer;
my $pid = $$;

## In order to test it with an input string instead of a tsv file through interface,
#$in = "
#index word poem sandhied_word morph_analysis morph_in_context kaaraka_sambandha possible_relations color_code hindi_meaning hindi_meaning_active
#
#1.1 दशरथस्य  दशरथस्य दशरथ{पुं;6;एक}/दशरथ{नपुं;6;एक} दशरथ{पुं;6;एक} षष्ठीसम्बन्धः,2.1 षष्ठीसम्बन्धः,8.1#षष्ठीसम्बन्धः,7.1#षष्ठीसम्बन्धः,6.1#षष्ठीसम्बन्धः,5.1#षष्ठीसम्बन्धः,4.1#षष्ठीसम्बन्धः,3.1#षष्ठशरथ_का दशरथ_का द 
#2.1 पुत्रः  पुत्रः पुत्र{पुं;1;एक} पुत्र{पुं;1;एक} विशेषणम्,3.1 कर्ता,9.1#अभेदः,3.1 N1 पुत्र पुत्र
#3.1 रामः  रामः रा1{कर्तरि;लट्;उ;बहु;परस्मैपदी;अदादिः}/राम{पुं;1;एक} राम{पुं;1;एक} कर्ता,9.1 कर्ता,9.1 N1 राम राम
#4.1 नगरे  नगरे नगर{नपुं;1;द्वि}/नगर{नपुं;2;द्वि}/नगर{नपुं;8;द्वि}/नगर{नपुं;7;एक} नगर{नपुं;7;एक} अधिकरणम्,9.1 अधिकरणम्,9.1#कर्म,9.1 N7 नगर_में नगर_में
#5.1 कोशात्  कोशात् कोश{पुं;5;एक} कोश{पुं;5;एक} अपादानम्,9.1 हेतुः5,9.1#अपादानम्,9.1 N5 कोश_से कोश_से
#6.1 हस्तेन  हस्तेन हस्त{पुं;3;एक} हस्त{पुं;3;एक} करणम्,9.1 करणम्,9.1#हेतुः,9.1 N3 हाथ_से हाथ_से
#7.1 ब्राह्मणाय  ब्राह्मणाय ब्राह्मण{पुं;4;एक} ब्राह्मण{पुं;4;एक} सम्प्रदानम्,9.1 सम्प्रदानम्,9.1 N4 ब्राह्मण_को ब्राह्मण_को
#8.1 धनं  धनं धन{नपुं;1;एक}/धन{नपुं;2;एक} धन{नपुं;2;एक} कर्म,9.1 कर्म,9.1#कर्ता,9.1 N2 धन धन
#9.1 ददाति  ददाति दा3{कर्तरि;लट्;प्र;एक;परस्मैपदी;जुहोत्यादिः} दा3{कर्तरि;लट्;प्र;एक;परस्मैपदी;जुहोत्यादिः} अभिहित_कर्ता,3.1;सकर्मक - KP देता_है देता_है
#10.1 .  . - - - - FS - -";
# cat $in | ./Viewgraph.cgi
open (TMP,">TFPATH/tmp_$pid");
read(STDIN, $buffer, $ENV{'CONTENT_LENGTH'});
$buffer =~ s/"//g;
#$buffer =~ s/ /\t/g;
$buffer =~ s/^M//g;
print TMP $buffer;
close (TMP);

print "Access-Control-Allow-Origin: *\n";
print "Content-type:image/svg+xml;-expires:60*60*24;charset:UTF-8\n\n";

system ("CGIDIR/SCL_CGI/MT/prog/kAraka/draw_graph.pl TFPATH $pid No < TFPATH/tmp_$pid");
system ("GraphvizDot -Tsvg -o TFPATH/$pid.svg TFPATH/$pid.dot");
system("CGIDIR/SCL_CGI/MT/prog/kAraka/add_hidden_sub.pl < TFPATH/$pid.svg");

#system("rm TFPATH/tmp_$pid");
#system("rm TFPATH/tmp.svg");
