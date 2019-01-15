#!/bin/sh

#  Copyright (C) 2009-2019 Amba Kulkarni (ambapradeep@gmail.com)
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

SCLINSTALLDIR=$1
LTPROCBIN=$2

export BIN_PATH=$SCLINSTALLDIR/morph_bin

DEBUG="OFF"

cut -f4 | perl -pe 's/\-/\-\n-/g' | $SCLINSTALLDIR/SHMT/prog/Normalisation/get_std_spelling.out |\
$SCLINSTALLDIR/SHMT/prog/Normalisation/group.pl |\
$SCLINSTALLDIR/SHMT/prog/morph/bin/split-samAsa-wrds.pl $TMP_FILES_PATH/tmpall $TMP_FILES_PATH/tmpany $TMP_FILES_PATH/tmpsamb $TMP_FILES_PATH/tmpupaxa

#/usr/bin/time -f "%Uuser %Ssystem %Eelapsed %PCPU (%Xtext+%Ddata %Mmax)k\n%Iinputs+%Ooutputs (%Fmajor+%Rminor)pagefaults %Wswaps %C\n" 
$LTPROCBIN -c $BIN_PATH/samAsa_upaxa.bin < $TMP_FILES_PATH/tmpupaxa | perl -pe 's/\//=/;s/^.*=\*.*//;s/.*=//;s/^^//;s/\$$//;' > $TMP_FILES_PATH/tmp_n1
/usr/bin/lt-proc -c $BIN_PATH/samboXana.bin < $TMP_FILES_PATH/tmpsamb | perl -pe 's/\//=/;s/^.*=\*.*//;s/.*=//;s/^^//;s/\$$//' > $TMP_FILES_PATH/tmp_n2
/usr/bin/lt-proc -c $BIN_PATH/all_but_samboXana_morf.bin < $TMP_FILES_PATH/tmpany | perl -pe 's/\//=/;s/^.*=\*.*//;s/.*=//;s/^^//;s/\$$//;s/[a-zA-Z]+<vargaH:sa-pU-pa><lifgam:[^>]+><level:0>//g;s/>([a-zA-Z]+)</><kqw_pratipadika:\1></g;' > $TMP_FILES_PATH/tmp_n3

paste -d'/' $TMP_FILES_PATH/tmp_n3 $TMP_FILES_PATH/tmp_n2 $TMP_FILES_PATH/tmp_n1 | perl -pe 's/\/\//\//g;' > $TMP_FILES_PATH/tmp_n

#w1=`grep . $TMP_FILES_PATH/tmp_upada_samAsa-wrds | wc -w`
#if [ $w1 -gt 0 ]; then
#/usr/bin/time -f "\t%Uuser %Ssystem %Eelapsed %PCPU (%Xtext+%Ddata %Mmax)k\n%Iinputs+%Ooutputs (%Fmajor+%Rminor)pagefaults %Wswaps %C\n" 
#/usr/bin/lt-proc -c $BIN_PATH/skt_samAsanoun_morf.bin < $TMP_FILES_PATH/tmp_samAsa-wrds | perl -pe 's/\//=/;s/^.*=\*.*//;s/.*=//;s/^^//;s/^-$//;' > $TMP_FILES_PATH/tmp_samAsa
#/usr/bin/lt-proc -c $BIN_PATH/all_but_samboXana_morf_Apte.bin < $TMP_FILES_PATH/tmp_upada_samAsa-wrds | perl -pe 's/\//=/;s/^.*=\*.*//;s/.*=//;s/^^//;s/^-$//;' > $TMP_FILES_PATH/tmp_samAsa
#/usr/bin/lt-proc -c $BIN_PATH/skt_morf.bin < $TMP_FILES_PATH/tmp_samAsa-wrds | perl -pe 's/\//=/;s/^.*=\*.*//;s/.*=//;s/^^//;s/^-$//;' > $TMP_FILES_PATH/tmp_samAsa2
#paste -d'/' $TMP_FILES_PATH/tmp_samAsa1 $TMP_FILES_PATH/tmp_samAsa2 | perl -pe 's/^\///' > $TMP_FILES_PATH/tmp_samAsa
#else
#touch $TMP_FILES_PATH/tmp_samAsa
#fi

