" to get font face under cursor: :echo synIDattr(synID(line("."), col("."), 1), "name")

hi clear
syntax reset
let g:colors_name = 'clean'
set background=dark

hi Normal guifg=#cdaa7d guibg=#181818 gui=NONE cterm=NONE
hi ColorColumn guifg=NONE guibg=#181818 gui=NONE cterm=NONE
hi Conceal guifg=NONE guibg=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
hi Cursor guifg=NONE guibg=NONE gui=reverse ctermfg=NONE ctermbg=NONE cterm=reverse
hi CursorColumn guifg=NONE guibg=#181818 gui=NONE cterm=NONE
hi CursorLine guifg=NONE guibg=#181818 gui=NONE cterm=NONE
hi CursorLineNr guifg=#e4e4ef guibg=#181818 gui=NONE cterm=NONE
hi DiffAdd guifg=#e4e4ef guibg=#181818 gui=reverse cterm=reverse
hi DiffChange guifg=#e4e4ef guibg=#181818 gui=reverse cterm=reverse
hi DiffDelete guifg=#e4e4ef guibg=#181818 gui=reverse cterm=reverse
hi DiffText guifg=#e4e4ef guibg=#181818 gui=reverse cterm=reverse
hi Directory guifg=#e4e4ef guibg=NONE gui=NONE cterm=NONE
hi EndOfBuffer guifg=#e4e4ef guibg=NONE gui=NONE cterm=NONE
hi ErrorMsg guifg=#ffff00 guibg=#181818 gui=NONE cterm=NONE
hi FoldColumn guifg=#e4e4ef guibg=NONE gui=NONE cterm=NONE
hi Folded guifg=#e4e4ef guibg=#181818 gui=NONE cterm=NONE
hi IncSearch guifg=#ffaf00 guibg=#181818 gui=reverse cterm=reverse
hi LineNr guifg=#7a7a7a guibg=NONE gui=NONE cterm=NONE
hi MatchParen guifg=#ff0000 guibg=NONE gui=bold cterm=bold
hi ModeMsg guifg=#e4e4ef guibg=NONE gui=bold cterm=bold
hi MoreMsg guifg=#e4e4ef guibg=NONE gui=NONE cterm=NONE
hi NonText guifg=#e4e4ef guibg=NONE gui=NONE cterm=NONE
hi Pmenu guifg=#cdaa7d guibg=#101010 gui=NONE cterm=NONE
hi PmenuSbar guifg=#e4e4ef guibg=#101010 gui=NONE cterm=NONE
hi PmenuSel guifg=#cd950c guibg=#1F1F1F gui=NONE cterm=NONE
hi PmenuThumb guifg=#e4e4ef guibg=#101010 gui=NONE cterm=NONE
hi Question guifg=#e4e4ef guibg=NONE gui=NONE cterm=NONE
hi QuickFixLine guifg=#ad7fa8 guibg=#181818 gui=reverse cterm=reverse
hi Search guifg=#ffaf00  guibg=#181818 gui=reverse cterm=reverse
hi SignColumn guifg=#e4e4ef guibg=NONE gui=NONE cterm=NONE
hi SpecialKey guifg=#e4e4ef guibg=NONE gui=NONE cterm=NONE
hi SpellBad guifg=#e4e4ef guibg=NONE guisp=#d7005f gui=undercurl cterm=underline
hi SpellCap guifg=#e4e4ef guibg=NONE guisp=#0087d7 gui=undercurl cterm=underline
hi SpellLocal guifg=#e4e4ef guibg=NONE guisp=#d787d7 gui=undercurl cterm=underline
hi SpellRare guifg=#e4e4ef guibg=NONE guisp=#00afaf gui=undercurl cterm=underline
hi StatusLine guifg=#e4e4ef guibg=#181818 gui=bold,reverse cterm=bold
hi StatusLineNC guifg=#878787 guibg=#181818 gui=reverse cterm=reverse
hi TabLine guifg=#e4e4ef guibg=#181818 gui=reverse cterm=reverse
hi TabLineFill guifg=#e4e4ef guibg=NONE gui=NONE cterm=NONE
hi TabLineSel guifg=#e4e4ef guibg=#181818 gui=bold cterm=bold
hi Title guifg=NONE guibg=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
hi VertSplit guifg=#e4e4ef guibg=#181818 gui=NONE cterm=NONE
hi Visual guifg=#595959 guibg=#181818 gui=reverse cterm=reverse
hi VisualNOS guifg=NONE guibg=#181818 gui=NONE cterm=NONE
hi WarningMsg guifg=#e4e4ef guibg=NONE gui=NONE cterm=NONE
hi WildMenu guifg=#e4e4ef guibg=#181818 gui=bold cterm=bold
hi Comment guifg=#5e5e63 guibg=NONE gui=bold cterm=bold
hi Constant guifg=#e4e4ef guibg=NONE gui=NONE cterm=NONE
hi String guifg=#4e9a06 guibg=NONE gui=NONE cterm=NONE
hi Error guifg=#ff0000 guibg=#181818 gui=bold,reverse cterm=bold,reverse
hi Identifier guifg=#e4e4ef guibg=NONE gui=NONE cterm=NONE
hi Ignore guifg=#e4e4ef guibg=NONE gui=NONE cterm=NONE
hi PreProc guifg=#e4e4ef guibg=NONE gui=NONE cterm=NONE
hi Special guifg=#cdaa7d guibg=NONE gui=NONE cterm=NONE
hi Number guifg=#cdaa7d guibg=NONE gui=NONE cterm=NONE
hi Statement guifg=#cd950c guibg=NONE gui=NONE cterm=NONE
hi Todo guifg=#181818 guibg=#ffffff gui=bold,reverse cterm=bold,reverse
hi Type guifg=#cd950c guibg=NONE gui=NONE cterm=NONE
hi Underlined guifg=#e4e4ef guibg=NONE gui=underline cterm=underline
hi CursorIM guifg=#e4e4ef guibg=#181818 gui=NONE cterm=NONE
hi ToolbarLine guifg=NONE guibg=#181818 gui=NONE cterm=NONE
hi ToolbarButton guifg=#e4e4ef guibg=#181818 gui=bold cterm=bold

hi vimFgBgAttrib guifg=#cdaa7D guibg=#181818 gui=NONE cterm=NONE
hi vimHiAttrib guifg=#cdaa7d guibg=#181818 gui=NONE cterm=NONE
hi vimVar guifg=#cdaa7D guibg=#181818 gui=NONE cterm=NONE
hi vimOption guifg=#cdaa7d guibg=#181818 gui=NONE cterm=NONE
hi vimHighlight guifg=#cdaa7d guibg=#181818 gui=NONE cterm=NONE
hi vimHigroup guifg=#cdaa7d guibg=#181818 gui=NONE cterm=NONE
hi vimGroup guifg=#cdaa7d guibg=#181818 gui=NONE cterm=NONE

hi zigVarDecl guifg=#cd950c guibg=NONE gui=NONE cterm=NONE

hi luaConstant guifg=#cdaa7d guibg=#181818 gui=NONE cterm=NONE
