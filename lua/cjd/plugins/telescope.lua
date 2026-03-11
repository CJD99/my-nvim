return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-tree/nvim-web-devicons",
    'dawsers/telescope-floaterm.nvim',
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")
    telescope.load_extension('floaterm')

    telescope.setup({
      defaults = {
        path_display = { "truncate " },
        prompt_prefix = "   ",
        initial_mode = "insert",
        selection_strategy = "reset",
        sorting_strategy = "ascending",
        layout_strategy = "horizontal",
        hl_result_eol = true,
        find_command = {"rg", "--hiden", "--files"},
        layout_config = {
          horizontal = {
            prompt_position = "top",
            preview_width = 0.55,
            results_width = 0.8,
          },
          vertical = {
            mirror = false,
          },
          width = 0.87,
          height = 0.80,
          preview_cutoff = 120,
        },
        mappings = {
          i = {
            ["<S-TAB>"] = actions.move_selection_previous, -- move to prev result
            ["<TAB>"] = actions.move_selection_next, -- move to next result
            ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
          },
        },
      },
    })

    telescope.load_extension("fzf")

    -- set keymaps
    local keymap = vim.keymap -- for conciseness
    local builtin = require('telescope.builtin')

    keymap.set('n', '<leader>ff', builtin.find_files, { desc = "Fuzzy find files in cwd" })
    keymap.set('n', '<Space><Space>', builtin.oldfiles, { desc = "Fuzzy find recent files" })
    keymap.set('n', '<leader>fb', builtin.buffers, { desc = "Fuzzy find active buffers" })
    keymap.set('n', '<Space>fw', builtin.live_grep, { desc =  "Find string in cwd" })
    keymap.set('n', '<Space>fh', builtin.help_tags, { desc = "Find help tags" })
    keymap.set('n', '<Space>gs', builtin.git_status, { desc = "Preview git status" })
    keymap.set('n', '<Space>fo', builtin.treesitter, { desc = "Fuzzy find treesitter objects" })
    keymap.set('n', '<Space>gb', builtin.git_branches, { desc = "Fuzzy find git branches" })
    keymap.set('n', '<Space>fd', function() builtin.diagnostics({bufnr=0}) end, { desc = "Fuzzy find diagnostics in current buffer" })
    keymap.set('n', '<Space>ft', ":Telescope floaterm<CR>", { desc = "List all opened floaterms" })
    -- keymap.set('n', '<Space>fD', function() builtin.diagnostics({}) end, { desc = "Fuzzy find diagnostics in all files" })
  end,

}


