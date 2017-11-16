"Basic
set encoding=utf-8

"Keyboard and screen*
set backspace=indent,eol,start
set mouse=a
set nowrap
set number
set ruler
set showcmd
set title
"Editing
set autoindent
set expandtab
set nojoinspaces
set shiftwidth=2
set tabstop=2
set textwidth=80
"Search options
set hlsearch
set ignorecase
set incsearch
"Folds
set foldcolumn=0
set foldmethod=marker
"Buffers
set hidden
"Highlight trailing whitespace
set list
set listchars=tab:▸·,trail:·
"Modeline
set modeline
set modelines=5

let mapleader = " "

nnoremap <CR> o<ESC>
nnoremap <leader><CR> O<ESC>
nnoremap <C-h> gT
nnoremap <C-l> gt
nnoremap <leader>h :tabmove -1<CR>
nnoremap <leader>l :tabmove +1<CR>
nnoremap <F7> :call ToggleTerminalCopyPaste()<CR>

command Dws :%s/\s\+$// "Delete whitespace

filetype plugin indent on
syntax on
autocmd BufRead,BufNewFile *.tsv setlocal noexpandtab
autocmd BufRead,BufNewFile */journal/* set textwidth=100
autocmd BufRead,BufNewFile passwords.* set textwidth=0
autocmd FileType python setlocal shiftwidth=4 tabstop=4 foldcolumn=4

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Functions

function! SyntaxItem()
  echo synIDattr(synID(line("."),col("."),1),"name")
endfunction

function! ToggleTerminalCopyPaste()
  if &paste == 0
    set mouse=
    set paste
    set nonumber
    echo "Terminal copy & paste enabled"
  else
    set mouse=a
    set nopaste
    set number
    echo "Terminal copy & paste disabled"
  endif
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Plugins

"Nerdtree
map <F8> :NERDTreeToggle<CR>

"Pathogen
execute pathogen#infect()
