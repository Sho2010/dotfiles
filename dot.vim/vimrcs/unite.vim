"=======================================================
" unite
"------------------------------------------------------
nnoremap [unite] <Nop>
nmap <Space>u [unite]
nnoremap <silent> [unite]c   :<C-u>UniteWithCurrentDir -buffer-name=files buffer file_mru bookmark file<CR>

" バッファ一覧
nnoremap <silent> [unite]b :<C-u>Unite buffer<CR>
" ファイル一覧
nnoremap <silent> [unite]u :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
" レジスタ一覧
nnoremap <silent> [unite]r :<C-u>Unite -buffer-name=register register<CR>
" 最近使用したファイル一覧
nnoremap <silent> [unite]m :<C-u>Unite file_mru<CR>
" 常用セット
nnoremap <silent> [unite]u :<C-u>Unite buffer file_mru<CR>
" grep
nnoremap <silent> [unite]g :<C-u>Unite grep:. -no-empty -buffer-name=search-buffer<CR>
" git grep
nnoremap <silent> [unite]gg :<C-u>Unite grep/git:. -no-empty -buffer-name=search-buffer<CR>
" git grep
nnoremap <silent> [unite]f :<C-u>Unite find:. -no-empty<CR>

" smart case
let g:unite_enable_ignore_case = 1
let g:unite_enable_smart_case = 1


