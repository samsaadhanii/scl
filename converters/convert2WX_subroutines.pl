#!/usr/bin/env perl 

#  Copyright (C) 2002-2023 Amba Kulkarni (ambapradeep@gmail.com)
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
require "CGIDIR/SCL_CGI/paths.pl";
my $myPATH = "CGIDIR/SCL_CGI/converters";

sub convert{
        my($encoding,$in_word) = @_;
        chomp($in_word);

        $conversion_program = "";
	my($out_word) = "";

        if($encoding eq "VH") {
           $conversion_program = "$myPATH/velthuis-wx.out";
        }
        elsif($encoding eq "KH") {
            $conversion_program = "$myPATH/kyoto_ra.out";          
        }
        elsif($encoding eq "SLP") {
            $conversion_program = "$myPATH/slp2wx.out";
        }
        elsif($encoding eq "Itrans") {
            $conversion_program = "$myPATH/itrans_ra.out";
        }
        elsif($encoding eq "Unicode") {
            $conversion_program = "$myPATH/utf82iscii.pl | $myPATH/ir_skt";
        } 
        elsif($encoding eq "IAST") {
            $conversion_program = "$myPATH/utf8roman2wx.out";
        } 

        if($conversion_program ne "") {
            $out_word = `echo $in_word | $conversion_program`;
        } else { $out_word = $in_word;}

chomp($out_word);
return $out_word; 
}
1;
