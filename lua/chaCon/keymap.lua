-- Save and source file
vim.keymap.set("n", "<leader><leader>X", ":source %<CR>", { desc = "Save and Source" })
vim.keymap.set("n", "<leader><leader>x", ":.lua<CR>")
vim.keymap.set("v", "<leader><leader>x", ":lua<CR>")

-- Spelling toggle
vim.keymap.set("n", "<leader><leader>z", function()
	---@diagnostic disable-next-line: undefined-field
	if vim.opt.spell:get() then
		vim.opt.spell = false
	else
		vim.opt.spell = true
	end
end, { desc = "Toggle Spelling" })

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

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- TIP: Disable arrow keys in normal mode
vim.keymap.set("n", "<left>", '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set("n", "<right>", '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set("n", "<up>", '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set("n", "<down>", '<cmd>echo "Use j to move!!"<CR>')

-- FIX: CHANGE THE <C-Space> THIS IS PART OF CMP TO SHOW AUTOCOMPLEATONS
-- vim.keymap.set(
-- 	"n",
-- 	"<C- >",
-- 	"<cmd>silent !tmux neww ~/.local/scripts/tmux-sessionizer<CR>",
-- 	{ desc = "Abrir Projecto Tmux" }
-- )
-- -- Preview Markdown
-- vim.keymap.set("n", "<leader>mv", ":MarkdownPreview<CR>", { desc = "Preview Archivos Marckdown" })
-- vim.keymap.set("n", "<leader>ms", ":MarkdownPreviewStop<CR>", { desc = "Stop Preview Marckdown" })

-- QuickFix
vim.keymap.set("n", "∆", "<cmd>:cnext<cr>")
vim.keymap.set("n", "˚", "<cmd>:cprev<cr>")
