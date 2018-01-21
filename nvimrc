"
" Victor Tavares's nvim Configuration
"
" inspired by many other examples, including:
" https://github.com/sjl/dotfiles/
" https://github.com/henrik/dotfiles/
" https://github.com/sebdah/dotfiles/
" https://github.com/fatih/dotfiles/

"------------------------------------------------------------
" Global
"------------------------------------------------------------
"
" This must be first, because it changes other options as a side effect.
if has('vim_starting')
  set nocompatible               " Be iMproved
endif

"------------------------------------------------------------
" Plug setup
"------------------------------------------------------------
let vimplug_exists=expand('~/.config/nvim/autoload/plug.vim')

if !filereadable(vimplug_exists)
  if !executable("curl")
    echoerr "You have to install curl or first install vim-plug yourself!"
    execute "q!"
  endif
  echo "Installing Vim-Plug..."
  echo ""
  silent !\curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  let g:not_finish_vimplug = "yes"

  autocmd VimEnter * PlugInstall
endif

" Required:
call plug#begin(expand('~/.config/nvim/plugged'))

"------------------------------------------------------------
" My Plugins
"------------------------------------------------------------
" pre-dependencies
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'tpope/vim-rhubarb'           " Depenency for tpope/fugitive
Plug 'godlygeek/tabular'           " This must come before plasticboy/vim-markdown

Plug 'AndrewRadev/splitjoin.vim'
Plug 'Raimondi/delimitMate'
Plug 'SirVer/ultisnips'
Plug 'airblade/vim-gitgutter'
Plug 'bling/vim-airline'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'ervandew/supertab'
Plug 'fatih/vim-go'
Plug 'majutsushi/tagbar'
Plug 'nsf/gocode', {'rtp': 'nvim/', 'do': '~/.config/nvim/plugged/gocode/nvim/symlink.sh' }
Plug 'plasticboy/vim-markdown'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdtree-git-plugin'
Plug 'sebdah/vim-delve'
Plug 'mbbill/undotree'
Plug 'sjl/vitality.vim'
Plug 't9md/vim-choosewin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'tommcdo/vim-exchange'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
Plug 'tpope/vim-surround'
Plug 'machakann/vim-highlightedyank'
Plug 'vim-scripts/scratch.vim'
Plug 'zchee/deoplete-go', { 'do': 'make'}

" post-dependencies
Plug 'ryanoasis/vim-devicons'

" =============== Plugin Initialization ===============
" All of your Plugins must be added before the following line
call plug#end()            " required
filetype plugin indent on    " required


" filetype settings
filetype on
filetype plugin on
filetype indent on

" tell VIM to always put a status line in, even in single window
set laststatus=2

" Set default encoding to UTF-8
set encoding=utf-8

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

" prefer unix file formats
set fileformats=unix,dos,mac

" speed up syntax highlighting
set nocursorcolumn
set nocursorline
set updatetime=100

set nohlsearch

" Completion window max size
set pumheight=10

" Add ignorance of whitespace to diff
set diffopt+=iwhite

" Add the unnamed register to the clipboard
set clipboard+=unnamed

" allow F2 to toggle paste mode
set pastetoggle=<F2>

" Automatically read a file that has changed on disk
" set autoread

set showcmd         " display incomplete commands
set noshowmode      " mode shown in airline status bar
set visualbell      " no sounds
set incsearch       " do incremental searching
set wrapscan        " set the search scan to wrap lines

" highlight substitutions
set inccommand=nosplit
let g:highlightedyank_highlight_duration = 250

" remove the annoying scratch preview window on autocomplete
set completeopt-=preview

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
"

"============================================================
" Neovim specific settings
"============================================================
"if has('nvim')
    " Set the Python binaries neovim is using. Please note that you will need to
    " install the neovim package for these binaries separately like this for
    " example:
    " pip3 install -U neovim
"    let g:python_host_prog = '/usr/local/bin/python2.7'
"    let g:python3_host_prog = '/usr/local/bin/python3.6'
"endif

"============================================================
" FileTypes
"============================================================

autocmd BufNewFile,BufRead *.txt setlocal noet ts=4 sw=4


"============================================================
" maps
"============================================================

" System default for mappings is now the space character
nnoremap <SPACE> <Nop>
let mapleader = "\<Space>"

