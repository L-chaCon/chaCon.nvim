return {
	-- COLORSCHEME
	{
		"EdenEast/nightfox.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("carbonfox")
		end,
	},
	{
		"Bekaboo/dropbar.nvim",
		dependencies = {
			"nvim-telescope/telescope-fzf-native.nvim",
		},
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("lualine").setup({
				inactive_sections = {
					lualine_a = { "buffers" },
					lualine_b = { "filename" },
					lualine_c = {},
					lualine_x = {},
					lualine_y = { "tabs" },
					lualine_z = {},
				},
				routes = {
					view = "mini",
					filter = {
						event = "msg_showmode",
						any = {
							{ find = "recording" },
						},
					},
				},
			})
		end,
	},
	-- HELP PARA keymap
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {},
		keys = {
			{
				"<leader>?",
				function()
					require("which-key").show({ global = false })
				end,
				desc = "Buffer Local Keymaps (which-key)",
			},
			{ "<leader>c", group = "[C]ode" },
			{ "<leader>m", group = "[M]arkdown" },
			{ "<leader>g", group = "[G]it" },
			{ "<leader>ga", group = "[G]it [A]dd" },
			{ "<leader>gh", group = "[G]it [H]unk" },
			{ "<leader>gt", group = "[G]it [T]oggle" },
			{ "<leader>l", group = "[L]sp" },
			{ "<leader>x", group = "Trouble" },
			{ "<leader>s", group = "Telescope" },
		},
	},
	-- TODO COMMENTS
	{
		"folke/todo-comments.nvim",
		event = "VimEnter",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = { signs = true },
		keys = {
			{ "<leader>st", "<cmd>TodoTelescope<cr>", desc = "[S]earch [T]odo" },
			{ "<leader>xt", "<cmd>Trouble todo<cr>", desc = "Trouble todo" },
		},
	},
	-- Dashboard de Inicio
	{
		"goolord/alpha-nvim",
		config = function()
			local alpha = require("alpha")
			local startify = require("alpha.themes.startify")
			startify.section.header.val = {
				[[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢲⣦⣤⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
				[[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠹⣿⣿⣿⠷⠂⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
				[[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠿⠁⢀⣴⣶⣶⡀⠀⠀⠀⠀⠀⠀⠀]],
				[[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠿⣿⣿⣿⣿⡄⠀⠀⠀⠀⠀⠀]],
				[[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠛⢿⣿⣿⡀⠀⠀⠀⠀⠀]],
				[[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣴⣶⣾⡿⠓⠶⣤⡀⠀⠀]],
				[[⠈⣷⣦⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣠⠄⠀⣴⣶⣶⣶⣤⣤⣼⣿⣿⣿⣿⣿⡌⠻⣦⢻⡀⠀]],
				[[⠀⠸⣿⣿⣿⣿⣶⣦⠀⠀⠀⠀⢤⣴⣾⣿⣿⣿⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣶⣾⣿⣄]],
				[[⠀⠀⢻⣿⣿⣿⣿⣿⠀⠀⠰⣄⠀⠀⠉⠛⠛⠿⠧⠀⠘⠛⠛⠋⠉⠈⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿]],
				[[⠀⠀⠈⢿⣿⣿⡿⠏⠀⠀⠀⣿⣿⣆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠋⠀]],
				[[⠀⠀⠀⠀⠉⠉⠀⠀⠀⢀⣼⣿⣿⣿⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⠋⠁⠀⠀⠀]],
				[[⠀⠀⠀⠀⠀⠀⠲⢶⣶⣿⣿⣿⣿⣿⣿⣧⣴⣶⣶⣦⣤⣄⣀⣀⣠⣾⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀]],
				[[⠀⠀⠀⠀⠀⠀⠀⠀⠈⠙⠛⠿⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀]],
				[[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀⠀⠀]],
				[[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀⠀⠀]],
				[[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣸⣿⣿⣿⣿⣿⣿⠋⡀⢹⣿⣿⣿⣿⣿⣿⣿⣿⣿⠋⠙⣿⠇⠀⠀⠀⠀]],
				[[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣿⣿⣿⣿⣿⣿⠃⣼⡇⣸⠏⠀⠀⢻⣿⣿⣿⣿⡏⣸⡆⡟⠀⠀⠀⠀⠀]],
				[[⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⣿⣿⣿⣿⣿⣿⣿⠀⢋⠔⠁⠀⠀⠀⢸⣿⣿⡿⣿⡇⠛⢠⠁⠀⠀⠀⠀⠀]],
				[[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⣿⣿⠏⢰⣿⣿⡿⠛⠁⠀⠀⠀⠀⠀⢸⣿⣿⡇⢸⣿⣶⡇⠀⠀⠀⠀⠀⠀]],
				[[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⡇⣼⣿⣿⠃⠀⠀⠀⠀⠀⠀⠀⠀⠻⣿⣷⢸⣿⣿⡇⠀⠀⠀⠀⠀⠀]],
				[[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣧⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀]],
				[[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠛⠻⠛⢿⣿⣧⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⢹⣿⣿⣄⠀⠀⠀⠀⠀]],
				[[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠛⠿⠿⠟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠉⠀⠀⠀⠀⠀]],
			}
			startify.section.header.opts.position = "center"
			alpha.setup(startify.opts)
		end,
	},
}
