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

-- copy to system clipboard
keymap.set({"n", "v"}, "<leader>y", [["+y]])
keymap.set("n", "<leader>Y", [["+Y]], {desc = "Copy to system clipboard"})

-- change word
keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Change word under cursor in all the file"})

-- git signs
keymap.set("n", "<leader>pb", ":Gitsigns blame_line<CR>", { desc = "Git blame current line"})
