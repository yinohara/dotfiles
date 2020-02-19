" NeoVim
" init.vim

" ignore vi compatibility
if &compatible
  set nocompatible
endif

augroup MyAutoCmd
  autocmd!
augroup END

" python2 path
let g:python_host_prog = expand('/usr/local/bin/python2')
" python3 path
let g:python3_host_prog = expand('/usr/local/bin/python3')
" nodejs path
let g:node_host_prog = expand('/usr/local/bin/neovim-node-host')

" dein.vim directory
let g:cache_home = empty($XDG_CACHE_HOME) ? expand('$HOME/.cache') : $XDG_CACHE_HOME
let g:config_home = empty($XDG_CONFIG_HOME) ? expand('$HOME/.config') : $XDG_CONFIG_HOME
let s:dein_cache_dir = g:cache_home . '/dein'
let s:dein_repo_dir = s:dein_cache_dir . '/repos/github.com/Shougo/dein.vim'

" intsll dein.vim from github if not 
if &runtimepath !~# 'dein.vim'
  if !isdirectory(s:dein_repo_dir)
    call system('git clone https://github.com/Shougo/dein.vim' . shellescape(s:dein_repo_dir))
  endif
  " use dein.vim as plugin
  execute 'set runtimepath^=' . s:dein_repo_dir
endif

" start setting of dein.vim
if dein#load_state(s:dein_cache_dir)
  call dein#begin(s:dein_cache_dir)

  " toml file path
  let s:toml_dir	= g:config_home . '/dein'

  " load plugins from toml file
  call dein#load_toml(s:toml_dir . '/dein.toml', {'lazy': 0})
  call dein#load_toml(s:toml_dir . '/deinlazy.toml', {'lazy': 1})
  if has('nvim')
    call dein#load_toml(s:toml_dir . '/neovim.toml', {'lazy': 1})
  endif

  call dein#end()
  call dein#save_state()
endif

if has('vim_starting') && dein#check_install()
  call dein#install()
endif

filetype plugin indent on
syntax enable

runtime! dein.rc.vim
runtime! options.rc.vim
runtime! keymap.rc.vim
