-- [[ Setting options ]]
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
vim.o.tabstop = 4
vim.o.expandtab = true
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.colorcolumn = "80"

-- Limite superior
vim.o.scrolloff = 10

vim.o.updatetime = 50

-- HIGHLIGHT YANK
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- Mouse Options
vim.o.mousemoveevent = true

-- Python interpreter
vim.g.python_host_prog = "/Library/Frameworks/Python.framework/Versions/2.7/bin/python"
vim.g.python3_host_prog = "/opt/homebrew/bin/python3"
