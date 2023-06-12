return {
    --Colorscheme: https://github.com/rebelot/kanagawa.nvim
    {
        'rebelot/kanagawa.nvim',
        name = 'kanagawa',
        config = function ()
            require('kanagawa').setup{
                dimInactive = true,
                colors = {
                    theme = {
                        all = {
                            ui = {
                                bg_gutter = "none",
                            }
                        }
                    }
                },
                overrides = function(colors)
                    local theme = colors.theme
                    return {
                        NormalFloat = { bg = "none" },
                        FloatBorder = { bg = "none" },
                        FloatTitle = { bg = "none" },

                        NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },

                        -- Popular plugins that open floats will link to NormalFloat by default;
                        -- set their background accordingly if you wish to keep them dark and borderless
                        LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
                        MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
                    }
                end,
                theme = "dragon", --available: dragon, wave, lotus
                background = {
                    dark = "dragon",
                    light = "lotus"
                },
            }
            vim.cmd.colorscheme('kanagawa')
        end
    }
}
