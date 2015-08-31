#!/bin/bash

while true; do 
	wget "http://localhost/" -O /dev/null --no-cookies --header="Cookie: PHPSESSID=arandomsession1234567890" --server-response 2>&1 | grep "HTTP/1.1"
done
