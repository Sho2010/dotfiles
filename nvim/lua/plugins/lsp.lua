if vim.g.vscode == 1 then
  return {}
else
  return {
    {
      "neovim/nvim-lspconfig",
      dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "b0o/schemastore.nvim", -- https://github.com/b0o/SchemaStore.nvim
      },
      config = function()
        local capabilities = require('cmp_nvim_lsp').default_capabilities()
        capabilities.offsetencoding = { "utf-16" }

        capabilities.textDocument.completion.completionItem = {
          documentationFormat = {
            "markdown",
            "plaintext",
          },
          snippetSupport = true,
          preselectSupport = true,
          insertReplaceSupport = true,
          labelDetailsSupport = true,
          deprecatedSupport = true,
          commitCharactersSupport = true,
          tagSupport = {
            valueSet = { 1 },
          },
          resolveSupport = {
            properties = {
              "documentation",
              "detail",
              "additionalTextEdits",
            },
          },
        }
        --
        local lspconfig = require("lspconfig")
        lspconfig.cmake.setup({ capabilities = capabilities })
        lspconfig.pylsp.setup({ capabilities = capabilities }) -- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#pylsp
        lspconfig.gopls.setup({ capabilities = capabilities }) -- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#gopls
        lspconfig.denols.setup({ capabilities = capabilities })
        lspconfig.html.setup({ capabilities = capabilities }) -- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#html
        lspconfig.cssls.setup({ capabilities = capabilities })
        lspconfig.sqls.setup({ capabilities = capabilities })
        lspconfig.bashls.setup({ capabilities = capabilities })
        lspconfig.ruby_ls.setup({ capabilities = capabilities })

        -- rust
        lspconfig.rust_analyzer.setup({
          capabilities = capabilities,
        })

        -- python
        lspconfig.ruff.setup({
          capabilities = capabilities,
        })

        -- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#tsserver
        lspconfig.tsserver.setup({
          capabilities = capabilities,
          single_file_support = false,
        })

        lspconfig.jsonls.setup({
          capabilities = capabilities,
          settings = {
            json = {
              schemas = require("schemastore").json.schemas(),
              validate = { enable = true },
            },
          },
        })

      end
    }
  }
end
