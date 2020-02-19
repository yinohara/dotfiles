" General starting point
nnoremap [general] <Nop>
nmap <space><space> [general]

" close window
nnoremap [general]q :<C-u>q<CR>
" save file
nnoremap [general]w :<C-u>w<CR>

" mapping esc to jj
inoremap <silent> jj <ESC>
" hide hlsearch
nnoremap <silent> <ESC><ESC> :<C-u>nohlsearch<CR>
" very magic
nnoremap / /\v
" terminal mode
if has('nvim')
"  tnoremap <silent> <ESC> <C-\><C-n>
  tnoremap <silent> jj <C-\><C-n>
endif

" ctag show list
nnoremap <C-]> :tab split<CR> :exec("tjump ".expand('<cword>'))<CR>

autocmd FileType help call s:help_my_settings()
function! s:help_my_settings() abort
  nnoremap <silent><buffer> q :<C-u>q<CR>
endfunction

" Change current directory command
command! -nargs=? -complete=dir -bang CD call s:ChangeCurrentDir('<args>', '<bang>')
function! s:ChangeCurrentDir(directory, bang)
  if a:directory == ''
    lcd %:p:h
  else
    execute 'lcd' . a:directory
  endif

  if a:bang == ''
    pwd
  endif
endfunction

nnoremap <silent> <Space>cd :<C-u>CD<CR>

" Insert date
nnoremap [general]dt a<C-R>=strftime("%Y-%m-%d")<CR><Esc>
