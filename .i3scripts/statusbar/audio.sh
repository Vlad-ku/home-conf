#!/usr/bin/env bash

mute=$(pacmd list-sinks 2> /dev/null | grep "muted:" | head -n 1 | tr -d '[:space:]')
volume=$(pacmd list-sinks 2> /dev/null | grep "volume:" | grep -o '...%' | head -n 1)

if [[ $mute = "muted:no" ]]
  then mute='on'
  else mute='off'
fi

if [[ -n "$volume" ]]
    then echo '♪ '$volume' '$mute
    else echo "AUDIO null"
fi
