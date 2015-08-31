#!/bin/bash

while true; do 
	PHPSESSID=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 16 | head -n 1)
	wget "http://localhost/" -O /dev/null --no-cookies --header="Cookie: PHPSESSID=$PHPSESSID" --server-response 2>&1 | grep "HTTP/1.1"
done
