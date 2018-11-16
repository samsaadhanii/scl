#!/bin/bash

source ../../paths.sh
exec 3>$TFPATH/skt_splitter_to
exec 4<$TFPATH/skt_splitter_from
echo $1 >&3
echo -e '\0' >&3
while read -r -d '' <&4; do echo -n "$REPLY"; break; done
