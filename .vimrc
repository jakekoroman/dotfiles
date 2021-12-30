" keeps vim defaults
unlet! skip_defaults_vim
source $VIMRUNTIME/defaults.vim

" enables dracula theme
"packadd! dracula
"syntax enable
"colorscheme dracula

" enable gruvbox theme
"autocmd vimenter * ++nested colorscheme gruvbox
"set bg=dark

" enables synthwave84 theme
set termguicolors
colorscheme synthwave84
set bg=dark

"colors zenburn

" sets
set relativenumber
set expandtab
set tabstop=4
set shiftwidth=4

" fixes vim bug in kitty terminal
let &t_ut=''
