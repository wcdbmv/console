" Tip: instead of `:source ~/.vimrc`:
"	`:so %`        if you editing this
"	`:so $MYVIMRC` otherwise

filetype plugin indent on
set encoding=utf-8
set nocompatible

if empty(glob('~/.vim/autoload/plug.vim'))
	silent! curl -fLo ~/.vim/autoload/plug.vim --create-dirs
	      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'ycm-core/YouCompleteMe'
Plug 'dense-analysis/ale'
Plug 'airblade/vim-gitgutter'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
" colorschemes
Plug 'morhetz/gruvbox'

call plug#end()
" :PlugInstall

syntax on
colorscheme gruvbox
set background=dark
set number

set listchars=tab:»\ ,space:·,eol:¬,nbsp:~,trail:·,extends:>,precedes:<
set list

set hlsearch
set incsearch

augroup project
	autocmd!
	autocmd Bufread,BufNewFile *.h,*.c set filetype=c.doxygen
augroup END

let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"
