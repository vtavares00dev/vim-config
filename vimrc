"
" Victor Tavares's Vim Configuration
"
" inspired by many other examples, including:
" https://github.com/sjl/dotfiles/
" https://github.com/henrik/dotfiles/

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
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()

" Let Vundle manage Vundle
Plugin 'gmarik/vundle'

"------------------------------------------------------------
" My Bundles
"------------------------------------------------------------
Plugin 'SirVer/ultisnips'
Plugin 'Valloric/YouCompleteMe'
Plugin 'bling/vim-airline'
" Plugin 'honza/vim-snippets'
Plugin 'kien/ctrlp.vim'
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/nerdtree'
Plugin 'sjl/gundo.vim'
Plugin 'sjl/vitality.vim'
Plugin 't9md/vim-choosewin'
Plugin 'tommcdo/vim-exchange'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-dispatch'
Plugin 'vim-scripts/scratch.vim'

" =============== Vundle Initialization ===============
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


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

" When the page starts to scroll, keep the cursor 4 lines from the top and 4
" lines from the bottom
set scrolloff=4

" Add ignorance of whitespace to diff
set diffopt+=iwhite

" Add the unnamed register to the clipboard
set clipboard+=unnamed

" allow F2 to toggle paste mode
set pastetoggle=<F2>

" Automatically read a file that has changed on disk
" set autoread

set showcmd         " display incomplete commands
set showmode        " show current mode in status line
set visualbell      " no sounds
set incsearch       " do incremental searching
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
set autoindent      " always set autoindenting on
set smartindent

set textwidth=80
set colorcolumn=+1  " highlight column 81

" Display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:·

:highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE


"------------------------------------------------------------
" persistent undo
"
" Keep undo history across sessions, by storing in file.
silent !mkdir ~/.vim/backups > /dev/null 2>&1
set undodir=~/.vim/backups
set undolevels=100
set undofile
"------------------------------------------------------------


"============================================================
" maps
"============================================================

" System default for mappings is now the space character
let mapleader = "\<Space>"

" Don't use Ex mode, use Q for formatting
map Q gq

" cycle through buffers with tab and shift-tab
nnoremap <TAB> :bnext<CR>
nnoremap <S-TAB> :bprevious<CR>

" Shift + left/right to switch tabs.
noremap <S-Left> :tabp<CR>
noremap <S-Right> :tabn<CR>

" redo
nmap <Leader>u <C-R>

" Kill buffer
nnoremap K :bd<cr>

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" Underline the current line with '=', '-', or '~'
nmap <Leader>== :t.\|s/./=/g\|:nohls<cr>
nmap <Leader>-- :t.\|s/./-/g\|:nohls<cr>
nmap <Leader>~~ :t.\|s/./\\~/g\|:nohls<cr>

" window movement
nmap <Leader>j <C-W>j
nmap <Leader>k <C-W>k
nmap <Leader>h <C-W>h
nmap <Leader>l <C-W>l
nmap <Leader>w <C-W><C-W>

" Shrink the current window to fit the number of lines in the buffer.  Useful
" for those buffers that are only a few lines
nmap <Leader>sw :execute ":resize " . line('$')<cr>

" run ctags and output on new vsplit
" map  :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

" set text wrapping toggles
nmap <Leader>ww :set invwrap<CR>:set wrap?<CR>

" Launch the Mark app to view markdown file being edited
command! Markdown !mark %
map <Leader>md :Markdown<CR>

" toggle dark or light background
map <Leader>bg :let &background = ( &background == "dark"? "light" : "dark")<CR>

" turn of diff
map <Leader>D :diffoff!<CR>

" Use c-\\ to do c-] but open it in a new split.
nnoremap <C-\><C-\> <C-w>v<C-]>zvzz

" Keep search matches in the middle of the window.
nnoremap n nzzzv
nnoremap N Nzzzv

" Same when jumping around
nnoremap g; g;zz
nnoremap g, g,zz
nnoremap <C-o> <C-o>zz

" expand file path of active buffer (for :edit, :write, etc)
" from Pragmatic Practical Vim
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

"============================================================
" functions, commands, macros, etc
"============================================================

