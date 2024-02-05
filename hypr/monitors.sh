#!/bin/sh

echo "monitoring workspaces"

# Attach workspaces to specific monitors on the monitor-added event.
# NOTE: currently leave laptop closed, so all are pinned to the new monitor.
handle() {
  echo "handling $1"
  case $1 in monitoradded*)
    hyprctl dispatch moveworkspacetomonitor "1 1"
    hyprctl dispatch moveworkspacetomonitor "2 1"
    hyprctl dispatch moveworkspacetomonitor "3 1"
    hyprctl dispatch moveworkspacetomonitor "4 1"
    hyprctl dispatch moveworkspacetomonitor "5 1"
    hyprctl dispatch moveworkspacetomonitor "6 1"
    hyprctl dispatch moveworkspacetomonitor "7 1"
    hyprctl dispatch moveworkspacetomonitor "8 1"
    hyprctl dispatch moveworkspacetomonitor "9 1"
    hyprctl dispatch moveworkspacetomonitor "10 1"
  esac
}

socat - "UNIX-CONNECT:/tmp/hypr/${HYPRLAND_INSTANCE_SIGNATURE}/.socket2.sock" | while read -r line; do handle "$line"; done
