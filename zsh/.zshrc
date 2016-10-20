# Path to your oh-my-zsh installation.
export ZSH=/usr/share/oh-my-zsh

#DEFAULT_USER=`whoami`
# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.

# ZSH_THEME="adri"
ZSH_THEME="adri_agnoster"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to disable command auto-correction.
# DISABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git colored-man colorize cp z vi-mode extract gitignore)

source $ZSH/oh-my-zsh.sh
source ~/.dotfiles/zsh/.zsh_aliases

# User configuration

#Solarized ls
export TERM=screen-256color
eval `dircolors ~/.dotfiles/solarized/dircolor_solarized`

# Un grep avec des couleurs : (ya l'alias qui va avec dans .zsh_aliases)
export GREP_COLOR=31

# search in the history (arrow)
bindkey '\e[A' history-beginning-search-backward
bindkey '\e[B' history-beginning-search-forward
# search in the history (ctrl-p ctrl-n)
bindkey '\C-p' history-beginning-search-backward
bindkey '\C-n' history-beginning-search-forward

#Activer l'historique des commandes:
HISTFILE=~/.history
HISTSIZE=100000
SAVEHIST=100000
export HISTFILE SAVEHIST
setopt HIST_IGNORE_DUPS


# FZF
# https://github.com/junegunn/fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
