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
        vim.lsp.config("*", { capabilities = capabilities })

        -- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#ts_ls
        vim.lsp.config("ts_ls", { single_file_support = false })

        vim.lsp.config("jsonls", {
          settings = {
            json = {
              schemas = require("schemastore").json.schemas(),
              validate = { enable = true },
            },
          },
        })

        vim.lsp.enable({
          "cmake",
          "pylsp", -- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#pylsp
          "gopls", -- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#gopls
          "denols",
          "html", -- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#html
          "cssls",
          "sqls",
          "bashls",
          "ruby_lsp",
          "rust_analyzer",
          "ruff",
          "ts_ls",
          "jsonls",
        })
      end
    }
  }
end
