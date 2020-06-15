#!/usr/bin/env bash

lan=$(ip route 2> /dev/null | awk '/^default/ { print $9 ; exit }')

if [ -z $lan ]
then
    lan='WEB null'
fi

echo $lan
