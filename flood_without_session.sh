#!/bin/bash

while true; do 
	wget "http://localhost/" -O /dev/null --server-response 2>&1 | grep "HTTP/1.1"
done
