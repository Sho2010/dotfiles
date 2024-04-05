-- Note
--
-- VSCodeNotify()/VSCodeCall(): deprecated, use Lua require('vscode-neovim').call() instead.
-- VSCodeNotifyRange()/VSCodeCallRange(): deprecated, use Lua require('vscode-neovim').call(…, {range:…}) instead.
-- VSCodeNotifyRangePos()/VSCodeCallRangePos(): deprecated, use Lua require('vscode-neovim').call(…, {range:…}) instead.
--
-- できればファイルタイプに依存しないサブコマンドを作っておいてそれを呼ぶようにしたい

vim.keymap.set("n", "<leader>a", "<Cmd>lua require('vscode-neovim').call('go.toggle.test.file')<CR>") -- -- toggle test <> code
vim.keymap.set("n", "<leader>n", "<Cmd>lua require('vscode-neovim').call('workbench.explorer.fileView.focus')<CR>")
vim.keymap.set("n", "<leader>uu", "<Cmd>lua require('vscode-neovim').call('workbench.action.quickOpen')<CR>")

vim.keymap.set("n", "<C-o>", "<Cmd>lua require('vscode-neovim').call('workbench.action.navigateBack')<CR>") -- 前のファイルに移動
vim.keymap.set("n", "<C-]>", "<Cmd>lua require('vscode-neovim').call('editor.action.revealDefinition')<CR>") -- 定義ジャンプ
vim.keymap.set("n", "<S-]>", "<Cmd>lua require('vscode-neovim').call('references-view.findReferences')<CR>") -- すべての参照を検索
vim.keymap.set("n", "<S-:>", "<Cmd>lua require('vscode-neovim').call('workbench.action.showCommands')<CR>") -- コマンドパレットを開く

-- if filetype go
if vim.bo.filetype == "go" then
  -- vim.keymap.set("n", "<leader>rr", "<Cmd>call VSCodeNotify('editor.action.rename')<CR>") -- リネーム
  -- vim.keymap.set("n", "<leader>gg", "<Cmd>call VSCodeNotify('editor.action.goToImplementation')<CR>") -- 実装ジャンプ
end

