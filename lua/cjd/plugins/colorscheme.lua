-- return { {
--     'AlexvZyl/nordic.nvim',
--     lazy = false,
--     priority = 1000,
--     config = function()
--       require('nordic').setup({
--         transparent = {
--           bg = true,
--         }
--
--       })
--       require('nordic').load()
--       vim.cmd.colorscheme("nordic")
--     end
--   }
-- }


-- return {
--   {
--     "EdenEast/nightfox.nvim",
--     priority = 1000,
--     config = function ()
--       local nightfox = require("nightfox")
--
--       nightfox.setup({
--         terminal_colors = false,
--         dim_inactive = false,
--
--         styles = {               -- Style to be applied to different syntax groups
--           comments = "NONE",     -- Value is any valid attr-list value `:help attr-list`
--           conditionals = "NONE",
--           constants = "NONE",
--           functions = "NONE",
--           keywords = "NONE",
--           numbers = "NONE",
--           operators = "NONE",
--           strings = "NONE",
--           types = "NONE",
--           variables = "NONE",
--         },
--
--         palettes = {
--           nightfox = {
--             -- bg1 = "#091017",
--             -- bg0 = "#091017"
--             bg1 = "#000805",
--             bg0 = "#000805"
--           },
--           carbonfox = {
--             bg1 = "#00090e",
--             bg0 = "#00090e"
--           }
--         }
--       })
--
--       vim.cmd.colorscheme("nightfox")
--     end
--   }
-- }

-- return {
--   {
--     "rose-pine/neovim",
--     name = "rose-pine",
--     priority = 1000,
--     config = function()
--       require("rose-pine").setup({
--         variant = "main", -- auto, main, moon, or dawn
--         dark_variant = "main", -- main, moon, or dawn
--         dim_inactive_windows = false,
--         extend_background_behind_borders = true,
--
--         enable = {
--           terminal = true,
--           legacy_highlights = true, -- Improve compatibility for previous versions of Neovim
--           migrations = true, -- Handle deprecated options automatically
--         },
--
--         styles = {
--           bold = false,
--           italic = false,
--           transparency = true,
--         },
--
--         groups = {
--           border = "muted",
--           link = "iris",
--           panel = "surface",
--
--           error = "love",
--           hint = "iris",
--           info = "foam",
--           note = "pine",
--           todo = "rose",
--           warn = "gold",
--
--           git_add = "foam",
--           git_change = "rose",
--           git_delete = "love",
--           git_dirty = "rose",
--           git_ignore = "muted",
--           git_merge = "iris",
--           git_rename = "pine",
--           git_stage = "iris",
--           git_text = "rose",
--           git_untracked = "subtle",
--
--           h1 = "iris",
--           h2 = "foam",
--           h3 = "rose",
--           h4 = "gold",
--           h5 = "pine",
--           h6 = "foam",
--         },
--
--         palette = {
--         -- Override the builtin palette per variant
--         -- moon = {
--         --     base = '#18191a',
--         --     overlay = '#363738',
--         -- },
--         },
--
--         highlight_groups = {
--         -- Comment = { fg = "foam" },
--         -- VertSplit = { fg = "muted", bg = "muted" },
--         },
--
--         before_highlight = function(group, highlight, palette)
--         -- Disable all undercurls
--         -- if highlight.undercurl then
--         --     highlight.undercurl = false
--         -- end
--         --
--         -- Change palette colour
--         -- if highlight.fg == palette.pine then
--         --     highlight.fg = palette.foam
--         -- end
--         end,
--       })
--
--       vim.cmd.colorscheme("rose-pine")
--     end
--   }
-- }

-- return {
--   {
--     "navarasu/onedark.nvim",
--     priority = 1000,
--     config = function ()
--       local onedark = require("onedark")
--
--       onedark.setup({
--         style = 'darker', -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
--         transparent = true,  -- Show/hide background
--         term_colors = true, -- Change terminal color as per the selected theme style
--         ending_tildes = false, -- Show the end-of-buffer tildes. By default they are hidden
--         cmp_itemkind_reverse = false, -- reverse item kind highlights in cmp menu
--
--         -- toggle theme style ---
--         toggle_style_key = nil, -- keybind to toggle theme style. Leave it nil to disable it, or set it to a string, for example "<leader>ts"
--         toggle_style_list = {'dark', 'darker', 'cool', 'deep', 'warm', 'warmer', 'light'}, -- List of styles to toggle between
--
--         -- Change code style ---
--         -- Options are italic, bold, underline, none
--         -- You can configure multiple style with comma separated, For e.g., keywords = 'italic,bold'
--         code_style = {
--             comments = 'none',
--             keywords = 'none',
--             functions = 'none',
--             strings = 'none',
--             variables = 'none'
--         },
--
--         -- Lualine options --
--         lualine = {
--             transparent = false, -- lualine center bar transparency
--         },
--
--         -- Custom Highlights --
--         colors = {}, -- Override default colors
--         highlights = {}, -- Override highlight groups
--
--         -- Plugins Config --
--         diagnostics = {
--             darker = true, -- darker colors for diagnostic
--             undercurl = true,   -- use undercurl instead of underline for diagnostics
--             background = true,    -- use background color for virtual text
--         },
--       })
--
--       vim.cmd.colorscheme("onedark")
--
--     end
--   }
-- }

-- return {
--   {
--     "sainnhe/sonokai",
--     lazy = false,
--       priority = 1000,
--       config = function()
--         -- Optionally configure and load the colorscheme
--         -- directly inside the plugin declaration.
--         vim.g.sonokai_enable_italic = false
--         vim.g.sonokai_transparent_background = true
--         vim.cmd.colorscheme('sonokai')
--       end
--   }
-- }

return {
  {
    "tiagovla/tokyodark.nvim",
    opts = {
      transparent_background = true, -- set background to transparent
      gamma = 1.00, -- adjust the brightness of the theme
      styles = {
          comments = { italic = false }, -- style for comments
          keywords = { italic = false }, -- style for keywords
          identifiers = { italic = false }, -- style for identifiers
          functions = {}, -- style for functions
          variables = {}, -- style for variables
      },
      -- custom_highlights = {} or function(highlights, palette) return {} end, -- extend highlights
      -- custom_palette = {} or function(palette) return {} end, -- extend palette
      terminal_colors = true, -- enable terminal colors
    },
    config = function(_, opts)
        require("tokyodark").setup(opts) -- calling setup is optional
        vim.cmd.colorscheme("tokyodark")
    end,
  }
}
