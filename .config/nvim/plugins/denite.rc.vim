" Define mappings
nnoremap [denite] <Nop>
nmap <space>d [denite]

nnoremap <silent> [denite]b :<C-u>Denite buffer<CR>
nnoremap <silent> [denite]cs :<C-u>Denite colorscheme<CR>
nnoremap <silent> [denite]f :<C-u>Denite file/rec<CR>
nnoremap <silent> [denite]n :<C-u>Denite file:new<CR>
nnoremap <silent> [denite]h :<C-u>Denite help<CR>
nnoremap <silent> [denite]j :<C-u>Denite jump<CR>
nnoremap <silent> [denite]m :<C-u>Denite menu<CR>
" Denite grep with naming result of grep denite-grep-buffer
nnoremap <silent> [denite]g :<C-u>Denite grep -buffer-name=denite-grep-buffer<CR>
" Redisplay result of grep
nnoremap <silent> [denite]r :<C-u>Denite -resume -buffer-name=denite-grep-buffer<CR>
" Next candidate
nnoremap <silent> [denite]cn :<C-u>Denite -resume -buffer-name=denite-grep-buffer -cursor-pos=+1 -immediately<CR>
" Prev candidate
nnoremap <silent> [denite]cp :<C-u>Denite -resume -buffer-name=denite-grep-buffer -cursor-pos=-1 -immediately<CR>


autocmd Filetype denite call s:denite_my_settings()
function! s:denite_my_settings() abort
  " do action
  nnoremap <silent><buffer><expr> <CR> denite#do_map('do_action')
  " delete buffer
  nnoremap <silent><buffer><expr> d denite#do_map('do_action', 'delete')
  " preview file
  nnoremap <silent><buffer><expr> p denite#do_map('do_action', 'preview')
  " quit denite window
  nnoremap <silent><buffer><expr> q denite#do_map('quit')
  " open filter buffer
  nnoremap <silent><buffer><expr> i denite#do_map('open_filter_buffer')
  " press space to go down
  nnoremap <silent><buffer><expr> <space> denite#do_map('toddle_select').'j'
endfunction

autocmd FileType denite-filter call s:denite_filter_my_settings()
function! s:denite_filter_my_settings() abort
  imap <silent><buffer> <C-c> <Plug>(denite_filter_quit)
  nmap <silent><buffer> <C-c> <Plug>(denite_filter_quit)
  inoremap <silent><buffer><expr> <CR> denite#do_map('do_action')
  " call deoplete#custom#buffer_option('auto_complete', v:false)
endfunction

" Change denite default options
let s:denite_winwidth = &columns / 10 * 8
let s:denite_winheight = &lines / 10 * 7

" Change denite default options
call denite#custom#option('default', {
      \ 'split': 'floating',
      \ 'start_filter': v:true,
      \ 'winwidth': s:denite_winwidth,
      \ 'wincol': (&columns - s:denite_winwidth) / 2,
      \ 'winheight': s:denite_winheight,
      \ 'winrow': (&lines - s:denite_winheight) / 2
      \ })

" Change denite grep buffer options
call denite#custom#option('denite-grep-buffer', {
      \ 'split': 'floating',
      \ 'winwidth': s:denite_winwidth,
      \ 'wincol': (&columns - s:denite_winwidth) / 2,
      \ 'winheight': s:denite_winheight,
      \ 'winrow': (&lines - s:denite_winheight) / 2
      \ })

" Ignore globs list
let s:ignore_globs = ['.git', '.svn', 'node_modules']

" Change file/rec command to ag ignoring globs
call denite#custom#var('file/rec', 'command',
      \ ['ag', '--follow'] +
      \ map(deepcopy(s:ignore_globs), {k, v -> '--ignore=' . v}) +
      \ ['--nocolor', '--nogroup', '-g', '']
      \ )

" Change matchers
" matcher/cpsmが正常に設定できないためfuzzyに一時変更
" call denite#custom#source('file/rec', 'matchers', ['matcher/cpsm'])
call denite#custom#source('file/rec', 'matchers', ['matcher/fuzzy'])

" -i --ignore-case and --vimgrep Output results in the same form as Vim's :vimgrep /pattern/g
call denite#custom#var('grep', 'command', ['ag'])
call denite#custom#var('grep', 'default_opts', ['-i', '--vimgrep'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', [])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])

" Add custom menu
let s:menus = {}

" Add zsh configuration menu
let s:menus.zsh = {'description': 'Edit your import zsh configuration'}
let s:menus.zsh.file_candidates = [
      \ ['zshrc', '~/.zsh/.zshrc'],
      \ ['zshenv', '~/.zshenv'],
      \ ['theme', '~/.zsh/.theme.zsh'],
      \ ]

" Add neovim configuration menu
let s:menus.neovim = {'description': 'Edit your Neovim configuration'}
let s:menus.neovim.file_candidates = [
      \ ['init.vim', '~/.config/nvim/init.vim'],
      \ ['dein', '~/.config/nvim/dein.rc.vim'],
      \ ['keymaps', '~/.config/nvim/keymap.rc.vim'],
      \ ['options', '~/.config/nvim/options.rc.vim'],
      \ ]

call denite#custom#var('menu', 'menus', s:menus)

