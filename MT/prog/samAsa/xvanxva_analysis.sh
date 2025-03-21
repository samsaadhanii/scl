#!/bin/bash

myPATH=$1

source $1/paths.sh

ANU_MT_PATH=$myPATH/MT/prog

python3 $ANU_MT_PATH/samAsa/run_xvanxva.py $2 $3


# Hyphens for non-final components
# Check complex compounds
