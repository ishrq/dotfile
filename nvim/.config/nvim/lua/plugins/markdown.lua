return {
  -- https://github.com/gaoDean/autolist.nvim
  {
    'gaoDean/autolist.nvim',
    ft = {'markdown', 'text', 'tex', 'plaintex'},
    event = 'InsertEnter',
    config = function()
      local autolist = require('autolist')
      autolist.setup()
      autolist.create_mapping_hook('i', '<CR>', autolist.new)
      -- autolist.create_mapping_hook('i', '<Tab>', autolist.indent)
      -- autolist.create_mapping_hook('i', '<S-Tab>', autolist.indent, '<C-D>')
      autolist.create_mapping_hook('n', 'o', autolist.new)
      autolist.create_mapping_hook('n', 'O', autolist.new_before)
      -- autolist.create_mapping_hook('n', '>>', autolist.indent)
      -- autolist.create_mapping_hook('n', '<<', autolist.indent)
      autolist.create_mapping_hook('n', '<C-r>', autolist.force_recalculate)
      autolist.create_mapping_hook('n', '<leader>x', autolist.invert_entry, "")
    end,
  },
  -- https://github.com/iamcco/markdown-preview.nvim
  {
    'iamcco/markdown-preview.nvim',
    ft = 'markdown',
    cmd = { 'MarkdownPreview', 'MarkdownPreviewStop', 'MarkdownPreviewToggle' },
    lazy = true,
    build = function() vim.fn['mkdp#util#install']() end,
    config = function ()
      vim.g.mkdp_auto_close = 0
      vim.g.mkdp_command_for_global = 1
      vim.g.mkdp_open_to_the_world = 1
      vim.g.mkdp_open_ip = ''
      vim.g.mkdp_port = ''
      vim.g.mkdp_markdown_css = ''
      vim.g.mkdp_highlight_css = ''
      vim.g.mkdp_theme = 'dark'
      -- vim.g.mkdp_filetypes = 'markdown'
      -- vim.g.mkdp_page_title = '「${name}」'
      -- vim.g.mkdp_browser = 'librewolf --new-tab'
    end
  },
}
