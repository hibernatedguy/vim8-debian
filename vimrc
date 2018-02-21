" --------------------------------
"  AUTHOR : ashish2py
" --------------------------------

"vundle
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" ---------------- PLUGINS --------------------
Plugin 'VundleVim/Vundle.vim'
"git interface
Plugin 'tpope/vim-fugitive'
"filesystem
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'kien/ctrlp.vim' 

"html
"isnowfy only compatible with python not python3
Plugin 'isnowfy/python-vim-instant-markdown'
Plugin 'jtratner/vim-flavored-markdown'
Plugin 'suan/vim-instant-markdown'
Plugin 'nelstrom/vim-markdown-preview'

"python sytax checker
Plugin 'nvie/vim-flake8'
Plugin 'vim-scripts/Pydiction'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'scrooloose/syntastic'

"auto-completion stuff
"Plugin 'klen/python-mode'
Plugin 'Valloric/YouCompleteMe'
Plugin 'klen/rope-vim'
"Plugin 'davidhalter/jedi-vim'
Plugin 'ervandew/supertab'
""code folding
Plugin 'tmhedberg/SimpylFold'

"Colors!!!
Plugin 'altercation/vim-colors-solarized'
Plugin 'jnurmine/Zenburn'
Plugin 'dracula/vim'

call vundle#end()


" ------------------------------------------------------
" ---------------- PACKAGE SETTINGS --------------------
" ------------------------------------------------------


" ----------------- FLAKE8 SETTINGS --------------------
autocmd BufWritePost *.py call Flake8()


" ----------------- SIMPLY FOLD --------------------------
filetype plugin indent on    " enables filetype detection
let g:SimpylFold_docstring_preview = 1
set nofoldenable

" ----------------- AUTOCOMPLETE -------------------------
let g:ycm_autoclose_preview_window_after_completion=1

" ----------------- CUSTOM KEYS -------------------------
let mapleader=" "
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
"

" ----------------- FONT and LINE NUMBER -------------------------
set guifont=Monaco:h14

"I don't like swap files
set noswapfile

"turn on numbering
set nu



" ------------ COLOR SCHEMES AND THEME -------------
"mkdir -p ~/.vim/colors && cd ~/.vim/colors
"wget -O wombat256mod.vim http://www.vim.org/scripts/download_script.php?src_id=13400
set t_Co=256
" color wombat256mod
" color dracula
color zenburn
" color wombat256mod

" ------------- SHOW LINE NUMBERS AND LENGTH -------------
set number  " show line numbers
set tw=94   " width of document (used by gd)
set nowrap  " don't automatically wrap on load
set fo-=t   " don't automatically wrap text when typing
set colorcolumn=95
highlight ColorColumn ctermbg=233


"python with virtualenv support
"py << EOF
"import os.path
"import sys
"import vim
"if 'VIRTUA_ENV' in os.environ:
"  project_base_dir = os.environ['VIRTUAL_ENV']
"  sys.path.insert(0, project_base_dir)
"  activate_this = os.path.join(project_base_dir,'bin/activate_this.py')
"  execfile(activate_this, dict(__file__=activate_this))
"EOF

"it would be nice to set tag files by the active virtualenv here
":set tags=~/mytags "tags for ctags and taglist
"omnicomplete
autocmd FileType python set omnifunc=pythoncomplete#Complete

"------------ PYTHON PEP8 ----------------
" Number of spaces that a pre-existing tab is equal to.
au BufRead,BufNewFile *py,*pyw,*.c,*.h set tabstop=4

"spaces for indents
au BufRead,BufNewFile *.py,*pyw set shiftwidth=4
au BufRead,BufNewFile *.py,*.pyw set expandtab
au BufRead,BufNewFile *.py set softtabstop=4

" Use the below highlight group when displaying bad whitespace is desired.
highlight BadWhitespace ctermbg=red guibg=red

" Display tabs at the beginning of a line in Python mode as bad.
au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/
" Make trailing whitespace be flagged as bad.
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" Wrap text after a certain number of characters
au BufRead,BufNewFile *.py,*.pyw, set textwidth=100

" Use UNIX (\n) line endings.
au BufNewFile *.py,*.pyw,*.c,*.h set fileformat=unix

" Set the default file encoding to UTF-8:
set encoding=utf-8

" For full syntax highlighting:
let python_highlight_all=1
syntax on

" Keep indentation level from previous line:
autocmd FileType python set autoindent

" make backspaces more powerfull
set backspace=indent,eol,start


"Folding based on indentation:
autocmd FileType python set foldmethod=indent
"use space to open folds
nnoremap <space> za

"---------- END OF PYTHON PEP8 --------------

"js stuff"
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2

" --------- key mapping ----------
" Rebind <Leader> key
" I like to have it here becuase it is easier to reach than the default and
" it is next to ``m`` and ``n`` which I use for navigating between tabs.
let mapleader = ","

" Bind nohl
" Removes highlight of your last search
" ``<C>`` stands for ``CTRL`` and therefore ``<C-n>`` stands for ``CTRL+n``
"" noremap <C-n> :nohl<CR>
"" vnoremap <C-n> :nohl<CR>
"" inoremap <C-n> :nohl<CR>


" ----------------- QUICK SAVE COMMAND ------------------------
"" noremap <C-Z> :update<CR>
"" vnoremap <C-Z> <C-C>:update<CR>
"" inoremap <C-Z> <C-O>:update<CR>


" Quick quit command
"" noremap <Leader>e :quit<CR>  " Quit current window
"" noremap <Leader>E :qa!<CR>   " Quit all windows


