-- Author: IA

-- https://nanotipsforvim.prose.sh/using-pcall-to-make-your-config-more-stable
local function safeRequire(module)
  local success, loadedModule = pcall(require, module)
  if success then return loadedModule end
  vim.cmd.echo ("Error loading " .. module)
end

safeRequire('options')
safeRequire('keymaps')
safeRequire('autocmd')

-- Install lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--single-branch",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end
vim.opt.runtimepath:prepend(lazypath)

require("lazy").setup({
  spec = { { import = "plugins" }, },
  checker = { enabled = true },
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        -- "matchit",
        -- "matchparen",
        -- "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})
