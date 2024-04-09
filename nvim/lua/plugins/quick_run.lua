return {
  "thinca/vim-quickrun",
  enabled = true,
  cond = not (vim.g.vscode == 1),
  dependencies = {
    "lambdalisue/vim-quickrun-neovim-job"
  },
  keys = {
    { "<Leader>r", ":QuickRun<CR>", { silent = true, noremap = true, desc = "Default quick run" } },
  },
  config = function()
    vim.g.quickrun_config = {
      ["_"] = {
        ["runner"] = "neovim_job",
        ["outputter/buffer/opener"] = "new",
        ["outputter/buffer/close_on_empty"] = 1,
      },
      -- ["go"] = {
      -- },
      ["rust"] = {
        ["exec"] = "cargo run",
      },
    }
    -- vim.api.nvim_command('command! run QuickRun')
  end
}

