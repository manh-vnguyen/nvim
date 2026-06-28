require("config.lazy")
require("config.lsp")

-- Map switch to directory view
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Line numbers
vim.opt.relativenumber = true
vim.opt.number = true

-- Tabs and indentation
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

-- Wrap long lines at word boundaries
vim.opt.linebreak = true

-- Keep cursor centered when scrolling
vim.keymap.set("n", "<C-u>", "<C-u>zz", { noremap = true, silent = true })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { noremap = true, silent = true })

