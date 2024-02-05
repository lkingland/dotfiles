#!/usr/bin/env bash

# Monitor IDs as reported to hyprland
mon1="HDMI-A-1"
mon2="eDP-1"

# Pin 0...{ws_limit} workspaces to mon1, rest to mon2
# Note: currently all 10 are pinned to external monitor if attached
# since I keep the laptop shut when plugged in.
ws_limit=10 

logfile="$HOME/.local/share/hypr/log.txt"

handle() {
    if [[ ${1:0:15} == "createworkspace" ]]; then
        ws=$(( ${1:17:19} ))
        if (( $(($ws <= $ws_limit)) )); then
            echo "CREATE: hyprctl dispatch moveworkspacetomonitor \"$ws $mon1\"" >> $logfile
            hyprctl dispatch moveworkspacetomonitor "$ws $mon1" >> $logfile
        else
            echo "CREATE: hyprctl dispatch moveworkspacetomonitor  \"$ws $mon2\"" >> $logfile
            hyprctl dispatch moveworkspacetomonitor  "$ws $mon2" >> $logfile
        fi
    elif [[ ${1:0:9} == "workspace" ]]; then
        ws=$(( ${1:11:13} ))
        if (( $(($ws <= $ws_limit)) )); then
            echo "FOCUS: hyprctl dispatch moveworkspacetomonitor  \"$ws $mon1\"" >> $logfile
            hyprctl dispatch moveworkspacetomonitor  "$ws $mon1" >> $logfile
        else
            echo "FOCUS: hyprctl dispatch moveworkspacetomonitor  \"$ws $mon2\"" >> $logfile
            hyprctl dispatch moveworkspacetomonitor  "$ws $mon2" >> $logfile
        fi
    else
        echo "unrecognized: $1"
    fi
}

echo "connecting socket for monitor workspace watcher"
echo "connecting socket for monitor workspace watcher" >> $logfile
socat - "UNIX-CONNECT:/tmp/hypr/${HYPRLAND_INSTANCE_SIGNATURE}/.socket2.sock" | while read -r line; do handle "$line"; done
