return {
	{
		"jiaoshijie/undotree",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		config = function()
			require("undotree").setup()
			-- Save undo history
			vim.o.undofile = true
			vim.o.undodir = os.getenv("HOME") .. "/.local/.undotree_files"

			vim.keymap.set(
				"n",
				"<leader>u",
				require("undotree").toggle,
				{ noremap = true, silent = true, desc = "Mostrar [U]ndo-tree" }
			)
		end,
	},
	{
		"stevearc/oil.nvim",
		opts = {},
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("oil").setup({
				columns = { "icon", "permissions" },
				view_options = {
					show_hidden = true,
					is_always_hidden = function(name, bufnr)
						return vim.startswith(name, ".venv")
					end,
				},
			})

			vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
			vim.keymap.set("n", "<leader>-", require("oil").toggle_float)
		end,
	},
}
