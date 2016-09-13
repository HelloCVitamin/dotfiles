#!/bin/bash

# A lancer comme root
if ! [ $(id -u) = 0 ]; then
   echo "Use with sudo -E"
   exit 1
fi

# delete
rm $HOME/.config/openbox/autostart
rm $HOME/.config/openbox/rc.xml
rm $HOME/.config/tint2/tint2rc
rm $HOME/.config/xfce4/terminal/terminalrc
rm $HOME/.zsh_aliases
rm $HOME/.zshenv
rm $HOME/.zshrc
rm $HOME/.tmux.conf
rm $HOME/.gvimrc
rm $HOME/.vimrc
rm -r $HOME/.vim
rm /usr/share/oh-my-zsh/custom/themes/adri.zsh-theme
rm /usr/local/bin/ezchrome
rm /usr/local/bin/ezgvim
rm /usr/local/bin/ezskype
rm /usr/local/bin/ezterminal
rm /usr/local/bin/dmenu_recent_aliases
rm /usr/local/bin/dmenu_solarized_light
rm /usr/local/bin/dmenu_solarized_dark
rm $HOME/.gitconfig


# Openbox
mkdir -p $HOME/.config/openbox/
ln -sv $PWD/openbox/autostart $HOME/.config/openbox/autostart
ln -sv $PWD/openbox/rc.xml $HOME/.config/openbox/rc.xml

# Tint2
mkdir -p $HOME/.config/tint2/
ln -sv $PWD/tint2/tint2rc $HOME/.config/tint2/tint2rc

# xfce4-terminal
mkdir -p $HOME/.config/xfce4/terminal/
ln -sv $PWD/xfce4-terminal/terminalrc $HOME/.config/xfce4/terminal/terminalrc

# zsh
mkdir -p /usr/share/oh-my-zsh/custom/themes/
ln -sv $PWD/zsh/adri.zsh-theme /usr/share/oh-my-zsh/custom/themes/adri.zsh-theme
ln -sv $PWD/zsh/.zsh_aliases $HOME/.zsh_aliases
ln -sv $PWD/zsh/.zshenv $HOME/.zshenv
ln -sv $PWD/zsh/.zshrc $HOME/.zshrc

# tmux
ln -sv $PWD/tmux/.tmux.conf $HOME/.tmux.conf

# vim
ln -sv $PWD/vim/.gvimrc $HOME/.gvimrc
ln -sv $PWD/vim/.vimrc $HOME/.vimrc
ln -sv $PWD/vim $HOME/.vim
git clone https://github.com/VundleVim/Vundle.vim.git $PWD/vim/bundle/Vundle.vim
vim +PluginInstall +qall
cd $PWD/vim/bundle/Command-T/ruby/command-t
ruby extconf.rb
make
cd -

# bin
ln -sv $PWD/bin/ezchrome /usr/local/bin/ezchrome
ln -sv $PWD/bin/ezgvim /usr/local/bin/ezgvim
ln -sv $PWD/bin/ezskype /usr/local/bin/ezskype
ln -sv $PWD/bin/ezterminal /usr/local/bin/ezterminal
ln -sv $PWD/bin/dmenu_recent_aliases /usr/local/bin/dmenu_recent_aliases
ln -sv $PWD/bin/dmenu_solarized_light /usr/local/bin/dmenu_solarized_light
ln -sv $PWD/bin/dmenu_solarized_dark /usr/local/bin/dmenu_solarized_dark

# git
ln -sv $PWD/git/.gitconfig $HOME/.gitconfig


