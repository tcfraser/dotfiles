-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = false

-- Wrapped lines
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.breakindent = true
vim.opt.showbreak = "⤷ "

-- Indentation
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.smartindent = true

-- Searching
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep some context around cursor
vim.opt.scrolloff = 8

-- Show whitespace
vim.opt.list = true
vim.opt.listchars = {
    tab = ">-",
    trail = "~",
    extends = "»",
    precedes = "«",
}

-- UI
vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"

-- Lualine will show the mode
vim.opt.showmode = false

-- Better split defaults
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Use system clipboard
vim.opt.clipboard = "unnamedplus"
