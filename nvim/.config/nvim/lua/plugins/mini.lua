return {
    -- https://github.com/echasnovski/mini.nvim
    {
        'echasnovski/mini.nvim',
        version = false,
        -- event = 'VeryLazy',
        config = function ()

            require('mini.align').setup()
            require('mini.comment').setup()
            require('mini.cursorword').setup()
            require('mini.move').setup()
            require('mini.pairs').setup()
            require('mini.splitjoin').setup()
            require('mini.statusline').setup()


            require('mini.ai').setup{
                custom_textobjects = {
                    x = { '%f[%d]%d+' }, --number
                    d = {{ '()%d%d%d%d[-|/]%d%d[-|/]%d%d()', '()%d%d[-|/]%d%d[-|/]%d%d%d%d()', }}, --date
                    u = {{ 'https://[%www.][%S]+', 'http://[%S]+' }}, --url

                    --all lines in buffer
                    g = function()
                        local from = { line = 1, col = 1 }
                        local to = { line = vim.fn.line('$'), col = math.max(vim.fn.getline('$'):len(), 1) }
                        return { from = from, to = to }
                    end,
                }
            }

            require('mini.bracketed').setup{
                file    = { suffix = '' },
                oldfile = { suffix = '' },
                undo    = { suffix = '' },
                yank    = { suffix = '' },
            }

            require('mini.indentscope').setup{
                draw = {
                    animation = require('mini.indentscope').gen_animation.none()
                },
                symbol = "│",
            }

            require('mini.jump').setup{
                delay = { idle_stop = 10 }
            }

            require('mini.surround').setup{
                mappings = {
                    add            = 'ys',
                    delete         = 'ds',
                    find           = 's',
                    find_left      = 'S',
                    highlight      = '',
                    replace        = 'cs',
                    update_n_lines = '',
                    suffix_last    = 'l',
                    suffix_next    = 'n',
                },
            }
        end
    }
}
