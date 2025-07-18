-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
-- Base Settings
require("chaCon.set")
-- Base Keymaps
require("chaCon.keymap")
-- Base Globals
require("chaCon.globals") -- TODO: MIRAR BIEN ESTO QUE ES PARA HACER PLUGINS

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -- Telescope
    { import = "plugins.telescope.telescope" },
    -- Treesitter
    { import = "plugins.treesitter" },
    -- LSP
    { import = "plugins.lsp" },
    -- Linting
    { import = "plugins.lint" },
    -- Formatter
    { import = "plugins.formatter" },
    -- Tmux
    { import = "plugins.tmux" },
    -- Text Manipulation and note taking
    { import = "plugins.text-notes" },
    -- File Management
    { import = "plugins.file-management" },
    -- Git
    { import = "plugins.git" },
    -- Python
    { import = "plugins.python" },
    -- MINI
    { import = "plugins.mini" },
    -- Database
    { import = "plugins.database" },
    -- UI
    { import = "plugins.ui" },
    -- AI
    { import = "plugins.ai" },
    -- Miscellaneous
    { import = "plugins.misc" },
  },
})
