#!/bin/bash

# test that the computation of HOST_HEADER from BACKEND
# behaves as expected

source start.sh

function test_case() {
    EXPECTED_HOST_HEADER="$2"
    HOST_HEADER=$(host_header "$1")
    if [ "$HOST_HEADER" = "$EXPECTED_HOST_HEADER" ]
    then
        echo "OK: $1 -> $HOST_HEADER"
    else
        echo "FAIL: $1 -> $HOST_HEADER (expected $EXPECTED_HOST_HEADER)"
    fi
}

test_case example.com example.com
test_case example.com/ example.com
test_case example.com/asdf example.com
test_case user:pass@example.com example.com
test_case user:pass@example.com/ example.com
test_case user:pass@example.com/asdf example.com
test_case http://example.com example.com
test_case http://example.com/ example.com
test_case http://example.com/asdf example.com
test_case https://example.com example.com
test_case https://example.com/ example.com
test_case https://example.com/asdf/qwer example.com
test_case http://user:pass@example.com example.com
test_case http://user:pass@example.com/ example.com
test_case http://user:pass@example.com/asdf example.com
test_case https://user:pass@example.com example.com
test_case https://user:pass@example.com/ example.com
test_case https://user:pass@example.com/asdf example.com
test_case example.com:8080 example.com:8080
test_case example.com:8080/ example.com:8080
test_case example.com:8080/asdf example.com:8080
test_case user:pass@example.com:8080 example.com:8080
test_case user:pass@example.com:8080/ example.com:8080
test_case user:pass@example.com:8080/asdf example.com:8080
test_case http://example.com:8080 example.com:8080
test_case http://example.com:8080/ example.com:8080
test_case http://example.com:8080/asdf example.com:8080
test_case https://example.com:8080 example.com:8080
test_case https://example.com:8080/ example.com:8080
test_case https://example.com:8080/asdf/qwer example.com:8080
test_case http://user:pass@example.com:8080 example.com:8080
test_case http://user:pass@example.com:8080/ example.com:8080
test_case http://user:pass@example.com:8080/asdf example.com:8080
test_case https://user:pass@example.com:8080 example.com:8080
test_case https://user:pass@example.com:8080/ example.com:8080
test_case https://user:pass@example.com:8080/asdf example.com:8080