#paste -d= $TMP_FILES_PATH/tmpall $TMP_FILES_PATH/tmp_n | perl -pe 's/\/$//;s/^=//;s/=\//=/; s/\-$//' > $TMP_FILES_PATH/tmp_all
#cat $TMP_FILES_PATH/tmp_non-samAsa-ppada-wrds | sed '1,$s/^\-//' | /usr/bin/time -f "\t%Uuser %Ssystem %Eelapsed %PCPU (%Xtext+%Ddata %Mmax)k\n%Iinputs+%Ooutputs (%Fmajor+%Rminor)pagefaults %Wswaps %C\n" /usr/bin/lt-proc -c $BIN_PATH/kqw_lyap_morf.bin | perl -pe 's/\//=/;s/^.*=\*.*//;s/.*=//;s/^^//;' > $TMP_FILES_PATH/tmp_k
#/usr/bin/time -f "\t%Uuser %Ssystem %Eelapsed %PCPU (%Xtext+%Ddata %Mmax)k\n%Iinputs+%Ooutputs (%Fmajor+%Rminor)pagefaults %Wswaps %C\n" 
#cat $TMP_FILES_PATH/tmp_std | perl -pe 's/^\-//' | 
#/usr/bin/lt-proc -c $BIN_PATH/kqw_lyap_morf.bin | perl -pe 's/\//=/;s/^.*=\*.*//;s/.*=//;s/^^//;' > $TMP_FILES_PATH/tmp_k


$SCLINSTALLDIR/SHMT/prog/morph/bin/handle_Namul_next.pl < $TMP_FILES_PATH/tmp_n | $SCLINSTALLDIR/SHMT/prog/morph/bin/handle_Namul_prev.pl  | perl -pe 's/=\//=/;s/\$$//g' > $TMP_FILES_PATH/tmp_nn

paste -d= $TMP_FILES_PATH/tmpall $TMP_FILES_PATH/tmp_nn | perl -pe 's/\/$//;s/^=//;s/=\//=/; s/\-$//'
#Now that kqw analysis is integrated with the morph analysis, we do not need the following.
##get derivational info for kqw analysis 
#cat $TMP_FILES_PATH/tmp_k | perl -pe 's/\//\n/g;s/<.*>//g;s/\$$//g' | grep -v '^=/$' | sort -u | grep . > $TMP_FILES_PATH/tmp_k_words
#
#w1=`grep . $TMP_FILES_PATH/tmp_k_words | wc -w`
#if [ $w1 -gt 0 ]; then
##/usr/bin/time -f "\t%Uuser %Ssystem %Eelapsed %PCPU (%Xtext+%Ddata %Mmax)k\n%Iinputs+%Ooutputs (%Fmajor+%Rminor)pagefaults %Wswaps %C\n" 
#/usr/bin/lt-proc -c $BIN_PATH/kqw_lyap_morf.bin < $TMP_FILES_PATH/tmp_k_words |\
#perl -pe 's/\//=/;s/^.*=\*.*//;s/.*=//;s/^^//;' > $TMP_FILES_PATH/tmp_k1
#paste -d'/' $TMP_FILES_PATH/tmp_k_words $TMP_FILES_PATH/tmp_k1 | perl -pe 's/^\//=/;s/\/$//;s/^=$//' | sort -u > $OutKqwFile
#else
#touch $OutKqwFile
#fi

#if [ $DEBUG = "OFF" ]; then
#  rm -f $TMP_FILES_PATH/tmp_std $TMP_FILES_PATH/tmp_n $TMP_FILES_PATH/tmp_samAsa $TMP_FILES_PATH/tmp_k $TMP_FILES_PATH/tmp_all $TMP_FILES_PATH/tmp_k1 $TMP_FILES_PATH/tmp_k_words
#fi
