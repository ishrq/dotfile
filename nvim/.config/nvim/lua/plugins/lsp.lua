return {
  -- https://github.com/neovim/nvim-lspconfig
  {
    'neovim/nvim-lspconfig',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
      {
        'hrsh7th/cmp-nvim-lsp',
        event = 'VeryLazy'
      },
      {
        'williamboman/mason-lspconfig.nvim',
        dependencies = {
          'williamboman/mason.nvim',
          config = true
        },
        config = function ()
          ensure_installed = {
            'bash-language-server',
            'black',
            'clangd',
            'codespell',
            'cssls',
            'deno',
            'html-lsp',
            'lua-language-server',
            'marksman',
            'pyright',
            'stylua',
            'tail-wind-css',
            'write-good',
          }
        end,
      },
    },
    config = function ()
      --  Run on LSP attach
      local on_attach = function(_, bufnr)
        local map = function(keys, func, desc)
          if desc then
            desc = "LSP: " .. desc
          end

          vim.keymap.set(mode, keys, func, { buffer = bufnr, desc = desc })
        end

        map({ 'n', 'v' }, ',ca', vim.lsp.buf.code_action, "Code Action")

        map('n', ',rn', vim.lsp.buf.rename, "Rename")
        map('n', ',gd', vim.lsp.buf.definition, "Goto Definition")
        map('n', ',gD', vim.lsp.buf.declaration, "Goto Declaration")
        map('n', ',gr', vim.lsp.buf.references, "Goto References")
        map('n', ',gi', vim.lsp.buf.implementation, "Goto Implementation")
        map('n', ',td', vim.lsp.buf.type_definition, "Type Definition")

        map('n', 'K', vim.lsp.buf.hover, "Hover Documentation")
        map('n', '<C-k>', vim.lsp.buf.signature_help, "Signature Documentation")
        map('n', '<C-f>', function() vim.lsp.buf.format { async = true } end, "Format")

        map('n', ',wa', vim.lsp.buf.add_workspace_folder, "Workspace Add Folder")
        map('n', ',wr', vim.lsp.buf.remove_workspace_folder, "Workspace Remove Folder")
        map('n', ',wl', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, "Workspace List Folder")

        -- Create command `:Format` local to the LSP buffer
        vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_)
          vim.lsp.buf.format()
        end, { desc = "Format current buffer with LSP" })
      end

      -- Enable language servers
      local lsp_servers = {
        bashls = {},
        clangd = {},
        cssls = {},
        denols = {},
        html = {},
        marksman = {},
        tailwindcss = {},
        -- psalm = {},
        pyright = {},
        -- gopls = {},
        -- sqlls = {},

        lua_ls = {
          Lua = {
            runtime = { version = 'LuaJIT', },
            diagnostics = { globals = {'vim'}, },
            workspace = { library = vim.api.nvim_get_runtime_file('', true), },
            telemetry = { enable = false, },
          },
        },
      }

      -- nvim-cmp additional completion capabilities
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

      -- Edit lsp diagnostics signs (in margin)
      local signs = { Error = "󰅚 ", Warn = "󰀪 ", Hint = "󰌶 ", Info = "󰋽 " }
      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
      end

      -- Edit inline diagnostic preferences
      vim.diagnostic.config({
        virtual_text = {
          prefix = "",
        },
        severity_sort = true,
        float = {
          source = "always",
        },
      })
    end
  }
}
