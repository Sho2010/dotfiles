-- Note
-- 検索などフォーカスをargsにわたす方法
-- nnoremap ? <Cmd>lua require('vscode-neovim').action('workbench.action.findInFiles', { args = { query = vim.fn.expand('<cword>') } })<CR>

-- できればファイルタイプに依存しないサブコマンドを作っておいてそれを呼ぶようにしたい
vim.keymap.set("n", "<leader>a", "<Cmd>lua require('vscode-neovim').call('go.toggle.test.file')<CR>") -- -- toggle test <> code

vim.keymap.set("n", "<leader>n", "<Cmd>lua require('vscode-neovim').call('workbench.explorer.fileView.focus')<CR>")
vim.keymap.set("n", "<leader>uu", "<Cmd>lua require('vscode-neovim').call('workbench.action.quickOpen')<CR>")
vim.keymap.set("n", "<leader>q", "<Cmd>lua require('vscode-neovim').call('editor.action.quickFix')<CR>")
vim.keymap.set("n", "<leader>f", "<Cmd>lua require('vscode-neovim').call('editor.action.formatDocument')<CR>")

vim.keymap.set("n", "<C-o>", "<Cmd>lua require('vscode-neovim').call('workbench.action.navigateBack')<CR>") -- 前のファイルに移動
vim.keymap.set("n", "<C-]>", "<Cmd>lua require('vscode-neovim').call('editor.action.revealDefinition')<CR>") -- 定義ジャンプ

-- [d]iagnostics
vim.keymap.set("n", "dp", "<Cmd>lua require('vscode-neovim').call('editor.action.marker.prev')<CR>") -- 前の問題 (エラー、警告、情報) へ移動 vim.diagnostic.goto_prev
vim.keymap.set("n", "dn", "<Cmd>lua require('vscode-neovim').call('editor.action.marker.next')<CR>") -- 次の問題 (エラー、警告、情報) へ移動 vim.diagnostic.goto_next

-- TODO: 
-- MarkerNavigationがめちゃくちゃ鬱陶しいのでこれを組み込みたい closeMarkersNavigation
-- 動かなかった原因としてはcloseMarkersNavigationが呼び出されるとこまではうまくいったが、NEXTを繰り返すとループしてくれない
-- vim.keymap.set("n", "dn", "<Cmd>lua require('vscode-neovim').call('editor.action.marker.next')<CR><Cmd>lua require('vscode-neovim').call('closeMarkersNavigation')<CR>") -- 次の問題 (エラー、警告、情報) へ移動 vim.diagnostic.goto_next

-- prefix '[e]xplorer'
-- エクスプローラー上のフォーカス移動
vim.keymap.set("n", "ee", "<Cmd>lua require('vscode-neovim').call('workbench.panel.markers.view.focus')<CR>")     -- 問題
vim.keymap.set("n", "eo", "<Cmd>lua require('vscode-neovim').call('workbench.panel.output.focus')<CR>")           -- 出力
vim.keymap.set("n", "et", "<Cmd>lua require('vscode-neovim').call('workbench.view.testing.focus')<CR>")           -- テスト
vim.keymap.set("n", "ed", "<Cmd>lua require('vscode-neovim').call('workbench.debug.action.focusRepl')<CR>")       -- デバッグ

-- if filetype go
if vim.bo.filetype == "go" then
  -- vim.keymap.set("n", "<leader>rr", "<Cmd>call VSCodeNotify('editor.action.rename')<CR>") -- リネーム
  -- vim.keymap.set("n", "<leader>gg", "<Cmd>call VSCodeNotify('editor.action.goToImplementation')<CR>") -- 実装ジャンプ
end


