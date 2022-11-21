" An example for a vimrc file.
"
" Maintainer:    Bram Moolenaar <Bram@vim.org>
" Last change:    2008 Dec 17
"
" To use it, copy it to
"   for Unix and OS/2:  ~/.vimrc
"   for Amiga:  s:.vimrc
"   for MS-DOS and Win32:  $VIM\_vimrc
"   for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
  set nobackup      " do not keep a backup file, use versions instead
else
  set backup        " keep a backup file
endif
set history=1000    " keep 1000 lines of command line history
set ruler           " show the cursor position all the time
set showcmd         " display incomplete commands
set incsearch       " do incremental searching

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" Makes folds visible in the sidebar
set foldcolumn=5

" vim-sensible
set wildmenu
set wildmode=longest:full,full
set display+=lastline
set tabpagemax=50

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

if &diff
    colorscheme gruvbox
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 100 characters.
  autocmd FileType text setlocal textwidth=100

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent        " always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
          \ | wincmd p | diffthis
endif

" http://spectlog.com/content/Fixing_vi_editor_on_cygwin_terminal
colorscheme desert

set cul

set smartindent
set tabstop=4
" Set autoindent spacing.
set shiftwidth=4
" Shift to the next round tab stop.
set shiftround
set softtabstop=4
" set smarttab
set expandtab

set showmatch
if !has('nvim')
  set hl=l:Visual
endif
" Case-insensitive Pattern Matching
set ignorecase
"Overrides ignorecase if pattern contains upcase
set smartcase

set number
set relativenumber
" Toggle Relative Number
nnoremap <silent> <leader>nb :set relativenumber!<CR>

set path=$PWD/**
set cursorline

set backupdir=~/.vim/backup

set tildeop

" danielmiessler.com/study/vim
" remap escape to jk
inoremap jk <ESC>
" remap leader key to space
let mapleader = " "

set encoding=utf8
" map your system keyboard to Vim's paste buffer
set clipboard=unnamed


" Quickly quit editing without save
nnoremap <leader>q :q!<CR>
" Save the file (handling the permission-denied error)
cnoremap w!! w !sudo tee % >/dev/null
" Make j and k move to the next row, not file line
nnoremap j gj
nnoremap k gk
" Home & End should be placed next to each other
nnoremap - $
" Move to beginning/end of line
nnoremap B ^
nnoremap E $
" Keep search results at the center of screen
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz
" Press <leader> Enter to remove search highlights
noremap <silent> <leader><cr> :noh<cr>

" Allow vim to update only the necessary characters on the screen
set lazyredraw
set ttyfast

" Switch between tabs
nnoremap <Leader>1 1gt
nnoremap <Leader>2 2gt
nnoremap <Leader>3 3gt
nnoremap <Leader>4 4gt
nnoremap <Leader>5 5gt
nnoremap <Leader>6 6gt
nnoremap <Leader>7 7gt
nnoremap <Leader>8 8gt
nnoremap <Leader>9 9gt

" Easily create a new tab
noremap <Leader>tN :tabnew<CR>
" Easily close a new tab
noremap <Leader>tc :tabclose<CR>
" Easily move a new tab
noremap <Leader>tm :tabmove<CR>
" Easily go to next tab
noremap <Leader>tn :tabnext<CR>
" Easily go to previous tab
noremap <Leader>tp :tabprevious<CR>

" Powerline
if !has('nvim')
    python3 from powerline.vim import setup as powerline_setup
    python3 powerline_setup()
    python3 del powerline_setup
endif

set laststatus=2

" Netrw config
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 2
let g:netrw_altv = 1
let g:netrw_winsize = 25

" Toggle Vexplore with Ctrl-E
function! ToggleVExplorer()
    if exists("t:expl_buf_num")
        let expl_win_num = bufwinnr(t:expl_buf_num)
        if expl_win_num != -1
            let cur_win_nr = winnr()
            exec expl_win_num . 'wincmd w'
            close
            exec cur_win_nr . 'wincmd w'
            unlet t:expl_buf_num
        else
            unlet t:expl_buf_num
        endif
    else
        exec 'lwincmd w'
        Vexplore
        let t:expl_buf_num = bufnr("%")
    endif
endfunction
" map  :call ToggleVExplorer()<CR>

" Change directory to the current buffer when opening files.
set autochdir

set listchars=tab:>-,trail:-
" Toggle whitespace in vimdiff
if &diff
    function! IwhiteToggle()
        if &diffopt =~ 'iwhite'
            set diffopt-=iwhite
        else
            set diffopt+=iwhite
        endif
    endfunction
    map ws :call IwhiteToggle()<CR>
endif

noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
nnoremap :W :w!
nnoremap <C-i> i_<Esc>r

" save undo trees in files
" Persistent undo, even if you close and reopen Vim.
set undofile
set undodir=~/.vim/undo
set undolevels=10000


packadd! matchit


call plug#begin('~/.vim/plugged')

Plug 'frazrepo/vim-rainbow'
" vim-rainbow

Plug 'vim-scripts/taglist.vim'
" :Tlist

Plug 'tpope/vim-fugitive'
" :Git status

Plug 'scrooloose/nerdtree'
" :NERDTree

Plug 'airblade/vim-gitgutter'

Plug 'flazz/vim-colorschemes'

Plug 'junegunn/fzf.vim'

call plug#end()

" vim-rainbow
let g:rainbow_active = 1
" :NERDTree
map <F2> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
let NERDTreeShowLineNumbers=1
" Open NERDTree in new tabs and windows if no command-line args set
autocmd VimEnter * if !argc() | NERDTree | endif
autocmd BufEnter * if !argc() | NERDTreeMirror | endif

hi Normal guibg=NONE ctermbg=NONE

