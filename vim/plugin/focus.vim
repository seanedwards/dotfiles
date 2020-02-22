autocmd BufEnter,FocusGained,BufWrite * GitGutter
autocmd FocusGained,BufEnter * checktime

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

" restore to last file location
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

let g:i3_navigator_save_on_switch = 2

