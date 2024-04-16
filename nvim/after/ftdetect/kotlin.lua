vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {
  pattern = {"*.kt", "*.kts"},
  callback = function()
    vim.bo.filetype = "kotlin"
  end,
})
