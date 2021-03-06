" ###### " Vundle
" ######

set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" ULTISNIPS
" Track the engine.
Plugin 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'

" Displaying thin vertical lines at each indentation level
Plugin 'Yggdroot/indentLine'

" JS better indent
"Plugin 'vim-scripts/JavaScript-Indent'

" Typescript plugin
Plugin 'leafgarland/typescript-vim'

" Autopairing
Plugin 'jiangmiao/auto-pairs'

Plugin 'luochen1990/rainbow'

" JS and React / JSX
"Plugin 'pangloss/vim-javascript'
"Plugin 'mxw/vim-jsx'

" Nerdtree
Plugin 'scrooloose/nerdtree'

"Plugin 'plasticboy/vim-markdown'

"Plugin 'stephpy/vim-yaml'


" Asynchronous Lint Engine
Plugin 'w0rp/ale'

" Syntastic
"Plugin 'vim-syntastic/syntastic'

" TSLint
"Plugin 'palantir/tslint'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" ##########
" END VUNDLE
" ##########

let g:indentLine_color_term = 235

" ##################
" last color make cursor less visible, so lets change cursor color
" code from http://vim.wikia.com/wiki/Configuring_the_cursor

if &term =~ "xterm\\|rxvt"
   " use an orange cursor in insert mode
   let &t_SI = "\<Esc>]12;orange\x7"
   " use a red cursor otherwise
   let &t_EI = "\<Esc>]12;orange\x7"
   silent !echo -ne "\033]12;orange\007"
   " reset cursor when vim exits
   autocmd VimLeave * silent !echo -ne "\033]112\007"
endif

if &term =~ "xterm\\|rxv2"
   " solid underscore
   let &t_SI .= "\<Esc>[3 q"
   " solid block
   let &t_EI .= "\<Esc>[2 q"
   " 1 or 0 -> blinking block
   " 3 -> blinking underscore
   " Recent versions of xterm (282 or above) also support
   " 5 -> blinking vertical bar
   " 6 -> solid vertical bar
endif

"Make vim-JSX works on JS files:
let g:jsx_ext_required = 0


" Trigger configuration. Do not use <tab> if you use
" https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-l>"
let g:UltiSnipsJumpForwardTrigger="<c-l>"
let g:UltiSnipsJumpBackwardTrigger="<c-ù>"
let g:UltiSnipsSnippetsDir="~/.vim/MyUltiSnippets"
let g:UltiSnipsSnippetDirectories=["UltiSnip", "MyUltiSnippets"]
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="horizontal"


" ##############
" FINDING FILES:
" ##############

" Search down into subfolders
" Provides tab-completion for all file-related tasks

set path+=**

" Display all matching file when tab completing

set wildmenu

" NOW WE CAN:
" Hit tab to :find by partial match
" Use * to make it fuzzy

" THINGS TO CONSIDER
" :b lets you autocomplete any buffer open

" ###########
" TAG JUMPING
" ###########

" Create the 'tags' file (may need to install ctags first)
command! MakeTags !rctags

" Now we can ^] to jump to tag under cursor
" Use g^] for ambiguous tags
" Use ^t to jump back to tag stack

" Highlight match when jumping to next

nnoremap <silent> n n:call HLNext()<CR>
nnoremap <silent> N N:call HLNext()<CR>

function! HLNext ()
   set invcursorline
   redraw
   exec 'sleep ' . float2nr(50) . 'm'
   set invcursorline
   redraw
   exec 'sleep ' . float2nr(50) . 'm'
   set invcursorline
   redraw
   exec 'sleep ' . float2nr(50) . 'm'
   set invcursorline
   redraw
endfunction

" ########################
" FROM help ins-completion
" ########################

function! CleverTab()
   if strpart( getline('.'), 0, col('.')-1 ) =~ '^\s*$'
      return "\<Tab>"
   else
      return "\<C-N>"
   endif
endfunction
inoremap <Tab> <C-R>=CleverTab()<CR>

" NERDTree open in new tab
map <C-p> :tabf .<CR>

let NERDTreeQuitOnOpen=1
let NERDTreeMapOpenInTab='\r'

" Start NERDTree when vim starts and no file specified3
" from NERDTRee git README
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif


" ######
" MY OWN
" ######

set nu

map Q gq

set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab
autocmd FileType javascript,typescript,json :setlocal sw=2 ts=2 sts=2 

" dont tab while pasting
set nopaste
" for the plaisure
set showcmd

"  ###############
"  remaping esc char
imap ² <Esc>
imap jj <Esc>  

" #######
" reload vimrc after save
autocmd! bufwritepost .vimrc source %

" MOVEMENT
" Use e to move to word last char
" use ( and ) to move threw entire sentence
" zz to center vertically current line

" Add - (minus sign) a keyword
set iskeyword+=-

" ALE linters
let g:ale_linters = {
        \   'javascript': ['standard'],
        \   'python': ['flake8'],
        \}

let g:ale_lint_on_save = 1
let g:ale_lint_delay = 1000

let g:ale_python_flake8_executable = 'python3'
let g:ale_python_flake8_options = ' -m flake8 '

let g:ale_python_pylint_executable = 'python3'
let g:ale_python_pylint_options = ' -m pylint --disable=C '

"let g:ale_lint_on_text_changed = 'save'
"let g:ale_lint_on_enter = 0

" Fix with standard when saving, or dont
" autocmd bufwritepost *.js silent !standard --fix %
set autoread
