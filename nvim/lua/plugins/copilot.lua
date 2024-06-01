-- GitHub Copilot
return {
  -- {
  --   "github/copilot.vim",
  --   enabled = true,
  --   cond = not (vim.g.vscode == 1),
  --   event = {'InsertEnter'},
  --   -- こういう書き方もできるらしい
  --   -- keys = { { "<C-j>", mode = { "i", "c" }, "<Plug>(skkeleton-enable)" } },
  --   config = function ()
  --     vim.g.copilot_assume_mapped = true
  --     vim.g.copilot_no_tab_map = true
  --   end
  -- },
  {
    "zbirenbaum/copilot.lua",
    event = {'InsertEnter'},
    fix_pairs = true,
    keys = {
      { "<M-i>", "<ESC>:Copilot panel<CR>",  silent = true, noremap = true, desc = "open copilot", mode = { "i", "s" }},
    },
    config = function ()
      if vim.g.vscode == 1 then
        local suggestions_ = true
        local panel_ = true
      else
        -- 試しに
        local suggestions_ = true
        local panel_ = true
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
