return {
  {
    'nvim-telescope/telescope.nvim',
    enabled = true,
    cond = not (vim.g.vscode == 1),
    dependencies = {
      "nvim-lua/plenary.nvim"
    },
    config = function ()
      local builtin = require('telescope.builtin')
      vim.keymap.set('n', '<leader>uf', builtin.find_files)
      vim.keymap.set('n', '<leader>ub', builtin.buffers)
      vim.keymap.set('n', '<leader>uh', builtin.help_tags)
      vim.keymap.set('n', '<leader>ug', builtin.live_grep)
      require('telescope').setup{
        defaults = {
          mappings = {
            i = {
              ["<C-l>"] = "close"
            }
          }
        }
      }
    end
  },
  {
    "nvim-telescope/telescope-frecency.nvim",
    enabled = true,
    cond = not (vim.g.vscode == 1),
    dependencies = {
      'nvim-telescope/telescope.nvim'
    },
    config = function()
      require("telescope").load_extension "frecency"

      vim.keymap.set("n", "<leader>uu", function()
        require("telescope").extensions.frecency.frecency {}
      end)
    end,
  }
}