" This is the timeout used while waiting for user input on a multi-keyed macro
" or while just sitting and waiting for another key to be pressed measured
" in milliseconds - i.e. for the ',d' command, there is a 'timeoutlen' wait
" period between the '<space>' key and 'd' key.  If the 'd' key isn't pressed
" before the timeout expires, one of two things happens: The '<space>' command
" is executed if there is one (which there isn't) or the command aborts
set timeoutlen=500

" Resize splits when the window is resized
au VimResized * :wincmd =

" Jump to last cursor position when file was opened
augroup vimrcEx
    autocmd!
    autocmd BufReadPost *
      \ if line("'\"") > 0 && line("'\"") <= line("$") |
      \   exe "normal g`\"" |
      \ endif
augroup END


" Exclude git commit messages from jump to last position
augroup gitCommitEditMsg
  autocmd!
  autocmd BufReadPost *
    \ if @% == '.git/COMMIT_EDITMSG' |
    \   exe "normal gg" |
    \ endif
augroup END


" remove trailing whitespace in whole file
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc

" map trailing whitespace deletion to <Leader>ws
noremap <Leader>ws :call DeleteTrailingWS()<CR>


"============================================================
" text replacements
"============================================================
iabbrev vmt Victor Tavares

"iso 8601 date and time format
iabbrev idate <C-r>=strftime("%Y-%m-%d %H:%M:%S %z")<CR>

" rfc 2822 date format
iabbrev rdate <C-r>=strftime("%d %b %Y")<CR>

" rfc 2822 date and time
iabbrev rtdate <C-r>=strftime("%a, %d %b %Y %T %z")<CR>


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
  set guifont=Meslo\ LG\ M\ DZ\ Regular\ for\ Powerline:h12
"  set hlsearch
endif


"============================================================
" Quick Editing in new window
"============================================================
noremap <Leader>ev :vsplit $MYVIMRC<CR>     " open up .vimrc


"============================================================
" Bundle Configurations
"============================================================

"------------------------------------------------------------
" vim-airline
"------------------------------------------------------------
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_min_count = 2 " min buffs to show
let g:airline#extensions#tabline#tab_nr_type = 1 " tab number
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
nmap <Leader>ga :Gadd<cr>
nmap <Leader>gb :Gblame<cr>
nmap <Leader>gci :Gcommit<cr>
nmap <Leader>gco :Gcheckout<cr>
nmap <Leader>gd :Gdiff<cr>
nmap <Leader>ge :Gedit<cr>
nmap <Leader>gl :Glog<cr>
nmap <Leader>gm :Gmove<cr>
nmap <Leader>gr :Gremove<cr>
nmap <Leader>gs :Gstatus<cr>
nmap <Leader>gw :Gwrite<cr>


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
let g:NERDTreeShowBookmarks=1

" Don't display these kinds of files
" let NERDTreeIgnore=[ '\.obj$', '\.bak$']


"-----------------------------------------------------------------------------
" CtrlP Settings
"-----------------------------------------------------------------------------
" show windows from top
let g:ctrlp_match_window = 'top'
" jump to file if already open instead of opening a new instance
let g:ctrlp_switch_buffer = 'Et'

" buffers
map <Leader>fb :CtrlPBuffer<cr>
" file current dir
map <Leader>ff :CtrlP .<cr>
" file root
map <Leader>fr :CtrlP<cr>
" files, buffers, and MRU
map <Leader>fm :CtrlPMixed<cr>


"-----------------------------------------------------------------------------
" YouCompleteMe settings
"-----------------------------------------------------------------------------
" only enable for python, c or c++ files
let g:ycm_key_detailed_diagnostics = '<Leader>d'
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_filetype_whitelist = {'c': 1, 'cpp': 1, 'h': 1, 'CC': 1, 'py': 1}
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_use_ultisnips_completer = 1


"-----------------------------------------------------------------------------
" UltiSnips
"-----------------------------------------------------------------------------
let g:UltiSnipsExpandTrigger="<F9>"
let g:UltiSnipsJumpForwardTrigger="<F9>"
let g:UltiSnipsJumpBackwardTrigger="<S-F9>"
let g:UltiSnipsSnippetsDir = "~/.vim/UltiSnips"


