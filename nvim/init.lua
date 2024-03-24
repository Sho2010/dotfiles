vim.g.mapleader = " "

require("options")

function merge_tables(t1, t2)
    local merged = {}
    for _, v in ipairs(t1) do
        table.insert(merged, v)
    end
    for _, v in ipairs(t2) do
        table.insert(merged, v)
    end
    return merged
end

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup( "plugins"
  -- merge_tables(common_plugins, is_vscode and vscode_plugins or neovim_plugins),
  -- {
  --   performance = {
  --     rtp = {
  --       disabled_plugins = {
  --         "netrw",
  --         "netrwPlugin",
  --         "netrwSettings",
  --         "netrwFileHandlers",
  --       },
  --     },
  --   },
  -- }
)


-- 設定例
-- {'windwp/nvim-autopairs', event = 'InsertEnter'}, --文字の挿入を伴うプラグインは'InsertEnter'を指定する。
-- {'j-hui/fidget.nvim', event = 'LspAttach'}, --LSPと連動するプラグインは'LspAttach'を指定する。
-- {'nvim-telescope/telescope.nvim', cmd = 'Telescope'}, --特定のコマンドを入力するまで不要なプラグインはcmd = 'cammand'で対応する。
-- {'vim-jp/vimdoc-ja', ft = 'help'}, --特定のファイルタイプでのみ必要なプラグインはft = 'filetype'で対応する。
-- {'lewis6991/gitsigns.nvim', event = 'BufNewFile, BufRead'}, --ファイルを読み込んだ後に装飾を加えるプラグインは'BufNewFile'と'BufRead'が有力。
-- {'echasnovski/mini.surround', event = 'ModeChanged'}, --モードの切り替え時に発動させたいプラグインは'ModeChanged'が適切。
-- {'nvim-lualine/lualine.nvim', event = 'VeryLazy'}, --他の設定でうまく動かなかったものは一律に'VeryLazy'で対処する。（VimEnter相当らい）
-- {'vim-denops/denops.vim', lazy = false}, --即時読み込んでくれないと不都合なプラグインは逆に遅延を無効化する。（config.default.lazy = falseの場合）

require("keymaps")
