#!/bin/bash -e

if [ -z "$BACKEND" ]
then
    echo No backend defined
    exit 1
fi

DATA='
{
    "backend": "'$BACKEND'",
    "inactive": "'$INACTIVE'",
    "max_size": "'$MAX_SIZE'"
}'
echo -e "Running with config: $DATA"

# render with tmpl
tmpl -data "$DATA" /etc/nginx/nginx.conf.tmpl

dnsmasq -u root -a 127.0.0.1 -z -k &
nginx -g "daemon off;" &

# poor man's supervisor: if any child dies, kill the rest
wait -nf && kill -9 $(jobs -p)
