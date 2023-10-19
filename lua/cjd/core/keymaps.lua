-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

-- easy save and close
keymap.set('n', '<leader>w', ':w<CR>', { desc = "Save file" })
keymap.set('n', '<leader>q', ':q<CR>', { desc = "Close file" })

-- Navigate panes better
keymap.set('n', '<c-k>', ':wincmd k<CR>')
keymap.set('n', '<c-j>', ':wincmd j<CR>')
keymap.set('n', '<c-h>', ':wincmd h<CR>')
keymap.set('n', '<c-l>', ':wincmd l<CR>')

-- fast navigation
keymap.set("n", "<C-j>", "<C-d>zz")
keymap.set("n", "<C-k>", "<C-u>zz")

-- horizontal navigation using mouse wheel
keymap.set("n", "<S-ScrollWheelUp>", "zL")
keymap.set("n", "<S-ScrollWheelDown>", "zH")

-- copy to system clipboard
keymap.set({"n", "v"}, "<leader>y", [["+y]])
keymap.set("n", "<leader>Y", [["+Y]], {desc = "Copy to system clipboard"})

-- change word
keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Change word under cursor in all the file"})

-- git signs
keymap.set("n", "<leader>pb", ":Gitsigns blame_line<CR>", { desc = "Git blame current line"})

-- resizing
keymap.set("n", "<C-Up>", ":res +5<CR>") -- make the window biger vertically
keymap.set("n", "<C-Down>", ":res -5<CR>") -- make the window smaller vertically
keymap.set("n", "<C-Right>", ":vert res +5<CR>") -- make the window bigger horizontally
keymap.set("n", "<C-Left>", ":vert res -5<CR>")  -- make window smaller horizontally


keymap.set("n", "<leader>pr", ":FloatermNew! python " .. vim.fn.expand("%") .. "<CR>", { desc = "Execute current file (Python)" })

-- remove whitespaces on saving
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
    pattern = {"*"},
    callback = function()
      local save_cursor = vim.fn.getpos(".")
      pcall(function() vim.cmd [[%s/\s\+$//e]] end)
      vim.fn.setpos(".", save_cursor)
    end,
})




