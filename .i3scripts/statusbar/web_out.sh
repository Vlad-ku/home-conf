#!/usr/bin/env bash

echo $(curl http://ip-api.com/json | jq '.query+" "+.countryCode+" "+.region' -r)
