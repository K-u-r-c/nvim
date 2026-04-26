-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, { desc = "LSP Rename" })

local opts = { noremap = true, silent = true, nowait = true }

vim.keymap.set("i", "<M-b>", "<C-o>b", opts)
vim.keymap.set("i", "<M-f>", "<C-o>w", opts)

vim.keymap.set("n", "<M-b>", "b", opts)
vim.keymap.set("n", "<M-f>", "w", opts)

vim.keymap.set("v", "<M-b>", "b", opts)
vim.keymap.set("v", "<M-f>", "w", opts)
