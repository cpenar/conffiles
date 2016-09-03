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
"Plugin 'powerline/powerline' "Installed from pip3 not vundle
Plugin 'kchmck/vim-coffee-script'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


" powerline activation
python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup
" and configuration
set laststatus=2 "ensure that powerline shows up even if you dont have any split
set t_Co=256
set noshowmode
set showtabline=1


set hlsearch
syntax on
