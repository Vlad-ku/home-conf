#!/usr/bin/env bash

BAT="/sys/class/power_supply/BAT0"

if [ -f $BAT ]; then
    status=$(cat $BAT/status)

    charge_now=$((         $(cat $BAT/charge_now)        /1000 ))

    charge_full=$((        $(cat $BAT/charge_full)       /1000 ))
    charge_full_design=$(( $(cat $BAT/charge_full_design)/1000 ))

    voltage_now=$((        $(cat $BAT/voltage_now)       /1000 ))
    voltage_min_design=$(( $(cat $BAT/voltage_min_design)/1000 ))

    pr1=$(( $charge_now*100/$charge_full        ))
    pr2=$(( $charge_now*100/$charge_full_design ))
    V1=$((  $voltage_now-$voltage_min_design    ))

    # echo $status' ['$pr1'/'$pr2']% ['$charge_now'/'$charge_full'/'$charge_full_design']W ['$V1']V'
    echo $status'['$pr1'/'$pr2']%'
else
    echo "⚡ null"
fi
