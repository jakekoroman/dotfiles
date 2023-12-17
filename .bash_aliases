alias grep='grep --color=auto'
alias ls='ls --color=auto'
alias l='ls -l'
alias ll='ls -la'

alias e='nvim'
alias cs='ssh jake@mainframe'

alias nt='firefox --new-tab'
alias nw='firefox --new-window'

if [ -z $I3SOCK ]; then
    alias sw='$HOME/dotfiles/Scripts/myswallow'
else
    alias sw='swallow'
fi

alias sudo='sudo '

alias poweroff='doas /sbin/poweroff'
alias reboot='doas /sbin/reboot'

alias dwmd='cd ~/dotfiles/dwm'
alias std='cd ~/dotfiles/st-instantos'

alias work='vncviewer -passwd ~/.vnc/passwd 10.0.0.243'
alias nas='doas mount /media/nas && cd /media/nas'
