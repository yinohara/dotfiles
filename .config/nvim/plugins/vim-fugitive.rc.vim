" fugitive.vim key mapping
nnoremap [fugitive] <Nop>
nmap <space>g [fugitive]

" s Stage (add) the file or hunk under the cursor.
" u Unstage (reset) the file or hunk under the cursor.
" - Stage or unstage the file or hunk under the cursor.
" U Unstage everything.

nnoremap <silent> [fugitive]s :<C-u>Gstatus<CR>
nnoremap <silent> [fugitive]d :<C-u>Gdiff<CR>
nnoremap <silent> [fugitive]r :<C-u>Gread<CR>
nnoremap <silent> [fugitive]c :<C-u>Gcommit -v<CR>
nnoremap <silent> [fugitive]p :<C-u>Gpush<CR>
nnoremap <silent> [fugitive]b :<C-u>Gblame<CR>
nnoremap <silent> [fugitive]vd :<C-u>Gvdiffsplit!<CR>
nnoremap <silent> [fugitive]gl :<C-u>diffget //2<CR>
nnoremap <silent> [fugitive]gr :<C-u>diffget //3<CR>

" Use <C-w>q to close fugitive buffer instead of q which is deprecated
autocmd FileType fugitive call s:fugitive_my_settings()
function! s:fugitive_my_settings() abort
  nnoremap <silent><buffer> q <C-w>q
endfunction
