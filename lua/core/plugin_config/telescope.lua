require('telescope').setup(
	{
		defaults = {
			prompt_prefix = "   ",
			initial_mode = "insert",
			selection_strategy = "reset",
			sorting_strategy = "ascending",
			layout_strategy = "horizontal",
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
		}
	}
)
local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<Space><Space>', builtin.oldfiles, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<Space>fw', builtin.live_grep, {})
vim.keymap.set('n', '<Space>fh', builtin.help_tags, {})
vim.keymap.set('n', '<Space>gs', builtin.git_status, {})
vim.keymap.set('n', '<Space>fo', builtin.treesitter, {})
vim.keymap.set('n', '<Space>gb', builtin.git_branches, {})
vim.keymap.set('n', '<Space>fd', function() builtin.diagnostics({bufnr=0}) end, {})

