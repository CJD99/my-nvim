return {
  "HiPhish/rainbow-delimiters.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function ()
    local rainbow_delimiters = require('rainbow-delimiters')

    vim.g.rainbow_delimiters = {
      query = {
        [''] = 'rainbow-delimiters',
        javascript = 'rainbow-delimiters-react'
      },

    }

  end
}
