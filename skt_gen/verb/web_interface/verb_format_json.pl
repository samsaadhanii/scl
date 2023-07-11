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


@disp_lakAra = ("लट् (वर्तमान)","लिट् (परोक्ष)","लुट् (अनद्यतन भविष्यत्)","लृट् (अद्यतन भविष्यत्)","लोट् (आज्ञार्थ)","लङ् (अनद्यतन भूत)","विधिलिङ्","आशीर्लिङ्","लुङ् (अद्यतन भूत)","लृङ् (भविष्यत्)");
@person = ("प्रथमपुरुषः","मध्यमपुरुषः","उत्तमपुरुषः");
@number = ("एकवचनम्","द्विवचनम्","बहुवचनम्");
@disp_lakAra_iast = ("lat (Present)","liṭ (Perfect)","luṭ (Periphrastic Future)","lṛṭ (Future)","loṭ (Imperative)","laṅ (Imperfect)","vidhilṅ (Optative)","āśīrlṅ (Benedictive)","luṅ (aorist)","lṛṅ (Conditional)");
@person_iast = ("prathamapuruṣaḥ","madhyamapuruṣaḥ","uttamapuruṣaḥ");
@number_iast = ("ekavacanam","dvivacanam","bahuvacanam");


my $outencoding = $ARGV[0];
$line_no = 0;
$lakAra_no = 0;
while($in = <STDIN>){
  chomp($in);
if($in){
  if($in=~/\?/){
         $in ="-";
  }
  if($line_no == 0) {
     if ($outencoding eq "IAST") {
         print "\"lakāra_$lakAra_no\":\"$disp_lakAra_iast[$lakAra_no]\",\"l_forms_$lakAra_no\":[";
     } else {
         print "\"lakAra_$lakAra_no\":\"$disp_lakAra[$lakAra_no]\",\"l_forms_$lakAra_no\":[";
     }
  }
  $in =~ s/[ \t][ \t]*/ /g;
  if($in eq "") { $in = "-\t-\t-";}
  @in = split(/ /,$in);
  if($in[0] eq "") { $in[0] = "-";}
  if($in[1] eq "") { $in[1] = "-";}
  if($in[2] eq "") { $in[2] = "-";}
  for($k=0;$k<3;$k++) {
    if ($outencoding eq "IAST") {
      print "{\"form\":\"$in[$k]\",\"person\":\"$person_iast[$line_no]\",\"number\":\"$number_iast[$k]\"}";
    } else {
      print "{\"form\":\"$in[$k]\",\"person\":\"$person[$line_no]\",\"number\":\"$number[$k]\"}";
    }
    if (not (($line_no == 2) && ($k == 2))) { print ",";}
  }
  $line_no++;
  if($line_no == 3) {
           $line_no = 0; 
           $lakAra_no++;
           print "]";
           if ($lakAra_no < 10) { print ",";}
  }
 }
}
