#!/usr/bin/env perl

#  Copyright (C) 2010-2012 Karunakar 2013-18 Amba Kulkarni
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

require "../paths.pl";
$myPATH="$GlblVar::CGIDIR/$GlblVar::SCL_CGI";

require "$myPATH/cgi_interface.pl";

 if($GlblVar::LOG eq "true"){
    if (! (-e "$GlblVar::TFPATH")){
        mkdir "$GlblVar::TFPATH" or die "Error creating directory $GlblVar::TFPATH";
    open(TMP1,">>$GlblVar::TFPATH/transliterate.log") || die "Can't open $GlblVar::TFPATH/transliterate.log for writing";
 }
}
    #TMP1 is a global variable; available for all the sub-routines in this file.


    #use CGI;

    #my $pid = $$;

#$query = new CGI;
#$query->header(-charset => 'UTF-8');

print "Content-type:text/html;-expires:60*60*24;charset:UTF-8\n\n";

my %param = &get_parameters();

$input = $param{src};
$src = $param{srclang};
$trgt = $param{tarlang};
chomp($src);
chomp($trgt);

 if($GlblVar::LOG eq "true"){
   print TMP1 $ENV{'REMOTE_ADDR'},"\t",$ENV{'HTTP_USER_AGENT'},"\n";
   print TMP1 "$input\tFrom:$src\tTo:$trgt\n###################\n";
   close(TMP1);
 }


$cnvrt_prgm = &get_prgm_nm($src,$trgt);
&my_convert($input,$cnvrt_prgm);

sub my_convert{

my($input,$cnvrt_prgm) = @_;

  if($cnvrt_prgm ne "") {
     if($input) {
        open TMP, "| $cnvrt_prgm ";
        print TMP $input,"\n";
        close TMP;
    }
  }
}

