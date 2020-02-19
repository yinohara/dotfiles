let g:airline#extensions#default#layout = [
      \ ['a', 'b', 'c'],
      \ ['x', 'y', 'z', 'error', 'warning']
      \ ]

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#branch#enabled = 1

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.maxlinenr = ''

let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = ''

" tabnew mapping : tn
nnoremap <silent> tn :<C-u>tabnew<CR>
" show tab number
let g:airline#extensions#tabline#buffer_idx_mode = 1
" select tab number
nmap t1 <Plug>AirlineSelectTab1
nmap t2 <Plug>AirlineSelectTab2
nmap t3 <Plug>AirlineSelectTab3
nmap t4 <Plug>AirlineSelectTab4
nmap t5 <Plug>AirlineSelectTab5
nmap t6 <Plug>AirlineSelectTab6
nmap t7 <Plug>AirlineSelectTab7
nmap t8 <Plug>AirlineSelectTab8
nmap t9 <Plug>AirlineSelectTab9
" change tab
nmap <space>[ <Plug>AirlineSelectPrevTab
nmap <space>] <Plug>AirlineSelectNextTab

" *.vim, *.tomlファイルを保存時にstatus, tabの表示が崩れるため再描画
autocmd bufWritePost *.vim :AirlineRefresh
autocmd bufWritePost *.toml :AirlineRefresh
