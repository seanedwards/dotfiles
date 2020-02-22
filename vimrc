let g:airline_powerline_fonts = 1

let g:airline#extensions#tabline#enabled = 1
let g:tmuxline_preset = {
  \ 'a': '#S',
  \ 'b': '#F',
  \ 'c': '#W',
  \ 'win': ['#I', '#W'],
  \ 'cwin': ['#I', '#W'],
  \ 'x': ['#{battery_icon} #{battery_percentage}'],
  \ 'y': ['%a', '%b %d', '%R'],
  \ 'z': '#H' }

let g:solarized_termtrans = 0

let g:vim_markdown_folding_disabled=1
let g:vim_markdown_frontmatter=1

let g:ycm_key_list_select_completion=[]
let g:ycm_key_list_previous_completion=[]

let g:todo_check_char = 'x'

set nocompatible
filetype off

call plug#begin('~/.vim/bundle')
  Plug 'neoclide/coc.nvim', {'branch': 'release'} " :: CoC, the intellisense plugin for vim

  " Make vim look cool
  "Plug 'bling/vim-airline' "                  :: lean & mean status/tabline for vim that's light as air                                                               :: https://github.com/bling/vim-airline
  "Plug 'vim-airline/vim-airline-themes' "                  :: lean & mean status/tabline for vim that's light as air                                                               :: https://github.com/bling/vim-airline
  "Plug 'flazz/vim-colorschemes' "             :: one colorscheme pack to rule them all!                                                                               :: https://github.com/flazz/vim-colorschemes
  Plug 'altercation/vim-colors-solarized'

  " Make vim work well with tmux
  "Plug 'edkolev/tmuxline.vim' "               :: Simple tmux statusline generator with support for powerline symbols and statusline / airline / lightline integration :: https://github.com/edkolev/tmuxline.vim

  " Make vim work with git
  Plug 'airblade/vim-gitgutter' "             :: A Vim plugin which shows a git diff in the gutter (sign column) and stages/reverts hunks.                            :: https://github.com/airblade/vim-gitgutter
  Plug 'tpope/vim-fugitive' "                 :: fugitive.vim: a Git wrapper so awesome, it should be illegal                                                         :: https://github.com/tpope/vim-fugitive

  " Motion/edit/navigation tools
  Plug 'scrooloose/nerdtree'
  Plug 'Xuyuanp/nerdtree-git-plugin'
  Plug 'kien/ctrlp.vim'
  Plug 'Lokaltog/vim-easymotion'
  Plug 'godlygeek/tabular'
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-sensible'

  " Compile/test/shell tools
  Plug 'tpope/vim-dispatch'

  " Workflow tools
  Plug 'SirVer/ultisnips'
  Plug 'honza/vim-snippets' "                 :: vim-snipmate default snippets (Previously snipmate-snippets)                                                         :: https://github.com/honza/vim-snippets
  Plug 'mattn/gist-vim' "                     :: vimscript for gist                                                                                                   :: https://github.com/mattn/gist-vim

  " Filetype plugins
  Plug 'plasticboy/vim-markdown', {'for': 'markdown'}
  Plug 'elixir-editors/vim-elixir', {'for': 'elixir'}
  Plug 'mboughaba/i3config.vim', {'for': 'i3config'}
  Plug 'JakeBecker/elixir-ls', {'for': 'elixir', 'do': 'mix deps.get && mix compile && mix elixir_ls.release -o ./rel'}

  " Other plugins
  Plug 'xolox/vim-misc'
  "Plug 'mattn/webapi-vim'
  "Plug 'michaeljsmith/vim-indent-object'
  Plug 'tpope/vim-rsi'
  Plug 'udalov/kotlin-vim', {'for': 'kotlin'}
  Plug 'ntenczar/todo.vim'

call plug#end()

filetype plugin indent on

" allow backspacing over everything in insert mode
set autoread
set clipboard=unnamed
set expandtab
set hlsearch
set ignorecase
set laststatus=2
set nobackup
set nocompatible
set number
set shiftwidth=2
set tabstop=2
set showcmd
set showmode
set smartcase
set smartindent
set autowriteall
set exrc
set nofoldenable
set noswapfile

function! NumberToggle()
  if(&relativenumber == 1)
    set nornu
  else
    set relativenumber
  endif
endfunc

nnoremap <C-n> :call NumberToggle()<cr>

nnoremap <leader>/ :nohlsearch<CR>
nnoremap <leader>sW BvE
nnoremap <leader>sw bve

vnoremap <leader>S y:execute @@<cr>
nnoremap <leader>S ^vg_y:execute @@<cr>

cmap w!! w !sudo tee % >/dev/null

imap <C-i> <Esc>
imap <C-a> <Esc>

nnoremap <M-h> <Home>

let g:rspec_command = "Dispatch rspec {spec}"

command! -nargs=? -complete=shellcmd Curl :r! curl -s <f-args>
command! -nargs=1 Pwgen :r! pwgen <f-args> 1

vmap <Return> di

autocmd QuickFixCmdPost *grep* cwindow

" Uncmment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif


" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

map <F3> :TagbarToggle<CR>
autocmd StdinReadPre * let s:std_in=1

:highlight ExtraWhitespace ctermbg=red guibg=red
:autocmd Syntax * syn match ExtraWhitespace /\s\+$\| \+\ze\t/ containedin=ALL

" Screen settings
let g:slime_target = 'tmux'
let g:slime_default_config = {"socket_name": "default", "target_pane": "2"}

