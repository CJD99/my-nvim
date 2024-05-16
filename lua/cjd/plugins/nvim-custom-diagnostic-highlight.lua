return {
  {
    "Kasama/nvim-custom-diagnostic-highlight",
    event = { "BufReadPre", "BufNewFile" },

    config = function ()
      local custom_highlight = require("nvim-custom-diagnostic-highlight")

      custom_highlight.setup {}

    end

  }
}
