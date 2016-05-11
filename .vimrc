set nocompatible
filetype off       " required!

set rtp+=~/.vim/bundle/vundle
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'altercation/vim-colors-solarized'
Bundle 'jlanzarotta/bufexplorer'
Bundle 'scrooloose/nerdtree'
Bundle 'vim-ruby/vim-ruby'
Bundle 'lambdatoast/elm.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'elixir-lang/vim-elixir'
Plugin 'kchmck/vim-coffee-script'
Plugin 'tomtom/tcomment_vim'
Plugin 'tomasr/molokai'
Plugin 'crusoexia/vim-monokai'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'chrisbra/csv.vim'
Plugin 'elzr/vim-json'
Plugin 'ElmCast/elm-vim'
Plugin 'pangloss/vim-javascript'
Plugin 'chriskempson/base16-vim'
Plugin 'dandorman/vim-colors'

filetype plugin indent on  " required!

set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

set bs=2
set ts=2
set sw=2
set number
" shows row and column number at bottom right corner
set ruler

syntax on 
set t_ut=
set background=dark
colorscheme molokai
set term=screen-256color
let $TERM='screen-256color'

" No arrow keys
map <Left> 	:echo "No!"<cr>
map <Right>	:echo "No!"<cr>
map <Up>		:echo "No!"<cr>
map <Down>	:echo "No!"<cr>

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

function! StartUp()                                                                                                                                                                                         
	if 0 == argc()
		NERDTree
	end
endfunction

autocmd VimEnter * call StartUp()

com! FormatJSON %!python -m json.tool

:filetype plugin on
