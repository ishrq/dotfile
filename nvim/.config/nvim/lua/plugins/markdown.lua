return {
  -- https://github.com/iamcco/markdown-preview.nvim
  {
    'iamcco/markdown-preview.nvim',
    cond = vim.fn.hostname() == "pop-os",
    ft = 'markdown',
    cmd = { 'MarkdownPreview', 'MarkdownPreviewStop', 'MarkdownPreviewToggle' },
    lazy = true,
    build = function() vim.fn['mkdp#util#install']() end,
    keys = { { '<C-p>', '<Plug>MarkdownPreviewToggle', desc='Markdown Preview' }, },
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
