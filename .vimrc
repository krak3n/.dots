" My .vimrc is imspired by:
" https://raw.github.com/terryma/dotfiles/master/.vimrc

" Disable vi-compatibility
set nocompatible

"===============================================================================
" NeoBundle
"===============================================================================

if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

" Asynchronous processes in vim
NeoBundle 'Shougo/vimproc', { 'build': {
      \   'windows': 'make -f make_mingw32.mak',
      \   'cygwin': 'make -f make_cygwin.mak',
      \   'mac': 'make -f make_mac.mak',
      \   'unix': 'make -f make_unix.mak',
      \ } }

" Configuration
NeoBundle 'editorconfig/editorconfig-vim'

" Theme
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'chriskempson/base16-vim'

" IDE
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimfiler.vim'
NeoBundle 'Yggdroot/indentLine'
NeoBundle 'bling/vim-airline'
NeoBundle 'myusuf3/numbers.vim'
NeoBundle 'sjl/gundo.vim'
NeoBundle 'moll/vim-bbye'
NeoBundle 'terryma/vim-multiple-cursors'
NeoBundle 'rhysd/clever-f.vim'
NeoBundle 'triglav/vim-visual-increment'
NeoBundle 'junegunn/limelight.vim'

" VCS
NeoBundle 'tpope/vim-fugitive'

" Code Completion
NeoBundle 'ervandew/supertab'
NeoBundle 'SirVer/ultisnips'
NeoBundle 'Valloric/YouCompleteMe', {
    \ 'build' : {
    \   'unix' : './install.sh --clang-completer --system-libclang',
    \   'mac': './install.sh --clang-completer --system-libclang',
    \ },
\ }

" Python
NeoBundle 'klen/python-mode'
NeoBundle 'hdima/python-syntax'

" Syntax
NeoBundle 'honza/dockerfile.vim'
NeoBundle 'saltstack/salt-vim'
NeoBundle 'lrampa/vim-apib'

NeoBundleCheck

"===============================================================================h
" Colour Scheme
"===============================================================================

let base16colorspace=256

set background=dark
colorscheme base16-default

"===============================================================================
" General Settings
"===============================================================================

syntax on
filetype plugin indent on

" Set augroup
augroup MyAutoCmd
  autocmd!
augroup END

" Reload vimrc when edited
autocmd MyAutoCmd BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc
      \ so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif

" Solid line for vsplit separator
set fcs=vert:│

" Give one virtual space at end of line
set virtualedit=onemore

" Turn on line number
set number

" Always splits to the right and below
set splitright
set splitbelow

" 256bit terminal
set t_Co=256

" Sets how many lines of history vim has to remember
set history=10000

" Set to auto read when a file is changed from the outside
set autoread

" Set to auto write file
set autowriteall

" Display unprintable chars
set list
set listchars=tab:▸\ ,extends:❯,precedes:❮,nbsp:␣
set showbreak=↪

" Minimal number of screen lines to keep above and below the cursor
set scrolloff=10

" How many lines to scroll at a time, make scrolling appears faster
set scrolljump=3

" Min width of the number column to the left
set numberwidth=4

" Open all folds initially
set foldmethod=indent
set foldlevelstart=99

" No need to show mode
set noshowmode

" Allow changing buffer without saving it first
set hidden

" Set backspace config
set backspace=eol,start,indent

" Case insensitive search
set ignorecase
set smartcase

" Set sensible heights for splits
set winheight=50

" Make search act like search in modern browsers
set incsearch

" Make regex a little easier to type
set magic

" Show matching brackets
set showmatch

" Show incomplete commands
set showcmd

" Turn off sound
set vb
set t_vb=

" Always show the statusline
set laststatus=2

" Explicitly set encoding to utf-8
set encoding=utf-8

" Column width indicator
set colorcolumn=+1

" Lower the delay of escaping out of other modes
set timeout timeoutlen=1000 ttimeoutlen=0

" Hilight searched strings
set hlsearch

" Set language
lang en_gb

" Turn backup off
set nobackup
set nowritebackup
set noswapfile

" Tab settings
set expandtab
set shiftwidth=4
set tabstop=4
set softtabstop=4
set smarttab

" Text display settings
set linebreak
set textwidth=0
set wrapmargin=0
set autoindent
set nowrap
set whichwrap+=h,l,<,>,[,]

" Writes to the unnamed register also writes to the * and + registers. This
" makes it easy to interact with the system clipboard
if has('unnamedplus')
    set clipboard=unnamedplus
