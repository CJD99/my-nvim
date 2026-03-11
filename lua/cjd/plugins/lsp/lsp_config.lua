return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "antosha417/nvim-lsp-file-operations", config = true },
  },
  config = function()
    -- import lspconfig plugin
    local util = require("lspconfig/util")

    -- import cmp-nvim-lsp plugin
    local cmp_nvim_lsp = require("cmp_nvim_lsp")

    local keymap = vim.keymap -- for conciseness

    local function camel_to_snake()
      local variable_name = vim.fn.expand("<cword>")

      local snake_name = variable_name:gsub("([a-z])([A-Z])", "%1_%2"):lower()

      vim.lsp.buf.rename(snake_name)

      vim.cmd("write")
    end


    local opts = { noremap = true, silent = true }
    local on_attach = function(client, bufnr)
      opts.buffer = bufnr

      client.server_capabilities.documentFormattingProvider = false
      client.server_capabilities.documentRangeFormattingProvider = false

      -- if client.name == "ruff" then
      --   -- Disable hover in favor of pyright
      --   client.server_capabilities = nil
      -- end

      -- set keybinds
      opts.desc = "Show LSP references"
      keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references

      opts.desc = "Go to declaration"
      keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

      opts.desc = "Show LSP definitions"
      keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions

      opts.desc = "Show LSP implementations"
      keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations

      opts.desc = "Show LSP type definitions"
      keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

      opts.desc = "See available code actions"
      keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

      opts.desc = "Smart rename"
      keymap.set("n", "<F2>", vim.lsp.buf.rename, opts) -- smart rename

      opts.desc = "Camel to Snake"
      keymap.set("n", "<leader>cts", camel_to_snake, opts) -- smart rename

      opts.desc = "Smart rename"
      vim.api.nvim_set_keymap('n', '<leader>cts', ':lua rename_to_snake_case()<CR>', { noremap = true, silent = true })

      opts.desc = "Show buffer diagnostics"
      keymap.set("n", "<leader>d", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

      opts.desc = "Show project diagnostics"
      keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics<CR>", opts) -- show  diagnostics for file

      opts.desc = "Show line diagnostics"
      keymap.set("n", "<leader>pd", vim.diagnostic.open_float, opts) -- show diagnostics for line

      opts.desc = "Go to previous diagnostic"
      keymap.set("n", "[d", function() vim.diagnostic.jump({count=-1, float=true}) end, opts) -- jump to previous diagnostic in buffer

      opts.desc = "Go to next diagnostic"
      keymap.set("n", "]d", function () vim.diagnostic.jump({count=1, float=true}) end, opts) -- jump to next diagnostic in buffer

      opts.desc = "Show documentation for what is under cursor"
      keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

      opts.desc = "Restart LSP"
      keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
    end

    -- used to enable autocompletion (assign to every lsp server config)
    local capabilities = cmp_nvim_lsp.default_capabilities()



    -- capabilities.workspace.didChangeWatchedFiles.dynamicRegistration = true -- update golang modules

    -- Change the Diagnostic symbols in the sign column (gutter)
    -- (not in youtube nvim video)
    local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    -- configure html server
    vim.lsp.config("html", {
      capabilities = capabilities,
      on_attach = on_attach,
    })

    vim.lsp.config("pylsp", {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = {
        pylsp = {
          plugins = {
            pycodestyle = {
              enabled = false,
            },
            pylint = {
              enabled = false,
            },
            ruff = {
              enabled = true,
              config = vim.env.RUFF_CONFIG,
            },
          },
        },
      },
    })

    vim.env.RUFF_CONFIG = "/home/cjd/.config/nvim/ruff/ruff.toml"
    vim.lsp.config("ruff", {
      capabilities = capabilities,
      on_attach = on_attach,
      init_options = {
        settings = {
          configPath = vim.env.RUFF_CONFIG,
          configuration = vim.env.RUFF_CONFIG,
          configurationPreference = "editorOnly",
          logLevel = "debug",
        }

      },
      settings = {
        ruff = {
          configPath = vim.env.RUFF_CONFIG,
          configuration = vim.env.RUFF_CONFIG,
          configurationPreference = "editorOnly",
          logLevel = "debug",
        }
      }
    })

    -- lspconfig["ruff"].setup({
    --   init_options = {
    --     settings = {
    --       positionEncodings = { "utf-16" },
    --     }
    --   },
    --   capabilities = {
    --     positionEncodings = { "utf-16" },
    --     general = {
    --       positionEncodings = { "utf-16" },
    --     }
    --   },
    --   on_attach = on_attach,
    -- })

    -- configure typescript server with plugin
    vim.lsp.config("ts_ls", {
      capabilities = capabilities,
      on_attach = on_attach,
      filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" }
    })

    vim.lsp.config("eslint", {
      capabilities = capabilities,
      on_attach = on_attach,
      filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" }
    })

    vim.lsp.config("eslint_d", {
      capabilities = capabilities,
      on_attach = on_attach,
      filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" }
    })

    vim.lsp.config("ast_grep", {
      capabilities = capabilities,
      on_attach = on_attach,
      filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" }
    })

    -- configure css server
    vim.lsp.config("cssls", {
      capabilities = capabilities,
      on_attach = on_attach,
    })

    -- configure tailwindcss server
    vim.lsp.config("tailwindcss", {
      capabilities = capabilities,
      on_attach = on_attach,
    })

    -- configure svelte server
    vim.lsp.config("svelte", {
      capabilities = capabilities,
      on_attach = function(client, bufnr)
        on_attach(client, bufnr)

        vim.api.nvim_create_autocmd("BufWritePost", {
          pattern = { "*.js", "*.ts" },
          callback = function(ctx)
            if client.name == "svelte" then
              client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.file })
            end
          end,
        })
      end,
    })

    -- configure prisma orm server
    vim.lsp.config("prismals", {
      capabilities = capabilities,
      on_attach = on_attach,
    })

    -- configure graphql language server
    vim.lsp.config("graphql", {
      capabilities = capabilities,
      on_attach = on_attach,
      filetypes = { "graphql", "gql", "svelte", "typescriptreact", "javascriptreact" },
    })

    -- configure emmet language server
    vim.lsp.config("emmet_ls", {
      capabilities = capabilities,
      on_attach = on_attach,
      filetypes = { "php", "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
    })

    -- configure python server
    -- vim.lsp.config("pyright", {
    --   capabilities = capabilities,
    --   on_attach = on_attach,
    -- })

    -- configure golang server
    vim.lsp.config("gopls", {
      capabilities = capabilities,
      on_attach = on_attach,
      cmp = { "gopls" },
      filetypes = { "go", "gomod", "gowork", "gotmpl" },
      root_dir = util.root_pattern("go.work", "go.mod", ".git"),
      settings = {
        gopls = {
          completeUnimported = true,
          usePlaceholders = true,
          analyses = {
            unusedparams = true,
          },
        },
      },
    })

    -- configure sql server
    vim.lsp.config("sqlls", {
      capabilities = capabilities,
      on_attach = on_attach,
      filetypes = { 'sql' },
      root_dir = function(_)
        return vim.loop.cwd()
      end,
    })

    -- configure json server
    vim.lsp.config("jsonls", {
      capabilities = capabilities,
      on_attach = on_attach,
    })

    -- configure docker server
    vim.lsp.config("dockerls", {
      capabilities = capabilities,
      on_attach = on_attach,
    })

    -- configure xml server
    vim.lsp.config("lemminx", {
      capabilities = capabilities,
      on_attach = on_attach,
      filetypes = { 'xml' },
      root_dir = function(_)
        return vim.loop.cwd()
      end,
    })

    -- configure lua server (with special settings)
    vim.lsp.config("lua_ls", {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = { -- custom settings for lua
        Lua = {
          -- make the language server recognize "vim" global
          diagnostics = {
            globals = { "vim" },
          },
          workspace = {
            -- make language server aware of runtime files
            library = {
              [vim.fn.expand("$VIMRUNTIME/lua")] = true,
              [vim.fn.stdpath("config") .. "/lua"] = true,
            },
          },
        },
      },
    })

    vim.lsp.config("phpactor", {
      capabilities = capabilities,
      on_attach = on_attach,
    })

    vim.lsp.config("psalm", {
      capabilities = capabilities,
      on_attach = on_attach
    })

    vim.lsp.config("intelephense", {
      capabilities = capabilities,
      on_attach = on_attach,
    })

    vim.lsp.config("volar", {
      capabilities = capabilities,
      on_attach = on_attach,
    })

    vim.diagnostic.config({
      underline = false,
      virtual_text = false
    })
  end,
}
