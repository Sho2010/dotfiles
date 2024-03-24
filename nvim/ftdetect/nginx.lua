vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {
  pattern = "*.nginx.conf",
  callback = function()
    vim.bo.filetype = "nginx"
  end,
})

