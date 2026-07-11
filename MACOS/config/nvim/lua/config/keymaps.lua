-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua

-- Сохранить файл быстро
vim.keymap.set({ "n", "i" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save file" })

-- Переключение между окнами без Ctrl-W
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go to lower window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go to upper window" })

-- Выбор venv (для uv проектов — нужно запускать из корня проекта)
vim.keymap.set("n", "<leader>cv", "<cmd>VenvSelect<cr>", { desc = "Select Python venv" })

if vim.g.vscode then
  local vscode = require("vscode")
  vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })
  vim.g.mapleader = " "

  vim.keymap.set("n", "<leader>f", function()
    vscode.action("workbench.action.quickOpen")
  end)
  vim.keymap.set("n", "<leader>/", function()
    vscode.action("workbench.action.findInFiles")
  end)
  vim.keymap.set("n", "<leader>e", function()
    vscode.action("workbench.action.toggleSidebarVisibility")
  end)
end
