""""""""""""""""""""""""
" vundle configuration "
""""""""""""""""""""""""
" see https://github.com/VundleVim/Vundle.vim
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Plugins
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'kchmck/vim-coffee-script'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-fugitive'
Plugin 'wikitopian/hardmode'
Plugin 'tpope/vim-surround'

" All of your Plugins must be added before the following line
call vundle#end()            " required
syntax enable
filetype plugin indent on    " required


" powerline activation
python3 from powerline.vim import setup as powerline_setup
python3 powerline_setup()
python3 del powerline_setup
" and configuration
set laststatus=2 "ensure that powerline shows up even if you dont have any split
set t_Co=256
set noshowmode
set showtabline=1

" vim-coffee-script conf
let coffee_watch_vert = 1
" nerdtree conf
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
" hardmode activation
autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()
" ultisnip conf
let g:UltiSnipsExpandTrigger = '<Tab>'
let g:UltiSnipsJumpForwardTrigger = '<Tab>'
let g:UltiSnipsJumpBackwardTrigger = '<S-Tab>'
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"


" highlighting search and cancel with space
set hlsearch
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>
hi Search cterm=bold ctermfg=white ctermbg=blue

syntax on
set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab
