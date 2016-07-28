" 書き込み後にシンタックスチェックを行う
let g:watchdogs_check_BufWritePost_enable = 1

" filetype ごとに有効無効を設定することも出来る
" let g:watchdogs_check_BufWritePost_enables = {
" \   "cpp" : 0
" \   "haskell" : 1
" \}


" こっちは一定時間キー入力がなかった場合にシンタックスチェックを行う
" バッファに書き込み後、1度だけ行われる
let g:watchdogs_check_CursorHold_enable = 1

" filetype=python は無効になる
" let g:watchdogs_check_CursorHold_enables = {
" \   "python" : 0
" \   "ruby"   : 1
" \}}
