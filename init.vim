" ============= Vim-Plug ============== "{{{


" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin(expand('~/.config/nvim/plugged'))

"}}}

" ================= looks and GUI stuff ================== "{{{

"Plug 'vim-airline/vim-airline'                          " airline status bar
"Plug 'ryanoasis/vim-devicons'                           " pretty icons everywhere
"Plug 'luochen1990/rainbow'                              " rainbow parenthesis
"Plug 'hzchirs/vim-material'                             " material color themes
Plug 'junegunn/goyo.vim'
Plug 'gregsexton/MatchTag'                              " highlight matching html tags
Plug 'ewilazarus/preto'
Plug 'andreasvc/vim-256noir'                                 " colorscheme
Plug 'sainnhe/everforest'
Plug 'plan9-for-vimspace/acme-colors'
Plug 'LuRsT/austere.vim'
Plug 'aditya-azad/candle-grey'
Plug 'davidosomething/vim-colors-meh'
Plug 'pbrisbin/vim-colors-off'
Plug 'andreypopp/vim-colors-plain'
Plug 'owickstrom/vim-colors-paramount'
Plug 'Jorengarenar/vim-darkness'
Plug 'KKPMW/distilled-vim'
Plug 'jaredgorski/fogbell.vim'
Plug 'zekzekus/menguless'
Plug 'fxn/vim-monochrome'
Plug 'Lokaltog/vim-monotone'
Plug 'robertmeta/nofrils'
Plug 'axvr/photon.vim'
Plug 'nikolvs/vim-sunbather'
Plug 'hardselius/warlock'
Plug 'pgdouyon/vim-yin-yang'
Plug 'danishprakash/vim-yami'
Plug 'cideM/yui'
Plug 'zaki/zazen'
Plug 'pradyungn/Mountain'
Plug 'ThePrimeagen/vim-be-good'
Plug 'dracula/vim', { 'as': 'dracula' }

"Plug 'Jorengarenar/vim-MvVis'                           " move visual selection
"}}}

" ================= Functionalities ================= "{{{

Plug 'nvim-treesitter/nvim-treesitter'
Plug 'neoclide/coc.nvim', {'branch': 'release'}         " LSP and more
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }     " fzf itself
Plug 'junegunn/fzf.vim'                                 " fuzzy search integration
Plug 'honza/vim-snippets'                               " actual snippets
Plug 'OmniSharp/omnisharp-vim'
Plug 'Yggdroot/indentLine'                              " show indentation lines
"Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}  " better python
Plug 'tpope/vim-commentary'                             " better commenting
Plug 'tpope/vim-fugitive'                               " git support
Plug 'tpope/vim-eunuch'                                 " run common Unix commands inside Vim
"Plug 'machakann/vim-sandwich'                           " make sandwiches
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
"Plug 'TovarishFin/vim-solidity'
call plug#end()

"}}}

" ==================== general config ======================== "{{{

set termguicolors                                       " Opaque Background
set background=dark
set mouse=a                                             " enable mouse scrolling
"set clipboard+=unnamedplus                              " use system clipboard by default
set tabstop=4 softtabstop=4 shiftwidth=4 autoindent     " tab width
set expandtab smarttab                                  " tab key actions
set incsearch ignorecase smartcase hlsearch             " highlight text while searching
set list listchars=trail:??,tab:??-                       " use tab to navigate in list mode
set fillchars+=vert:\???                                  " requires a patched nerd font (try FiraCode)
set nowrap                                    " wrap long lines to the width set by tw
set encoding=utf-8                                      " text encoding
set number                                              " enable numbers on the left
set relativenumber                                      " current line is 0
set title                                               " tab title as file name
set noshowmode                                          " dont show current mode below statusline
set noshowcmd                                           " to get rid of display of last command
set conceallevel=2                                      " set this so we wont break indentation plugin
set splitright                                          " open vertical split to the right
set splitbelow                                          " open horizontal split to the bottom
set history=5000                                        " history limit
set backspace=indent,eol,start                          " sensible backspacing
set undofile                                            " enable persistent undo
set undodir=/tmp                                        " undo temp file directory
set foldlevel=0                                         " open all folds by default
set inccommand=nosplit                                  " visual feedback while substituting
set showtabline=1                                       " always show tabline
set grepprg=rg\ --vimgrep                               " use rg as default grepper
set noswapfile

" performance tweaks
set nocursorline
set nocursorcolumn
set scrolloff=8
set lazyredraw
set redrawtime=10000
set synmaxcol=180
set re=1

" required by coc
set hidden
set nobackup
set nowritebackup
set cmdheight=1
set updatetime=300
set shortmess+=c
set signcolumn=yes

" Themeing
"let g:material_style = ''
colorscheme 256_noir
"hi Pmenu guibg='#00010a' guifg=white                    " popup menu colors
"hi Comment gui=italic cterm=italic                      " italic comments
"hi Comment ctermfg=8 guifg=#585858
hi Search guibg=#f9690e guifg=black gui=NONE          " search string highlight color
"hi Normal guibg=NONE guifg=NONE
hi NonText guifg=bg                                     " mask ~ on empty lines
hi clear SignColumn                                     " (gutter / left margin) to background color
hi clear CursorLineNr                                   " use the theme color for relative number
"hi CursorLineNr gui=bold                                " make relative number bold
"hi SpellBad guifg=NONE gui=bold,undercurl               " misspelled words

" colors for git (especially the gutter)
hi DiffAdd  guibg=#0f111a guifg=#43a047
hi DiffChange guibg=#0f111a guifg=#fdd835
hi DiffRemoved guibg=#0f111a guifg=#e53935

" coc multi cursor highlight color
hi CocCursorRange guibg=#b16286 guifg=#ebdbb2

"}}}

" ======================== Plugin Configurations ======================== "{{{

"" built in plugins
"let loaded_netrw = 0                                    " diable netew
let g:omni_sql_no_default_maps = 1                      " disable sql omni completion
let g:loaded_python_provider = 0
let g:loaded_perl_provider = 0
let g:loaded_ruby_provider = 0
let g:python3_host_prog = expand('/usr/bin/python3')
let g:OmniSharp_server_use_mono = 1 " use installed mono instead of embedded mono from roslyn server
" Airline
"let g:airline_theme='material'
"let g:airline_skip_empty_sections = 1
"let g:airline_section_warning = ''
"let g:airline_section_x=''
"let g:airline_section_z = airline#section#create(['%3p%% ', 'linenr', ':%c'])
"let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'
"let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#buffer_min_count = 2   " show tabline only if there is more than 1 buffer
"let g:airline#extensions#tabline#fnamemod = ':t'        " show only file name on tabs
"let airline#extensions#coc#error_symbol = '???:'
"let airline#extensions#coc#warning_symbol = '???:'
"if !exists('g:airline_symbols')
"  let g:airline_symbols = {}
"endif
"let g:airline_symbols.linenr = ''
"let g:airline_symbols.branch = '??? '
"let g:airline_symbols.dirty= ''

"" coc

" Navigate snippet placeholders using tab
let g:coc_snippet_next = '<Tab>'
let g:coc_snippet_prev = '<S-Tab>'

" list of the extensions to make sure are always installed
let g:coc_global_extensions = [
            \'coc-yank',
            \'coc-omnisharp',
            \'coc-pairs',
            \'coc-json',
            \'coc-css',
            \'coc-html',
            \'coc-tsserver',
            \'coc-phpls',
            \'coc-pyright',
            \'coc-yaml',
            \'coc-sh',
            \'coc-sql',
            \'coc-lists',
            \'coc-snippets',
            \'coc-pyright',
            \'coc-clangd',
            \'coc-eslint',
            \'coc-prettier',
            \'coc-xml',
            \'coc-syntax',
            \'coc-git',
            \'coc-marketplace',
            \'coc-highlight',
            \]

" indentLine
"let g:indentLine_char_list = ['???', '??', '???', '???']
"let g:indentLine_setColors = 0
let g:indentLine_setConceal = 0                         " actually fix the annoying markdown links conversion

" rainbow brackets
"let g:rainbow_active = 1

" semshi settings
"let g:semshi#error_sign	= v:false                       " let ms python lsp handle this

"" FZF
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

let g:fzf_layout = {'up':'~90%', 'window': { 'width': 0.8, 'height': 0.8,'yoffset':0.5,'xoffset': 0.5, 'border': 'sharp' } }
let g:fzf_tags_command = 'ctags -R'

let $FZF_DEFAULT_OPTS = '--layout=reverse --inline-info'
let $FZF_DEFAULT_COMMAND = "rg --files --hidden --glob '!.git/**' --glob '!build/**' --glob '!.dart_tool/**' --glob '!.idea' --glob '!node_modules'"

"}}}

" ======================== Commands ============================= "{{{

au BufEnter * set fo-=c fo-=r fo-=o                     " stop annoying auto commenting on new lines
au FileType help wincmd L                               " open help in vertical split
au BufWritePre * :%s/\s\+$//e                           " remove trailing whitespaces before saving
au CursorHold * silent call CocActionAsync('highlight') " highlight match on cursor hold

" enable spell only if file type is normal text
let spellable = ['markdown', 'gitcommit', 'txt', 'text', 'liquid', 'rst']
autocmd BufEnter * if index(spellable, &ft) < 0 | set nospell | else | set spell | endif

" coc completion popup
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

" fzf if passed argument is a folder
augroup folderarg
    " change working directory to passed directory
    autocmd VimEnter * if argc() != 0 && isdirectory(argv()[0]) | execute 'cd' fnameescape(argv()[0])  | endif

    " start fzf on passed directory
    autocmd VimEnter * if argc() != 0 && isdirectory(argv()[0]) | execute 'Files ' fnameescape(argv()[0]) | endif
augroup END

" Return to last edit position when opening files
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

" python renaming
"autocmd FileType python nnoremap <leader>rn :Semshi rename <CR>

" format with available file format formatter
command! -nargs=0 Format :call CocAction('format')

" organize imports
command! -nargs=0 OR :call CocAction('runCommand', 'editor.action.organizeImport')

" files in fzf
command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--inline-info']}), <bang>0)

" advanced grep
command! -nargs=* -bang Rg call RipgrepFzf(<q-args>, <bang>0)

"}}}

" ================== Custom Functions ===================== "{{{

" advanced grep(faster with preview)
function! RipgrepFzf(query, fullscreen)
    let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case %s || true'
    let initial_command = printf(command_fmt, shellescape(a:query))
    let reload_command = printf(command_fmt, '{q}')
    let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
    call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

" check if last inserted char is a backspace (used by coc pmenu)
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" show docs on things with K
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

"}}}

" ======================== Custom Mappings ====================== "{{{

"" the essentials
let mapleader=" "
" nnoremap ; :
nmap \ <leader>q
nmap <leader>r :so ~/.config/nvim/init.vim<CR>
nmap <leader>bq :bd<CR>
nmap <leader>w :w<CR>
map <leader>s :Format<CR>
map <leader>tg :Goyo<CR>:<backspace>
nmap <Tab> :bnext<CR>
nmap <S-Tab> :bprevious<CR>
tnoremap <leader><Esc> <C-\><C-n>
tmap <leader><Esc> <C-\><C-n>

" new line in normal mode and back
map <Enter> o<ESC>
map <S-Enter> O<ESC>

" switch between splits using ctrl + {h,j,k,l}
inoremap <C-h> <C-\><C-N><C-w>h
inoremap <C-j> <C-\><C-N><C-w>j
inoremap <C-k> <C-\><C-N><C-w>k
inoremap <C-l> <C-\><C-N><C-w>l
nnoremap <C-h> <C-w>h
noremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" disable hl with 2 esc
noremap <silent><esc> <esc>:noh<CR><esc>

" trim white spaces
nnoremap <F2> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

" markdown preview
au FileType markdown nmap <leader>m :MarkdownPreview<CR>

"" FZF
nnoremap <silent> <leader>f :Files<CR>
nmap <leader>b :Buffers<CR>
nmap <leader>c :Commands<CR>
nmap <leader>t :BTags<CR>
nmap <leader>/ :Rg<CR>
nmap <leader>gc :Commits<CR>
nmap <leader>gs :GFiles?<CR>
nmap <leader>sh :History/<CR>

" show mapping on all modes with F1
nmap <F1> <plug>(fzf-maps-n)
imap <F1> <plug>(fzf-maps-i)
vmap <F1> <plug>(fzf-maps-x)

"" coc

" use tab to navigate snippet placeholders
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Use enter to accept snippet expansion
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<CR>"

" multi cursor shortcuts
nmap <silent> <C-a> <Plug>(coc-cursors-word)
xmap <silent> <C-a> <Plug>(coc-cursors-range)

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" other stuff
nmap <leader>rn <Plug>(coc-rename)
nmap <leader>o :OR <CR>

" jump stuff
nmap <leader>jd <Plug>(coc-definition)
nmap <leader>jy <Plug>(coc-type-definition)
nmap <leader>ji <Plug>(coc-implementation)
nmap <leader>jr <Plug>(coc-references)

" other coc actions
nnoremap <silent> K :call <SID>show_documentation()<CR>
nmap <leader>a <Plug>(coc-codeaction-line)
xmap <leader>a <Plug>(coc-codeaction-selected)

" fugitive mappings
nmap <leader>gd :Gdiffsplit<CR>
nmap <leader>gb :Git blame<CR>

"}}}