" redraw the screen
map <Leader><Leader> :redraw!<CR>

" Don't use Ex mode, use Q for formatting
map Q gq

" cycle through buffers with shift + left/right arrow
nnoremap <S-Right> :bnext<CR>
nnoremap <S-Left> :bprevious<CR>

" cycle through tabs with control + shift + left/right arrow
noremap <C-S-Left> :tabp<CR>
noremap <C-S-Right> :tabn<CR>

" redo
nmap <Leader>u <C-R>

" Kill buffer
nnoremap <Leader>, :bd<cr>

" Close all but the current one
nnoremap <Leader>. :only<CR>

" Print the full path
map <C-F> :echo expand("%:p")<CR>

" quickly type kkj in insert mode to <ESC>
imap kkj <Esc>

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
" close window
nmap <Leader>c <C-W>c

" Shrink the current window to fit the number of lines in the buffer.  Useful
" for those buffers that are only a few lines
nmap <Leader>sw :execute ":resize " . line('$')<cr>

" set text wrapping toggles
nmap <Leader>ww :set invwrap<CR>:set wrap?<CR>

" Launch the Mark app to view markdown file being edited
command! Markdown !open -a Marked %
map <Leader>md :Markdown<CR>

" toggle dark or light background
map <Leader>bg :let &background = ( &background == "dark"? "light" : "dark")<CR>

" turn off diff
map <Leader>D :diffoff!<CR>

" toggle spelling on/off
map <F3> :setlocal spell! spelllang=en_ca<CR>
imap <F3> <C-o>:setlocal spell! spelllang=en_ca<CR>

" Keep search matches in the middle of the window.
nnoremap n nzzzv
nnoremap N Nzzzv

" Same when jumping around
nnoremap g; g;zz
nnoremap g, g,zz
nnoremap <C-o> <C-o>zz

" Do not show the q: window
map q: :q

" expand file path of active buffer (for :edit, :write, etc)
" from Pragmatic Practical Vim
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" quickfix window navigation
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <Leader>q :cclose<CR>

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

" remove fugitive git buffers from list to keep it clean
" http://vimcasts.org/episodes/fugitive-vim-browsing-the-git-object-database/
autocmd BufReadPost fugitive://* set bufhidden=delete


" remove trailing whitespace in whole file
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc

" map trailing whitespace deletion to <Leader>ws
noremap <Leader>ws :call DeleteTrailingWS()<CR>

" Clear all registers on startup
command! WipeReg for i in range(34,122) | silent! call setreg(nr2char(i), '') | endfor
autocmd VimEnter * WipeReg

"============================================================
" text replacements
"============================================================
iabbrev vmt Victor Tavares

"iso 8601 date format
iabbrev idate <C-r>=strftime("%Y-%m-%d")<CR>

"iso 8601 date and time format
iabbrev itdate <C-r>=strftime("%Y-%m-%d %H:%M:%S %z")<CR>

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
  set guifont=Meslo\ LG\ M\ DZ\ Regular\ for\ Powerline\ Nerd\ Font\ Complete:h12
endif

" underline and highlight spelling errors in red
hi clear SpellBad
hi SpellBad cterm=underline ctermfg=red

" Time out on key codes but not mappings.
" Basically this makes terminal Vim work sanely.
if !has('gui_running')
  set notimeout
  set ttimeout
  set ttimeoutlen=10
  augroup FastEscape
    autocmd!
    au InsertEnter * set timeoutlen=0
    au InsertLeave * set timeoutlen=1000
  augroup END
endif


"============================================================
" Quick Editing in new window
"============================================================
noremap <Leader>ev :vsplit $MYVIMRC<CR>     " open up .vimrc


"============================================================
" Plugin Configurations
"============================================================

"------------------------------------------------------------
" vim-devicons
"------------------------------------------------------------
let g:webdevicons_enable = 1

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
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.maxlinenr = '㏑'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.paste = 'Þ'

" enable vim-devicons in vim-airline
let g:webdevicons_enable_airline_tabline = 1


