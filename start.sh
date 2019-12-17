#!/bin/bash -e

if [ -z "$BACKEND" ]
then
    echo No backend defined
    exit 1
fi

echo "Running with config:"
echo "   BACKEND: $BACKEND"
echo "  INACTIVE: $INACTIVE"
echo "  MAX_SIZE: $MAX_SIZE"

gomplate -f /etc/nginx/nginx.conf.tmpl -o /etc/nginx/nginx.conf

dnsmasq -u root -a 127.0.0.1 -z
exec "$@"
