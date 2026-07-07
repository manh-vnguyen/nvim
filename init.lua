vim.g.mapleader = " "

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

require("config.lazy")
require("config.lsp")

-- Map switch to directory view
-- vim.keymap.set("n", "<leader>w", vim.cmd.Ex)

-- Line numbers
vim.opt.relativenumber = true
vim.opt.number = true
vim.g.netrw_bufsettings = "noma nomod nu rnu nobl nowrap ro"

-- Tabs and indentation
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.softtabstop = 2

-- Wrap long lines at word boundaries
vim.opt.linebreak = true

-- Keep cursor centered when scrolling
vim.keymap.set("n", "<C-u>", "<C-u>zz", { noremap = true, silent = true })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { noremap = true, silent = true })

-- Highlight cursor line
vim.opt.cursorline = true

-- Option + Delete clear a word
vim.keymap.set("i", "<M-BS>", "<C-w>", { noremap = true })
vim.keymap.set("i", "<M-b>", "<Esc>bi", { noremap = true })
vim.keymap.set("i", "<M-f>", "<Esc>ea", { noremap = true })

