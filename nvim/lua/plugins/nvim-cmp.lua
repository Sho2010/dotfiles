-- NOTE:
-- copilotとの共存がうまくいってないのでcmp連携は無効化

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
        "dmitmel/cmp-cmdline-history",
        "hrsh7th/cmp-nvim-lsp-signature-help",
        "hrsh7th/cmp-path",
        "neovim/nvim-lspconfig",
        "onsails/lspkind.nvim",
        "saadparwaiz1/cmp_luasnip",
        -- "hrsh7th/cmp-copilot",
        "zbirenbaum/copilot-cmp",
        "windwp/nvim-autopairs",
      },
      config = function()
        local has_words_before = function()
          if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then return false end
          local line, col = unpack(vim.api.nvim_win_get_cursor(0))
          return col ~= 0 and vim.api.nvim_buf_get_text(0, line-1, 0, line-1, col, {})[1]:match("^%s*$") == nil
        end

        local cmp = require("cmp")
        local luasnip = require("luasnip")
        local lspkind = require('lspkind')

        local tab = function(fallback)
          if cmp.visible() and has_words_before() then
            if cmp.get_selected_entry() then
              cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true })
            else
              cmp.select_next_item({ behavior = cmp.SelectBehavior.Replace, select = false })
            end
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          else
            fallback()
          end
        end

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
            experimental = {
              ghost_text = true,
            },
          },
          snippet = {
            expand = function(args)
              luasnip.lsp_expand(args.body)
            end,
          },
          formatting = {
            format = lspkind.cmp_format({
              mode = 'symbol_text',
              -- can also be a function to dynamically calculate max width such as
              -- maxwidth = function() return math.floor(0.45 * vim.o.columns) end,
              maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)

              ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
              show_labelDetails = true, -- show labelDetails in menu. Disabled by default

              symbol_map = { Copilot = "" }

              -- The function below will be called before any actual modifications from lspkind
              -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
              -- before = function (entry, vim_item)
              --   return vim_item
              -- end
            })
          },

          mapping = {
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

            ["<Tab>"] = cmp.mapping(tab, { "i", "s" }),
            ["<C-k>"] = cmp.mapping(tab, { "i", "s" }),
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
            { name = "dictionary", keyword_length = 2 },
            { name = "copilot", keyword_length = 0, priority = 1000 },
            { name = "luasnip" },
            { name = "nvim_lsp" },
            { name = "nvim_lua" },
            { name = "path" },
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
              { name = "cmdline_history", keyword_length = 2}, -- historyはみたいけど混ざるから微妙...
              { name = "cmdline", keyword_length = 2 },        --w, qとかでサジェストされると鬱陶しいので2文字以上
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

