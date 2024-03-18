return {
	-- {
	-- 	"Bekaboo/dropbar.nvim",
	-- },
	-- NOICE
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {
			-- add any options here
		},
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
		config = function()
			-- ERROR POR TRANSPARENCIA
			require("notify").setup({
				background_colour = "#000000",
			})

			require("noice").setup({
				lsp = {
					-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
					override = {
						["vim.lsp.util.convert_input_to_markdown_lines"] = true,
						["vim.lsp.util.stylize_markdown"] = true,
						["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
					},
				},
				-- you can enable a preset for easier configuration
				presets = {
					bottom_search = true, -- use a classic bottom cmdline for search
					command_palette = true, -- position the cmdline and popupmenu together
					long_message_to_split = true, -- long messages will be sent to a split
					inc_rename = false, -- enables an input dialog for inc-rename.nvim
					lsp_doc_border = false, -- add a border to hover docs and signature help
				},
			})
			-- AGREGAR :Telescope noice
			require("telescope").load_extension("noice")

			vim.keymap.set("n", "<leader>nd", ":NoiceDismiss<CR>", { desc = "[N]oice [D]ismiss Messages" })
			vim.keymap.set(
				"n",
				"<leader>nt",
				":NoiceTelescope<CR>",
				{ desc = "Show all [N]oice Messages in [T]elescope" }
			)
			vim.keymap.set("n", "<leader>nl", ":Noice last<CR>", { desc = "Show [N]oice [L]ast Message" })
			vim.keymap.set("n", "<leader>nh", ":NoiceHistory<CR>", { desc = "Show [N]oice [H]istory" })
			vim.keymap.set("n", "<leader>ni", ":NoiceDisable<CR>", { desc = "[N]oice D[i]sable" })
			vim.keymap.set("n", "<leader>ne", ":NoiceEnable<CR>", { desc = "[N]oice [E]nable" })
		end,
	},
	-- HELP PARA keymap
	{
		"folke/which-key.nvim",
		event = "VimEnter", -- Sets the loading event to 'VimEnter'
		config = function() -- This is the function that runs, AFTER loading
			require("which-key").setup()

			-- Document existing key chains
			require("which-key").register({
				["<leader>c"] = { name = "[C]ode", _ = "which_key_ignore" },
				["<leader>b"] = { name = "[B]reakepoint", _ = "which_key_ignore" },
				["<leader>d"] = { name = "[D]ebuggin", _ = "which_key_ignore" },
				["<leader>r"] = { name = "[R]ename", _ = "which_key_ignore" },
				["<leader>s"] = { name = "[S]earch", _ = "which_key_ignore" },
				["<leader>w"] = { name = "[W]orkspace", _ = "which_key_ignore" },
				["<leader>g"] = { name = "[G]it", _ = "which_key_ignore" },
				["<leader>ga"] = { name = "[G]it [A]dd", _ = "which_key_ignore" },
				["<leader>gr"] = { name = "[G]it [R]est", _ = "which_key_ignore" },
				["<leader>gs"] = { name = "[G]it [S]tash", _ = "which_key_ignore" },
				["<leader>gc"] = { name = "[G]it [C]opilot", _ = "which_key_ignore" },
				["<leader>n"] = { name = "[N]oise", _ = "which_key_ignore" },
				["<leader>x"] = { name = "Trouble", _ = "which_key_ignore" },
			})
		end,
	},
	-- TODO COMMENTS
	{
		"folke/todo-comments.nvim",
		event = "VimEnter",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = { signs = false },
	},
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
	-- COLORSCHEME
	{
		"bluz71/vim-moonfly-colors",
		name = "moonfly",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("moonfly")
			vim.g.moonflyTransparent = true
		end,
	},
	-- -- INDENT BLANKLINE
	-- { -- Add indentation guides even on blank lines
	-- 	"lukas-reineke/indent-blankline.nvim",
	-- 	-- Enable `lukas-reineke/indent-blankline.nvim`
	-- 	-- See `:help ibl`
	-- 	main = "ibl",
	-- 	opts = {},
	-- },
	-- Dashboard de Inicio
}
