"=======================================================
" vim-go
"------------------------------------------------------
let mapleader = "\<Space>"
au FileType go nmap [golang] <Nop>
au FileType go nmap <Leader> [golang]

au FileType go nmap [golang]r <Plug>(go-run)
au FileType go nmap [golang]b <Plug>(go-build)
au FileType go nmap [golang]t <Plug>(go-test)
au FileType go nmap [golang]g <Plug>(go-test)
au FileType go nmap [golang]g <Plug>(go-fmt)
au FileType go nmap [golang]c <Plug>(go-coverage-toggle)

au FileType go nmap [golang]i :<C-u>GoInfo<CR>
au FileType go nmap [golang]f :<C-u>GoFmt<CR>
au FileType go nmap [golang]l :<C-u>GoLint<CR>

au FileType go map <C-n> :cnext<CR>
au FileType go map <C-m> :cprevious<CR>
au FileType go nnoremap <leader>a :cclose<CR>

au FileType go set autowrite

" auto import
let g:go_fmt_command = "goimports"

" カーソル上のワードに対して:GoInfo実行
" let g:go_auto_type_info = 1
" :GoInfo更新時間 Default->800
" autocmd FileType go set updatetime=1000

" === Others ===
" GoInstallBinaries: vim-goに必要なツールのインストール(go get がバックグラウンドで動いて大変時間がかかる)
" GoUpdateBinaries: GoInstallBinariesで落としたツールのアップデート
" GoImport: importパスの追加
" GoImportAs: importパスの追加(パッケージ名変更)
" GoDrop: importパスの削除
" GoDef: ctagsジャンプと同じ(ショートカットキー<C-]>)
" GoDecls: gtagsジャンプと同じ(ファイル内のみ対象) ctrlPやFZFと連携
" GoDeclsdir: gtagsジャンプと同じ(ディレクトリ内の全ファイル対象)
" GoReferrers: gtagsジャンプと似たようなもん？GoDeclsと違ってロケーションリストに表示
" GoDescribe: フィールドの定義、メソッドの組と URL 構造体のフィールドが表示される
" GoImplements: 型が実装しているインターフェースをロケーションリストに表示
" GoWhicherrs: モードはエラーの型の値に現れうる可能な定数の組、グローバル変数、そして具象型を報告
" GoCallees: 関数を呼び出す可能性のあるターゲットを表示
" GoCallstack: 選択部分を含む関数へのコールグラフの根本からの任意のパスを表示
" GoChannelPeers: チャンネルの送信先 / 受信先を表示
" GoRename: GOPATH 以下にある全てのパッケージを検索してその識別子に依存している全ての識別子をリネーム
" GoFreevars: どれだけ多くの変数に依存しているかを見る
" GoGenarate: コード生成
" GoImpl: インターフェースを実装するメソッドスタブの生成
" GoPlay: コードをGo Playground に公開する(リンクはバッファかクリップボードにコピーされる)

