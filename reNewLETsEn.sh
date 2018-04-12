#!/bin/sh
echo "=== START ===" >> result.log
date >> result.log
echo " " >> result.log 

service nginx stop >&2 "nginx stop error" >> result.log
while IFS='' read -r line; do
/opt/letsencrypt/letsencrypt-auto certonly --standalone --renew-by-default -d $line >> result.log
done < "$1"
service nginx start >&2 "nginx start error" >> result.log

echo " " >> result.log
date >> result.log
echo "=== END ===" >> result.log
