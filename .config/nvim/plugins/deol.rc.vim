" filetype = deol
" Deol mappings
nnoremap [deol] <Nop>
nmap <space>t [deol]

nnoremap <silent> [deol]<CR> :<C-u>Deol -split=floating<CR>
nnoremap <silent> [deol]v :<C-u>Deol -split=vertical<CR>

let g:deol#prompt_pattern = '% \|%$'
