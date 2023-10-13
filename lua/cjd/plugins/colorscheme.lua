-- local colors = require("ayu.colors") require('ayu').setup({
--     mirage = false, -- Set to `true` to use `mirage` variant instead of `dark` for dark background.
--     overrides = {
--         -- Normal = { bg = "None" },
--         -- ColorColumn = { bg = "None" },
--         -- SignColumn = { bg = "None" },
--         -- Folded = { bg = "None" },
--         -- FoldColumn = { bg = "None" },
--         -- CursorLine = { bg = "None" },
--         -- CursorColumn = { bg = "None" },
--         -- WhichKeyFloat = { bg = "None" },
--         -- VertSplit = { bg = "None" },
--         -- LineNr = {fg = "#adb5bd"},
-- 	    ['@variable'] = { fg = "#F9F5D7" },
-- 	    ['@parameter'] = { fg = "#F9F5D7" },
--
-- 	}, -- A dictionary of group names, each associated with a dictionary of parameters (`bg`, `fg`, `sp` and `style`) and colors in hex.
-- })

-- vim.cmd.colorscheme "ayu"

-- Default options:
-- require('kanagawa').setup({
--     compile = false,             -- enable compiling the colorscheme
--     undercurl = true,            -- enable undercurls
--     commentStyle = { italic = false },
--     functionStyle = {},
--     keywordStyle = { italic = false},
--     statementStyle = { bold = true },
--     typeStyle = {},
--     transparent = false,         -- do not set background color
--     dimInactive = false,         -- dim inactive window `:h hl-NormalNC`
--     terminalColors = true,       -- define vim.g.terminal_color_{0,17}
--     colors = {                   -- add/modify theme and palette colors
--         palette = {
--             sumiInk0 = "#181C1D",
--             sumiInk1 = "#181C1D", -- telescope background
--             sumiInk2 = "#181C1D", -- telescope background
--             sumiInk3 = "#1b2021", -- editor background
--             sumiInk4 = "#181C1D", -- line number background
--             sumiInk5 = "#282828", -- line number background
--
--         },
--         theme = {
--             wave = {},
--             lotus = {},
--             dragon = {},
--             all = {
--                 ui = {
--                     nontext = "#505050",
--                     bg_gutter = "none"
--                 }
--             }
--         },
--     },
--     overrides = function(colors) -- add/modify highlights
--         local theme = colors.theme
--         return {
--             TelescopeTitle = { fg = theme.ui.fg, bold = true },
--             TelescopeResultsTitle = {fg = theme.ui.bg_dim},
--             TelescopePromptNormal = { bg = theme.ui.bg_p1 },
--             TelescopePromptBorder = { fg = theme.ui.bg_p1, bg = theme.ui.bg_p1 },
--             TelescopeResultsNormal = { bg = theme.ui.bg_dim},
--             TelescopeResultsBorder = { fg = theme.ui.bg_dim, bg = theme.ui.bg_dim },
--             TelescopePreviewNormal = { bg = theme.ui.bg_dim },
--             TelescopePreviewBorder = { bg = theme.ui.bg_dim, fg = theme.ui.bg_dim },
--         }
--     end,
--     theme = "wave",              -- Load "wave" theme when 'background' option is not set
--     -- background = {               -- map the value of 'background' option to a theme
--     --     dark = "wave",           -- try "dragon" !
--     --     light = "lotus"
--     -- },
-- })
--
-- -- setup must be called before loading
-- vim.cmd("colorscheme kanagawa")


return {
  {
    "bluz71/vim-nightfly-guicolors",
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      -- load the colorscheme here
      vim.g.nightflyTransparent = true
      vim.cmd([[colorscheme nightfly]])
    end,
  },
}