else
    set clipboard=unnamed
endif

" Spelling highlights. Use underline in term to prevent cursorline highlights
" from interfering
if !has("gui_running")
    hi clear SpellBad
    hi SpellBad cterm=underline ctermfg=red
    hi clear SpellCap
    hi SpellCap cterm=underline ctermfg=blue
    hi clear SpellLocal
    hi SpellLocal cterm=underline ctermfg=blue
    hi clear SpellRare
    hi SpellRare cterm=underline ctermfg=blue
endif

" Use a low updatetime. This is used by CursorHold
set updatetime=1000

" Cursor settings. This makes terminal vim sooo much nicer!
" Tmux will only forward escape sequences to the terminal if surrounded by a DCS
" sequence
if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" Remove Scrollbars for GUI Vim
if has("gui_running")
    set guioptions-=r
    set guioptions-=R
    set guioptions-=L
    set guioptions-=l
endif

"===============================================================================
" Bindings
"===============================================================================

" Function Keys
" -------------

" Paste toggle
set pastetoggle=<F2>

" Toggle relative line numbers
nnoremap <F3> :NumbersToggle<cr>

" Toggle line numbers
nnoremap <F4> :NumbersOnOff<cr>

" Toggle spell checking
nnoremap <F5> :setlocal spell! spelllang=en_gb<cr>

" Toggle undo history
nnoremap <F6> :<C-u>GundoToggle<CR>

" Movement
" --------

" Buffer cycling
map <leader>[ :bprevious<cr>
map <leader>] :bnext<cr>

" Arrow keys do nothing, EVIL arrows
noremap  <Up> ""
noremap! <Up> <Esc>
noremap  <Down> ""
noremap! <Down> <Esc>
noremap  <Left> ""
noremap! <Left> <Esc>
noremap  <Right> ""
noremap! <Right> <Esc>

" Leader Mappings
" ---------------

" Close all buffers
nnoremap <Leader>q :qa<cr>

" Force close all
nnoremap <Leader>`` :qa!<cr>

" Close current buffer
:nnoremap <Leader>x :Bdelete<CR>

" Write current buffer
nmap <leader>w :w<cr>

" Force write current buffer
nmap <leader>W :w<cr>

" VimFiler
nnoremap <silent> <Leader><tab> :VimFilerExplorer<cr>

" Quick vimrc editing
nnoremap <Leader>e :e! ~/.vimrc<cr>

" Copy current path to file
nnoremap <silent> <Leader>p :let @+=expand("%:p")<cr>:echo "Copied current file
      \ path '".expand("%:p")."' to clipboard"<cr>

" Control Key Mappings
" --------------------

" Window movement
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Space Key Mappings
" ------------------

" Map space to search and ctrl-space to reverse search
map <space> /
map <c-space> ?

"===============================================================================
" Always Delete trailing white space
"===============================================================================

func! DeleteTrailingWS()
    exe "normal mz"
    %s/\s\+$//ge
    exe "normal `z"
endfunc
autocmd BufWrite * :call DeleteTrailingWS()

"===============================================================================
" Unite
"===============================================================================

" Settings
" --------

" Use the fuzzy matcher for everything
call unite#filters#matcher_default#use(['matcher_fuzzy'])

" Use the rank sorter for everything
call unite#filters#sorter_default#use(['sorter_rank'])

" Ignores
call unite#custom_source('file_rec,file_rec/async,file_mru,file,buffer,grep',
      \ 'ignore_pattern', join([
      \ 'tmp/',
      \ '\.git',
      \ '\.so',
      \ '\.swp',
      \ '\.zip',
      \ '\.pyc',
      \ '\.pyc',
      \ '\.gif',
      \ '\.jpg',
      \ '\.jpeg',
      \ '\.png/',
      \ '\.log/',
      \ '\.egg',
      \ '.sass-cache',
      \ ], '\|'))

" Start in insert mode
let g:unite_enable_start_insert = 1

" Open in bottom right
let g:unite_split_rule = "botright"

" Enable yank history
let g:unite_source_history_yank_enable = 1

" Enable short source name in window
let g:unite_enable_short_source_names = 0

" Shorten the default update date of 500ms
let g:unite_update_time = 100

" Do not overwrite status line
let g:unite_force_overwrite_statusline = 0

" Extra configuration with settings function
autocmd FileType unite call s:unite_settings()

" Unite Mappings
" --------------

