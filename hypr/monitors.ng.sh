#!/usr/bin/env bash

mon1="HDMI-A-1" # Primary monitor
mon2="eDP-1" # Secondary
ws_limit=6 # how many workspaces on the primary monitor
logfile="$HOME/.local/share/hypr/log.txt"

handle() {
    if [[ ${1:0:15} == "createworkspace" ]]; then
        ws=$(( ${1:17:19} ))
        if (( $(($ws <= $ws_limit)) )); then
            echo "hyprctl dispatch moveworkspacetomonitor \"$ws $mon1\"" >> $logfile
            hyprctl dispatch moveworkspacetomonitor "$ws $mon1" >> $logfile
        else
            echo "hyprctl dispatch moveworkspacetomonitor  \"$ws $mon2\"" >> $logfile
            hyprctl dispatch moveworkspacetomonitor  "$ws $mon2" >> $logfile
        fi
    elif [[ ${1:0:9} == "workspace" ]]; then
        ws=$(( ${1:11:13} ))
        if (( $(($ws <= $ws_limit)) )); then
            echo "hyprctl dispatch moveworkspacetomonitor  \"$ws $mon1\"" >> $logfile
            hyprctl dispatch moveworkspacetomonitor  "$ws $mon1" >> $logfile
        else
            echo "hyprctl dispatch moveworkspacetomonitor  \"$ws $mon2\"" >> $logfile
            hyprctl dispatch moveworkspacetomonitor  "$ws $mon2" >> $logfile
        fi
    fi
}

echo "connecting socket"
socat - "UNIX-CONNECT:/tmp/hypr/${echo $HYPRLAND_INSTANCE_SIGNATURE}/.socket2.sock" | while read -r line; do handle "$line"; done
