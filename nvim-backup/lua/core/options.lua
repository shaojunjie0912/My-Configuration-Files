local opt = vim.opt

-- Row number
opt.relativenumber = true
opt.number = true

-- Tab
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true

-- Search
opt.ignorecase = true
opt.smartcase = true

-- Appearance
opt.termguicolors = true

-- Undo buffer
opt.undofile = true
opt.undodir = vim.fn.expand("~/.local/share/nvim/undo")

-- No wrap
opt.wrap = false

-- Open new file window
opt.splitright = true
opt.splitbelow = true

-- Configure the project separately
opt.exrc = true
