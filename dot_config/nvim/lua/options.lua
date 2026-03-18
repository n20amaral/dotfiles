vim.g.mapleader = " "
vim.g.maplocaleader = " "

local opt = vim.opt

opt.number = true
opt.relativenumber = true

opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true

opt.wrap = false

opt.backspace = "indent,eol,start"

opt.scrolloff = 8
opt.sidescrolloff = 8

opt.pumblend = 10
opt.completeopt = "menu,menuone,noselect"

opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

opt.whichwrap = "bs<>"
