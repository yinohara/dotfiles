" Neoterm mappings
nnoremap [neoterm] <Nop>
nmap <space>t [neoterm]

nnoremap <silent> [neoterm]t :<C-u>Ttoggle<CR>
nnoremap <silent> [neoterm]g :<C-u>T go run %<CR>

let g:neoterm_size = 20
let g:neoterm_default_mod = 'rightbelow'
let g:neoterm_autoinsert = 1
let g:neoterm_autoscroll = 1