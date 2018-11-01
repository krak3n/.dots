" Disable vi compatability
set nocompatible

"
" Plugins
"

" Vim Plug
call plug#begin('~/.vim/plugged')

" Theme
Plug 'joshdick/onedark.vim'

" Fuzzy Finder
Plug 'Shougo/denite.nvim'

" Code Completion
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

" Buffer removal
Plug 'qpkorr/vim-bufkill'

" Airline
Plug 'vim-airline/vim-airline'

" Nerd Tree
Plug 'scrooloose/nerdtree'

" Surround
Plug 'tpope/vim-surround'

" Auto brakets
Plug 'jiangmiao/auto-pairs'

" Indentation Guides
Plug 'Yggdroot/indentLine'

" Snippers
Plug 'SirVer/ultisnips'

" Editor Config
Plug 'sgur/vim-editorconfig'

" Dev Icons
Plug 'ryanoasis/vim-devicons'

" Linting
Plug 'w0rp/ale'

" Go
Plug 'fatih/vim-go', { 'for': 'go' }
Plug 'zchee/deoplete-go', { 'do': 'make', 'for': 'go' }

" Rust
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
Plug 'sebastianmarkow/deoplete-rust', { 'for': 'rust' }

" Python
Plug 'klen/python-mode', { 'for': 'python' }
Plug 'zchee/deoplete-jedi', { 'for': 'python' }

" HTML
Plug 'mattn/emmet-vim', { 'for': 'html' }

" Toml
Plug 'cespare/vim-toml', { 'for': 'toml' }

" JSON
Plug 'elzr/vim-json', { 'for': 'json' }

" QML
Plug 'peterhoeg/vim-qml', { 'for': 'qml' }

" Mustache
Plug 'mustache/vim-mustache-handlebars', { 'for': 'mustache' }

" Nginx
Plug 'chr4/nginx.vim'

" Load Plugins
call plug#end()

"
" Theme
"

set background=light
if (has("termguicolors"))
  set termguicolors
endif

let g:onedark_termcolors=16
let g:onedark_terminal_italics=1

colorscheme onedark

"
" General
"

set encoding=utf-8           " Explicitly set encoding to utf-8
set mouse=nv                 " Disable mouse in command-line mode
set modeline                 " automatically setting options from modelines
set report=0                 " Don't report on line changes
" set errorbells               " Trigger bell on error
set visualbell               " Use visual bell instead of beeping
set t_vb=
set hidden                   " hide buffers when abandoned instead of unload
set fileformats=unix,dos,mac " Use Unix as the standard file type
set magic                    " For regular expressions turn magic on
set path=.,**                " Directories to search when using gf
set virtualedit=block        " Position cursor anywhere in visual block
set synmaxcol=1000           " Don't syntax highlight long lines
set formatoptions+=1         " Don't break lines after a one-letter word
set formatoptions-=t         " Don't auto-wrap text
set directory=/dev/shm       " Write swap files to memory, not disk
set conceallevel=0           " Disabled autohide in vim-json

"
" Tabs and Indents
"

set textwidth=80    " Text width maximum chars before wrapping
set noexpandtab     " Don't expand tabs to spaces.
set tabstop=4       " The number of spaces a tab is
set softtabstop=4   " While performing editing operations
set shiftwidth=4    " Number of spaces to use in auto(indent)
set smarttab        " Tab insert blanks according to 'shiftwidth'
set autoindent      " Use same indenting on new lines
set smartindent     " Smart autoindenting on new lines
set shiftround      " Round indent to multiple of 'shiftwidth'

"
" Searching
"

set ignorecase      " Search ignoring case
set smartcase       " Keep case when searching with *
set infercase       " Adjust case in insert completion mode
set incsearch       " Incremental search
set hlsearch        " Highlight search results
set wrapscan        " Searches wrap around the end of the file
set showmatch       " Jump to matching bracket
set matchpairs+=<:> " Add HTML brackets to pair matching
set matchtime=1     " Tenths of a second to show the matching paren
set cpoptions-=m    " showmatch will wait 0.5s or until a char is typed

"
" Behavior
"

set nowrap                      " No wrap by default
set linebreak                   " Break long lines at 'breakat'
set breakat=\ \	;:,!?           " Long lines break chars
set nostartofline               " Cursor in same column for few commands
set whichwrap+=h,l,<,>,[,],~    " Move to following line on certain keys
set splitbelow splitright       " Splits open bottom right
set switchbuf=useopen,usetab    " Jump to the first open window in any tab
set switchbuf+=vsplit           " Switch buffer behavior to vsplit
set backspace=indent,eol,start  " Intuitive backspacing in insert mode
set diffopt=filler,iwhite       " Diff mode: show fillers, ignore white
set showfulltag                 " Show tag and tidy search in completion
set complete=.                  " No wins, buffs, tags, include scanning
set completeopt=menuone         " Show menu even for one item
set completeopt+=noselect       " Do not select a match in the menu

"
" Editor UI Appearance
"

