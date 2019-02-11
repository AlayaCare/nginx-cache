#!/bin/bash


function host_header() {
    echo "$1" | sed -E -e 's|(https?://)?([^/@]+@)?([^/]+).*|\3|'
}

function main() {
    if [ -z "$BACKEND" ]
    then
        echo No BACKEND defined
        exit 1
    fi

    if [ -z "$HOST_HEADER" ]
    then
        export HOST_HEADER=$(host_header "$BACKEND")
    fi

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
}

if [ "$0" == "$BASH_SOURCE" ]
then
    main "$@"
fi
