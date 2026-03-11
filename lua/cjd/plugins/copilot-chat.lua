return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "nvim-lua/plenary.nvim", branch = "master" },
    },
    build = "make tiktoken",
    opts = {
      -- See Configuration section for options
    },
    config = function(_, opts)
      vim.keymap.set(
        'n',
        '<leader>cc',
        ":CopilotChatOpen <CR>"
      )
    end,
  },
}
