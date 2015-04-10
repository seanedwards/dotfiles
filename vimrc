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

let g:airline_theme="murmur"
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

let g:airline_solarized_bg = 'dark'
let g:solarized_termcolors = 256

" Setup some default ignores
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.(git|hg|svn)|\_site)$',
  \ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg)$',
\}
let g:ctrlp_mruf_relative = 1
let g:ctrlp_working_path_mode = 'r'
let g:ctrlp_cmd = 'CtrlPMixed'

let g:tmux_navigator_save_on_switch = 1

let g:solarized_termtrans = 0

let NERDTreeShowHidden=1

let g:EasyMotion_do_mapping = 0

let s:path = $ZTVPDIR
exec "source " . s:path . '/vim/bundle/vim-pathogen/autoload/pathogen.vim'
exec pathogen#infect('bundle/{}', s:path . '/vim/bundle/{}')

syntax on
filetype plugin indent on

" allow backspacing over everything in insert mode
set autoread
set backspace=indent,eol,start
set clipboard=unnamed
set expandtab
set history=50
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set nobackup
set nocompatible
set number
set ruler
set shiftwidth=2
set showcmd
set showmode
set smartcase
set smartindent
set tabstop=2

nnoremap <leader>sh :ScreenShell<cr>
vnoremap <leader>sh :ScreenSend<cr>

nmap <leader>bb :CtrlPBuffer<cr>
nmap <leader>bm :CtrlPMixed<cr>
nmap <leader>bs :CtrlPMRU<cr>
nmap <leader>p :CtrlP<cr>

nnoremap <leader>/ :nohlsearch<CR>
nnoremap <leader>sW BvE
nnoremap <leader>sw bve

map <leader><Up>    <Plug>(easymotion-k)
map <leader><Down>  <Plug>(easymotion-j)
map <leader><Left>  <Plug>(easymotion-linebackward)
map <leader><Right> <Plug>(easymotion-lineforward)
map <leader>w       <Plug>(easymotion-w)
map <leader>b       <Plug>(easymotion-b)
map <leader>g       <Plug>(easymotion-jumptoanywhere)

vnoremap <leader>S y:execute @@<cr>
nnoremap <leader>S ^vg_y:execute @@<cr>

nmap <leader>tm :!t mentions<cr>
nmap <leader>tt :!t timeline<cr>

cmap w!! w !sudo tee % >/dev/null
cmap ev e ~/.vimrc
cmap et e ~/.tmux.conf

noremap <leader>ga :Gwrite<cr>:GitGutter<cr>
noremap <leader>gb :Gblame<cr>
noremap <leader>gc :Gcommit<cr>:GitGutter<cr>
noremap <leader>gs :Gstatus<cr>
noremap <leader>gr :Gread<cr>
noremap <leader>gp :Gpush<cr>
noremap <leader>gd :Gdiff HEAD<cr>

" RSpec.vim mappings
noremap <Leader>rf :call RunCurrentSpecFile()<CR>
noremap <Leader>rt :call RunNearestSpec()<CR>
noremap <Leader>rl :call RunLastSpec()<CR>
noremap <Leader>ra :call RunAllSpecs()<CR>
noremap <Leader>ro :Copen<CR>
let g:rspec_command = "Dispatch rspec {spec}"

nnoremap u u:GitGutter<cr>
nnoremap C-r C-r:GitGutter<cr>

command! -nargs=? -complete=shellcmd Curl :r! curl -s <f-args>

vmap <Return> di

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

colors grb256

map <F2> :NERDTreeToggle<CR>
"autocmd VimEnter * NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

map <leader>pbcopy "*y<CR>
map <leader>pbpaste :set paste<CR>:put *<CR>:set nopaste<CR>

:highlight ExtraWhitespace ctermbg=red guibg=red
:match ExtraWhitespace /\s\+$/

" Screen settings
let g:ScreenImpl = 'Tmux'
let g:ScreenShellTmuxInitArgs = '-2'
let g:ScreenShellQuitOnVimExit = 0
command -nargs=? -complete=shellcmd W  :w | :call ScreenShellSend("load '".@%."';")

if filereadable("./.vimrc-local")
  source ./.vimrc-local
end

if expand(".") != expand("~") && filereadable("~/.vimrc-local")
  source ~/.vimrc-local
end

