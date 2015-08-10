" vimrc

set termencoding=utf-8
set encoding=utf-8

" Pathogen docs say turn filetype off before calling
filetype off
call pathogen#infect()
call pathogen#helptags()

" Space is my leader, don't assign leader to space - that causes latency
" issues
nmap <space> <leader>

" Standard vim options
set t_Co=256
set nomodeline                       " disable mode lines (security measure)
set incsearch                        " increamental search
set hlsearch                         " highlight search
set backspace=indent,eol,start       " makes backspace working
set ignorecase                       " ignore case in searching
set smartcase                        " dont ignore case if capital letters present
set scrolloff=4                      " keep cursor off screen edges
set autoread                         " automatically reload files changed outside of Vim
set softtabstop=4
set shiftwidth=4
set smarttab
set expandtab
set cindent
set autoindent
set ttyfast
set lazyredraw
set gdefault                         " search/replace globally (on a line) by default
set splitright                       " Open split on right, not left
set splitbelow                       " Open split below, not above
set wildmenu
set wildmode=longest:full,list:full
set omnifunc=syntaxcomplete#Complete
set completeopt=longest,menuone
set noshowmode                       " Airline shows mode, so hide default mode
set nobackup                         " Don't need backup and swap files
set noswapfile
set pumheight=10                     " Completion menu height
set nofoldenable                     " disable folding
set nu                               " Line numbers
autocmd CursorHold * checktime       " checktime triggers auto reload when cursor is pressed
filetype plugin on                   " filetype plugins for file specific settings
filetype indent on                   " filetype specific indentation
syntax enable                        " Pretty syntax highlighing
set laststatus=2                     " Always show statusline     
" set cursorline                     " Show a horizontal line on cursor

" Tab to switch between vertical splits
nnoremap <tab> <C-w><C-w>

" Ctrl-s to save a file, in both normal and insert mode
:nmap <c-s> :w<CR>
:imap <c-s> <Esc>:w<CR>a

" If can't find extention of a file, assume it's a C file
autocmd BufNewFile,BufRead * if expand('%:t') !~ '\.' | set syntax=c | endif

" Clear highlighted searches
nmap <silent> ,/ :nohlsearch<CR>

" Easier to get command prompt
map ; :
imap jj <Esc>

" Source vimrc
nmap <Leader>v :source $MYVIMRC<CR>

" Remember cursor position between vim sessions
if has("autocmd")
    autocmd BufReadPost *
                \ if line("'\"") > 0 && line ("'\"") <= line("$") |
                \   exe "normal! g'\"" |
                \ endif
endif

" Buffer selection and movement
nnoremap   <leader>,   :bprevious<CR>
nnoremap   <leader>.   :bnext<CR>
inoremap   <leader>,   <Esc>:bprevious<CR>i
inoremap   <leader>.   <Esc>:bnext<CR>i
nnoremap   <leader>q   :bd<CR>

"===================== CTAGS/CSCOPE ==========================
set tags=./tags;/   " ctags path, search upwards till tags file is found
set cscopetag       " Use both cscope and ctags as database

" Find instances of a symbol from command line
nnoremap " :vert scscope find s<space>
nnoremap <leader>d :cs find g <C-R>=expand("<cword>")<CR><CR>   " Find definition of this symbol
nnoremap <leader>c :cs find c <C-R>=expand("<cword>")<CR><CR>   " Find calls to this symbol
nnoremap <leader>s :cs find s <C-R>=expand("<cword>")<CR><CR>   " Find all instances of this symbol
nnoremap <leader>t <c-t>

"========================== VIM-AIRLINE ==========================
" Enable the list of buffers
let g:airline#extensions#tabline#enabled                      = 1
let g:airline#extensions#tabline#buffer_min_count             = 2
let g:airline#extensions#tabline#tab_min_count                = 2
let g:airline#extensions#tabline#buffer_idx_mode              = 1
let g:airline#extensions#tabline#buffer_nr_show               = 0
let g:airline#extensions#tabline#show_buffers                 = 1
let g:airline_powerline_fonts                                 = 1
" don't count trailing whitespace since it lags in huge files
let g:airline#extensions#whitespace#enabled                   = 0
let g:airline_theme                                           = 'PaperColor'
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9

"========================= SUPERTAB ===============================
let   g:SuperTabDefaultCompletionType          =   "context"
let   g:SuperTabContextDefaultCompletionType   =   "<c-n>"

" ======================= NERDCommenter ===========================
" Ctrl-C to comment a block/line of code
nmap <C-c> :call NERDComment(0,"sexy")<CR>
vmap <C-c> :call NERDComment(0,"sexy")<CR>

" Ctrl-X to uncomment a block/line of code
nmap <C-x> :call NERDComment(0,"uncomment")<CR>
vmap <C-x> :call NERDComment(0,"uncomment")<CR>

"========================== FZF ===================================
nnoremap <leader>f :FZF! -x<CR>
cnoreabbrev FZF FZF!

" Change cursor shape based on mode.
" https://gist.github.com/andyfowler/1195581
set gcr=a:blinkon0
if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

"=========================== DIFF ===============================
func DiffSettings()
    nmap q :qa<CR>
endfun

if &diff
    autocmd VimEnter * call DiffSettings()
endif

"=========================== COLORSCHEME ========================
set bg=dark
colorscheme myown
autocmd BufEnter *.py colorscheme Tomorrow-Night-Eighties

"======================== PROMPTLINE =============================
let g:promptline_preset = {
        \'a'    : [ promptline#slices#host({'only_if_ssh' : 1}) ],
        \'b'    : [ promptline#slices#cwd() ],
        \'c'    : [ promptline#slices#vcs_branch() ],
        \'y'    : [ promptline#slices#git_status() ],
        \'warn' : [ promptline#slices#last_exit_code() ]}
