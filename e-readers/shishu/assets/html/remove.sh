#!/usr/bin/sh

files=($(find . -type f -name SV-*.*))
for fileName in ${files[*]}
do
  rm $fileName;
done