" ----------------- SHORTCUT KEYS ------------------------

" bind Ctrl+<movement> keys to move around the windows, instead of using Ctrl+w + <movement>
" Every unnecessary keystroke that can be saved is good for your health :)
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h


"" easier moving between tabs
" map <Leader>n <esc>:tabprevious<CR>
" map <Leader>m <esc>:tabnext<CR>
map <C-i> <Esc>:tabprev<CR>
map <C-o> <Esc>:tabnext<CR>
map <C-n> <Esc>:tabnew<CR>
map <C-q> <Esc>:tabo<CR>
map <leader>p  :tabo<CR>

" map sort function to a key
vnoremap <Leader>s :sort<CR>

" easier moving of code blocks
" Try to go into visual mode (v), thenselect several lines of code here and
" then press ``>`` several times.
vnoremap < <gv  " better indentation
vnoremap > >gv  " better indentation


" ------------- SYNTAX HIGHLIGTING ---------------
" You need to reload this file for the change to apply
filetype off
filetype plugin indent on
syntax on



" easier formatting of paragraphs
vmap Q gq
nmap Q gqap


" Useful settings
"" set history=700
"" set undolevels=700


" Real programmers don't use TABs but spaces
" set tabstop=4
" set softtabstop=4
" set shiftwidth=4
" set shiftround
" set expandtab

" New setting for tab
" au BufNewFile,BufRead *.py, *.go
"     \ set tabstop=4
"     \ set softtabstop=4
"     \ set shiftwidth=4
"     \ set textwidth=79
"     \ set expandtab
"     \ set shiftround
    " \ set autoindent
    " \ set fileformat=unix

" Settings for js, css  and html
" au BufNewFile,BufRead *.js, *.html, *.css, *.less
"     \ set tabstop=2
"     \ set softtabstop=2
"     \ set shiftwidth=2
"     \ set textwidth=100
"     \ set expandtab
"     \ set autoindent
"    \ set fileformat=unix

" Identifying white space
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" by default, the indent is 2 spaces.
set shiftwidth=2
set softtabstop=2
set tabstop=2

" for html/rb files, 2 spaces
autocmd Filetype html setlocal ts=2 sw=2 expandtab
autocmd Filetype ruby setlocal ts=2 sw=2 expandtab

" for js/coffee/jade files, 4 spaces
autocmd Filetype javascript setlocal ts=2 sw=2 sts=0 expandtab
autocmd Filetype go setlocal ts=4 sw=4 sts=0 expandtab
autocmd Filetype coffeescript setlocal ts=4 sw=4 sts=0 expandtab
autocmd Filetype python setlocal ts=4 sw=4 sts=0 expandtab
autocmd Filetype ruby setlocal ts=2 sw=2 sts=0 expandtab
autocmd Filetype jade setlocal ts=4 sw=4 sts=0 expandtab

"" New settings
" autocmd Filetype html setlocal ts=2 sw=2 expandtab

"" for js/coffee/jade files, 4 spaces
"autocmd Filetype javascript setlocal ts=2 sw=2 sts=0 expandtab
" autocmd FileType python set tabstop=4|set shiftwidth=4|set expandtab

" Make search case insensitive
set hlsearch
set incsearch
set ignorecase
set smartcase


" Disable stupid backup and swap files - they trigger too many events
" for file system watchers
set nobackup
set nowritebackup
set noswapfile


" Setup Pathogen to manage your plugins NOTE: Using Vundle
" mkdir -p ~/.vim/autoload ~/.vim/bundle
" curl -so ~/.vim/autoload/pathogen.vim https://raw.githubusercontent.com/tpope/vim-pathogen/master/autoload/pathogen.vim
" Now you can install any plugin into a .vim/bundle/plugin-name/ folder
" call pathogen#infect()



" ----------- CTRL+P SETTINGS ----------------------
" cd ~/.vim/bundle
" git clone https://github.com/kien/ctrlp.vim.git
let g:ctrlp_max_height = 30
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=*/coverage/*
set wildignore+=*/node_modules/*

" -------------- NERD TREE SETTINGS --------------------------------------
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
" let NERDTreeMapOpenInTab='<ENTER>'
autocmd BufWinEnter * NERDTreeMirror
set mouse=a
let g:NERDTreeMouseMode=3
" map <silent> <C-m> :NERDTreeToggle<CR>
map <Leader>q :NERDTreeToggle<CR>
" map <F2> :NERDTreeToggle<CR>
" let NERDTreeQuitOnOpen=1
" AUTO CLOSE on file close setting
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif


" ---------------------- TMUX SETTING  ---------------------------
" augroup Tmux "{{{2
"   au!
"   autocmd VimEnter,BufNewFile,BufReadPost * call system('tmux rename-window "vim - ' . split(substitute(getcwd(), $HOME, '~', ''), '/')[-1] . '"')
"   autocmd VimLeave * call system('tmux rename-window ' . split(substitute(getcwd(), $HOME, '~', ''), '/')[-1])
"   augroup END
set t_BE=

"------------- YOU COMPLETE ME SETTINGS -------------------
" YouComplete Settings
let g:ycm_python_binary_path = 'python'
" New settings
" Let YCM read tags from Ctags file
let g:ycm_collect_identifiers_from_tags_files = 1
" Default 1, just ensure
let g:ycm_use_ultisnips_completer = 1
" Completion for programming language's keyword
let g:ycm_seed_identifiers_with_syntax = 1
" Completion in comments
let g:ycm_complete_in_comments = 1
" Completion in string
let g:ycm_complete_in_strings = 1

