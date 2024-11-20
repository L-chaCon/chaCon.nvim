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

			vim.keymap.set("n", "-", ":Neotree filesystem reveal left<CR>", { desc = "Open Neo-Tree [File] explorer" })
			vim.keymap.set("n", "<C-b>", ":Neotree buffers right<CR>", { desc = "Open Neo-Tree [Buffer] explorer" })
		end,
	},
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local harpoon = require("harpoon")

			harpoon:setup({
				settings = {
					save_on_toggle = true,
				},
			})
			vim.keymap.set("n", "<leader>a", function()
				harpoon:list():add()
			end)
			vim.keymap.set("n", "<C-e>", function()
				harpoon.ui:toggle_quick_menu(harpoon:list())
			end)
			-- Toggle previous & next buffers stored within Harpoon list
			vim.keymap.set("n", "<C-p>", function()
				harpoon:list():prev()
			end)
			vim.keymap.set("n", "<C-n>", function()
				harpoon:list():next()
			end)
		end,
	},
	-- NOTE: Esto lo estoy sacando para separacion de uso, nvim es un editor de
	-- texto, no para editar files. Para eso mejor usar una herramnienta
	-- espesifica como yazi
	-- {
	-- 	"stevearc/oil.nvim",
	-- 	opts = {},
	-- 	dependencies = {
	-- 		"nvim-tree/nvim-web-devicons",
	-- 		"refractalize/oil-git-status.nvim",
	-- 	},
	-- 	config = function()
	-- 		require("oil").setup({
	-- 			default_file_explorer = false,
	-- 			delete_to_trash = true,
	-- 			constrain_cursor = "name",
	-- 			watch_for_changes = true,
	-- 			win_options = {
	-- 				signcolumn = "yes:2",
	-- 			},
	-- 			columns = {
	-- 				{ "icon", add_padding = true },
	-- 				"type",
	-- 				"permissions",
	-- 				"size",
	-- 				"mtime",
	-- 			},
	-- 			view_options = {
	-- 				show_hidden = true,
	-- 				is_always_hidden = function(name, bufnr)
	-- 					return vim.startswith(name, ".venv")
	-- 				end,
	-- 			},
	-- 			sort = {
	-- 				{ "type", "asc" },
	-- 				{ "name", "asc" },
	-- 			},
	-- 			keymaps = {
	-- 				["g?"] = "actions.show_help",
	-- 				["<CR>"] = "actions.select",
	-- 				["<C-|>"] = {
	-- 					"actions.select",
	-- 					opts = { vertical = true },
	-- 					desc = "Open the entry in a vertical split",
	-- 				},
	-- 				["<C-->"] = {
	-- 					"actions.select",
	-- 					opts = { horizontal = true },
	-- 					desc = "Open the entry in a horizontal split",
	-- 				},
	-- 				["<C-t>"] = { "actions.select", opts = { tab = true }, desc = "Open the entry in new tab" },
	-- 				["<C-p>"] = "actions.preview",
	-- 				["<C-c>"] = "actions.close",
	-- 				["<C-l>"] = "actions.refresh",
	-- 				["-"] = "actions.parent",
	-- 				["_"] = "actions.open_cwd",
	-- 				["`"] = "actions.cd",
	-- 				["~"] = {
	-- 					"actions.cd",
	-- 					opts = { scope = "tab" },
	-- 					desc = ":tcd to the current oil directory",
	-- 					mode = "n",
	-- 				},
	-- 				["gs"] = "actions.change_sort",
	-- 				["gx"] = "actions.open_external",
	-- 				["g."] = "actions.toggle_hidden",
	-- 				["g\\"] = "actions.toggle_trash",
	-- 			},
	-- 			use_default_keymaps = false,
	-- 		})
	-- 		require("oil-git-status").setup({
	-- 			show_ignored = true, -- show files that match gitignore with !!
	-- 		})
	-- 		vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
	-- 		vim.keymap.set("n", "<leader>-", require("oil").toggle_float)
	-- 	end,
	-- },
}
