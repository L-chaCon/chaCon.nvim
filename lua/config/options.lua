-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.g.lazyvim_picker = "telescope"

-- Disable using system clipboard by default
vim.opt.clipboard = ""

-- -- [[ Setting options ]]
-- Spelling
vim.opt.spelllang = "en_gb"

-- Fold
vim.opt.foldenable = false

-- See `:help vim.o`
vim.o.cursorline = false

-- Set highlight on search
vim.o.hlsearch = false

-- Make line numbers default
vim.wo.number = true
vim.wo.relativenumber = true

-- Enable mouse mode
vim.o.mouse = "a"

-- Enable break indent
vim.o.breakindent = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.wo.signcolumn = "yes"

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeoutlen = 300

-- Set completeopt to have a better completion experience
vim.o.completeopt = "menuone,noselect"

-- Set tabs spaces
vim.o.expandtab = true
vim.o.colorcolumn = "80" --If it is 80, is not line inclusive

-- Limite superior
vim.o.scrolloff = 10
vim.o.updatetime = 50

-- Mouse Options
vim.o.mousemoveevent = true

-- Python host
vim.g.python3_host_prog = vim.fn.expand("~") .. "/.pyenv/versions/nvim/bin/python"
