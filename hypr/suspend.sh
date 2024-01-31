#!/bin/sh

swayidle -w \
  timeout 1200 ' hyprctl dispatch dpms off' \
  timeout 3600' systemctl suspend' \
  resume ' hyprctl dispatch dpms on' \
  before-sleep 'swaylock -c000000'
