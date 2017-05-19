" Disable vi compatability
set nocompatible

"
" Plugins
"

" Vim Plug
call plug#begin('~/.vim/plugged')

" Theme
Plug 'joshdick/onedark.vim'

" IDE Features
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'Shougo/unite.vim'
Plug 'Shougo/vimfiler.vim'             " Project Draw
Plug 'vim-airline/vim-airline'         " Buffer Line
Plug 'vim-airline/vim-airline-themes'  " Themes for Airline

" Code Completion
Plug 'Valloric/YouCompleteMe', {
    \ 'do': './install.py --clang-completer --gocode-completer'
    \ }
Plug 'ervandew/supertab' " For code completion

" Snippets
Plug 'SirVer/ultisnips'

" Utilities
Plug 'moll/vim-bbye'

" Programming Languages
Plug 'fatih/vim-go', { 'for': 'go' } " Go

" Markup Formats
Plug 'cespare/vim-toml' " TOML

" Load Plugins
call plug#end()

"
" Theme / Colour Configuration
"
"

"For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
"Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
" < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
if (has("termguicolors"))
  set termguicolors
endif

" Background Colour
set background=dark

" Colour Scheme
let g:onedark_termcolors=16
colorscheme onedark

"
" Generic Configuration
"

" Explicitly set encoding to utf-8
set encoding=utf-8

" Add one virtual space at the end of a line
set virtualedit=onemore

" Syntac Hilighting
syntax on

" Enable indentation
filetype plugin indent on

" Enable relative line numbering
set relativenumber

" Enable line numbers
set number

" Column width indicator
set colorcolumn=+1

" Do not show mode
set noshowmode

" Always show status line
set laststatus=2

" Allow changing buffer without saving
set hidden

" Set to auto read when file is changed elsewhere
set autoread

" Show matching brackets
set showmatch

" Do not conceal
set conceallevel=0

" Show incomplete commands
set showcmd

" Turn back up off
set nobackup
set nowritebackup
set noswapfile

"
" TAB Settings
" TABS are by default set to 4 spaces
"

set expandtab
set shiftwidth=4
set tabstop=4
set softtabstop=4
set smarttab

"
" Text Display Settings
"

set linebreak
set textwidth=0
set wrapmargin=0
set autoindent
set nowrap
set whichwrap+=h,l,<,>,[,]
set list
set listchars=tab:▸\ ,extends:❯,precedes:❮,nbsp:␣
set showbreak=↪

"
" Searching
"

" case insensitive
set ignorecase

" use case if any caps used
set smartcase

" show match as search proceeds
set incsearch

" search highlighting
set hlsearch

" Easier regex
set magic

" Backspace Fix
set backspace=2

"
" Clipboard
"

" Use the system clipboard for yank / delete / paste operations
if has('unnamedplus')
    set clipboard=unnamedplus
else
    set clipboard=unnamed
endif

"
" Spits
"

" Solid line for vsplit separator
set fcs=vert:│

" Always splits to the right and below
set splitright
set splitbelow

" Set sensible heights for splits
set winheight=50

"
" tmux
"

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

"
" Key Mapping
"

" Map space to leader
map <space> \

" Buffer Cycle
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

" Write current buffer
nmap <leader>w :w<cr>

" Force write current buffer
nmap <leader>W :w<cr>

" Close current buffer
nnoremap <leader>x :Bdelete<CR>

" Copy current path to file
nnoremap <silent> <Leader>p :let @+=expand("%:p")<cr>:echo "Copied current file
      \ path '".expand("%:p")."' to clipboard"<cr>

" Map space to search and ctrl-space to reverse search
map <C-space> ?

" Window movement
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

"
" Delete Trailing White Space
"

func! DeleteTrailingWS()
    exe "normal mz"
    %s/\s\+$//ge
    exe "normal `z"
endfunc
autocmd BufWrite * :call DeleteTrailingWS()

"
" VimFiler
"

" <tab> toggles vim filer draw
nnoremap <silent> <tab> :VimFilerExplorer<cr>

let g:vimfiler_as_default_explorer = 1
let g:vimfiler_safe_mode_by_default = 0
let g:vimfiler_force_overwrite_statusline = 0
let g:vimfiler_draw_files_limit = 1000
let g:vimfiler_ignore_pattern='\%(.cache\|.coverage\|.bat\|.BAK\|.DAT\|.pyc\|.egg-info\)$\|'.
  \ '^\%(.vagrant\)$\|'.
  \ '^\%(.gitkeep\)$\|'.
  \ '^\%(.ebextensions\|.elasticbeanstalk\|Procfile\)$\|'.
  \ '^\%(.git\|.tmp\|__pycache__\|.DS_Store\|.tox\|.idea\|.ropeproject\)$'
let g:vimfiler_tree_leaf_icon = ' '
let g:vimfiler_tree_opened_icon = '▼'
let g:vimfiler_tree_closed_icon = '▷'
let g:vimfiler_file_icon = '-'
let g:vimfiler_readonly_file_icon = '✕'
let g:vimfiler_marked_file_icon = '❯'
let g:vimfiler_execute_file_list = {'jpg': 'open', 'jpeg': 'open', 'gif': 'open', 'bmp': 'open', 'html': 'open', 'ppt': 'open', 'pdf': 'open', 'png': 'open', 'ico': 'open'}

"
" Vim Airline
"

let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#tabline#buffer_nr_show = 0
let g:airline_skip_empty_sections = 0
let g:airline#extensions#tabline#fnamemod = ':.'
let g:airline#extensions#tabline#fnamecollapse = 0
let g:airline#extensions#syntastic#enabled = 0
let g:airline_detect_iminsert=0
let g:airline#extensions#tmuxline#enabled = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_tabs = 0
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#tab_nr_type = 1 " tab number
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#wordcount#enabled = 0
let g:airline_theme = 'onedark'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tagbar#enabled = 1

"
" Go
"

let g:go_fmt_command = "goimports"
let g:go_highlight_types = 1
let g:go_highlight_functions = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1
let g:go_auto_type_info = 1
