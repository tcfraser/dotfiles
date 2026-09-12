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

map("n", "<S-l>", "<cmd>BufferLineCycleNext<CR>", { desc = "Next buffer" })
map("n", "<S-h>", "<cmd>BufferLineCyclePrev<CR>", { desc = "Previous buffer" })

map("n", "<leader>bd", "<cmd>bdelete<CR>", { desc = "Delete buffer" })



map("n", "gd", vim.lsp.buf.definition)
map("n", "gD", vim.lsp.buf.declaration)
map("n", "gr", vim.lsp.buf.references)
map("n", "K", vim.lsp.buf.hover)

map("n", "<leader>rn", vim.lsp.buf.rename)
map("n", "<leader>ca", vim.lsp.buf.code_action)

map("n", "]d", vim.diagnostic.goto_next)
map("n", "[d", vim.diagnostic.goto_prev)

-- Space d toggles diagnostic displays in all buffers without stopping the LSP.
vim.diagnostic.enable(false)
map("n", "<leader>d", function()
  vim.diagnostic.enable(not vim.diagnostic.is_enabled())
end, { desc = "Toggle diagnostics" })

-- Clear leftover decorations when switching buffers or displaying them in a split.
vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
  group = vim.api.nvim_create_augroup("HiddenDiagnostics", { clear = true }),
  callback = function(event)
    if not vim.diagnostic.is_enabled({ bufnr = event.buf }) then
      vim.diagnostic.hide(nil, event.buf)
    end
  end,
})
