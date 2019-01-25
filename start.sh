#!/bin/sh

if [ -z "$BACKEND" ]
then
    echo No BACKEND defined
    exit 1
fi

if [ -z "$HOST_HEADER" ]
then
    export HOST_HEADER=$(echo "$BACKEND" | sed -E -e 's|(.*https?://)?([^/@]+@)?([^/:]+).*|\3|')
fi

export INACTIVE=${INACTIVE:-'5m'}
export MAX_SIZE=${MAX_SIZE:-'20m'}

echo "BACKEND: $BACKEND"
echo "HOST_HEADER: $HOST_HEADER"
echo "INACTIVE: $INACTIVE"
echo "MAX_SIZE: $MAX_SIZE"

cat /etc/nginx/nginx.conf.template \
   | envsubst '$BACKEND' \
   | envsubst '$HOST_HEADER' \
   | envsubst '$INACTIVE' \
   | envsubst '$MAX_SIZE' \
   > /etc/nginx/nginx.conf

echo "exec ""$@"
exec "$@"
