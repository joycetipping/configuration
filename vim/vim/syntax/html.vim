" Add liquid and jekyll syntax highlighting to html.
" Joyce Tipping <joyce@joycetipping.com>
" WTFPL

" Source liquid syntax file.
" This must be at the top of this file.
" The check is necessary to prevent endless looping.
if !exists("has_liquid")
  let has_liquid = 'yes'
  syntax include @liquid syntax/liquid.vim | unlet b:current_syntax
endif

" Source html syntax file.
source $VIMRUNTIME/syntax/html.vim

" Jekyll syntax rules
syntax region liquidTags        start=/{%/      end=/%}/    contains=@liquid
syntax region liquidOutput      start=/{{/      end=/}}/    contains=@liquid
syntax region jekyllFrontMatter start=/\%^---$/ end=/^---$/
highlight link jekyllFrontMatter String
