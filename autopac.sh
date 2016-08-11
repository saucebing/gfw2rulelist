#!/bin/bash

GFWLIST=https://raw.githubusercontent.com/gfwlist/gfwlist/master/gfwlist.txt
PROXY=127.0.0.1:1080

cd `dirname "${BASH_SOURCE[0]}"`
echo "Downloading gfwlist from $GFWLIST"
export http_proxy=127.0.0.1:1080
curl "$GFWLIST" > /tmp/gfwlist.txt
/usr/bin/gfwlist2pac \
	    --input /tmp/gfwlist.txt \
			--file proxy.pac \
			--proxy "SOCKS5 $PROXY; SOCKS $PROXY; DIRECT" \
			--user-rule user_rule.txt

rm -f /tmp/gfwlist.txt
./extract.py
