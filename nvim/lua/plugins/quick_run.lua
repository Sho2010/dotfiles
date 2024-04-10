return {
  "thinca/vim-quickrun",
  enabled = true,
  cond = not (vim.g.vscode == 1),
  dependencies = {
    "lambdalisue/vim-quickrun-neovim-job"
  },
  keys = {
    { "<Leader>rr", ":QuickRun<CR>", { silent = true, noremap = true, desc = "Default quick run" } },
    { "<Leader>r", ":QuickRun -args ", { silent = true, noremap = true, desc = "QuickRUn with argument" } },
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

