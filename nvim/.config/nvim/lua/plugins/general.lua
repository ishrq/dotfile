return{
  -- https://github.com/nvim-lua/plenary.nvim
  {
    'nvim-lua/plenary.nvim',
    lazy = true,
  },
  -- https://github.com/tzachar/highlight-undo.nvim
  {
    'tzachar/highlight-undo.nvim',
    lazy = true,
    keys = {
      { 'u', 'undo', {}},
      { '<C-r>', 'redo', {}},
    },
    config = true
  },
  -- https://github.com/NvChad/nvim-colorizer.lua
  {
    'NvChad/nvim-colorizer.lua',
    cond = vim.fn.hostname() == "pop-os",
    ft = {'css'},
    cmd = 'ColorizerToggle',
    config = function ()
      require('colorizer').setup {
        user_default_options = {
          css = true,
          css_fn = true,
          tailwind = true,
        }
    }
    end
  },
}
