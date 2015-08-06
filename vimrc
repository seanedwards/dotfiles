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

let s:path = "~/.dotfiles"

set nocompatible
filetype off

exec "set rtp+=" . s:path . "/vim/bundle/Vundle.vim"

call vundle#begin()

Plugin 'gmarik/Vundle.vim' "                  :: Vundle, the plug-in manager for Vim                                                                                  :: http://github.com/VundleVim/Vundle.Vim

" Make vim look cool
Plugin 'bling/vim-airline' "                  :: lean & mean status/tabline for vim that's light as air                                                               :: https://github.com/bling/vim-airline
Plugin 'flazz/vim-colorschemes' "             :: one colorscheme pack to rule them all!                                                                               :: https://github.com/flazz/vim-colorschemes

" Make vim work well with tmux
Plugin 'tmux-plugins/vim-tmux' "              :: vim plugin for tmux.conf                                                                                             :: https://github.com/tmux-plugins/vim-tmux
Plugin 'tmux-plugins/vim-tmux-focus-events' " :: Make terminal vim and tmux work better together. (required for vim-gitgutter and vim-fugitive focus events)          :: https://github.com/tmux-plugins/vim-tmux-focus-events
Plugin 'christoomey/vim-tmux-navigator' "     :: Seamless navigation between tmux panes and vim splits                                                                :: https://github.com/christoomey/vim-tmux-navigator
Plugin 'edkolev/tmuxline.vim' "               :: Simple tmux statusline generator with support for powerline symbols and statusline / airline / lightline integration :: https://github.com/edkolev/tmuxline.vim

" Make vim work with git
Plugin 'airblade/vim-gitgutter' "             :: A Vim plugin which shows a git diff in the gutter (sign column) and stages/reverts hunks.                            :: https://github.com/airblade/vim-gitgutter
Plugin 'tpope/vim-fugitive' "                 :: fugitive.vim: a Git wrapper so awesome, it should be illegal                                                         :: https://github.com/tpope/vim-fugitive

" Motion/edit/navigation tools
Plugin 'scrooloose/nerdtree' "                :: A tree explorer plugin for vim.                                                                                      :: https://github.com/scrooloose/nerdtree
Plugin 'kien/ctrlp.vim' "                     :: Fuzzy file, buffer, mru, tag, etc finder.                                                                            :: http://kien.github.com/ctrlp.vim
Plugin 'Lokaltog/vim-easymotion' "            :: Vim motions on speed!                                                                                                :: https://github.com/easymotion/vim-easymotion
Plugin 'godlygeek/tabular' "                  :: Vim script for text filtering and alignment                                                                          :: https://github.com/godlygeek/tabular

" Compile/test/shell tools
Plugin 'tpope/vim-dispatch' "                 :: dispatch.vim: asynchronous build and test dispatcher                                                                 :: https://github.com/tpope/vim-dispatch
Plugin 'jpalardy/vim-slime' "                 :: A vim plugin to give you some slime. (Emacs) http://technotales.wordpress.com/2007/10/03/like-slime-for-vim/         :: https://github.com/jpalardy/vim-slime
Plugin 'thoughtbot/vim-rspec' "               :: Run Rspec specs from Vim                                                                                             :: https://github.com/thoughtbot/vim-rspec
Plugin 'xolox/vim-easytags' "                 :: Automated tag file generation and syntax highlighting of tags in Vim                                                 :: http://peterodding.com/code/vim/easytags/

" Workflow tools
Plugin 'SirVer/ultisnips' "                   :: UltiSnips - The ultimate snippet solution for Vim.                                                                   :: https://github.com/SirVer/ultisnips
Plugin 'honza/vim-snippets' "                 :: vim-snipmate default snippets (Previously snipmate-snippets)                                                         :: https://github.com/honza/vim-snippets
Plugin 'xolox/vim-notes' "                    :: Easy note taking in Vim                                                                                              :: http://peterodding.com/code/vim/notes/
Plugin 'tpope/vim-repeat' "                   :: repeat.vim: enable repeating supported plugin maps with '.'                                                          :: https://github.com/tpope/vim-repeat

" Plugin 'scrooloose/syntastic' "             :: Syntax checking hacks for vim                                                                                        :: https://github.com/scrooloose/syntastic
Plugin 'majutsushi/tagbar' "                  :: Vim plugin that displays tags in a window, ordered by scope http://majutsushi.github.com/tagbar/                     :: https://github.com/majutsushi/tagbar


" Filetype plugins
Plugin 'plasticboy/vim-markdown' "            :: Markdown Vim Mode                                                                                                    :: http://plasticboy.com/markdown-vim-mode/
Plugin 'derekwyatt/vim-scala' "               :: My work on integration of Scala into Vim - not a ton here, but useful for me. http://derekwyatt.org                  :: https://github.com/derekwyatt/vim-scala

" Other plugins
Plugin 'xolox/vim-misc' "                     :: Miscellaneous auto-load Vim scripts [for other xolox plugins]                                                        :: http://peterodding.com/code/vim/misc/

call vundle#end()
filetype plugin indent on

syntax on

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
set autowriteall
set exrc

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

" Clojure mappings
noremap <Leader>cr :Require<CR>

let g:rspec_command = "Dispatch rspec {spec}"

nnoremap u u:GitGutter<cr>
nnoremap C-r C-r:GitGutter<cr>

command! -nargs=? -complete=shellcmd Curl :r! curl -s <f-args>

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

if $TERM == "xterm-256color" || $TERM == "screen-256color" || $COLORTERM == "gnome-terminal"
  set t_Co=256
endif

colors grb256

map <F2> :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1

map <leader>pbcopy "*y<CR>
map <leader>pbpaste :set paste<CR>:put *<CR>:set nopaste<CR>

:highlight ExtraWhitespace ctermbg=red guibg=red
:autocmd Syntax * syn match ExtraWhitespace /\s\+$\| \+\ze\t/ containedin=ALL

" Screen settings
let g:slime_target = 'tmux'
let g:slime_default_config = {"socket_name": "default", "target_pane": "2"}


autocmd WinEnter * call s:CloseIfOnlyNerdTreeLeft()

" Close all open buffers on entering a window if the only
" buffer that's left is the NERDTree buffer
function! s:CloseIfOnlyNerdTreeLeft()
  if exists("t:NERDTreeBufName")
    if bufwinnr(t:NERDTreeBufName) != -1
      if winnr("$") == 1
        q
      endif
    endif
  endif
endfunction

autocmd VimEnter * NERDTree | wincmd p

