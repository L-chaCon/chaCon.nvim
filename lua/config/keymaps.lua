-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Save and source file
-- vim.keymap.set("n", "<leader><leader>X", ":source %<CR>", { desc = "Save and Source" })
-- vim.keymap.set("n", "<leader><leader>x", ":.lua<CR>")
-- vim.keymap.set("v", "<leader><leader>x", ":lua<CR>")

-- Conceal level toggle
vim.keymap.set("n", "<leader>tc", function()
  ---@diagnostic disable-next-line: undefined-field
  if vim.opt.conceallevel:get() == 0 then
    vim.opt.conceallevel = 1
  else
    vim.opt.conceallevel = 0
  end
end, { desc = "[T]eam toggle [C]onceal levels" })

-- Moverse media pagina y centrar
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Half Page DOWN" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Half Page UP" })

-- Buscar y quedarse al medio
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- pegar en visual mode y no perder lo que esta ahi
vim.keymap.set("v", "<leader>p", '"_dP', { desc = "Pegar sin perder lo pegado" })

-- Copiar a clipboard
vim.keymap.set("v", "<leader>y", '"+y', { desc = "Yank clipboard" })
vim.keymap.set("n", "<leader>y", '"+y', { desc = "Yank clipboard" })
vim.keymap.set("n", "<leader>Y", 'gg"+yG', { desc = "Yank clipboard todo el buffer" })

-- Mover entremedio de funciones lineas
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { silent = true, desc = "Mover todo entre funcion UP" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { silent = true, desc = "Mover todo entre funcion DOWN" })

-- Remap for dealing with word wrap
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- TIP: Disable arrow keys in normal mode
vim.keymap.set("n", "<left>", '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set("n", "<right>", '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set("n", "<up>", '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set("n", "<down>", '<cmd>echo "Use j to move!!"<CR>')

-- Python
vim.keymap.set("n", "<leader>fp", function()
  vim.opt.foldmethod = "indent"
  ---@diagnostic disable-next-line: undefined-field
  if vim.opt.foldenable:get() then
    vim.opt.foldenable = false
  else
    vim.opt.foldenable = true
  end
end, { silent = true, desc = "[F]old for [P]ython" })

vim.keymap.del("n", "<leader>ub")
vim.keymap.set("n", "<leader>ub", function()
  if vim.o.background == "dark" then
    vim.o.background = "light"
    vim.cmd.colorscheme("dayfox")
  else
    vim.o.background = "dark"
    vim.cmd.colorscheme("carbonfox")
  end
end)