"-----------------------------------------------------------------------------
" Tagbar settings
"-----------------------------------------------------------------------------
nmap <F8> :TagbarToggle<CR>
let g:tagbar_autofocus = 1
" disabled - slow - enable tagbar in vim-airline status bar when needed
let g:airline#extensions#tagbar#enabled = 0


"-----------------------------------------------------------------------------
" Gundo settings
"-----------------------------------------------------------------------------
nnoremap <F4> :GundoToggle<CR>
let g:gundo_preview_bottom=1


"-----------------------------------------------------------------------------
" Vitality settings
"-----------------------------------------------------------------------------
let g:vitality_fix_cursor = 1
let g:vitality_fix_focus = 0
let g:vitality_always_assume_iterm = 1


"-----------------------------------------------------------------------------
" Scratch settings
"-----------------------------------------------------------------------------
command! ScratchToggle call ScratchToggle()

function! ScratchToggle()
    if exists("w:is_scratch_window")
        unlet w:is_scratch_window
        exec "q"
    else
        exec "normal! :Sscratch\<cr>\<C-W>L"
        let w:is_scratch_window = 1
    endif
endfunction

nnoremap <Leader><TAB> :ScratchToggle<cr>


"-----------------------------------------------------------------------------
" Choosewin settings
"-----------------------------------------------------------------------------
nmap <F10> <Plug>(choosewin)
nmap <S-F10> <plug>(choosewin-swap)
let g:choosewin_overlay_enable=1
let g:choosewin_return_on_single_win=1  " return immediately when only 1 win


"-----------------------------------------------------------------------------
" CScope Settings (see http://cscope.sourceforge.net/cscope_maps.vim)
"-----------------------------------------------------------------------------
" This tests to see if vim was configured with the '--enable-cscope' option
" when it was compiled.  If it wasn't, time to recompile vim...

if has("cscope")

    """"""""""""" Standard cscope/vim boilerplate

    " use both cscope and ctag for 'ctrl-]', ':ta', and 'vim -t'
    set cscopetag

    " check cscope for definition of a symbol before checking ctags: set to 1
    " if you want the reverse search order.
    set csto=0

    " add any cscope database in current directory
    if filereadable("cscope.out")
        cs add cscope.out
    " else add the database pointed to by environment variable
    elseif $CSCOPE_DB != ""
        cs add $CSCOPE_DB
    endif

    " show msg when any other cscope db added
    set cscopeverbose

    """"""""""""" cscope/vim key mappings
    "
    " The following maps all invoke one of the following cscope search types:
    "
    "   's'   symbol: find all references to the token under cursor
    "   'g'   global: find global definition(s) of the token under cursor
    "   'c'   calls:  find all calls to the function name under cursor
    "   't'   text:   find all instances of the text under cursor
    "   'e'   egrep:  egrep search for the word under cursor
    "   'f'   file:   open the filename under cursor
    "   'i'   includes: find files that include the filename under cursor
    "   'd'   called: find functions that function under cursor calls

    " Below are two sets of the maps: one set that just jumps to your
    " search result, one that splits the existing vim window vertically and
    " diplays your search result in the new window.

    " To do the first type of search, hit 'CTRL-\', followed by one of the
    " cscope search types above (s,g,c,t,e,f,i,d).  The result of your cscope
    " search will be displayed in the current window.  You can use CTRL-T to
    " go back to where you were before the search.

    nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
    nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>

    " Using 'CTRL-spacebar' (intepreted as CTRL-@ by vim) then a search type
    " makes the vim window split vertically, with search result displayed in
    " the new window.

    nmap <C-@>s :vert scs find s <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@>g :vert scs find g <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@>c :vert scs find c <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@>t :vert scs find t <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@>e :vert scs find e <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@>f :vert scs find f <C-R>=expand("<cfile>")<CR><CR>
    nmap <C-@>i :vert scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    nmap <C-@>d :vert scs find d <C-R>=expand("<cword>")<CR><CR>

endif " cscope
