" Add liquid and jekyll syntax highlighting to markdown.
" Joyce Tipping <joyce@joycetipping.com>
" WTFPL

" Source liquid syntax file.
" This must be at the top of this file.
syntax include @liquid syntax/liquid.vim | unlet b:current_syntax

" Source markdown syntax file.
source $VIMRUNTIME/syntax/markdown.vim

" Jekyll syntax rules
syntax region liquidTags        start=/{%/      end=/%}/    contains=@liquid
syntax region liquidOutput      start=/{{/      end=/}}/    contains=@liquid
syntax region jekyllFrontMatter start=/\%^---$/ end=/^---$/
highlight link jekyllFrontMatter String
