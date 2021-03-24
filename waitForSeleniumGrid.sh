#!/bin/bash -l

set -e

docker ps -a 

while ! curl -sSL "http://172.17.0.1:4444/wd/hub/status" 2>&1 \
        | jq -r '.value.ready' 2>&1 | grep "true" >/dev/null; do
    echo 'Waiting for the Grid'
    sleep 5
done

>&2 echo "Selenium Grid is up - executing tests"