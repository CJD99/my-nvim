return {
  "github/copilot.vim",
  config = function()
    vim.g.copilot_autossuggest = false; -- Enable auto suggestions
    vim.g.copilot_no_tab_map = true; -- Mapping tab to accept suggestion is disabled
    vim.g.copilot_assume_mapped = true; -- Assume that the mapping is already done

    vim.keymap.set(
      'i',
      '<C-Enter>',
      function ()
        vim.fn.feedkeys(vim.fn['copilot#Accept'](), '')
      end
    )

    vim.keymap.set(
      'i',
      '<C-s-Enter>',
      function ()
        vim.fn.feedkeys(vim.fn['copilot#Next'](), '')
      end
    )
  end
}
