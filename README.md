# Introduccion

Esta es mi configuracion de nvim basada en la serie de videos en youtube de [typecraft - From 0 to IDE](https://www.youtube.com/watch?v=zHTeCSVAFNY&t) la cual recomiendo al 100%. Esta es la configuracion que uso y por su puesto cualquiera puede ocuparla.

La configuracion utiliza `lazy-nvim` y `lua`

# Features

- Plugin management via [Lazy.nvim](https://github.com/folke/lazy.nvim).
- Buscador de Archivos via [Telescope](https://github.com/nvim-telescope/telescope.nvim)
- Code, snippet, autocompletado via [nvim-cmp](https://github.com/hrsh7th/nvim-cmp), [LuaSnip](https://github.com/L3MON4D3/LuaSnip), [cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp).
- Soporte language server protocol (LSP) via [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig).
- Commentador via [Comment.nvim](https://github.com/numToStr/Comment.nvim).
- Statusline via [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim).
- Explorador de archivos via [neo-tree.lua](https://github.com/nvim-neo-tree/neo-tree.nvim).
- Highlighting de codigo via [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter).
- Colorscheme via [cappuccin](https://github.com/catppuccin/nvim).
- Formateador de codigo via [none-ls](https://github.com/nvimtools/none-ls.nvim).
- Undo management via [Undotree](https://github.com/jiaoshijie/undotree)
- DEBUGGER tipo VScode [nvim-dap](https://github.com/mfussenegger/nvim-dap), [nvim-dap-ui](https://github.com/rcarriga/nvim-dap-ui)

# Keymaps y Settings

Yo uso `' '` como `<leader>`. Los keymaps que no pertenecen a algun Pluggin estan en la carpeta `lua/chaCon/remap.lua`.

Para las opciones generales, como `vim.o.tabstop` estas se encuentran en `set.lua`.

| Keymap            | Modo          | Descripcion                                                              |
|-------------------|---------------|--------------------------------------------------------------------------|
| `<C-p>`           | Normal        | Buscar Archivo en porjecto.                                              |
| `<leader>gf`      | Normal        | Busqueda Grep en el projecto                                             |
