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
    vim.g.db_ui_default_query = 'SELECT * FROM "{table}" LIMIT 200;'
    vim.g.db_ui_execute_on_save = 0

    local keymap = vim.keymap

    -- keymap.set("n", "<leader>dbi", ":DBUI<CR>", { desc = "Initialize DBUI" })

    vim.api.nvim_create_autocmd('FileType', {
	  pattern = '*',
	  callback = function ()
        if vim.bo.filetype == "sql" or vim.bo.filetype == "mysql" then
            keymap.set({"n", "v"}, "<C-CR>", "<Plug>(DBUI_ExecuteQuery)", { desc = "Execute Query" })
            keymap.set({"n"}, "<leader>R", "<Plug>(DBUI_ToggleResultLayout)", { desc = "Toggle Results" })
        end
	  end,
    })

    keymap.set("n", "<leader>db", ":DBUIToggle<CR>", { desc = "Toogle DBUI" })

  end,

}

