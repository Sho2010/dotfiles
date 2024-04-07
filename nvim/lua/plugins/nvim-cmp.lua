if vim.g.vscode == 1 then
  return {}
else
  return {
    {
      'hrsh7th/nvim-cmp',
      event = {'InsertEnter', 'CmdlineEnter'},
      dependencies = {
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/cmp-copilot",
        "hrsh7th/cmp-nvim-lsp-signature-help",
        "hrsh7th/cmp-path",
        "neovim/nvim-lspconfig",
        "onsails/lspkind.nvim",
        "saadparwaiz1/cmp_luasnip",
      },
      config = function()
        local has_words_before = function()
          unpack = unpack or table.unpack
          local line, col = unpack(vim.api.nvim_win_get_cursor(0))
          return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
        end

        local cmp = require("cmp")
        local luasnip = require("luasnip")
        cmp.setup({
          window = {
            completion = cmp.config.window.bordered({
              completeopt = "menu,menuone,preview",
              border = "rounded",
              winhighlight = "Normal:CmpPmenu,CursorLine:PmenuSel,Search:None",
            }),
            documentation = cmp.config.window.bordered({
              border = "rounded",
            }),
          },
          snippet = {
            expand = function(args)
              luasnip.lsp_expand(args.body)
            end,
          },
          formatting = {
            format = require("lspkind").cmp_format({
              preset = "codicons",
              maxwidth = 50,
              ellipsis_char = "...",
            }),
          },

          mapping = {
            ["<C-k>"] = cmp.mapping.select_prev_item(),
            ["<C-j>"] = cmp.mapping.select_next_item(),
            ["<C-p>"] = cmp.mapping.select_prev_item(),
            ["<C-n>"] = cmp.mapping.select_next_item(),
            ["<C-b>"] = cmp.mapping.scroll_docs(-4),
            ["<C-f>"] = cmp.mapping.scroll_docs(4),
            -- ["<C-Space>"] = cmp.mapping.abort(), C-Spaceはalfradで予約済み
            ["<CR>"] = cmp.mapping.confirm({
              behavior = cmp.ConfirmBehavior.Replace,
              select = false,
            }),
            ["<Tab>"] = cmp.mapping(function(fallback)
              if cmp.visible()  then
                if cmp.get_active_entry() then
                  cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
                else
                  cmp.mapping.select_next_item()
                end
              elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
              else
                fallback()
              end
            end, { "i", "s" }),
            ["<S-Tab>"] = cmp.mapping(function(fallback)
              if cmp.visible() then
                cmp.select_prev_item()
              elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
              else
                fallback()
              end
            end, { "i", "s" }),
            -- TODO: 検索とEXコマンドのときはこの挙動をしないようにしたい
            -- ["<CR>"] = cmp.mapping({
            --   i = function(fallback)
            --     if cmp.visible() and cmp.get_active_entry() then
            --       cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
            --     else
            --       fallback()
            --     end
            --   end,
            --   s = cmp.mapping.confirm({ select = true }),
            --   c = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
            -- }),
          },
          sources = {
            { name = "nvim_lsp" },
            { name = "luasnip" },
            { name = "nvim_lua" },
            { name = "path" },
            { name = "dictionary", keyword_length = 2 },
            { name = 'copilot' }
          },
        })

        -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
        cmp.setup.cmdline({ "/", "?" }, {
          mapping = cmp.mapping.preset.cmdline(),
          sources = {
            { name = "buffer" },
          },
        })
        -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
        cmp.setup.cmdline(":", {
          mapping = cmp.mapping.preset.cmdline(),
          sources = cmp.config.sources(
            {
              { name = "path" },
            },
            {
              { name = "cmdline", keyword_length = 2 }, --w, qとかでサジェストされると鬱陶しいので2文字以上
            }
          ),
          matching = { disallow_symbol_nonprefix_matching = false }
        })
        cmp.event:on("confirm_done", function()
          require("nvim-autopairs.completion.cmp").on_confirm_done()
        end)
      end,
    }
  }
end

-- {'hrsh7th/cmp-buffer', event = 'InsertEnter'},
-- {'hrsh7th/cmp-path', event = 'InsertEnter'},
-- {'hrsh7th/cmp-vsnip', event = 'InsertEnter'},
-- {'hrsh7th/cmp-cmdline', event = 'ModeChanged'}, --これだけは'ModeChanged'でなければまともに動かなかった。
-- {'hrsh7th/cmp-nvim-lsp-signature-help', event = 'InsertEnter'},
-- {'hrsh7th/cmp-nvim-lsp-document-symbol', event = 'InsertEnter'},
-- {'hrsh7th/cmp-calc', event = 'InsertEnter'},
-- {'onsails/lspkind.nvim', event = 'InsertEnter'},
-- {'hrsh7th/vim-vsnip', event = 'InsertEnter'},
-- {'hrsh7th/vim-vsnip-integ', event = 'InsertEnter'},
-- {'rafamadriz/friendly-snippets', event = 'InsertEnter'},

