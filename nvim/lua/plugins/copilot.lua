-- GitHub Copilot
return {
  -- {
  --   "github/copilot.vim",
  --   enabled = true,
  --   cond = not (vim.g.vscode == 1),
  -- },
  {
    "zbirenbaum/copilot.lua",
    event = {'InsertEnter'},
    config = function ()
      if vim.g.vscode == 1 then
        local suggestions_ = true
        local panel_ = true
      else
        local suggestions_ = false
        local panel_ = false
      end

      require('copilot').setup({
        suggestion = { enabled = suggestions_ },
        panel = { enabled = panel_ },
        filetypes = {
          markdown = true, -- overrides default
          terraform = false, -- disallow specific filetype
        },
      })
    end
  },
  {
    "zbirenbaum/copilot-cmp",
    enabled = true,
    cond = not (vim.g.vscode == 1),
    dependencies = {
      "zbirenbaum/copilot.lua"
    },
    config = function ()
      require("copilot_cmp").setup({

      })
    end
  },
}
