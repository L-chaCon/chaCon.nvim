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
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			"refractalize/oil-git-status.nvim",
		},
		config = function()
			require("oil").setup({
				win_options = {
					signcolumn = "yes:2",
				},
				columns = {
					{ "icon", add_padding = true },
					"permissions",
					"size",
				},
				view_options = {
					show_hidden = true,
					is_always_hidden = function(name, bufnr)
						return vim.startswith(name, ".venv")
					end,
				},
			})
			require("oil-git-status").setup({
				show_ignored = true, -- show files that match gitignore with !!
			})
			vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
			vim.keymap.set("n", "<leader>-", require("oil").toggle_float)
		end,
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		},
		config = function()
			require("neo-tree").setup({
				close_if_last_window = true, -- Close Neo-tree if it is the last window left in the tab
				popup_border_style = "rounded",
				filesystem = {
					filtered_items = {
						visible = true, -- when true, they will just be displayed differently than normal items
						hide_dotfiles = false,
						hide_gitignored = false,
						hide_hidden = false, -- only works on Windows for hidden files/directories
						always_show = { -- remains visible even if other settings would normally hide it
							".gitignored",
						},
						never_show = { -- remains hidden even if visible is toggled to true, this overrides always_show
							-- ".DS_Store",
							-- "thumbs.db",
							".pytest_cache",
						},
						never_show_by_pattern = { -- uses glob style patterns
							"*.pyc",
						},
					},
				},
				event_handlers = {
					{
						event = "file_opened",
						handler = function()
							require("neo-tree.command").execute({ action = "close" })
						end,
					},
				},
			})

			vim.keymap.set(
				"n",
				"<C-n>",
				":Neotree filesystem reveal left<CR>",
				{ desc = "Open Neo-Tree [File] explorer", silent = true }
			)
			vim.keymap.set("n", "<C-b>", ":Neotree buffers right<CR>", { desc = "Open Neo-Tree [Buffer] explorer" })
		end,
	},
}
