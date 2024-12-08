return {
	"stevearc/oil.nvim",
	enabled = true,
	opts = {},
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"refractalize/oil-git-status.nvim",
	},
	config = function()
		require("oil").setup({
			default_file_explorer = false,
			delete_to_trash = true,
			constrain_cursor = "name",
			watch_for_changes = true,
			win_options = {
				signcolumn = "yes:2",
			},
			columns = {
				{ "icon", add_padding = true },
				"type",
				"permissions",
				"size",
				"mtime",
			},
			view_options = {
				show_hidden = true,
				is_always_hidden = function(name, bufnr)
					return vim.startswith(name, ".venv")
				end,
			},
			sort = {
				{ "type", "asc" },
				{ "name", "asc" },
			},
			keymaps = {
				["g?"] = "actions.show_help",
				["<CR>"] = "actions.select",
				["<C-|>"] = {
					"actions.select",
					opts = { vertical = true },
					desc = "Open the entry in a vertical split",
				},
				["<C-->"] = {
					"actions.select",
					opts = { horizontal = true },
					desc = "Open the entry in a horizontal split",
				},
				["<C-t>"] = { "actions.select", opts = { tab = true }, desc = "Open the entry in new tab" },
				["<C-p>"] = "actions.preview",
				["<C-c>"] = "actions.close",
				["<C-l>"] = "actions.refresh",
				["-"] = "actions.parent",
				["_"] = "actions.open_cwd",
				["`"] = "actions.cd",
				["~"] = {
					"actions.cd",
					opts = { scope = "tab" },
					desc = ":tcd to the current oil directory",
					mode = "n",
				},
				["gs"] = "actions.change_sort",
				["gx"] = "actions.open_external",
				["g."] = "actions.toggle_hidden",
				["g\\"] = "actions.toggle_trash",
			},
			use_default_keymaps = false,
		})
		require("oil-git-status").setup({
			show_ignored = true, -- show files that match gitignore with !!
		})
		vim.keymap.set("n", "—", "<CMD>Oil<CR>", { desc = "Open parent directory" })
		vim.keymap.set("n", "<leader>-", require("oil").toggle_float)
	end,
}
