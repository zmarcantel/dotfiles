set background=dark
highlight clear
if exists("syntax on")
	syntax reset
endif
let g:colors_name="hackd"
hi Normal guifg=#ffffff guibg=#292929
hi Comment guifg=#919191 guibg=NONE
hi Constant guifg=#ff9603 guibg=NONE
hi String guifg=#b6ffb2 guibg=NONE
hi htmlTagName guifg=#edb23b guibg=NONE
hi Identifier guifg=#40ffff guibg=NONE
hi Statement guifg=#e35b5b guibg=NONE
hi PreProc guifg=#005eff guibg=NONE
hi Type guifg=#ffc561 guibg=NONE
hi Function guifg=#957dff guibg=NONE
hi Repeat guifg=#d6e324 guibg=NONE
hi Operator guifg=#00d9ff guibg=NONE
hi Error guibg=#ff0000 guifg=#ffffff
hi TODO guibg=#0011ff guifg=#ffffff
hi link character	constant
hi link number	constant
hi link boolean	constant
hi link Float		Number
hi link Conditional	Repeat
hi link Label		Statement
hi link Keyword	Statement
hi link Exception	Statement
hi link Include	PreProc
hi link Define	PreProc
hi link Macro		PreProc
hi link PreCondit	PreProc
hi link StorageClass	Type
hi link Structure	Type
hi link Typedef	Type
hi link htmlTag	Special
hi link Tag		Special
hi link SpecialChar	Special
hi link Delimiter	Special
hi link SpecialComment Special
hi link Debug		Special