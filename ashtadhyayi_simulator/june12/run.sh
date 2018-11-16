#!/bin/bash

source ../../paths.sh

java get_SabdarUpa_new $1 $2 $3 $4|\
$SCLINSTALLDIR/converters/ri_skt | $SCLINSTALLDIR/converters/iscii2utf8.py 1