"------------------------------------------------------------
" vim-fugitive
"------------------------------------------------------------
nmap <Leader>Ga :Gadd<cr>
nmap <Leader>Gb :Gblame<cr>
nmap <Leader>Gci :Gcommit<cr>
nmap <Leader>Gco :Gcheckout<cr>
nmap <Leader>Gd :Gdiff<cr>
nmap <Leader>Ge :Gedit<cr>
nmap <Leader>Gl :Glog<cr>
nmap <Leader>Gm :Gmove<cr>
nmap <Leader>Gr :Gremove<cr>
nmap <Leader>Gs :Gstatus<cr>
nmap <Leader>Gw :Gwrite<cr>
nmap <Leader>Gh :.Gbrowse<CR>   "open in GitHub

"-----------------------------------------------------------------------------
" NERD Tree Plugin Settings
"-----------------------------------------------------------------------------
" Toggle the NERD Tree on an off with F7
nmap <F7> :NERDTreeToggle<CR>

" Find in NERD Tree with Shift-F7
nmap <Leader><F7> :NERDTreeFind<CR>

" move NERDTree window to the left
let g:NERDTreeWinPos = "left"

" make window decent size
let g:NERDTreeWinSize = 48

" close NERDTree window when opening a file
let g:NERDTreeQuitOnOpen = 1

" Show the bookmarks table on startup
let g:NERDTreeShowBookmarks=1

" Close vim if NERDTree is the only opened window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" vim-devions configuration
let g:webdevicons_enable_nerdtree = 1
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:WebDevIconsOS = 'Darwin'


" Don't display these kinds of files
" let NERDTreeIgnore=[ '\.obj$', '\.bak$']


"-----------------------------------------------------------------------------
" CtrlP Settings
"-----------------------------------------------------------------------------
let g:ctrlp_working_path_mode = 'ra'
" jump to file if already open instead of opening a new instance
let g:ctrlp_switch_buffer = 'Et'
let g:ctrlp_mruf_max=450    " number of recently opened files
let g:ctrlp_max_files=0     " do not limit the number of searchable files
let g:ctrlp_use_caching = 1
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_cache_dir = $HOME.'/.cache/ctrlp'
let g:ctrlp_match_window = 'bottom,order:btt,max:10,results:10'
let g:ctrlp_buftag_types = {'go' : '--language-force=go --golang-types=ftv'}

map <Leader>fw :CtrlPBuffer<cr>
" file current dir
map <Leader>ff :CtrlP .<cr>
" file root
map <Leader>fr :CtrlP<cr>
" files, buffers, and MRU
map <Leader>fm :CtrlPMixed<cr>

" enable vim-devicons
let g:webdevicons_enable_ctrlp = 1


"-----------------------------------------------------------------------------
" UltiSnips
"-----------------------------------------------------------------------------
let g:UltiSnipsListSnippets = '<F9>'

function! g:UltiSnips_Complete()
  call UltiSnips#ExpandSnippet()
  if g:ulti_expand_res == 0
    if pumvisible()
      return "\<C-n>"
    else
      call UltiSnips#JumpForwards()
      if g:ulti_jump_forwards_res == 0
        return "\<TAB>"
      endif
    endif
  endif
  return ""
endfunction

function! g:UltiSnips_Reverse()
  call UltiSnips#JumpBackwards()
  if g:ulti_jump_backwards_res == 0
    return "\<C-P>"
  endif

  return ""
endfunction


if !exists("g:UltiSnipsJumpForwardTrigger")
  let g:UltiSnipsJumpForwardTrigger = "<tab>"
endif

if !exists("g:UltiSnipsJumpBackwardTrigger")
  let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
endif

au InsertEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"
au InsertEnter * exec "inoremap <silent> " . g:UltiSnipsJumpBackwardTrigger . " <C-R>=g:UltiSnips_Reverse()<cr>"


"-----------------------------------------------------------------------------
" Tagbar settings
"-----------------------------------------------------------------------------
nmap <F8> :TagbarToggle<CR>
let g:tagbar_autofocus = 1
" disabled - slow - enable tagbar in vim-airline status bar when needed
let g:airline#extensions#tagbar#enabled = 0
" go
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [  'p:package', 'i:imports:1', 'c:constants', 'v:variables',
        \ 't:types',  'n:interfaces', 'w:fields', 'e:embedded', 'm:methods',
        \ 'r:constructor', 'f:functions' ],
    \ 'sro' : '.',
    \ 'kind2scope' : { 't' : 'ctype', 'n' : 'ntype' },
    \ 'scope2kind' : { 'ctype' : 't', 'ntype' : 'n' },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
    \ }



