#!/bin/bash -e

if [ -z "$BACKEND" ]
then
    echo No backend defined
    exit 1
fi

DATA=$(jq -n '{
    "backend": env.BACKEND,
    "inactive": env.INACTIVE,
    "max_size": env.MAX_SIZE,
}')
echo -e "Running with config: $DATA"

tmpl -data "$DATA" /etc/nginx/nginx.conf.tmpl

dnsmasq -u root -a 127.0.0.1 -z
exec "$@"
