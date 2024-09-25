#!/usr/bin/bash

files=($(find . -type f -name SV-*.*))
for fileName in ${files[*]}
do
  rm $fileName;
done
