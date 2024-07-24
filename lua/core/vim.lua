--[[
  Module contains vim built-in settings.
]]--

-- Disable mouse --
vim.opt.mouse = ''

-- Enable relative line numbers --
vim.opt.number = true
vim.opt.relativenumber = true

-- Disable backup- and swapfiles --
vim.opt.backup = false
vim.opt.swapfile = false

-- Number of lines around cursor --
vim.opt.scrolloff = 8

-- File format and encoding --
vim.opt.fileformat = 'unix'
vim.opt.encoding = 'utf-8'
 
-- Auto indents --
vim.opt.autoindent = true
vim.opt.smartindent = true

-- Tab using spaces --
vim.opt.expandtab = true

-- Size of expanded tabs (real tabs are default) --
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2

-- Wrap lines breaking by words --
vim.opt.wrap = true
vim.opt.linebreak = true

-- Use 24-bit colors --
vim.opt.termguicolors = true
