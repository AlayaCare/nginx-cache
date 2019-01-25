#!/bin/sh

if [ -z "$BACKEND" ]
then
    echo No BACKEND defined
    exit 1
fi

if [ -z "$HOST_HEADER" ]
then
    export HOST_HEADER='$host'
fi

cat /etc/nginx/conf.d/cache.conf.template | \
   envsubst '$BACKEND' | \
   envsubst '$HOST_HEADER' > \
   /etc/nginx/conf.d/cache.conf

exec nginx -g 'daemon off;'
