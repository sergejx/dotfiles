-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.opt.langmap = "úä[]"

local map = vim.keymap.set
map("n", "ú", "[", { remap = true })
map("n", "ä", "]", { remap = true })
map("n", "ш", "[", { remap = true })
map("n", "щ", "]", { remap = true })
