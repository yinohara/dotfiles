"" Language Server

" vim-lsp doesn't ship with any language servers.
" The user is responsible for configuring the language servers correctly.
"
" 1. Make sure the language server is available locally in the machine.
" 2. Register the language server in your .vimrc
" 3. Configure your settings for the buffer

" Golang
" https://github.com/prabirshrestha/vim-lsp/wiki/Servers-Go


"nnoremap <silent> [vimlsp]d :<C-u>LspDefinition<CR>
"nnoremap <silent> [vimlsp]t :<C-u>LspTypeDefinition<CR>
"nnoremap <silent> [vimlsp]f :<C-u>LspDocumentFormat<CR>
"nnoremap <silent> [vimlsp]h :<C-u>LspHover<CR>
"nnoremap <silent> [vimlsp]] :<C-u>LspNextError<CR>
"nnoremap <silent> [vimlsp][ :<C-u>LspPreviousError<CR>
"nnoremap <silent> [vimlsp]r :<C-u>LspReferences<CR>
"nnoremap <silent> [vimlsp]s :<C-u>LspStatus<CR>
"nnoremap <silent> [vimlsp]n :<C-u>LspRename<CR>
"nnoremap <silent> [vimlsp]i :<C-u>!goimports -w %<CR>

let g:lsp_settings_servers_dir = expand('$HOME/dev/lsp/servers')

function! s:on_lsp_buffer_enabled() abort
  setlocal omnifunc=lsp#complete
  setlocal signcolumn=yes
  "setlocal foldmethod=expr
  "setlocal foldexpr=lsp#ui#vim#folding#foldexpr()
  "setlocal foldtext=lsp#ui#vim#folding#foldtext()

  nnoremap [vimlsp] <Nop>
  nmap <space>j [vimlsp]

  nmap <buffer> [vimlsp]ca <plug>(lsp-code-action)
  nmap <buffer> [vimlsp]d <plug>(lsp-definition)
  nmap <buffer> [vimlsp]f <plug>(lsp-document-format)
  vmap <buffer> [vimlsp]f <plug>(lsp-document-format)
  nmap <buffer> [vimlsp]ne <plug>(lsp-next-error)
  nmap <buffer> [vimlsp]nr <plug>(lsp-next-reference)
  nmap <buffer> [vimlsp]pc <plug>(lsp-preview-close)
  nmap <buffer> [vimlsp]pd <plug>(lsp-peek-definition)
  nmap <buffer> [vimlsp]pe <plug>(lsp-previous-error)
  nmap <buffer> [vimlsp]pf <plug>(lsp-preview-focus)
  nmap <buffer> [vimlsp]pr <plug>(lsp-previous-reference)
  nmap <buffer> [vimlsp]rn <plug>(lsp-rename)
  nmap <buffer> [vimlsp]rf <plug>(lsp-references)
  nmap <buffer> [vimlsp]s <plug>(lsp-status)
  nmap <buffer> [vimlsp]td <plug>(lsp-type-definition)

  inoremap <expr> <cr> pumvisible() ? "\<c-y>\<cr>" : "\<cr>"
endfunction

augroup lsp_install
  au!
  autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END
command! LspDebug let lsp_log_verbose=1 | let lsp_log_file = expand('~/lsp.log')

let g:lsp_signs_error = {'text': '✗'}
let g:lsp_signs_warning = {'text': '‼'}
let g:lsp_signs_information = {'text': '✎'}
let g:lsp_signs_hint = {'text': '➤'}
