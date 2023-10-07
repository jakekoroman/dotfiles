#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

HISTSIZE=2500
HISTFILESIZE=5000

source $HOME/.bash_aliases

export PATH=$HOME/.local/bin:$HOME/dotfiles/Scripts:$PATH

PS1='[\u@\h \W]\$ '
