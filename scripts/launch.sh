#!/bin/bash
echo "hi"
x=1
echo eval(cat /dev/urandom)
echo "x is $x"
NEW_UUID=`(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)`
echo "$NEW_UUID"
