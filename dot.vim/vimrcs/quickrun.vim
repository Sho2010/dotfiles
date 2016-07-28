"===========================================
" quickrun settings
" 
" exec arg
" %% 		%自身
" %c		コマンド (|quickrun-option-command|)
" %o		コマンドラインオプション (|quickrun-option-cmdopt|)
" %s		ソースファイル (|quickrun-option-src|)
" %a		スクリプトの引数 (|quickrun-option-args|)
"===========================================
nnoremap [quickrun] <Nop>
nmap <Space>k [quickrun]
nnoremap <silent> [quickrun]s:call QRunRspecCurrentLine()<CR>
fun! QRunRspecCurrentLine()
  let line = line(".")
  exe ":QuickRun -cmdopt '-cfd -l " . line . "'"
endfun
