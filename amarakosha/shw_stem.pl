#!/usr/bin/env perl

#  Copyright (C) 2006-2011 Sivaja Nair and (2006-2023) Amba Kulkarni (ambapradeep@gmail.com)
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

BEGIN{require "../paths.pl";}

#use lib $GlblVar::LIB_PERL_PATH;

#use GDBM_File;

#my($LEX);
#tie(%LEX,GDBM_File,"$GlblVar::SCLINSTALLDIR/amarakosha/DBM/stem2head.gdbm",GDBM_READER,0666) || die "can't open DBM/stem2head.gdbm";

open(TMP,"$GlblVar::SCLINSTALLDIR/amarakosha/DBM/all_kANdas") || die "can't open DBM/all_kANdas";
$key = 0;
$value = 4;
while(<TMP>) {
  chomp;
  @flds = split(/,/,$_);
  if(($flds[0] !~ /^%/) && ($flds[$key] ne "") && ($flds[$value] ne "")) {
     if($LEX{$flds[$key]} eq "") {
        $LEX{$flds[$key]}  =  $flds[$value];
     }else {
        if (($LEX{$flds[$key]} !~ /::$flds[$value]::/) &&
             ($LEX{$flds[$key]} !~ /^$flds[$value]::/) &&
             ($LEX{$flds[$key]} !~ /::$flds[$value]$/) &&
             ($LEX{$flds[$key]} !~ /^$flds[$value]$/)) {
        $LEX{$flds[$key]}  .= "::". $flds[$value];
        }
     }
  }
}
close(TMP);

$word = $ARGV[0];

&shwMorph($word);

untie(%LEX);
		
sub shwMorph{
my($word) = @_;
$word =~ s/[^a-zA-Z]//g;
$result = `echo $word | $GlblVar::LTPROCBIN -c $GlblVar::SCLINSTALLDIR/morph_bin/all_morf.bin`;
$result=~ s/\^|\$//g;
$result=~ s/\//#/g;
@flds=split(/#/,$result);
    foreach $fld (@flds) {
       $fld =~ s/<.*//;
       if($LEX{$fld} ne "") { print $fld,"\n";}
    }
}
1;
