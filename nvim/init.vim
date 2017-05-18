" My .vimrc is imspired by:
" https://raw.github.com/terryma/dotfiles/master/.vimrc

" Disable vi-compatibility
set nocompatible

" Plugin Management (vim-plug)
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif
call plug#begin('~/.config/nvim/plugged')

" Theme
Plug 'joshdick/onedark.vim'  " Color scheme

" UI
Plug 'Yggdroot/indentLine'  " Indentation Hilight
Plug 'vim-airline/vim-airline'  " Buffer Line
Plug 'vim-airline/vim-airline-themes'  " Themes for Airline

" Core IDE Features
Plug 'godlygeek/tabular'
Plug 'tpope/vim-fugitive'
Plug 'Shougo/vimproc.vim', { 'do': 'make' }  " Async Vim Processes
Plug 'Shougo/unite.vim'  " Fuzzy Search etc
Plug 'Shougo/vimfiler.vim'  " Project Draw - Depends on Unite
Plug 'editorconfig/editorconfig-vim'  " Language syntax overrides
Plug 'ervandew/supertab' " For code completion
Plug 'Valloric/YouCompleteMe', {
            \ 'do': './install.py --clang-completer --gocode-completer'
            \ } " Code completion engine
Plug 'moll/vim-bbye'  " Buffer deletion

" Snippets
Plug 'SirVer/ultisnips'

" Golang
Plug 'fatih/vim-go', { 'for': 'go' }

" Python
Plug 'klen/python-mode', { 'for': 'python' }  " Python Linting etc
Plug 'fisadev/vim-isort', { 'for': 'python' }  " Python Import Sorting

" Mark

" Misc Syntax Hilighting
" Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
" Plug 'belltoy/vim-protobuf', { 'for': 'proto' }
Plug 'cespare/vim-toml', { 'for': 'toml' } " Go
" Plug 'kylef/apiblueprint.vim', { 'for': 'apib' }
" Plug 'stephpy/vim-yaml'
" Plug 'saltstack/salt-vim', { 'for': 'sls' }
Plug 'ekalinin/Dockerfile.vim', { 'for': ['Dockerfile', 'docker-compose'] } " Dockerfile syntax
"Plug 'hashivim/vim-vagrant', { 'for': 'Vagrantfile' }
Plug 'nginx.vim'  " Nginx
" Plug 'Glench/Vim-Jinja2-Syntax', { 'for': 'jinja' }

call plug#end()

"
" Theme
"

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

"For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
"Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
" < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
if (has("termguicolors"))
  set termguicolors
endif

set background=dark
let g:onedark_termcolors=16
colorscheme onedark

"
" Global Configuration
"

" Explicitly set encoding to utf-8
set encoding=utf-8

" Set language
lang en_gb

" Lower update time: https://www.reddit.com/r/vim/comments/3ql651/what_do_you_set_your_updatetime_to/
set updatetime=100

" Give one virtual space at end of line
set virtualedit=onemore

" Syntax Hilighting & Intendation
syntax on
filetype plugin indent on
" Turn on line number
set number
"
" Column width indicator
set colorcolumn=+1

" Do not show mode
set noshowmode

" Always show the statusline
set laststatus=2

" Custom leader timeouts
set timeout timeoutlen=1000 ttimeoutlen=0

" Allow changing buffer without saving it first
set hidden

" Set to auto read when a file is changed from the outside
set autoread

" Case insensitive search
set ignorecase
set smartcase

" Make search act like search in modern browsers
set incsearch

" Hilight searched strings
set hlsearch

" Make regex a little easier to type
set magic

" Show matching brackets
set showmatch

" Conceal Level
set conceallevel=0

" Show incomplete commands
set showcmd

" Writes to the unnamed register also writes to the * and + registers. This
" makes it easy to interact with the system clipboard
if has('unnamedplus')
    set clipboard=unnamedplus
else
    set clipboard=unnamed
endif

" Solid line for vsplit separator
set fcs=vert:│

" Always splits to the right and below
set splitright
set splitbelow

" Set sensible heights for splits
set winheight=50

" Turn backup off
set nobackup
set nowritebackup
set noswapfile

" Default Tab settings
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

" Display unprintable chars
set list
set listchars=tab:▸\ ,extends:❯,precedes:❮,nbsp:␣
set showbreak=↪

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
nnoremap <Leader>x :Bdelete<CR>

" Copy current path to file
nnoremap <silent> <Leader>p :let @+=expand("%:p")<cr>:echo "Copied current file
      \ path '".expand("%:p")."' to clipboard"<cr>

" Map space to search and ctrl-space to reverse search
map <space> /
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
" Vim Airline Configuration
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
" Light Line
"

