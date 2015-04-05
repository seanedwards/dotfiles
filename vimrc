let g:airline_powerline_fonts = 1

let g:easytags_async = 1
let g:easytags_events = ['BufWritePost']
set tags=./.tags;
let g:easytags_dynamic_files = 2

let g:ycm_collect_identifiers_from_tags_files = 1

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsEditSplit="vertical"

let g:airline_theme="bubblegum"
let g:airline#extensions#tabline#enabled = 1

" Setup some default ignores
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.(git|hg|svn)|\_site)$',
  \ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg)$',
\}

let g:ctrlp_working_path_mode = 'r'

let s:path = $ZTVPDIR
exec "source " . s:path . '/vim/bundle/vim-pathogen/autoload/pathogen.vim'
exec pathogen#infect('bundle/{}', s:path . '/vim/bundle/{}')

set nocompatible ruler laststatus=2 showcmd showmode number 
set clipboard=unnamed

syntax on
filetype plugin indent on
let g:solarized_termtrans = 1
"colorscheme solarized

let g:tmux_navigator_save_on_switch = 1

" allow backspacing over everything in insert mode
set backspace=indent,eol,start
set nobackup    " do not keep a backup file, use versions instead
set history=50    " keep 50 lines of command line history
set incsearch
set ignorecase
set smartcase
set smartindent
set hlsearch
set expandtab
set tabstop=2
set shiftwidth=2
set autoread

nmap <leader>q :nohlsearch<CR>
nmap <leader>p :CtrlP<cr>
nmap <leader>bb :CtrlPBuffer<cr>
nmap <leader>bm :CtrlPMixed<cr>
nmap <leader>bs :CtrlPMRU<cr>

nmap <leader>s :ScreenShell<cr>
vmap <leader>s :ScreenSend<cr>

" Uncmment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif


" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

if $TERM == "xterm-256color" || $TERM == "screen-256color" || $COLORTERM == "gnome-terminal"
  set t_Co=256
endif

colors twilight256

map <F2> :NERDTreeToggle<CR>

map <leader>pbcopy "*y<CR>
map <leader>pbpaste :set paste<CR>:put *<CR>:set nopaste<CR>

" Screen settings
let g:ScreenImpl = 'Tmux'
let g:ScreenShellTmuxInitArgs = '-2'
let g:ScreenShellQuitOnVimExit = 0
command -nargs=? -complete=shellcmd W  :w | :call ScreenShellSend("load '".@%."';")

if filereadable(".vimrc-local")
  source .vimrc-local
endif

