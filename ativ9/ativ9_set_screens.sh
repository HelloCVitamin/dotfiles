#!/bin/bash

# Set xrandr, DPI and tint2 according to whether an external screen is plugged in or not

single_dpi=196
multi_dpi=96

single_tint2_config_file=~/.dotfiles/tint2/tint2rc
multi_tint2_config_file=~/.dotfiles/tint2/tint2rc_multihead


function usage {
    echo "Usage:"
    echo "$0 single"
    echo "or"
    echo "$0 multi"
    exit
}

function set_xrdb() {
    echo "Xft.dpi: $1" > /tmp/temp_Xressources
    xrdb -merge /tmp/temp_Xressources
    rm /tmp/temp_Xressources
    echo "==> xrdb done"
}

function set_tint2() {
    killall tint2
    tint2 $1&
    echo "==> tint2 done"
}

if [[ $# -ne 1 ]]; then
    usage
fi

if [[ $1 = "single" ]]; then
    set_xrdb $single_dpi
    set_tint2 $single_tint2_config_file
    xrandr --auto --output eDP1 --mode 3200x1800 --output HDMI1 --off
elif [[ $1 = "multi" ]]; then
    set_xrdb $multi_dpi
    set_tint2 $multi_tint2_config_file
    xrandr --auto --output eDP1 --mode 3200x1800 --right-of HDMI1
else
    usage
fi
