if vim.g.vscode then
  require("cjd.vscode_keymaps")
else
  require("cjd.core")
  require("cjd.lazy")
end