"-----------------------------------------------------------------------------
" vim-go settings
"-----------------------------------------------------------------------------
let g:go_fmt_fail_silently = 0
" use goimports for formatting
let g:go_fmt_command = "goimports"
" use quickfix for all errors
let g:go_list_type = "quickfix"
" highlight same variable,function or struct.
let g:go_auto_sameids = 1
" don't use the default guru command for defs
let g:go_def_mode = 'godef'
" disable automatically show type info
let g:go_auto_type_info = 1
let g:go_def_mode = "guru"
let g:go_echo_command_info = 1
let g:go_gocode_autobuild = 1
let g:go_gocode_unimported_packages = 1
let g:go_autodetect_gopath = 1
let g:go_info_mode = "guru"
let g:go_term_mode = "split"


" highlight in vim-go
let g:go_highlight_array_whitespace_error = 0
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 0
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_space_tab_error = 0
let g:go_highlight_structs = 1
let g:go_highlight_trailing_whitespace_error = 0
let g:go_highlight_types = 1

let g:go_modifytags_transform = 'snake_case'

" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

"au FileType go nmap <Leader>gb <Plug>(go-build)
autocmd FileType go nmap <silent> <Leader>gb :<C-u>call <SID>build_go_files()<CR>

" gometalinter configuration
let g:go_metalinter_command = ""
let g:go_metalinter_deadline = "5s"
let g:go_metalinter_enabled = [
    \ 'deadcode',
    \ 'errcheck',
    \ 'gas',
    \ 'goconst',
    \ 'gocyclo',
    \ 'golint',
    \ 'gosimple',
    \ 'ineffassign',
    \ 'vet',
    \ 'vetshadow'
\]

au FileType go nmap <Leader>gr <Plug>(go-run)
au FileType go nmap <Leader>gt <Plug>(go-test)
au FileType go nmap <Leader>gc <Plug>(go-coverage-toggle)
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gw <Plug>(go-doc-browser)
au FileType go nmap <Leader>gs <Plug>(go-implements)
au FileType go nmap <Leader>gi <Plug>(go-info)
au FileType go nmap <Leader>ge <Plug>(go-rename)
au FileType go nmap <Leader>ga <Plug>(go-alternate-edit)
au FileType go nmap <F1> :GoDoc<cr>
au FileType go nmap <F5> :GoCoverageToggle -short<cr>
au FileType go nmap <F6> :GoAlternate <cr>


" create a go doc comment based on the word under the cursor
function! s:create_go_doc_comment()
  norm "zyiw
  execute ":put! z"
  execute ":norm I// \<Esc>$"
endfunction
au FileType go nmap <silent> <Leader>go :<C-u>call <SID>create_go_doc_comment()<CR>

"-----------------------------------------------------------------------------
" deoplete settings
"-----------------------------------------------------------------------------
set runtimepath+=$XDG_CONFIG_HOME/nvim/plugged/deoplete.nvim
let g:deoplete#enable_at_startup = 1

"-----------------------------------------------------------------------------
" deoplete-go settings
"-----------------------------------------------------------------------------
" Enable completing of go pointers
let g:deoplete#sources#go#pointer = 1

"-----------------------------------------------------------------------------
" vim-delve settings
"-----------------------------------------------------------------------------
" Set the Delve backend.
let g:delve_backend = "native"

"-----------------------------------------------------------------------------
" vim-markdown settings
"-----------------------------------------------------------------------------
" Disable folding
let g:vim_markdown_folding_disabled = 1

" Auto shrink the TOC, so that it won't take up 50% of the screen
let g:vim_markdown_toc_autofit = 1

"-----------------------------------------------------------------------------
" Undotree settings
"-----------------------------------------------------------------------------
nnoremap <F4> :UndotreeToggle<CR>

"-----------------------------------------------------------------------------
" delimitMate settings
"-----------------------------------------------------------------------------
let g:delimitMate_expand_cr = 1
let g:delimitMate_expand_space = 1
let g:delimitMate_smart_quotes = 1
let g:delimitMate_expand_inside_quotes = 0
let g:delimitMate_smart_matchpairs = '^\%(\w\|\$\)'


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
nmap <Leader><F10> <plug>(choosewin-swap)
let g:choosewin_overlay_enable=1
let g:choosewin_return_on_single_win=1  " return immediately when only 1 win

