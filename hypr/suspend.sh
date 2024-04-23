#!/bin/sh

# TODO: need to confirm better this is working.  Seems flaky.
swayidle -w \
  timeout 1200 'hyprctl dispatch dpms off' \
  timeout 3600 'systemctl suspend' \
  resume 'hyprctl dispatch dpms on' \
  before-sleep 'bw lock && swaylock -c000000'
