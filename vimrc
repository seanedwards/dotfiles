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

set incsearch ignorecase smartcase hlsearch
:nmap \q :nohlsearch<CR>

" Uncmment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

set smartindent
set expandtab tabstop=2 shiftwidth=2
:nmap \t :set expandtab tabstop=4 shiftwidth=4 softtabstop=4<CR>
:nmap \T :set expandtab tabstop=8 shiftwidth=8 softtabstop=4<CR>
:nmap \M :set noexpandtab tabstop=8 softtabstop=4 shiftwidth=4<CR>
:nmap \m :set expandtab tabstop=2 shiftwidth=2 softtabstop=2<CR>

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
map <F5> :ScreenShell<CR>
command -nargs=? -complete=shellcmd W  :w | :call ScreenShellSend("load '".@%."';")

if filereadable(".vimrc-local")
  source .vimrc-local
endif

