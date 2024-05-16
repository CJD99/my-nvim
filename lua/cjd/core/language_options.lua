-- language related stuff
vim.api.nvim_create_autocmd({'BufReadPre', 'BufEnter', 'BufNewFile'}, {
  pattern = { "*" },
  callback = function(args)
    local ft = vim.bo[args.buf].filetype
    if ft == "python" then
      require("cjd.core.languages.python")

    elseif ft == "go" then
      require("cjd.core.languages.go")

    else
      require("cjd.core.languages.general")

    end

  end
})

