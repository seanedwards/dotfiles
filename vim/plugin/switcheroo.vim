" Maps <C-h/j/k/l> to switch vim splits in the given direction. If there are
" no more windows in that direction, forwards the operation to i3.

" Heavily inspired by vim-tmux-navigator https://github.com/christoomey/vim-tmux-navigator
" which served me well for years. Thanks Chris!

if exists("g:loaded_i3_navigator") || &cp || v:version < 700
  finish
endif
let g:loaded_i3_navigator = 1

let g:i3_msg_cmd = 'i3-msg'

function! s:VimNavigate(direction)
  try
    execute 'wincmd ' . a:direction
  catch
    echohl ErrorMsg | echo 'E11: Invalid in command-line window; <CR> executes, CTRL-C quits: wincmd k' | echohl None
  endtry
endfunction

if !get(g:, 'i3_navigator_no_mappings', 0)
  " The i3 binding will call xdotool to emit these keys
  nnoremap <silent> <c-h> :I3NavigateLeft<cr>
  nnoremap <silent> <c-j> :I3NavigateDown<cr>
  nnoremap <silent> <c-k> :I3NavigateUp<cr>
  nnoremap <silent> <c-l> :I3NavigateRight<cr>
endif

command! I3NavigateLeft call s:I3AwareNavigate('h')
command! I3NavigateDown call s:I3AwareNavigate('j')
command! I3NavigateUp call s:I3AwareNavigate('k')
command! I3NavigateRight call s:I3AwareNavigate('l')

if !exists("g:i3_navigator_save_on_switch")
  let g:i3_navigator_save_on_switch = 0
endif

function! s:I3Focus(direction)
  sleep 50ms " give xdotool time to send keyup before we change the window focus
  return system(g:i3_msg_cmd . ' focus ' . a:direction)
endfunction

function! s:I3AwareNavigate(direction)
  let nr = winnr()
    call s:VimNavigate(a:direction)
  if nr == winnr()
    if g:i3_navigator_save_on_switch == 1
      try
        update " save the active buffer. See :help update
      catch /^Vim\%((\a\+)\)\=:E32/ " catches the no file name error
      endtry
    elseif g:i3_navigator_save_on_switch == 2
      try
        wall " save all the buffers. See :help wall
      catch /^Vim\%((\a\+)\)\=:E141/ " catches the no file name error
      endtry
    endif

    if a:direction == 'h'
      silent call s:I3Focus('left')
    elseif a:direction == 'j'
      silent call s:I3Focus('down')
    elseif a:direction == 'k'
      silent call s:I3Focus('up')
    elseif a:direction == 'l'
      silent call s:I3Focus('right')
    endif
  endif
endfunction


