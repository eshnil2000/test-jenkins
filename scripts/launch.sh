#!/usr/bin/env sh

set -x
export NEW_UUID=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)
echo $NEW_UUID
sleep 1
echo $! > .pidfile
set +x
