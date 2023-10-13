return {
  'voldikss/vim-floaterm',

  config = function ()
    vim.g.floaterm_width = 0.95
    vim.g.floaterm_height = 0.95
    vim.keymap.set('n', '<leader>lg', ':FloatermNew lazygit<CR>')
  end

}
