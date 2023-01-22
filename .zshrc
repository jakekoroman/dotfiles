echo "¯\_(ツ)_/¯"
echo ""

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=5000
SAVEHIST=5000
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/jake/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

git_branch() {
    if out="$(git -C . rev-parse > /dev/null 2>&1)"; then
        printf " $%s$(git branch | pcregrep -o1 "\*[\s]*(.*)")"
    fi
}

set_prompt() {
    branch="$(git_branch)"
    NEWLINE=$'\n'
    PROMPT="%F{white}┌[%f%F{blue}%~%f%F{white}]%f${NEWLINE}%F{white}└[%f%F{green}%n%f%F{yellow}@%f%F{blue}%m%f%F{red}%}${branch}%F{white}]:%f "
}

precmd_functions+=(set_prompt)
set_prompt

export PATH=$PATH:$HOME/.local/bin

alias ls='ls --color=auto'
alias grep='grep --color=always'
alias cs='ssh jake@10.0.0.162'
alias l='exa --long --all --group-directories-first'
alias tree='tree -C'
alias n='nvim'
alias gs='git status'
alias gl='git log'
alias gc='git commit -m'

bindkey -e
# Key binds to keep my sanity
bindkey -e
bindkey \^U backward-kill-line
bindkey "^[[1;3D" backward-word
bindkey "^[[1;3C" forward-word