" set showtabline=2   " always show tabline
"
" let g:lightline = {
"     \ 'colorscheme': 'onedark',
"     \ 'mode_map': { 'c': 'NORMAL' },
"     \ 'tabline': {
"         \ 'left': [ [ 'bufferinfo' ], [ 'bufferbefore', 'buffercurrent', 'bufferafter' ], ],
"         \ 'right': [ [ 'close' ], ],
"     \ },
"     \ 'component_expand': {
"         \ 'buffercurrent': 'lightline#buffer#buffercurrent2',
"     \ },
"     \ 'component_type': {
"         \ 'buffercurrent': 'tabsel',
"     \ },
"     \ 'active': {
"     \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ]
"     \ },
"     \ 'component_function': {
"     \   'bufferbefore': 'lightline#buffer#bufferbefore',
"     \   'bufferafter': 'lightline#buffer#bufferafter',
"     \   'bufferinfo': 'lightline#buffer#bufferinfo',
"     \   'modified': 'LightlineModified',
"     \   'readonly': 'LightlineReadonly',
"     \   'fugitive': 'LightlineFugitive',
"     \   'filename': 'LightlineFilename',
"     \   'fileformat': 'LightlineFileformat',
"     \   'filetype': 'LightlineFiletype',
"     \   'fileencoding': 'LightlineFileencoding',
"     \   'mode': 'LightlineMode',
"     \ },
"     \ 'separator': { 'left': '', 'right': '' },
"     \ 'subseparator': { 'left': '', 'right': '' }
"     \ }
"
" " lightline-buffer settings
" let g:lightline_buffer_logo = '≣ '
" let g:lightline_buffer_readonly_icon = ''
" let g:lightline_buffer_modified_icon = '⋆'
" let g:lightline_buffer_git_icon = ' '
" let g:lightline_buffer_ellipsis_icon = '…'
" let g:lightline_buffer_expand_left_icon = ' '
" let g:lightline_buffer_expand_right_icon = ' '
" let g:lightline_buffer_active_buffer_left_icon = ''
" let g:lightline_buffer_active_buffer_right_icon = ''
" let g:lightline_buffer_separator_icon = ''
"
" let g:lightline_buffer_show_bufnr = 0
" let g:lightline_buffer_rotate = 1
" let g:lightline_buffer_fname_mod = ':t'
" let g:lightline_buffer_excludes = ['vimfiler']
"
" let g:lightline_buffer_maxflen = 30
" let g:lightline_buffer_maxfextlen = 3
" let g:lightline_buffer_minflen = 16
" let g:lightline_buffer_minfextlen = 3
" let g:lightline_buffer_reservelen = 20
"
" function! LightlineModified()
"   return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
" endfunction
"
" function! LightlineReadonly()
"   return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? '' : ''
" endfunction
"
" function! LightlineFilename()
"   return ('' != LightlineReadonly() ? LightlineReadonly() . ' ' : '') .
"         \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
"         \  &ft == 'unite' ? unite#get_status_string() :
"         \  &ft == 'vimshell' ? vimshell#get_status_string() :
"         \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
"         \ ('' != LightlineModified() ? ' ' . LightlineModified() : '')
" endfunction
"
" function! LightlineFugitive()
"   if &ft !~? 'vimfiler\|gundo' && exists("*fugitive#head")
"     let branch = fugitive#head()
"     return branch !=# '' ? ' '.branch : ''
"   endif
"   return ''
" endfunction
"
" function! LightlineFileformat()
"   return winwidth(0) > 70 ? &fileformat : ''
" endfunction
"
" function! LightlineFiletype()
"   return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
" endfunction
"
" function! LightlineFileencoding()
"   return winwidth(0) > 70 ? (&fenc !=# '' ? &fenc : &enc) : ''
" endfunction
"
" function! LightlineMode()
"   return winwidth(0) > 60 ? lightline#mode() : ''
" endfunction

"
" Indent Line
"

let g:indentLine_color_term = 8
let g:indentLine_char = '¦'

"
" Unite
"

" Use the fuzzy matcher for everything
call unite#filters#matcher_default#use(['matcher_fuzzy'])

" Use the rank sorter for everything
call unite#filters#sorter_default#use(['sorter_rank'])

" Ignores
call unite#custom_source('file_rec,file_rec/async,file_mru,file,buffer,grep',
      \ 'ignore_pattern', join([
      \ '\.git/',
      \ 'git5/.*/review/',
      \ 'tmp/',
      \ '.DS_Store',
      \ '.sass-cache',
      \ 'vendor/',
      \ 'node_modules/',
      \ 'bower_components/',
      \ 'dist/',
      \ '.git5_specs/',
      \ '.pyc',
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
function! s:unite_settings()
    imap <buffer> <C-j> <Plug>(unite_select_next_line)
    imap <buffer> <C-k> <Plug>(unite_select_previous_line)
    imap <silent><buffer><expr> <C-x> unite#do_action('split')
    imap <silent><buffer><expr> <C-v> unite#do_action('vsplit')
    imap <silent><buffer><expr> <C-t> unite#do_action('tabopen')
    nmap <buffer> <ESC> <Plug>(unite_exit)
endfunction

"
" Vim Filer
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
" YCM
"

set completeopt-=preview
let g:ycm_add_preview_to_completeopt = 0

"
" PyMode
"

let g:pymode = 1
let g:pymode_rope = 0
let g:pymode_doc = 0
let g:pymode_lint_signs = 0
let g:pymode_lint_ignore = "E702,E712,E501"
let g:pymode_breakpoint = 0
let g:pymode_folding = 0

"
" Go
"

let g:go_fmt_command = "goimports"
let g:go_highlight_types = 1
" let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
" let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1
let g:go_auto_type_info = 1

"
" Snippets
"
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsSnippetsDir="~/.config/nvim/Ultisnips"
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsListSnippets="<c-u>"

let g:indentLine_char = '┆'