sub get_prgm_nm{
my($src,$trgt) = @_;
my($prgm_nm);

 
  if($src  eq "WX-Alphabetic"){
     if($trgt eq "Unicode-Devanagari"){
        $prgm_nm = "$myPATH/converters/ri_skt | $myPATH/converters/iscii2utf8.py 1";
     } elsif($trgt eq "Velthuis"){
	$prgm_nm = "$myPATH/converters/wx-velthuis.out";
     } elsif($trgt eq "Itrans"){
	$prgm_nm = "$myPATH/converters/ra_itrans.out";
     } elsif($trgt eq "SLP"){
	$prgm_nm = "$myPATH/converters/wx2slp.out";
     } elsif($trgt eq "Unicode-Roman-Diacritic"){
	$prgm_nm = "$myPATH/converters/wx2utf8roman.out";
     } elsif($trgt eq "Kyoto-Harvard"){
	$prgm_nm = "$myPATH/converters/ra_kyoto.out ";
	}
  }

  elsif($src  eq "Velthuis"){
     if($trgt eq "WX-Alphabetic"){
	$prgm_nm = "$myPATH/converters/velthuis-wx.out";
     }elsif($trgt eq "Unicode-Devanagari"){
        $prgm_nm = "$myPATH/converters/velthuis-wx.out | $myPATH/converters/ri_skt | $myPATH/converters/iscii2utf8.py 1";
     } elsif($trgt eq "Itrans"){
	$prgm_nm = "$myPATH/converters/velthuis-wx.out | $myPATH/converters/ra_itrans.out";
     } elsif($trgt eq "SLP"){
	$prgm_nm = "$myPATH/converters/velthuis-wx.out | $myPATH/converters/wx2slp.out";
     } elsif($trgt eq "Unicode-Roman-Diacritic"){
	$prgm_nm = "$myPATH/converters/velthuis-wx.out | $myPATH/converters/wx2utf8roman.out";
     } elsif($trgt eq "Kyoto-Harvard"){
	$prgm_nm = "$myPATH/converters/velthuis-wx.out | $myPATH/converters/ra_kyoto.out";
	}
	
  }

  elsif($src  eq "Unicode-Devanagari"){
     if($trgt eq "WX-Alphabetic"){
	$prgm_nm = "$myPATH/converters/utf82iscii.pl | $myPATH/converters/ir_skt";
     }elsif($trgt eq "Velthuis"){
        $prgm_nm = "$myPATH/converters/utf82iscii.pl | $myPATH/converters/ir_skt | $myPATH/converters/wx-velthuis.out";
     } elsif($trgt eq "Itrans"){
	$prgm_nm = "$myPATH/converters/utf82iscii.pl | $myPATH/converters/ir_skt | $myPATH/converters/ra_itrans.out";
     } elsif($trgt eq "SLP"){
	$prgm_nm = "$myPATH/converters/utf82iscii.pl | $myPATH/converters/ir_skt | $myPATH/converters/wx2slp.out";
     } elsif($trgt eq "Unicode-Roman-Diacritic"){
	$prgm_nm = "$myPATH/converters/utf82iscii.pl | $myPATH/converters/ir_skt | $myPATH/converters/wx2utf8roman.out";
     }elsif($trgt eq "Kyoto-Harvard") {
		$prgm_nm = "$myPATH/converters/utf82iscii.pl | $myPATH/converters/ir_skt | $myPATH/converters/ra_kyoto.out";
   }
  }

  elsif($src  eq "Itrans"){
     if($trgt eq "WX-Alphabetic"){
	$prgm_nm = "$myPATH/converters/itrans_ra.out | $myPATH/converters/rm__between_vowels.out";
     }elsif($trgt eq "Velthuis"){
        $prgm_nm = "$myPATH/converters/itrans_ra.out | $myPATH/converters/rm__between_vowels.out| $myPATH/converters/wx-velthuis.out";
     } elsif($trgt eq "Unicode-Devanagari"){
	$prgm_nm = "$myPATH/converters/itrans_ra.out | $myPATH/converters/rm__between_vowels.out | $myPATH/converters/ri_skt | $myPATH/converters/iscii2utf8.py 1";
     } elsif($trgt eq "SLP"){
	$prgm_nm = "$myPATH/converters/itrans_ra.out | $myPATH/converters/rm__between_vowels.out | $myPATH/converters/wx2slp.out";
     } elsif($trgt eq "Unicode-Roman-Diacritic"){
	$prgm_nm = "$myPATH/converters/itrans_ra.out | $myPATH/converters/rm__between_vowels.out | $myPATH/converters/wx2utf8roman.out";
     }elsif($trgt eq "Kyoto-Harvard") {
		$prgm_nm = "$myPATH/converters/itrans_ra.out | $myPATH/converters/rm__between_vowels.out | $myPATH/converters/ra_kyoto.out ";
	}
  }

  elsif($src  eq "SLP"){
     if($trgt eq "WX-Alphabetic"){
	$prgm_nm = "$myPATH/converters/slp2wx.out";
     }elsif($trgt eq "Velthuis"){
        $prgm_nm = "$myPATH/converters/slp2wx.out | $myPATH/converters/wx-velthuis.out";
     } elsif($trgt eq "Unicode-Devanagari"){
	$prgm_nm = "$myPATH/converters/slp2wx.out | $myPATH/converters/ri_skt | $myPATH/converters/iscii2utf8.py 1";
     } elsif($trgt eq "Itrans"){
	$prgm_nm = "$myPATH/converters/slp2wx.out | $myPATH/converters/ra_itrans.out";
     } elsif($trgt eq "Unicode-Roman-Diacritic"){
	$prgm_nm = "$myPATH/converters/slp2wx.out | $myPATH/converters/wx2utf8roman.out";
     }elsif($trgt eq "Kyoto-Harvard"){
        $prgm_nm = "$myPATH/converters/slp2wx.out | $myPATH/converters/ra_kyoto.out";
     }
  }

  elsif($src  eq "Unicode-Roman-Diacritic"){
     if($trgt eq "WX-Alphabetic"){
	$prgm_nm = "$myPATH/converters/utf8roman2wx.out";
     }elsif($trgt eq "Velthuis"){
        $prgm_nm = "$myPATH/converters/utf8roman2wx.out | $myPATH/converters/wx-velthuis.out";
     } elsif($trgt eq "Unicode-Devanagari"){
	$prgm_nm = "$myPATH/converters/utf8roman2wx.out | $myPATH/converters/ri_skt | $myPATH/converters/iscii2utf8.py 1";
     } elsif($trgt eq "Itrans"){
	$prgm_nm = "$myPATH/converters/utf8roman2wx.out | $myPATH/converters/ra_itrans.out";
     } elsif($trgt eq "SLP"){
	$prgm_nm = "$myPATH/converters/utf8roman2wx.out | $myPATH/converters/wx2slp.out";
     }elsif($trgt eq "Kyoto-Harvard"){
        $prgm_nm = "$myPATH/converters/utf8roman2wx.out | $myPATH/converters/ra_kyoto.out";
     }
  }

  elsif($src eq "Kyoto-Harvard") {
   if($trgt eq "WX-Alphabetic"){
	$prgm_nm = "$myPATH/converters/kyoto_ra.out";
     }elsif($trgt eq "Velthuis"){
        $prgm_nm = "$myPATH/converters/kyoto_ra.out | $myPATH/converters/wx-velthuis.out";
     } elsif($trgt eq "Unicode-Devanagari"){
	$prgm_nm = "$myPATH/converters/kyoto_ra.out | $myPATH/converters/ri_skt | $myPATH/converters/iscii2utf8.py 1";
     } elsif($trgt eq "Itrans"){
	$prgm_nm = "$myPATH/converters/kyoto_ra.out | $myPATH/converters/ra_itrans.out";
     } elsif($trgt eq "SLP"){
	$prgm_nm = "$myPATH/converters/kyoto_ra.out | $myPATH/converters/wx2slp.out";
     }elsif($trgt eq "Unicode-Roman-Diacritic"){
	$prgm_nm = "$myPATH/converters/kyoto_ra.out | $myPATH/converters/wx2utf8roman.out";
     }

  }
  elsif($src eq $trgt) {
     print "The source and target transliteration schemes are the same!";
     $prgm_nm = "";
  }
$prgm_nm;
}
1;
