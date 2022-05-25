" keeps vim defaults
unlet! skip_defaults_vim
source $VIMRUNTIME/defaults.vim

colors GruberDarker

" sets
set relativenumber
set expandtab
set tabstop=4
set shiftwidth=4
set termguicolors
set guioptions=i

" fixes vim bug in kitty terminal
let &t_ut=''

" fixes bug for alacritty
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48:2;%lu;%lu;%lum"

" Toggles the GUI stuff on and off, defaults to off
function! ToggleGUICruft()
    if &guioptions=='i'
      exec('set guioptions=imTrL')
    else
      exec('set guioptions=i')
    endif
endfunction

map <F11> <Esc>:call ToggleGUICruft()<cr>