-- Plug 'hrsh7th/cmp-buffer'
-- Plug 'hrsh7th/cmp-path'
-- Plug 'hrsh7th/cmp-cmdline'
-- Plug 'hrsh7th/nvim-cmp'
--
--     },
--     {'hrsh7th/cmp-nvim-lsp', event = 'InsertEnter'},
--     {'hrsh7th/cmp-buffer', event = 'InsertEnter'},
--     {'hrsh7th/cmp-path', event = 'InsertEnter'},
--     {'hrsh7th/cmp-vsnip', event = 'InsertEnter'},
--     {'neovim/nvim-lspconfig', event = 'InsertEnter'},
--
-- Plug 'neovim/nvim-lspconfig'
--
-- return {
--   "hrsh7th/nvim-cmp",
--   event = { "InsertEnter", "CmdlineEnter" },
--   dependencies = {
--     "onsails/lspkind.nvim",
--     "hrsh7th/cmp-buffer",
--     "hrsh7th/cmp-path",
--     "hrsh7th/cmp-cmdline",
--     "saadparwaiz1/cmp_luasnip",
--     "hrsh7th/cmp-nvim-lsp-signature-help",
--   },
--   config = function()
--     local cmp = require("cmp")
--     local luasnip = require("luasnip")
--     cmp.setup({
--       window = {
--         completion = cmp.config.window.bordered({
--           completeopt = "menu,menuone,preview",
--           border = "rounded",
--           winhighlight = "Normal:CmpPmenu,CursorLine:PmenuSel,Search:None",
--         }),
--         documentation = cmp.config.window.bordered({
--           border = "rounded",
--         }),
--       },
--       snippet = {
--         expand = function(args)
--           luasnip.lsp_expand(args.body)
--         end,
--       },
--       formatting = {
--         format = require("lspkind").cmp_format({
--           preset = "codicons",
--           maxwidth = 50,
--           ellipsis_char = "...",
--         }),
--       },
--       mapping = {
--         ["<C-k>"] = cmp.mapping.select_prev_item(),
--         ["<C-j>"] = cmp.mapping.select_next_item(),
--         ["<C-b>"] = cmp.mapping.scroll_docs(-4),
--         ["<C-f>"] = cmp.mapping.scroll_docs(4),
--         ["<C-Space>"] = cmp.mapping.abort(),
--         ["<CR>"] = cmp.mapping.confirm({
--           behavior = cmp.ConfirmBehavior.Replace,
--           select = false,
--         }),
--         ["<Tab>"] = cmp.mapping(function(fallback)
--           if cmp.visible() then
--             cmp.select_next_item()
--           elseif luasnip.expand_or_jumpable() then
--             luasnip.expand_or_jump()
--           else
--             fallback()
--           end
--         end, { "i", "s" }),
--         ["<S-Tab>"] = cmp.mapping(function(fallback)
--           if cmp.visible() then
--             cmp.select_prev_item()
--           elseif luasnip.jumpable(-1) then
--             luasnip.jump(-1)
--           else
--             fallback()
--           end
--         end, { "i", "s" }),
--       },
--       sources = {
--         { name = "nvim_lsp" },
--         { name = "luasnip" },
--         { name = "nvim_lua" },
--         { name = "path" },
--         { name = "dictionary", keyword_length = 2 },
--       },
--     })
--
--     -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
--     cmp.setup.cmdline({ "/", "?" }, {
--       mapping = cmp.mapping.preset.cmdline(),
--       sources = {
--         { name = "buffer" },
--       },
--     })
--     -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
--     cmp.setup.cmdline(":", {
--       mapping = cmp.mapping.preset.cmdline(),
--       sources = cmp.config.sources({
--         { name = "path" },
--       }, {
--         { name = "cmdline" },
--       }),
--     })
--
--     cmp.event:on("confirm_done", function()
--       require("nvim-autopairs.completion.cmp").on_confirm_done()
--     end)
--   end,
-- }
--

--    sources = {
--        { name = 'nvim_lsp', keyword_length = 1, },
--    },
