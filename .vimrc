" keeps vim defaults
unlet! skip_defaults_vim
source $VIMRUNTIME/defaults.vim

colors zenburn

" sets
set relativenumber
set expandtab
set tabstop=4
set shiftwidth=4

" fixes vim bug in kitty terminal
let &t_ut=''

" fixes bug for alacritty
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48:2;%lu;%lu;%lum"
