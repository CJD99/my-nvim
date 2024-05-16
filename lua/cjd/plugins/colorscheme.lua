-- return {
--   {
--     "bluz71/vim-nightfly-guicolors",
--     priority = 1000, -- make sure to load this before all the other start plugins
--     config = function()
--       -- load the colorscheme here
--       vim.g.nightflyTransparent = true
--       vim.g.nightflyItalics = false
--       vim.g.nightflyCursorColor = true
--       vim.g.nightflyTerminalColors = false
--       -- Lua initialization file
--       vim.opt.fillchars = { horiz = '━', horizup = '┻', horizdown = '┳', vert = '┃', vertleft = '┫', vertright = '┣', verthoriz = '╋', }
--
--       local custom_highlight = vim.api.nvim_create_augroup("CustomHighlight", {})
--       vim.api.nvim_create_autocmd("ColorScheme", {
--         pattern = "nightfly",
--         callback = function()
--           vim.api.nvim_set_hl(0, "Normal", { bg = "#00080c" })
--         end,
--         group = custom_highlight,
--       })
--
--
--       vim.cmd.colorscheme("nightfly")
--     end,
--   },
-- }

-- return {
--   {
--     "navarasu/onedark.nvim",
--     priority = 1000, -- make sure to load this before all the other start plugins
--     config = function()
--       local setup = require("onedark")
--       setup.setup({
--         style = "cool",
--         termcolors = true,
--         code_style = {
--           comments = 'none',
--           keywords = 'none',
--           functions = 'none',
--           strings = 'none',
--           variables = 'none'
--         },
--         colors = {
--           bg0 = "#091017",
--           bg_d = "#091017"
--         },
--         diagnostics = {
--           darker = true, -- darker colors for diagnostic
--           undercurl = true,   -- use undercurl instead of underline for diagnostics
--           background = true,    -- use background color for virtual text
--         },
--       })
--       vim.cmd.colorscheme("onedark")
--     end,
--
--   }
-- }


-- return {
--   {
--     "tiagovla/tokyodark.nvim",
--     lazy = false,
--     priority = 1000,
--     opts = {
--       transparent_background = true,
--       gamma = 1.0,
--       styles = {
--         comments = { italic = false }, -- style for comments
--         keywords = { italic = false }, -- style for keywords
--         identifiers = { italic = false }, -- style for identifiers
--         functions = {}, -- style for functions
--         variables = {}, -- style for variables
--       },
--       custom_highlights = function(hl, p)
--         return {
--           ["LspInlayHint"] = { bg = "#1C1C2A", fg = "#9AA0A7" },
--           ["@module"] = { link = "TSType" },
--           ["@property"] = { link = "Identifier" },
--           ["@variable"] = { fg = "#Afa8ea" },
--           ["@lsp.type.variable"] = { fg = "#Afa8ea" },
--           ["FloatTitle"] = { link = "Blue" },
--           ["TelescopeBorder"] = { link = "TSType" },
--           ["TelescopePreviewBorder"] = { fg = "#4A5057" },
--           ["TelescopePreviewTitle"] = { link = "Blue" },
--           ["TelescopePromptBorder"] = { fg = "#4A5057" },
--           ["TelescopePromptTitle"] = { link = "Blue" },
--           ["TelescopeResultsBorder"] = { fg = "#4A5057" },
--           ["TelescopeResultsTitle"] = { link = "Blue" },
--           ["CmpItemKindCopilot"] = { fg = "#6CC644" },
--           ["NoiceLspProgressSpinner"] = { bg = "#1C1C2A" },
--           ["NoiceLspProgressClient"] = { bg = "#1C1C2A" },
--           ["NoiceLspProgressTitle"] = { bg = "#1C1C2A" },
--           ["NoiceMini"] = { bg = "#1C1C2A" },
--           ["NoiceCmdlineIconSearch"] = { link = "Blue" },
--         }
--       end,
--     },
--     config = function(_, opts)
--       require("tokyodark").setup(opts)
--       require("tokyodark").colorscheme()
--     end,
--   }
-- }


-- return {
--   {
--     "ellisonleao/gruvbox.nvim",
--     priority = 1000,
--     lazy = false,
--     config = function ()
--
--       local gruvbox = require("gruvbox")
--
--       gruvbox.setup({
--         terminal_colors = false, -- add neovim terminal colors
--         undercurl = false,
--         underline = false,
--         bold = true,
--         italic = {
--           strings = false,
--           emphasis = false,
--           comments = false,
--           operators = false,
--           folds = true,
--         },
--         strikethrough = true,
--         invert_selection = false,
--         invert_signs = false,
--         invert_tabline = false,
--         invert_intend_guides = false,
--         inverse = true, -- invert background for search, diffs, statuslines and errors
--         contrast = "hard", -- can be "hard", "soft" or empty string
--         palette_overrides = {},
--         overrides = {},
--         dim_inactive = false,
--         transparent_mode = false,
--       })
--
--       vim.o.background = "dark"
--       vim.cmd.colorscheme("gruvbox")
--     end
--
--   }
-- }


-- return {
--   {
--     "scottmckendry/cyberdream.nvim",
--     lazy = false,
--     priority = 1000,
--     config = function()
--       local colors = require("cyberdream.colors")
--       local t = colors.default
--       require("cyberdream").setup({
--         -- Recommended - see "Configuring" below for more config options
--
--
--         transparent = true,
--         italic_comments = false,
--         hide_fillchars = true,
--         borderless_telescope = true,
--         terminal_colors = true,
--
--         theme = {
--           highlights = {
--             Identifier = { fg = t.orange }
--           }
--         }
--       })
--       vim.cmd.colorscheme("cyberdream") -- set the colorscheme
--     end,
--
--   }
-- }

return {
  {
    "EdenEast/nightfox.nvim",
    priority = 1000,
    config = function ()
      local nightfox = require("nightfox")

      nightfox.setup({
        terminal_colors = false,
        dim_inactive = false,

        styles = {               -- Style to be applied to different syntax groups
          comments = "NONE",     -- Value is any valid attr-list value `:help attr-list`
          conditionals = "NONE",
          constants = "NONE",
          functions = "NONE",
          keywords = "NONE",
          numbers = "NONE",
          operators = "NONE",
          strings = "NONE",
          types = "NONE",
          variables = "NONE",
        },

        palettes = {
          nightfox = {
            -- bg1 = "#091017",
            -- bg0 = "#091017"
            bg1 = "#00080c",
            bg0 = "#00080c"
          },
          carbonfox = {
            bg1 = "#00090e",
            bg0 = "#00090e"
          }
        }
      })

      vim.cmd.colorscheme("nightfox")
    end
  }
}
