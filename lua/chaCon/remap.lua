-- leader
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Movimientos basicos
--vim.keymap.set('n', '<leader>pa', ':Neotree toggle current reveal_force_cwd<cr>')
vim.keymap.set('n', '<leader>pa', ':Ex<CR>')

-- :Moverse entre los resultados del grep
vim.keymap.set('n', '<leader>j', ':cprev<CR>')
vim.keymap.set('n', '<leader>k', ':cnext<CR>')

-- Moverse media pagina y centrar
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')

-- Buscar y quedarse al medio
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

-- copiar en visual mode y no perder lo que copiaste
vim.keymap.set('v', '<leader>p', '"_dP')

-- Copiar a clipboard
vim.keymap.set('v', '<leader>y', '"+y', { desc = 'Yank clipboard' })
vim.keymap.set('n', '<leader>y', '"+y', { desc = 'Yank clipboard' })
vim.keymap.set('n', '<leader>Y', 'gg"+yG')

-- Mover entremedio de funciones lineas
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

vim.keymap.set('n', '<C- >', '<cmd>silent !tmux neww ~/.local/scripts/tmux-sessionizer<CR>')
