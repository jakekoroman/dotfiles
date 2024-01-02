# /etc/skel/.bashrc
#
# This file is sourced by all *interactive* bash shells on startup,
# including some apparently interactive shells such as scp and rcp
# that can't tolerate any output.  So make sure this doesn't display
# anything or bad things will happen !


# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
if [[ $- != *i* ]] ; then
	# Shell is non-interactive.  Be done now!
	return
fi

# Put your fun stuff here.

export HISTCONTROL=ignoreboth:erasedups
export HISTSIZE=2500
export HISTFILESIZE=5000
complete -cf doas

source $HOME/.bash_aliases

export PS1='\[\e[92m\]\w\[\e[0m\] \[\e[95m\]>\[\e[0m\] '
export PATH=$HOME/.local/bin:$HOME/dotfiles/Scripts:$PATH

clear
pfetch
