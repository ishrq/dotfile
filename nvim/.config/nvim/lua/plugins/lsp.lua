-- Author: IA
-- Device: PC


return {
    {
        "neovim/nvim-lspconfig",
        event = "BufReadPre",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            { 'williamboman/mason-lspconfig.nvim', dependencies = { 'williamboman/mason.nvim', config = true }, },
        },
        opts = {
            -- vim.diagnostic.config
            diagnostics = {
                underline = true,
                update_in_inset = false,
                -- virtual_text { spacing = 4, prefix = "●"},
                severity_sort = true,
            },
            -- auto format on save
            autoformat = true,
            format = {
                formatting_options = nil,
                timeout_ms = nil,
            },
        },
        config = function()
            local lspconfig = require('lspconfig')
            local lsp_defaults = lspconfig.util.default_config

            lsp_defaults.capabilities = vim.tbl_deep_extend(
            'force',
            lsp_defaults.capabilities,
            require('cmp_nvim_lsp').default_capabilities()
            )

            -- SERVER

            -- Bash
            require'lspconfig'.bashls.setup{}

            -- C
            require'lspconfig'.clangd.setup{}

            -- CSS
            require('lspconfig').cssls.setup{}

            -- Go
            require'lspconfig'.golangci_lint_ls.setup{}

            -- HTML
            require('lspconfig').html.setup{}

            -- JS
            require('lspconfig').eslint.setup{}

            -- Lua
            require'lspconfig'.lua_ls.setup {
                settings = {
                    Lua = {
                        runtime = { version = 'LuaJIT', },
                        diagnostics = { globals = {'vim'}, },
                        workspace = { library = vim.api.nvim_get_runtime_file("", true), },
                        telemetry = { enable = false, },
                    },
                },
            }


            -- Json
            -- require'lspconfig'.jsorequire("null-ls").setup{}

            -- Python
            require'lspconfig'.pylsp.setup{}

            -- Pyright
            -- require'lspconfig'.pyright.setup{}

            -- Rust
            -- require'lspconfig'.rust_analyzer.setup{}

            -- SQL
            -- require'lspconfig'.sqlls.setup{}

            -- Typescript
            require'lspconfig'.tsserver.setup{}


            -- LSP Attach

            vim.api.nvim_create_autocmd('LspAttach', {
                desc = 'LSP actions',
                callback = function()
                    local bufmap = function(mode, lhs, rhs)
                        local opts = {buffer = true}
                        vim.keymap.set(mode, lhs, rhs, opts)
                    end

                    -- Jump to declaration
                    -- bufmap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>')
                    bufmap('n', 'gD', vim.lsp.buf.declaration)

                    -- Jump to the definition
                    -- bufmap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>')
                    bufmap('n', 'gd', vim.lsp.buf.definition)

                    -- Displays hover information about the symbol under the cursor
                    -- bufmap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>')
                    bufmap('n', 'K', vim.lsp.buf.hover)

                    -- Lists all the implementations for the symbol under the cursor
                    -- bufmap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>')
                    bufmap('n', 'gi', vim.lsp.buf.implementation)

                    -- Displays a function's signature information
                    -- bufmap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<cr>')
                    bufmap('n', '<C-k>', vim.lsp.buf.signature_help)

                    -- Add workspace folder
                    bufmap('n', '<leader>wa', vim.lsp.buf.add_workspace_folder)

                    -- Remove workspace folder
                    bufmap('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder)

                    -- List workspace folders
                    bufmap('n', '<leader>wl', function()
                        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                    end)

                    -- Jumps to the definition of the type symbol
                    bufmap('n', '<leader>D', vim.lsp.buf.type_definition)

                    -- Lists all the references
                    bufmap('n', 'gr', vim.lsp.buf.references)

                    -- Renames all references to the symbol under the cursor
                    bufmap('n', '<leader>rn', vim.lsp.buf.rename)

                    -- Selects a code action available at the current cursor position
                    bufmap('n', '<leader>ca', vim.lsp.buf.code_action)

                    -- Show diagnostics in a floating window
                    bufmap('n', 'gl', vim.diagnostic.open_float)

                    -- Format
                    bufmap('n', '<leader>f', function() vim.lsp.buf.format { async = true } end)
                end
            })
        end
    },
    {
        "jose-elias-alvarez/null-ls.nvim",
        event = "BufReadPre",
        config = function()
            require("null-ls").setup {
                sources = {
                    require("null-ls").builtins.completion.spell,
                    require("null-ls").builtins.diagnostics.codespell,
                    require("null-ls").builtins.formatting.codespell,
                    require("null-ls").builtins.diagnostics.eslint_d,
                    require("null-ls").builtins.formatting.eslint_d,
                    require("null-ls").builtins.diagnostics.fish,
                    require("null-ls").builtins.formatting.fish_indent,
                    require("null-ls").builtins.diagnostics.vale,
                    require("null-ls").builtins.formatting.black,
                    require("null-ls").builtins.formatting.deno_fmt, --TODO: config later from https://deno.land/
                    require("null-ls").builtins.formatting.stylua,
                    require("null-ls").builtins.hover.dictionary
                }

            }
        end
    },
}
