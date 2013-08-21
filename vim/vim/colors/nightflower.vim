"these lines are suggested to be at the top of every colorscheme
hi clear
if exists("syntax_on")
  syntax reset
endif

"Load the 'base' colorscheme - the one you want to alter
runtime $VIMRUNTIME/colors/default.vim

"Override the name of the base colorscheme with the name of this custom one
let g:colors_name = "nightflower"

"Clear the colors for any items that you don't like
"Only do this if you want to reset everything; otherwise, set only the fields you're interested in

"Set up your new & improved colors
hi Constant    ctermfg=2
hi ErrorMsg    ctermfg=2   ctermbg=0
hi FoldColumn              ctermbg=15
hi Folded                  ctermbg=15
hi IncSearch   ctermfg=3
hi LineNr      ctermfg=1
hi MatchParen  ctermfg=0
hi Pmenu       ctermfg=0   ctermbg=5
hi PmenuSel    ctermfg=0   ctermbg=7
hi Search                  ctermbg=2
hi Statement   ctermfg=1
hi Type        ctermfg=3
