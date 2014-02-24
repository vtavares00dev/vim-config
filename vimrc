"
" Victor Tavares's Vim Configuration
"

"------------------------------------------------------------
" Global
"------------------------------------------------------------
"
" This must be first, because it changes other options as a side effect.
set nocompatible

"------------------------------------------------------------
" Vundle setup
"------------------------------------------------------------
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Let Vundle manage Vundle
Bundle 'gmarik/vundle'

"------------------------------------------------------------
" My Bundles
"------------------------------------------------------------
Bundle 'tpope/vim-fugitive'
Bundle 'bling/vim-airline'
Bundle 'scrooloose/syntastic'
Bundle 'scrooloose/nerdtree'
Bundle 'kien/ctrlp.vim'
Bundle 'Valloric/YouCompleteMe'

" =============== Vundle Initialization ===============
" This loads all the plugins specified in ~/.vim/vundle.vim
" Use Vundle plugin to manage all other plugins
 if filereadable(expand("~/.vim/vundles.vim"))
   source ~/.vim/vundles.vim
 endif

" filetype settings
filetype on
filetype plugin on
filetype indent on

" tell VIM to always put a status line in, even in single window
set laststatus=2

" Don't update the display while executing macros
set lazyredraw

" set wildmenu for tab completion options on command line
set wildmenu
set wildmode=list:longest,full

" hide buffers in the background instead of closing them
set hidden

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" No backup files
set nobackup	
set noswapfile
set nowb

" lots of history
set history=100	

" turn on line numbering
set number

" show the cursor position all the time
set ruler		

" When the page starts to scroll, keep the cursor 8 lines from the top and 8
" lines from the bottom
set scrolloff=4

" Add ignorance of whitespace to diff
set diffopt+=iwhite

" Add the unnamed register to the clipboard
set clipboard+=unnamed

" Automatically read a file that has changed on disk
" set autoread

set showcmd		    " display incomplete commands
set showmode		" show current mode in status line
set visualbell		" no sounds
set incsearch		" do incremental searching
set wrapscan        " set the search scan to wrap lines

" make the 'cw' and like commands put a $ at the end instead
" of just deleting the text and replacing it
set cpoptions=ces$

" Tabstops are 4 spaces
set smarttab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab
set autoindent		" always set autoindenting on
set smartindent

" Display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:·

:highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE


"------------------------------------------------------------
" persistent undo
" *** disabled ***
"
" Keep undo history across sessions, by storing in file.
" silent !mkdir ~/.vim/backups > /dev/null 2>&1
" set undodir=~/.vim/backups
" set undofile
"------------------------------------------------------------


"============================================================
" maps
"============================================================

" System default for mappings is now the "," character
let mapleader = ","

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" Underline the current line with '=', '-', or '~'
nmap <silent> <Leader>u= :t.\|s/./=/g\|:nohls<cr>
nmap <silent> <Leader>u- :t.\|s/./-/g\|:nohls<cr>
nmap <silent> <Leader>u~ :t.\|s/./\\~/g\|:nohls<cr>

" window movement
nmap <silent> <Leader>j <C-W>j
nmap <silent> <Leader>k <C-W>k
nmap <silent> <Leader>h <C-W>h
nmap <silent> <Leader>l <C-W>l
nmap <silent> <Leader>, <C-W><C-W>

" Shrink the current window to fit the number of lines in the buffer.  Useful
" for those buffers that are only a few lines
nmap <silent> <Leader>sw :execute ":resize " . line('$')<cr>

" run ctags and output on new vsplit
" map  :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

" allow F5 to toggle paste mode
set pastetoggle=<f2>

" set text wrapping toggles
nmap <silent> <Leader>ww :set invwrap<CR>:set wrap?<CR>


"============================================================
" functions, commands, macros, etc
"============================================================

" This is the timeout used while waiting for user input on a multi-keyed macro
" or while just sitting and waiting for another key to be pressed measured
" in milliseconds - i.e. for the ',d' command, there is a 'timeoutlen' wait
" period between the ',' key and the 'd' key.  If the 'd' key isn't pressed
" before the timeout expires, one of two things happens: The ',' command is
" executed if there is one (which there isn't) or the command aborts
set timeoutlen=1000

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

" Launch the Mark app to view markdown file being edited
command! Markdown !mark %
map <Leader>md :Markdown<CR>

"============================================================
" text replacements
"============================================================
iab vmt     Victor Tavares


"============================================================
" GUI and colours
"============================================================
" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
  " hide the mouse pointer while typing
  set mousehide
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  " Syntax coloring lines that are too long just slows down the world
  set synmaxcol=2048
  set background=dark
  colorscheme solarized
"  set hlsearch
endif


"-----------------------------------------------------------------------------
" GPG Stuff
"-----------------------------------------------------------------------------
if has("mac")
    let g:GPGExecutable = "gpg2"
    let g:GPGUseAgent = 0
endif


"============================================================
" Bundle Configurations
"============================================================

"------------------------------------------------------------
" vim-airline
"------------------------------------------------------------
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep=' '
let g:airline#extensions#tabline#left_alt_sep='¦'
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#branch#empty_message = ''
let g:airline#extensions#whitespace#enabled = 0
let g:airline_powerline_fonts = 1
let g:bufferline_echo = 0

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

"------------------------------------------------------------
" vim-fugitive
"------------------------------------------------------------
nmap <Leader>gs :Gstatus<cr>
nmap <Leader>ge :Gedit<cr>
nmap <Leader>gw :Gwrite<cr>
nmap <Leader>gr :Gread<cr>
nmap <Leader>gl :Glog<cr>

"-----------------------------------------------------------------------------
" NERD Tree Plugin Settings
"-----------------------------------------------------------------------------
" Toggle the NERD Tree on an off with F7
nmap <F7> :NERDTreeToggle<CR>

" Close the NERD Tree with Shift-F7
nmap <S-F7> :NERDTreeClose<CR>

" move NERDTree window to the right
let g:NERDTreeWinPos = "right"

" make window decent size 
let g:NERDTreeWinSize = 48

" close NERDTree window when opening a file
let g:NERDTreeQuitOnOpen = 1

" Show the bookmarks table on startup
let NERDTreeShowBookmarks=1

" Don't display these kinds of files
" let NERDTreeIgnore=[ '\.obj$', '\.bak$']

"-----------------------------------------------------------------------------
" CtrlP Settings
"-----------------------------------------------------------------------------
" show windows from top
let g:ctrlp_match_window = 'top'
" jump to file if already open instead of opening a new instance
let g:ctrlp_switch_buffer = 'Et'

map <Leader>fb :CtrlPBuffer<cr>
map <Leader>ff :CtrlP .<cr>
map <Leader>fr :CtrlP<cr>
map <Leader>fm :CtrlPMixed<cr>


"-----------------------------------------------------------------------------
" YouCompleteMe settings
"-----------------------------------------------------------------------------
" only enable for c or c++ files
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_filetype_whitelist = { 'c': 1, 'cpp': 1}
