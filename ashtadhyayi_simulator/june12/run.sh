#!/bin/bash

source ../paths.sh

java get_SabdarUpa_new $1 $2 $3 $4 |\
$CGIDIR/$SCL_CGI/converters/ri_skt | $CGIDIR/$SCL_CGI/converters/iscii2utf8.py 1
