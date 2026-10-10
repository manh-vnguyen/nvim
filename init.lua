
vim.g.mapleader = " "
-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

-- molten
-- vim.g.python3_host_prog =
--   vim.fn.expand("/home/manh/.venv/molten/bin/python")

require("config.lazy")
require("config.lsp")


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
-- vim.keymap.set("n", "<C-u>", "<C-u>zz", { noremap = true, silent = true })
-- vim.keymap.set("n", "<C-d>", "<C-d>zz", { noremap = true, silent = true })

-- Cursor movement mappings
vim.keymap.set({ "n", "x", "o" }, "<C-h>", "g^")
vim.keymap.set({ "n", "x", "o" }, "<C-l>", "g$")
vim.keymap.set({ "n", "x", "o" }, "<C-k>", "gk")
vim.keymap.set({ "n", "x", "o" }, "<C-j>", "gj")
vim.keymap.set( "i", "<C-k>", "<Esc>gka")
vim.keymap.set( "i", "<C-j>", "<Esc>gja")
vim.keymap.set({ "n", "x", "o" }, "<C-y>", "10<C-y>")
vim.keymap.set({ "n", "x", "o" }, "<C-e>", "10<C-e>")
vim.keymap.set({ "n" }, "<M-a>", "ggVG")
vim.keymap.set({ "n" }, "<M-c>", "\"+yy")
vim.keymap.set({ "x" }, "<M-c>", "\"+y")
vim.keymap.set({ "n", "v" }, "<leader>d", '"_d')
vim.keymap.set("n", "<leader>D", '"_D')
vim.keymap.set("i", "<D-/>", "<Esc>gcla")

-- Whichwrap helps arrow going to the next or previous lines
vim.opt.whichwrap:append("h,l")

-- Highlight cursor line
vim.opt.cursorline = true

-- Option + Delete clear a word
vim.keymap.set("i", "<M-BS>", "<C-w>", { noremap = true })
vim.keymap.set("i", "<M-b>", "<C-o>b", { noremap = true })
vim.keymap.set("i", "<M-f>", "<Esc>ea")


-- Vimtex
vim.g.vimtex_quickfix_open_on_warning = 0
