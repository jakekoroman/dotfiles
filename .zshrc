# Shows screenfetch on launch
# screenfetch

# Shows neofetch on launch
#neofetch

echo "¯\_(ツ)_/¯"

# enables the starship prompt
eval "$(starship init zsh)"

# History stuff
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_IGNORE_ALL_DUPS

# Key binds to keep my sanity
bindkey -e
bindkey \^U backward-kill-line
bindkey "^[[3~" delete-char
bindkey "^[^[[D" backward-word
bindkey "^[^[[C" forward-word

# The following lines were added by compinstall
zstyle :compinstall filename '~/.zshrc'

autoload -Uz compinit
compinit
# End of compinstall

# Aliases
alias ll="ls -al --color=auto"
alias ls="ls --color=auto"
alias la='ls -A --color=auto'
alias ..='cd ..'
alias gs='git status'
alias gl='git log'
alias gc='git commit -m'
alias blueon='bluetoothctl power on'
alias blueoff='bluetoothctl power off'

# Safety aliases
#alias rm='rm -i'
#alias rmd='rm -rfi'
#alias mv='mv -i'

# Path vars
export PATH=~/.emacs.d/bin/:~/.local/bin:$PATH

# addons
source ~/.zsh_addons/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh_addons/zsh-autosuggestions/zsh-autosuggestions.zsh

# Interesting live complete plugin, to crazy for me but cool
# source ~/.zsh_addons/zsh-autocomplete/zsh-autocomplete.plugin.zsh
