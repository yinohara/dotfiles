" dein.vim settings
let g:dein#install_max_process = 16
let g:dein#install_progress_type = 'title'
let g:dein#install_message_type = 'none'
let g:dein#enable_notification = 1
" これが原因でvim-airlineの表示が崩れる
" :redrawstatusで下のステーテスバーは直る
" :redrawtablineでは上のタブバーは直らないが、時間が立つと直る
let g:dein#auto_recache = 1
