return {
  -- https://github.com/nvim-telescope/telescope.nvim
  {
    'nvim-telescope/telescope.nvim',
    cond = vim.fn.hostname() == "pop-os",
    event = 'VeryLazy',
    cmd = 'Telescope',
    dependencies = {
      'nvim-lua/plenary.nvim',
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
        event = 'VeryLazy'
      },
      {
        'debugloop/telescope-undo.nvim',
        event = 'VeryLazy'
      },
    },
    opts = {
      defaults = {
        layout_strategy = 'flex',
        prompt_position = 'bottom',
        preview_height = '0.8',
        preview_width = '0.7',
        sorting_strategy = 'ascending',
        winblend = 0,
      },
    },
    config = function()
      require('telescope').load_extension('fzf')
      require('telescope').load_extension('undo')
      vim.keymap.set('n', '<leader>u', '<cmd>Telescope undo<cr>', {desc='Telescope Undo'})
    end,
    keys = {
      { '<leader>fd', function() require('telescope.builtin').find_files() end, desc='Find file' },
      { '<leader>rg', function() require('telescope.builtin').live_grep() end, desc='Grep' },
      { '<leader>gf', function() require('telescope.builtin').git_files() end, desc='Git files' },
      { '<leader>gc', function() require('telescope.builtin').git_commits() end, desc='Git commits' },
      { '<leader>gs', function() require('telescope.builtin').git_status() end, desc='Git status' },
      { '<leader>b', function() require('telescope.builtin').buffers() end, desc='Buffers' },
      { '<leader>j', function() require('telescope.builtin').jumplist() end, desc='Jumplist' },
      { '<leader>k', function() require('telescope.builtin').keymaps() end, desc='Keymaps' },
      { '<leader>m', function() require('telescope.builtin').marks() end, desc='Marks' },
      { '<leader>Q', function() require('telescope.builtin').diagnostics() end, desc='Diagnostics' },
      { '<leader>y', function() require('telescope.builtin').registers() end, desc='Registers' },
      { '<leader>1', function() require('telescope.builtin').oldfiles() end, desc='Recent files' },
      { 'z=', function() require('telescope.builtin').spell_suggest() end, desc='Spell Suggestions ' },
    },
  },
}