" Map space to the prefix for Unite
nnoremap [unite] <Nop>
nmap <space> [unite]

" General fuzzy search
nnoremap <silent> [unite]<space> :<C-u>Unite
      \ -buffer-name=files -start-insert buffer file_rec/async:!<cr>

" Yank history
nnoremap <silent> [unite]y :<C-u>Unite -buffer-name=yanks history/yank<cr>

" Grep
nnoremap <silent> [unite]/ :<C-u>Unite grep:.<cr>

" Unite Settings Function
" -----------------------

function! s:unite_settings()
    imap <buffer> <C-j> <Plug>(unite_select_next_line)
    imap <buffer> <C-k> <Plug>(unite_select_previous_line)
    imap <silent><buffer><expr> <C-x> unite#do_action('split')
    imap <silent><buffer><expr> <C-v> unite#do_action('vsplit')
    imap <silent><buffer><expr> <C-t> unite#do_action('tabopen')
    nmap <buffer> <ESC> <Plug>(unite_exit)
endfunction

"===============================================================================
" Python
"===============================================================================

" Highlight all the python
let python_highlight_all = 1

" Highlight columns greater than 80
highlight OverLength ctermbg=darkred ctermfg=white guibg=#b30000
func! EightyColRuleOn()
    match OverLength /\%81v.\+/
endfunc
func! EightyColRuleOff()
    match
endfunc
autocmd BufEnter * call EightyColRuleOff()
autocmd BufEnter *.py call EightyColRuleOn()
autocmd BufEnter *.rst call EightyColRuleOn()

" Validate against PEP8
" autocmd BufWritePost *.py call Flake8()
let g:flake8_ignore="W404,F403,W0511,E712"

"===============================================================================
" Airline
"===============================================================================

let g:airline_powerline_fonts = 1
let g:airline_theme = 'base16'
let g:airline#extensions#tabline#enabled = 1

"===============================================================================
" IndentLine
"===============================================================================

let g:indentLine_color_term = 8
let g:indentLine_char = '¦'

"===============================================================================
" PyMode
"===============================================================================

let g:pymode = 1
let g:pymode_rope = 0
let g:pymode_doc = 0
let g:pymode_lint_signs = 0
let g:pymode_lint_ignore = "E702,E712"

" Prevents documentation window from popping open
set completeopt=menu

func! DisablePyLint()
    let g:pymode_lint = 0
endfunc
func! EnablePyLint()
    let g:pymode_lint = 1
endfunc
autocmd BufEnter * call DisablePyLint()
autocmd BufEnter *.py call EnablePyLint()

"===============================================================================
" Vimfiller
"===============================================================================

let g:vimfiler_as_default_explorer = 1
let g:vimfiler_safe_mode_by_default = 0
let g:vimfiler_force_overwrite_statusline = 0
let g:vimfiler_draw_files_limit = 1000
let g:vimfiler_ignore_pattern='\%(.cache\|.coverage\|.bat\|.BAK\|.DAT\|.pyc\|.egg-info\)$\|'.
  \ '^\%(.gitkeep\)$\|'.
  \ '^\%(.env\|.ebextensions\|.elasticbeanstalk\|Procfile\)$\|'.
  \ '^\%(.git\|.tmp\|__pycache__\|.DS_Store\|.o\|.tox\|.idea\|.ropeproject\)$'
let g:vimfiler_tree_leaf_icon = ' '
let g:vimfiler_tree_opened_icon = '▾'
let g:vimfiler_tree_closed_icon = '▸'
let g:vimfiler_file_icon = '-'
let g:vimfiler_readonly_file_icon = '✗'
let g:vimfiler_marked_file_icon = '✓'
let g:vimfiler_execute_file_list = {'jpg': 'open', 'jpeg': 'open', 'gif': 'open', 'bmp': 'open', 'html': 'open', 'ppt': 'open', 'pdf': 'open', 'png': 'open', 'ico': 'open'}

"===============================================================================
" Ultisnips
"===============================================================================

map <leader>us :UltiSnipsEdit<CR>

let g:UltiSnipsExpandTrigger="<c-k>"
let g:UltiSnipsJumpForwardTrigger="<c-k>"
let g:UltiSnipsJumpBackwardTrigger="<s-c-j>"
let g:UltiSnipsSnippetDirectories=["UltiSnips"]

"===============================================================================
" LimeLight
"===============================================================================

let g:limelight_default_coefficient = 0.7
