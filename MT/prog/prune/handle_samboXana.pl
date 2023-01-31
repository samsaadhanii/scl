#!/usr/bin/env perl

#  Copyright (C) 2010-2023 Amba Kulkarni (ambapradeep@gmail.com)
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


$/ = "\n\n";

#The conditions for sambodhana:
# a) previous word is a sambodhana sUcaka avyaya such as he, BO, etc
# b) if it is the first word
# c) The word has an ! mark after it.  ### There is a need to read complete table, as against only the mo output. Hence this is not implemented yet.
# d) The sentence has yuRmax in it
# e) The verb has maXyama puruRa form which agrees with the vacana of the word in samboXana, and the verb is different from this word in samboXana.

if($ARGV[0] eq "D") { $DEBUG = 1;} else {$DEBUG = 0;}

while($in = <STDIN>){

@mo_ana = split(/\n/,$in);

$yuRmax_present = 0;

for($i=0;$i<=$#mo_ana;$i++){
    if($mo_ana[$i] =~ /yuRmax<vargaH:sarva><lifgam:a><viBakwiH:1>/){
       $yuRmax_present = 1;
    }
}

$maXyama_puruRa_analysis = 0;
$verb_vacanam = 0;
$verb_pos = -1;

for($i=0;$i<=$#mo_ana;$i++){
    if($mo_ana[$i] =~ /<puruRaH:ma><vacanam:([^>]+)>/){
       $maXyama_puruRa_analysis = 1;
       $verb_vacanam = $1;
       $verb_pos = $i;
    }
}

$samboXana_sUcaka_avy_pos = $#mo_ana+100; #Some out of range value
for($i=0;$i<=$#mo_ana;$i++){
    if($mo_ana[$i] =~ /=(he|Bo|BoH|ayi|re|Am|are|aye)<vargaH:avy>/){
       $samboXana_sUcaka_avy_pos = $i;
    }
}

if($DEBUG) {
print STDERR "verb vacanam = ",$verb_vacanam,"\n";
print STDERR "samboXana sUcaka avy pos =", $samboXana_sUcaka_avy_pos,"\n";
print STDERR "yuRmax present =", $yuRmax_present,"\n";
}

$samboXana_vacanam = 0;
$samboXana_pos = -1;
$samAsa_pUrva_paxa = "";
$samAsa_uwwara_paxa = "";

#We start with i=1 instead of 0, since if it is the first word, we do not want to remove the samboXana information.
for($i=1;$i<=$#mo_ana;$i++){
if($DEBUG) {
print STDERR "word index ",$i,"\n";
print STDERR "morph analysis ",$mo_ana[$i],"\n";
}
    if(($mo_ana[$i] =~ /<viBakwiH:8><vacanam:/) && ($mo_ana[$i] =~ /\//)){
        $mo_ana[$i] =~ /<viBakwiH:8><vacanam:([^>]+)>/;
       $samboXana_vacanam = $1;
       $samboXana_pos = $i;
       $store = $mo_ana[$i];
if($DEBUG) {
print STDERR "samboXana vacanam = ",$samboXana_vacanam,"\n";
print STDERR "samboXana pos = ",$samboXana_pos,"\n";
print STDERR "store = ",$store,"\n";
}
#       if((($samboXana_vacanam != $verb_vacanam) && ($samboXana_sUcaka_avy_pos != $samboXana_pos - 1) && ($yuRmax_present == 0)) || ($samboXana_pos == $verb_pos)) {
#       Irrespective of all the above conditions, if there is an analysis with level > 1 with vibhakti = 8, we remove it  -- Amba 28th June 2019
#       #Several words such as pariSuRyawi are analysed with samboXanam in kqxanwa.
       $tmp = "";
       $ana = $mo_ana[$i];
       $ana =~ /^([^=]+)=(.*)/;
       $wrd = $1; $ana = $2;
       @mo = split(/\//,$ana);
        foreach $mo (@mo){
          if($mo !~ /<viBakwiH:8>/){
             $tmp .= "/".$mo;
          }
          if(($mo =~ /<viBakwiH:8>/) && ($mo =~ /<level:[14]>/)){
             $tmp .= "/".$mo;
          }
  # Only level 1 samboXanas are kept. All other samboXanas are deleted.
  # praBo hare is also possible construction. This does not have 'he etc' as a samboXanasUcaka. 
        }
        if($tmp eq "") { $tmp = join ('/',@mo);}
        $mo_ana[$i] = $wrd."=".$tmp;
#       }
       if($mo_ana[$i] eq "") { $mo_ana[$i] = $store;}
     }
}

for($i=0;$i<=$#mo_ana;$i++){
    print $mo_ana[$i],"\n";
}
#print "\n";
}
