vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.keymap.set

-- Move through visual lines when text is wrapped
map({ "n", "x" }, "j", "gj")
map({ "n", "x" }, "k", "gk")
map({ "n", "x" }, "0", "g0")
map({ "n", "x" }, "$", "g$")

-- Window navigation
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")

-- Clear search highlighting
map("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Convenient save
map("n", "<leader>w", "<cmd>write<CR>")

map("n", "]b", "<cmd>BufferLineCycleNext<CR>", { desc = "Next buffer" })
map("n", "[b", "<cmd>BufferLineCyclePrev<CR>", { desc = "Previous buffer" })

map("n", "<leader>bd", "<cmd>bdelete<CR>", { desc = "Delete buffer" })
