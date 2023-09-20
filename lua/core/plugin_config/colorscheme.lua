local colors = require("ayu.colors")

require('ayu').setup({
    mirage = false, -- Set to `true` to use `mirage` variant instead of `dark` for dark background.
    overrides = {
	  ['@variable'] = { fg = "#F9F5D7" },
	  ['@parameter'] = { fg = "#F9F5D7" },

	}, -- A dictionary of group names, each associated with a dictionary of parameters (`bg`, `fg`, `sp` and `style`) and colors in hex.
})

vim.cmd.colorscheme "ayu"
