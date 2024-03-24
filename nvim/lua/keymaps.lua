-- nvim, vscode 両方で有効化したいキーマップ
-- ...


if vim.g.vscode == 1 then
  require("keymaps_vscode")
else
  require("keymaps_vim")
end
