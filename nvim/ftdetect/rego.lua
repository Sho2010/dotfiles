vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {
  pattern = "*.rego",
  callback = function()
    vim.bo.filetype = "rego"
  end,
})
