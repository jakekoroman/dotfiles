" keeps vim defaults
unlet! skip_defaults_vim
source $VIMRUNTIME/defaults.vim

colors GruberDarker

" sets
set relativenumber
set expandtab
set tabstop=4
set shiftwidth=4
set guioptions=i

" fixes vim bug in kitty terminal
let &t_ut=''

" fixes bug for alacritty
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48:2;%lu;%lu;%lum"

" Clipboard stuff
if has('unnamedplus')
    set clipboard=unnamedplus
endif

" Toggles the GUI stuff on and off, defaults to off
function! ToggleGUICruft()
    if &guioptions=='i'
      exec('set guioptions=imTrL')
    else
      exec('set guioptions=i')
    endif
endfunction
 
" Plug Stuff
call plug#begin()

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'h-225/odin.vim'
Plug 'zig-lang/zig.vim'
Plug 'romainl/vim-qf'
Plug 'rust-lang/rust.vim'
Plug 'tpope/vim-surround'

call plug#end()

" Key Binds
" Gui toggle
map <F11> <Esc>:call ToggleGUICruft()<cr>

" Goes to next error in copen, going to previous is so rare
" that if I ever need to use previous I will just type :cprevious
map <C-n> <Plug>(qf_qf_next)

" Autocmds
" Sets :make to be 'zig build run' by default in zig files
autocmd FileType zig :set makeprg=zig\ build\ run

" Autoformat rust on save
let g:rustfmt_autosave = 1

" Disable Whitespace checker for Airline
let g:airline#extensions#whitespace#enabled = 0
