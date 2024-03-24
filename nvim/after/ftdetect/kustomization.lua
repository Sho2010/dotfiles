vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {
  pattern = "kustomization.yaml",
  callback = function()
    vim.bo.filetype = "kustomize"
  end,
})
