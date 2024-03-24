vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {
  pattern = "Gemfile",
  callback = function()
    vim.bo.filetype = "Gemfile"
  end,
})
