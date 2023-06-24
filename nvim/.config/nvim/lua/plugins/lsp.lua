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
    opts = {
      diagnostics = {
        underline = true,
        update_in_inset = false,
        severity_sort = true,
        virtual_text = { spacing = 4, source = 'if_many', prefix = '●' },
      },
      capabilities = {},
      autoformat = true,
      format_notify = false,
      format = { formatting_options = nil, timeout_ms = nil, },

      -- Language server setup
      servers = {
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
          settings = {
            Lua = {
              runtime = { version = 'LuaJIT', },
              diagnostics = { globals = {'vim'}, },
              workspace = { library = vim.api.nvim_get_runtime_file('', true), },
              telemetry = { enable = false, },
            },
          },
        },
      }
    },
    -- setup = {},
    config = function ()
      local lspconfig = require('lspconfig')

      local lsp_defaults = lspconfig.util.default_config
      lsp_defaults.capabilities = vim.tbl_deep_extend( 'force', lsp_defaults.capabilities, require('cmp_nvim_lsp').default_capabilities())

      --Enable (broadcasting) snippet capability for completion
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities.textDocument.completion.completionItem.snippetSupport = true

      -- Map keys after lsp attaches to current buffer
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('UserLspConfig', {}),
        callback = function(ev)
          -- Enable completion triggered by <c-x><c-o>
          vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

          local opts = { buffer = ev.buf }
          vim.keymap.set('n', ',D', vim.lsp.buf.declaration, opts, {desc="LSP Declaration"})
          vim.keymap.set('n', ',d', vim.lsp.buf.definition, opts, {desc="LSP Definition"})
          vim.keymap.set('n', ',f', function() vim.lsp.buf.format { async = true } end, opts, {desc="LSP Format"})
          vim.keymap.set('n', ',h', vim.lsp.buf.hover, opts, {desc="LSP Hover"})
          vim.keymap.set('n', ',i', vim.lsp.buf.implementation, opts, {desc="LSP Implementation"})
          vim.keymap.set('n', ',rf', vim.lsp.buf.references, opts, {desc="LSP References"})
          vim.keymap.set('n', ',rn', vim.lsp.buf.rename, opts, {desc="LSP Rename"})
          vim.keymap.set('n', ',s', vim.lsp.buf.signature_help, opts, {desc="LSP Signature Help"})
          vim.keymap.set('n', ',td', vim.lsp.buf.type_definition, opts, {desc="LSP Type Definition"})
          vim.keymap.set({ 'n', 'v' }, ',ca', vim.lsp.buf.code_action, opts, {desc="LSP Code Action"})
          vim.keymap.set('n', ',wa', vim.lsp.buf.add_workspace_folder, opts, {desc="LSP Add Workspace Folder"})
          vim.keymap.set('n', ',wl', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, opts, {desc="LSP List Workspace Folder"})
          vim.keymap.set('n', ',wr', vim.lsp.buf.remove_workspace_folder, opts, {desc="LSP Remove Workspace Folder"})
        end,
      })
    end
  },
}
