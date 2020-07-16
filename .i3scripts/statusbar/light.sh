#!/usr/bin/env bash

echo "LIGHT "$(xbacklight 2> /dev/null || echo "null")
