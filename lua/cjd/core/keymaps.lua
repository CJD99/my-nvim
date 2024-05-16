-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

-- move selected lines (even inside indented blocks)
keymap.set("v", "J", ":m '>+1<CR>gv=gv", {silent = true})
keymap.set("v", "K", ":m '<-2<CR>gv=gv", {silent = true})

-- keep search cursor in the middle
keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")

-- paste without losing nvim's clipboard data
keymap.set("x", "<leader>p", [["_dP]])

-- easy save and close
keymap.set('n', '<leader>w', ':w<CR>', { silent = true, desc = "Save file" })
keymap.set('n', '<leader>q', ':q<CR>', { silent = true, desc = "Close file" })
keymap.set('n', '<leader>Q', ':q!<CR>', { silent = true, desc = "Force Close file" })

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

keymap.set("n", "gsj", ":GoTagAdd json -transform camelcase <CR>", { desc = "Add json struct tags" })
keymap.set("n", "gsy", ":GoTagAdd yaml <CR>", { desc = "Add yaml struct tags" })
keymap.set("n", "gsx", ":GoTagAdd xml -transform camelcase <CR>", { desc = "Add xml struct tags" })


-- floating terminal stuff
keymap.set("n", "<leader>nt", ":FloatermNew<CR>", { desc = "open new floating terminal", silent = true })
keymap.set("t", "<leader>nt", "<C-\\><C-n>:FloatermNew<CR>", { desc = "open new floating terminal", silent = true })
keymap.set("n", "<leader>tn", ":FloatermNext<CR>", { silent = true })
keymap.set("t", "<leader>tn", "<C-\\><C-n>:FloatermNext<CR>", { silent = true })
keymap.set("n", "<leader>tp", ":FloatermPrev<CR>", { silent = true })
keymap.set("t", "<leader>tp", "<C-\\><C-n>:FloatermPrev<CR>", { silent = true })
keymap.set("n", "<leader>tk", ":FloatermKill<CR>", { silent = true })
keymap.set("t", "<leader>tk", "<C-\\><C-n>:FloatermKill<CR>", { silent = true })


local function run_go_file()
  local filename  = vim.fn.expand("%")
  local project_name = vim.fn.expand("%:p:h:t")

  local cmd = ":FloatermNew!"

  vim.cmd(cmd)

  if vim.loop.fs_stat(filename) ~= nil then
    cmd = (":FloatermSend go build; ./%s"):format(project_name)
  end

  vim.cmd(cmd)

end

keymap.set("n", "<leader>go", run_go_file, { desc = "Build and Execute binary file (GO)"})

-- open file on web
keymap.set("n", "<leader>ow", (":exe ':silent !firefox " .. vim.fn.expand("%:p:S") .. "'"), { desc = "Open current file on web browser"})

-- remove whitespaces on saving
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
    pattern = {"*"},
    callback = function()
      local save_cursor = vim.fn.getpos(".")
      pcall(function() vim.cmd [[%s/\s\+$//e]] end)
      vim.fn.setpos(".", save_cursor)
    end,
})

-- autoformat on saving
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
    pattern = {"*.go", "*.html", "*.tsx", "*.css", "*.ts"},
    callback = function(args)
      require("conform").format({ bufnr = args.buf })
    end,
})

