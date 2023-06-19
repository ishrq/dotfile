return{
  -- https://github.com/tzachar/highlight-undo.nvim
  {
    'tzachar/highlight-undo.nvim',
    event = 'VeryLazy',
    config = true
  },
  -- https://github.com/norcalli/nvim-colorizer.lua
  {
    'NvChad/nvim-colorizer.lua',
    ft = {'html','css','js','lua'},
    cmd = 'Colorizer',
    config = true
  },
}
