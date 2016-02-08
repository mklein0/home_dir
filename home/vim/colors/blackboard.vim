" Vim color file

set bg=dark
hi clear
if exists("syntax_on")
	syntax reset
endif

let colors_name = "blackboard"

hi Normal	guifg=#ffffff guibg=#0D1021						

hi Comment	guifg=#aeaeae gui=italic ctermfg=7 cterm=italic
hi Constant	guifg=#d7fa41 gui=none ctermfg=6 cterm=bold
hi String	guifg=#64ce3e gui=none ctermfg=10
hi Statement	guifg=#f8de33 gui=none ctermfg=14
hi Entity	guifg=#fa6513 gui=none ctermfg=11 cterm=bold
hi Support	guifg=#8fa6cd gui=none ctermfg=13
hi LineNr	guifg=#aeaeae guibg=#000000 gui=none ctermfg=7 ctermbg=0
hi Title	guifg=#f6f3e8 guibg=NONE gui=bold ctermfg=15 cterm=bold
hi NonText 	guifg=#808080 guibg=#0D1021 gui=none ctermfg=8 ctermbg=0

hi Visual	gui=reverse cterm=reverse
hi VertSplit	guifg=#444444 guibg=#444444 ctermfg=0 ctermbg=7
hi StatusLine   guifg=#f6f3e8 guibg=#444444 gui=italic ctermfg=15 ctermbg=7 cterm=italic
hi StatusLineNC guifg=#857b6f guibg=#444444 ctermfg=13 ctermbg=7
hi SpecialKey	guifg=#808080 guibg=#343434 gui=none ctermfg=7 ctermbg=8


hi link Define		Entity
hi link Function	Entity

hi link Structure	Support
hi link Special		Support
hi link Test		Support

hi link Character	Constant
hi link Number		Constant
hi link Boolean		Constant

hi link Float		Number

hi link Conditional	Statement
hi link StorageClass	Statement
hi link Operator	Statement
hi link Statement	Statement
