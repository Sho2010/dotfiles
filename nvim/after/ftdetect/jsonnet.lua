vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {
  pattern = "*.libsonnet",
  callback = function()
    vim.bo.filetype = "jsonnet"
  end,
})

