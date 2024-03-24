-- VSCodeNotify() 関数によってVSCode側のコマンドを呼び出すことができます。
vim.keymap.set("n", "<leader>n", "<Cmd>call VSCodeNotify('workbench.action.quickOpen')<CR>")

