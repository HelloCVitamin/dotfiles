#!/bin/bash


if [ "$#" -ne 1 ]; then
    echo "Usage: ./configure.sh single|multi"
    exit 1
fi

if [ "$1" == "single" ]; then
    echo $1
elif [ "$1" == "multi" ]; then
    echo $1
else
    echo "Usage: ./configure.sh single|multi"
    exit 1
fi

# delete
# rm $HOME/.config/openbox/autostart
# rm $HOME/.config/openbox/rc.xml
# rm $HOME/.config/tint2/tint2rc
# rm $HOME/.config/dunst/dunstrc
# rm $HOME/.config/xfce4/terminal/terminalrc
# rm $HOME/.zsh_aliases
# rm $HOME/.zshenv
# rm $HOME/.zshrc
# rm $HOME/.tmux.conf
# rm $HOME/.gvimrc
# rm $HOME/.vimrc
# rm -r $HOME/.vim
# rm /usr/share/oh-my-zsh/custom/themes/adri.zsh-theme
# rm /usr/local/bin/ezchrome
# rm /usr/local/bin/ezgvim
# rm /usr/local/bin/ezskype
# rm /usr/local/bin/ezterminal
# rm /usr/local/bin/dmenu_recent_aliases
# rm /usr/local/bin/dmenu_solarized_light
# rm /usr/local/bin/dmenu_solarized_dark
# rm $HOME/.gitconfig

# Openbox
mkdir -p $HOME/.config/openbox/
ln -sv $PWD/openbox/autostart $HOME/.config/openbox/autostart
if [ "$1" == "multi" ]; then
    ln -sv $PWD/openbox/rc_multihead.xml $HOME/.config/openbox/rc.xml
else
    ln -sv $PWD/openbox/rc.xml $HOME/.config/openbox/rc.xml
fi

# Tint2
mkdir -p $HOME/.config/tint2/
if [ "$1" == "multi" ]; then
    ln -sv $PWD/tint2/tint2rc_multihead $HOME/.config/tint2/tint2rc
else
    ln -sv $PWD/tint2/tint2rc $HOME/.config/tint2/tint2rc
fi

# Dunst
mkdir -p $HOME/.config/dunst/
ln -sv $PWD/dunst/dunstrc $HOME/.config/dunst/dunstrc

# xfce4-terminal
mkdir -p $HOME/.config/xfce4/terminal/
ln -sv $PWD/xfce4-terminal/terminalrc $HOME/.config/xfce4/terminal/terminalrc

# zsh
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

# git
ln -sv $PWD/git/.gitconfig $HOME/.gitconfig

# config as root
sudo -E ./configure_root.sh
