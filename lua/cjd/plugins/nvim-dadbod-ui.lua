return {
  'kristijanhusak/vim-dadbod-ui',
  dependencies = {
    { 'tpope/vim-dadbod', lazy = true },
    { 'kristijanhusak/vim-dadbod-completion', ft = { 'sql', 'mysql', 'plsql' } },
    { 'tpope/vim-dotenv', lazy = true },
  },
  cmd = {
    'DBUI',
    'DBUIToggle',
    'DBUIAddConnection',
    'DBUIFindBuffer',
  },
  init = function()
    -- Your DBUI configuration
    vim.g.db_ui_use_nerd_fonts = 1
    vim.g.db_ui_win_position = "right"

    local keymap = vim.keymap

    -- keymap.set("n", "<leader>dbi", ":DBUI<CR>", { desc = "Initialize DBUI" })
    keymap.set("n", "<leader>db", ":DBUIToggle<CR>", { desc = "Toogle DBUI" })

  end,

}

