-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua

-- Синхронизация буфера обмена с системой (работает везде, в т.ч. на macOS)
vim.opt.clipboard = "unnamedplus"

-- Относительные номера строк — удобно для d5j, c3k и т.д.
vim.opt.relativenumber = true

-- Ширина отступа для Python (PEP 8)
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

-- Показывать незакрытые изменения в gutter чуть быстрее
vim.opt.updatetime = 300

if vim.g.vscode then
  -- vscode-specific overrides (если что-то нужно переопределить для VS Code)
end
