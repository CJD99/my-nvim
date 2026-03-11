return {
  'stevearc/conform.nvim',
  event = 'LspAttach',
  opts = {
    quiet = true,
    formatters_by_ft = {
      typescript = {'prettier'},
      typescriptreact = {'prettier'},
      javascript = {'prettier'},
      javascriptreact = {'prettier'},
      html = {'prettier'},
      css = {'prettier'},
      scss = {'prettier'},
      markdown = {'prettier'},
      yaml = {'prettier'},
      graphql = {'prettier'},
      vue = {'prettier'},
      angular = {'prettier'},
      less = {'prettier'},
      flow = {'prettier'},
      sh = {'beautysh'},
      bash = {'beautysh'},
      zsh = {'beautysh'},
      http = {'kulala-fmt'},
      php = {'php'}
    },
    formatters = {
      php = {
        command = "php-cs-fixer",
        args = {
          "fix",
          "--rules=@PSR12", -- Formatting preset. Other presets are available, see the php-cs-fixer docs.
          "$FILENAME",
        },
        stdin = false,
        stout = false
      },
    },
    format_on_save = false
  },
  config = function(_, opts)
    local conform = require('conform')
    conform.setup(opts)

    -- Customize prettier args
    require('conform.formatters.prettier').args = function(_, ctx)
      local prettier_roots = {'.prettierrc', '.prettierrc.json', 'prettier.config.js'}
      local args = {'--stdin-filepath', '$FILENAME'}
      local config_path = vim.fn.stdpath('config')

      local localPrettierConfig = vim.fs.find(prettier_roots, {
        upward = true,
        path = ctx.dirname,
        type = 'file',
      })[1]
      local globalPrettierConfig = vim.fs.find(prettier_roots, {
        path = type(config_path) == 'string' and config_path or config_path[1],
        type = 'file',
      })[1]
      local disableGlobalPrettierConfig = os.getenv('DISABLE_GLOBAL_PRETTIER_CONFIG')

      -- Project config takes precedence over global config
      if localPrettierConfig then
        vim.list_extend(args, {'--config', localPrettierConfig})
      elseif globalPrettierConfig and not disableGlobalPrettierConfig then
        vim.list_extend(args, {'--config', globalPrettierConfig})
      end

      local hasTailwindPrettierPlugin = vim.fs.find('node_modules/prettier-plugin-tailwindcss', {
        upward = true,
        path = ctx.dirname,
        type = 'directory',
      })[1]

      if hasTailwindPrettierPlugin then
        vim.list_extend(args, {'--plugin', 'prettier-plugin-tailwindcss'})
      end

      return args
    end

    conform.formatters.beautysh = {
      prepend_args = function()
        return {'--indent-size', '4', '--force-function-style', 'fnpar'}
      end,
    }
  end,
}