set noshowmode          " Don't show mode in cmd window
set shortmess=aoOTI     " Shorten messages and don't show intro
set scrolloff=2         " Keep at least 2 lines above/below
set sidescrolloff=5     " Keep at least 5 lines left/right
set number              " Show line numbers
set relativenumber      " Relative line numbers
set noruler             " Disable default status ruler
set list                " Show hidden characters

set showtabline=2       " Always show the tabs line
set winwidth=30         " Minimum width for active window
set winheight=1         " Minimum height for active window
set pumheight=15        " Pop-up menu's line height
set helpheight=12       " Minimum help window height
set previewheight=12    " Completion preview height

set noshowcmd           " Don't show command in status line
set cmdheight=2         " Height of the command line
set cmdwinheight=5      " Command-line lines
set noequalalways       " Don't resize windows on split or close
set laststatus=2        " Always show a status line
set colorcolumn=80      " Highlight the 80th character limit
set display=lastline

"
" UI elements
"

set showbreak=↪\
set listchars=tab:¦\ ,eol:↲,nbsp:␣,trail:•,extends:⟩,precedes:⟨

"
" Syntax
"

syntax on
filetype plugin indent on

"
" Key Bindings
"

" Disable arrow keys
noremap  <Up> ""
noremap! <Up> <Esc>
noremap  <Down> ""
noremap! <Down> <Esc>
noremap  <Left> ""
noremap! <Left> <Esc>
noremap  <Right> ""
noremap! <Right> <Esc>

" Buffer Cycle
map <leader>[ :bprevious<cr>
map <leader>] :bnext<cr>
"
" Window movement
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Close current buffer
nnoremap <leader>x :BW<CR>

" Toggle spellchecking
function! ToggleSpellCheck()
  set spell! spelllang=en_gb
  if &spell
    echo "Spellcheck ON"
  else
    echo "Spellcheck OFF"
  endif
endfunction

nnoremap <F6> :call ToggleSpellCheck()<CR>

"
" System Clipboard
"

" Use the system clipboard for yank / delete / paste operations
if has('unnamedplus')
    set clipboard=unnamedplus
else
    set clipboard=unnamed
endif

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
" Denite
"

call denite#custom#option('default', {
      \ 'prompt': '❯'
      \ })
call denite#custom#var('file_rec', 'command',
      \ ['rg', '--files', '--glob', '!.git'])

nnoremap <C-p> :<C-u>Denite file_rec<CR>

"
" Ale
"

let g:ale_sign_error = '⤫'
let g:ale_sign_warning = '⚠'

"
" Deoplete
"

let g:deoplete#enable_at_startup = 1
inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : <SID>check_back_space() ? "\<TAB>" : deoplete#mappings#manual_complete()
inoremap <silent><expr> <S-TAB> pumvisible() ? "\<C-p>" : <SID>check_back_space() ? "\<S-TAB>" : deoplete#mappings#manual_complete()
function! s:check_back_space() abort "{{{
let col = col('.') - 1
return !col || getline('.')[col - 1]  =~ '\s'
endfunction"}}}

"
" Ultisnips
"

let g:UltiSnipsSnippetsDir="~/.ultisnips"
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

"
" Airline
"

let g:airline_skip_empty_sections = 0
let g:airline#extensions#syntastic#enabled = 0
let g:airline_detect_iminsert=0
let g:airline#extensions#tmuxline#enabled = 0
let g:airline#extensions#wordcount#enabled = 0
let g:airline_theme = 'onedark'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tagbar#enabled = 1
" Enable tab line
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_tabs = 0
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#tab_nr_type = 1 " tab number
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#show_close_button = 1
let g:airline#extensions#tabline#buffer_nr_show = 0
let g:airline#extensions#tabline#fnamemod = ':.'
let g:airline#extensions#tabline#fnamecollapse = 0
" Linting using ale
let g:airline#extensions#ale#enabled = 1

"
" NERDTree
"

map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeAutoDeleteBuffer = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeDirArrows = 1
let g:NERDTreeCascadeSingleChildDir = 0
let g:NERDTreeDirArrowExpandable = ''
let g:NERDTreeDirArrowCollapsible = ''

let g:NERDTreeNaturalSort = 0
let g:NERDTreeSortHiddenFirst = 1
let g:NERDTreeCaseSensitiveSort = 1
let g:NERDTreeShowHidden = 1

"
" Indentation Guides
"

let g:indentLine_enabled = 1
let g:indentLine_color_term = 8
let g:indentLine_char = '¦'

"
" Editor Config
"

let g:editorconfig_verbose = 1

"
" Dev Icons
"

let g:WebDevIconsUnicodeDecorateFolderNodesDefaultSymbol = ""

"
" Go
"

let g:go_fmt_command = "goimports"
let g:go_highlight_types = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_variable_declarations = 1
let g:go_auto_type_info = 1
let g:go_term_enabled = 1
let g:go_gocode_unimported_packages = 1
map <leader>gi :GoInstall<cr>
map <leader>gb :GoBuild -i<cr>
map <leader>gr :GoRun<cr>

"
" Rust
"

let g:rustfmt_autosave = 1
let g:rust_clip_command = 'xclip -selection clipboard'
let g:ycm_rust_src_path = '/usr/src/rust/src'


"
" JSON
"

let g:vim_json_syntax_conceal = 0
