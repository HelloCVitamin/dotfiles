#!/bin/bash

# A lancer comme root
if ! [ $(id -u) = 0 ]; then
   echo "Use with sudo -E"
   exit 1
fi


# zsh
mkdir -p /usr/share/oh-my-zsh/custom/themes/
ln -sv $PWD/zsh/adri.zsh-theme /usr/share/oh-my-zsh/custom/themes/adri.zsh-theme
ln -sv $PWD/zsh/adri_agnoster.zsh-theme /usr/share/oh-my-zsh/custom/themes/adri_agnoster.zsh-theme

# bin
ln -sv $PWD/bin/ezchrome /usr/local/bin/ezchrome
ln -sv $PWD/bin/ezgvim /usr/local/bin/ezgvim
ln -sv $PWD/bin/ezskype /usr/local/bin/ezskype
ln -sv $PWD/bin/ezterminal /usr/local/bin/ezterminal
ln -sv $PWD/bin/dmenu_recent_aliases /usr/local/bin/dmenu_recent_aliases
ln -sv $PWD/bin/dmenu_solarized_light /usr/local/bin/dmenu_solarized_light
ln -sv $PWD/bin/dmenu_solarized_dark /usr/local/bin/dmenu_solarized_dark


