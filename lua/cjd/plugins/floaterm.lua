return {
  'voldikss/vim-floaterm',

  config = function ()
    vim.g.floaterm_width = 0.95
    vim.g.floaterm_height = 0.95
    vim.keymap.set('n', '<leader>lg', ':FloatermNew lazygit<CR>', { silent = true, desc="open lazygit" })
    vim.keymap.set('n', '<C-t>', ':FloatermToggle<CR>', {noremap = true, silent = true, desc = "Toogle Floaterm" })
    vim.keymap.set('t', '<C-t>', '<C-\\><C-n>:FloatermToggle<CR>', {noremap = true, silent = true})
  end

}
