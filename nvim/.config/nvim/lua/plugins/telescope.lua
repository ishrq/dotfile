return {
  -- https://github.com/nvim-telescope/telescope.nvim
  {
    'nvim-telescope/telescope.nvim',
    cond = vim.fn.hostname() == "pop-os",
    cmd = 'Telescope',
    lazy = true,
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
    keys = {
      -- { '<leader>fd', function() require('telescope.builtin').fd() end, desc='Find file' },
      -- { '<leader>rg', function() require('telescope.builtin').live_grep() end, desc='Grep' },
      { '<leader>gc', function() require('telescope.builtin').git_commits() end, desc='Git commits' },
      { '<leader>gs', function() require('telescope.builtin').git_status() end, desc='Git status' },
      { '<leader>b', function() require('telescope.builtin').buffers() end, desc='Buffers' },
      { '<leader>j', function() require('telescope.builtin').jumplist() end, desc='Jumplist' },
      { '<leader>k', function() require('telescope.builtin').keymaps() end, desc='Keymaps' },
      { '<leader>mn', function() require('telescope.builtin').man_pages() end, desc='Man Pages' },
      { '<leader>Q', function() require('telescope.builtin').diagnostics() end, desc='Diagnostics' },
      { '<leader>y', function() require('telescope.builtin').registers() end, desc='Registers' },
      { '<leader>1', function() require('telescope.builtin').oldfiles() end, desc='Recent files' },
      { '<leader>2', function() require('telescope.builtin').resume() end, desc='Resume Telescope' },
    },
  },
}
