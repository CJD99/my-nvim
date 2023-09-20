local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
  'wbthomason/packer.nvim',

  -- themes
  'ellisonleao/gruvbox.nvim',
  { 'rebelot/kanagawa.nvim', name = 'kanagawa' },
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  { 'Shatur/neovim-ayu', name = 'ayu' },

  -- nvim tree
  'nvim-tree/nvim-tree.lua',
  'nvim-tree/nvim-web-devicons',

  -- lualine
  'nvim-lualine/lualine.nvim',

  -- highlight
  'nvim-treesitter/nvim-treesitter',
  'bluz71/vim-nightfly-colors',

  -- git signs
  'lewis6991/gitsigns.nvim',

  -- comment
  {
    'numToStr/Comment.nvim',
    opts = {
			-- add any options here
	},
	lazy = false,
  },

  -- completion
  'VonHeikemen/lsp-zero.nvim',
  'hrsh7th/nvim-cmp',
  'hrsh7th/cmp-nvim-lsp',
  'L3MON4D3/LuaSnip',
  'saadparwaiz1/cmp_luasnip',
  "rafamadriz/friendly-snippets",
  "github/copilot.vim",
  "williamboman/mason.nvim",
  "neovim/nvim-lspconfig",
  "williamboman/mason-lspconfig.nvim",
  "glepnir/lspsaga.nvim",
  {
	  'nvim-telescope/telescope.nvim',
	  tag = '0.1.0',
	  dependencies = { {'nvim-lua/plenary.nvim'} }
  }

}

local opts = {}

require("lazy").setup(plugins, opts)

