#!/usr/bin/env perl 

#  Copyright (C) 2002-2023 Amba Kulkarni (ambapradeep@gmail.com)
#  and K Parameshwari (parameshkrishnaa@gmail.com)
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


sub convert{
        my($encoding,$in_word,$path) = @_;

           chomp($in_word);
           $conversion_program = "";
        if($encoding eq "VH") {
           $conversion_program = "$path/converters/velthuis-wx.out";
         }
        elsif($encoding eq "KH") {
            $conversion_program = "$path/converters/kyoto_ra.out";          
         }
        elsif($encoding eq "SLP") {
            $conversion_program = "$path/converters/slp2wx.out";
         }
        elsif($encoding eq "Itrans") {
            $conversion_program = "$path/converters/itrans_ra.out";
         }
        elsif($encoding eq "Unicode") {
            $conversion_program = "$path/converters/utf82iscii.pl | $path/converters/ir_skt";
         } 
       # elsif($encoding eq "tlgUnicode") {
       #     $conversion_program = "$path/converters/utf82iscii.pl | $path/converters/ir_skt";
       #  } 
        elsif($encoding eq "IAST") {
            $conversion_program = "$path/converters/utf8roman2wx.out";
         } 

         if($conversion_program ne "") {
            if ($in_word =~ /'/) { $in_word =~ s/'/\\'/;}
            $out_word = `echo $in_word | $conversion_program`;
          } else { $out_word = $in_word;}

chomp($out_word);
return $out_word; 
}
1;
