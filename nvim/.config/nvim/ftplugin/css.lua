-- Indent 2 spaces
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2

-- Toggle !important
-- https://nanotipsforvim.prose.sh/toggle-important-in-css
vim.keymap.set("n", "<leader>i", function ()
  local lineContent = vim.fn.getline('.')
  if lineContent:find("!important") then
    lineContent = lineContent:gsub(" !important", "")
  else
    lineContent = lineContent:gsub(";", " !important;")
  end
  vim.fn.setline(".", lineContent)
end)
